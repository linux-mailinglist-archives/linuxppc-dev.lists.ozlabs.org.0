Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 561353118B5
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Feb 2021 03:45:10 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DXc8G4ygrzDqND
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Feb 2021 13:45:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031;
 helo=mail-pj1-x1031.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ibL2Bbpm; dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DXc6m1mG8zDqCW
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Feb 2021 13:43:41 +1100 (AEDT)
Received: by mail-pj1-x1031.google.com with SMTP id s24so4621164pjp.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Feb 2021 18:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=5A2c9NOnMfc07zkhqNqcPCYBX3nsYeSTQErFEKr4J9E=;
 b=ibL2BbpmCIR8pOEWA4qy0pKIcV3Lr17MN5mwQLPlfOyHQsnxsm59f7jSBfDpeI86SR
 DcTHFXS9EAa9IsRE2ZcA9IWYuV2tUWtmDuVCRxXcGPBGnJ0SzgkFq75Vj53eUNz6Iy7Y
 IgfgCoxVQJAERIa2EcQYNWcCV3IqHg1q8I3jJvXyE0g5OVss6q0rT/wkIZME0Rtbt59k
 JzAnvbcTLGQHhJiEJaxWM2S3k492oJdtJFdCDpJmD02zugxeoDQYyL9drCrP7Lka1gu/
 6H2GiXpgBbIhRjZJLI8t7e4Mbou4HWVwz/Drnhpcj9cldWoOuGZg3AR/GlmU0GLp3eFM
 QRkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=5A2c9NOnMfc07zkhqNqcPCYBX3nsYeSTQErFEKr4J9E=;
 b=XpYDktc9466lEX8hz+NMKfzYEygBf4Fjyz/KRFILFU475BCz129j2R1fv3eYPY1PP0
 zWSPtE8Bz+EHifYi/Ix4l7PWxL5qFLDKEcmAAqEOgJhs8oqI1aekA3UcaCy4b9QbHvRA
 Hh/OImiUtKp1uC3RWQo5WbPMv0yq1NWSyjPEbDV1HdyaiwEJiM6nQnZ3D+noGs7VMx6I
 Kp9CtuwaIiXF1mU9xceE93ryDHqYniBJwnWev8AcVAFky/1X8LOM7Mmnd0rxxaPudoAj
 2X6o1yhMdCZerxp9v3Kn4sbxvtk1w5S7TGFjU0tnBLc2BsyMw+J1MvL54LuDRmdvgZlD
 /zGQ==
X-Gm-Message-State: AOAM5308fsZUmb5zl4WT5F9V5Fv8EUBIr33kKW5yD8a9fKbu0EPImdrP
 4AgiUbUcTIl11TrlG3rurUA=
X-Google-Smtp-Source: ABdhPJwyq94wQmsDoauDJNP/laNUJ1hF3GVKyU8fBtMnbwfTaYuYg4KaUP5M+xB+kdx1P8yhvlwGEg==
X-Received: by 2002:a17:902:e551:b029:de:8dba:84a3 with SMTP id
 n17-20020a170902e551b02900de8dba84a3mr6752719plf.8.1612579417856; 
 Fri, 05 Feb 2021 18:43:37 -0800 (PST)
Received: from localhost (60-242-11-44.static.tpgi.com.au. [60.242.11.44])
 by smtp.gmail.com with ESMTPSA id w3sm9649620pjb.2.2021.02.05.18.43.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 18:43:37 -0800 (PST)
Date: Sat, 06 Feb 2021 12:43:31 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v7 28/42] powerpc: convert interrupt handlers to use
 wrappers
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
References: <20210130130852.2952424-1-npiggin@gmail.com>
 <20210130130852.2952424-29-npiggin@gmail.com>
 <0e319d85-9fa0-ff97-03b2-93637ad89a99@csgroup.eu>
In-Reply-To: <0e319d85-9fa0-ff97-03b2-93637ad89a99@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1612579393.6a09rzs6s0.astroid@bobo.none>
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

Excerpts from Christophe Leroy's message of February 5, 2021 6:09 pm:
>=20
>=20
> Le 30/01/2021 =C3=A0 14:08, Nicholas Piggin a =C3=A9crit=C2=A0:
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>=20
>> diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
>> index f70d3f6174c8..7ff915aae8ec 100644
>> --- a/arch/powerpc/kernel/traps.c
>> +++ b/arch/powerpc/kernel/traps.c
>=20
>> @@ -1462,7 +1474,7 @@ static int emulate_math(struct pt_regs *regs)
>>   static inline int emulate_math(struct pt_regs *regs) { return -1; }
>>   #endif
>>  =20
>> -void program_check_exception(struct pt_regs *regs)
>> +DEFINE_INTERRUPT_HANDLER(program_check_exception)
>>   {
>>   	enum ctx_state prev_state =3D exception_enter();
>>   	unsigned int reason =3D get_reason(regs);
>> @@ -1587,14 +1599,14 @@ NOKPROBE_SYMBOL(program_check_exception);
>>    * This occurs when running in hypervisor mode on POWER6 or later
>>    * and an illegal instruction is encountered.
>>    */
>> -void emulation_assist_interrupt(struct pt_regs *regs)
>> +DEFINE_INTERRUPT_HANDLER(emulation_assist_interrupt)
>>   {
>>   	regs->msr |=3D REASON_ILLEGAL;
>>   	program_check_exception(regs);
>=20
> Is it correct that an INTERRUPT_HANDLER calls another INTERRUPT_HANDLER ?

No you're right, I'll have to send a patch.

Thanks,
Nick
