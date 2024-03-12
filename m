Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE04879E23
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Mar 2024 23:03:41 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=T2nfT/Vt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TvSMZ5WC2z3vcK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Mar 2024 09:03:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=T2nfT/Vt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=keescook@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TvSLc4n5mz3dX6
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Mar 2024 09:02:48 +1100 (AEDT)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6da202aa138so3959678b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Mar 2024 15:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1710280967; x=1710885767; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1akdFCp/NrQTZkdZoE61av7sk42pTtpjjQoFP3uV05s=;
        b=T2nfT/VtmTO9Z9+bEUHrhzWl3IkoeGOYVNqTUS5CIky+DigMrReGquPkVJzFrSOjgu
         OsWuqii1jJZP7BdKr1W7ejEHdNMAqd/b/fKMvxoJ/t+LTelI4AMvbYKbj18jway+/mfe
         VxO8JmvR3euPZLj1vk0W1eQIHJYyleiXitwAE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710280967; x=1710885767;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1akdFCp/NrQTZkdZoE61av7sk42pTtpjjQoFP3uV05s=;
        b=vKgme03lmKW7WGydJKJm09qXikxa2mNirZN+Xth1WerZ63pUvie/LzgNyS2YPZe8Sg
         a7AaT2XKuFGo/xmeFOOoXtvCDWpGxEzqWnGoehbsL4Llt9Me9z2lIVc61Ep53wEO83V/
         ecFTkB2XbVEgpG/n9M+o18ViOmSxvb4xsnGNvcR4a8iiRfG0SY/t2mim6xPV4rpSZkRc
         /Pqemh5QLqk3JLR974EZrkb7Upq6Sb2A4ZlwLqh9ocCuiIpzhlFKkqtFG/queWEtlBKU
         dnJQP2OI5oussJIKUSfhOJ3ioPKI2cKroNiN+4mlo0KAVfl/AWSnI1VSeJ7EkQGAnnm2
         Kw+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXlG1e/ePCE421PRDaLE6JROpp45PSQzrIKY2xH0k3qzddDFsshW2WFcgImZKCkLbL9qbtzfvMwSqNFeqdMSmp9UuII3zayaeMJBeXmXg==
X-Gm-Message-State: AOJu0YxI+8RUQcLdRIeIqBNOrrlmltZjefKNYbn8SPSBHU7QJhi8ye1h
	kvaEQVQnibzz3wMT9iILq0oFumeX3mkfrwQ2CWF/XjLn2ITJC0IObdufDlIYyw==
X-Google-Smtp-Source: AGHT+IFKZ+X2o3xvUM/DPjpn5dJMdSK/7jBm9riFOy6GxFDG2jNN2P7xmSx2+ecCvjPJ+atiR43WGA==
X-Received: by 2002:a05:6a20:9382:b0:1a0:efd0:b183 with SMTP id x2-20020a056a20938200b001a0efd0b183mr14145890pzh.44.1710280967019;
        Tue, 12 Mar 2024 15:02:47 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id e11-20020a17090301cb00b001dd6c0800b4sm7193896plh.188.2024.03.12.15.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 15:02:46 -0700 (PDT)
Date: Tue, 12 Mar 2024 15:02:46 -0700
From: Kees Cook <keescook@chromium.org>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 03/14] kunit: Add test cases for backtrace warning
 suppression
Message-ID: <202403121502.95F27A01@keescook>
References: <20240312170309.2546362-1-linux@roeck-us.net>
 <20240312170309.2546362-4-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240312170309.2546362-4-linux@roeck-us.net>
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
Cc: loongarch@lists.linux.dev, linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org, Brendan Higgins <brendan.higgins@linux.dev>, linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, David Airlie <airlied@gmail.com>, Arthur Grillo <arthurgrillo@riseup.net>, Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Daniel Diaz <daniel.diaz@linaro.org>, linux-sh@vger.kernel.org, Naresh Kamboju <naresh.kamboju@linaro.org>, =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Dan Carpenter <dan.carpenter@linaro.org>, netdev@lists.linux.dev, Daniel Vetter <daniel@ffwll.ch>, Arnd Bergmann <arnd@arndb.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, David Gow <davidgow@google.com>, linux-arm-kernel@lists.infradead.org, kunit-dev@googlegroups.com, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, Andrew Morton <a
 kpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 12, 2024 at 10:02:58AM -0700, Guenter Roeck wrote:
> Add unit tests to verify that warning backtrace suppression works.
> 
> If backtrace suppression does _not_ work, the unit tests will likely
> trigger unsuppressed backtraces, which should actually help to get
> the affected architectures / platforms fixed.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
