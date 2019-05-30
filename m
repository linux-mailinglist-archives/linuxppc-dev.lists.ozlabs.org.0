Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8BC2F7B5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 May 2019 09:05:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Dz9y236TzDqTm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 May 2019 17:05:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ozlabs.ru
 (client-ip=107.173.13.209; helo=ozlabs.ru; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Received: from ozlabs.ru (ozlabs.ru [107.173.13.209])
 by lists.ozlabs.org (Postfix) with ESMTP id 45Dz8P60YrzDqTF
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 May 2019 17:04:05 +1000 (AEST)
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id 182F7AE80008;
 Thu, 30 May 2019 03:04:00 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH kernel v3 0/3] powerpc/ioda2: Yet another attempt to allow DMA
 masks between 32 and 59
Date: Thu, 30 May 2019 17:03:52 +1000
Message-Id: <20190530070355.121802-1-aik@ozlabs.ru>
X-Mailer: git-send-email 2.17.1
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 Alistair Popple <alistair@popple.id.au>, Oliver O'Halloran <oohall@gmail.com>,
 Sam Bobroff <sbobroff@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is an attempt to allow DMA masks between 32..59 which are not large
enough to use either a PHB3 bypass mode or a sketchy bypass. Depending
on the max order, up to 40 is usually available.


This is based on v5.2-rc2.

Please comment. Thanks.



Alexey Kardashevskiy (3):
  powerpc/iommu: Allow bypass-only for DMA
  powerpc/powernv/ioda2: Allocate TCE table levels on demand for default
    DMA window
  powerpc/powernv/ioda2: Create bigger default window with 64k IOMMU
    pages

 arch/powerpc/include/asm/iommu.h              |  8 ++-
 arch/powerpc/platforms/powernv/pci.h          |  2 +-
 arch/powerpc/kernel/dma-iommu.c               | 11 ++--
 arch/powerpc/kernel/iommu.c                   | 58 +++++++++++++------
 arch/powerpc/platforms/powernv/pci-ioda-tce.c | 20 +++----
 arch/powerpc/platforms/powernv/pci-ioda.c     | 40 +++++++++++--
 6 files changed, 95 insertions(+), 44 deletions(-)

-- 
2.17.1

