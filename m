Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 802553585E4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Apr 2021 16:07:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGNPB3SyPz3bwv
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Apr 2021 00:07:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TVVXhIXs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=TVVXhIXs; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGNNk38Rxz30D7
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Apr 2021 00:06:45 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 138E4585112252; Thu, 8 Apr 2021 10:06:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=Gd5weCNEJHCIwaoSnlhMBjVIg2hj2uANNzhslPfYr5g=;
 b=TVVXhIXsvwsb6Mb2ZoVpOolE3TWaOM0hfNd8ccqEcbpS+713xfdQiT4V2iRZ6Q0r8lW4
 yoCdL2jFVQUgoyL6R1+Oap8WXAMgWcUpaOl+vzr4xdo16G4qIF7e+DLanrimBTtL/+7D
 hJeHJXRXuvOtR9/knGdMxUh78HExGmBhh6+ayAnDegGvCqqc9635MxBtw4FYmQI7x+Gf
 N0Y9XqpRDHP0EeDc16LLphXgpN+OiNBJFSfqpUX56mRPgkEw7OoXsgSwdL991en7s9Vf
 400y+EQM9D/FFRK56L8UmBjCsIKMqQ3LFUxIBxrV8aHj17rUIgMPermE3+Bvo4cP6hJN ZA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37rvm1cubp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Apr 2021 10:06:38 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 138E47R1112544;
 Thu, 8 Apr 2021 10:06:36 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37rvm1cu7r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Apr 2021 10:06:36 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 138E1kRa025712;
 Thu, 8 Apr 2021 14:06:32 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma02wdc.us.ibm.com with ESMTP id 37ryqcc9pb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Apr 2021 14:06:32 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 138E6Vrq16843088
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 8 Apr 2021 14:06:31 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 78FE628065;
 Thu,  8 Apr 2021 14:06:31 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3E5E128059;
 Thu,  8 Apr 2021 14:06:31 +0000 (GMT)
Received: from localhost (unknown [9.211.35.170])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  8 Apr 2021 14:06:31 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 0/5] powerpc/rtas: miscellaneous cleanups
Date: Thu,  8 Apr 2021 09:06:25 -0500
Message-Id: <20210408140630.205502-1-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.30.2
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: imtWcLKuW2J89UVM9TJj3Nl-OA8LmZur
X-Proofpoint-ORIG-GUID: idfPnLOUh83x0ymoYnGjag535G3-ScZY
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-08_03:2021-04-08,
 2021-04-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 mlxscore=0
 mlxlogscore=919 adultscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104080099
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
Cc: tyreld@linux.ibm.com, ajd@linux.ibm.com, aik@ozlabs.ru,
 aneesh.kumar@linux.ibm.com, npiggin@gmail.com, brking@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a reroll of the series posted here:
https://lore.kernel.org/linuxppc-dev/20210114220004.1138993-1-nathanl@linux.ibm.com/

Originally this work was prompted by failures on radix MMU PowerVM
guests when passing buffers to RTAS that lay outside of its idea of
the RMA. In v1 I approached this as a problem to be solved in Linux,
but RTAS development has since decided to change their code so that
the RMA restriction does not apply with radix.

So in v2 I retain the cleanups and discard the more significant change
which accommodated the misbehaving RTAS versions.

Changes since v1:
- Correct missing conversion of RTAS_RMOBUF_MAX ->
  RTAS_USER_REGION_SIZE in in_rmo_buf().
- Remove unnecessary braces in rtas_syscall_filter_init().
- Leave expression of RTAS_WORK_AREA_SIZE as-is instead of changing
  the factors in a confusing way, per discussion with Alexey.
- Drop "powerpc/rtas: constrain user region allocation to RMA"

Nathan Lynch (5):
  powerpc/rtas: improve ppc_rtas_rmo_buf_show documentation
  powerpc/rtas-proc: remove unused RMO_READ_BUF_MAX
  powerpc/rtas: remove ibm_suspend_me_token
  powerpc/rtas: move syscall filter setup into separate function
  powerpc/rtas: rename RTAS_RMOBUF_MAX to RTAS_USER_REGION_SIZE

 arch/powerpc/include/asm/rtas.h |  6 +++---
 arch/powerpc/kernel/rtas-proc.c | 15 +++++++++++----
 arch/powerpc/kernel/rtas.c      | 34 +++++++++++++++++----------------
 3 files changed, 32 insertions(+), 23 deletions(-)

-- 
2.30.2

