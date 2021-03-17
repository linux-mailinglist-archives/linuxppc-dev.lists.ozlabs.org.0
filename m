Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 579C233EE05
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Mar 2021 11:06:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F0m5H2XVDz3bcM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Mar 2021 21:06:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=pmnvXCuC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::531;
 helo=mail-pg1-x531.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=pmnvXCuC; dkim-atps=neutral
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F0m4r5MbQz2yhv
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Mar 2021 21:05:46 +1100 (AEDT)
Received: by mail-pg1-x531.google.com with SMTP id w34so23423894pga.8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Mar 2021 03:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=ryzwKJZlXh6gOxpAiYwDkVYsD3OQyP8WLUA6WVptfvE=;
 b=pmnvXCuCBU7M3Wok1beFIkfiaOoVR8ElbjGypyGdL7JxjoBSYKBcP/UWbr3hdKBvmj
 B/yfYMzsgAkeYfj2hmvRoTvo7eu0N5K30Qri0zmK1DQSPnrgblTW0LbsujdHTTdZ1b+f
 m+++KWcwUr0oeBH0Zy/AFDTS5e5tOej5weWot/3vx96p2RQ7x6utUZBftLirPVz7jCpW
 4nOckMViFoacioH6wY3+2michshC58T7wqKEVKV+kjQc3p9w5uvUnRl/TeA+YKGHXvOF
 IME0knxmJPBCjUG2MQKf7M9WJe0aP5Y5zOoDQ3yuc/d9rh/p8y4m2YRm1Zqty95aL5+U
 eIqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=ryzwKJZlXh6gOxpAiYwDkVYsD3OQyP8WLUA6WVptfvE=;
 b=DuBRH4h5OKNRGMqCm+W89uUjiXZHFO0f1tVuNKHutniur9zv/c4RYrBJCwhtjvhpkC
 FGqq88rOYVms9RI59O9qcHNfLPer7IAT4UBIpVaggFMZOPpXdxobYsvlvTD/FWdJ+T39
 hapv5lZdg/So9wRwH+8ZMO4b31CSmtDkgKYOEZH5OnBVw9RToV+D16HT5s7N+iKa4MwF
 EjYHTf5jadTWClVsfpcc07D4nfRpw27IxomUJwg2SOcy7zgHFq0a9xEXX//EbPRM/PEr
 vkWDXjjzhurBDwBn33GIIVdfRt3e9Ij1r6Tt4X53ZYtlzVjN3+wiZkho5TBu2/O4n+lA
 O50w==
X-Gm-Message-State: AOAM532ny3hy03b3khphgs54DBor618pRrAcWnOHknH5X59x2T+dzL48
 mdkqSGuCtLefpAaw6UnLd/k=
X-Google-Smtp-Source: ABdhPJwrc8qO5vxRDNTIhzRdS6aSSfekwJ0pyd7uHyiDXbjllUaZ92EZzgk2Ue01vp7Ca5RVHIK0Iw==
X-Received: by 2002:aa7:9af8:0:b029:1ef:20f4:56c0 with SMTP id
 y24-20020aa79af80000b02901ef20f456c0mr3745030pfp.6.1615975541139; 
 Wed, 17 Mar 2021 03:05:41 -0700 (PDT)
Received: from localhost (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id t10sm2285571pjf.30.2021.03.17.03.05.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 03:05:40 -0700 (PDT)
Date: Wed, 17 Mar 2021 20:05:35 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 04/11] powerpc/64e/interrupt: use new interrupt return
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
References: <20210316104206.407354-1-npiggin@gmail.com>
 <20210316104206.407354-5-npiggin@gmail.com>
 <53a3a1e1-b2c5-116c-174b-dd4beefa6515@csgroup.eu>
In-Reply-To: <53a3a1e1-b2c5-116c-174b-dd4beefa6515@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1615975381.f8028rpp12.astroid@bobo.none>
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
Cc: Scott Wood <oss@buserror.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christophe Leroy's message of March 16, 2021 8:49 pm:
>=20
>=20
> Le 16/03/2021 =C3=A0 11:41, Nicholas Piggin a =C3=A9crit=C2=A0:
>> Update the new C and asm interrupt return code to account for 64e
>> specifics, switch over to use it.
>>=20
>> The now-unused old ret_from_except code, that was moved to 64e after the
>> 64s conversion, is removed.
>>=20
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>   arch/powerpc/include/asm/asm-prototypes.h |   2 -
>>   arch/powerpc/include/asm/ppc_asm.h        |  20 --
>>   arch/powerpc/kernel/asm-offsets.c         |  10 -
>>   arch/powerpc/kernel/exceptions-64e.S      | 321 ++--------------------
>>   arch/powerpc/kernel/irq.c                 |  76 -----
>>   5 files changed, 25 insertions(+), 404 deletions(-)
>>=20
>=20
>> diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm=
-offsets.c
>> index 85ba2b0bc8d8..c880ad18b851 100644
>> --- a/arch/powerpc/kernel/asm-offsets.c
>> +++ b/arch/powerpc/kernel/asm-offsets.c
>> @@ -282,21 +282,11 @@ int main(void)
>>   	OFFSET(PACAHWCPUID, paca_struct, hw_cpu_id);
>>   	OFFSET(PACAKEXECSTATE, paca_struct, kexec_state);
>>   	OFFSET(PACA_DSCR_DEFAULT, paca_struct, dscr_default);
>> -	OFFSET(ACCOUNT_STARTTIME, paca_struct, accounting.starttime);
>> -	OFFSET(ACCOUNT_STARTTIME_USER, paca_struct, accounting.starttime_user)=
;
>> -	OFFSET(ACCOUNT_USER_TIME, paca_struct, accounting.utime);
>> -	OFFSET(ACCOUNT_SYSTEM_TIME, paca_struct, accounting.stime);
>>   #ifdef CONFIG_PPC_BOOK3E
>>   	OFFSET(PACA_TRAP_SAVE, paca_struct, trap_save);
>>   #endif
>>   	OFFSET(PACA_SPRG_VDSO, paca_struct, sprg_vdso);
>>   #else /* CONFIG_PPC64 */
>=20
> The #else is useless

Thanks. I'll hold off re posting until there is some more activity.

Thanks,
Nick
