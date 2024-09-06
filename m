Return-Path: <linuxppc-dev+bounces-1114-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D71196F3C4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Sep 2024 13:56:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0ZRq3Kqtz30T8;
	Fri,  6 Sep 2024 21:55:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725623735;
	cv=none; b=lk0Ur/KX/+EhNSlVFyh7B5Lr50YE0Rv6W7jI/0XLnHvYdKr6Upztn1AI6Q8SJG1TSmeMd1bD7rcU6rUsp5r3BU0w4gFIpH0M6ygB7PydJdp0GS6cHv4GETCL9YDFP0dQd+MCm0pptb3ZcYr0Yw0KmGhpfKqIdyvYh/frkh+lOorPaYH6bu94qbdLuYy5a11+bk7ct6TAJb5rGruFNLxzjjbo4WVEaIiESsB6YzEWkL0K8ENpTOvPjkMzwzfh7OwZDe39ROV4w0Vdc0BzWP24zcqUY70jyMV71T955H144ZSkgWquXo6GhzkYohvpVa+K7MCPi4RdPzgpz/cn0RqH+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725623735; c=relaxed/relaxed;
	bh=VFMQjyITsX575+mngCN1LQxxTs5zaxCvJY1k340CyPo=;
	h=DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type; b=Bxtx0bYCPvSxxMDbKXAz8mgIBq7UirhjN3eOFMMTJzWNc5KNeDsiSJiTFGgA+yzRdQZkdfMWfdTxu+6W47pkyBBlKqqX66Z6/eA0/A6A48fHsUwyscxNlCFMLJ72XvNHBnGsW8YnYp6YljnZB6SJVNtUG+z3Nf1JFK75npXbhdZrrB48p0ZB492eBdqqMAs8we4e5kKqx6pfI/+4miKQjr01bljlPWckYuZzr/um3iLWSdz7p6RGzu4GRKMV0n6j2X62l5XOM/V5Oq4cDuzFCA5+poZCHxqUCStsx6N3B9mA7KpSH/7RuwOJJic6QKf4zlu+vSiRNm1/xPrY7DZUBQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=noRXCCC7; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=noRXCCC7;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0ZRq38tmz30Np
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Sep 2024 21:55:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1725623735;
	bh=VFMQjyITsX575+mngCN1LQxxTs5zaxCvJY1k340CyPo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=noRXCCC73wYP1jQqw3g7gJIZ5PIKZCP8hZkHK15ro6irx0+zaLF7r7L5culUu0/k3
	 B+sCZjEAj5SkKioEN5pe+I5f+Kb0HpsILCp2SQEUx2FwXzO+PYFivR2zXa5ffba9QW
	 A/K7GMpRKkqU7IWPpadcaIsgVJWs9oLhDB9YCI0X8Ya4A3p5WOlehJ/Iq2imbLAG+M
	 Fv3wWfXBRHfrjly5NwG5JCnHnLuFHwkBpHts/koPycTgokacV49jif1slYtAYYGLQy
	 vqC/2tUu5qIa5TjspZtam7Aal6X67oFRin9xxBnV/JA7ICoyFE/Uhh5rf8KNBTSurN
	 5daAJm7wTsaiA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X0ZRq0cw4z4x8f;
	Fri,  6 Sep 2024 21:55:35 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
Cc: linux-m68k@lists.linux-m68k.org, geert@linux-m68k.org
In-Reply-To: <20240821082101.877438-1-mpe@ellerman.id.au>
References: <20240821082101.877438-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] macintosh/via-pmu: register_pmu_pm_ops() can be __init
Message-Id: <172562357221.467568.5690027128630498625.b4-ty@ellerman.id.au>
Date: Fri, 06 Sep 2024 21:52:52 +1000
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
Content-Transfer-Encoding: 7bit

On Wed, 21 Aug 2024 18:21:01 +1000, Michael Ellerman wrote:
> register_pmu_pm_ops() is only called at init time, via
> device_initcall(), so can be marked __init. The driver can't be built as
> a module.
> 
> 

Applied to powerpc/next.

[1/1] macintosh/via-pmu: register_pmu_pm_ops() can be __init
      https://git.kernel.org/powerpc/c/a5a670df1db79f4bb462601aa4cc03caffa761a2

cheers

