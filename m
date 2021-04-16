Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F1B3620A4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 15:15:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FMGsN70v5z3bwZ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 23:15:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NdRPmgCp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=NdRPmgCp; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FMGrv60xKz30C1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 23:14:39 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13GD9lqS156867; Fri, 16 Apr 2021 09:14:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=9fUQrSZuKfammPSftc3OmoepbGzIFSOCtmtCwQM4Cqk=;
 b=NdRPmgCpwLk2TTfLoUJRJj+7wZWGywZZiInRZIhWvVUQhkRbdjyazrYSH2AJ7y2aVoVg
 OkDBz6PC2+kdFnSLTVSbXyPSuhAYoI9VmSOPBDDYEIyh+hurJXBbqsmwMCJPPVIY1yI/
 5qaTNyTly4eqa4ZoGGGlob0NJ/zd83u54bipYGE576QwJfcDsT2qZvXgddS5QTdl0Urr
 9UsqWP7m39WAeoJ6HAhZnTEDAM/6IJ+wDJR5RmbP6lH9/7zYVcVI1DpXMmPbmp9ESvSV
 oAjCNLt+OJQ7urw8RrSZu4fX5ayfnhbUTXwsGB6bdPDKz+L/6NturiWMrAERjHvsMIGd eA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37xbpudfng-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Apr 2021 09:14:32 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13GCYZBa042708;
 Fri, 16 Apr 2021 08:58:03 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37xbpuda7v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Apr 2021 08:58:03 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13GCswmL007978;
 Fri, 16 Apr 2021 12:58:00 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma01fra.de.ibm.com with ESMTP id 37u3n8adw4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Apr 2021 12:58:00 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13GCvvv463897894
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 Apr 2021 12:57:57 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 814F44C046;
 Fri, 16 Apr 2021 12:57:57 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 454124C059;
 Fri, 16 Apr 2021 12:57:56 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.77.192.155])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 16 Apr 2021 12:57:56 +0000 (GMT)
From: Ganesh Goudar <ganeshgr@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH] powerpc/pseries/mce: Fix a typo in error type assignment
Date: Fri, 16 Apr 2021 18:27:50 +0530
Message-Id: <20210416125750.49550-1-ganeshgr@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: GIGOGGcECthsYisNa9rJGCJt6q03c5_Q
X-Proofpoint-GUID: cIkFDkeaaV7DQNQuDy0IirvRJFXh1gxH
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-16_07:2021-04-15,
 2021-04-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=999 clxscore=1015 suspectscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 mlxscore=0 spamscore=0
 phishscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104060000 definitions=main-2104160097
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
Cc: Ganesh Goudar <ganeshgr@linux.ibm.com>, mahesh@linux.ibm.com,
 npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The error type is ICACHE and DCACHE, for case MCE_ERROR_TYPE_ICACHE.

Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/ras.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/ras.c b/arch/powerpc/platforms/pseries/ras.c
index f8b390a9d9fb..9d4ef65da7f3 100644
--- a/arch/powerpc/platforms/pseries/ras.c
+++ b/arch/powerpc/platforms/pseries/ras.c
@@ -699,7 +699,7 @@ static int mce_handle_err_virtmode(struct pt_regs *regs,
 		mce_err.error_type = MCE_ERROR_TYPE_DCACHE;
 		break;
 	case MC_ERROR_TYPE_I_CACHE:
-		mce_err.error_type = MCE_ERROR_TYPE_DCACHE;
+		mce_err.error_type = MCE_ERROR_TYPE_ICACHE;
 		break;
 	case MC_ERROR_TYPE_UNKNOWN:
 	default:
-- 
2.26.2

