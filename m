Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 84235565434
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 13:57:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lc47R3PWtz3c7V
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 21:57:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lc4731mHjz2ypW
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Jul 2022 21:57:35 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Lc47309wXz4xRC;
	Mon,  4 Jul 2022 21:57:34 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: sachinp@linux.ibm.com, mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, "Jason A. Donenfeld" <Jason@zx2c4.com>
In-Reply-To: <20220630121654.1939181-1-Jason@zx2c4.com>
References: <Yr2PQSZWVtr+Y7a2@zx2c4.com> <20220630121654.1939181-1-Jason@zx2c4.com>
Subject: Re: [PATCH] powerpc/powernv: delay rng of node creation until later in boot
Message-Id: <165693584227.28268.7476594313726679089.b4-ty@ellerman.id.au>
Date: Mon, 04 Jul 2022 21:57:22 +1000
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
Cc: stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 30 Jun 2022 14:16:54 +0200, Jason A. Donenfeld wrote:
> The of node for the rng must be created much later in boot. Otherwise it
> tries to connect to a parent that doesn't yet exist, resulting on this
> splat:
> 
> [    0.000478] kobject: '(null)' ((____ptrval____)): is not initialized, yet kobject_get() is being called.
> [    0.002925] [c000000002a0fb30] [c00000000073b0bc] kobject_get+0x8c/0x100 (unreliable)
> [    0.003071] [c000000002a0fba0] [c00000000087e464] device_add+0xf4/0xb00
> [    0.003194] [c000000002a0fc80] [c000000000a7f6e4] of_device_add+0x64/0x80
> [    0.003321] [c000000002a0fcb0] [c000000000a800d0] of_platform_device_create_pdata+0xd0/0x1b0
> [    0.003476] [c000000002a0fd00] [c00000000201fa44] pnv_get_random_long_early+0x240/0x2e4
> [    0.003623] [c000000002a0fe20] [c000000002060c38] random_init+0xc0/0x214
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/powernv: delay rng of node creation until later in boot
      https://git.kernel.org/powerpc/c/887502826549caa7e4215fd9e628f48f14c0825a

cheers
