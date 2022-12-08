Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1C2647036
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Dec 2022 13:57:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NSZ226RGDz3fvs
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Dec 2022 23:57:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NSYrz6zr4z3bfY
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Dec 2022 23:49:55 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NSYry4j1Hz4xvZ;
	Thu,  8 Dec 2022 23:49:54 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Thomas Weißschuh <linux@weissschuh.net>, "Rafael J. Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org, Russ Weight <russell.h.weight@intel.com>, Luis Chamberlain <mcgrof@kernel.org>
In-Reply-To: <20221126051002.123199-1-linux@weissschuh.net>
References: <20221126051002.123199-1-linux@weissschuh.net>
Subject: Re: (subset) [PATCH 1/3] firmware_loader: remove #include <generated/utsrelease.h>
Message-Id: <167050316389.1457988.14120979930273544079.b4-ty@ellerman.id.au>
Date: Thu, 08 Dec 2022 23:39:23 +1100
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
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 26 Nov 2022 06:09:59 +0100, Thomas Weißschuh wrote:
> utsrelease.h is potentially generated on each build.
> By removing this unused include we can get rid of some spurious
> recompilations.
> 
> 

Applied to powerpc/next.

[2/3] powerpc/book3e: remove #include <generated/utsrelease.h>
      https://git.kernel.org/powerpc/c/d5090716be6791ada9ee142163a4934c1c147aaa

cheers
