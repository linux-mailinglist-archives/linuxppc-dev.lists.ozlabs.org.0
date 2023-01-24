Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCF8679B1F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 15:07:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P1TLx74p2z3cFH
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jan 2023 01:07:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UiIagbDj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UiIagbDj;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P1THv2MsZz3c6s
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jan 2023 01:04:58 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30OC4fPL011858;
	Tue, 24 Jan 2023 14:04:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=gpwPP+/Pq56fBaxgZZGbaqHOkTHdPEmyCpZQsus0MnA=;
 b=UiIagbDjcSpvSW7VsxLDos33BVkK5DbqGeYRlQ8VaxXd6v0B0yjN4HBSLWr25pFLlmdd
 F11ZVokgApWL5g6bh01qHfqThWrWANEMgc0fT7Z26+BRELFvTLCf3gTzLbThDNXvGcEg
 4q1cmcmSVYq4jT0kvOJmIlgLBYmhKKq5VyFzxC754Yk3aN6VDvxknGnDMZsshpIFFKFp
 7EJ7VviQ3P9V8F9rMI28J2oF2v/fDhVMB1R9rIFkTYleZkNzWCmPsBobeCFLB4JBuE6E
 J5rVRDUvr0xmVFqW2POfydAoE6adhnIdfHy8pzPSNOLOp1KHcXaG2nAwK1ANELQd0whe kA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3na9hutnv1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Jan 2023 14:04:52 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30OCsZHU015001;
	Tue, 24 Jan 2023 14:04:52 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com [169.55.91.170])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3na9hutnuc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Jan 2023 14:04:52 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
	by ppma02wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30OCI5Ft012755;
	Tue, 24 Jan 2023 14:04:50 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([9.208.129.118])
	by ppma02wdc.us.ibm.com (PPS) with ESMTPS id 3n87p7jfe8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Jan 2023 14:04:50 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30OE4nQv66322766
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Jan 2023 14:04:49 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4E3A458063;
	Tue, 24 Jan 2023 14:04:49 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 25EF958059;
	Tue, 24 Jan 2023 14:04:49 +0000 (GMT)
Received: from localhost (unknown [9.163.30.189])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 24 Jan 2023 14:04:49 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 0/4] powerpc/rtas: exports and locking
Date: Tue, 24 Jan 2023 08:04:44 -0600
Message-Id: <20230124140448.45938-1-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.39.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: RZ_lsmj0rjZ2MhjeieFw35gDx305n92D
X-Proofpoint-GUID: KssneGKoMjSS9Ea9T4uXh2vmS5SIoRDt
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-23_12,2023-01-24_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 mlxlogscore=656 priorityscore=1501 phishscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 mlxscore=0 impostorscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301240127
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
Cc: ldufour@linux.ibm.com, ajd@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series began as a single patch[1] to convert the RTAS subsystem's
internal locks to raw spinlocks. The discussion of that patch
identified opportunities to update a few aspects of the RTAS API, so
the series begins with those and ends with a rebased version of the
original patch.

Changes since v1:
- Unexport the singleton 'rtas' struct.
- Remove lock and args fields from 'struct rtas_t', making them
  private to the RTAS subsystem.
- Convert all symbol exports in rtas.c to EXPORT_SYMBOL_GPL.

[1] https://lore.kernel.org/linuxppc-dev/20230110044255.122616-1-nathanl@linux.ibm.com/

Nathan Lynch (4):
  powerpc/rtas: unexport 'rtas' symbol
  powerpc/rtas: make all exports GPL
  powerpc/rtas: remove lock and args fields from global rtas struct
  powerpc/rtas: upgrade internal arch spinlocks

 arch/powerpc/include/asm/rtas-types.h |   2 -
 arch/powerpc/kernel/rtas.c            | 127 +++++++++++---------------
 2 files changed, 55 insertions(+), 74 deletions(-)

-- 
2.37.1

