Return-Path: <linuxppc-dev+bounces-1290-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A958E97688C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2024 14:02:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X4GJl0LxSz2yHL;
	Thu, 12 Sep 2024 22:02:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726142534;
	cv=none; b=WQ7QvuPnA2e0ksrt7K/bfwEW8ZoeSjw1jOC7N++y16iYSGMfjt+2uiDVsoLWAVVM7DuXj9UHaDvEHt7OrVrvkxKcqhHoRQO7fKXqFEpXH/ewXJOZ1RVkvblgNRTY8r+lxv85QQeYlA2PLCPhxeBV9VU1q5q/Tp+JcT1BIFM2ATWxBskOXRXWAIPcydQ9Q4Pj3gQX9EnJM6XEO98l4Qy2BCDWWC6ohAw0LedMsdJgU/fM0TKU62bXxTjlWWIUTgfWOXP7adSbgql6RYuirBP2NsStzb5WL4lmMRQeVqvcPZmx0/sd/CrbSYjIczlwttrqWlgvh3QuSbw1E0vHUoBpZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726142534; c=relaxed/relaxed;
	bh=Qseo0Yqr6orQS3uCv+D/o++NlUJfRYMYDXP8ZsNAymg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Pvk1087QmHNu2bz5adnrV9sZBIHpOLDIS8nGLGZTFgItb/XzLFQug44kGk5SKaAEySRO26JkRnRXnTozMDkItxRlvkEzaSX6kIfOdbf/KMgewhJbbGqEa9XroxKd87wQRl4dt1eqfpRGXu7uLOwbiANp5MF9IBlgP3hif/LULp5+w2DQAyrmK0Eo5D646IWeXcW6TUJAhHCSqUyYzcYmuzmBwauxpxtHLDUDWi0PgdRSoexbw0o/TdEcUWxN/EwaiEwzk+2kZQk0gYUL/gF3QsrWHghjW9oFMpwwG+x1KAJj+4/aUspvr7zc4CDKsx19/ucyozQsvpKfSYM5lb9DdQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=QgwmhWWa; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=QgwmhWWa;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X4GJk6xXTz2yV8
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2024 22:02:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1726142534;
	bh=Qseo0Yqr6orQS3uCv+D/o++NlUJfRYMYDXP8ZsNAymg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=QgwmhWWaI9Jt3RBQy7Wflez3rKJOUBjs+PBJOfClXjRegvG2eHqWfP1fth+Vrv/aK
	 lUWPpGPFl51havneggrKk195qWXTlD65XqMM4aJwITOnW44GBoaDxInW0BnFa+IHeA
	 QmaZrP9C/ypPeAX3ru34Ac4TvqspWBFECI7NkaedSKeeF1/asC9SzEP1MA6KlRPruw
	 s6DVLclwfQFjfqthr56WakSvfUCZG686L2S8uv0LASA7ArbuAlER7uyR2YylHRINcd
	 sN1TciQdsni+4BwZTtA6D0mBJraCdA6/QyOVghGbtAcOOeF2ogT8DU31PYcugmpD+L
	 Sp2nYUbsSFNEQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X4GJk1vmDz4x7G;
	Thu, 12 Sep 2024 22:02:14 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, Uwe Kleine-König <u.kleine-koenig@baylibre.com>
Cc: Anatolij Gustschin <agust@denx.de>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, Scott Wood <oss@buserror.net>, Haoran Liu <liuhaoran14@163.com>, Vaibhav Jain <vaibhav@linux.ibm.com>, Shivaprasad G Bhat <sbhat@linux.ibm.com>, Ira Weiny <ira.weiny@intel.com>, Jeff Johnson <quic_jjohnson@quicinc.com>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20240909130902.851274-2-u.kleine-koenig@baylibre.com>
References: <20240909130902.851274-2-u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH] powerpc: Switch back to struct platform_driver::remove()
Message-Id: <172614240967.1297852.10594594715132101715.b4-ty@ellerman.id.au>
Date: Thu, 12 Sep 2024 22:00:09 +1000
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 09 Sep 2024 15:09:02 +0200, Uwe Kleine-König wrote:
> After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> return void") .remove() is (again) the right callback to implement for
> platform drivers.
> 
> Convert all pwm drivers to use .remove(), with the eventual goal to drop
> struct platform_driver::remove_new(). As .remove() and .remove_new() have
> the same prototypes, conversion is done by just changing the structure
> member name in the driver initializer.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc: Switch back to struct platform_driver::remove()
      https://git.kernel.org/powerpc/c/01d34cc93639172272c3e47edd5cf1a3ffc6dc7a

cheers

