Return-Path: <linuxppc-dev+bounces-2954-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 878BA9BFDE8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2024 06:58:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XkWbL1zsQz3bjK;
	Thu,  7 Nov 2024 16:58:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730959118;
	cv=none; b=aqHx3d5Un+ODaG7SU+06ScnXpsL16/8lAsz4kbHyQFrCp9Dc+PxIPt4V9Rt1fWT3JkEgxy2NAHuRfzvROpdi5lZ4JuZKW9mGU472807XCRH6q9t0S4x2R9nm4j7oCmWRB7jfDYwxuLlmi3gSxfFcqWjpksB1gz59tHszziTnm2Twf6ckgRN1a14jq5mw6BV1V2M8OoaShUL02c3YLnQMy6rqLsnz8obLlvdrv+2ybjInaLLLKhAVjlbQin9R9DTGzeDWxewXfBjbKY7GYfOL8AZp/mAU8DCMqnm5ELolmGHqb2WM4S15d/FR660qNWIvz7E/jtmTrsiyJzLQqZltcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730959118; c=relaxed/relaxed;
	bh=OuujlFxiU6szvtilv5yX9f+2096A9hETVIfrqvF5TUg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fd6N19EMQyphgjX4x+bu8T+klQ7/qqucpJA9mw12ImBC0P3a5r+3CXlE4KdVIKmN8GnXdHGP0SQhMLo2xU/JxrHjsK42/Xr/dJZgKq5CgWyME8R1qBxWMFdwmscLn+tva24nTBg8wGZZY2kRVcEw5nABiw7ci5CoWUDbprJf5SzsQT4tTZIWTcgN1nu60cB0/u9hYswKgFK6XMhYCknd8gsuR+7a4G2QAz7aEYLD/iB39XFbu5PsilwN9o+7l7WtYOaP9vuKvhdaZASypK4F7o3yei7fY9YF4XDSBAKEs04nofwUfphDC5lAejDAA9pq00Fw+4PmKDZXWKsbK856yg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ksLmW+08; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ksLmW+08;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XkWbJ1f1lz3bjG
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2024 16:58:35 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A75MBHS030621;
	Thu, 7 Nov 2024 05:58:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=OuujlFxiU6szvtilv
	5yX9f+2096A9hETVIfrqvF5TUg=; b=ksLmW+08+jrDESMhFzuT2p50xPgOOZorM
	yvUUdBnaSQg2b+gF4LE8Df2czBQbStyXDlqx7L1C2zkspHY643/CWZ9OYaVvAyjH
	QHvX7UMddxYum5WhoJkQ7yLjlv/2c/IABA3q4HQE8hPmR93E8Ng1PqEDJnvYghtt
	v4zbJdqyVe/cDT4iT9Pw5rvgNfqLEM2O81JopmnmXbmml8+qEm36xWh1oWocVpuq
	YhSDvmkdih7Yups3fAJtuS0IFn6X9NJWnrQcTZobnGALBLZQmEqhx9vhdU1qgN6k
	CMBoVtRkRqSxo2689dG49Y0vKfrFrE90H/8qiGOPOGI84m70jWUAw==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42rq5mg6sn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Nov 2024 05:58:28 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4A72fQLG012249;
	Thu, 7 Nov 2024 05:58:27 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 42p140yhmp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Nov 2024 05:58:27 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4A75wNrE33424060
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 7 Nov 2024 05:58:23 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 86EAA20040;
	Thu,  7 Nov 2024 05:58:23 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 24E0220043;
	Thu,  7 Nov 2024 05:58:22 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.in.ibm.com (unknown [9.109.204.94])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  7 Nov 2024 05:58:21 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Hari Bathini <hbathini@linux.ibm.com>
Subject: [PATCH v2 2/2] fadump: reserve param area if below boot_mem_top
Date: Thu,  7 Nov 2024 11:28:17 +0530
Message-ID: <20241107055817.489795-2-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241107055817.489795-1-sourabhjain@linux.ibm.com>
References: <20241107055817.489795-1-sourabhjain@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 3n6J2e9WGHuFoumuCUaT_h_DhujjoTb1
X-Proofpoint-ORIG-GUID: 3n6J2e9WGHuFoumuCUaT_h_DhujjoTb1
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=893 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411070041
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The param area is a memory region where the kernel places additional
command-line arguments for fadump kernel. Currently, the param memory
area is reserved in fadump kernel if it is above boot_mem_top. However,
it should be reserved if it is below boot_mem_top because the fadump
kernel already reserves memory from boot_mem_top to the end of DRAM.

Currently, there is no impact from not reserving param memory if it is
below boot_mem_top, as it is not used after the early boot phase of the
fadump kernel. However, if this changes in the future, it could lead to
issues in the fadump kernel.

Fixes: 3416c9daa6b1 ("powerpc/fadump: pass additional parameters when fadump is active")
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Acked-by: Hari Bathini <hbathini@linux.ibm.com>
Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---

Changelog:

Since v1: https://lore.kernel.org/all/20241104083528.99520-1-sourabhjain@linux.ibm.com/
  - Include Fixes and Acked-by tag in the commit message
  - No functional changes

---
 arch/powerpc/kernel/fadump.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index 3a2863307863..3f3674060164 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -143,7 +143,7 @@ void __init fadump_append_bootargs(void)
 	if (!fw_dump.dump_active || !fw_dump.param_area_supported || !fw_dump.param_area)
 		return;
 
-	if (fw_dump.param_area >= fw_dump.boot_mem_top) {
+	if (fw_dump.param_area < fw_dump.boot_mem_top) {
 		if (memblock_reserve(fw_dump.param_area, COMMAND_LINE_SIZE)) {
 			pr_warn("WARNING: Can't use additional parameters area!\n");
 			fw_dump.param_area = 0;
-- 
2.46.2


