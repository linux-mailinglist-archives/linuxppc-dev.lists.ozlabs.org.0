Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD2C647056
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Dec 2022 14:01:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NSZ6355m5z3gPv
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Dec 2022 00:01:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NSYs46QCTz3c1n
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Dec 2022 23:50:00 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NSYs45Fvfz4xvr;
	Thu,  8 Dec 2022 23:50:00 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20221128041539.1742489-1-npiggin@gmail.com>
References: <20221128041539.1742489-1-npiggin@gmail.com>
Subject: Re: [PATCH v6 0/4] Option to build big-endian with ELFv2 ABI
Message-Id: <167050318698.1457988.9272432895635894822.b4-ty@ellerman.id.au>
Date: Thu, 08 Dec 2022 23:39:46 +1100
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
Cc: Luis Chamberlain <mcgrof@kernel.org>, Michal Suchánek <msuchanek@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 28 Nov 2022 14:15:35 +1000, Nicholas Piggin wrote:
> This is hopefully the final attempt. Luis was happy for the module
> patch to go via the powerpc tree, so I've put the the ELFv2 for big
> endian build patches into the series. Hopefully we can deprecate
> the ELFv1 ABI
> 
> Since v5, I cleaned up patch 2 as per Christophe's review. And patch
> 4 I removed the EXPERT depends so it's easier to test. It's marked as
> experimental, but we should soon make it default and try to deprecate
> the v1 ABI so we can eventually remove it.
> 
> [...]

Applied to powerpc/next.

[1/4] module: add module_elf_check_arch for module-specific checks
      https://git.kernel.org/powerpc/c/f9231a996e229c13d23f907352c2cea84bd1c30a
[2/4] powerpc/64: Add module check for ELF ABI version
      https://git.kernel.org/powerpc/c/de3d098dd1fc635535e3689c5d4aa0684242adde
[3/4] powerpc/64: Add big-endian ELFv2 flavour to crypto VMX asm generation
      https://git.kernel.org/powerpc/c/505ea33089dcfc3ee3201b0fcb94751165805413
[4/4] powerpc/64: Option to build big-endian with ELFv2 ABI
      https://git.kernel.org/powerpc/c/5017b45946722bdd20ac255c9ae7273b78d1f12e

cheers
