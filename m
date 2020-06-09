Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8FC1F33E0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 07:59:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49gzvm1vWGzDqMV
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 15:59:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49gzDz4SRVzDqRd
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jun 2020 15:28:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49gzDx2mjjz9sTb; Tue,  9 Jun 2020 15:28:48 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: michal.simek@xilinx.com, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>, arnd@arndb.de
In-Reply-To: <cover.1590079968.git.christophe.leroy@csgroup.eu>
References: <cover.1590079968.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v5 00/13] Modernise powerpc 40x
Message-Id: <159168033223.1381411.14580094503397459491.b4-ty@ellerman.id.au>
Date: Tue,  9 Jun 2020 15:28:48 +1000 (AEST)
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

On Thu, 21 May 2020 16:55:51 +0000 (UTC), Christophe Leroy wrote:
> v1 and v2 of this series were aiming at removing 40x entirely,
> but it led to protests.
> 
> v3 is trying to start modernising powerpc 40x:
> - Rework TLB miss handlers to not use PTE_ATOMIC_UPDATES and _PAGE_HWWRITE
> - Remove old versions of 40x processors, namely 403 and 405GP and associated
> errata.
> - Last two patches are trivial changes in TLB miss handlers to reduce number
> of scratch registers.
> 
> [...]

Applied to powerpc/next.

[01/13] powerpc: Remove Xilinx PPC405/PPC440 support
        https://git.kernel.org/powerpc/c/7ade8495dcfd788a76e6877c9ea86f5207369ea4
[02/13] powerpc/40x: Rework 40x PTE access and TLB miss
        https://git.kernel.org/powerpc/c/2c74e2586bb96012ffc05f1c819b05d9cad86d6e
[03/13] powerpc/pgtable: Drop PTE_ATOMIC_UPDATES
        https://git.kernel.org/powerpc/c/4e1df545e2fae53e07c93b835c3dcc9d4917c849
[04/13] powerpc/40x: Remove support for IBM 403GCX
        https://git.kernel.org/powerpc/c/1b5c0967ab8aa9424cdd5108de4e055d8aeaa9d0
[05/13] powerpc/40x: Remove STB03xxx
        https://git.kernel.org/powerpc/c/7583b63c343c1076c89b2012fd8758473f046f5f
[06/13] powerpc/40x: Remove WALNUT
        https://git.kernel.org/powerpc/c/5786074b96e38691a0cb3d3644ca2aa5d6d8830d
[07/13] powerpc/40x: Remove EP405
        https://git.kernel.org/powerpc/c/548f5244f1064c9facb19c5e97c21e1e80102ea0
[08/13] powerpc/40x: Remove support for ISS Simulator
        https://git.kernel.org/powerpc/c/2874ec75708eed59a47a9a986c02add747ae6e9b
[09/13] powerpc/40x: Remove support for IBM 405GP
        https://git.kernel.org/powerpc/c/7d372d4ccdd55d5ead4d4ecbc336af4dd7d04344
[10/13] powerpc/40x: Remove IBM405 Erratum #51
        https://git.kernel.org/powerpc/c/59fb463b48e904dfdfff64c7dd4d67f20ae27170
[11/13] powerpc: Remove IBM405 Erratum #77
        https://git.kernel.org/powerpc/c/455531e9d88048c025ff9099796413df748d92b9
[12/13] powerpc/40x: Avoid using r12 in TLB miss handlers
        https://git.kernel.org/powerpc/c/797f4016f6da4a90ac83e32b213b68ff7be3812b
[13/13] powerpc/40x: Don't save CR in SPRN_SPRG_SCRATCH6
        https://git.kernel.org/powerpc/c/3aacaa719b7bf135551cabde2480e8f7bfdf7c7d

cheers
