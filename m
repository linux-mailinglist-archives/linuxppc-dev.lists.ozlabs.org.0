Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D44A288200
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Oct 2020 08:14:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C6yTS1G6RzDqf5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Oct 2020 17:14:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C6yFG4JLtzDqWY
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Oct 2020 17:04:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4C6yFF4Xm8z9sVM; Fri,  9 Oct 2020 17:04:01 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <27951fa6c9a8f80724d1bc81a6117ac32343a55d.1601362098.git.christophe.leroy@csgroup.eu>
References: <27951fa6c9a8f80724d1bc81a6117ac32343a55d.1601362098.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v3 1/8] powerpc: Remove SYNC on non 6xx
Message-Id: <160222339231.867048.15565542201153601563.b4-ty@ellerman.id.au>
Date: Fri,  9 Oct 2020 17:04:01 +1100 (AEDT)
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 29 Sep 2020 06:48:31 +0000 (UTC), Christophe Leroy wrote:
> SYNC is usefull for Powerpc 601 only. On everything else,
> SYNC is empty.
> 
> Remove it from code that is not made to run on 6xx.

Applied to powerpc/next.

[1/8] powerpc: Remove SYNC on non 6xx
      https://git.kernel.org/powerpc/c/ca1d3443b4dd1e8f152bd6c881ddb3eb2996179a
[2/8] powerpc: Remove CONFIG_PPC601_SYNC_FIX
      https://git.kernel.org/powerpc/c/e42a64002a507bf61e57106ed5323b1854371563
[3/8] powerpc: Drop SYNC_601() ISYNC_601() and SYNC()
      https://git.kernel.org/powerpc/c/d2a5cd83ee984c0e9fc172d2df9591c264261a52
[4/8] powerpc: Remove PowerPC 601
      https://git.kernel.org/powerpc/c/f0ed73f3fa2cdca65973659689ec9e46d99a5f60
[5/8] powerpc: Remove support for PowerPC 601
      https://git.kernel.org/powerpc/c/8b14e1dff067195dca7a42321771437cb33a99e9
[6/8] powerpc: Tidy up a bit after removal of PowerPC 601.
      https://git.kernel.org/powerpc/c/2e38ea486615bddbc7a42d002aee93a3a9e7a36f
[7/8] powerpc: Remove __USE_RTC()
      https://git.kernel.org/powerpc/c/a4c5a355422920bcbfe3fd1f01aead2d3a2a820c
[8/8] powerpc: Remove get_tb_or_rtc()
      https://git.kernel.org/powerpc/c/6601ec1c2ba929430f5585ce7f9d9960b0e0a01d

cheers
