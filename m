Return-Path: <linuxppc-dev+bounces-2300-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C31F499FC67
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Oct 2024 01:22:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XSqrd1Q8Kz2y8r;
	Wed, 16 Oct 2024 10:22:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::12f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729034561;
	cv=none; b=UMNuWADZu+Gph+Mk7s1gyQZdKlI18bFbTGwhkvVlEG4wDZ1L1v8jsbvf+H5uzDP1Ut0AwvFqxU481c8nVsnmzVmh7RVYJaY3hO52FZFPpxU4dgKh7QseReQ5Xzneq5aI5/6ZvkZjEFOPYQBbKhjGO9r7Js9GIobJy7j24eqDfmqocNVzyYyw11bkzYiPGm+Q15oUDHrCK+c9DAvx6TOeD0MY7OfwN+58czwOXErXQsOWT/YtmO/iJStvcxuHffUP9jKD7zhcOWloYhh+hBgHDwe6yqiSO4PglBSgWlJKQb1NCHGc7IgMclPByaqFdegpkfSK73zOj1Dl1I2O7TzG9A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729034561; c=relaxed/relaxed;
	bh=9RUvHKuEBPAnu6MBocZm6vLF52qHvXQbIHH1GlTyCVw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KIs9RclxMeEe/wEYpvsSah2RUCF3EqrTkIhE+iaNiJHDPlpVJBS1dy9FPccYauX8N6s0tyt3KZEY9Z78KPI109NCP4Al2HjZIb1N0Q+FcBaZYTmjwBJ9TbHo7bj4M/8Mgjsbc7Jgsf1dkHNWTCFbC41nLFoXlzpVJftu+J25519Lrj4vNQ5ZI0z/mzV2xTOaxuUi7op95PMmfjyVqIIGVrHWE0AIGBqheQVWmSLfM4RaqiiFmbOcWilBN5iljyNCwhjuna+x1Hr2nBlJ9w4I5SOxLiRGv/Rvk8OMbuke32QRNY5hOuerxR9S2s0nWj7nR4Ufd83gZSo6ySJLmSxQHg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=m0g9/D0p; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::12f; helo=mail-lf1-x12f.google.com; envelope-from=mmaurer@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=m0g9/D0p;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::12f; helo=mail-lf1-x12f.google.com; envelope-from=mmaurer@google.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XSqrc0Fs2z2y8W
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Oct 2024 10:22:39 +1100 (AEDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-539e681ba70so2003e87.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2024 16:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729034555; x=1729639355; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9RUvHKuEBPAnu6MBocZm6vLF52qHvXQbIHH1GlTyCVw=;
        b=m0g9/D0p6HIuLx4qho5+M8ggMp/wpxVb+OvFS9FXxtHcP8An1bzUibirhAkVhs/4db
         JgecIZ0goOHK6nh+EZzZXY+ho+bB2/aUn1zkjsQNF5aI0XVL1S6dcQ8Nw9h/MS/owefm
         Yb61a/U5h3Dodph9WaC2rrm+Wf2MrIMn+2ugHaApQJgMI/5mVFXfxllbYMfkX4cKKqE8
         20k8DEyTHxUnwJvWwlABsRU+b31I/fMnbpVGBPnSjtmMK73SuOqDjwC1qjdTvB3fYYkh
         QHcRNPz71zrg7eLsk+w1+hZYcHN0wgTsMgfw2lVLJ+JiMLajdwqyGX5mtBiHm4ynhlyp
         WLdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729034555; x=1729639355;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9RUvHKuEBPAnu6MBocZm6vLF52qHvXQbIHH1GlTyCVw=;
        b=j3JJIjgMJUa5bhQE/2HI9OvSLVk4azv43FmDptl378JEztCf8IN1qhEuZPUpw23Cf4
         ErlbF5cF0jxinCOF/aeaZ2XHRvpOWJMl+DMXl7ZR6nQ4w2ZabbBhbjNgWjknyCMBjJ5W
         G5EX3rqGuBSrDA502yirPh6F0kAtl4MrRlikqXyxGSJGb2dGjwQlz8cI/yy4TrA4//ad
         si5rQQlllQ/5nLOHHtM9Hu7GxesvnSPOoY1UUVdumecHjnfa8JTXqCl7c/ZNHZDCDLYU
         TXIqb2q15xGx4zLAI02tktbMUKG1VRrbszIjf255bVDWzAdSbPXb5Yobv8GUXsekyfdR
         Ypgw==
X-Forwarded-Encrypted: i=1; AJvYcCUbEhC5NHAtu5HC+2WKypo3haXpiPH+md/w6N1/LKCUYuzHurOrDrpf5opQ3mZu/ZoWPTy1vMF0yvbL3Qg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxQ7rPyrWDALOMsugweByEjUBYZ0nKrKUFSWqoVVbE9opiCm7HB
	hRHG9duEkfinnqL4xxbudFWD3TaRWErI2/mytnrV9cD+T6RGRhxNDNdK1V+liaRVKXEZOjJouOs
	+hLfZvDsfTlK3C4azlYIdda2p6EXs58fK3MiV
X-Google-Smtp-Source: AGHT+IHGh6PUQoy8hght4ieDSeR+Tsek80+k3WjbTEsufsVtjnaI+27i1yToDuq/77zg6Ww2K7PJe7qX4qx5sJCsaJo=
X-Received: by 2002:a05:6512:1592:b0:538:9e44:3034 with SMTP id
 2adb3069b0e04-53a04d02628mr174009e87.6.1729034554499; Tue, 15 Oct 2024
 16:22:34 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20240925233854.90072-1-mmaurer@google.com> <20240925233854.90072-15-mmaurer@google.com>
 <ZwmlEYdS0aPVF32k@bombadil.infradead.org> <CAGSQo01o4fWYwSzZHX5dyTUKcaCSZ7z-hPQ8w63tgBPGbM_UCA@mail.gmail.com>
 <ZwmnnMmqVWLaelvQ@bombadil.infradead.org> <Zwm4lXdKB9RfPQ5M@bombadil.infradead.org>
 <Zwm4v_1wh5RwuHxF@bombadil.infradead.org>
In-Reply-To: <Zwm4v_1wh5RwuHxF@bombadil.infradead.org>
From: Matthew Maurer <mmaurer@google.com>
Date: Tue, 15 Oct 2024 16:22:22 -0700
Message-ID: <CAGSQo03df-tnmwcz4nh3qtuQPKQ2zLHW0juQyKUXGsdeS7QkLA@mail.gmail.com>
Subject: Re: [PATCH v5 14/16] modules: Support extended MODVERSIONS info
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: masahiroy@kernel.org, ndesaulniers@google.com, ojeda@kernel.org, 
	gary@garyguo.net, Michael Ellerman <mpe@ellerman.id.au>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Benjamin Gray <bgray@linux.ibm.com>, Naveen N Rao <naveen@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, neal@gompa.dev, 
	marcan@marcan.st, j@jannau.net, asahi@lists.linux.dev, 
	linux-modules@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

So, the basic things I can think of to test here are:

1. The kernel can still load the previous MODVERSIONS format
2. The kernel can load the new MODVERSIONS format
3. If we artificially tweak a CRC in the previous format, it will fail to l=
oad.
4. If we artificially tweak a CRC in the new format, it will fail to load.
5. With CONFIG_EXTENDED_MODVERSIONS enabled, the kernel will build and
load modules with long symbol names, with MODVERSIONS enabled.

Is there anything else you were thinking of here, or are those the
kinds of checks you were envisioning?

On Fri, Oct 11, 2024 at 4:46=E2=80=AFPM Luis Chamberlain <mcgrof@kernel.org=
> wrote:
>
> On Fri, Oct 11, 2024 at 04:45:25PM -0700, Luis Chamberlain wrote:
> >
> > Also, just as I asked Sami, coould you split this up into patch sets?
> > One with all the cleanups and elf validation code shifts. And then the
> > other code. That will let me pick up quickly the first patch set.
>
> Oh and if you can think of ways to enhance our test covereage on all
> this as I noted to Sami, it would be greatly appreciated.
>
>   Luis

