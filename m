Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D81988AFD9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 20:25:31 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kkXF69Tl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V3NF527jVz3vhc
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Mar 2024 06:25:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kkXF69Tl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V3NDH41yjz3c5J
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Mar 2024 06:24:46 +1100 (AEDT)
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-29dee60302fso3895457a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Mar 2024 12:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711394683; x=1711999483; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P8SlcQVDmaEWiOte6mDmefSXrzEKVOFtuPmb7V2Kzic=;
        b=kkXF69TlulpFjnUrhR5bpC4eIRp3/ELJcuv3c61RqbmTIGBXKbaXz7NmDhyRVbdjEC
         OC0KJKtekjoEPLx5oHKeHzE0I8fMU9JuAiMsf/M/fOhDnLwfu7pGsGK9GglFVemED1rS
         3i2uOsjO58Kqe+4lhOTCI1Y81xKffg+jSFsloUn8+bdv9gq4wulq0DiayWQF/lDWvJ9m
         N73HIiXICy06w8cLJWztjciBgQBV6ogSVFLpHpw3Xw8du2vc7QvpBUAvGUTi051HkXtB
         5V6C7JWuaWLkuoi+HeZefFU5vE5eO0Y3uU3jNn8Ksrw1ArpGILhFzSR9seW6xy8v7dEi
         1eZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711394683; x=1711999483;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P8SlcQVDmaEWiOte6mDmefSXrzEKVOFtuPmb7V2Kzic=;
        b=jnpe7l7PhIy9hjjX1OAcuci1MQ/V9HOF6ftQieZlaV5pplw7mms1MVrnWR3mcgr2iy
         ip/rHl1SKVwh4Zg+8fiBKrXl4Fs6hUwP9vw+0IhuDH9cz+lQgT2gk1bx6N3cqcKb6XiM
         xJ4Qrdzmr/6LX+Bh8kiSnjl4UzH6CXWcgzLb6p3H2gwAWIhFR7mbP6YlDrWyhNHNy3jE
         B6QpgHsYjCqzGd7iK6IbNFPjImCmVt906ojt20q8YIygY0aXPDhQ7FwOUDN6cifxU3al
         WbY8XqfOBg8v723DimNo0F0aWVKFhHeb0y3BqAYo3AwFwYmTlrBK5vYVl933LxZ/zXsq
         6pmg==
X-Forwarded-Encrypted: i=1; AJvYcCUOmbIv2Ki8m1rVuxwfMCnf2jb3ogyUnJFZlKQy8rn+0gYD+uSby1gr1BRnabR3JNLXW1y/G69qczA20gOTsojAvqTv2X1eNq1pXoKTKg==
X-Gm-Message-State: AOJu0YzPb3e6Do05M02HncI/iOW20fC9JTBGgRluNYPkGAbHrKDrrTus
	qB4JOYe2hDNKbRJ8cQyY/r3fcS4ay52Fq0k3Cg5gkzKkUqNZhFTU
X-Google-Smtp-Source: AGHT+IFwrImv53xAJXZaDSLJtn5nAAXYRWdj5wAShxC6nIYkDeejlGCGK79rEKa0DnGROBP9wWQclw==
X-Received: by 2002:a17:90b:3d8:b0:29b:a345:620a with SMTP id go24-20020a17090b03d800b0029ba345620amr10896738pjb.20.1711394683229;
        Mon, 25 Mar 2024 12:24:43 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q7-20020a17090a304700b0029bf9969afbsm10113710pjl.53.2024.03.25.12.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 12:24:42 -0700 (PDT)
Date: Mon, 25 Mar 2024 12:24:40 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
Subject: Re: [PATCH v2 05/14] drm: Suppress intentional warning backtraces in
 scaling unit tests
Message-ID: <e880828b-552e-488e-9f31-3989bec276ae@roeck-us.net>
References: <20240325175248.1499046-1-linux@roeck-us.net>
 <20240325175248.1499046-6-linux@roeck-us.net>
 <0729b218-53f1-4139-b165-a324794a9abd@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0729b218-53f1-4139-b165-a324794a9abd@igalia.com>
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
Cc: loongarch@lists.linux.dev, linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org, Brendan Higgins <brendan.higgins@linux.dev>, linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, David Airlie <airlied@gmail.com>, Arthur Grillo <arthurgrillo@riseup.net>, Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Daniel Diaz <daniel.diaz@linaro.org>, Naresh Kamboju <naresh.kamboju@linaro.org>, linux-sh@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>, Linux Kernel Functional Testing <lkft@linaro.org>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, David Gow <davidgow@google.com>, Daniel Vetter <daniel@ffwll.ch>, linux-arm-kernel@lists.infradead.org, kunit-dev@googlegroups.com, linux-parisc@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Zimmermann <tzim
 mermann@suse.de>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On Mon, Mar 25, 2024 at 04:05:06PM -0300, Maíra Canal wrote:
> Hi Guenter,
> 
> On 3/25/24 14:52, Guenter Roeck wrote:
> > The drm_test_rect_calc_hscale and drm_test_rect_calc_vscale unit tests
> > intentionally trigger warning backtraces by providing bad parameters to
> > the tested functions. What is tested is the return value, not the existence
> > of a warning backtrace. Suppress the backtraces to avoid clogging the
> > kernel log.
> > 
> > Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
> > Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
> > Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> > ---
> > - Rebased to v6.9-rc1
> > - Added Tested-by:, Acked-by:, and Reviewed-by: tags
> > 
> >   drivers/gpu/drm/tests/drm_rect_test.c | 6 ++++++
> >   1 file changed, 6 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/tests/drm_rect_test.c b/drivers/gpu/drm/tests/drm_rect_test.c
> > index 76332cd2ead8..75614cb4deb5 100644
> > --- a/drivers/gpu/drm/tests/drm_rect_test.c
> > +++ b/drivers/gpu/drm/tests/drm_rect_test.c
> > @@ -406,22 +406,28 @@ KUNIT_ARRAY_PARAM(drm_rect_scale, drm_rect_scale_cases, drm_rect_scale_case_desc
> >   static void drm_test_rect_calc_hscale(struct kunit *test)
> >   {
> > +	DEFINE_SUPPRESSED_WARNING(drm_calc_scale);
> >   	const struct drm_rect_scale_case *params = test->param_value;
> >   	int scaling_factor;
> > +	START_SUPPRESSED_WARNING(drm_calc_scale);
> 
> I'm not sure if it is not that obvious only to me, but it would be nice
> to have a comment here, remembering that we provide bad parameters in
> some test cases.

Sure. Something like this ?

        /*
         * drm_rect_calc_hscale() generates a warning backtrace whenever bad
         * parameters are passed to it. This affects all unit tests with an
         * error code in expected_scaling_factor.
         */

Thanks,
Guenter
