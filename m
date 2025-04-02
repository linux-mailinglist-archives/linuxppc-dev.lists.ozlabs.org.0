Return-Path: <linuxppc-dev+bounces-7423-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DCAA788FB
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Apr 2025 09:42:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZSH0B5tpsz2ySX;
	Wed,  2 Apr 2025 18:42:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1:d65d:64ff:fe57:4e05"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743579770;
	cv=none; b=hQNugGgw86YFgO/x90bHo83wHGuSvK0EpqgP5Tw+cBb2CliZyVfca2LsOdrqKfiQTaxyvyW2I5+EwsmBiLpJNj5D2PlIkrHeNVFhJmt75PLzgnYziyrSQfo9Qc6crejG2jj0eY9FmysUGfom7oR7sWqHrX/xG/C2dyNEhcdL5lJ/qISUReESg3yQ4yODQYbBISKx8sN6EPzenGO/8SivAlMz9bOX35jBRcAbaYSquTSte4Uyf6bhh6zEB5cEMWKbTcegefKhMSGertnYcLU8TyI/eTrYzkM+Ae96QaMk5IOzB0JgELzEI+JgTBJHMPR1uK9rcCx1uU+JRaPDgeJmVA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743579770; c=relaxed/relaxed;
	bh=uwSUjXhnpPVALtfn6H/0Ef+Hu/5PlKbVNs0zSo5MJgI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e0whR8NoW8WattB2x3FeI2O5CESRK4vm+PrPvWB3/WTxu/5eOEvJ42B+0XFGuK7ZWOmJRVoHp/ioKSOcuHvXaFgx24v0BhvEaUzZy6ivHx6GHZFruZCEjCTBrtoULawJcdEpjIzQW5ZFnKMDrAKq3ihacn/4yd2/tZOz9A6BiFWwtn6cDa0TfmgfnU0uEWMBBpKuIhdMs1oZRhDkL77eebeYZUk2dEeGKd+3/7U9Igw1IH74vozRn1Muz0s7869G7Wn/+mD62mj9rbHw0yUEkt1CPyWJRo/MwKa0TWpWpWH4R2J660DaN64I49mWHH7jYhWpkdO9I6TzIxdTZXl/Ug==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=UbgPGhXY; dkim-atps=neutral; spf=none (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=UbgPGhXY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org)
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZSH061Rgqz2yRx
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Apr 2025 18:42:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=uwSUjXhnpPVALtfn6H/0Ef+Hu/5PlKbVNs0zSo5MJgI=; b=UbgPGhXYcAW7Ecq25uYBAa81JB
	YejYfLTgWYPRfCDH2TETkjUUcMvwoBl851u/SlwbYNyM+yFIyh1vaxj3MsprEfF1FK26n5zhpDDHd
	0RYGNmo+SUBtmS4ReHBp3tzeFKK0va69/75S9gYtFYaalaORY5Hw/o8guEL/XrRBXYj8AEbukW2Md
	LGryWJxcZ1Mzcn3518Ul0AimhzGe/TBpi+hQ2z98XSyzcgUfOVyd2mTc3oBmaQQd81PMoT1r62W1T
	CuUM7rCOZBxmcgETDmqQzITfoRPWmm3VOCvo6KMNAoKgoYfkVSHQQuqvcIPvXatsDpO3fjOfsgBNA
	eJdGDGWg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzsjs-00000006zGs-2jZ9;
	Wed, 02 Apr 2025 07:42:21 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id C032230049D; Wed,  2 Apr 2025 09:42:19 +0200 (CEST)
Date: Wed, 2 Apr 2025 09:42:19 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Alessandro Carminati <acarmina@redhat.com>,
	linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Kees Cook <keescook@chromium.org>,
	Daniel Diaz <daniel.diaz@linaro.org>,
	David Gow <davidgow@google.com>,
	Arthur Grillo <arthurgrillo@riseup.net>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Maxime Ripard <mripard@kernel.org>,
	Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Alessandro Carminati <alessandro.carminati@gmail.com>,
	Jani Nikula <jani.nikula@intel.com>,
	dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, loongarch@lists.linux.dev, x86@kernel.org,
	Linux Kernel Functional Testing <lkft@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>
Subject: Re: [PATCH v4 06/14] x86: Add support for suppressing warning
 backtraces
Message-ID: <20250402074219.GP5880@noisy.programming.kicks-ass.net>
References: <20250313114329.284104-1-acarmina@redhat.com>
 <20250313114329.284104-7-acarmina@redhat.com>
 <20250401170829.GO5880@noisy.programming.kicks-ass.net>
 <ddc7939f-fb98-43af-aed1-0bc0594ecc41@roeck-us.net>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ddc7939f-fb98-43af-aed1-0bc0594ecc41@roeck-us.net>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Apr 01, 2025 at 10:53:46AM -0700, Guenter Roeck wrote:

> > > @@ -92,7 +102,8 @@ do {								\
> > >   do {								\
> > >   	__auto_type __flags = BUGFLAG_WARNING|(flags);		\
> > >   	instrumentation_begin();				\
> > > -	_BUG_FLAGS(ASM_UD2, __flags, ANNOTATE_REACHABLE(1b));	\
> > > +	if (!KUNIT_IS_SUPPRESSED_WARNING(__func__))			\
> > > +		_BUG_FLAGS(ASM_UD2, __flags, ANNOTATE_REACHABLE(1b));	\
> > >   	instrumentation_end();					\
> > >   } while (0)
> > 
> > NAK, this grows the BUG site for now appreciable reason.
> 
> Only if CONFIG_KUNIT_SUPPRESS_BACKTRACE is enabled. Why does that warrant a NACK ?

And isn't that something distros will want enabled? All I'm seeing is
bloating every single UD2 site, and no real justification. As Josh said,
this should be done on the other side of the trap if at all.

