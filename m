Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B268039CEB4
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Jun 2021 13:37:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FyZGg1GJNz3c62
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Jun 2021 21:36:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FyZFf5N4qz2yWt
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  6 Jun 2021 21:36:05 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4FyZFb5v3rz9sRN; Sun,  6 Jun 2021 21:36:03 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Frederic Barrat <fbarrat@linux.ibm.com>, aik@ozlabs.ru,
 linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20210526144540.117795-1-fbarrat@linux.ibm.com>
References: <20210526144540.117795-1-fbarrat@linux.ibm.com>
Subject: Re: [PATCH] Revert "powerpc/kernel/iommu: Align size for
 IOMMU_PAGE_SIZE() to save TCEs"
Message-Id: <162297929376.2342154.14151322164907909539.b4-ty@ellerman.id.au>
Date: Sun, 06 Jun 2021 21:34:53 +1000
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
Cc: zdai@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 26 May 2021 16:45:40 +0200, Frederic Barrat wrote:
> This reverts commit 3c0468d4451eb6b4f6604370639f163f9637a479.
> 
> That commit was breaking alignment guarantees for the DMA address when
> allocating coherent mappings, as described in
> Documentation/core-api/dma-api-howto.rst
> 
> It was also noticed by Mellanox' driver:
> [ 1515.763621] mlx5_core c002:01:00.0: mlx5_frag_buf_alloc_node:146:(pid 13402): unexpected map alignment: 0x0800000000c61000, page_shift=16
> [ 1515.763635] mlx5_core c002:01:00.0: mlx5_cqwq_create:181:(pid
> 13402): mlx5_frag_buf_alloc_node() failed, -12

Applied to powerpc/fixes.

[1/1] Revert "powerpc/kernel/iommu: Align size for IOMMU_PAGE_SIZE() to save TCEs"
      https://git.kernel.org/powerpc/c/59cc84c802eb923805e7bba425976a3df5ce35d8

cheers
