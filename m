Return-Path: <linuxppc-dev+bounces-7998-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D5BA9D743
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Apr 2025 04:32:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZktzX0Mwsz2yQj;
	Sat, 26 Apr 2025 12:32:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745634775;
	cv=none; b=LLSOeSpqdNU+DWlDB9fy6raAKuOlAkZL4BuchIcv8qs28OiJwMNjBz2vCFbaerzn3KfesmVLUMSuLY+umYMfgOBn9HbXsqiCzmUZ7nKS8OjQhqRO8FFr6CLhnDb/cl175e3Xm441XUCusIOgGcDclKlWM8WMj+/DYx1NQRgmlXA4aoYzDA7VMBNeuW4OGfhEt6TLdkH1NxicIyo6DUBlrHcBlmDCFyQWzwyXx2koV5lWQGv8U/NQ4IUNF3BwFncQBtjtf3R0pqijgdjjju30suG1JrWOaAiIFcc5KUpL1oUoR6yOO3hMMaZ7kDbEsOEJTvWVheIKwVjTsKpY+Z//JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745634775; c=relaxed/relaxed;
	bh=WO7eWXyXja/pBDQqGkycraX/ZPkQh9anLKZNoyGDKdE=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=c6qsrtQ6p96yw0r/TXYPQWq93jzhBJZ9Urw74dl5SKBy9jJVzdr7PO13xldWaARgPThogUY637ZavG/X4VoR1WfDeRQViSrXtDJROs1vw1TQ9KW0buE+5BBFvLeYyOqEY1N3uDU49QnyLUCk/toPN1H5yMVxtJndpkgXZy7m1Zdme5FRo/mjdmGw9/dh+x79uBavVll38YeYL21jxdIotVxSCerQfXvEjHPqP5DN5T5whTjN3i5zFTR/m3dsf51IH44C6NbyOR2YOKjlKwQ/C9gMVqSMxe5wFFoz1K5RyKQVRwin0SR9wzZbK0CNFHMRnzqSvfwxRwVZpP1Eo1QZnQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=NV3HH5cT; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=NV3HH5cT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZktzV26bsz2yMt
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Apr 2025 12:32:53 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D961F5C7045;
	Sat, 26 Apr 2025 02:30:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B430EC4CEE4;
	Sat, 26 Apr 2025 02:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1745634770;
	bh=+RUTWIt3VFeUueyp+/LHBU7OQa1nslQTo03DjgGapQA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NV3HH5cTytNLqUSnhZu/e/1hOQv76j3RXu91ccBhnAZKPShm2ywlHlwxEmP2NFyJ8
	 9mJGv0SrHBCtXVkieOdFVL+aj36B86SkAmVo+3g7zY7zwp1CWMsmr/ZbWtOT8bEZyr
	 8NA5f5WhQqLgsoDwMQL/xkJ+DI4oOl2RlkHukU3w=
Date: Fri, 25 Apr 2025 19:32:49 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Alessandro Carminati <acarmina@redhat.com>
Cc: linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>, Arnd
 Bergmann <arnd@arndb.de>, =?ISO-8859-1?Q?Ma=EDra?= Canal
 <mcanal@igalia.com>, Dan Carpenter <dan.carpenter@linaro.org>, Kees Cook
 <keescook@chromium.org>, Daniel Diaz <daniel.diaz@linaro.org>, David Gow
 <davidgow@google.com>, Arthur Grillo <arthurgrillo@riseup.net>, Brendan
 Higgins <brendan.higgins@linux.dev>, Naresh Kamboju
 <naresh.kamboju@linaro.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Ville =?ISO-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>, Daniel
 Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, Guenter
 Roeck <linux@roeck-us.net>, Alessandro Carminati
 <alessandro.carminati@gmail.com>, Jani Nikula <jani.nikula@intel.com>,
 dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, loongarch@lists.linux.dev, x86@kernel.org
Subject: Re: [PATCH v4 00/14] Add support for suppressing warning backtraces
Message-Id: <20250425193249.78b45d2589575c15f483c3d8@linux-foundation.org>
In-Reply-To: <20250313114329.284104-1-acarmina@redhat.com>
References: <20250313114329.284104-1-acarmina@redhat.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, 13 Mar 2025 11:43:15 +0000 Alessandro Carminati <acarmina@redhat.com> wrote:

> Some unit tests intentionally trigger warning backtraces by passing bad
> parameters to kernel API functions. Such unit tests typically check the
> return value from such calls, not the existence of the warning backtrace.

I've had this series in mm.git's mm-new branch for a while.  I didn't
send it up for 6.15-rc1 due to what I believe to be unresolved review
issues.

I'll drop this v4 series.  Please resend if/when suitable.

Some notes I have taken are:

https://lkml.kernel.org/r/202504190918.JLNuRGVb-lkp@intel.com
https://lkml.kernel.org/r/20250402074550.GQ5880@noisy.programming.kicks-ass.net
#arm64-add-support-for-suppressing-warning-backtraces.patch: check review

Some fixes I had merged which presumably should be carried forward are
https://lore.kernel.org/all/20250330212934.3F898C4CEDD@smtp.kernel.org/T/
https://lkml.kernel.org/r/20250330212739.85827C4CEDD@smtp.kernel.org

Thanks.

