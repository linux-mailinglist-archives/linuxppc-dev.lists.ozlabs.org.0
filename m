Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 801CB2E2E04
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Dec 2020 11:59:32 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D31693lTyzDqLB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Dec 2020 21:59:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633;
 helo=mail-pl1-x633.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=aEJhyQhc; dkim-atps=neutral
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D314l2GBCzDqGt
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Dec 2020 21:58:10 +1100 (AEDT)
Received: by mail-pl1-x633.google.com with SMTP id e2so3350591plt.12
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Dec 2020 02:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=GJkCxtBkjCsHQcbnl+p6Xs6EXpTAYh4Zm03ysjpmp+M=;
 b=aEJhyQhcdya8UbZCs4FJ0hyKAmiMZP+rpvj1VMZtwTEFj2gViZUs+O5ww91EwDQIZ5
 mh/tOD5922ArDNAN4PbS7G+vnpEO8Wuf+Ny0br64PZLf8kLXJ34UOnhVGcYUVobSqfiH
 PN9jhN+qXoKPXphjlQW0RwSAjy5143L2FqhF8IK8Kz5wG7jvKKAmN06+qKWoXa+gPfsJ
 yKnEbuqsEf41Fg29hKEQBxQ2gs9yYwQ03vfTkJOxnkNW5wJs5I0V7E044IwEd0wWVKeE
 HxbgTISsG3UCa9EMJncKf/qITnEIjpRefh1dWLJsR1YNCFw1Km9rooq1aQLxB5Vj6V7K
 krzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=GJkCxtBkjCsHQcbnl+p6Xs6EXpTAYh4Zm03ysjpmp+M=;
 b=mhJKYIpNing5Di/c41Z6UHBaZsSrNFKc4SrxEDTWnC6C6KronALdbr4vkssbBUEyfJ
 ut0UX2Ec2Cb7IgWlK2F20pUZoulLBiEhmMJIUDZxZnGuI8/1A+itYoY39EUEs3DDRSoI
 TBLnZRDiqM6g355Kpfcsa7oVbFq9xxpdS1uOjaDRhF9hjT/hK8O+civ9okQL/lJ+lB8h
 1e//0eWaJnFw935ONR2+ihmfH7fprRx4tXdEJBTK1XdIcml3obJL3W3XKEPvB9vp9T75
 De2CekToCQLBYQZVemDGRFqVpYnxJ58lvozwp+Wr14Q4tukspjy8kCMiseKdlHE0LIDS
 BqZQ==
X-Gm-Message-State: AOAM531Mjn483NsC8ZuttAYakaylPUhm/jR/pZ5h27kTvO2/X2g7ofgO
 QmINnN8blilMBVi8i7IpembBmm7UTeU=
X-Google-Smtp-Source: ABdhPJyHktSoHnBfiTE0WFNduEBcppfT+gj+UlHTZzvfXTnVN/JiedZvn5MnvyjTtLv8Q+UcUSlNHQ==
X-Received: by 2002:a17:902:ba8d:b029:dc:bc0:4d5 with SMTP id
 k13-20020a170902ba8db02900dc0bc004d5mr37288927pls.75.1608980286806; 
 Sat, 26 Dec 2020 02:58:06 -0800 (PST)
Received: from localhost (193-116-97-30.tpgi.com.au. [193.116.97.30])
 by smtp.gmail.com with ESMTPSA id i25sm31973186pgb.33.2020.12.26.02.58.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Dec 2020 02:58:06 -0800 (PST)
Date: Sat, 26 Dec 2020 20:58:00 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 03/19] powerpc: bad_page_fault, do_break get registers
 from regs
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
References: <20201128144114.944000-1-npiggin@gmail.com>
 <20201128144114.944000-4-npiggin@gmail.com>
 <312d3d14-329c-a0c9-89c4-e21d1f9e616d@csgroup.eu>
 <1608970380.delquel806.astroid@bobo.none>
In-Reply-To: <1608970380.delquel806.astroid@bobo.none>
MIME-Version: 1.0
Message-Id: <1608980023.nlrgl4pzi1.astroid@bobo.none>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Nicholas Piggin's message of December 26, 2020 6:19 pm:
> Excerpts from Christophe Leroy's message of December 23, 2020 12:42 am:
>>=20
>>=20
>> Le 28/11/2020 =C3=A0 15:40, Nicholas Piggin a =C3=A9crit=C2=A0:
>>> Similar to the previous patch this makes interrupt handler function
>>> types more regular so they can be wrapped with the next patch.
>>>=20
>>> bad_page_fault and do_break are not performance critical.
>>=20
>> I partly took your changes into one of my series, in different order tho=
ugh.
>>=20
>> Please have a look at https://patchwork.ozlabs.org/project/linuxppc-dev/=
list/?series=3D221656 patches=20
>> 4 to 7
>=20
> Thanks, I had a look. Seems like the result is basically the same as my=20
> series, so that's good if you like the end result now :)
>=20
>> I think some of the changes are missing in your series, especially the c=
hanges in entry_32.S from=20
>> patch 7.
>=20
> Okay I could take them in. In your patch 7/15, why do you leave this=20
> load of DSISR?
>=20
> diff --git a/arch/powerpc/kernel/head_book3s_32.S b/arch/powerpc/kernel/h=
ead_book3s_32.S
> index 15e6003fd3b8..0133a02d1d47 100644
> --- a/arch/powerpc/kernel/head_book3s_32.S
> +++ b/arch/powerpc/kernel/head_book3s_32.S
> @@ -369,9 +369,9 @@  BEGIN_MMU_FTR_SECTION
>  END_MMU_FTR_SECTION_IFSET(MMU_FTR_HPTE_TABLE)
>  #endif
>  #endif	/* CONFIG_VMAP_STACK */
> -1:	mr	r4,r12
>  	andis.	r5,r9,DSISR_SRR1_MATCH_32S@h /* Filter relevant SRR1 bits */
> -	stw	r4, _DAR(r11)
> +	stw	r12, _DAR(r11)
> +	stw	r5, _DSISR(r11)
>  	EXC_XFER_LITE(0x400, handle_page_fault)
> =20
>  /* External interrupt */
> @@ -693,7 +693,6 @@  handle_page_fault_tramp_1:
>  #ifdef CONFIG_VMAP_STACK
>  	EXCEPTION_PROLOG_2 handle_dar_dsisr=3D1
>  #endif
> -	lwz	r4, _DAR(r11)
>  	lwz	r5, _DSISR(r11)
> 	^^^^^^^^^^^^^^^^^^^^^^
>  	/* fall through */
>  handle_page_fault_tramp_2:
>=20
> ?

Ah never mind, this needs to come back after your DABR match move
patch, which you have earlier in the series. I confused myself.

I'll rebase my series on your patch 4 rather than have it squashed
in with other do_break stuff.

Thanks,
Nick
