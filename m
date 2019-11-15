Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC788FE69C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Nov 2019 21:51:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47F9Vn4mn3zDrQh
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Nov 2019 07:51:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=linuxram@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47F9Sg5Ph1zF7c8
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Nov 2019 07:49:23 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAFKlfKr112160
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2019 15:49:20 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2w9nuhp5t2-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2019 15:49:20 -0500
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <linuxram@us.ibm.com>;
 Fri, 15 Nov 2019 20:49:17 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 15 Nov 2019 20:49:12 -0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xAFKnADx55836738
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Nov 2019 20:49:10 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 86EB342042;
 Fri, 15 Nov 2019 20:49:10 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0F21542041;
 Fri, 15 Nov 2019 20:49:07 +0000 (GMT)
Received: from oc0525413822.ibm.com (unknown [9.85.181.122])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 15 Nov 2019 20:49:06 +0000 (GMT)
From: Ram Pai <linuxram@us.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [v3 0/2] Enable IOMMU support for pseries Secure VMs
Date: Fri, 15 Nov 2019 12:48:29 -0800
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 19111520-4275-0000-0000-0000037E4E37
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19111520-4276-0000-0000-00003891B93C
Message-Id: <1573850911-19590-1-git-send-email-linuxram@us.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-15_06:2019-11-15,2019-11-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 spamscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 mlxscore=0
 mlxlogscore=505 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1910280000 definitions=main-1911150185
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
Cc: andmike@us.ibm.com, pasic@linux.ibm.com, mst@redhat.com, aik@ozlabs.ru,
 linuxram@us.ibm.com, mdroth@linux.vnet.ibm.com, linux-kernel@vger.kernel.org,
 ram.n.pai@gmail.com, cai@lca.pw, tglx@linutronix.de,
 sukadev@linux.vnet.ibm.com, hch@lst.de, bauerman@linux.ibm.com,
 david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch series enables IOMMU support for pseries Secure VMs.

Tested using QEMU command line option:

 "-device virtio-scsi-pci,id=scsi0,bus=pci.0,addr=0x4,
	iommu_platform=on,disable-modern=off,disable-legacy=on"

 and

 "-device virtio-blk-pci,scsi=off,bus=pci.0,
	addr=0x5,drive=drive-virtio-disk0,id=virtio-disk0,
	iommu_platform=on,disable-modern=off,disable-legacy=on"

changelog:
	v3: Better description of 2/2 patch.
		Suggested by David Gibson.
	v2: added comments describing the changes.
		Suggested by Alexey and Michael Ellermen.


Ram Pai (2):
  powerpc/pseries/iommu: Share the per-cpu TCE page with the hypervisor.
  powerpc/pseries/iommu: Use dma_iommu_ops for Secure VMs aswell.

 arch/powerpc/platforms/pseries/iommu.c | 34 +++++++++++++++++++++-------------
 1 file changed, 21 insertions(+), 13 deletions(-)

-- 
1.8.3.1

