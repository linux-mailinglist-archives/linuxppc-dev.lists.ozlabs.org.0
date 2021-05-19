Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C5E388BF4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 May 2021 12:48:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlV2n6dKPz3bT7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 May 2021 20:48:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=o2IUAdnI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=o2IUAdnI; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FlV2G38H6z2yXx
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 May 2021 20:47:49 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14JAYXPH060742; Wed, 19 May 2021 06:47:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=ZPM0IWusziu7BZHEiXR1BsdeTW+B1A0bHNniESiPYwM=;
 b=o2IUAdnI4MdWbmfcUzEKu0c+qieEigPGUFFgWskk5h17JPGC/8GG2M8YYXxJnWFC0eDO
 TljvLOLWv1aLS9q3KXy9zNrMe11hwPzOBCGNCGGYoBUP1AW4w/DEq4mxzNRGArxYYjTK
 IKdDC3j2jj36OsGF7ht3Su4MTBrUqcuGQpC54xdAp0kqNATpD/O5siz2PEemH+fz+awz
 ylT2IPrJnX83vUxmvXtFmt+3RThoRdfn1CMi8cWe9K8CacziEO3F2DVoLHApLdAw82s3
 1Jy02cAyIejUdj/d3QE0TfFhOVrAfbZg98u9gpsqRaD01yos5LnRyDn8MGp27jrgamSq nA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38n0cvsmh5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 May 2021 06:47:37 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14JAZ7Kn066169;
 Wed, 19 May 2021 06:47:36 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38n0cvsmgh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 May 2021 06:47:36 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14JAlY7U030202;
 Wed, 19 May 2021 10:47:34 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma05fra.de.ibm.com with ESMTP id 38m19srgn8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 May 2021 10:47:34 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14JAlWGo31785270
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 May 2021 10:47:32 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 37F30A4051;
 Wed, 19 May 2021 10:47:32 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2A12AA4040;
 Wed, 19 May 2021 10:47:30 +0000 (GMT)
Received: from naverao1-tp.in.ibm.com (unknown [9.85.72.228])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 19 May 2021 10:47:29 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Jordan Niethe <jniethe5@gmail.com>
Subject: [PATCH 0/5] powerpc/kprobes: fixes and cleanups
Date: Wed, 19 May 2021 16:17:16 +0530
Message-Id: <cover.1621416666.git.naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -ZkCX2cD_JpCrxbg9iAQ6f8gHt053Uw_
X-Proofpoint-ORIG-GUID: 9PmEoKNq7lVWg5Vwa_vB7F0IM4QPo9XE
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-19_04:2021-05-19,
 2021-05-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=908
 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 suspectscore=0 mlxscore=0 malwarescore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105190071
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Various fixes and some code refactoring for kprobes on powerpc. The 
first patch fixes an invalid access if probing the first instruction in 
a kernel module. The rest are small cleanups. More details in the 
individual patches.

- Naveen

Naveen N. Rao (5):
  powerpc/kprobes: Fix validation of prefixed instructions across page
    boundary
  powerpc/kprobes: Roll IS_RFI() macro into IS_RFID()
  powerpc/kprobes: Check instruction validity during kprobe registration
  powerpc/kprobes: Refactor arch_prepare_kprobe()
  powerpc/kprobes: Warn if instruction patching failed

 arch/powerpc/include/asm/sstep.h |   7 +-
 arch/powerpc/kernel/kprobes.c    | 112 +++++++++++--------------------
 2 files changed, 43 insertions(+), 76 deletions(-)


base-commit: 3a81c0495fdb91fd9a9b4f617098c283131eeae1
-- 
2.30.2

