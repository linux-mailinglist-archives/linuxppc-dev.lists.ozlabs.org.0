Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6392937A63E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 May 2021 14:04:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ffc6N3BrNz3c2x
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 May 2021 22:04:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=d6PvgoxC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sathvika@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=d6PvgoxC; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ffc4v2v7sz2yRQ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 May 2021 22:03:11 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14BBZMP1097647; Tue, 11 May 2021 08:02:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=jSFKx2Mhsp5r1XEKH30hvQfgi/hXB7j8hwadNd6Wwic=;
 b=d6PvgoxCT2jwVMn1S846URGbjMH8XmLTn6VF/orCnydP9Zvu+t4jmXx2o6Npe/XMB3Ju
 lfaIgBtjNsiEJvJFKKFA0obbutxjVp1ay6SjqOgE6hoHufRY2GfLMYKMersOAseCne2a
 3rL+FMJZ2UHSJ2VFTyFFSHxT+fZI7Qdh054Fb2nUq05f2TiQxvcOsDwBliH/GAmUCzC+
 wIoJ5+Jykpjb1rTBlxHNw+ITu2eNNFbLc6uOpOXKG7EHHm8jz3ytjjlK7TnMaxyBv+fT
 04U7N2nBngJW8zSpWhHtRi8MBbz95dOz3RjSXweK5PBnNYTuwArilSrjCAQg76jNPbVs Ow== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38frea21pr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 May 2021 08:02:54 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14BC2nIO018641;
 Tue, 11 May 2021 12:02:52 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 38dj989n6j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 May 2021 12:02:52 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14BC2ogx24183174
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 May 2021 12:02:50 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2504C4C044;
 Tue, 11 May 2021 12:02:50 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EAAA14C04E;
 Tue, 11 May 2021 12:02:48 +0000 (GMT)
Received: from ltc-zz14-lp7.aus.stglabs.ibm.com (unknown [9.40.195.16])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 11 May 2021 12:02:48 +0000 (GMT)
From: Sathvika Vasireddy <sathvika@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 0/2] powerpc/sstep: Add emulation support and tests for
 'setb' instruction
Date: Tue, 11 May 2021 07:18:31 -0500
Message-Id: <cover.1620727160.git.sathvika@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.16.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: QM4EyWELlrcGQ5N2FpN776LNDvHfxlrJ
X-Proofpoint-GUID: QM4EyWELlrcGQ5N2FpN776LNDvHfxlrJ
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-11_02:2021-05-11,
 2021-05-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 mlxlogscore=652 adultscore=0 clxscore=1011 spamscore=0
 mlxscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2105110090
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
Cc: sathvika@linux.vnet.ibm.com, naveen.n.rao@linux.ibm.com, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patchset adds emulation support and tests for setb instruction.
Test cases are written to test different CR fields with different
bits set in each field.

v1->v2:
  - Extract all the bits of the CR field (bfa) and check if the
    LT, GT bits of that CR field (bfa) are set.
  - Place 'setb' emulation code after 'mfcr' instruction emulation.
  - Add 'cpu_feature' in the selftests patch to restrict them to ISA v3.0

Sathvika Vasireddy (2):
  powerpc/sstep: Add emulation support for ‘setb’ instruction
  powerpc/sstep: Add tests for setb instruction

 arch/powerpc/include/asm/ppc-opcode.h |  1 +
 arch/powerpc/lib/sstep.c              | 22 ++++++++++++++++++++++
 arch/powerpc/lib/test_emulate_step.c  | 29 +++++++++++++++++++++++++++++
 3 files changed, 52 insertions(+)

-- 
2.16.4

