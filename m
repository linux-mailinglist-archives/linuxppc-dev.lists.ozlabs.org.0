Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B668393395
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 May 2021 18:21:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FrY3t0ZyTz30Hk
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 May 2021 02:21:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=d4sZZsiX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lwn.net
 (client-ip=2600:3c01:e000:3a1::42; helo=ms.lwn.net;
 envelope-from=corbet@lwn.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256
 header.s=20201203 header.b=d4sZZsiX; dkim-atps=neutral
X-Greylist: delayed 562 seconds by postgrey-1.36 at boromir;
 Fri, 28 May 2021 02:21:19 AEST
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FrY3M4GCPz2yjY
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 May 2021 02:21:19 +1000 (AEST)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 0760C2DC;
 Thu, 27 May 2021 16:11:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 0760C2DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1622131910; bh=/V6X7dFIwH+ijI90SpG+HfotiquNJzXcSWfeZUVQZJU=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=d4sZZsiXsjR2ff82rfNhnB14MI3OXov3P55fHna4KA21wAeFbZui72REPTg5lySqP
 OSq3SCgJMMe+2aIQp6Dr5ihJVsgUwJcdGzLj8iS7wofTjHx0tTqVRGmpqmHnmlswsq
 TggGdvTgB6gMubKiDQWBeX0d/EzpH+YFcZbeyRAqHjfckcwaWE0w0ufBU+oO1ZhRn/
 5pM6nZlmwCkvbdzZ5APkxdie6RyxAO37WQtDPdbnVae3FJ6GNTQHZM6tSfoGgZfBHQ
 waZWnn7euw3aCgqUhmU1zOdQ8KLu0zbRK4LgD11Qs2WZis5CY3VWHsc3Ddkavgm0Bl
 d2VZX73kNcmiA==
From: Jonathan Corbet <corbet@lwn.net>
To: Barry Song <song.bao.hua@hisilicon.com>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: kernel-parameters: mark numa=off is supported by
 a bundle of architectures
In-Reply-To: <20210524051715.13604-1-song.bao.hua@hisilicon.com>
References: <20210524051715.13604-1-song.bao.hua@hisilicon.com>
Date: Thu, 27 May 2021 10:11:49 -0600
Message-ID: <87v9742m2i.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Barry Song <song.bao.hua@hisilicon.com>, aou@eecs.berkeley.edu,
 catalin.marinas@arm.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com,
 paulus@samba.org, linux-riscv@lists.infradead.org, will@kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Barry Song <song.bao.hua@hisilicon.com> writes:

> risc-v and arm64 support numa=off by common arch_numa_init()
> in drivers/base/arch_numa.c. x86, ppc, mips, sparc support it
> by arch-level early_param.
> numa=off is widely used in linux distributions. it is better
> to document it.
>
> Signed-off-by: Barry Song <song.bao.hua@hisilicon.com>
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 3 +++
>  1 file changed, 3 insertions(+)

Applied, thanks.

jon
