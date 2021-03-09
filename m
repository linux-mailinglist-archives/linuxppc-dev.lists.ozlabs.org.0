Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D32332AEC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 16:46:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dw01v08Vrz3cWh
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 02:46:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=stgolabs.net (client-ip=195.135.220.15; helo=mx2.suse.de;
 envelope-from=dave@stgolabs.net; receiver=<UNKNOWN>)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dw01Y5QkCz2xy9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Mar 2021 02:46:23 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C2D41AE84;
 Tue,  9 Mar 2021 15:46:19 +0000 (UTC)
Date: Tue, 9 Mar 2021 07:46:11 -0800
From: Davidlohr Bueso <dave@stgolabs.net>
To: Michal =?utf-8?B?U3VjaMOvwr/CvW5law==?= <msuchanek@suse.de>
Subject: Re: [PATCH 3/3] powerpc/qspinlock: Use generic smp_cond_load_relaxed
Message-ID: <20210309154611.kbxzx65auzvmfqnt@offworld>
References: <20210309015950.27688-1-dave@stgolabs.net>
 <20210309015950.27688-4-dave@stgolabs.net>
 <20210309093912.GW6564@kitsune.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210309093912.GW6564@kitsune.suse.cz>
User-Agent: NeoMutt/20201120
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
Cc: Davidlohr Bueso <dbueso@suse.de>, peterz@infradead.org, will@kernel.org,
 linux-kernel@vger.kernel.org, npiggin@gmail.com, mingo@redhat.com,
 paulus@samba.org, longman@redhat.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 09 Mar 2021, Michal Such=EF=BF=BDnek wrote:

>On Mon, Mar 08, 2021 at 05:59:50PM -0800, Davidlohr Bueso wrote:
>> 49a7d46a06c3 (powerpc: Implement smp_cond_load_relaxed()) added
>> busy-waiting pausing with a preferred SMT priority pattern, lowering
>> the priority (reducing decode cycles) during the whole loop slowpath.
>>
>> However, data shows that while this pattern works well with simple
>                                              ^^^^^^^^^^^^^^^^^^^^^^
>> spinlocks, queued spinlocks benefit more being kept in medium priority,
>> with a cpu_relax() instead, being a low+medium combo on powerpc.
>...
>>
>> diff --git a/arch/powerpc/include/asm/barrier.h b/arch/powerpc/include/a=
sm/barrier.h
>> index aecfde829d5d..7ae29cfb06c0 100644
>> --- a/arch/powerpc/include/asm/barrier.h
>> +++ b/arch/powerpc/include/asm/barrier.h
>> @@ -80,22 +80,6 @@ do {									\
>>	___p1;								\
>>  })
>>
>> -#ifdef CONFIG_PPC64
>Maybe it should be kept for the simple spinlock case then?

It is kept, note that simple spinlocks don't use smp_cond_load_relaxed,
but instead deal with the priorities in arch_spin_lock(), so it will
spin in low priority until it sees a chance to take the lock, where
it switches back to medium.

Thanks,
Davidlohr
