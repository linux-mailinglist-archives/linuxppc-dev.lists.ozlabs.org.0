Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6663C550A6C
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Jun 2022 13:57:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LQrqv2TXdz3dvN
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Jun 2022 21:57:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LQrpp39lMz3059
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Jun 2022 21:56:34 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LQrpj696vz4xXg;
	Sun, 19 Jun 2022 21:56:29 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linux-kernel@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>, "Jason A. Donenfeld" <Jason@zx2c4.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20220611151015.548325-1-Jason@zx2c4.com>
References: <20220611151015.548325-1-Jason@zx2c4.com>
Subject: Re: [PATCH v3 0/3] powerpc: wire up rng during setup_arch
Message-Id: <165563974695.2516477.14135241088366642761.b4-ty@ellerman.id.au>
Date: Sun, 19 Jun 2022 21:55:46 +1000
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 11 Jun 2022 17:10:12 +0200, Jason A. Donenfeld wrote:
> The platform's RNG must be available before random_init() in order to be
> useful for initial seeding, which in turn means that it needs to be
> called from setup_arch(), rather than from an init call. This series
> wires that up properly on the three platforms that currently initialize
> the RNG from the wrong place.
> 
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> 
> [...]

Patches 1 & 3 applied to powerpc/fixes.

[1/3] powerpc/microwatt: wire up rng during setup_arch
      https://git.kernel.org/powerpc/c/20a9689b3607456d92c6fb764501f6a95950b098
[3/3] powerpc/pseries: wire up rng during setup_arch
      https://git.kernel.org/powerpc/c/e561e472a3d441753bd012333b057f48fef1045b

cheers
