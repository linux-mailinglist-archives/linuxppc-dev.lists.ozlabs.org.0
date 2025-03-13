Return-Path: <linuxppc-dev+bounces-6986-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8A2A5FF45
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Mar 2025 19:31:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZDGKg0GGMz3c8w;
	Fri, 14 Mar 2025 05:31:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::635"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741890678;
	cv=none; b=ovYiZZETShWmfzVvIm73uNrZ6udKHAm8/5uqWhHwKds4OjoaATovDS+5a5YvbGH5K9CS3cSxvquzxl+DZGgRkzOCrWrXCi45SBCvkODP7OVGycmS0+CC1lLcj1rsKnVyZsjLId1rVoqUD0CmZ9jI5HADQYkopdaGFH9T2WVdasRa/IAbr17g9Q71ZaYTr3kL03Fo2u8SIJPm6Do81Pd7sZYk9E6fR8sztaJZn9QS2eGuQHtBKGHj/QWMFiUsXfAh/OJs3DGqcDL/P1njoelfyEF9s6mgLz2GULXuJQrkm5V+sHDWSArFsyavowEi2VD597vxMddJF4RDEpZijQeKLg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741890678; c=relaxed/relaxed;
	bh=Jt5WSssG+OEvsuPkFz6BZY4vYElG8JeyaALVDa3jMX0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G3t5Jimj9WYxratdQxS9gUekgfMcGmrkICwHyFADPCOJE6vUcgbVpoB3eL8cmvFBES+UqD/UihTXdFyc7PMFw+AP06sAioq+8lqzxXAECURLp3JStGc7kgMAYlBHNuX0Go60HR8zOcJmCRGALDEHy37KwOYjW2U6ILVKiyBvLIaWv2scBg7IiBgW9+OIuHOkasC8V+GEMADJYjvyTfJfETid+iI32ijCRv/OU2DbBg/f3WyPW+L4zcFuEdKTnfb3/HJ9RYE3+m6wCvKDxOpze2AZL4QQCATeJZhAjwEKzO1bYlhMYddSYzRpzy1ndSKGbo+Qq0rvsojdCgfMyNoxqQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KmvhV74o; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KmvhV74o;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZDGKd0wbKz3048
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 05:31:15 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-223959039f4so28916675ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Mar 2025 11:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741890674; x=1742495474; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jt5WSssG+OEvsuPkFz6BZY4vYElG8JeyaALVDa3jMX0=;
        b=KmvhV74osp2niYs4oMlIL2TstzzbdIJe9YnPopanMTedSxc4iPjPop3xha903Kkko+
         /bRnk8q8IyXkr1S5T0AXzEhNYYu1uVbDs2VDwWdcJjPbbh1C6EH4yJSqTL/9yxmvlf97
         VxsXBWqIMntdNSMCOMTxDa3//DNhH82EB1L8Ax66GpMCepvae5KMmRVupiVS+DZDYEdJ
         uF/xzLZVbQHoanOkDraybNueBOqeImF+eM6Cuqqv+8mPAcIlHgAJmKmw3d0AcbQ7EZis
         Emw6BdOKS/lH1A+2L/Z49rSrnGYhKk2/u1DMFu+Tvwq+CVAnSeiYh+C9fVju1C2nwgsp
         fi2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741890674; x=1742495474;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jt5WSssG+OEvsuPkFz6BZY4vYElG8JeyaALVDa3jMX0=;
        b=VOitLoR2j3ANrPSS1CuQRyctQe9aJktw1/l9oxt6KiMFkke7DKsVgl41pdaR4HEJCt
         w7j233QduGJryK9nfGAWkUG6IiOEUA9IR0pUeCypwS6Nhb8xCsys0IU0KZfJS9m/qDYd
         P250jxc/U5sAMbYeq/QFv4xY8ghz2o7534IXHjTdbR9YNrRet/oxHR3IfThK8ozgsAWZ
         nxTpMs75B3Trm9x/zpxZVNkYtCAWFxkN7+iXLgK54jnElQGjFUqfTwPkcU0nacGWkzN7
         uEKPfBQthUrS9MXStRmLNMOmC514OqMzJ3N5JAKCUjz2tc+tXB700N5hG7m7a5hU7XC9
         jmng==
X-Forwarded-Encrypted: i=1; AJvYcCX1fNSV/wTMjOjC8W+tvi55THuixn9wgUgVneC5115deq4nmtoYXcNrl8jGqnr0eehiz1WnGgjRsaE5Ipg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyvqVdrOCVaEg8EChzuytE+DZ1+mvyaPbmTNUAhZaDqhFqHZPxd
	kKmoH+nmXdu6N/efHqLDgr9O4dFc6Z917qtT0p//bQrJ/Agf2LuD
X-Gm-Gg: ASbGnct51x0Jc7zqPvsO44oMwnuROZjjxYwFt8nNKRONRyAn1YF2fJRO42o/gt1l9j/
	/rs57Vh4esfihpRGLcvAo1O9mb14N6bR5nlSSMOKwB273I/ZtQm+5nB9ycikv/ME5renlFtWUQR
	S7WE0R2+Gv2h4GS3/8ltU3Gfpn2w0dSIf/QzPGBfBY2BNJmaogUth5ZDCTgxIGrc58qSSP4Alke
	fIU6+ynwxzwOzCNyJoKt2zGWeK/dohupTko+FXqXCk3gA7qFNmGny5ae6aQoHcsUUbahuAYHoXH
	y9hK5lm8utbu+lawWHvP17aORb9i15ieiMwt4qQPsmD4puKnazcSNzt/KA==
X-Google-Smtp-Source: AGHT+IHUyL3JZBiKaHL1hLSTeQrgywlLwwEUN5of1N0Gy8TC0X3IRTq509SX5+fcaAZt7Xsc6jRvwQ==
X-Received: by 2002:a17:902:d48f:b0:220:fb23:48df with SMTP id d9443c01a7336-225dd8ed442mr5472005ad.36.1741890673680;
        Thu, 13 Mar 2025 11:31:13 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3011926599csm4185647a91.35.2025.03.13.11.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 11:31:13 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 13 Mar 2025 11:31:12 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Maxime Ripard <mripard@kernel.org>
Cc: Kees Cook <kees@kernel.org>, Alessandro Carminati <acarmina@redhat.com>,
	linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Daniel Diaz <daniel.diaz@linaro.org>,
	David Gow <davidgow@google.com>,
	Arthur Grillo <arthurgrillo@riseup.net>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
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
	linux-sh@vger.kernel.org, loongarch@lists.linux.dev, x86@kernel.org
Subject: Re: [PATCH v4 00/14] Add support for suppressing warning backtraces
Message-ID: <c8287bde-fa1c-4113-af22-4701d40d386e@roeck-us.net>
References: <20250313114329.284104-1-acarmina@redhat.com>
 <202503131016.5DCEAEC945@keescook>
 <20250313-abiding-vivid-robin-159dfa@houat>
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
In-Reply-To: <20250313-abiding-vivid-robin-159dfa@houat>
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Mar 13, 2025 at 06:24:25PM +0100, Maxime Ripard wrote:
> > 
> > Yeah, as with my prior review, I'm a fan of this. It makes a bunch of my
> > very noisy tests much easier to deal with.
> 
> And for the record, we're also affected by this in DRM and would very
> much like to get it merged in one shape or another.
> 

I was unable to get maintainers of major architectures interested enough
to provide feedback, and did not see a path forward. Maybe Alessandro
has more success than me.

Guenter

