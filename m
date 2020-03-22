Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A745C18EA80
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Mar 2020 17:36:15 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48ljnS3SbzzDqYd
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 03:36:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=stgolabs.net (client-ip=195.135.220.15; helo=mx2.suse.de;
 envelope-from=dave@stgolabs.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stgolabs.net
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48ljlW6r2HzDqMp
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 03:34:30 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 93574AC24;
 Sun, 22 Mar 2020 16:34:24 +0000 (UTC)
Date: Sun, 22 Mar 2020 09:33:17 -0700
From: Davidlohr Bueso <dave@stgolabs.net>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH 18/15] kvm: Replace vcpu->swait with rcuwait
Message-ID: <20200322163317.mh4sygr7xcjptmjp@linux-p48b>
References: <20200318204302.693307984@linutronix.de>
 <20200320085527.23861-1-dave@stgolabs.net>
 <20200320085527.23861-3-dave@stgolabs.net>
 <20200320125455.GE20696@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20200320125455.GE20696@hirez.programming.kicks-ass.net>
User-Agent: NeoMutt/20180716
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: rdunlap@infradead.org, linux-pci@vger.kernel.org, bigeasy@linutronix.de,
 linux-kernel@vger.kernel.org, joel@joelfernandes.org, will@kernel.org,
 mingo@kernel.org, arnd@arndb.de, Davidlohr Bueso <dbueso@suse.de>,
 torvalds@linux-foundation.org, paulmck@kernel.org,
 linuxppc-dev@lists.ozlabs.org, rostedt@goodmis.org, bhelgaas@google.com,
 kurt.schwemmer@microsemi.com, kvalo@codeaurora.org, balbi@kernel.org,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, oleg@redhat.com, tglx@linutronix.de,
 netdev@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 logang@deltatee.com, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 20 Mar 2020, Peter Zijlstra wrote:

>On Fri, Mar 20, 2020 at 01:55:26AM -0700, Davidlohr Bueso wrote:
>> -	swait_event_interruptible_exclusive(*wq, ((!vcpu->arch.power_off) &&
>> -				       (!vcpu->arch.pause)));
>> +	rcuwait_wait_event(*wait,
>> +			   (!vcpu->arch.power_off) && (!vcpu->arch.pause),
>> +			   TASK_INTERRUPTIBLE);
>
>> -	for (;;) {
>> -		prepare_to_swait_exclusive(&vcpu->wq, &wait, TASK_INTERRUPTIBLE);
>> -
>> -		if (kvm_vcpu_check_block(vcpu) < 0)
>> -			break;
>> -
>> -		waited = true;
>> -		schedule();
>> -	}
>> -
>> -	finish_swait(&vcpu->wq, &wait);
>> +	rcuwait_wait_event(&vcpu->wait,
>> +			   (block_check = kvm_vcpu_check_block(vcpu)) < 0,
>> +			   TASK_INTERRUPTIBLE);
>
>Are these yet more instances that really want to be TASK_IDLE ?

Hmm probably as it makes sense for a blocked vcpu not to be contributing to
the loadavg. So if this is the only reason to use interruptible, then yes we
ought to change it.

However, I'll make this a separate patch, given this (ab)use isn't as obvious
as the PS3 case, which is a kthread and therefore signals are masked.

Thanks,
Davidlohr
