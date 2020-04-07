Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 259E21A05D2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 06:38:40 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48xF644Xk9zDqxM
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 14:38:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Y1h+2+Do; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48xF4P5s99zDqfc
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Apr 2020 14:37:09 +1000 (AEST)
Received: by mail-pj1-x1042.google.com with SMTP id nu11so226546pjb.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Apr 2020 21:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=Gpxfvx/3Fvj36DDnG3WM0GaQrgd6bz9GyW1A/QHiwkQ=;
 b=Y1h+2+DoLnzgxHQf06tKixJu3IVQvterRlxiGFYyU4LQekFNquAfgM651dqztmi6tk
 Pnh7b3GJQiaok2OGwxRy8VNW8XvpugkP3uME+o+fFke0n8fwh/RLqvMKLhF6xLhe0mnm
 GAwVzHZGonxhopHBWhnhwxxQBgkNTtBBVZKuTWevoxQoofUZ/2i10HxdGM5TB4HbA/tz
 kvIH5+qqkT+Hufn1NrmN3WZQJdlWooejmPpkz8ZKvoNW97ZZaueButEu1bOaVnM8taxW
 Q5KnHQKCzEZjHJkWZhqGsixYNt5ImpJS/H1oGPR71DgS/Ae6AcyiaJg+D6sN3OH5nkTQ
 55qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=Gpxfvx/3Fvj36DDnG3WM0GaQrgd6bz9GyW1A/QHiwkQ=;
 b=cmgFYWb5O1b0UapKiO62wWs6cLMS7J3TNH9ooKvVBKQeg0ODl2jzQCY0wP8M7X37t1
 fJkMRKxP/iYLKBPn8yVbxGR4e7us6bigaJP5BvGq9hfb0nuTPuxr3hvRZOW2FViZyQGv
 z/N6448QNB04uK+a2nY2z4Z61TP3lBlI/2QNw9zNtEJ0asI1E8w8H7G17Woe8uuF4qTW
 TXyrVdCgSiEdoHwkVoz3gdhp8PMa0Uioj0VGncPiJg5w5l2CZ7XDFCM9KObAKtMkbQGy
 lG8C7On/0TozCFktSGUOM0335lyDMlu0EuXNczrDTGTGfHyu1dmWpILfIeLoakBTaCcJ
 WWSw==
X-Gm-Message-State: AGi0PuYt3XooSVhug4RGW/Hv/8UUIoarFnCraalTLccdHqyPp2AulKl3
 IoM2+OW/YdjcV5blW5qECY8=
X-Google-Smtp-Source: APiQypIXpVfwdLqkiFqc24P6S+kx8bbTD+HGX1sHP+4fWrwpxMg9amlMGV3gZhTtUHGsriE/RvUhiA==
X-Received: by 2002:a17:90a:20f0:: with SMTP id
 f103mr476931pjg.88.1586234226983; 
 Mon, 06 Apr 2020 21:37:06 -0700 (PDT)
Received: from localhost (60-241-117-97.tpgi.com.au. [60.241.117.97])
 by smtp.gmail.com with ESMTPSA id 144sm12949466pfx.184.2020.04.06.21.37.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 21:37:06 -0700 (PDT)
Date: Tue, 07 Apr 2020 14:35:37 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 05/14] powerpc/pseries/ras: avoid calling rtas_token in
 NMI paths
To: Christophe Leroy <christophe.leroy@c-s.fr>, linuxppc-dev@lists.ozlabs.org
References: <20200403132622.130394-1-npiggin@gmail.com>
 <20200403132622.130394-6-npiggin@gmail.com>
 <26bde8af-b499-78f1-2f9a-91972ab343c6@c-s.fr>
In-Reply-To: <26bde8af-b499-78f1-2f9a-91972ab343c6@c-s.fr>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1586234078.wddist9jdn.astroid@bobo.none>
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
Cc: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy's on April 4, 2020 12:30 am:
>=20
>=20
> Le 03/04/2020 =C3=A0 15:26, Nicholas Piggin a =C3=A9crit=C2=A0:
>> In the interest of reducing code and possible failures in the
>> machine check and system reset paths, grab the "ibm,nmi-interlock"
>> token at init time.
>>=20
>> Reviewed-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>   arch/powerpc/include/asm/firmware.h    |  1 +
>>   arch/powerpc/platforms/pseries/ras.c   |  2 +-
>>   arch/powerpc/platforms/pseries/setup.c | 13 ++++++++++---
>>   3 files changed, 12 insertions(+), 4 deletions(-)
>>=20
>> diff --git a/arch/powerpc/include/asm/firmware.h b/arch/powerpc/include/=
asm/firmware.h
>> index ca33f4ef6cb4..6003c2e533a0 100644
>> --- a/arch/powerpc/include/asm/firmware.h
>> +++ b/arch/powerpc/include/asm/firmware.h
>> @@ -128,6 +128,7 @@ extern void machine_check_fwnmi(void);
>>  =20
>>   /* This is true if we are using the firmware NMI handler (typically LP=
AR) */
>>   extern int fwnmi_active;
>> +extern int ibm_nmi_interlock_token;
>>  =20
>>   extern unsigned int __start___fw_ftr_fixup, __stop___fw_ftr_fixup;
>>  =20
>> diff --git a/arch/powerpc/platforms/pseries/ras.c b/arch/powerpc/platfor=
ms/pseries/ras.c
>> index 1d7f973c647b..c74d5e740922 100644
>> --- a/arch/powerpc/platforms/pseries/ras.c
>> +++ b/arch/powerpc/platforms/pseries/ras.c
>> @@ -458,7 +458,7 @@ static struct rtas_error_log *fwnmi_get_errinfo(stru=
ct pt_regs *regs)
>>    */
>>   static void fwnmi_release_errinfo(void)
>>   {
>> -	int ret =3D rtas_call(rtas_token("ibm,nmi-interlock"), 0, 1, NULL);
>> +	int ret =3D rtas_call(ibm_nmi_interlock_token, 0, 1, NULL);
>>   	if (ret !=3D 0)
>>   		printk(KERN_ERR "FWNMI: nmi-interlock failed: %d\n", ret);
>>   }
>> diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platf=
orms/pseries/setup.c
>> index 0c8421dd01ab..b582198be284 100644
>> --- a/arch/powerpc/platforms/pseries/setup.c
>> +++ b/arch/powerpc/platforms/pseries/setup.c
>> @@ -83,6 +83,7 @@ unsigned long CMO_PageSize =3D (ASM_CONST(1) << IOMMU_=
PAGE_SHIFT_4K);
>>   EXPORT_SYMBOL(CMO_PageSize);
>>  =20
>>   int fwnmi_active;  /* TRUE if an FWNMI handler is present */
>> +int ibm_nmi_interlock_token;
>>  =20
>>   static void pSeries_show_cpuinfo(struct seq_file *m)
>>   {
>> @@ -113,9 +114,14 @@ static void __init fwnmi_init(void)
>>   	struct slb_entry *slb_ptr;
>>   	size_t size;
>>   #endif
>> +	int ibm_nmi_register_token;
>>  =20
>> -	int ibm_nmi_register =3D rtas_token("ibm,nmi-register");
>> -	if (ibm_nmi_register =3D=3D RTAS_UNKNOWN_SERVICE)
>> +	ibm_nmi_register_token =3D rtas_token("ibm,nmi-register");
>> +	if (ibm_nmi_register_token =3D=3D RTAS_UNKNOWN_SERVICE)
>> +		return;
>> +
>> +	ibm_nmi_interlock_token =3D rtas_token("ibm,nmi-interlock");
>> +	if (WARN_ON(ibm_nmi_interlock_token =3D=3D RTAS_UNKNOWN_SERVICE))
>>   		return;
>>  =20
>>   	/* If the kernel's not linked at zero we point the firmware at low
>> @@ -123,7 +129,8 @@ static void __init fwnmi_init(void)
>>   	system_reset_addr  =3D __pa(system_reset_fwnmi) - PHYSICAL_START;
>>   	machine_check_addr =3D __pa(machine_check_fwnmi) - PHYSICAL_START;
>>  =20
>> -	if (0 =3D=3D rtas_call(ibm_nmi_register, 2, 1, NULL, system_reset_addr=
,
>> +	if (0 =3D=3D rtas_call(ibm_nmi_register_token, 2, 1, NULL,
>> +				system_reset_addr,
>>   				machine_check_addr))
>=20
> Alignment is wrong.
> And you could put system_reset_addr and=20
> machine_check_addr on the same line to limit the number of lines of the i=
f.

I don't really like using spaces to align but I'll put it on the same=20
line.

Thanks,
Nick
=
