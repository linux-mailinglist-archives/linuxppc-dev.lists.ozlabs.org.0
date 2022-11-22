Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE7F634AD7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Nov 2022 00:13:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NH0SL6T68z3f56
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Nov 2022 10:13:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=I7GVWZ8i;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=I7GVWZ8i;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NH0QH6jWnz3cKY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Nov 2022 10:12:07 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AMLAiXI030811;
	Tue, 22 Nov 2022 23:12:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=C/JHvb1WUUzgACt4vQwJbnsb/MxP05BLY7PDzRP/MZ0=;
 b=I7GVWZ8iVCMG+aESLyEOjD28Q/P77gWN5xgDhR61tLG9f8bUpxWVHSQif+YKoUGrAp0Y
 dV/IPtff3tKws5GmNvlgwqFUcvmTjEV3k1mc00ZI4CUmQNTfen50KkOe5tU9tCnd3Igk
 hyNCy+v8HA4U7JPqD7riNfeca8Dr8vSiLZsuAkjy5hrgE34q7STldDsVWrHDt/ai1L1R
 wMLuDvdaIaCTFnjmHNA8evu16iGcSvgGG2lZSXP84sHz6UuTntH/xS3w4v6NgLhGKucZ
 PPkLJlFeicTLPHPHG3Nfcb1KYW5QKQJr6SsTMEvORCmLFVCVTyOHYQWA9ytAHEYx6lcm oA== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m0yk6vxht-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Nov 2022 23:12:04 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AMN4qb9006438;
	Tue, 22 Nov 2022 23:12:02 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma04fra.de.ibm.com with ESMTP id 3kxps8ujnh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Nov 2022 23:12:01 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AMNBxGL66453908
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Nov 2022 23:11:59 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AEE8DA404D;
	Tue, 22 Nov 2022 23:11:59 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5998FA4040;
	Tue, 22 Nov 2022 23:11:59 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue, 22 Nov 2022 23:11:59 +0000 (GMT)
Received: from li-0d7fa1cc-2c9d-11b2-a85c-aed20764436d.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id B056E60419;
	Wed, 23 Nov 2022 10:11:56 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 2/7] selftests/powerpc: Add ptrace setup_core_pattern() null-terminator
Date: Wed, 23 Nov 2022 10:10:58 +1100
Message-Id: <20221122231103.15829-3-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221122231103.15829-1-bgray@linux.ibm.com>
References: <20221122231103.15829-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: IxXNO10daKc02ibJyHitZ7LFIMQE_2nK
X-Proofpoint-ORIG-GUID: IxXNO10daKc02ibJyHitZ7LFIMQE_2nK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-22_13,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 mlxscore=0 mlxlogscore=999
 bulkscore=0 adultscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211220174
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
Cc: Benjamin Gray <bgray@linux.ibm.com>, ajd@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

- malloc() does not zero the buffer,
- fread() does not null-terminate it's output,
- `cat /proc/sys/kernel/core_pattern | hexdump -C` shows the file is
  not inherently null-terminated

So using string operations on the buffer is risky. Explicitly add a null
character to the end to make it safer.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
 tools/testing/selftests/powerpc/ptrace/core-pkey.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/powerpc/ptrace/core-pkey.c b/tools/testing/selftests/powerpc/ptrace/core-pkey.c
index bbc05ffc5860..5c82ed9e7c65 100644
--- a/tools/testing/selftests/powerpc/ptrace/core-pkey.c
+++ b/tools/testing/selftests/powerpc/ptrace/core-pkey.c
@@ -383,7 +383,7 @@ static int setup_core_pattern(char **core_pattern_, bool *changed_)
 		goto out;
 	}
 
-	ret = fread(core_pattern, 1, PATH_MAX, f);
+	ret = fread(core_pattern, 1, PATH_MAX - 1, f);
 	fclose(f);
 	if (!ret) {
 		perror("Error reading core_pattern file");
@@ -391,6 +391,8 @@ static int setup_core_pattern(char **core_pattern_, bool *changed_)
 		goto out;
 	}
 
+	core_pattern[ret] = '\0';
+
 	/* Check whether we can predict the name of the core file. */
 	if (!strcmp(core_pattern, "core") || !strcmp(core_pattern, "core.%p"))
 		*changed_ = false;
-- 
2.38.1

