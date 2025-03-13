Return-Path: <linuxppc-dev+bounces-6982-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D64A5FD40
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Mar 2025 18:14:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZDDdX3gtpz30Vj;
	Fri, 14 Mar 2025 04:14:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1031"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741886096;
	cv=none; b=hqr9e/tmLmttWE7/zdTPaa6u/uFQTWxMDqhYJBoWBaM74vjgHb3hTLCHmAb/3dhU0PTmhpMwiuTEBj19ODrrzh/vqv/AHr/TNvpuj4n1YmYw+2gyPTBcB1PU7Xx09ARFKDHcNbH9csTRErsmTxqTN07KEavRlPxENV2WzfuDMZkD843uWSJh4sfoagpkflBwBZq+FB/GJD8BK5L8C3jqLQr0/wprZqb3M7i0AutooJQOj1R1AcCMjg8to+AkN9YI9ehMlE10VefmfJVGkam9si0wW6yWritMGiP1ZhxDVozRz+m5BPXFwe6/igiNdnNcl5CwNVlWS1VIGuSoMlUuxA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741886096; c=relaxed/relaxed;
	bh=n3DVX2jUUT8USovuBtaAWfLwoCZG/vTo0soqbEn/R/c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lZo6cb9v5i0cmgtVQ6NPXbJUd5xhNsZaY7mv2tUnOxccYXNvvqXyghW6e73YpVj+v5ZFGYh/pMK5YvKbDx9h68YbC74IfvQZ6wB944yIHAfblKQIRzsM/6XO4KlJVHwVjOuAYyjTs7Gs5kIYtI4EGawrpsQb5L9bPTNKgZHyNCLikNexQDSIQxI/SG89+qaOjmYTqNHcWwcCVy9CYbUqOpz3t9ph+Pf5cl4KVmiErD8/otq7mjF4Saz8JCWHHmXHowP+qE0LdGXj7NwfQjlgloaji5s6XgRnKSKVdWk8gU3+qt4lNM1k3oW8Q4mhrZZSC+D6BBDXyAvw0Y0NM1HU8g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cD3Tp3SF; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1031; helo=mail-pj1-x1031.google.com; envelope-from=jcmvbkbc@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cD3Tp3SF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031; helo=mail-pj1-x1031.google.com; envelope-from=jcmvbkbc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZDDdW1z7pz2yjV
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 04:14:54 +1100 (AEDT)
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-301493f461eso756322a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Mar 2025 10:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741886092; x=1742490892; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n3DVX2jUUT8USovuBtaAWfLwoCZG/vTo0soqbEn/R/c=;
        b=cD3Tp3SFZM2vYiDQMi2K2HkcgoPfKwtDATdnN6oikFNXHbXPPFuPe+cP9LvsdmJs4y
         RBhZ7UVzyWzS6FdEUxfh+S06t0EIHGGFITnhhnCAPAFkiMJkAvzPxChIRd7id/k9VuzP
         pyggRbxC8b9HR+338+6VhXv6eqVZGx4UIKmaymEcZMUqHaZlDRD1QaWHiBTNaByJIa/R
         J7deabTG9gtNbZExAulvlhHknYNZjUe1f/xdp1CN+dKcwi1h6a0nP06/2K99KdmZVfNj
         txu4LlXD3FSWJENnIJQIx30do7RMaxzPp5JjpbspGA2z6M234ACpqHgDcT86MtzHAtY3
         9wCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741886092; x=1742490892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n3DVX2jUUT8USovuBtaAWfLwoCZG/vTo0soqbEn/R/c=;
        b=W3DjF4fpXNhxavcy+g4WY6u1dwesHi3lUA/un50pvsj+ObeVpTFy6OxYgJPOdfBvSo
         dHLLAjFHX7JZWP9P/GQpCZubCMbBZuCT4ipOQyxBEQiqFvHFNfz+AXmOLARRuwgiZhaU
         prd+HQJ3nQOfllktOEDkYqZMJMIR+ewoW6ApCZdQNLPNGkg6I2ryZHknqacMl8vSrSX7
         9zweZZ8+oP0OVb4xggR8215qiJ45w9z4Navy4AWedI9HES+be8UliXmUdmGYiYCkkdN/
         o+FYxPjgeMYcFcl9qUuK5Hhc5LSOlVrvKhDvDSDAhzFeiBdHMkpfI8yBuP1ciAXLRyYI
         BzeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUr8mKVk9SP3rh8SudsT7CHkHn/kwqBGYq9gS6GvcAOivmS5pqnOI+m4hIH+5ZBgx1gPA0/Xr/nUcq4kmM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwIv1TC8rNKzzc1PjA+MLTZCrw5roBIH4b0zr0BnZgIUBuGP/qw
	0lHgVlbypShCjoyJeL+WeE9DHmA06ny5j0dlecW/Sm8hC/YmaaEf1drEc9voaBYu3ySU3OIVTzg
	xt4UG5UI86EoW9D1WaRyqLFb+kkQ=
X-Gm-Gg: ASbGncv1v5rkez96ze2VyFaVLNlIDREEt+9l4XYYdzrXKKDtHk+RKtYHQGPhZFeZkr1
	AMrexK/pIzFbXEr++P2r8Qv5UDqFH//sTdDRmE5tyhmFc0T7BMf3LhIrGMQH32/icTYstwmkDVT
	A8AwTGYLEjAwQc2iE6A0LoqK0wGCE=
X-Google-Smtp-Source: AGHT+IE1qRePjrPlGe/k7DXmrY+KtJaOvGWQ1A7tyU5eLBTz7VxuSMi4hxEC/EMElopjpnT6L0bRBsC6lDv+GByhQbc=
X-Received: by 2002:a17:90b:5608:b0:2fe:b8ba:62e1 with SMTP id
 98e67ed59e1d1-3014ea24aa4mr365923a91.28.1741886091572; Thu, 13 Mar 2025
 10:14:51 -0700 (PDT)
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
MIME-Version: 1.0
References: <20250313135003.836600-1-rppt@kernel.org> <20250313135003.836600-9-rppt@kernel.org>
In-Reply-To: <20250313135003.836600-9-rppt@kernel.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 13 Mar 2025 20:14:39 +0300
X-Gm-Features: AQ5f1JpOtVR6fLnH8b4t6Wo35MeP6GXSndMXHGPmpker_QqVMpVf1FbK9Hm_3_Y
Message-ID: <CAMo8Bf+_8QdcWmk-k6dpUUnvVtVsYCgcviK+fF=CsKjT3nFxHg@mail.gmail.com>
Subject: Re: [PATCH v2 08/13] xtensa: split out printing of virtual memory
 layout to a function
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Andreas Larsson <andreas@gaisler.com>, Andy Lutomirski <luto@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"David S. Miller" <davem@davemloft.net>, Dinh Nguyen <dinguyen@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
	Guo Ren <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, 
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Johannes Berg <johannes@sipsolutions.net>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Mark Brown <broonie@kernel.org>, Matt Turner <mattst88@gmail.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Michal Simek <monstr@monstr.eu>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Peter Zijlstra <peterz@infradead.org>, 
	Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>, 
	Stafford Horne <shorne@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Vasily Gorbik <gor@linux.ibm.com>, Vineet Gupta <vgupta@kernel.org>, 
	Will Deacon <will@kernel.org>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FROM_LOCAL_NOVOWEL,
	HK_RANDOM_ENVFROM,HK_RANDOM_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Mar 13, 2025 at 4:52=E2=80=AFPM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
>
> This will help with pulling out memblock_free_all() to the generic
> code and reducing code duplication in arch::mem_init().
>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>  arch/xtensa/mm/init.c | 97 ++++++++++++++++++++++---------------------
>  1 file changed, 50 insertions(+), 47 deletions(-)

Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>

--=20
Thanks.
-- Max

