Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3A2361A00
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 08:47:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FM6Gf6Sc1z3byP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 16:47:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iitRvRDH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sathvika@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=iitRvRDH; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FM6GC4jJ0z2yYh
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 16:47:31 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13G6XKQo042273
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 02:47:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=ro0bULAd5IV2B8j5g/x3xBlkulVhyAhSQR4G6+8gknM=;
 b=iitRvRDHHXXoRD9j4narWRvDsU/uHxjOdiOAGACggTy+QprZhc6tcINP9poM8kaSJj+O
 Uv2VYnZpaJaa1TdQA/temHJHPj2eA+SbiQsX+DEBaeP6lgRZ91funAq6PBXIf2mcrKq0
 tNS26QHEFi4aCbk2JGksK6vgV5v/7Kj9jrqJiOsFm9mpGABWCJdaZZI8XTVmfQy8Ti7W
 5ZSaH3qe9wLxuLivyDMgNmKUxQbF6jt1sku6MMmsb4FC98qZklKHCsVu4RrZLMUFjN6l
 JhfmrrP8NTFIn3uWulIz2Jg5OI1pjUTmI9tWoO78B414O1fOW3saOVxIKYSJ15k7D6xj lw== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37xs4ksavk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 02:47:28 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13G6VtD2012782
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 06:47:26 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03ams.nl.ibm.com with ESMTP id 37u3n8c9gw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 06:47:26 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 13G6l1Cj21823984
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 Apr 2021 06:47:01 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 882D842047;
 Fri, 16 Apr 2021 06:47:23 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DC2FA4203F;
 Fri, 16 Apr 2021 06:47:22 +0000 (GMT)
Received: from ltc-zz14-lp7.aus.stglabs.ibm.com (unknown [9.40.195.16])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 16 Apr 2021 06:47:22 +0000 (GMT)
From: Sathvika Vasireddy <sathvika@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 0/2] powerpc/sstep: Add emulation support and tests for 'setb'
 instruction
Date: Fri, 16 Apr 2021 02:02:47 -0500
Message-Id: <cover.1618469454.git.sathvika@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.16.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: zulGgpXMFz52rhrUkguEv5twoR5NgrbC
X-Proofpoint-ORIG-GUID: zulGgpXMFz52rhrUkguEv5twoR5NgrbC
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-15_11:2021-04-15,
 2021-04-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0
 adultscore=0 clxscore=1011 bulkscore=0 mlxlogscore=620 priorityscore=1501
 lowpriorityscore=0 phishscore=0 spamscore=0 malwarescore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104160049
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
Cc: naveen.n.rao@linux.ibm.com,
 Sathvika Vasireddy <sathvika@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patchset adds emulation support and tests for setb instruction. Test cases are written to test different CR fields with different bits set in each field.

Sathvika Vasireddy (2):
  powerpc/sstep: Add emulation support for ‘setb’ instruction
  powerpc/sstep: Add tests for setb instruction

 arch/powerpc/include/asm/ppc-opcode.h |  1 +
 arch/powerpc/lib/sstep.c              | 12 +++++++
 arch/powerpc/lib/test_emulate_step.c  | 28 +++++++++++++++++++++++++++++++++++
 3 files changed, 41 insertions(+)

-- 
2.16.4

