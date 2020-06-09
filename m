Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 086641F339D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 07:50:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49gzjb27CrzDqZ2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 15:50:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49gzDs4P39zDqRs
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jun 2020 15:28:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49gzDq4Mzpz9sTY; Tue,  9 Jun 2020 15:28:42 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>, naveen.n.rao@linux.vnet.ibm.com
In-Reply-To: <1ae02b6637b87fc5aaa1d5012c3e2cb30e62b4a3.1585670437.git.christophe.leroy@c-s.fr>
References: <1ae02b6637b87fc5aaa1d5012c3e2cb30e62b4a3.1585670437.git.christophe.leroy@c-s.fr>
Subject: Re: [PATCH v2 01/12] powerpc/52xx: Blacklist functions running with
 MMU disabled for kprobe
Message-Id: <159168034995.1381411.12691438266986038237.b4-ty@ellerman.id.au>
Date: Tue,  9 Jun 2020 15:28:42 +1000 (AEST)
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

On Tue, 31 Mar 2020 16:03:36 +0000 (UTC), Christophe Leroy wrote:
> kprobe does not handle events happening in real mode, all
> functions running with MMU disabled have to be blacklisted.

Applied to powerpc/next.

[01/12] powerpc/52xx: Blacklist functions running with MMU disabled for kprobe
        https://git.kernel.org/powerpc/c/e83f01fdb9143a4f90b17fbf7d8b8b21efb2f968
[02/12] powerpc/82xx: Blacklist pq2_restart() for kprobe
        https://git.kernel.org/powerpc/c/1740f15a99d30a5e2710b2b0754e65fc5ba68d1d
[03/12] powerpc/83xx: Blacklist mpc83xx_deep_resume() for kprobe
        https://git.kernel.org/powerpc/c/7aa85127b1a170694b042cbc35a07afe3904173e
[04/12] powerpc/powermac: Blacklist functions running with MMU disabled for kprobe
        https://git.kernel.org/powerpc/c/32a820670fa00419375a964ca8bc569e1499b90d
[05/12] powerpc/mem: Blacklist flush_dcache_icache_phys() for kprobe
        https://git.kernel.org/powerpc/c/a64371b5d4fb37199dcd04cb7bf0132894018e33
[06/12] powerpc/32s: Make local symbols non visible in hash_low.
        https://git.kernel.org/powerpc/c/f892c21d2efb3b86ecbf8f5a95ea4abeedcc91b0
[07/12] powerpc/32s: Blacklist functions running with MMU disabled for kprobe
        https://git.kernel.org/powerpc/c/e6209318d63e2774c5ab214b14b948079e040064
[08/12] powerpc/rtas: Remove machine_check_in_rtas()
        https://git.kernel.org/powerpc/c/32746dfe4cf37f4077929601e8877a7fd02676e8
[09/12] powerpc/32: Blacklist functions running with MMU disabled for kprobe
        https://git.kernel.org/powerpc/c/5f32e8361cba8c58c4f272a389296f489ecc2823
[10/12] powerpc/entry32: Blacklist exception entry points for kprobe.
        https://git.kernel.org/powerpc/c/a616c442119f2ea5641e6abc215d7255b73b982b
[11/12] powerpc/entry32: Blacklist syscall exit points for kprobe.
        https://git.kernel.org/powerpc/c/7cdf4401388572f720403a7038a178a4b30ac14c
[12/12] powerpc/entry32: Blacklist exception exit points for kprobe.
        https://git.kernel.org/powerpc/c/e51c3e13709fe55d4d0eb50ba435bc53a64152bf

cheers
