Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E8ACA15D54
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2019 08:27:27 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44yqQj2XGszDqMr
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2019 16:27:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ozlabs.ru
 (client-ip=107.173.13.209; helo=ozlabs.ru; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Received: from ozlabs.ru (ozlabs.ru [107.173.13.209])
 by lists.ozlabs.org (Postfix) with ESMTP id 44yqPC0SGCzDqKZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 May 2019 16:26:06 +1000 (AEST)
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id C4DDAAE8000E;
 Tue,  7 May 2019 02:26:02 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH kernel 0/2] pseries: Enable SWIOTLB
Date: Tue,  7 May 2019 16:25:57 +1000
Message-Id: <20190507062559.20295-1-aik@ozlabs.ru>
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
 Alistair Popple <alistair@popple.id.au>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


This is an attempt to allow PCI pass through to a secure guest when
hardware can only access insecure memory. This allows SWIOTLB use
for passed through devices.

Later on secure VMs will unsecure SWIOTLB bounce buffers for DMA
and the rest of the guest RAM will be unavailable to the hardware
by default.


This is based on sha1
e93c9c99a629 Linus Torvalds "Linux 5.1".

Please comment. Thanks.



Alexey Kardashevskiy (2):
  powerpc/pseries/dma: Allow swiotlb
  powerpc/pseries/dma: Enable swiotlb

 arch/powerpc/kernel/dma-iommu.c        | 36 ++++++++++++++++++++++++++
 arch/powerpc/platforms/pseries/setup.c |  5 ++++
 arch/powerpc/platforms/pseries/Kconfig |  1 +
 3 files changed, 42 insertions(+)

-- 
2.17.1


