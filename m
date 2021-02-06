Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E23703118B6
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Feb 2021 03:47:37 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DXcCC0phrzDqPQ
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Feb 2021 13:47:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::435;
 helo=mail-pf1-x435.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ACxn+976; dkim-atps=neutral
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DXc9b5zdczDqDZ
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Feb 2021 13:46:11 +1100 (AEDT)
Received: by mail-pf1-x435.google.com with SMTP id i63so5558624pfg.7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Feb 2021 18:46:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=cTqgo+6ZbpNSGicu/mHWY2mM69GkxMgx2NNu11it7jU=;
 b=ACxn+976SvVaPsO8ANFbw9sAFBiw4GM8PujXv+YEairPoLOqNIOCMBb5KFBLw/lp8v
 UZhThrnNt5W68kpaXiQJKEY7fskDZihVMlnb9qblBpYUMYGVgS31J6taW2+1fxYsg7Wv
 xwkaytuuA3mnf6poVBXq4AAShaW+joz2tG56NBvPgbr0Sy+rW/PByjrob7umuexH5o7F
 ZuLlVRzjif5x1OD/oz8fzjJn+XJZl4iKoJqIhtm0gph2FKAUtjSkS8b1Fl2BrVKr59eE
 agivK4tygbLZ9tiCtRpc63gXXh2zO5yG3kpj0YtXmS3uiVsihOvlbnNUcztCCnT/tVTz
 U8bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=cTqgo+6ZbpNSGicu/mHWY2mM69GkxMgx2NNu11it7jU=;
 b=H2gE7mxhGUgdVD0z1ZRwZVRXY/49CZbSzzbgdl+zvzGC9C0JnDHQ698NkLr7bjxkOd
 nSYxEsqf9Sxvt2ccUP2Ikyv5m8frn48+l717umJ9S23MGLn70Q3W/rUWvsnVnrOri3NY
 vodD7TxUpEsLKVYhJBu37DhiInQ7AWBZ6fMMwRvpQ5AapqSxkG64/4HxgsT0esd1GMNj
 z9YDk9N28kp25tphln+7BTjVy09Rk3HP4Z82nII0vBLV2FchJOHOHWuZH5WXoa7IJD68
 pLunC72OLWo/WIAwepzeEI1QzShz+UMkB+eaHGQzw93SzYmVhFqnzLRfb0vt//O3VEFC
 tatw==
X-Gm-Message-State: AOAM532dfQ5fumWSUtf4UhRrJtQWcVOZ5IuZuqdNHaa1JluZlVMMjqJK
 Ta41uTNkDxDEi4qWBgi1E09JluZM8T8=
X-Google-Smtp-Source: ABdhPJy4F9Leg8MF85PmkGLEeDO+Ncw8K5gSHvNBAXmrDGbMzHgC6g78iAvJMmqcaRXZiMlY21eIaQ==
X-Received: by 2002:aa7:8713:0:b029:1bf:ee0:34c4 with SMTP id
 b19-20020aa787130000b02901bf0ee034c4mr7313187pfo.55.1612579567583; 
 Fri, 05 Feb 2021 18:46:07 -0800 (PST)
Received: from localhost (60-242-11-44.static.tpgi.com.au. [60.242.11.44])
 by smtp.gmail.com with ESMTPSA id h12sm11407986pgs.7.2021.02.05.18.46.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 18:46:07 -0800 (PST)
Date: Sat, 06 Feb 2021 12:46:01 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v7 39/42] powerpc: move NMI entry/exit code into wrapper
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
References: <20210130130852.2952424-1-npiggin@gmail.com>
 <20210130130852.2952424-40-npiggin@gmail.com>
 <87k0rop29e.fsf@mpe.ellerman.id.au>
 <1612438069.44myr3nzfs.astroid@bobo.none>
 <875z36ozkq.fsf@mpe.ellerman.id.au>
In-Reply-To: <875z36ozkq.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Message-Id: <1612579435.unncvipdys.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Michael Ellerman's message of February 6, 2021 9:38 am:
> Nicholas Piggin <npiggin@gmail.com> writes:
>> Excerpts from Michael Ellerman's message of February 4, 2021 8:15 pm:
>>> Nicholas Piggin <npiggin@gmail.com> writes:
>>>> This moves the common NMI entry and exit code into the interrupt handl=
er
>>>> wrappers.
>>>>
>>>> This changes the behaviour of soft-NMI (watchdog) and HMI interrupts, =
and
>>>> also MCE interrupts on 64e, by adding missing parts of the NMI entry t=
o
>>>> them.
>>>>
>>>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>>>> ---
>>>>  arch/powerpc/include/asm/interrupt.h | 28 ++++++++++++++++++++++
>>>>  arch/powerpc/kernel/mce.c            | 11 ---------
>>>>  arch/powerpc/kernel/traps.c          | 35 +++++----------------------=
-
>>>>  arch/powerpc/kernel/watchdog.c       | 10 ++++----
>>>>  4 files changed, 38 insertions(+), 46 deletions(-)
>>>=20
>>> This is unhappy when injecting SLB multi-hits:
>>>=20
>>>   root@p86-2:~# echo PPC_SLB_MULTIHIT > /sys/kernel/debug/provoke-crash=
/DIRECT
>>>   [  312.496026][ T1344] kernel BUG at arch/powerpc/include/asm/interru=
pt.h:152!
>>>   [  312.496037][ T1344] Oops: Exception in kernel mode, sig: 5 [#1]
>>>   [  312.496045][ T1344] LE PAGE_SIZE=3D64K MMU=3DHash SMP NR_CPUS=3D20=
48 NUMA pSeries
>>
>> pseries hash. Blast!
>=20
> The worst kind.
>=20
>>> 147 static inline void interrupt_nmi_exit_prepare(struct pt_regs *regs,=
 struct interrupt_nmi_state *state)
>>> 148 {
>>> 149 	if (!IS_ENABLED(CONFIG_PPC_BOOK3S_64) ||
>>> 150 			!firmware_has_feature(FW_FEATURE_LPAR) ||
>>> 151 			radix_enabled() || (mfmsr() & MSR_DR))
>>> 152 		nmi_exit();
>>>=20
>>>=20
>>> So presumably it's:
>>>=20
>>> #define __nmi_exit()						\
>>> 	do {							\
>>> 		BUG_ON(!in_nmi());				\
>>
>> Yes that would be it, pseries machine check enables MMU half way through=
=20
>> so only one side of this triggers.
>>
>> The MSR_DR check is supposed to catch the other NMIs that run with MMU=20
>> on (perf, watchdog, etc). Suppose it could test TRAP(regs) explicitly
>> although I wonder if we should also do this to keep things balanced
>=20
> Yeah I think I like that. I'll give it a test.

The msr restore? Looking closer, pseries_machine_check_realmode may have
expected mce_handle_error to enable the MMU, because irq_work_queue uses
some per-cpu variables I think.

So the code might have to be rearranged a bit more than the patch below.

Thanks,
Nick

>=20
> cheers
>=20
>=20
>> diff --git a/arch/powerpc/platforms/pseries/ras.c b/arch/powerpc/platfor=
ms/pseries/ras.c
>> index 149cec2212e6..f57ca0c570be 100644
>> --- a/arch/powerpc/platforms/pseries/ras.c
>> +++ b/arch/powerpc/platforms/pseries/ras.c
>> @@ -719,6 +719,7 @@ static int mce_handle_err_virtmode(struct pt_regs *r=
egs,
>> =20
>>  static int mce_handle_error(struct pt_regs *regs, struct rtas_error_log=
 *errp)
>>  {
>> +       unsigned long msr;
>>         struct pseries_errorlog *pseries_log;
>>         struct pseries_mc_errorlog *mce_log =3D NULL;
>>         int disposition =3D rtas_error_disposition(errp);
>> @@ -747,9 +748,12 @@ static int mce_handle_error(struct pt_regs *regs, s=
truct rtas_error_log *errp)
>>          *       SLB multihit is done by now.
>>          */
>>  out:
>> -       mtmsr(mfmsr() | MSR_IR | MSR_DR);
>> +       msr =3D mfmsr();
>> +       mtmsr(msr | MSR_IR | MSR_DR);
>>         disposition =3D mce_handle_err_virtmode(regs, errp, mce_log,
>>                                               disposition);
>> +       mtmsr(msr);
>> +
>>         return disposition;
>>  }
>> =20
>=20
