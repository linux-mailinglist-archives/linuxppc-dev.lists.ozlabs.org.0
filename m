Return-Path: <linuxppc-dev+bounces-7368-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA51A74872
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Mar 2025 11:38:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZPH7W2FtLz2yfK;
	Fri, 28 Mar 2025 21:38:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.125.25.15
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743158327;
	cv=none; b=CGhTODlFDlKrUiwNStJyu4mgwFKwZRE4Db01vxDaSt73wKG4SF+TJ4qcafJCJIlpV8F0zl+6a9+2iqmndDzeYVnAV6o628oDPHR6TK2rsK9nhUAFfBq4HoieHN0ZUOcbedSxlXXCE0iPle6G3QEUtsaWR0YEP2BX3UlS5PMgfd0fkm7GmDiYZKE3G1a1jZU5PcoRa1dHyUo0b2Lm7zF07h35pN8ALa51JvnKJ78PQlDhyzlD7/Va7cbKN6CG0Cac9DKfDPgwE/jDw2xRubBkpn3aF6GaJJbC8JJCdG+eh/TnXz2NOS+vQguSpG4izfqQg40cckbyjdQAyqij20v3uA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743158327; c=relaxed/relaxed;
	bh=MyuTqVvTP1UPCrUbHlnkU12n+jkzkkYz1VOSQfsDbeM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PbjIJ9zBs5I/PHPSAyao9GqHa48zoHrFob0NMwGplrRiAjI8/Qa+hcEdfyS1CNc4C82Wq2eCawnOw8iO3k0hvgCkdh++V7jWcqSusF8GZxsEvge+p8cAXpNlorscf9nH0qU6njJ+ElZnM5jvmpf0yTHJQvTl6oUYaDd7FRBhaDi31DiLwAjpq3t+Si7tPwqVwI9AjroDl013kWZ4xEbOM+3tQwsOqnHABaBsOS5nd2VMPUwQ9+R3r8YrfRmNRAPm3KuPgPSIwO7aI3zFqshNvKPl6DcifxWqePIZ6/OM8PgJNEBOGXBDf7X81eeHWomLAYuCpkJyPt49gCTDhnPlww==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=digikod.net; dkim=pass (1024-bit key; secure) header.d=digikod.net header.i=@digikod.net header.a=rsa-sha256 header.s=20191114 header.b=ubL6rwRE; dkim-atps=neutral; spf=pass (client-ip=185.125.25.15; helo=smtp-190f.mail.infomaniak.ch; envelope-from=mic@digikod.net; receiver=lists.ozlabs.org) smtp.mailfrom=digikod.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=digikod.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=digikod.net header.i=@digikod.net header.a=rsa-sha256 header.s=20191114 header.b=ubL6rwRE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=digikod.net (client-ip=185.125.25.15; helo=smtp-190f.mail.infomaniak.ch; envelope-from=mic@digikod.net; receiver=lists.ozlabs.org)
Received: from smtp-190f.mail.infomaniak.ch (smtp-190f.mail.infomaniak.ch [185.125.25.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZPH7S1myVz2yf0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Mar 2025 21:38:39 +1100 (AEDT)
Received: from smtp-4-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10:40ca:feff:fe05:0])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4ZPH7D4YFjzW2y;
	Fri, 28 Mar 2025 11:38:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digikod.net;
	s=20191114; t=1743158312;
	bh=MyuTqVvTP1UPCrUbHlnkU12n+jkzkkYz1VOSQfsDbeM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ubL6rwRE1GKQDgpoFHHnqtWunMExgXmH9SIOevHevMNsSgJymrB8PqtT7RsLdLH6w
	 LH8BY2mtUo8hpXM7UsTfJgikKEEPrGDHXtD/YG1KBqXB9zjymaqJWWlh2+lJ2/0GBJ
	 hyNRO+Q8o5kFKLuA61PJ1bLsF5hhWu4A3JkuEPzU=
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4ZPH735RxtzKRX;
	Fri, 28 Mar 2025 11:38:23 +0100 (CET)
Date: Fri, 28 Mar 2025 11:38:23 +0100
From: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
To: Maxime Ripard <mripard@kernel.org>
Cc: Kees Cook <kees@kernel.org>, 
	Alessandro Carminati <acarmina@redhat.com>, linux-kselftest@vger.kernel.org, 
	David Airlie <airlied@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	=?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Daniel Diaz <daniel.diaz@linaro.org>, David Gow <davidgow@google.com>, 
	Arthur Grillo <arthurgrillo@riseup.net>, Brendan Higgins <brendan.higgins@linux.dev>, 
	Naresh Kamboju <naresh.kamboju@linaro.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Guenter Roeck <linux@roeck-us.net>, Alessandro Carminati <alessandro.carminati@gmail.com>, 
	Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com, 
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	loongarch@lists.linux.dev, x86@kernel.org
Subject: Re: [PATCH v4 00/14] Add support for suppressing warning backtraces
Message-ID: <20250328.sah9oog5ahSh@digikod.net>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250313-abiding-vivid-robin-159dfa@houat>
X-Infomaniak-Routing: alpha
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Mar 13, 2025 at 06:24:25PM +0100, Maxime Ripard wrote:
> Hi,
> 
> On Thu, Mar 13, 2025 at 10:17:49AM -0700, Kees Cook wrote:
> > On Thu, Mar 13, 2025 at 11:43:15AM +0000, Alessandro Carminati wrote:
> > > Some unit tests intentionally trigger warning backtraces by passing bad
> > > parameters to kernel API functions. Such unit tests typically check the
> > > return value from such calls, not the existence of the warning backtrace.
> > 
> > Thanks for picking this series back up! I honestly thought this had
> > already landed. :)
> > 
> > > With CONFIG_KUNIT enabled, image size increase with this series applied is
> > > approximately 1%. The image size increase (and with it the functionality
> > > introduced by this series) can be avoided by disabling
> > > CONFIG_KUNIT_SUPPRESS_BACKTRACE.
> > 
> > Yeah, as with my prior review, I'm a fan of this. It makes a bunch of my
> > very noisy tests much easier to deal with.
> 
> And for the record, we're also affected by this in DRM and would very
> much like to get it merged in one shape or another.

Here is another case:
https://lore.kernel.org/all/20250328.Ahc0thi6CaiJ@digikod.net/

It would be very useful to have this feature merged.  Without it, we may
need to remove useful tests.

