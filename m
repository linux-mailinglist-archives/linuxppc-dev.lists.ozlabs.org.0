Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C426C55ADC5
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Jun 2022 02:29:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LVsDS568Gz3cj8
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Jun 2022 10:29:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LVsD26xJ3z3bYG
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Jun 2022 10:28:50 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LVsD22mHNz4xZB;
	Sun, 26 Jun 2022 10:28:50 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, stable <stable@vger.kernel.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>, linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>, LKML <linux-kernel@vger.kernel.org>
In-Reply-To: <20220621140849.127227-1-Jason@zx2c4.com>
References: <20220620124531.78075-1-Jason@zx2c4.com> <20220621140849.127227-1-Jason@zx2c4.com>
Subject: Re: [PATCH v5] powerpc/powernv: wire up rng during setup_arch
Message-Id: <165620330450.1934578.17474382204617879607.b4-ty@ellerman.id.au>
Date: Sun, 26 Jun 2022 10:28:24 +1000
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

On Tue, 21 Jun 2022 16:08:49 +0200, Jason A. Donenfeld wrote:
> The platform's RNG must be available before random_init() in order to be
> useful for initial seeding, which in turn means that it needs to be
> called from setup_arch(), rather than from an init call. Fortunately,
> each platform already has a setup_arch function pointer, which means we
> can wire it up that way. Complicating things, however, is that POWER8
> systems need some per-cpu state and kmalloc, which isn't available at
> this stage. So we split things up into an early phase and a later
> opportunistic phase. This commit also removes some noisy log messages
> that don't add much.
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/powernv: wire up rng during setup_arch
      https://git.kernel.org/powerpc/c/f3eac426657d985b97c92fa5f7ae1d43f04721f3

cheers
