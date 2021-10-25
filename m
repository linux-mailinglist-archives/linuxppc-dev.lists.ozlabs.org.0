Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FDB439E7F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Oct 2021 20:26:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HdNh45Kc5z2yg5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Oct 2021 05:26:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GYU6diwv;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PpXYhFio;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=longman@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=GYU6diwv; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=PpXYhFio; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HdNgK0llqz2xXN
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Oct 2021 05:25:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635186343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WmLX7TLtZ9IDJ1JQ+2m7C+nUTKDcem4HGFPTzsvzRlk=;
 b=GYU6diwvCR+Vxojf7pIQFcdjSnOPP0dxxrfRokloHQQ49xdmHv2oUWjUCRgDwl/TCBlCKI
 1ZGMVL2pceh1rFUGA8Yo2Usbd+NCMJXm30/sN6E2/VoD5otJHAe84jWsJsyBbAI4ZDgi4x
 NbUX9F4goP26o4iNIIotoPtjymlBIko=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635186344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WmLX7TLtZ9IDJ1JQ+2m7C+nUTKDcem4HGFPTzsvzRlk=;
 b=PpXYhFiocnK7sWR4z3rkZ59C/C76Leg2r5x8NJoOw6ienD4TeJuWEgvjvnN9TzUZ9ILWMJ
 xYycHfeUxaoE2vqjyU3UQnVyWCuh7oeX9z0ThtoLJD/5e9nyYkLYeHa5cwqWvPiAoGrZGw
 92SqrcZ+LT75DhnEKbiP/qai2fdFBM0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-80-pXULrgXMNu2BFbQqJnWKPA-1; Mon, 25 Oct 2021 14:25:40 -0400
X-MC-Unique: pXULrgXMNu2BFbQqJnWKPA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3722410B3959;
 Mon, 25 Oct 2021 18:25:37 +0000 (UTC)
Received: from llong.remote.csb (unknown [10.22.18.111])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 28C21100763D;
 Mon, 25 Oct 2021 18:25:33 +0000 (UTC)
Subject: Re: [PATCH] locking: remove spin_lock_flags() etc
To: Arnd Bergmann <arnd@kernel.org>
References: <20211022120058.1031690-1-arnd@kernel.org>
 <cc8e3c58-457d-fdf3-6a62-98bde0cefdea@redhat.com>
 <CAK8P3a0YjaRS+aUCOKGjsfkR3TM49PrG6U4ftG_Fz+OFuyCb0w@mail.gmail.com>
 <YXZ/iLB7BvZtzDMp@hirez.programming.kicks-ass.net>
 <CAK8P3a2Luz7sd5cM1OdZhYCs_UPzo+2qVQYSZPfR2QN+0DkyRg@mail.gmail.com>
 <2413f412-a390-bbc0-e848-e2a77d1f0ab3@redhat.com>
 <CAK8P3a3JEBF-dEg0iVThMMRNK3CDxY+mRtTeStMusycnethO_g@mail.gmail.com>
From: Waiman Long <longman@redhat.com>
Message-ID: <d7af2422-3264-b9bb-b515-da4351743448@redhat.com>
Date: Mon, 25 Oct 2021 14:25:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a3JEBF-dEg0iVThMMRNK3CDxY+mRtTeStMusycnethO_g@mail.gmail.com>
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
Cc: linux-ia64@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
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

On 10/25/21 11:44 AM, Arnd Bergmann wrote:
> On Mon, Oct 25, 2021 at 5:28 PM Waiman Long <longman@redhat.com> wrote:
>> On 10/25/21 9:06 AM, Arnd Bergmann wrote:
>>> On s390, we pick between the cmpxchg() based directed-yield when
>>> running on virtualized CPUs, and a normal qspinlock when running on a
>>> dedicated CPU.
>> I am not aware that s390 is using qspinlocks at all as I don't see
>> ARCH_USE_QUEUED_SPINLOCKS being set anywhere under arch/s390. I only see
>> that it uses a cmpxchg based spinlock.
> Sorry, I should not have said "normal" here. See arch/s390/lib/spinlock.c
> for their custom queued spinlocks as implemented in arch_spin_lock_queued().
> I don't know if that code actually does the same thing as the generic qspinlock,
> but it seems at least similar.

Yes, you are right. Their queued lock code looks like a custom version 
of the pvqspinlock code.

Cheers,
Longman

