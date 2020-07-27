Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E9822F908
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 21:28:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BFqbL30zRzF1fV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jul 2020 05:28:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=linuxram@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BFqYM15LyzF1YK
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jul 2020 05:26:30 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06RJFLtp182543; Mon, 27 Jul 2020 15:26:22 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32hs0see6e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jul 2020 15:26:22 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06RJ6QPN020415;
 Mon, 27 Jul 2020 19:26:21 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma02fra.de.ibm.com with ESMTP id 32gcq0skuw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jul 2020 19:26:20 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 06RJQIjQ66191828
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Jul 2020 19:26:18 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 181B04C04A;
 Mon, 27 Jul 2020 19:26:18 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1F0004C050;
 Mon, 27 Jul 2020 19:26:15 +0000 (GMT)
Received: from oc0525413822.ibm.com (unknown [9.163.69.7])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 27 Jul 2020 19:26:14 +0000 (GMT)
From: Ram Pai <linuxram@us.ibm.com>
To: kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 0/2] Rework secure memslot dropping
Date: Mon, 27 Jul 2020 12:24:27 -0700
Message-Id: <1595877869-2746-1-git-send-email-linuxram@us.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-27_13:2020-07-27,
 2020-07-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 mlxlogscore=497 spamscore=0
 mlxscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007270125
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
Cc: ldufour@linux.ibm.com, linuxram@us.ibm.com, cclaudio@linux.ibm.com,
 bharata@linux.ibm.com, sathnaga@linux.vnet.ibm.com, aneesh.kumar@linux.ibm.com,
 sukadev@linux.vnet.ibm.com, bauerman@linux.ibm.com,
 david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Laurent Dufour <ldufour@linux.ibm.com>

When doing memory hotplug on a secure VM, the secure pages are not well
cleaned from the secure device when dropping the memslot.  This silent
error, is then preventing the SVM to reboot properly after the following
sequence of commands are run in the Qemu monitor:

device_add pc-dimm,id=dimm1,memdev=mem1
device_del dimm1
device_add pc-dimm,id=dimm1,memdev=mem1

At reboot time, when the kernel is booting again and switching to the
secure mode, the page_in is failing for the pages in the memslot because
the cleanup was not done properly, because the memslot is flagged as
invalid during the hot unplug and thus the page fault mechanism is not
triggered.

To prevent that during the memslot dropping, instead of belonging on the
page fault mechanism to trigger the page out of the secured pages, it seems
simpler to directly call the function doing the page out. This way the
state of the memslot is not interfering on the page out process.

This series applies on top of the Ram's one titled:
"[v6 0/5] Migrate non-migrated pages of a SVM."


Changes since V2:
 - fix to vma boundary check in kvmppc_uvmem_drop_pages().

Changes since V1:
 - Rebase on top of Ram's V4 series
 - Address Bharata's comment to use mmap_read_*lock().

Laurent Dufour (2):
  KVM: PPC: Book3S HV: move kvmppc_svm_page_out up
  KVM: PPC: Book3S HV: rework secure mem slot dropping

 arch/powerpc/kvm/book3s_hv_uvmem.c | 218 +++++++++++++++++++++----------------
 1 file changed, 125 insertions(+), 93 deletions(-)

-- 
1.8.3.1
