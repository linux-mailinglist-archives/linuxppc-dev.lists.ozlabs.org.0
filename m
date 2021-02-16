Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E12FE31C5D2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Feb 2021 04:34:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dfmm75TM5z3cRj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Feb 2021 14:33:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=107.174.27.60; helo=ozlabs.ru;
 envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Received: from ozlabs.ru (ozlabs.ru [107.174.27.60])
 by lists.ozlabs.org (Postfix) with ESMTP id 4Dfmlq4dS8z30HZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Feb 2021 14:33:43 +1100 (AEDT)
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id 20320AE8020D;
 Mon, 15 Feb 2021 22:33:09 -0500 (EST)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH kernel 0/2] powerpc/iommu: Stop crashing the host when VM is
 terminated
Date: Tue, 16 Feb 2021 14:33:05 +1100
Message-Id: <20210216033307.69863-1-aik@ozlabs.ru>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, kvm-ppc@vger.kernel.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Killing a VM on a host under memory pressure kills a host which is
annoying. 1/2 reduces the chances, 2/2 eliminates panic() on
ioda2.


This is based on sha1
f40ddce88593 Linus Torvalds "Linux 5.11".

Please comment. Thanks.



Alexey Kardashevskiy (2):
  powerpc/iommu: Allocate it_map by vmalloc
  powerpc/iommu: Do not immediately panic when failed IOMMU table
    allocation

 arch/powerpc/kernel/iommu.c               | 19 ++++++-------------
 arch/powerpc/platforms/cell/iommu.c       |  3 ++-
 arch/powerpc/platforms/pasemi/iommu.c     |  4 +++-
 arch/powerpc/platforms/powernv/pci-ioda.c | 15 ++++++++-------
 arch/powerpc/platforms/pseries/iommu.c    | 10 +++++++---
 arch/powerpc/sysdev/dart_iommu.c          |  3 ++-
 6 files changed, 28 insertions(+), 26 deletions(-)

-- 
2.17.1

