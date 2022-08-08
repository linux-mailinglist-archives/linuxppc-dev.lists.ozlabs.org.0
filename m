Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A9258CB75
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Aug 2022 17:44:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M1gVw3FJJz2yxF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Aug 2022 01:44:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tI16lyH+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gjoyce@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tI16lyH+;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M1gVC34dLz2xHb
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Aug 2022 01:44:02 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 278EQG4m023357;
	Mon, 8 Aug 2022 15:43:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=TJRNHRKMYb+wVCTUJoKgdADLtCM9GmrKnPjThoWBHlM=;
 b=tI16lyH+taLovUzzgjkd7N6g+v6kBA7yOnia5elj8PpZApKFe7fzhz6vecoEAfgdB3BN
 lUVx2TGNiJ+zXSexObttnbtj/O4NVDf6vHnDVR7zFA6QMtjTGXOkVvYkCHL2+i/aJVn3
 hO9tg89MAHGOwFsuWdfJ0Vlsets9c/DVCjhdGVs8vVmBAUwbnufL5To1Sd57xnJEfi6U
 x6sf96NhBYBjTwx9rQImXnSNLiVjFR8E3uMHHp7IwhMRvppLGmXDdXGrRXnixMGtDkNF
 7Px4PT385HBA/usNL7iHr2K5ubHP6qGIZk7NBzM6IJ865F8lQWu/BTR4PVJRDrEpmcjE mg== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hu48fawdc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Aug 2022 15:43:50 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
	by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 278FaInk001436;
	Mon, 8 Aug 2022 15:43:49 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
	by ppma02dal.us.ibm.com with ESMTP id 3hsfx98m4m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Aug 2022 15:43:49 +0000
Received: from b03ledav004.gho.boulder.ibm.com (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
	by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 278FhmFT18809532
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 8 Aug 2022 15:43:48 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B4BA17805F;
	Mon,  8 Aug 2022 15:43:48 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 856E478066;
	Mon,  8 Aug 2022 15:43:47 +0000 (GMT)
Received: from rhel-laptop.ibm.com.com (unknown [9.160.34.213])
	by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
	Mon,  8 Aug 2022 15:43:47 +0000 (GMT)
From: gjoyce@linux.vnet.ibm.com
To: linux-block@vger.kernel.org
Subject: [PATCH v3a 0/2] generic and PowerPC accessor functions for arch keystore
Date: Mon,  8 Aug 2022 10:43:43 -0500
Message-Id: <20220808154345.11240-1-gjoyce@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: xQ0zENTjHMPLyJS0S3NO8-iy9hc8sWi0
X-Proofpoint-ORIG-GUID: xQ0zENTjHMPLyJS0S3NO8-iy9hc8sWi0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-08_10,2022-08-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxlogscore=843 phishscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2208080075
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
Cc: axboe@kernel.dk, linux-efi@vger.kernel.org, gjoyce@linux.vnet.ibm.com, nayna@linux.ibm.com, keyrings@vger.kernel.org, jonathan.derrick@linux.dev, brking@linux.vnet.ibm.com, akpm@linux-foundation.org, msuchanek@suse.de, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Greg Joyce <gjoyce@linux.vnet.ibm.com>

Changelog v3a:
        - No code changes, but per reviewer requests, adding additional
          mailing lists(keyring, EFI) for wider review.

Architectural neutral functions have been defined for accessing
architecture specific variable store. The neutral functions are
defined as weak so that they may be superseded by platform
specific versions. The functions have been desigined so that 
they can support a large range of platforms/architectures.

PowerPC/pseries versions of these functions provide read/write access
to the non-volatile PLPKS data store.

This functionality allows kernel code such as the block SED opal
driver to store authentication keys in a secure permanent store.

Greg Joyce (2):
  lib: define generic accessor functions for arch specific keystore
  powerpc/pseries: Override lib/arch_vars.c functions

 arch/powerpc/platforms/pseries/Makefile       |   1 +
 .../platforms/pseries/plpks_arch_ops.c        | 167 ++++++++++++++++++
 include/linux/arch_vars.h                     |  23 +++
 lib/Makefile                                  |   2 +-
 lib/arch_vars.c                               |  25 +++
 5 files changed, 217 insertions(+), 1 deletion(-)
 create mode 100644 arch/powerpc/platforms/pseries/plpks_arch_ops.c
 create mode 100644 include/linux/arch_vars.h
 create mode 100644 lib/arch_vars.c


Signed-off-by: Greg Joyce <gjoyce@linux.vnet.ibm.com>
base-commit: ff6992735ade75aae3e35d16b17da1008d753d28
-- 
2.27.0

