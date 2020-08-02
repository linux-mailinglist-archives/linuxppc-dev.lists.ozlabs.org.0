Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3233A235729
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Aug 2020 15:39:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BKMZC1SWBzDqKg
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Aug 2020 23:39:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BKMSx5XRhzDqH2
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Aug 2020 23:34:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BKMSx4NtYz9sTC; Sun,  2 Aug 2020 23:34:57 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Anton Blanchard <anton@ozlabs.org>, paulus@samba.org,
 benh@kernel.crashing.org, mpe@ellerman.id.au
In-Reply-To: <20200729040828.2312966-1-anton@ozlabs.org>
References: <20200729040828.2312966-1-anton@ozlabs.org>
Subject: Re: [PATCH] powerpc/configs: Add BLK_DEV_NVME to pseries_defconfig
Message-Id: <159637523564.42190.8472573945674409627.b4-ty@ellerman.id.au>
Date: Sun,  2 Aug 2020 23:34:57 +1000 (AEST)
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 29 Jul 2020 14:08:28 +1000, Anton Blanchard wrote:
> I've forgotten to manual enable NVME when building pseries kernels
> for machines with NVME adapters. Since it's a reasonably common
> configuration, enable it by default.

Applied to powerpc/next.

[1/1] powerpc/configs: Add BLK_DEV_NVME to pseries_defconfig
      https://git.kernel.org/powerpc/c/fdaa7ce2016ccd09a538b05bace5f4479662ddcb

cheers
