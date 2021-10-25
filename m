Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A08439A85
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Oct 2021 17:29:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HdJm54XNfz2yMs
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Oct 2021 02:29:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bgjgAWXW;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eBBToxCj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=longman@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=bgjgAWXW; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=eBBToxCj; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HdJlM5lXWz2xrC
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Oct 2021 02:29:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635175732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l1cYYIVh+xGjWZ5+lH9xxF7m8Jg6vgobu0WCRcUUQ6o=;
 b=bgjgAWXWAJuGLPUPKTK8OxniRXrqyqXyFt/qQSlEDn9znFsobpr/rtjKIdrMrjbPT1+6wJ
 cQInWxaO46CxxbELANk729yQNOxnAqaKOVcYlHD+OFSVpsAm6UD1zEqFGzBJbIXrQ+kj3m
 p2gaM3WI+RMKPL3VBlCy+kMmhvPqgoE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635175733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l1cYYIVh+xGjWZ5+lH9xxF7m8Jg6vgobu0WCRcUUQ6o=;
 b=eBBToxCj1lpYT9olwO3jpjURBRmKF7orW5CPuFJTm0TLtg6ftNaQehkjsH69iUzD+zTkyu
 DvJw4lR8gruPM8UqAvBkTXDFXOg2DbIflR3yybKQ94gugUgaGzKlR2R0RFdkRsh21Vn+Fy
 406N/3G4sC0duMqZbA2eix+3DPZZ/2s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-x4xQsDwWOV62UjcxFemc8Q-1; Mon, 25 Oct 2021 11:28:47 -0400
X-MC-Unique: x4xQsDwWOV62UjcxFemc8Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EDC93362FD;
 Mon, 25 Oct 2021 15:28:43 +0000 (UTC)
Received: from llong.remote.csb (unknown [10.22.18.111])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E34335D6D5;
 Mon, 25 Oct 2021 15:28:37 +0000 (UTC)
Subject: Re: [PATCH] locking: remove spin_lock_flags() etc
To: Arnd Bergmann <arnd@kernel.org>, Peter Zijlstra <peterz@infradead.org>
References: <20211022120058.1031690-1-arnd@kernel.org>
 <cc8e3c58-457d-fdf3-6a62-98bde0cefdea@redhat.com>
 <CAK8P3a0YjaRS+aUCOKGjsfkR3TM49PrG6U4ftG_Fz+OFuyCb0w@mail.gmail.com>
 <YXZ/iLB7BvZtzDMp@hirez.programming.kicks-ass.net>
 <CAK8P3a2Luz7sd5cM1OdZhYCs_UPzo+2qVQYSZPfR2QN+0DkyRg@mail.gmail.com>
From: Waiman Long <longman@redhat.com>
Message-ID: <2413f412-a390-bbc0-e848-e2a77d1f0ab3@redhat.com>
Date: Mon, 25 Oct 2021 11:28:37 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a2Luz7sd5cM1OdZhYCs_UPzo+2qVQYSZPfR2QN+0DkyRg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: linux-ia64@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Paul Mackerras <paulus@samba.org>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Will Deacon <will@kernel.org>, Jonas Bonn <jonas@southpole.se>,
 linux-s390 <linux-s390@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Helge Deller <deller@gmx.de>, Christian Borntraeger <borntraeger@de.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Boqun Feng <boqun.feng@gmail.com>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Openrisc <openrisc@lists.librecores.org>, Stafford Horne <shorne@gmail.com>,
 Parisc List <linux-parisc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 10/25/21 9:06 AM, Arnd Bergmann wrote:
> On Mon, Oct 25, 2021 at 11:57 AM Peter Zijlstra <peterz@infradead.org> wrote:
>> On Sat, Oct 23, 2021 at 06:04:57PM +0200, Arnd Bergmann wrote:
>>> On Sat, Oct 23, 2021 at 3:37 AM Waiman Long <longman@redhat.com> wrote:
>>>>> On 10/22/21 7:59 AM, Arnd Bergmann wrote:
>>>>> From: Arnd Bergmann <arnd@arndb.de>
>>>>>
>>>>> As this is all dead code, just remove it and the helper functions built
>>>>> around it. For arch/ia64, the inline asm could be cleaned up, but
>>>>> it seems safer to leave it untouched.
>>>>>
>>>>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>>>> Does that mean we can also remove the GENERIC_LOCKBREAK config option
>>>> from the Kconfig files as well?
>>>   I couldn't figure this out.
>>>
>>> What I see is that the only architectures setting GENERIC_LOCKBREAK are
>>> nds32, parisc, powerpc, s390, sh and sparc64, while the only architectures
>>> implementing arch_spin_is_contended() are arm32, csky and ia64.
>>>
>>> The part I don't understand is whether the option actually does anything
>>> useful any more after commit d89c70356acf ("locking/core: Remove break_lock
>>> field when CONFIG_GENERIC_LOCKBREAK=y").
>> Urgh, what a mess.. AFAICT there's still code in
>> kernel/locking/spinlock.c that relies on it. Specifically when
>> GENERIC_LOCKBREAK=y we seem to create _lock*() variants that are
>> basically TaS locks which drop preempt/irq disable while spinning.
>>
>> Anybody having this on and not having native TaS locks is in for a rude
>> surprise I suppose... sparc64 being the obvious candidate there :/
> Is this a problem on s390 and powerpc, those two being the ones
> that matter in practice?
>
> On s390, we pick between the cmpxchg() based directed-yield when
> running on virtualized CPUs, and a normal qspinlock when running on a
> dedicated CPU.

I am not aware that s390 is using qspinlocks at all as I don't see 
ARCH_USE_QUEUED_SPINLOCKS being set anywhere under arch/s390. I only see 
that it uses a cmpxchg based spinlock.

Cheers,
Longman



