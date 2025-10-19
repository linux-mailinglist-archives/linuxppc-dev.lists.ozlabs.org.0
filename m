Return-Path: <linuxppc-dev+bounces-13048-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09EB8BEE058
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Oct 2025 10:11:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cqB8W6cxyz2xWc;
	Sun, 19 Oct 2025 19:11:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b12a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760861467;
	cv=none; b=Ay/OTbA9mp9AQvqW0w4qaEdWB6nmSjQiVEbPu1KgG2Iw/sM+dwLfzW+RILvpgwFOCBn5du1gRj9mwmxk/79d/Gz8deaQyp8nT1JQ1Cc0+T/3CHEaqvdUaqJvAECRrcMcLlk0RrDLd91VJ2WSFd+Aftg29eoEvXZBBiZlpCix7eytYxnUB22O2yfZUM8PBnYiDH/+lrcMKAhwFnniAyjHF9Ddkult+tJZyUwrHwyFt2e732+xNH/f7URu8hAN1RFKp1+U9uEJT+WeAhZ8RP44fTbF5aldGSpRinTWWznd1NNIJjTpHwpjYSm1RjZPj3gwSySfmpqaRr9Gs2w/J5wN4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760861467; c=relaxed/relaxed;
	bh=0JD5EhU3dMvt2TzDGGngYx4VWjKCENlPlTrXXievwr0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Av+p+J+RVRVxbow4TC7CbWgEL2EyoEuQb8Zpb/z8yKAGlTg904o/aed4WQCIkluq+NYu+sgH+p39V86YWoY4iq28f34T0GZ+WMHM3AnCkHA8cNpxrDa6k/YRO3ekXtJ0nl3H62Yai/iQuwgDFdOxBA3Qq4PbUJgmj5T3TuUJ7Necc6cPv1qOJMIq6XBJ1CKrmicTbUUhkcimhUZIBxN3u/8SDWJU4jGty92qfYBJ+vDyNHjDBC0WXd7JM7/ISoOURImM09kEanbUfS39pCO/lDN5WrwqISr73WdE8E5DSVyeFPzN+zS4uD3FMQkQYkeUWU7Xo58N5dUA3pdiI0tCig==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kGl0r7rK; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b12a; helo=mail-yx1-xb12a.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kGl0r7rK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b12a; helo=mail-yx1-xb12a.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yx1-xb12a.google.com (mail-yx1-xb12a.google.com [IPv6:2607:f8b0:4864:20::b12a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cqB8T5207z2xS2
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Oct 2025 19:11:04 +1100 (AEDT)
Received: by mail-yx1-xb12a.google.com with SMTP id 956f58d0204a3-63e10cd6efeso2988129d50.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Oct 2025 01:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760861461; x=1761466261; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0JD5EhU3dMvt2TzDGGngYx4VWjKCENlPlTrXXievwr0=;
        b=kGl0r7rKI1B1iwz/lC8Xd2oFLFMty8Brw3Owb2IZhjdB+OUJ18XBOHCzZi1nFj2e70
         Y6zT5UkwjLq7dY43/vsrCN6+hNM/zOWE30qtBrwqvH6Mr2Ytch9xh7yI6Oyh8Jk3oL+6
         VfOeDyy2eL9b3CChZfDAwtNSDaluYAjXPI6frbeIO0WrAJFxvxj2hdXrimkkgPhmcn7l
         pPozCbQesslMgI5Ziqn3UNdy2Kmi4Td2kj5Far1iYKEcE90Iv2xlOvK+i1hm6c8T5jVc
         h9Dj8K/8fbEo0OqphG37mQik9rVvQLki8swzt48Ygd9tZoj8oeS84mLcoOEWbjajEI5E
         /2WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760861461; x=1761466261;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0JD5EhU3dMvt2TzDGGngYx4VWjKCENlPlTrXXievwr0=;
        b=jUzBDLsw3z0zQD0IFdQijZvXjNn2yDwnmpZjh5z1t8o7qsph2fXD+SePCpG2nGXP5S
         txswZNqh48JUkdVxBdb68JSimTxc68/nyN03TDd/k/H1FXko4KzJ6q9thn1ATglmSRnX
         rZtJm5mqBzA2RDTu0fzErxVQ5TmdJV+wyqHTEgd9cFITw4zPRxTkFXjS4Y6zquGm8iqD
         jkDUm3PEv31RivUPBjGCWw1YVIVxSnA76u3FszJcirvUn+LN2OB4yf0tBWHqyX3YHXmv
         kX4sZmDqVUNqfsSqes21EJZ2Rrr+vxDCcMapGXicMAIbe9Y7sfNmx3FzouTCIvaiILGG
         mpJA==
X-Forwarded-Encrypted: i=1; AJvYcCVeQN30rqQXZ7E3zIO7Kj/0M4XReps43urPwV11wONJX4SKr8/Cv8xSQ5CLEoVVAXUkHKv49As1Yi4Jp9g=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw0tnAKJDihPVnGzP2Khm03pvzTOMx9G7mkpyGk5F12sV3v6D+p
	CdRrLam8Gq792DoBa46iVEUpBfNfEWjqd+oLXn+j0wd8Oh6TxVGMqXceurNfksRvOs5rkdK5POE
	EyWdt8wF+vDWpX+jDht0KdkTsglDhSbM=
X-Gm-Gg: ASbGnct9YGlnbbalnA5vlmL7jnb5iJ7RvsdXjXdV7jS9Lv6ikdSgW0bAG8lrLbIl07J
	Mr/f2oLdIDuBqCglh4Q8pcJAuNF26+4flkfa918RPVf1yyODcSZpKQUH0oxPHUDPsEaiGjdsVo4
	jmRBKeMXSxJg0jP3DcdDBQiE0S4H+v5fDpX1c8D76IDoHnPTpUamueOye3X3+rvIeMAzZB/k7C1
	QvkAYJA4RqiffKsghbUeoHMJmaOd4IYE3yEbH+2c88gtPhwLNaG/8kdgiJ30JeyrwOUrpDAxcA=
X-Google-Smtp-Source: AGHT+IEDp/usYEtVSaz10lwwm2/rh8YYcBuxag2F0nuBjSfSMoio/EijPl9t2f1PGKCDHr/mRoxnx6oC2CKJ7h3r2Ic=
X-Received: by 2002:a05:690c:31e:b0:782:9037:1491 with SMTP id
 00721157ae682-7837780ba2dmr109813007b3.42.1760861461100; Sun, 19 Oct 2025
 01:11:01 -0700 (PDT)
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
MIME-Version: 1.0
References: <20241202010844.144356-16-ebiggers@kernel.org> <20251019060845.553414-1-safinaskar@gmail.com>
In-Reply-To: <20251019060845.553414-1-safinaskar@gmail.com>
From: Askar Safin <safinaskar@gmail.com>
Date: Sun, 19 Oct 2025 11:10:25 +0300
X-Gm-Features: AS18NWAhDVf2aU8hB0qWERPwO9zi-ils_dPukaoQchmqqRauvEb3B93Zz-69KFg
Message-ID: <CAPnZJGAb7AM4p=HdsDhYcANCzD8=gpGjuP4wYfr2utLp3WMSNQ@mail.gmail.com>
Subject: Re: [PATCH v4 15/19] lib/crc32: make crc32c() go directly to lib
To: ebiggers@kernel.org
Cc: ardb@kernel.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org, 
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-scsi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	loongarch@lists.linux.dev, sparclinux@vger.kernel.org, x86@kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, Oct 19, 2025 at 9:09=E2=80=AFAM Askar Safin <safinaskar@gmail.com> =
wrote:
>
> Eric Biggers <ebiggers@kernel.org>:
> > Now that the lower level __crc32c_le() library function is optimized fo=
r
>
> This patch (i. e. 38a9a5121c3b ("lib/crc32: make crc32c() go directly to =
lib"))
> solves actual bug I found in practice. So, please, backport it
> to stable kernels.

Oops. I just noticed that this patch removes module "libcrc32c".
And this breaks build for Debian kernel v6.12.48.
Previously I tested minimal build using "make localmodconfig".
Now I tried full build of Debian kernel using "dpkg-buildpackage".
And it failed, because some of Debian files reference "libcrc32c",
which is not available.

So, please, don't backport this patch to stable kernels.
I'm sorry.



--=20
Askar Safin

