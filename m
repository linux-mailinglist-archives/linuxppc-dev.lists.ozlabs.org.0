Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6C62194C8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 02:00:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B2GX24zXbzDqgs
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 10:00:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.61;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=longman@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=XvDMFGN9; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=XvDMFGN9; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B2GVK1pZKzDqX3
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jul 2020 09:58:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594252725;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bnQ0NpLgUMhM2rS/Fc950+H8OU2zboSJSf+KmCP3N40=;
 b=XvDMFGN9fhBJj9NmbHmXIqnwmtVP4K03a8/xmfbov2UhVBy1BAzxpXA6C6w+5PWuIN2Ch2
 MFV1UZQcTvlTGiDZxQq6Dgd5UFEiVptOX/UKPHiNZFvZzzcwXeFC3oc/MBOPU2JGJc+WHA
 yNVlnDmCzguYibwzTkRk6IcFImleYcw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594252725;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bnQ0NpLgUMhM2rS/Fc950+H8OU2zboSJSf+KmCP3N40=;
 b=XvDMFGN9fhBJj9NmbHmXIqnwmtVP4K03a8/xmfbov2UhVBy1BAzxpXA6C6w+5PWuIN2Ch2
 MFV1UZQcTvlTGiDZxQq6Dgd5UFEiVptOX/UKPHiNZFvZzzcwXeFC3oc/MBOPU2JGJc+WHA
 yNVlnDmCzguYibwzTkRk6IcFImleYcw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-OX3HluVBObG5NMo_XcEqww-1; Wed, 08 Jul 2020 19:58:43 -0400
X-MC-Unique: OX3HluVBObG5NMo_XcEqww-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D26521005504;
 Wed,  8 Jul 2020 23:58:41 +0000 (UTC)
Received: from llong.remote.csb (ovpn-116-205.rdu2.redhat.com [10.10.116.205])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A75C61001925;
 Wed,  8 Jul 2020 23:58:40 +0000 (UTC)
Subject: Re: [PATCH v3 0/6] powerpc: queued spinlocks and rwlocks
From: Waiman Long <longman@redhat.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200706043540.1563616-1-npiggin@gmail.com>
 <24f75d2c-60cd-2766-4aab-1a3b1c80646e@redhat.com>
 <1594101082.hfq9x5yact.astroid@bobo.none>
 <de3ead58-7f81-8ebd-754d-244f6be24af4@redhat.com>
 <1594184204.ncuq7vstsz.astroid@bobo.none>
 <62fa6343-e084-75c3-01c9-349a4617e67c@redhat.com>
Organization: Red Hat
Message-ID: <808a262d-8863-5986-082d-1088b66714df@redhat.com>
Date: Wed, 8 Jul 2020 19:58:40 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <62fa6343-e084-75c3-01c9-349a4617e67c@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: linux-arch@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Boqun Feng <boqun.feng@gmail.com>, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 7/8/20 7:50 PM, Waiman Long wrote:
> On 7/8/20 1:10 AM, Nicholas Piggin wrote:
>> Excerpts from Waiman Long's message of July 8, 2020 1:33 pm:
>>> On 7/7/20 1:57 AM, Nicholas Piggin wrote:
>>>> Yes, powerpc could certainly get more performance out of the slow
>>>> paths, and then there are a few parameters to tune.
>>>>
>>>> We don't have a good alternate patching for function calls yet, but
>>>> that would be something to do for native vs pv.
>>>>
>>>> And then there seem to be one or two tunable parameters we could
>>>> experiment with.
>>>>
>>>> The paravirt locks may need a bit more tuning. Some simple testing
>>>> under KVM shows we might be a bit slower in some cases. Whether this
>>>> is fairness or something else I'm not sure. The current simple pv
>>>> spinlock code can do a directed yield to the lock holder CPU, whereas
>>>> the pv qspl here just does a general yield. I think we might actually
>>>> be able to change that to also support directed yield. Though I'm
>>>> not sure if this is actually the cause of the slowdown yet.
>>> Regarding the paravirt lock, I have taken a further look into the
>>> current PPC spinlock code. There is an equivalent of pv_wait() but no
>>> pv_kick(). Maybe PPC doesn't really need that.
>> So powerpc has two types of wait, either undirected "all processors" or
>> directed to a specific processor which has been preempted by the
>> hypervisor.
>>
>> The simple spinlock code does a directed wait, because it knows the CPU
>> which is holding the lock. In this case, there is a sequence that is
>> used to ensure we don't wait if the condition has become true, and the
>> target CPU does not need to kick the waiter it will happen automatically
>> (see splpar_spin_yield). This is preferable because we only wait as
>> needed and don't require the kick operation.
> Thanks for the explanation.
>>
>> The pv spinlock code I did uses the undirected wait, because we don't
>> know the CPU number which we are waiting on. This is undesirable because
>> it's higher overhead and the wait is not so accurate.
>>
>> I think perhaps we could change things so we wait on the correct CPU
>> when queued, which might be good enough (we could also put the lock
>> owner CPU in the spinlock word, if we add another format).
>
> The LS byte of the lock word is used to indicate locking status. If we 
> have less than 255 cpus, we can put the (cpu_nr + 1) into the lock 
> byte. The special 0xff value can be used to indicate a cpu number >= 
> 255 for indirect yield. The required change to the qspinlock code will 
> be minimal, I think. 

BTW, we can also keep track of the previous cpu in the waiting queue. 
Due to lock stealing, that may not be the cpu that is holding the lock. 
Maybe we can use this, if available, in case the cpu number is >= 255.

Regards,
Longman

