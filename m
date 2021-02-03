Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D0D30D925
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 12:48:33 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DW0Lj6qvrzDx1h
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 22:48:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DW0903sX4zDwvC
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Feb 2021 22:40:04 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4DW08y2L6Cz9t0J; Wed,  3 Feb 2021 22:40:01 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <20210113102014.124452-1-aik@ozlabs.ru>
References: <20210113102014.124452-1-aik@ozlabs.ru>
Subject: Re: [PATCH kernel] powerpc/iommu/debug: Add debugfs entries for IOMMU
 tables
Message-Id: <161235200534.1516112.14183906336208072779.b4-ty@ellerman.id.au>
Date: Wed,  3 Feb 2021 22:40:01 +1100 (AEDT)
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

On Wed, 13 Jan 2021 21:20:14 +1100, Alexey Kardashevskiy wrote:
> This adds a folder per LIOBN under /sys/kernel/debug/iommu with IOMMU
> table parameters.
> 
> This is enabled by CONFIG_IOMMU_DEBUGFS.

Applied to powerpc/next.

[1/1] powerpc/iommu/debug: Add debugfs entries for IOMMU tables
      https://git.kernel.org/powerpc/c/691602aab9c3cce31d3ff9529c09b7922a5f6224

cheers
