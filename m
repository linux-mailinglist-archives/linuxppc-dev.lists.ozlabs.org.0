Return-Path: <linuxppc-dev+bounces-7020-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE14A603E9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Mar 2025 23:05:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZDM4R5xNFz3cVH;
	Fri, 14 Mar 2025 09:05:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741903511;
	cv=none; b=iAd9CsK1onmR4OUo5xhEQCKifhFugN9CSmermmU5ma3VVX3QptJJQ8lsjbHREEOApy2X3AJoW/aO53NaAHgXJKnqc3JxE850B3hkNw3lslPE+dL/IDd+PByn/1BLcLQwrzxotwZVTXtBTE6D2ZAzKRuyxDjFoxWVgLdFDC0kcj2ggvI7I4Yrggoc1QMLVOQhRUwFBrwcQ6uN+J2vpMKH8+qHbcMs65cT7i+EA26kO3YgsZKRr1DDQrVlGh7viaeNNSia2PvWlhi2j8KjkJCBDizNz7iWxoGFCQy6FEBUi5uW46H2vRh0mOiaRX6eKvjmSJI4+gegQ6hxA4qZ2eC4xg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741903511; c=relaxed/relaxed;
	bh=IpuJBfj4YfOINR+VXZBhnhFTAoBd4mouqbTBAFoVBos=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=V7uxGG90xoHzNY8l9+3wLE6lnlx8OaPkygn4a0hzpx4od5Zr8QmM+kzNhNI607biUBIvbJdExq6Jlhufj4g0fpCvj57rpC3si2qG8nOIV5IW3EnyucVRLQMRQCOVrmtpVRCk5UnVL+1HKK8wryDKbDcsM0NEQzl8fjYk385vCgya+ww/2U7MyNnW2b7KPyJQs1zCRBPmSdLUnMENIIJqRes17o4DvorsgA0uT21e3L9uNGcTVi7r8eSYXRCiwJHGgouKwCkIyNSfJ9L1W8Pbi77zII98Rf3GuwKp7Gn+Hn/UfT3EeeqtVzn0m/sWToXLlbKJH8gQSXvdWImyhD+J4A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=vNslcPvd; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=vNslcPvd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZDM4Q2QjZz30Tc
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 09:05:09 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3BE875C5F70;
	Thu, 13 Mar 2025 22:02:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6615C4CEE5;
	Thu, 13 Mar 2025 22:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1741903506;
	bh=GxNzFgXlCVEFcpDf3VLptEglWoUTczleCr4VuzyQIr4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=vNslcPvdVPNB7E9fplso2uwQWydxF0LuafyC8Ekj6LJ17WeoKPzAu1lWUeLyq4wyx
	 YSG2VtnirdV4PAoDW58QNKBURHFBXAkymAmOjx0cdlO9qH75IKZQbVpmmhcAjZ7EP7
	 0n/ABlCGS0sNpOunuAQvLiC/vVhLZ4IVMsVmABVs=
Date: Thu, 13 Mar 2025 15:05:05 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Maxime Ripard <mripard@kernel.org>, Kees Cook <kees@kernel.org>,
 Alessandro Carminati <acarmina@redhat.com>,
 linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>, Arnd
 Bergmann <arnd@arndb.de>, =?ISO-8859-1?Q?Ma=EDra?= Canal
 <mcanal@igalia.com>, Dan Carpenter <dan.carpenter@linaro.org>, Daniel Diaz
 <daniel.diaz@linaro.org>, David Gow <davidgow@google.com>, Arthur Grillo
 <arthurgrillo@riseup.net>, Brendan Higgins <brendan.higgins@linux.dev>,
 Naresh Kamboju <naresh.kamboju@linaro.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Ville =?ISO-8859-1?Q?Syrj=E4l=E4?=
 <ville.syrjala@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>, Thomas
 Zimmermann <tzimmermann@suse.de>, Alessandro Carminati
 <alessandro.carminati@gmail.com>, Jani Nikula <jani.nikula@intel.com>,
 dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, loongarch@lists.linux.dev, x86@kernel.org
Subject: Re: [PATCH v4 00/14] Add support for suppressing warning backtraces
Message-Id: <20250313150505.cf1568bf7197a52a8ab302e6@linux-foundation.org>
In-Reply-To: <c8287bde-fa1c-4113-af22-4701d40d386e@roeck-us.net>
References: <20250313114329.284104-1-acarmina@redhat.com>
	<202503131016.5DCEAEC945@keescook>
	<20250313-abiding-vivid-robin-159dfa@houat>
	<c8287bde-fa1c-4113-af22-4701d40d386e@roeck-us.net>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, 13 Mar 2025 11:31:12 -0700 Guenter Roeck <linux@roeck-us.net> wrote:

> On Thu, Mar 13, 2025 at 06:24:25PM +0100, Maxime Ripard wrote:
> > > 
> > > Yeah, as with my prior review, I'm a fan of this. It makes a bunch of my
> > > very noisy tests much easier to deal with.
> > 
> > And for the record, we're also affected by this in DRM and would very
> > much like to get it merged in one shape or another.
> > 
> 
> I was unable to get maintainers of major architectures interested enough
> to provide feedback, and did not see a path forward. Maybe Alessandro
> has more success than me.

I'll put them into mm.git, to advance things a bit.

If someone wants to merge via a different tree, please speak up.

Hopefully the various arch maintainers will review at least their parts
of the series.


