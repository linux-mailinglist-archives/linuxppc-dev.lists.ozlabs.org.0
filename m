Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABD6319233
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Feb 2021 19:26:30 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dc4pC6vYYzDwqF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Feb 2021 05:26:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=hDwf0NXB; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dc4mJ6MZMzDwld
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Feb 2021 05:24:48 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 11BIOF9S006112; Thu, 11 Feb 2021 13:24:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=oIZ+lPlDFHFlYt3NSZHQHMGhlRDULbD9iz67e98jvbE=;
 b=hDwf0NXByq4HoOCn78MNsTl3h2gn2z7MdczP374aL1X3vRJw5dymCIt0S5sNw8u9jUBx
 dFr+cS1pFmGZVWjAqR5aVATRzX/3QNxT0UT1HcegkgJ8LJnMsaYWr9gMwU+GsDH0SkH9
 jLQ97JvsVZgf06oOqsHBZNjf83RYpnWJ8nAqIswCAPxYHl+XbF2q6PKYCaUJKDcDudHj
 nPGZ8u4OIXDndcVxh/xSQttZzZiNhIKFkdURMI1sOHM/EMswH06ekU3bXLqRNwm3GEBd
 GcSBIuCERSWeXjvq4z1j+py5g28MhnmakKAu8muR2nfiAm4P4/NORbWFGxv5J1Gjm8jE Sw== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36n9u20077-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Feb 2021 13:24:39 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11BIBULr020565;
 Thu, 11 Feb 2021 18:24:39 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma04dal.us.ibm.com with ESMTP id 36hjra1gp6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Feb 2021 18:24:39 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11BIOb4m26870194
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Feb 2021 18:24:37 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9CF196E04C;
 Thu, 11 Feb 2021 18:24:37 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 58F626E04E;
 Thu, 11 Feb 2021 18:24:37 +0000 (GMT)
Received: from vios4361.aus.stglabs.ibm.com (unknown [9.3.43.61])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 11 Feb 2021 18:24:37 +0000 (GMT)
From: Tyrel Datwyler <tyreld@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc/pseries: extract host bridge from pci_bus prior to
 bus removal
Date: Thu, 11 Feb 2021 12:24:35 -0600
Message-Id: <20210211182435.47968-1-tyreld@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-11_07:2021-02-11,
 2021-02-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 mlxlogscore=997
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102110144
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Tyrel Datwyler <tyreld@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pci_bus->bridge reference may no longer be valid after
pci_bus_remove() resulting in passing a bad value to device_unregister()
for the associated bridge device.

Store the host_bridge reference in a separate variable prior to
pci_bus_remove().

Fixes: 7340056567e3 ("powerpc/pci: Reorder pci bus/bridge unregistration during PHB removal")
Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/pci_dlpar.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/pci_dlpar.c b/arch/powerpc/platforms/pseries/pci_dlpar.c
index f9ae17e8a0f4..a8f9140a24fa 100644
--- a/arch/powerpc/platforms/pseries/pci_dlpar.c
+++ b/arch/powerpc/platforms/pseries/pci_dlpar.c
@@ -50,6 +50,7 @@ EXPORT_SYMBOL_GPL(init_phb_dynamic);
 int remove_phb_dynamic(struct pci_controller *phb)
 {
 	struct pci_bus *b = phb->bus;
+	struct pci_host_bridge *host_bridge = to_pci_host_bridge(b->bridge);
 	struct resource *res;
 	int rc, i;
 
@@ -76,7 +77,8 @@ int remove_phb_dynamic(struct pci_controller *phb)
 	/* Remove the PCI bus and unregister the bridge device from sysfs */
 	phb->bus = NULL;
 	pci_remove_bus(b);
-	device_unregister(b->bridge);
+	host_bridge->bus = NULL;
+	device_unregister(&host_bridge->dev);
 
 	/* Now release the IO resource */
 	if (res->flags & IORESOURCE_IO)
-- 
2.27.0

