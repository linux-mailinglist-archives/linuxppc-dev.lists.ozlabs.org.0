Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF0E5653E3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 13:40:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lc3lj2Pzkz3fr1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 21:40:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lc3fJ1CfKz3br4
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Jul 2022 21:36:08 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Lc3fH6D7Lz4xZq;
	Mon,  4 Jul 2022 21:36:07 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, dja@axtens.net, Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>
In-Reply-To: <8d6c5859a45935d6e1a336da4dc20be421e8cea7.1656427701.git.christophe.leroy@csgroup.eu>
References: <8d6c5859a45935d6e1a336da4dc20be421e8cea7.1656427701.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v1 1/6] powerpc/64e: Fix early TLB miss with KUAP
Message-Id: <165693442393.9954.10279523167895642919.b4-ty@ellerman.id.au>
Date: Mon, 04 Jul 2022 21:33:43 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 28 Jun 2022 16:48:54 +0200, Christophe Leroy wrote:
> With KUAP, the TLB miss handler bails out when an access to user
> memory is performed with a nul TID.
> 
> But the normal TLB miss routine which is only used early during boot
> does the check regardless for all memory areas, not only user memory.
> 
> By chance there is no early IO or vmalloc access, but when KASAN
> come we will start having early TLB misses.
> 
> [...]

Applied to powerpc/next.

[1/6] powerpc/64e: Fix early TLB miss with KUAP
      https://git.kernel.org/powerpc/c/09317643117ade87c03158341e87466413fa8f1a
[2/6] powerpc/64e: Remove MMU_FTR_USE_TLBRSRV and MMU_FTR_USE_PAIRED_MAS
      https://git.kernel.org/powerpc/c/3adfb457b84bd6de4e78a99814038fbd7205f253
[3/6] powerpc/64e: Remove unused REGION related macros
      https://git.kernel.org/powerpc/c/b646c1f7f43c13510d519e3044c87aa32352fc1f
[4/6] powerpc/64e: Move virtual memory closer to linear memory
      https://git.kernel.org/powerpc/c/128c1ea2f838d3031a1c475607860e4271a8e9dc
[5/6] powerpc/64e: Reorganise virtual memory
      https://git.kernel.org/powerpc/c/059c189389ebe9c4909d849d1a5f65c53115ca19
[6/6] powerpc/64e: KASAN Full support for BOOK3E/64
      https://git.kernel.org/powerpc/c/c7b9ed7c34a9f5dbf8222d63e3e313cef9f3150b

cheers
