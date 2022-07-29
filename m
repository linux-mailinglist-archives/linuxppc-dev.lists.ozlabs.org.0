Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F26E58507A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jul 2022 15:11:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LvSZB10tWz3bZC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jul 2022 23:10:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LvSYq2RB0z2xHZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Jul 2022 23:10:39 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LvSYp5JX1z4x1H;
	Fri, 29 Jul 2022 23:10:38 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20220714080800.3712998-1-aik@ozlabs.ru>
References: <20220714080800.3712998-1-aik@ozlabs.ru>
Subject: Re: [PATCH kernel] powerpc/ioda/iommu/debugfs: Generate unique debugfs entries
Message-Id: <165909977264.253830.17801812115010465933.b4-ty@ellerman.id.au>
Date: Fri, 29 Jul 2022 23:02:52 +1000
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 14 Jul 2022 18:08:00 +1000, Alexey Kardashevskiy wrote:
> The iommu_table::it_index is a LIOBN which is not initialized on PowerNV
> as it is not used except IOMMU debugfs where it is used for a node name.
> 
> This initializes it_index witn a unique number to avoid warnings and
> have a node for every iommu_table.
> 
> This should not cause any behavioral change without CONFIG_IOMMU_DEBUGFS.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/ioda/iommu/debugfs: Generate unique debugfs entries
      https://git.kernel.org/powerpc/c/d73b46c3c1449bf27f793b9d9ee86ed70c7a7163

cheers
