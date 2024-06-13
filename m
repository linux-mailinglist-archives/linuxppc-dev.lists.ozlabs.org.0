Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6BE9079F3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2024 19:35:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JBLHYm0h;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W0V0j09Rsz3dBw
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2024 03:35:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JBLHYm0h;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=lee@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W0Tzz64Z4z3cYT
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jun 2024 03:34:23 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E7EDE61BC4;
	Thu, 13 Jun 2024 17:34:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56CFCC2BBFC;
	Thu, 13 Jun 2024 17:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718300062;
	bh=uq8y9IV3u5SbxvpnajCBPx1S0F6fUsuMA15+er90g/Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=JBLHYm0hDnTwajpj9c2xuRIcbS3jfjsJ3wGK/TNZlfzbSxXyqtC6Lj2gyv1GtUdA/
	 IU+Q9hM4eQdgvgCMU5+Q07qJk+WJOOHK18HauySXsteX5RnlrXWU+R9rZNyvDS7hnt
	 87vByFbRhVzXfPedl1yW8M8wfZBESv6uvik/NMc74jwfsMBuWy7EDFbv18mVLaQh9h
	 54HIIF9hlChYK1Dc6GIAK6CAR3ApYr8NUdOQ46xLfQCrg2rxFNlKilu8/Q4QYZaY5D
	 WxRSTgYeoSM0zVLX2uBiB/31QT9KO+KP+pijfqEGOiNjiUKTf9TJfMERgiIrl8mcpR
	 WvoKCI1v0aJRw==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, 
 Julia Lawall <julia.lawall@inria.fr>, 
 MarileneGarcia <marilene.agarcia@gmail.com>
In-Reply-To: <20240601031713.1307859-1-marilene.agarcia@gmail.com>
References: <20240601031713.1307859-1-marilene.agarcia@gmail.com>
Subject: Re: (subset) [PATCH v3 linux-next] leds: powernv: replace
 of_node_put to __free
Message-Id: <171830006009.2742597.10447114485358333556.b4-ty@kernel.org>
Date: Thu, 13 Jun 2024 18:34:20 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0
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
Cc: Javier Carrasco <javier.carrasco.cruz@gmail.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 01 Jun 2024 00:17:13 -0300, MarileneGarcia wrote:
> Use __free for device_node values, and thus drop calls to
> of_node_put.
> 
> The variable attribute __free adds a scope based cleanup to
> the device node. The goal is to reduce memory management issues
> in the kernel code.
> 
> [...]

Applied, thanks!

[1/1] leds: powernv: replace of_node_put to __free
      commit: 7c85503b6d597b84ea58fe3dd95cd9eaeb1f3206

--
Lee Jones [李琼斯]

