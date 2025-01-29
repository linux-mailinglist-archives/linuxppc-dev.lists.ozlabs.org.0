Return-Path: <linuxppc-dev+bounces-5661-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9FAA2178C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2025 06:57:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YjWf03RsNz2yVT;
	Wed, 29 Jan 2025 16:57:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1035"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738130264;
	cv=none; b=AjmdRLeRkM17W2zMbRO4Rh7nwgtbrkPbMeOnsr+H+rmYz7kmYsP5Ux6ylggWqLrhircha98TFG1D/KvwGras/LCujbyNTuYLmwqqjj6tFwRn1eTV40Sww4PnhMgT/aWcai3Wk6qyfQpojg+NELLieVF20tDnKq8S/bN1Hpp6OlixKyFrc30fT9D6IEWLz/8OpGzLbSM26dnYZaC+DU8G15kPCUt1hG/v7vw+HcEpmaGSiKFbOfgEshSkrbOJzbzf+MHtFlxw3MMGO+ipDjfXAT1sxEtoiJAtLAIjhsCQWDH2NXvV7ETjJmABVD6BWyx0HuRzzztnW6UOc27Exi2FLw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738130264; c=relaxed/relaxed;
	bh=19piupoqNGPh+bqPfk2v++8FGhXoo9IDvwxG7vSHfMM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:
	 References:In-Reply-To; b=GCIvt/ddVJ1wqqX+xKSWJ3mY86cIq34CU2Itk7IZQl4Z2L5UHnOm8FynZCplhBHD1vsocbrblBhKm8TPsdgWP0jf0OpS7SPbjc/LnoEsaT2gRE1YfDXZQVKTGLxd0wtmurUk5+H2CfmLwUyjTZIFIWU8LBHfcU+7ImhCmSae3mkp1JFjTcHkdr38DMOToBNF2yWdS41JO+zMzAwBcY5vG5ZxQSkOOq3CpZYRpVhTTHXdGeo22vYPOeNRgl3dtm68aUbdHGfUynyR+ZC/CrvC1prskEK4v6mUCXQoduiYhcHRekIvc9QtsLqlVsJHle4EbNPQhFTf2HRfvybJeh1SSw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=khQwT571; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=khQwT571;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YjWdz0sxkz2yPD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2025 16:57:41 +1100 (AEDT)
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2eec9b3a1bbso9006386a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jan 2025 21:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738130259; x=1738735059; darn=lists.ozlabs.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=19piupoqNGPh+bqPfk2v++8FGhXoo9IDvwxG7vSHfMM=;
        b=khQwT571ts4i/3xxn3oyqxdOTspcELXBQ9TOh25/Ka2rlXyKDcZXraPsfS5kz3JKXC
         iwMCH/7KNPBVfOwlkLWCqsjC8s3bRa6Gjwp4EZzL/xFyI62NLCAbtpSpf3s2VUVDHlmh
         XF8D6Hq8KQcadqxu30BY/FVMkWVsyFP0L5P3JJ23l2WIPqgdLlXeoF90bCYbPbAl90xX
         TbiJFDDDJUwWoofSMkJ+FfFmUop/7cR1WpWjzPTgP+M+ZwL8/YCpPZ/uJmyBYpkw8ZL2
         ojjbXXDaogPCl5+70CVXMyc+ZDmyuqMU5iBIiZPAEGEr6oHcTnVGUmVjo9+VOtctKywV
         /j6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738130259; x=1738735059;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=19piupoqNGPh+bqPfk2v++8FGhXoo9IDvwxG7vSHfMM=;
        b=RvGigbHpiUbo+BlCzyAp7/uW4z4UbhoolNnsMYQPZaec1ul+oJc0UyCt15vrKfdMBs
         7NI4M8kTFE6ndf1Mdekop708/prWpxymDeZws0PMz3WQQovfeDRUvMaMnvtaFygkSLOT
         VjosQS34KcI0O08jOuKd36kbeL/8hs1aZOoYyY3wQKalxKjFU+Dds4VpS6SrOTJm1Pxp
         1XqjQlx5QtVF81I6KcNAuK9m/pP+gj5Et2ZRaOkmj4QoRQBY78TJ6kQz4dQ5NiYwLGkG
         WEuNcVu5fzKMwGdqBNJtYzXr2jcYO3dmsfNJjq8ixqk/3DHaXrn5gna2GrX6JUKHnR6l
         SlGw==
X-Forwarded-Encrypted: i=1; AJvYcCUXjLYpuEk2nf8n9dqAbVmWIGiTG8YJgl//gZpoKLIqW0blGfSySLKUdfhUlzo8PjQWz137qK3I/IIwjtA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzlnjhj9g4M1qziKi1VtIZ+SJQG59z2AGurvFWRXdDQ5YngJlCp
	VExK402o8fPNSIfM4aZklrv+mvIlrm8hFUQivVVz1DauBoV5HPv63tkStENv
X-Gm-Gg: ASbGncsAMC2JeDM7nPQrVLnd90ZZpsLXr8lTgmTAWHH46j69UxFpK3bCbW2nMM4TVnU
	aCmRMT9gYYU/X6AVCeAR3/9JNBsTKmphW42pXYXDaXkALt91NZSQ5+NoTgsqgGLEca3rPNkiuYT
	0K9QZaOC9IkBl1vrIKpO5aquvgLyyIZlrjxl09d9EuWe9UDi8WocChO99E8w15ZBqZC95l+xYNb
	7Rs7z2KZXRT6GVvt38QAWoZSimhwMR99uBIqqS5BocQ4mKUafGzl4nQvHrM5FKLiLgGSNRvDPf/
	4e11XPpnMgGGM1eZUDo=
X-Google-Smtp-Source: AGHT+IEttdF51LKOaWMcBMePOLbwTMzgOb26xtE4ONb/kOypIIBQxqFgteVOvGverCtgAy1Lhnmd3g==
X-Received: by 2002:a17:90b:520d:b0:2ee:e961:303d with SMTP id 98e67ed59e1d1-2f83ac87dd3mr2532895a91.35.1738130259324;
        Tue, 28 Jan 2025 21:57:39 -0800 (PST)
Received: from localhost ([1.146.123.110])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f83bcd1599sm722176a91.15.2025.01.28.21.57.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2025 21:57:38 -0800 (PST)
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
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Jan 2025 15:57:33 +1000
Message-Id: <D7EBR34ETWSQ.V11MGUVLOV4B@gmail.com>
Subject: Re: [PATCH 1/5] powerpc/microwatt: Select COMMON_CLK in order to
 get the clock framework
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Paul Mackerras" <paulus@ozlabs.org>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.19.0
References: <Z5lfDb8wsLlmSLBZ@thinks.paulus.ozlabs.org>
 <Z5lfVEMJL5oZOxKo@thinks.paulus.ozlabs.org>
In-Reply-To: <Z5lfVEMJL5oZOxKo@thinks.paulus.ozlabs.org>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed Jan 29, 2025 at 8:51 AM AEST, Paul Mackerras wrote:
> This is to allow us to select Litex MMC host controller driver, which
> drives the litesdcard gateware.
>
> Signed-off-by: Paul Mackerras <paulus@ozlabs.org>

Acked-by: Nicholas Piggin <npiggin@gmail.com>

> ---
>  arch/powerpc/platforms/microwatt/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/powerpc/platforms/microwatt/Kconfig b/arch/powerpc/plat=
forms/microwatt/Kconfig
> index 6af443a1db99..5e41adadac1f 100644
> --- a/arch/powerpc/platforms/microwatt/Kconfig
> +++ b/arch/powerpc/platforms/microwatt/Kconfig
> @@ -6,6 +6,7 @@ config PPC_MICROWATT
>  	select PPC_ICS_NATIVE
>  	select PPC_ICP_NATIVE
>  	select PPC_UDBG_16550
> +	select COMMON_CLK
>  	help
>            This option enables support for FPGA-based Microwatt implement=
ations.
> =20


