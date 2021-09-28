Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E4B41B98F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Sep 2021 23:44:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HJtLX3vklz304r
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Sep 2021 07:44:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JZcL3/W5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=JZcL3/W5; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HJtJB1bRqz2xYM
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Sep 2021 07:42:02 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18SL0MhX016638; 
 Tue, 28 Sep 2021 17:41:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=unvP43YzWfuS4zB0rHwAVzOHATPW+stCz1pUXYY6kNo=;
 b=JZcL3/W5WE4JcZpG++ZJCoQ4CvSkUq7wYAXeNZTwfw7fL2vJxmG+AdESA6uJccEdgE7m
 XSwy1EaprhRcJfopLj8GDDSUeSEFfJ05ZteyF1KfLV/4+nNX5gJW9VZiqjhvYrEN1a+f
 lOcV4u+7OzT6MY/Jh0EaDKWBtcY08w7t3cyVW+vKGoOYW1B8wN9GVojSQh5KLfzPDCzB
 qEuBAAaTPNlO2nxYh9nVjAigsvnSOAElJXuqYSJBCV4+V14CrlJFSGMTmHngqgNghLVj
 rsjzvkq2sK9m33cgcePRunS1Px7uSL4joxZxt9braEu41/4yp8xbe0wrdI32Ab70wLGD jQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3bcak7rpc6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Sep 2021 17:41:55 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18SLJSEm027439;
 Tue, 28 Sep 2021 17:41:54 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3bcak7rpbx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Sep 2021 17:41:54 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18SLbVAD012745;
 Tue, 28 Sep 2021 21:41:53 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma01wdc.us.ibm.com with ESMTP id 3ba00dj1jk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Sep 2021 21:41:53 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18SLfqr219726726
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Sep 2021 21:41:53 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DBFCF7805F;
 Tue, 28 Sep 2021 21:41:52 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9D02F78066;
 Tue, 28 Sep 2021 21:41:47 +0000 (GMT)
Received: from localhost (unknown [9.211.96.63])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 28 Sep 2021 21:41:47 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 0/2] powerpc/paravirt: vcpu_is_preempted() tweaks
Date: Tue, 28 Sep 2021 16:41:45 -0500
Message-Id: <20210928214147.312412-1-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Q2HJuD4XzpUWOAohUveFPX-plPol6v8q
X-Proofpoint-ORIG-GUID: 2wNPgFKVZBJg5WVkt-GkKyFS6NwRC1Q5
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-28_10,2021-09-28_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 mlxlogscore=953 mlxscore=0 phishscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2109230001 definitions=main-2109280126
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
Cc: srikar@linux.vnet.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Minor changes arising from discovering that this code throws warnings with
DEBUG_PREEMPT kernels.

Changes since v1:
* Additional commentary to (1) distinguish hypervisor dispatch and preempt
  behavior from kernel scheduler preemption; and (2) more clearly justify
  the use of raw_smp_processor_id().
* Additional patch to update existing comments before making the functional
  change.

v1: https://lore.kernel.org/linuxppc-dev/20210921031213.2029824-1-nathanl@linux.ibm.com/

Nathan Lynch (2):
  powerpc/paravirt: vcpu_is_preempted() commentary
  powerpc/paravirt: correct preempt debug splat in vcpu_is_preempted()

 arch/powerpc/include/asm/paravirt.h | 40 +++++++++++++++++++++++++----
 1 file changed, 35 insertions(+), 5 deletions(-)

-- 
2.31.1

