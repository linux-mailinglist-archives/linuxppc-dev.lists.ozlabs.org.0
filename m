Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F037E2D5B0B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 13:59:57 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CsDXV1hvdzDqyG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 23:59:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CsBXf1xTqzDqk7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Dec 2020 22:29:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4CsBXd0xhjz9sXL; Thu, 10 Dec 2020 22:29:52 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <da51f7ec632825a4ce43290a904aad61648408c0.1606285013.git.christophe.leroy@csgroup.eu>
References: <da51f7ec632825a4ce43290a904aad61648408c0.1606285013.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v1 1/8] powerpc/32s: Always map kernel text and rodata
 with BATs
Message-Id: <160756606979.1313423.763672352823018023.b4-ty@ellerman.id.au>
Date: Thu, 10 Dec 2020 22:29:52 +1100 (AEDT)
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

On Wed, 25 Nov 2020 07:10:46 +0000 (UTC), Christophe Leroy wrote:
> Since commit 2b279c0348af ("powerpc/32s: Allow mapping with BATs with
> DEBUG_PAGEALLOC"), there is no real situation where mapping without
> BATs is required.
> 
> In order to simplify memory handling, always map kernel text
> and rodata with BATs even when "nobats" kernel parameter is set.
> 
> [...]

Applied to powerpc/next.

[1/8] powerpc/32s: Always map kernel text and rodata with BATs
      https://git.kernel.org/powerpc/c/035b19a15a98907916a42a6b1d025877c42f10ad
[2/8] powerpc/32s: Don't hash_preload() kernel text
      https://git.kernel.org/powerpc/c/79d1befe054ad4adb277fbd2d2756b1394eaf24e
[3/8] powerpc/32s: Fix an FTR_SECTION_ELSE
      https://git.kernel.org/powerpc/c/7b107a71e732c298d684ee1bafd82f1a2be58d5e
[4/8] powerpc/32s: Don't use SPRN_SPRG_PGDIR in hash_page
      https://git.kernel.org/powerpc/c/03d701c2d9b0091cf8e96cb49ab7d2a6a9f19937
[5/8] powerpc/603: Use SPRN_SDR1 to store the pgdir phys address
      https://git.kernel.org/powerpc/c/c4a22611bf6ced73d86bdfc0604d7db8982a24a4
[6/8] powerpc/32: Simplify EXCEPTION_PROLOG_1 macro
      https://git.kernel.org/powerpc/c/6285f9cff570bfd07b542840912c1d01bd5428e0
[7/8] powerpc/32s: Use SPRN_SPRG_SCRATCH2 in DSI prolog
      https://git.kernel.org/powerpc/c/de1cd0790697e67b728de43e8657bb52f528bfb9
[8/8] powerpc/32: Use SPRN_SPRG_SCRATCH2 in exception prologs
      https://git.kernel.org/powerpc/c/d2e006036082e2dc394c5ec86c5bb88cc27c0749

cheers
