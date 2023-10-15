Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D5A7C98A0
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Oct 2023 12:09:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=bUVDli48;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S7bZd0BX8z3vyQ
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Oct 2023 21:09:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=bUVDli48;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S7bVQ31R3z3vYy
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 Oct 2023 21:06:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1697364366;
	bh=rSmDJMp3G9hK+xqPuXosnrlvSeh7DhdTVC+45IF9gys=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=bUVDli48G2iyqkwvEk+tsRkNE59kH76RMNLUvO8J6ACPVSEVBTVfDFFs7xkdGAQ24
	 4+xayPKOk5G8zCbkWKCFqVU2xIsfDdp0PnVm2YVOuvMOCpNwf4REBn775VrRVFyVbK
	 4Zg/fpG9RLn+6u2REOFAoRSmAtwb6i90lV0VX4phIPS8k40mVI20voZv8Ohk13n4Mz
	 PLEiRWmrUkrewhm/EyVlf73WqU7DIdUZEI/m8Mg6mF2VAazYi+KcyEfpyin1A+SCwZ
	 +64UZGK4KaeE54F+gCmD5grE2oQSFWUfmhIuazOzYT/+Qdvg/gsEYibknCyOQBQEVx
	 YpItgMs+Rq7WQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4S7bVQ0nYdz4wnx;
	Sun, 15 Oct 2023 21:06:06 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <5de2998c57f3983563b27b39228ea9a7229d4110.1695385984.git.christophe.leroy@csgroup.eu>
References: <5de2998c57f3983563b27b39228ea9a7229d4110.1695385984.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc: Only define __parse_fpscr() when required
Message-Id: <169736429855.960528.8288813432399517714.b4-ty@ellerman.id.au>
Date: Sun, 15 Oct 2023 21:04:58 +1100
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 22 Sep 2023 14:33:13 +0200, Christophe Leroy wrote:
> Clang 17 reports:
> 
> arch/powerpc/kernel/traps.c:1167:19: error: unused function '__parse_fpscr' [-Werror,-Wunused-function]
> 
> __parse_fpscr() is called from two sites. First call is guarded
> by #ifdef CONFIG_PPC_FPU_REGS
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc: Only define __parse_fpscr() when required
      https://git.kernel.org/powerpc/c/c7e0d9bb9154c6e6b2ac8746faba27b53393f25e

cheers
