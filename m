Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE155653F1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 13:43:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lc3pH5XtGz3fFY
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 21:43:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lc3fW28zDz3bwX
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Jul 2022 21:36:19 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Lc3fW11ppz4xtw;
	Mon,  4 Jul 2022 21:36:19 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, Laurent Dufour <ldufour@linux.ibm.com>
In-Reply-To: <20220523164353.26441-1-ldufour@linux.ibm.com>
References: <20220523164353.26441-1-ldufour@linux.ibm.com>
Subject: Re: [PATCH v2] powerpc/64s: Don't read H_BLOCK_REMOVE characteristics in radix mode
Message-Id: <165693443133.9954.10851917320089851428.b4-ty@ellerman.id.au>
Date: Mon, 04 Jul 2022 21:33:51 +1000
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
Cc: aneesh.kumar@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 23 May 2022 18:43:53 +0200, Laurent Dufour wrote:
> There is no need to read the H_BLOCK_REMOVE characteristics when running in
> Radix mode because this hcall is never called.
> 
> Furthermore since the commit 387e220a2e5e ("powerpc/64s: Move hash MMU
> support code under CONFIG_PPC_64S_HASH_MMU") define
> pseries_lpar_read_hblkrm_characteristics as un empty function if
> CONFIG_PPC_64S_HASH_MMU is not set, the #ifdef block can be removed.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/64s: Don't read H_BLOCK_REMOVE characteristics in radix mode
      https://git.kernel.org/powerpc/c/61bdbca855024997fd8c82dc190f458aa81beca8

cheers
