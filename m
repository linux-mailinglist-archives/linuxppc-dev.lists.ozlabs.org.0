Return-Path: <linuxppc-dev+bounces-1389-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D019798D7
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Sep 2024 22:58:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X6L3H2CfDz2yZZ;
	Mon, 16 Sep 2024 06:57:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726433867;
	cv=none; b=idMXJhSAG+u2tygJrTY1xZv0YRlZG7gt5dw6YBBFFWLixiRlDxS475yYDHKQep0UhLSN8nEkasfS9Ns1ixquHwYNdygm3RC7j9qAG+6WkABnMwEco+C7MCPNeMlR9fOxrSPjKgMTBnbieJfkZivYM/lWP5ftq57tH3I/OUyYNf6ZKmSNET5IeQcjY1RONYE78Q28Wm1jYLh2AIV+W7z+JilKkJB3vBjfUq8DFgiNs8m/hIx1YOccCtI/Ghpu3jrUi/QQFJ/AiA8uI2T7wgE1fxa1ZUpd6ONvDfPWXByarGgtdogOD74Ka4zuX61q1h9Xwk0/unT0+ZVtq7G3pQkr5g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726433867; c=relaxed/relaxed;
	bh=rICOsI28/72qjimCAjutIBgMENDkpjnCUa7QBsCo8Kc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SHWZVnA/Shi5asR5VtAkh4aJSVHj8e5aFTBTaxe8E+9we6YAl91ccrCCaN4NETjE8ijJJ4nz3I23pqNXC/SmmfaT8WAfDrU/dDF6dvWHueSN4rZSmApSSepiMTb7KEMEM6TihFUFaHTJsXLo7wj8hITIbrEHPPRBM3CdJ25yPZMVWHgQRddXDzVnjfg92UmYtuWiGOcyFZ51KF7JuKORnP3jaecSiTF+OlpX3On7Cs6x0Pb0Wm/K4XOnhaPyPlXXqlHLAmcrTO7lNQ4tVL50KKTPdJ6VaBjbut38GEgRQRcJ+PJ/30BLzWE/hv9hXgj4jPriIsJ2OszoJ29ZJ0c/Hw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nutLOqyM; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nutLOqyM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X6L3G6Bn0z2yZ6
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Sep 2024 06:57:46 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48FKfcvN029990;
	Sun, 15 Sep 2024 20:57:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=pp1; bh=rICOsI28/72qj
	imCAjutIBgMENDkpjnCUa7QBsCo8Kc=; b=nutLOqyMJ3TtUk/YOdBSFFlaod1xx
	+YdSveTydJmckbSRa6oMRBrDdbGrOh61QAWwRlfgsiM1twrrZIdC3DJdp2u75k2r
	ZG5mlBYo7/xEWh9Qc3HrimRV90v2NPSD5oZAp9n/DVYSlDvA3XwsV/vUowBC37LD
	D34Wvbe6bVbWoQV6Xh7ls2CJ148MAXQUhbsUBhPlgVFYSkpVYO4bP+/cBm2g7KBd
	PvYY5mv7Zus1qjPErZg9TLh0lfqDglr6i7eNSvMNL8ZloPA/5nihPh79xr5vWUNj
	lSHupR6JMtaPejSYkkNqnfwZslw54xhhaN+MZFOItHF/Ixf/3ORS1wHKQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41n3vne8h5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 15 Sep 2024 20:57:28 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 48FKvSCY024779;
	Sun, 15 Sep 2024 20:57:28 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41n3vne8h3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 15 Sep 2024 20:57:28 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 48FIiwJY000634;
	Sun, 15 Sep 2024 20:57:27 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 41nn70uw7t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 15 Sep 2024 20:57:27 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 48FKvN3O54854032
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 15 Sep 2024 20:57:23 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7244420049;
	Sun, 15 Sep 2024 20:57:23 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9020B20040;
	Sun, 15 Sep 2024 20:57:19 +0000 (GMT)
Received: from li-bd3f974c-2712-11b2-a85c-df1cec4d728e.ibm.com.com (unknown [9.43.68.55])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 15 Sep 2024 20:57:19 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, bpf@vger.kernel.org,
        linux-trace-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: "Naveen N. Rao" <naveen@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nicholas Piggin <npiggin@gmail.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Andrii Nakryiko <andrii@kernel.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Vishal Chourasia <vishalc@linux.ibm.com>,
        Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
        Masami Hiramatsu <mhiramat@kernel.org>
Subject: [PATCH v5 07/17] powerpc/ftrace: Skip instruction patching if the instructions are the same
Date: Mon, 16 Sep 2024 02:26:38 +0530
Message-ID: <20240915205648.830121-8-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240915205648.830121-1-hbathini@linux.ibm.com>
References: <20240915205648.830121-1-hbathini@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: -xhLp2SQbwzr2h4N68QqUOI8_hACQXJt
X-Proofpoint-GUID: 8-HrT9gb5nKTgblEAuOAfxvk7VMxngb9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-15_12,2024-09-13_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=832
 priorityscore=1501 phishscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 impostorscore=0 spamscore=0 suspectscore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409150159

From: Naveen N Rao <naveen@kernel.org>

To simplify upcoming changes to ftrace, add a check to skip actual
instruction patching if the old and new instructions are the same. We
still validate that the instruction is what we expect, but don't
actually patch the same instruction again.

Signed-off-by: Naveen N Rao <naveen@kernel.org>
---
 arch/powerpc/kernel/trace/ftrace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index fe0546fbac8e..719517265d39 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -82,7 +82,7 @@ static inline int ftrace_modify_code(unsigned long ip, ppc_inst_t old, ppc_inst_
 {
 	int ret = ftrace_validate_inst(ip, old);
 
-	if (!ret)
+	if (!ret && !ppc_inst_equal(old, new))
 		ret = patch_instruction((u32 *)ip, new);
 
 	return ret;
-- 
2.46.0


