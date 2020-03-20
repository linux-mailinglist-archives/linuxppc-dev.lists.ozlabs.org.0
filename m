Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0E818CF03
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 14:35:39 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48kPt00P7QzDsRQ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Mar 2020 00:35:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1231::1; helo=merlin.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=merlin.20170209 header.b=S+msKOf2; 
 dkim-atps=neutral
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48kNzq5yFSzDrNc
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 23:55:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=9sJuQlZdjTLh4p9vc8U/OzHYsApB7N+ztV93SXfUXTY=; b=S+msKOf2a1fh8blY+Rww+BWM12
 nVEZN4NzwFV6andPM4+8lKK11q/OicWX2iQkylcgiiXoJXlNoBsNsuH3Hsp2RR8RDPZL2TdcCODPS
 uXqwQjWFKzeQTHtaizkhr7Eo97mIjvh21zbrPXi93EqkofUUhGO+C6IK+RNwVwfqauDddv3GldqOZ
 jfFfEHZEnFgz//yhDOiVCZfQldh+E+9GX+YRXaUAVYRX5jQUgr/PHWQVGE7cyWwVF36aIaotjD5Zk
 0y7RVQesMd3sxQR2DC76m8acC4k0uK2OUV9rbi/RfYT8M2tZQ3jZP6DJGye+lpHGnC+0OB1EyRrvO
 hrIvLsLg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jFHAv-0000xV-Ux; Fri, 20 Mar 2020 12:54:58 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 40E9C305C92;
 Fri, 20 Mar 2020 13:54:55 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 0E42E2858D5B2; Fri, 20 Mar 2020 13:54:55 +0100 (CET)
Date: Fri, 20 Mar 2020 13:54:55 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Davidlohr Bueso <dave@stgolabs.net>
Subject: Re: [PATCH 18/15] kvm: Replace vcpu->swait with rcuwait
Message-ID: <20200320125455.GE20696@hirez.programming.kicks-ass.net>
References: <20200318204302.693307984@linutronix.de>
 <20200320085527.23861-1-dave@stgolabs.net>
 <20200320085527.23861-3-dave@stgolabs.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200320085527.23861-3-dave@stgolabs.net>
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

On Fri, Mar 20, 2020 at 01:55:26AM -0700, Davidlohr Bueso wrote:
> -	swait_event_interruptible_exclusive(*wq, ((!vcpu->arch.power_off) &&
> -				       (!vcpu->arch.pause)));
> +	rcuwait_wait_event(*wait,
> +			   (!vcpu->arch.power_off) && (!vcpu->arch.pause),
> +			   TASK_INTERRUPTIBLE);

> -	for (;;) {
> -		prepare_to_swait_exclusive(&vcpu->wq, &wait, TASK_INTERRUPTIBLE);
> -
> -		if (kvm_vcpu_check_block(vcpu) < 0)
> -			break;
> -
> -		waited = true;
> -		schedule();
> -	}
> -
> -	finish_swait(&vcpu->wq, &wait);
> +	rcuwait_wait_event(&vcpu->wait,
> +			   (block_check = kvm_vcpu_check_block(vcpu)) < 0,
> +			   TASK_INTERRUPTIBLE);

Are these yet more instances that really want to be TASK_IDLE ?

