Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7849F879E24
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Mar 2024 23:04:24 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=d6geoe/1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TvSNQ1tBpz3vfL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Mar 2024 09:04:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=d6geoe/1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::12f; helo=mail-il1-x12f.google.com; envelope-from=keescook@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TvSM14wg2z3vXQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Mar 2024 09:03:09 +1100 (AEDT)
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-3662d7c79a9so2193675ab.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Mar 2024 15:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1710280986; x=1710885786; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bFZkOPzjUiG9hBeGxmULl/XMqNk9IbEaqEvdeXcgD8s=;
        b=d6geoe/1ad/5MMooAQmdvEdjI9PVZCNrDEXSjzc4wsX1ocH/XPFsTnIgYJbn8kU4W2
         HJqs+7vh1/fzA+z72BiFbZC/xAP8ckNbleRtLfk73KFf4/+41tXXA9NiCQ79Oucq52Ju
         3F4Re/AOUHAgQCa0uszScC6mHwAwCa9EYSFDA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710280986; x=1710885786;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bFZkOPzjUiG9hBeGxmULl/XMqNk9IbEaqEvdeXcgD8s=;
        b=HYNqN04W/w8bM44tIvanAsm34ZFjd3hRONFxSdhrlxYLpvHjKlhIQG7OyJ0LkARh+h
         9XFSF3XqxZJdUANlHoSEqGvBccfrYh3S1R31h13gIxYE2ia8GpFc1lR9EtT/qRArUM3H
         vO43wM3CoUE08GUOZCCX7aQXyhEyCwI40u09mXdQHxMZOoF10v4ZLp8J5KbZJeLGQBH5
         sLHnET36bmdACcVjzWrotfKhPCvFH4zwqjhW0j/IQnDZwmV+K9G/f0tEOg/uSrHHcbjY
         FdtqHNNSfCSEy9tO9ng9Mipd76SdB2Rur4WCZ5tA882DRmD5QHUuqbc2sosGo7YUws9S
         GWlw==
X-Forwarded-Encrypted: i=1; AJvYcCUEHCjRIAHwPfkHUCyabj7EZYaZFrmquvH289bbn0QBS6z6cZSis8JYcdjWjxpvw80fhHBygM1hsIeYYINkJCtm8VfSdKqcNQbluctkyg==
X-Gm-Message-State: AOJu0YxoG2hatSEQx3BADByNf4qQgH+60l+bd7wuvsYy2x8QvM2Abw7b
	e7zNnsF3Vma/UuqrudN0ohArT8Bxx5Kg7SeJ89fNMKkF/ugQpUtk2ysAGYE5YQ==
X-Google-Smtp-Source: AGHT+IEdwN1SY2GeciEHPDmRWgTgdPa04evl6KEFQYoPJeYQSV2BmWI4216WoCmzy6l7zJDsrZVhNw==
X-Received: by 2002:a6b:e719:0:b0:7c8:bf15:5653 with SMTP id b25-20020a6be719000000b007c8bf155653mr4918871ioh.20.1710280986087;
        Tue, 12 Mar 2024 15:03:06 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id m14-20020a63ed4e000000b005dc816b2369sm6650251pgk.28.2024.03.12.15.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 15:03:05 -0700 (PDT)
Date: Tue, 12 Mar 2024 15:03:05 -0700
From: Kees Cook <keescook@chromium.org>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 04/14] kunit: Add documentation for warning backtrace
 suppression API
Message-ID: <202403121503.B97DE8A60E@keescook>
References: <20240312170309.2546362-1-linux@roeck-us.net>
 <20240312170309.2546362-5-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240312170309.2546362-5-linux@roeck-us.net>
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

On Tue, Mar 12, 2024 at 10:02:59AM -0700, Guenter Roeck wrote:
> Document API functions for suppressing warning backtraces.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
