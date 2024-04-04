Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA6C897D6F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Apr 2024 03:34:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qb1JzlHC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V941B2Blrz3vZM
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Apr 2024 12:34:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qb1JzlHC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V940W0hxtz3cCx
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Apr 2024 12:34:18 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5F0C4615AB;
	Thu,  4 Apr 2024 01:34:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A94D4C433C7;
	Thu,  4 Apr 2024 01:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712194455;
	bh=PLHX9CmuF+jzJhTft7r/1Y8OPKACX4mI6u4er178G2M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qb1JzlHCkOQ0xQR9xEkxKvsw8OA1eBs2sTlr4JQ5PzuUXWpA08puhxOS0+HGL5xJt
	 p+tSFhHdI0/W38jVkWUzbZ83SoA9Ze3oVX0I/xz35tzw9J8ehO4Ej2Z+v4WDgVFly6
	 bK1uHAbfHAa/MKwQyDRnXJvZKbn2ZQDjArtD+Ho/3cPayZMvc1juvsoNzlmJRr/Ju4
	 IiompHkE91W7nulKLmrSnjlpjrH1dYJE6//xltRqVI5kAJhGo2sMI29VSfrrA1CwJ3
	 2VTX8Ds9j7vLv82qYyQgrRRjYVgNl7GVkee7GY7YJqfjkE9sRb6rgoQPF1hbD/SIKA
	 JnLshHl50ZGTA==
Date: Wed, 3 Apr 2024 18:34:12 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v3 06/15] net: kunit: Suppress lock warning noise at end
 of dev_addr_lists tests
Message-ID: <20240403183412.16254318@kernel.org>
In-Reply-To: <20240403131936.787234-7-linux@roeck-us.net>
References: <20240403131936.787234-1-linux@roeck-us.net>
	<20240403131936.787234-7-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: x86@kernel.org, loongarch@lists.linux.dev, linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org, Brendan Higgins <brendan.higgins@linux.dev>, Eric Dumazet <edumazet@google.com>, linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, David Airlie <airlied@gmail.com>, Arthur Grillo <arthurgrillo@riseup.net>, Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Daniel Diaz <daniel.diaz@linaro.org>, linux-sh@vger.kernel.org, Naresh Kamboju <naresh.kamboju@linaro.org>, =?UTF-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, Dan Carpenter <dan.carpenter@linaro.org>, Linux Kernel Functional Testing <lkft@linaro.org>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, David Gow <davidgow@google.com>, Daniel Vetter <daniel@ffwll.ch>, linux-arm-kernel@lists.infradead.org, kunit-dev@googlegroups.com, linux-paris
 c@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed,  3 Apr 2024 06:19:27 -0700 Guenter Roeck wrote:
> dev_addr_lists_test generates lock warning noise at the end of tests
> if lock debugging is enabled. There are two sets of warnings.
> 
> WARNING: CPU: 0 PID: 689 at kernel/locking/mutex.c:923 __mutex_unlock_slowpath.constprop.0+0x13c/0x368
> DEBUG_LOCKS_WARN_ON(__owner_task(owner) != __get_current())
> 
> WARNING: kunit_try_catch/1336 still has locks held!
> 
> KUnit test cleanup is not guaranteed to run in the same thread as the test
> itself. For this test, this means that rtnl_lock() and rtnl_unlock() may
> be called from different threads. This triggers the warnings.
> Suppress the warnings because they are irrelevant for the test and just
> confusing and distracting.
> 
> The first warning can be suppressed by using START_SUPPRESSED_WARNING()
> and END_SUPPRESSED_WARNING() around the call to rtnl_unlock(). To suppress
> the second warning, it is necessary to set debug_locks_silent while the
> rtnl lock is held.

Is it okay if I move the locking into the tests, instead?
It's only 4 lines more and no magic required, seems to work fine.
