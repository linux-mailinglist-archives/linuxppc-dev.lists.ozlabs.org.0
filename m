Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C632F646FFF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Dec 2022 13:50:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NSYs93t3xz3cFP
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Dec 2022 23:50:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NSYrd0Sqpz2xKX
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Dec 2022 23:49:37 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NSYrb0kHDz4xN4;
	Thu,  8 Dec 2022 23:49:35 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Benjamin Gray <bgray@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20221109045112.187069-1-bgray@linux.ibm.com>
References: <20221109045112.187069-1-bgray@linux.ibm.com>
Subject: Re: [PATCH v10 0/9] powerpc/code-patching: Use temporary mm for Radix MMU
Message-Id: <167050318389.1457988.8738861674673434548.b4-ty@ellerman.id.au>
Date: Thu, 08 Dec 2022 23:39:43 +1100
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
Cc: jniethe5@gmail.com, npiggin@gmail.com, cmr@bluescreens.de, ajd@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 9 Nov 2022 15:51:03 +1100, Benjamin Gray wrote:
> This is a revision of Chris and Jordan's series to introduce a per-cpu temporary
> mm to be used for patching with strict rwx on radix mmus.
> 
> v10:	* Don't set poking_init_enabled on boot CPU init failure
> 	* Remove extern from functions in files touched by this series
> 	* Changed book3s/32/tlbflush.h stub body from warning to build bug
> 	* Remove empty hash__ set of functions. Also removed the ones that are
> 	  just warnings (would have preferred to make them build bugs, but they
> 	  blocked the build even though it's all inline inside a radix_enabled()
> 	  if-block).
> 	  	- It's not possible to use the radix specific necessary TLB flush
> 		  in code patching, as code-patching.c is compiled even when radix__*
> 		  functions aren't visible. #ifdefs would be required.
> 		  The cxl usage required radix__* be visible anyway, so there is no
> 		  compile issue.
> 	* Mention cache benefits of struct of patching context variables
> 	* Don't open-code mm init and teardown. It seems tlb_gather_mmu does
> 	  the necessary steps to detect page table pages to free, so it should
> 	  not leak. get_locked_pte() is used over __get_locked_pte() because I
> 	  don't know what makes the double-underscore function dangerous.
> 
> [...]

Patches 1-2 and 4-9 applied to powerpc/next.

[1/9] powerpc: Allow clearing and restoring registers independent of saved breakpoint state
      https://git.kernel.org/powerpc/c/3671f4ebe3eb12e7222e4d7b0f94e85cfe34253a
[2/9] powerpc/code-patching: Use WARN_ON and fix check in poking_init
      https://git.kernel.org/powerpc/c/071c95c1acbd96e76bab8b25b5cad0d71a011f37
[4/9] powerpc/mm: Remove empty hash__ functions
      https://git.kernel.org/powerpc/c/baf1ed24b27db475b38f534953885d0425e2232d
[5/9] cxl: Use radix__flush_all_mm instead of generic flush_all_mm
      https://git.kernel.org/powerpc/c/0f0a0a6091e678b1a75078ecd6b02176f3228dbb
[6/9] powerpc/mm: Remove flush_all_mm, local_flush_all_mm
      https://git.kernel.org/powerpc/c/d34471c9bd5d47ab148dd68817631a4238f755c4
[7/9] powerpc/tlb: Add local flush for page given mm_struct and psize
      https://git.kernel.org/powerpc/c/274d842fa1efd9449e62222c8896e0be11621f1f
[8/9] powerpc/code-patching: Use temporary mm for Radix MMU
      https://git.kernel.org/powerpc/c/c28c15b6d28a776538482101522cbcd9f906b15c
[9/9] powerpc/code-patching: Consolidate and cache per-cpu patching context
      https://git.kernel.org/powerpc/c/2f228ee1ade5d8d1f26cf94863a36c5693023c58

cheers
