Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A22A82F6DB0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jan 2021 23:10:31 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DGz5d0BcZzDsXG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 09:10:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=RdbCeeNq; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DGysq3HkPzDsPt
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jan 2021 09:00:14 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10ELgQDm001461; Thu, 14 Jan 2021 17:00:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=NOHoatsnegVdxaRI/wuUzS/4ybVXrl1Q9NZcvu3qhkw=;
 b=RdbCeeNqFoe8j3vhK4Om3iMxEhEWw+jro4Q0+Wd3kbd487C8eJmbApcgCuwFnxHs+T1X
 AkIrWfjc17+QBTfI9WXqPl0eeFigcBf1z2/+4REfTozp1boKqpHRCvPq7iLAUqPiEO2W
 Sg4UPbwzER7+oRYIIrB1ztbFwt9Xpu3UJ+9o7yP/ZmIyfQSInzW0bdLQtUvy7nm8KVVw
 wNONgjZzo3pLhAeX49FdtYw20NhS2vAgCbc6VO/UzUvi+suPMxTT36S7VTbLKMxruMgL
 FsvSW9NCKXFce12J9aLDTaOtVHsm6yIbC8poOvi2nqbvNgaUwE/1NfpjtR1Qlk3wn5sr mw== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 362x3r8att-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Jan 2021 17:00:07 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10ELv88Q023426;
 Thu, 14 Jan 2021 22:00:06 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma01wdc.us.ibm.com with ESMTP id 35y449g8kc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Jan 2021 22:00:06 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10EM059X28705076
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 Jan 2021 22:00:05 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2772CBE054;
 Thu, 14 Jan 2021 22:00:05 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E4597BE051;
 Thu, 14 Jan 2021 22:00:04 +0000 (GMT)
Received: from localhost (unknown [9.163.36.68])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 14 Jan 2021 22:00:04 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 0/6] powerpc/rtas: miscellaneous cleanups,
 user region allocation
Date: Thu, 14 Jan 2021 15:59:58 -0600
Message-Id: <20210114220004.1138993-1-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-14_08:2021-01-14,
 2021-01-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=617 spamscore=0
 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101140122
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
 aneesh.kumar@linux.ibm.com, brking@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The region exposed to user space for use as work areas passed to
sys_rtas() can be incorrectly allocated on radix, leading to failures
in users of librtas. Correct this and clean up some of the code
visited along the way.

I think the cleanups should be unobjectionable and I've placed them
first in the series. Please check my work on the rtas_rmo_buf
allocation changes; they are only lightly tested so far (slot add on
Power9 PowerVM, and comparison of /memory@0/reg with the contents of
/proc/powerpc/rtas/rmo_buf on qemu Power9 w/radix).

I suspect the per-cpu RTAS argument structures for reentrant calls
need similar measures, but I can add that to the series once there is
consensus on the approach.

Nathan Lynch (6):
  powerpc/rtas: improve ppc_rtas_rmo_buf_show documentation
  powerpc/rtas-proc: remove unused RMO_READ_BUF_MAX
  powerpc/rtas: remove ibm_suspend_me_token
  powerpc/rtas: move syscall filter setup into separate function
  powerpc/rtas: rename RTAS_RMOBUF_MAX to RTAS_USER_REGION_SIZE
  powerpc/rtas: constrain user region allocation to RMA

 arch/powerpc/include/asm/rtas.h |   9 ++-
 arch/powerpc/kernel/rtas-proc.c |  15 +++--
 arch/powerpc/kernel/rtas.c      | 108 ++++++++++++++++++++++++--------
 3 files changed, 98 insertions(+), 34 deletions(-)

-- 
2.29.2

