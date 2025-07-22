Return-Path: <linuxppc-dev+bounces-10348-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CCFB0CEC8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jul 2025 02:35:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bmJFn72V1z2yLB;
	Tue, 22 Jul 2025 10:35:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753144525;
	cv=none; b=TJYbvnoGsBaLrLrOL8IjgiDG1AP74Uu6iYR8uChpziJ53j+951vDBriRwopTzCMCFSYAsxP3wP8j7hLvsLKqrrNt8Sbq6fJ0723faNeBSf/QLOkKKuI+gTFiAvQlztDvct4fY78I52Z9z6dkMaZDUGeyDoVtfI8PT5pYzN3K4gIQh6yR1Mo5ayKhBz1sMMMKMALfbHM/eu/OsWPmGrIQQjdszmfQtIeJAHSAgvyHm7j7PbKlpLPzZqxzIFuM74vGFdHf7Me69TBUvzWd6u9zB97lP3Kxybm3pQp77oDgM17NoE+hGoqK0TRysORCGtvCobNDOZHeajleDAB5qigdvw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753144525; c=relaxed/relaxed;
	bh=EsXWWPwR7DnfbUiy0T1Ep+dd0MnCyz+JTCzy2sAeeEk=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=FMSvH4u/EXYlpmLF7CBMdumu0w40L7yPO4bldnU07cgpe9pIAYdvTmRGUCqu1oYVoDbIZ8dTCIXXB9jutoMp7QosjCVVYdSeutju93yj/Eg9ZmMTKNScoIwzSS81nJD/+YvcQ12n4O1ABvg/7xlp00AiiQuEyegyFlWZuY8j3FJ2JTSqvRrzMfZBis+7/6RBqaN7v0vWDw/oxrfPvxp74x5OmWnJJQNrj2fQsvWeKyL9djxzJhG/L4I/yIy8PbUVn5D3reNWqSJTcme2HjXDY1/62xuRb7vgoIyk18P0OZcDqMiQR6iODVDu8b2CwWUZFWH7bjcmBvgl2b6hpTYDxA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=INuAml7a; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=INuAml7a;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bmJFm31vYz2xTh
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jul 2025 10:35:24 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8B10445E94;
	Tue, 22 Jul 2025 00:35:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7F17C4CEF6;
	Tue, 22 Jul 2025 00:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1753144521;
	bh=AT7biWnsDCxaCvU7U+iSpw4vNS5TBQoe3SiDN0kL4kw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=INuAml7aaOfZKzIUxI4Jtp5dIRPXceDiGCMSn/BcpBEsTc1817QQF/mLnLo7zVGvC
	 tbq9rI4BZrhjCeeHWJKHB4TAfP28laWLUpmcWr4W9hiZ6ObpNJJQoYLudeaLJcdFFn
	 UTOfW5v0jeh5cKAcLjqgeLQM4saR33e63KErjkHU=
Date: Mon, 21 Jul 2025 17:35:20 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: Sabyrzhan Tasbolatov <snovitoll@gmail.com>, hca@linux.ibm.com,
 christophe.leroy@csgroup.eu, andreyknvl@gmail.com, agordeev@linux.ibm.com,
 glider@google.com, dvyukov@google.com, kasan-dev@googlegroups.com,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-um@lists.infradead.org,
 linux-mm@kvack.org
Subject: Re: [PATCH v3 01/12] lib/kasan: introduce CONFIG_ARCH_DEFER_KASAN
 option
Message-Id: <20250721173520.a24c29782de519dab1c59fec@linux-foundation.org>
In-Reply-To: <a1bc7a9d-817d-49cc-b7f1-79a900090136@gmail.com>
References: <20250717142732.292822-1-snovitoll@gmail.com>
	<20250717142732.292822-2-snovitoll@gmail.com>
	<20250717151048.bb6124bea54a31cd2b41faaf@linux-foundation.org>
	<a1bc7a9d-817d-49cc-b7f1-79a900090136@gmail.com>
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
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, 22 Jul 2025 01:18:52 +0200 Andrey Ryabinin <ryabinin.a.a@gmail.com> wrote:

> >> Architectures that need deferred KASAN should select this option.
> >> Architectures that can enable KASAN early will get compile-time
> >> optimizations instead of runtime checks.
> > 
> > Looks nice and appears quite mature.  I'm reluctant to add it to mm.git
> > during -rc6, especially given the lack of formal review and ack tags.
> > 
> > But but but, that's what the mm-new branch is for.  I guess I'll add it
> > to get some additional exposure, but whether I'll advance it into
> > mm-unstable/linux-next for this cycle is unclear.
> > 
> > What do you (and others) think?
> 
> After looking a bit, it breaks UM and probably LoongArch too.
> I'd say it needs more work and not ready even for mm-new.

OK, thanks.  I'll drop the v3 series.

