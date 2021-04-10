Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 44EE635AE6A
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Apr 2021 16:34:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FHcvf1WS5z3fCB
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Apr 2021 00:34:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FHcpC6RQ3z3bwC
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Apr 2021 00:29:39 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4FHcpB4jK3z9sf9; Sun, 11 Apr 2021 00:29:38 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20210331003845.216246-1-mpe@ellerman.id.au>
References: <20210331003845.216246-1-mpe@ellerman.id.au>
Subject: Re: [PATCH v2 1/6] powerpc/mm/64s: Add _PAGE_KERNEL_ROX
Message-Id: <161806493617.1467223.8270248359553030821.b4-ty@ellerman.id.au>
Date: Sun, 11 Apr 2021 00:28:56 +1000
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 31 Mar 2021 11:38:40 +1100, Michael Ellerman wrote:
> In the past we had a fallback definition for _PAGE_KERNEL_ROX, but we
> removed that in commit d82fd29c5a8c ("powerpc/mm: Distribute platform
> specific PAGE and PMD flags and definitions") and added definitions
> for each MMU family.
> 
> However we missed adding a definition for 64s, which was not really a
> bug because it's currently not used.
> 
> [...]

Applied to powerpc/next.

[1/6] powerpc/mm/64s: Add _PAGE_KERNEL_ROX
      https://git.kernel.org/powerpc/c/56bec2f9d4d05675cada96772a8a93010f4d82bf
[2/6] powerpc/pseries: Add key to flags in pSeries_lpar_hpte_updateboltedpp()
      https://git.kernel.org/powerpc/c/b56d55a5aa4aa9fc166595a7feb57f153ef7b555
[3/6] powerpc/64s: Use htab_convert_pte_flags() in hash__mark_rodata_ro()
      https://git.kernel.org/powerpc/c/2c02e656a29d5f64193eb93da92781bcf0517146
[4/6] powerpc/mm/64s/hash: Factor out change_memory_range()
      https://git.kernel.org/powerpc/c/6f223ebe9c3f3ed315a06cec156086f1f7f7ded1
[5/6] powerpc/mm/64s/hash: Add real-mode change_memory_range() for hash LPAR
      https://git.kernel.org/powerpc/c/87e65ad7bd3a84a992723753fcc23d31c2d063c2
[6/6] powerpc/mm/64s: Allow STRICT_KERNEL_RWX again
      https://git.kernel.org/powerpc/c/bd573a81312fd9d6520b1cc81a88fd29e670e1ff

cheers
