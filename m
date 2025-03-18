Return-Path: <linuxppc-dev+bounces-7186-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7ACA67891
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Mar 2025 17:00:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZHGkm5ZxXz2yrn;
	Wed, 19 Mar 2025 03:00:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742313600;
	cv=none; b=afhGUUJT8kgiseHCmD4RUmEMa5U41unpqIykz69Q8vyOsCJOBfbuLqR1JAGWyl6D87qaVeZH24POotVXFRhBhJxDEQZI+rcFVCJkn7UekzWXCfWJ5BwvN7runfL9lNjMFXR/MgxL8Uyq2OMNmFohURz8Z8+nnmKPpVQuJ+a/0Z1qJIs1cxcPulkdS7wXNdLzKm7opHfbpSVcLHUML0F+gFvqaXFaB4rYjg5vB7IA0zzkWZOr8riz6mlO8JYq2AkprcBmAU1GYO/LthwKPyhQeh3ytGge/nQiQpDhrYmZtIx2U/aZGbzScNGsfR/rRDLJiILADW5VUamL34kfDguCKA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742313600; c=relaxed/relaxed;
	bh=p6WgKHelgX9JOsT4r9mI8xTUND7NkMENhri1IGeItcA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y8EnStB3e/1WVakIZHKR59I1fFAQvy5VIiPHYTZF3goOlarotgFUJIwdFh0/zhX/l0PS36DODGaGRFmY6hzkGgmrOFrJuUVf/KfTVu7k8I0sNt7+KQdmUTn0zzAbngZRJ4x3Nm7X5g9UBYZh4AhQYShNfSmSuiPrRaHdgwa0s5w+pmrDyT55i+4Qo5M/Yeg/NKD5ATfxGydHOUXmGOXJeZOb3YYnp2SjiDksO0bsDltRDJOTac2xwePCTO4fCbVvDqIZmWorYWjpOJ52+CvloCRYGsU8Lw6eGu8mAIFaMZ7zjquDgi29RJ8aeo6mRf1FnDsCKXJr+nVJqDcUy4Mcew==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WVHlHUak; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=will@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WVHlHUak;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=will@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZHGkl4tBRz2yrl
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Mar 2025 02:59:59 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E9BB8A48A95;
	Tue, 18 Mar 2025 15:54:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58FD2C4CEDD;
	Tue, 18 Mar 2025 15:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742313596;
	bh=wnqlTyxAgZ8CuVhXT9duPOO4NgjQBjimZKlWtsOUGPY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WVHlHUakLlfN9xeuBYO1EJf+5CyU+WJKRkilNy467a1BnupPF2HSzG6De1fpXKFV+
	 ix9jYHBoyySgyb6uel1Y6KTQEzU4+Rwm0HghzRyuSjF71hbCSnTEGnernC5xUEtu10
	 +UeOIc/V5TKw7+jkC51H/NeBuaIOzIXiqjJlwYzUGV3n3dFHQ9MxYqNWDakJi0E6hg
	 3eBuUyUh9Yz/C8EPNMpPnQhIe07ID+3WJ5N3wJyQiVpq4Skm6z+pxWjAjp5DobEjiB
	 6Jrg3x/R+DiIvD5NG4zUjWrrB/2tNu1hT+SvmfpVy3qQGAt9drIa3KhZDqAUmDABl/
	 j7eCAm37AJZIQ==
Date: Tue, 18 Mar 2025 15:59:47 +0000
From: Will Deacon <will@kernel.org>
To: Alessandro Carminati <acarmina@redhat.com>
Cc: linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>,
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
	Guenter Roeck <linux@roeck-us.net>,
	Alessandro Carminati <alessandro.carminati@gmail.com>,
	Jani Nikula <jani.nikula@intel.com>,
	dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, loongarch@lists.linux.dev, x86@kernel.org,
	Linux Kernel Functional Testing <lkft@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v4 07/14] arm64: Add support for suppressing warning
 backtraces
Message-ID: <20250318155946.GC13829@willie-the-truck>
References: <20250313114329.284104-1-acarmina@redhat.com>
 <20250313114329.284104-8-acarmina@redhat.com>
 <20250313122503.GA7438@willie-the-truck>
 <CAGegRW5r3V2-_44-X353vS-GZwDYG=SVwc6MzSGE8GdFQuFoKA@mail.gmail.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGegRW5r3V2-_44-X353vS-GZwDYG=SVwc6MzSGE8GdFQuFoKA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Mar 13, 2025 at 05:40:59PM +0100, Alessandro Carminati wrote:
> On Thu, Mar 13, 2025 at 1:25 PM Will Deacon <will@kernel.org> wrote:
> >
> > On Thu, Mar 13, 2025 at 11:43:22AM +0000, Alessandro Carminati wrote:
> > > diff --git a/arch/arm64/include/asm/bug.h b/arch/arm64/include/asm/bug.h
> > > index 28be048db3f6..044c5e24a17d 100644
> > > --- a/arch/arm64/include/asm/bug.h
> > > +++ b/arch/arm64/include/asm/bug.h
> > > @@ -11,8 +11,14 @@
> > >
> > >  #include <asm/asm-bug.h>
> > >
> > > +#ifdef HAVE_BUG_FUNCTION
> > > +# define __BUG_FUNC  __func__
> > > +#else
> > > +# define __BUG_FUNC  NULL
> > > +#endif
> > > +
> > >  #define __BUG_FLAGS(flags)                           \
> > > -     asm volatile (__stringify(ASM_BUG_FLAGS(flags)));
> > > +     asm volatile (__stringify(ASM_BUG_FLAGS(flags, %c0)) : : "i" (__BUG_FUNC));
> >
> > Why is 'i' the right asm constraint to use here? It seems a bit odd to
> > use that for a pointer.
> 
> I received this code as legacy from a previous version.
> In my review, I considered the case when HAVE_BUG_FUNCTION is defined:
> Here, __BUG_FUNC is defined as __func__, which is the name of the
> current function as a string literal.
> Using the constraint "i" seems appropriate to me in this case.
> 
> However, when HAVE_BUG_FUNCTION is not defined:
> __BUG_FUNC is defined as NULL. Initially, I considered it literal 0,
> but after investigating your concern, I found:
> 
> ```
> $ echo -E "#include <stdio.h>\n#include <stddef.h>\nint main()
> {\nreturn 0;\n}" | aarch64-linux-gnu-gcc -E -dM - | grep NULL
> #define NULL ((void *)0)
> ```
> 
> I realized that NULL is actually a pointer that is not a link time
> symbol, and using the "i" constraint with NULL may result in undefined
> behavior.
> 
> Would the following alternative definition for __BUG_FUNC be more convincing?
> 
> ```
> #ifdef HAVE_BUG_FUNCTION
>     #define __BUG_FUNC __func__
> #else
>     #define __BUG_FUNC (uintptr_t)0
> #endif
> ```
> Let me know your thoughts.

Thanks for the analysis; I hadn't noticed this specific issue, it just
smelled a bit fishy. Anyway, the diff above looks better, thanks.

Will

