Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9677489C9A5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Apr 2024 18:35:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lP+Fl7DF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VCvpD2MH4z3vbG
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Apr 2024 02:35:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lP+Fl7DF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VCvnW2cGDz3dTw
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Apr 2024 02:34:37 +1000 (AEST)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1e2a7b5ef7bso38330455ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Apr 2024 09:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712594073; x=1713198873; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y8W6JiQXMJlyRVh6G0P1/xRBUWDgR2AudHru0aHPOuY=;
        b=lP+Fl7DFkppkgicPIpewGkI1Wlo9iMBuV/rdZrMYkMDnY4AAPWUtS4ZdF7xWDNBAQB
         3q0gONkajNCpCXhfGq+D2xuCNsXv24a1Wq7+GV7jysWwcsUANgFIKw9jrA6d+4j4FMkD
         YJ04QNMamNVvLnPoyjvmf4TkrN9BZlazRuJGG7oDp3YJudFMZ+Z7KtMP1ne7BTHGIXYs
         Y6FHnk3RVG0O9JbTv3tTntWY22V/0udc6OaEl6h4fiUkt6bO4w6yjxA93MB11UhL8le4
         7z+UV/4FMPPYdwaXh4izGekTtibGBqEPqntAbegTSXehHU1H+OoRUKJFZa0NniKZRbVS
         XG5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712594073; x=1713198873;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y8W6JiQXMJlyRVh6G0P1/xRBUWDgR2AudHru0aHPOuY=;
        b=LLdjthWbMX1kbjnQgDWlmb9rs9X8tvpcn5jeZJ45nrJWb5iXSb+7pGWrYb3WkIv+id
         LNjzWemlDpSn0+K2ZZxBs22L46OZCSZqlAa7z86Bqqx9ve94smoEhImLaaAB4OKJe5wA
         PLdZsFhPn1qGFbo+I+FGsGGsDwo/U6HBEL+PxuYcGz4AdrfIXWwJOm36ZL42yvRldXpZ
         45UG2MryWGllTY2BeZlPgysu+WxI1/7wx0GCn7eDyxMLMPTR68oBXu0Uv7g+FwMeCR7e
         ZTvOji7/5KKRKrBa7LxPKWiVrrv89O0hHdeMVsxG5804PGIOCqF3wos5WopYwRCQ+Szu
         IPoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZGUuVaamP6ZSL9FfIBiFmwVYf0OmhJLZBZjvozEbr0G6m6TPpzDeO74yQ8buz94C9L5z6h29VJVP1jZdRt9+DkBh+MUwOeB9v+IdFxQ==
X-Gm-Message-State: AOJu0YwdBz/IiPfgGlzIXk6Rzpq6ZKT/EYLVAS9cNE9fYezT9SJuVxBD
	WdZp7iKbImuwW+pu2nb8XYPjXTZTW8wzC1be8MjC0VxQNxnzBb79
X-Google-Smtp-Source: AGHT+IHjgwPwZy3e5AEopzEIQpEcmD2hcpsHcoA+sLwIBYMIqqkK3bLGAgIh/jDVDgJdWRaZ9xWs0g==
X-Received: by 2002:a17:902:cec7:b0:1e3:f911:22b2 with SMTP id d7-20020a170902cec700b001e3f91122b2mr6050960plg.7.1712594073047;
        Mon, 08 Apr 2024 09:34:33 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n4-20020a170902e54400b001e2b36d0c8esm7189331plf.7.2024.04.08.09.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 09:34:32 -0700 (PDT)
Date: Mon, 8 Apr 2024 09:34:26 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH v3 06/15] net: kunit: Suppress lock warning noise at end
 of dev_addr_lists tests
Message-ID: <9e8718bf-da81-463b-9436-6c8b0881a045@roeck-us.net>
References: <20240403131936.787234-1-linux@roeck-us.net>
 <20240403131936.787234-7-linux@roeck-us.net>
 <20240403183412.16254318@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240403183412.16254318@kernel.org>
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
Cc: x86@kernel.org, loongarch@lists.linux.dev, linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org, Brendan Higgins <brendan.higgins@linux.dev>, Eric Dumazet <edumazet@google.com>, linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, David Airlie <airlied@gmail.com>, Arthur Grillo <arthurgrillo@riseup.net>, Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Daniel Diaz <daniel.diaz@linaro.org>, linux-sh@vger.kernel.org, Naresh Kamboju <naresh.kamboju@linaro.org>, =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Dan Carpenter <dan.carpenter@linaro.org>, Linux Kernel Functional Testing <lkft@linaro.org>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, David Gow <davidgow@google.com>, Daniel Vetter <daniel@ffwll.ch>, linux-arm-kernel@lists.infradead.org, kunit-dev@googlegroups.com, lin
 ux-parisc@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 03, 2024 at 06:34:12PM -0700, Jakub Kicinski wrote:
> On Wed,  3 Apr 2024 06:19:27 -0700 Guenter Roeck wrote:
> > dev_addr_lists_test generates lock warning noise at the end of tests
> > if lock debugging is enabled. There are two sets of warnings.
> > 
> > WARNING: CPU: 0 PID: 689 at kernel/locking/mutex.c:923 __mutex_unlock_slowpath.constprop.0+0x13c/0x368
> > DEBUG_LOCKS_WARN_ON(__owner_task(owner) != __get_current())
> > 
> > WARNING: kunit_try_catch/1336 still has locks held!
> > 
> > KUnit test cleanup is not guaranteed to run in the same thread as the test
> > itself. For this test, this means that rtnl_lock() and rtnl_unlock() may
> > be called from different threads. This triggers the warnings.
> > Suppress the warnings because they are irrelevant for the test and just
> > confusing and distracting.
> > 
> > The first warning can be suppressed by using START_SUPPRESSED_WARNING()
> > and END_SUPPRESSED_WARNING() around the call to rtnl_unlock(). To suppress
> > the second warning, it is necessary to set debug_locks_silent while the
> > rtnl lock is held.
> 
> Is it okay if I move the locking into the tests, instead?
> It's only 4 lines more and no magic required, seems to work fine.

I don't think it is that simple. Unit tests run in a kernel thread
and exit immediately if a test fails. While the unit test code _looks_
sequential, that isn't really the case. Every instance of KUNIT_ASSERT_x
or KUNIT_FAIL() results in immediate kernel thread termination. If
that happens, any rtnl_unlock() in the failed function would not be
executed. I am not aware of an equivalent of atexit() for kernel threads
which would fix the problem. My understanding is that the kunit system
doesn't support an equivalent either, but at least sometimes executes
the exit function in a different thread context.

Guenter
