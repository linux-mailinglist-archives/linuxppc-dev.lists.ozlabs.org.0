Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA8E19ACDD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 15:28:51 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48sn8c3WxqzDr8H
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 00:28:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48smMk0BtxzDr1b
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Apr 2020 23:53:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 48smMj6001z9sTS; Wed,  1 Apr 2020 23:53:21 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: c04868df38d8d6239ef0f36f45dbba2624e6a9cb
In-Reply-To: <9b22a064de6eb1301d92177eb3a38559df7005d3.1583415544.git.naveen.n.rao@linux.vnet.ibm.com>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 <linuxppc-dev@lists.ozlabs.org>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH 1/2] powerpc: Drop -fno-dwarf2-cfi-asm
Message-Id: <48smMj6001z9sTS@ozlabs.org>
Date: Wed,  1 Apr 2020 23:53:21 +1100 (AEDT)
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
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2020-03-05 at 14:35:29 UTC, "Naveen N. Rao" wrote:
> The original commit/discussion adding -fno-dwarf2-cfi-asm refers to
> R_PPC64_REL32 relocations not being handled by our module loader:
> http://lkml.kernel.org/r/20090224065112.GA6690@bombadil.infradead.org
> 
> However, that is now handled thanks to commit 9f751b82b491d
> ("powerpc/module: Add support for R_PPC64_REL32 relocations").
> 
> So, drop this flag from our Makefile.
> 
> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>

Series applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/c04868df38d8d6239ef0f36f45dbba2624e6a9cb

cheers
