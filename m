Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 59786954CB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 05:06:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CG0h0QhWzDqfS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 13:06:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Pxhgx1qh"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46CFy5134bzDqd9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 13:04:28 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id y1so1950397plp.9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Aug 2019 20:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=5DCEuK+1vbR1GiKVHEUvjv6cUUnrYia947cf4DJEdNk=;
 b=Pxhgx1qhn8Pkav9ExU92pqR+Optprmxz+MRtGw2MwXRWVUALsKTVrGOJgRsPTa2P7H
 oUfU79y0eddjMs//c8VMgwEThxHVRiDEuL4xIWu2OnPGNmbh5Zjz2k4O1f2h1yXzlLWl
 COBaTHEHGfy2rpghEGkYcgLz2YP5n4CLCiDDlNufwHr5whWe/5368RURAaXOHKPQJk7u
 xE3PD2b1wJXEaSQXXhZm8T6Y9DkTTfp8oXaU+TJALhmfUBGhLC9yCBcMfGilp67BGwAB
 fz+zVr27fSkHdHtzBQ8zPGVXDSr7DuiHbLZAG66nQy5P7rJfMfcmgADrBhQqlTCe3J36
 3ztQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=5DCEuK+1vbR1GiKVHEUvjv6cUUnrYia947cf4DJEdNk=;
 b=gXnMfVDmkXIU1k3otIlDX5qYTyF6x1/YdVvjxKcvhbBb2xhXYuthh5WHfhlfToODYG
 y6usFVHwRHYkNe/5wfxA19QYRDccGV5cRwAnLEo9qtOSGRLOKn+fKCL6WHwd2lMkZrB3
 LIpF0Imgf+eYyLxN5F7OTxGAYQCptgm6ync0lsKpXD/Xc2WKqiW3cRybjZDdz6E8vSYv
 MfdMts7TDmS+uP8sQXhPdFqTfTaYJM3MiRKXhE4lB5YUZ6hfvAG5yrFa+vq601QZ8GMI
 CAfsUDWqtMc6S21pg7uRIoUikBy9lTBFnowZxY4LRKI3rsvftNgjRwd46th3cP5+txlt
 Aing==
X-Gm-Message-State: APjAAAWe5q52tdfXULQ7OVg0EIYU6+MrQaPzlik4Ne9NehIROa+GfDJo
 /0YrsaezYo/rhjuz6jPG1qM=
X-Google-Smtp-Source: APXvYqzcrRI1jj4TBVQ/g5QjFSA1AoznIRz/+8wJyP2IW+lRKb60+MpmtXcs0fV6EGMkyF9EP5Zl2A==
X-Received: by 2002:a17:902:4d45:: with SMTP id
 o5mr22408906plh.146.1566270266734; 
 Mon, 19 Aug 2019 20:04:26 -0700 (PDT)
Received: from localhost ([193.114.104.176])
 by smtp.gmail.com with ESMTPSA id s16sm18532451pfs.6.2019.08.19.20.04.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 20:04:26 -0700 (PDT)
Date: Tue, 20 Aug 2019 13:04:19 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v10 2/7] powerpc/mce: Fix MCE handling for huge pages
To: Linux Kernel <linux-kernel@vger.kernel.org>, linuxppc-dev
 <linuxppc-dev@lists.ozlabs.org>, Santosh Sivaraj <santosh@fossix.org>
References: <20190815003941.18655-1-santosh@fossix.org>
 <20190815003941.18655-3-santosh@fossix.org>
 <1566223931.kpuwkor3n7.astroid@bobo.none>
 <87ef1gppyr.fsf@santosiv.in.ibm.com>
In-Reply-To: <87ef1gppyr.fsf@santosiv.in.ibm.com>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1566269915.1518r8e03n.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>, stable@vger.kernel.org,
 Chandan Rajendra <chandan@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Reza Arbab <arbab@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Santosh Sivaraj's on August 20, 2019 11:47 am:
> Hi Nick,
>=20
> Nicholas Piggin <npiggin@gmail.com> writes:
>=20
>> Santosh Sivaraj's on August 15, 2019 10:39 am:
>>> From: Balbir Singh <bsingharora@gmail.com>
>>>=20
>>> The current code would fail on huge pages addresses, since the shift wo=
uld
>>> be incorrect. Use the correct page shift value returned by
>>> __find_linux_pte() to get the correct physical address. The code is mor=
e
>>> generic and can handle both regular and compound pages.
>>>=20
>>> Fixes: ba41e1e1ccb9 ("powerpc/mce: Hookup derror (load/store) UE errors=
")
>>> Signed-off-by: Balbir Singh <bsingharora@gmail.com>
>>> [arbab@linux.ibm.com: Fixup pseries_do_memory_failure()]
>>> Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
>>> Co-developed-by: Santosh Sivaraj <santosh@fossix.org>
>>> Signed-off-by: Santosh Sivaraj <santosh@fossix.org>
>>> Tested-by: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>
>>> Cc: stable@vger.kernel.org # v4.15+
>>> ---
>>>  arch/powerpc/include/asm/mce.h       |  2 +-
>>>  arch/powerpc/kernel/mce_power.c      | 55 ++++++++++++++--------------
>>>  arch/powerpc/platforms/pseries/ras.c |  9 ++---
>>>  3 files changed, 32 insertions(+), 34 deletions(-)
>>>=20
>>> diff --git a/arch/powerpc/include/asm/mce.h b/arch/powerpc/include/asm/=
mce.h
>>> index a4c6a74ad2fb..f3a6036b6bc0 100644
>>> --- a/arch/powerpc/include/asm/mce.h
>>> +++ b/arch/powerpc/include/asm/mce.h
>>> @@ -209,7 +209,7 @@ extern void release_mce_event(void);
>>>  extern void machine_check_queue_event(void);
>>>  extern void machine_check_print_event_info(struct machine_check_event =
*evt,
>>>  					   bool user_mode, bool in_guest);
>>> -unsigned long addr_to_pfn(struct pt_regs *regs, unsigned long addr);
>>> +unsigned long addr_to_phys(struct pt_regs *regs, unsigned long addr);
>>>  #ifdef CONFIG_PPC_BOOK3S_64
>>>  void flush_and_reload_slb(void);
>>>  #endif /* CONFIG_PPC_BOOK3S_64 */
>>> diff --git a/arch/powerpc/kernel/mce_power.c b/arch/powerpc/kernel/mce_=
power.c
>>> index a814d2dfb5b0..e74816f045f8 100644
>>> --- a/arch/powerpc/kernel/mce_power.c
>>> +++ b/arch/powerpc/kernel/mce_power.c
>>> @@ -20,13 +20,14 @@
>>>  #include <asm/exception-64s.h>
>>> =20
>>>  /*
>>> - * Convert an address related to an mm to a PFN. NOTE: we are in real
>>> - * mode, we could potentially race with page table updates.
>>> + * Convert an address related to an mm to a physical address.
>>> + * NOTE: we are in real mode, we could potentially race with page tabl=
e updates.
>>>   */
>>> -unsigned long addr_to_pfn(struct pt_regs *regs, unsigned long addr)
>>> +unsigned long addr_to_phys(struct pt_regs *regs, unsigned long addr)
>>>  {
>>> -	pte_t *ptep;
>>> -	unsigned long flags;
>>> +	pte_t *ptep, pte;
>>> +	unsigned int shift;
>>> +	unsigned long flags, phys_addr;
>>>  	struct mm_struct *mm;
>>> =20
>>>  	if (user_mode(regs))
>>> @@ -35,14 +36,21 @@ unsigned long addr_to_pfn(struct pt_regs *regs, uns=
igned long addr)
>>>  		mm =3D &init_mm;
>>> =20
>>>  	local_irq_save(flags);
>>> -	if (mm =3D=3D current->mm)
>>> -		ptep =3D find_current_mm_pte(mm->pgd, addr, NULL, NULL);
>>> -	else
>>> -		ptep =3D find_init_mm_pte(addr, NULL);
>>> +	ptep =3D __find_linux_pte(mm->pgd, addr, NULL, &shift);
>>>  	local_irq_restore(flags);
>>> +
>>>  	if (!ptep || pte_special(*ptep))
>>>  		return ULONG_MAX;
>>> -	return pte_pfn(*ptep);
>>> +
>>> +	pte =3D *ptep;
>>> +	if (shift > PAGE_SHIFT) {
>>> +		unsigned long rpnmask =3D (1ul << shift) - PAGE_SIZE;
>>> +
>>> +		pte =3D __pte(pte_val(pte) | (addr & rpnmask));
>>> +	}
>>> +	phys_addr =3D pte_pfn(pte) << PAGE_SHIFT;
>>> +
>>> +	return phys_addr;
>>>  }
>>
>> This should remain addr_to_pfn I think. None of the callers care what
>> size page the EA was mapped with. 'pfn' is referring to the Linux pfn,
>> which is the small page number.
>>
>>   if (shift > PAGE_SHIFT)
>>     return (pte_pfn(*ptep) | ((addr & ((1UL << shift) - 1)) >> PAGE_SHIF=
T);
>>   else
>>     return pte_pfn(*ptep);
>>
>> Something roughly like that, then you don't have to change any callers
>> or am I missing something?
>=20
> Here[1] you asked to return the real address rather than pfn, which all
> callers care about. So made the changes accordingly.
>=20
> [1] https://www.spinics.net/lists/kernel/msg3187658.html

Ah I did suggest it, but I meant _exact_ physical address :) The one
matching the effective address you gave it.

As it is now, the physical address is truncated at the small page size,
so if you do that you might as well just keep it as a pfn and no change
to callers.

I would also prefer getting the pfn as above rather than constructing a
new pte, which is a neat hack but is not a normal pattern.

Thanks,
Nick
=
