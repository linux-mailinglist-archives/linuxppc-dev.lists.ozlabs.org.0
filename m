Return-Path: <linuxppc-dev+bounces-11539-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05176B3C9FC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Aug 2025 12:14:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cDWGC11pWz2yx7;
	Sat, 30 Aug 2025 20:14:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756548883;
	cv=none; b=OqjA03FZcbSTujgIv6TcN8LNdCiGjnBDro0pE4zVTxicSH2Tm0BrALjpgQ1WeDOeAiBwW1gH7x7dXx8SlHiYZO9RaBhs21f0NyQZdJ527W42H711CR9NYx9PwbIPdNigX7VpCHhhUqEk9YSwlZ9qttCq86cL1OzDy5AqZyo/rzzUq+yWIQZs+JMwpMyTo7GYduFzX7Mv+bF2P12zGVD4GyNgDo2FNR/ISkEM66Y6K9/3sl/J4JT/GlNgJhDggUjeVFSjVinPIFwzrMZtY5sRsXXRIy0a/iIxaqYYYM88P7PG7EoB6iAVjSeJSfyHD5V3iOHJeNkgm93dEE9Yh6ZtZg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756548883; c=relaxed/relaxed;
	bh=tgFSfezKjZeME6d3CyoGJJj4hPEpFDSh2MDwWErXcRI=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-version:Content-type; b=bIsFR9+1J3EuGfYIl2AevDtkNKlzVDxobQeHnx11+zpLuRlG691rgbCMlwZQX642ETcr8GJs9OMoByNaxYuEISu2dStXJXNb62B1Lhv6pnBFCFAKooPvAE03b0lxhCr0324/H1anvqd1NUR9f5aM+5/L2gAdvUhOGToW+1XGsY2JE4T4I/8ZU6aKy407FAH+WsqEwdW01aNP9YEMxup4WURMR6bmtCD51eBb0KJJwSPxECEwTU+YhSOEut+Yhg75B1T33SjDDtw3r0N2DFBdgmK5wr4hFyRAgnOSG1e75yxtLCIYdafAW8FrdWH4N/8voRiCI9FteP2FrCI3mS2Rog==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JBvUz+58; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JBvUz+58;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cDWG90JN0z2yN2
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Aug 2025 20:14:39 +1000 (AEST)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2489c65330aso27463365ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Aug 2025 03:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756548877; x=1757153677; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:message-id:date
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tgFSfezKjZeME6d3CyoGJJj4hPEpFDSh2MDwWErXcRI=;
        b=JBvUz+58r3DdPMwGdtIkYBsnBiY7TQ7ovv1whFvH7x6uOuuDt8vUyIsjkZVVhVsCFq
         3eoULFswS9v1DjSqwVxHWyE6TGmzQL0hivXxk5ezlg7HJwGiPFtlnL9XdbQhPNcC10LC
         HKMJkY7UZz7AqYNqyxd+i5PsK9c17uua96zhoNUxcD6oy9UrYElUf7ltFUOJxoa3gnVQ
         vjBmTdNa+zG8SuOAD+KDZGumiqb3tAZEyzVmxwgnmWorEKgkM6T92ZTgTygD3xuRRhzH
         S2xg/PBg+9J4ux/jIGN3njLEDTKKa8yp2aIwaWYoQrCV0JFZRSt5WnwLgtN9fZelu+jo
         /mSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756548877; x=1757153677;
        h=content-transfer-encoding:mime-version:references:message-id:date
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tgFSfezKjZeME6d3CyoGJJj4hPEpFDSh2MDwWErXcRI=;
        b=OMfBDGXnO0SF9+9ErwL9a0qMtXyb5kgdJDvE1mOZE9cRMG6PhStekg2dxTgW6Ewspm
         brWs+YJggfEa5maLQG+q+/6Ta8LIvn7kR9s+FmzCRg+VGuphV0FEbtVE0GpnfZPiSMd7
         NWxaIytOZbKBt/KuwuwUv1MM1mBjhrHhPNtSZj3sgVcJLIV7q2q32OO3c6QqGayoOma5
         UsFHzexU2efFMUWomK9LLVghEXjl9p5LmNsy5c5F1sJxBkJ0+W71BFedTYtF07Sem9ec
         x98aEBGYH51Suh8Up0swd9sDvx/fqEkaSKFT2hPxwCO2y2oganhUS1xuxX+5dPvaSdbO
         pawA==
X-Forwarded-Encrypted: i=1; AJvYcCWEjJa8cEvl6wXUUr+24hPZHeMLSnT3dNDxgOIfu7perxbCbwCr9zLMg7srtRVttvdCT/iAPPqPG5dvE1U=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxa7lhYRx7r4kFUU8xFWtChcx6ikRGGBPegBr0JPVj0PxBkwnGc
	y/HhOwh8I46xi993kdNkm2EYU0SwoMbqn5wboI+V/3p3sKhtBqs9CEPM
X-Gm-Gg: ASbGnct/6Q65cj1Ev1kiAmAsBrhzzgfvsP09ZOsrIOu8H0P7bJTHtjlSMblqRFVAl8E
	wfYwwIa48rf/XMfro3TnuiN8SdD49qAMOyOhMK9d4F1HRDcb6VTc8qkj4wioG+Irq4QL+VTYnj8
	JPk17Xf4nFqu1wnoqFgIrvN9frtTqFkyB03JFCfG5kItC9krhNKBLlEDx42iwkw6bvFk38yzAgC
	DeFiTRGslIL6zqsTBb5jSXLkTtKwEAv1EzHRv1H9RnkIUdeC6Ny59RaoUsvuWbJhhiUxmvgkPSU
	vAXD8foCl1GafANSkx9Z/4T8vrYJ8Wm7nCS2qv2GwQkk0CAw7ftN34CTUexvvGSHNKuX7f3MgAW
	UWGlHRsYi85k0F2U=
X-Google-Smtp-Source: AGHT+IFkcSJ2e1v2zDyrPqjS7AHlgUFicAwRTLXCz1J3SlKw59Voy+TapqGLDTLj9lN3smSkCKlN8w==
X-Received: by 2002:a17:903:1a2e:b0:21f:1202:f2f5 with SMTP id d9443c01a7336-24944a11325mr17732945ad.8.1756548877268;
        Sat, 30 Aug 2025 03:14:37 -0700 (PDT)
Received: from dw-tp ([171.76.86.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-249037285b9sm48953955ad.44.2025.08.30.03.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 03:14:36 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Paul Mackerras <paulus@ozlabs.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Donet Tom <donettom@linux.ibm.com>
Subject: Re: [RFC 7/8] powerpc/book3s64/slb: Add no_slb_preload early cmdline param
In-Reply-To: <70d03b12-86a9-4f6b-bbec-334cfd439e26@csgroup.eu>
Date: Sat, 30 Aug 2025 15:41:44 +0530
Message-ID: <87qzwtjezj.fsf@gmail.com>
References: <cover.1756522067.git.ritesh.list@gmail.com> <8a654cb9cc8bfc872df0cff5558c787ec44c8f28.1756522067.git.ritesh.list@gmail.com> <70d03b12-86a9-4f6b-bbec-334cfd439e26@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-version: 1.0
Content-type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=2.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,MALFORMED_FREEMAIL,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Christophe Leroy <christophe.leroy@csgroup.eu> writes:

> Le 30/08/2025 à 05:51, Ritesh Harjani (IBM) a écrit :
>> no_slb_preload cmdline can come useful in quickly disabling and/or
>> testing the performance impact of userspace slb preloads. Recently there
>> was a slb multi-hit issue due to slb preload cache which was very
>> difficult to triage. This cmdline option allows to quickly disable
>> preloads and verify if the issue exists in preload cache or somewhere
>> else. This can also be a useful option to see the effect of slb preloads
>> for any application workload e.g. number of slb faults with or w/o slb
>> preloads.
>> 
>> For e.g. with the next patch where we added slb_faults counter to /proc/vmstat:
>> 
>> with slb_preload:
>> slb_faults (minimal initrd boot): 15
>> slb_faults (full systemd boot): 300
>> 
>> with no_slb_preload:
>> slb_faults (minimal initrd boot): 33
>> slb_faults (full systemd boot): 138180
>> 
>> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: Nicholas Piggin <npiggin@gmail.com>
>> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
>> Cc: Paul Mackerras <paulus@ozlabs.org>
>> Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
>> Cc: Donet Tom <donettom@linux.ibm.com>
>> Cc: linuxppc-dev@lists.ozlabs.org
>> Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
>> ---
>>   Documentation/admin-guide/kernel-parameters.txt |  3 +++
>>   arch/powerpc/mm/book3s64/hash_utils.c           |  3 +++
>>   arch/powerpc/mm/book3s64/internal.h             |  7 +++++++
>>   arch/powerpc/mm/book3s64/slb.c                  | 15 +++++++++++++++
>>   4 files changed, 28 insertions(+)
>> 
>> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
>> index 747a55abf494..9a66f255b659 100644
>> --- a/Documentation/admin-guide/kernel-parameters.txt
>> +++ b/Documentation/admin-guide/kernel-parameters.txt
>> @@ -7135,6 +7135,9 @@
>>   			them frequently to increase the rate of SLB faults
>>   			on kernel addresses.
>> 
>> +	no_slb_preload	[PPC,EARLY]
>> +			Disables slb preloading for userspace.
>> +
>>   	sunrpc.min_resvport=
>>   	sunrpc.max_resvport=
>>   			[NFS,SUNRPC]
>> diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
>> index 495b6da6f5d4..abf703563ea3 100644
>> --- a/arch/powerpc/mm/book3s64/hash_utils.c
>> +++ b/arch/powerpc/mm/book3s64/hash_utils.c
>> @@ -1319,6 +1319,9 @@ static void __init htab_initialize(void)
>>   	if (stress_slb_enabled)
>>   		static_branch_enable(&stress_slb_key);
>> 
>> +	if (no_slb_preload)
>> +		static_branch_enable(&no_slb_preload_key);
>> +
>>   	if (stress_hpt_enabled) {
>>   		unsigned long tmp;
>>   		static_branch_enable(&stress_hpt_key);
>> diff --git a/arch/powerpc/mm/book3s64/internal.h b/arch/powerpc/mm/book3s64/internal.h
>> index c26a6f0c90fc..cad08d83369c 100644
>> --- a/arch/powerpc/mm/book3s64/internal.h
>> +++ b/arch/powerpc/mm/book3s64/internal.h
>> @@ -22,6 +22,13 @@ static inline bool stress_hpt(void)
>>   	return static_branch_unlikely(&stress_hpt_key);
>>   }
>> 
>> +extern bool no_slb_preload;
>> +DECLARE_STATIC_KEY_FALSE(no_slb_preload_key);
>> +static inline bool slb_preload_disabled(void)
>> +{
>> +	return static_branch_unlikely(&no_slb_preload_key);
>> +}
>> +
>>   void hpt_do_stress(unsigned long ea, unsigned long hpte_group);
>> 
>>   void exit_lazy_flush_tlb(struct mm_struct *mm, bool always_flush);
>> diff --git a/arch/powerpc/mm/book3s64/slb.c b/arch/powerpc/mm/book3s64/slb.c
>> index 780792b9a1e5..297ab0e93c1e 100644
>> --- a/arch/powerpc/mm/book3s64/slb.c
>> +++ b/arch/powerpc/mm/book3s64/slb.c
>> @@ -42,6 +42,15 @@ early_param("stress_slb", parse_stress_slb);
>> 
>>   __ro_after_init DEFINE_STATIC_KEY_FALSE(stress_slb_key);
>> 
>> +bool no_slb_preload __initdata;
>> +static int __init parse_no_slb_preload(char *p)
>> +{
>> +	no_slb_preload = true;
>> +	return 0;
>
> Can't you call static_branch_disable() directly from here and avoid 
> doing it in hash_utils.c ?
>

parse_early_param() for cmdline options happens before the setup_feature_keys().
Hence we cannot call static_branch_disable() here in parse_no_slb_preload()

-ritesh

