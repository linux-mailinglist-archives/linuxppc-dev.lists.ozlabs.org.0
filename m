Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EB70D11DFFF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2019 09:54:55 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Z4HK02fvzDr3f
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2019 19:54:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=107.174.27.60; helo=ozlabs.ru;
 envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Received: from ozlabs.ru (unknown [107.174.27.60])
 by lists.ozlabs.org (Postfix) with ESMTP id 47Z45P1BmdzDrBc
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2019 19:46:16 +1100 (AEDT)
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id 77389AE8001D;
 Fri, 13 Dec 2019 03:44:37 -0500 (EST)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH kernel 0/3] Enable IOMMU support for pseries Secure VMs
Date: Fri, 13 Dec 2019 19:45:34 +1100
Message-Id: <20191213084537.27306-1-aik@ozlabs.ru>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Ram Pai <linuxram@us.ibm.com>,
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



Alexey Kardashevskiy (2):
  powerpc/pseries: Allow not having
    ibm,hypertas-functions::hcall-multi-tce for DDW
  powerpc/pseries/iommu: Do not use H_PUT_TCE_INDIRECT in secure VM

Ram Pai (1):
  powerpc/pseries/iommu: Use dma_iommu_ops for Secure VM.

 arch/powerpc/platforms/pseries/iommu.c | 59 +++++++++++++++-----------
 1 file changed, 34 insertions(+), 25 deletions(-)

-- 
2.17.1

