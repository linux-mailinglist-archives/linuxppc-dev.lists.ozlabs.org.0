Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FAC65A7E7A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Aug 2022 15:16:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MHl7j3s98z3f9N
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Aug 2022 23:16:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MHl6D5sZXz2xJ5
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Aug 2022 23:15:32 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MHl6D4rznz4xGG;
	Wed, 31 Aug 2022 23:15:32 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <a821e8397dd56b8177ecc04966d3b3a7c4bda6d4.1660919016.git.christophe.leroy@csgroup.eu>
References: <a821e8397dd56b8177ecc04966d3b3a7c4bda6d4.1660919016.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc: Remove stale declarations in mmu_decl.h
Message-Id: <166195163497.45984.6671089422607210922.b4-ty@ellerman.id.au>
Date: Wed, 31 Aug 2022 23:13:54 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 19 Aug 2022 16:23:43 +0200, Christophe Leroy wrote:
> rtas_size and rtas_data are not used anymore since at least
> commit 7c8c6b9776fb ("powerpc: Merge lmb.c and make MM initialization
> use it.")
> 
> Remove them.
> 
> Since commit 4b74a35fc7e9 ("powerpc/32s: Make Hash var static")
> the forward declaration of struct hash_pte is unneeded.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc: Remove stale declarations in mmu_decl.h
      https://git.kernel.org/powerpc/c/e38cd72c17fa7d7710088365251feb6c52b501c8

cheers
