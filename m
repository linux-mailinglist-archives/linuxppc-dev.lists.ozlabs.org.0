Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A21792FAC2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2024 14:55:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WLBQy0579z3g14
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2024 22:55:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WLBNy2QHNz3cBG
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jul 2024 22:53:54 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WLBNx5qhvz4x1V;
	Fri, 12 Jul 2024 22:53:53 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Nick Bowler <nbowler@draconx.ca>
In-Reply-To: <20240711035428.16696-1-nbowler@draconx.ca>
References: <20240711035428.16696-1-nbowler@draconx.ca>
Subject: Re: [PATCH] macintosh/therm_windtunnel: fix module unload.
Message-Id: <172078879460.310795.17178596698046388308.b4-ty@ellerman.id.au>
Date: Fri, 12 Jul 2024 22:53:14 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: Pawel Moll <pawel.moll@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 10 Jul 2024 23:54:17 -0400, Nick Bowler wrote:
> The of_device_unregister call in therm_windtunnel's module_exit procedure
> does not fully reverse the effects of of_platform_device_create in the
> module_init prodedure.  Once you unload this module, it is impossible
> to load it ever again since only the first of_platform_device_create
> call on the fan node succeeds.
> 
> This driver predates first git commit, and it turns out back then
> of_platform_device_create worked differently than it does today.
> So this is actually an old regression.
> 
> [...]

Applied to powerpc/next.

[1/1] macintosh/therm_windtunnel: fix module unload.
      https://git.kernel.org/powerpc/c/fd748e177194ebcbbaf98df75152a30e08230cc6

cheers
