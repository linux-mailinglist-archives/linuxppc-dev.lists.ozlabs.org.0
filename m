Return-Path: <linuxppc-dev+bounces-8848-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B808ABFCF3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 May 2025 20:40:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b2gGK2PGpz2ygK;
	Thu, 22 May 2025 04:40:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::12c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747842077;
	cv=none; b=oHgRpT1b46Qbrx6moivjYLZsD8S3b17q1RczYWxMrM4g2A6Wm1xK+29S3Y65TGNV2aIMo3o1EpUQ5t3nOloi9GHkzdY3Nu7nMRLGeMxlZMtBSzd8Ru8GlyN3R3WYSB7DujY2t/IWixUcc0oNBz5DCORjM7KijdFDzWKWqIcNcvAQPS0WP1gpG5FBHf0B3PzUbwf4uPpOONZFW4W5MPRsbahjNgBa9HLenrJmmKEkxA2NouTGbphvoTxjtJK7HJtU/VI0A+WgyfrXuvg2llHsLfyxRcpIVYIH4+Ufu4KWklBcQ8R0+V8hxSC+qYKznFQuVZuNd+Zp4Lwz5R6IzK8sXw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747842077; c=relaxed/relaxed;
	bh=lvD+mNVQm/2jmSgV0usT3IDjfQuZhMOI7Av7SLu7jf0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:
	 References:In-Reply-To; b=d6B+FI6k7oE+C4ANExe4RG+2aI0lPbO1OEgOVKcb1Cm3nu36/XTmFe0mBJArCYzZSe5PMyNGRkFfC6rL+i70N5hF5ijgfJnpYAbXOKRD3O6AaMwh+zdLo/OEqYIJbJgIkssUitgre2f/U+vpCuOh4L/6IvKlCbthoOB9VvdVpcVSJvCg/AK/Ucn/cncz0tOBd94CfBwCQdO7q67OWsOtB3hSCgkYbfKUyTwg1+TkbtdAH8Cmo722KLsXiz8w67OGoJIatamwFl1GW3jDzm4N9/aL8/HMq54wv+FlnDoDxb5vujSg0GrjD4Tr2ugmjb7qLiMGwfSr2pyBmIi4G3cRGg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; dkim=fail header.d=brighamcampbell.com header.i=@brighamcampbell.com header.a=rsa-sha256 header.s=google header.b=GKaRBWzZ reason="key not found in DNS"; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::12c; helo=mail-il1-x12c.google.com; envelope-from=me@brighamcampbell.com; receiver=lists.ozlabs.org) smtp.mailfrom=brighamcampbell.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=brighamcampbell.com header.i=@brighamcampbell.com header.a=rsa-sha256 header.s=google header.b=GKaRBWzZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=brighamcampbell.com (client-ip=2607:f8b0:4864:20::12c; helo=mail-il1-x12c.google.com; envelope-from=me@brighamcampbell.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b2bHb2YRnz3byj
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 May 2025 01:41:14 +1000 (AEST)
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-3dc73b1bd7aso18834695ab.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 May 2025 08:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1747842072; x=1748446872; darn=lists.ozlabs.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lvD+mNVQm/2jmSgV0usT3IDjfQuZhMOI7Av7SLu7jf0=;
        b=GKaRBWzZ13PkdRgilQHxBRw+g6ittAr+dIU+1k0fyCfnuAZGN7X7+31udxtaO6Sqoi
         xPrBY/0bzbHrLUNE19+ByEE2RSWry1CI44ku1XAlW1PtAjIH8WGDt9FUy5QRDzY/pv4f
         fWvPyNeBNMws87PwkYTfBYdVWWlcYaDRWvXsP1VoOCPWikhI8c1hzFdYKapNITx4aVXW
         sR9arFZcQdL6CPB3KeuuwSAL1fJkrQ0//cEREH/VY4KTgTAMfT8MGCARB05b7nC0h3pJ
         2a1Zkl4ZanErdy6a6iy5ebC2XbzmwvCuHc4EuUOFmjGGa7/UyiCDTDHnf+x8qKzY0/RR
         rJxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747842072; x=1748446872;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lvD+mNVQm/2jmSgV0usT3IDjfQuZhMOI7Av7SLu7jf0=;
        b=A7qfmjvWhNL0NoA4qOlWzppHxsFtavLAEpcOaGaoUe2uBlj/eHIzg5eGyTkPJVoDOy
         usB0xgH3WczunhnI/V0WT4r2nqZC4ajSWLwgOBb+lgPGLFmmSppL3ktd9mua9BZIz4dU
         T3I8BCrSntgz9mg9KoD9+PTsRx1LxLdNY/sP69DwS6wjBp//0I40H2FmAIvwy3yHr2er
         LEEhXWaTRsn1+CptYv7s+SGoIxSVJEoCvInONWA5GqDBKJ17AuY4EcJ2cc4hx58Kklhk
         EU+dPefDjRnTTyDoPlKdccJdO2vHZDnkltssY5mIweXCHalvqghpQY+kIyMnhZNgHn8W
         EKqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMn6kSg0YmoFZ/FM+pCDH2mLUmHLY78oTFJiogBH0V3IBny+3LRz7RFNa3XuEdviktGbPH1YnyNPAmJhE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy0KrJGlpiKumpgaKfW+m0Ql1K9nSWkpcv+BjmYO9KjOSnxvjhr
	81STHgM74tRBlVzg9dRFCUC7EJZZzYAnbM3JhtY38ZmuYtz4DVdF8ZNhysy2sjPZmv8=
X-Gm-Gg: ASbGncv7wu49xzA+ME63uejWL0uM/N5iyJ+nNcLYye4/L1Kwe5zCr+2fpnWNgihRWDu
	1uRfPBOQBy8eDP87WtaLkoxutvBpcBzsqpegsg0lIYf2/uNHcR+PQIyMHCBJnc0pWPzlfJLWnXG
	JFWme2RaDDEvUqIvqRPJdtfwOq687z5pNDSAOR5dQbbKd2rkt9vYYkQSG4q5It06FD6mXeyBp28
	dvVBblneTyRWtHpi/iLEOAiIleIaGI0M8RJdYzBhT1oD1p4jCNiCrAeAcYX6yD0a4xR5soIqR6G
	2F7OlcRgZ+nGmZuTKcjqyyHsnuBEgFHpfmOhGOFGcl5KE336
X-Google-Smtp-Source: AGHT+IF1a/jzMbO7F6gJPzIDd9TjYyvBG5uSioYyo5MOYniqFNvItm2zBIXk5D1DSiZdNl+D5LzuRA==
X-Received: by 2002:a05:6e02:1a2f:b0:3dc:7660:9efe with SMTP id e9e14a558f8ab-3dc7660a1b3mr97393735ab.9.1747842072167;
        Wed, 21 May 2025 08:41:12 -0700 (PDT)
Received: from localhost ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fbcc4af638sm2638635173.105.2025.05.21.08.41.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 08:41:11 -0700 (PDT)
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
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 May 2025 09:41:10 -0600
Message-Id: <DA1YAY60022M.2IRYOYRE5IEVL@brighamcampbell.com>
Subject: Re: [PATCH] docs: powerpc: Add htm.rst to table of contents
From: "Brigham Campbell" <me@brighamcampbell.com>
To: "Brigham Campbell" <me@brighamcampbell.com>, <shuah@kernel.org>,
 <linux-kernel-mentees@lists.linux.dev>, "Madhavan Srinivasan"
 <maddy@linux.ibm.com>, "Michael Ellerman" <mpe@ellerman.id.au>, "Nicholas
 Piggin" <npiggin@gmail.com>, "Christophe Leroy"
 <christophe.leroy@csgroup.eu>, "Naveen N Rao" <naveen@kernel.org>,
 "Jonathan Corbet" <corbet@lwn.net>, "open list:LINUX FOR POWERPC (32-BIT
 AND 64-BIT)" <linuxppc-dev@lists.ozlabs.org>, "open list:DOCUMENTATION"
 <linux-doc@vger.kernel.org>, "open list" <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250517210757.1076554-3-me@brighamcampbell.com>
In-Reply-To: <20250517210757.1076554-3-me@brighamcampbell.com>
X-Spam-Status: No, score=0.2 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat May 17, 2025 at 3:07 PM MDT, Brigham Campbell wrote:
> These changes fix the following error, which was introduced by commit
> ab1456c5 when Documentation/arch/powerpc/htm.rst was added to the

After submitting this patch, I've become aware that it's customary to
add a machine-parseable "Fixes" tag to help with backporting and
bisecting:

Fixes: ab1456c5aa7a63d5 ("powerpc/pseries/htmdump: Add documentation for H_=
HTM debugfs interface")

> repository without any reference to the document.
>
> Documentation/arch/powerpc/htm.rst: WARNING: document isn't included in a=
ny toctree [toc.not_included]
>
> Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
> ---
>  Documentation/arch/powerpc/index.rst | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/arch/powerpc/index.rst b/Documentation/arch/po=
werpc/index.rst
> index 0560cbae5fa1..53fc9f89f3e4 100644
> --- a/Documentation/arch/powerpc/index.rst
> +++ b/Documentation/arch/powerpc/index.rst
> @@ -19,6 +19,7 @@ powerpc
>      elf_hwcaps
>      elfnote
>      firmware-assisted-dump
> +    htm
>      hvcs
>      imc
>      isa-versions


