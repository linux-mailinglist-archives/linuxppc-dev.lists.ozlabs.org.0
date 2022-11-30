Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 914B563D232
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Nov 2022 10:39:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NMZ1D3gJ0z3fWf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Nov 2022 20:39:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NMYqq6sqcz3bbD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Nov 2022 20:31:35 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NMYqq5gTcz4xZl;
	Wed, 30 Nov 2022 20:31:35 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
In-Reply-To: <YzKSLcrYmV5kjyeX@google.com>
References: <YzKSLcrYmV5kjyeX@google.com>
Subject: Re: [PATCH] powerpc/warp: switch to using gpiod API
Message-Id: <166980023651.3017288.11616818512076872736.b4-ty@ellerman.id.au>
Date: Wed, 30 Nov 2022 20:23:56 +1100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 26 Sep 2022 23:03:25 -0700, Dmitry Torokhov wrote:
> This switches PIKA Warp away from legacy gpio API and to newer gpiod
> API, so that we can eventually deprecate the former.
> 
> Because LEDs are normally driven by leds-gpio driver, but the
> platform code also wants to access the LEDs during thermal shutdown,
> and gpiod API does not allow locating GPIO without requesting it,
> the platform code is now responsible for locating GPIOs through device
> tree and requesting them. It then constructs platform data for
> leds-gpio platform device and registers it. This allows platform
> code to retain access to LED GPIO descriptors and use them when needed.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/warp: switch to using gpiod API
      https://git.kernel.org/powerpc/c/1892e87a3e9170146549779622cb844582f1e2bb

cheers
