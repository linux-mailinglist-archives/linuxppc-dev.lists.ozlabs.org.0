Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A05897A91
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Apr 2024 23:21:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Rv6KSrJd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V8yNZ3jvlz3dXL
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Apr 2024 08:21:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Rv6KSrJd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=keescook@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V8yMt0lGSz3bZ3
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Apr 2024 08:20:40 +1100 (AEDT)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1e0d8403257so2387195ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Apr 2024 14:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712179236; x=1712784036; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gk/7t8bB/vPp5RYyhmHYp9/pKPIZpl1c0Hpc1VIArKM=;
        b=Rv6KSrJd2DZj25Yc7kk7fpqEMwFr79RlzPS/tqztSYMunseUqIVI6pbbkfP2HQyuKc
         bgemiwIUeICs2/5u0jj3OVoValgNa/gGn1EPxnBCnXXTGhytemqRTBOrAAEccfnqkUO+
         v6H3OaeHLj0irV1Z05JKZi0DK31B8qIjs2sYw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712179236; x=1712784036;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gk/7t8bB/vPp5RYyhmHYp9/pKPIZpl1c0Hpc1VIArKM=;
        b=cPkyU/0dOfj5GudGyhptFjOF6/HbOn0W2tATj2+FQ/u29F6PCgrxQVQ+j+bLbKGMvu
         gzccHsAAJY1EZ5LD6wvf7SDNQTX5GLbUPXjQxaOTpO5ULBWFJJAg2e7PRj8RfnaO2851
         JmE/T7LbVdEgo4yJa2ptSjhDfyUPajgFGqlXW+70aEabp79nn/bc9Oaqa4+s6H4eEie7
         mHSm7Nd8NP3oZigmjDjWg/9hgEeakPK0QUE5k5jipqQr49HbTpXluVDZ98JaGqtINcJK
         MRrt13A9iBc+gDiWpfyb0rlsjxQswQOLQMtsIM30ecSawf9hZNngu6wfg0+AdhnkGHGM
         n+5A==
X-Forwarded-Encrypted: i=1; AJvYcCXeFdcOXjY9lALtSLPdVf/zeu/Tt0kG18AtIWFIpI69vSy/Sq/PGLvFE53sDOHY9rG76sc9CZia0DjSJR3A0JrmTQlL6PUzGQJzmgbeZQ==
X-Gm-Message-State: AOJu0YxpZ3UM3gcH5IHmf0EU3U/o2hQNiBhU2jTwhw3JZPJNqf3ZHMRZ
	Bnq7pijy95aGkXBrJc7gQRuZbD/Ac0Jtpj40SaTMiTWPROUdkCEcHiz9jNVwkA==
X-Google-Smtp-Source: AGHT+IFNWSt+grv0aoo3QXgpCvCZ7QxZ9IBnA1B4gdZs5eLtWkdhNXO9ogb9Q/XDMKHoC6MfZl34Wg==
X-Received: by 2002:a17:903:110f:b0:1e0:f25b:e795 with SMTP id n15-20020a170903110f00b001e0f25be795mr509491plh.11.1712179236057;
        Wed, 03 Apr 2024 14:20:36 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id m16-20020a170902bb9000b001e2a87d7d2dsm163988pls.253.2024.04.03.14.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 14:20:35 -0700 (PDT)
Date: Wed, 3 Apr 2024 14:20:34 -0700
From: Kees Cook <keescook@chromium.org>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v3 00/15] Add support for suppressing warning backtraces
Message-ID: <202404031414.645255D868@keescook>
References: <20240403131936.787234-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240403131936.787234-1-linux@roeck-us.net>
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
Cc: x86@kernel.org, loongarch@lists.linux.dev, linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org, Brendan Higgins <brendan.higgins@linux.dev>, linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, David Airlie <airlied@gmail.com>, Arthur Grillo <arthurgrillo@riseup.net>, Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Daniel Diaz <daniel.diaz@linaro.org>, linux-sh@vger.kernel.org, Naresh Kamboju <naresh.kamboju@linaro.org>, =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Dan Carpenter <dan.carpenter@linaro.org>, Daniel Vetter <daniel@ffwll.ch>, Arnd Bergmann <arnd@arndb.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, David Gow <davidgow@google.com>, linux-arm-kernel@lists.infradead.org, kunit-dev@googlegroups.com, linux-parisc@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 03, 2024 at 06:19:21AM -0700, Guenter Roeck wrote:
> Some unit tests intentionally trigger warning backtraces by passing bad
> parameters to kernel API functions. Such unit tests typically check the
> return value from such calls, not the existence of the warning backtrace.
> 
> Such intentionally generated warning backtraces are neither desirable
> nor useful for a number of reasons.
> - They can result in overlooked real problems.
> - A warning that suddenly starts to show up in unit tests needs to be
>   investigated and has to be marked to be ignored, for example by
>   adjusting filter scripts. Such filters are ad-hoc because there is
>   no real standard format for warnings. On top of that, such filter
>   scripts would require constant maintenance.
> 
> One option to address problem would be to add messages such as "expected
> warning backtraces start / end here" to the kernel log.  However, that
> would again require filter scripts, it might result in missing real
> problematic warning backtraces triggered while the test is running, and
> the irrelevant backtrace(s) would still clog the kernel log.
> 
> Solve the problem by providing a means to identify and suppress specific
> warning backtraces while executing test code. Support suppressing multiple
> backtraces while at the same time limiting changes to generic code to the
> absolute minimum. Architecture specific changes are kept at minimum by
> retaining function names only if both CONFIG_DEBUG_BUGVERBOSE and
> CONFIG_KUNIT are enabled.
> 
> The first patch of the series introduces the necessary infrastructure.
> The second patch introduces support for counting suppressed backtraces.
> This capability is used in patch three to implement unit tests.
> Patch four documents the new API.
> The next two patches add support for suppressing backtraces in drm_rect
> and dev_addr_lists unit tests. These patches are intended to serve as
> examples for the use of the functionality introduced with this series.
> The remaining patches implement the necessary changes for all
> architectures with GENERIC_BUG support.
> 
> With CONFIG_KUNIT enabled, image size increase with this series applied is
> approximately 1%. The image size increase (and with it the functionality
> introduced by this series) can be avoided by disabling
> CONFIG_KUNIT_SUPPRESS_BACKTRACE.
> 
> This series is based on the RFC patch and subsequent discussion at
> https://patchwork.kernel.org/project/linux-kselftest/patch/02546e59-1afe-4b08-ba81-d94f3b691c9a@moroto.mountain/
> and offers a more comprehensive solution of the problem discussed there.
> 
> Design note:
>   Function pointers are only added to the __bug_table section if both
>   CONFIG_KUNIT_SUPPRESS_BACKTRACE and CONFIG_DEBUG_BUGVERBOSE are enabled
>   to avoid image size increases if CONFIG_KUNIT is disabled. There would be
>   some benefits to adding those pointers all the time (reduced complexity,
>   ability to display function names in BUG/WARNING messages). That change,
>   if desired, can be made later.
> 
> Checkpatch note:
>   Remaining checkpatch errors and warnings were deliberately ignored.
>   Some are triggered by matching coding style or by comments interpreted
>   as code, others by assembler macros which are disliked by checkpatch.
>   Suggestions for improvements are welcome.
> 
> Changes since RFC:
> - Introduced CONFIG_KUNIT_SUPPRESS_BACKTRACE
> - Minor cleanups and bug fixes
> - Added support for all affected architectures
> - Added support for counting suppressed warnings
> - Added unit tests using those counters
> - Added patch to suppress warning backtraces in dev_addr_lists tests
> 
> Changes since v1:
> - Rebased to v6.9-rc1
> - Added Tested-by:, Acked-by:, and Reviewed-by: tags
>   [I retained those tags since there have been no functional changes]
> - Introduced KUNIT_SUPPRESS_BACKTRACE configuration option, enabled by
>   default.
> 
> Changes since v2:
> - Rebased to v6.9-rc2
> - Added comments to drm warning suppression explaining why it is needed.
> - Added patch to move conditional code in arch/sh/include/asm/bug.h
>   to avoid kerneldoc warning
> - Added architecture maintainers to Cc: for architecture specific patches
> - No functional changes
> 
> ----------------------------------------------------------------
> Guenter Roeck (15):
>       bug/kunit: Core support for suppressing warning backtraces
>       kunit: bug: Count suppressed warning backtraces
>       kunit: Add test cases for backtrace warning suppression
>       kunit: Add documentation for warning backtrace suppression API
>       drm: Suppress intentional warning backtraces in scaling unit tests
>       net: kunit: Suppress lock warning noise at end of dev_addr_lists tests
>       x86: Add support for suppressing warning backtraces
>       arm64: Add support for suppressing warning backtraces
>       loongarch: Add support for suppressing warning backtraces
>       parisc: Add support for suppressing warning backtraces
>       s390: Add support for suppressing warning backtraces
>       sh: Add support for suppressing warning backtraces
>       sh: Move defines needed for suppressing warning backtraces
>       riscv: Add support for suppressing warning backtraces
>       powerpc: Add support for suppressing warning backtraces

Tested-by: Kees Cook <keescook@chromium.org>

(for x86 and um)

I was planning to add warning suppression for the "overflow" KUnit
tests, but it seems the vmalloc routines aren't calling warn_alloc() any
more for impossible sizes. So, I think, no patches needed for
lib/overflow_kunit.c, but at the end of the day, I've tested this series
is working for me. :P

-- 
Kees Cook
