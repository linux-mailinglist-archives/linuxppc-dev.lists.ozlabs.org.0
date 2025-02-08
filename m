Return-Path: <linuxppc-dev+bounces-5988-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D54A2D611
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Feb 2025 13:34:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yqqz016dXz2yN3;
	Sat,  8 Feb 2025 23:34:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::231"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739018060;
	cv=none; b=MdCvTaH+8CAvXfjUSuwZYdjhuG9E9uAFSARw8zksNWWO7AYZ2g+oxpN/nPNjhFsIQXwMb31ji0qO3oB7VaUN/Y6jkvYYkKAOROdssztQjbqA9nGC0o52YYc+FtujuhKOu3zQssvheThXTLZYl1DBS8qKQp4N3he78n+Zn0zzO8+Uz55BLCf8A7X74DctkZtRzvJP9CrF7o58xOhIr7c9I4CqHSZLLdcwvfNTM7PKXPOPKCb/NGO+SM2sSoxTIpOiuZPGK9Az41RwqwtW9E67/YxUGAMeK+XcW55yeMxUpH1PxFfWQMfLGlTHeS9I1LngwLDWMeJGSCdWg+iqyYxoKg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739018060; c=relaxed/relaxed;
	bh=7NtmFEV6HVkwd/iCjaBhvbggj+/ki/A/XgNsktxy7yA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MyZOAamC5c1oL2h/yUHXsFNzozh3bSFereF2ytNFDgxcVsi9oAYkE1NiJLsz3ebrKcOMfmb6dEKKz9dFcg9JeWdfQkn8p/kkZFrbteLRFBH3Acrz93kAveucSxr5qROQ0/JQWHUBWQ1Jx0fUtnHUjN3GXAcvr0W/cUeaTtC9IKMXBNNlQmioYG87DMDJTvd+IO/uKSureefFO9zsc96l7XSsmQlqVU0O7KGN4W14qkrsqQUI5jmBJQj4xHvkUKKXTsshUS3Osp0kqFXILHM5pr7UcGXW1fN9DK1pkxaPrPSoAQUekOE5IoIB+TT8zS98lAB2HCtbAGMvq2DnZxghOQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=I2hBrOEU; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::231; helo=mail-lj1-x231.google.com; envelope-from=tamird@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=I2hBrOEU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::231; helo=mail-lj1-x231.google.com; envelope-from=tamird@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yqqyy0DyGz2yGT
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Feb 2025 23:34:16 +1100 (AEDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-30762598511so29503361fa.0
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 08 Feb 2025 04:34:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739018052; x=1739622852; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7NtmFEV6HVkwd/iCjaBhvbggj+/ki/A/XgNsktxy7yA=;
        b=I2hBrOEUHe3eLp0YEqXbfmAjfz4M2Xyz7Las66JGVswyp6jv8gJHp3gTKxxsHNromh
         L0Gq0acM7E275IMsLwKB2eO+2h7e3OSut2uDqzDre/73AEJl/+20kqXURqAdriQcDyQn
         jCWuVhg/7gBIHZvGkBQTVFMkNH5nUuihIKKbKL/SW4/84paZtbyr/0C79mPqMld017zy
         RACkVR4lNAhjlaSQ3Q/EBgSOIDi4ror2MTrJFqCw1hvVzQfQeqDMuTVHxUgvs2tY9bxu
         51AAQuypWyDG62ya7fVugBL30MBvd0drv6cL0PuM9alqjbSucCgE1dc7XVAf3D7isVGv
         ZtrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739018052; x=1739622852;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7NtmFEV6HVkwd/iCjaBhvbggj+/ki/A/XgNsktxy7yA=;
        b=Cmpz086W7r8C9aOZ5pK2bZ87NxVFZBpDuhT4VjQC/ap+NdzISv0XvT4adOq/DtLojy
         ohu5VJZXl/Qq9nrpiMHXeGjbHFCB8kzSidgdDdD3DAOzrDPlJjAknbDYya7MWhFbNAMv
         pVza7LwHaJr1/Nh19f/Fjosw1QzfT5ddITYeicIMwCwNVYuJhzNbduPs2dYpIyioKPJt
         ZRLquajk9o9wgNwLJctLKZZNd3YJB05tgugj685E4S1N4GegJxrW3LGg2+swzN1RHUeL
         ToG+aN7U2NmnnHRSaO4oqeU8PX00NEdiUb499fdDDB34CtwnwwDfqdEOcBy+X2I2abxl
         f0iw==
X-Forwarded-Encrypted: i=1; AJvYcCUaJYB2UXfXYlVx4H+t0f1WLCSsurMiE6ohH+3TLUWf89QmNcC48JD+lwBnfMZFxZwfZW8zHqB6G835bD8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzEeM80MtdQ9IUSlPKluzzoKLsnp9kIn2VPvpxyZqI2nDLQBnAV
	kGvq2Ovp9InOEtJM4RTG4zAfjXLmXLitZuzWi9fnz46Gef/A31q0jVMPtXxWuVeW+qH95pXJR8T
	vh8YuTGCaTh6qAjtn4fdwvi44DBs=
X-Gm-Gg: ASbGncvBx3eD+bPxQ7YBGs+B542+r4017vv6SYzwJ27brS9szRGfU1ilvlNeMicfTNF
	VIfi7/cJtMPmOxMj2jw/t8uKAJwj8s6pVIFCSi3p40pnW8mWqam8nGsgA0VWaLh/p/F0U2qFBS4
	r5unRPOSAPuaQmGi5HegN+uUKxSfskOHM=
X-Google-Smtp-Source: AGHT+IHOVYZ6119BddUktzA6djJrY16tcFrgFxUAy4xskpPIrBDV/cXo8QbRQDOfCKTZHGOjX8eg/TALGJvaLhNy1Bo=
X-Received: by 2002:a05:651c:199f:b0:307:dc1f:e469 with SMTP id
 38308e7fff4ca-307e580c5d1mr23625221fa.20.1739018051928; Sat, 08 Feb 2025
 04:34:11 -0800 (PST)
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
References: <20250207-bitmap-kunit-convert-v1-0-c520675343b6@gmail.com>
 <20250207-bitmap-kunit-convert-v1-3-c520675343b6@gmail.com> <CABVgOS=W3Wny0q-Kpj6P1ZXyG1R_HYCrPLtnHiuruW9FxoHrfA@mail.gmail.com>
In-Reply-To: <CABVgOS=W3Wny0q-Kpj6P1ZXyG1R_HYCrPLtnHiuruW9FxoHrfA@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Sat, 8 Feb 2025 07:33:35 -0500
X-Gm-Features: AWEUYZnxmpKkzSNj_ExYRdu7y-yKEMYavEZgdMaiYXQTRBuM3t00g7LqepmE3D0
Message-ID: <CAJ-ks9mTAp0UwRViKHYqfFV+qkgi89=pNxiQOZYmHdYzkJ6Wcw@mail.gmail.com>
Subject: Re: [PATCH 3/3] bitmap: break kunit into test cases
To: David Gow <davidgow@google.com>
Cc: John Hubbard <jhubbard@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Shuah Khan <shuah@kernel.org>, Kees Cook <kees@kernel.org>, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sat, Feb 8, 2025 at 4:07=E2=80=AFAM David Gow <davidgow@google.com> wrot=
e:
>
> On Sat, 8 Feb 2025 at 04:14, Tamir Duberstein <tamird@gmail.com> wrote:
> >
> > Move some tests into `bitmap_test_cases` and parameterize
> > `test_bitmap_print_buf`. This gives us nicer output in the event of a
> > failure.
> >
> > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> > ---
>
> I very much like this cleanup: the static global 'kunittest' was annoying=
 me.
>
> I think there's an argument to get rid of tc_err() entirely, and just
> use KUNIT_FAIL directly, but I'm happy either way: it is a lot of
> churn.

I'm happy to do that. Pulling on that thread ended up producing a nice
cleanup. There's no way to add a patch to the series without sending
it all again, is there?

> Reviewed-by: David Gow <davidgow@google.com>

Thanks for the review!

