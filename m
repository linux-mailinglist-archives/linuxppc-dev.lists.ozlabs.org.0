Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1C087A85B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Mar 2024 14:28:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TvrvF2Qdvz3vn5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 00:28:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tvrt11CKRz3dTx
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Mar 2024 00:27:53 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Tvrsz4S0Kz4x1c;
	Thu, 14 Mar 2024 00:27:51 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <85a86e51b4ab26ce4b592984cc0a0851a3cc9479.1708076780.git.christophe.leroy@csgroup.eu>
References: <85a86e51b4ab26ce4b592984cc0a0851a3cc9479.1708076780.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/trace: Restrict hash_fault trace event to HASH MMU
Message-Id: <171033598336.517247.1756148879387291088.b4-ty@ellerman.id.au>
Date: Thu, 14 Mar 2024 00:19:43 +1100
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 16 Feb 2024 10:46:43 +0100, Christophe Leroy wrote:
> 'perf list' on powerpc 8xx shows an event named "1:hash_fault".
> 
> This event is pointless because trace_hash_fault() is called only
> from mm/book3s64/hash_utils.c
> 
> Only define it when CONFIG_PPC_64S_HASH_MMU is selected.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/trace: Restrict hash_fault trace event to HASH MMU
      https://git.kernel.org/powerpc/c/9e00743aba832f3f30ecb017d3345baf1f372140

cheers
