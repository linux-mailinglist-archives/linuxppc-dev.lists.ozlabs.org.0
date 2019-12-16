Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B1311FD8F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Dec 2019 05:23:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47bp6T6MTkzDqS3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Dec 2019 15:23:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=107.174.27.60; helo=ozlabs.ru;
 envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Received: from ozlabs.ru (unknown [107.174.27.60])
 by lists.ozlabs.org (Postfix) with ESMTP id 47bp2F57TLzDqQJ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Dec 2019 15:19:31 +1100 (AEDT)
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id E9312AE80564;
 Sun, 15 Dec 2019 23:18:18 -0500 (EST)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH kernel v2 0/4] Enable IOMMU support for pseries Secure VMs
Date: Mon, 16 Dec 2019 15:19:20 +1100
Message-Id: <20191216041924.42318-1-aik@ozlabs.ru>
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
 Michael Anderson <andmike@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>,
 kvm-ppc@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This enables IOMMU for SVM. Instead of sharing
a H_PUT_TCE_INDIRECT page, this uses H_PUT_TCE for mapping
and H_STUFF_TCE for clearing TCEs which should bring
acceptable performance at the boot time; otherwise things
work with the same speed anyway.

Please comment. Thanks.


This is based on sha1
37d4e84f765b Linus Torvalds Merge tag 'ceph-for-5.5-rc2' of git://github.com/ceph/ceph-client

Please comment. Thanks.



Alexey Kardashevskiy (3):
  powerpc/pseries: Allow not having
    ibm,hypertas-functions::hcall-multi-tce for DDW
  powerpc/pseries/iommu: Separate FW_FEATURE_MULTITCE to put/stuff
    features
  powerpc/pseries/svm: Allow IOMMU to work in SVM

Ram Pai (1):
  Revert "powerpc/pseries/iommu: Don't use dma_iommu_ops on secure
    guests"

 arch/powerpc/include/asm/firmware.h       |  6 ++-
 arch/powerpc/platforms/pseries/firmware.c | 10 +++-
 arch/powerpc/platforms/pseries/iommu.c    | 65 +++++++++++++----------
 3 files changed, 50 insertions(+), 31 deletions(-)

-- 
2.17.1

