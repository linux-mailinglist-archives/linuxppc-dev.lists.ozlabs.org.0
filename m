Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DAB4F5A1A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Apr 2022 11:40:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KYKHX0cxLz3bY5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Apr 2022 19:40:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=k6Ygj/cj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=k6Ygj/cj; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KYKG82xPjz2xmZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Apr 2022 19:38:56 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2367jmSt021937; 
 Wed, 6 Apr 2022 09:38:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=aJRsq5GJVfiEib0fpFtxea0MHTG+RTa5qyLk9DDKSkY=;
 b=k6Ygj/cj74Ru5EffzhABeQf/GJ/PF7tQG8PEYNHtvLYKm+AFaOBbmJDy6/yjB7xHjtIx
 TA8N8uPZDgRIQsbjm8ItPo3GdIXUPhzmmThC9hKbmaG5FuKAZxdlShIPvwZiF3uRFbvX
 EgSLsI2BMYf9q1Ma1J44NbpfoJYkzPZU+JCR7/aBM3rmCBLS6N+akNiRWC1K0Tr3tlnr
 0lugZaW1p66vmjUvI+7/xSqUsKz8kXLrS++SnB/iFnK1RpyH/gkJLjFIiUXNR2X5N5SQ
 PPkZv7BNEzA5gTnDAcwK378AB0bd0awyDaYCGL6/Y12aJ5MYHnBIkirZE3OB33f7mggU PA== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f8xe6an1r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Apr 2022 09:38:52 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2369bIIs024283;
 Wed, 6 Apr 2022 09:38:49 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04ams.nl.ibm.com with ESMTP id 3f6e48ygee-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Apr 2022 09:38:49 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2369ckET46137820
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 6 Apr 2022 09:38:46 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9E64C52051;
 Wed,  6 Apr 2022 09:38:46 +0000 (GMT)
Received: from hbathini-workstation.ibm.com.domain.name (unknown
 [9.211.33.167])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 4A1665204E;
 Wed,  6 Apr 2022 09:38:43 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 1/3] powerpc/fadump: fix PT_LOAD segment for boot memory area
Date: Wed,  6 Apr 2022 15:08:37 +0530
Message-Id: <20220406093839.206608-2-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220406093839.206608-1-hbathini@linux.ibm.com>
References: <20220406093839.206608-1-hbathini@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: MgXP8IWPvfusYja5z84Ac03iRmG6oQVz
X-Proofpoint-ORIG-GUID: MgXP8IWPvfusYja5z84Ac03iRmG6oQVz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-06_03,2022-04-05_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 mlxscore=0 adultscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 spamscore=0 mlxlogscore=999 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204060044
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
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Sourabh Jain <sourabhjain@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Boot memory area is setup as separate PT_LOAD segment in the vmcore
as it is moved by f/w, on crash, to a destination address provided by
the kernel. Having separate PT_LOAD segment helps in handling the
different physical address and offset for boot memory area in the
vmcore.

Commit ced1bf52f477 ("powerpc/fadump: merge adjacent memory ranges to
reduce PT_LOAD segements") inadvertly broke this pre-condition for
cases where some of the first kernel memory is available adjacent to
boot memory area. This scenario is rare but possible when memory for
fadump could not be reserved adjacent to boot memory area owing to
memory hole or such. Reading memory from a vmcore exported in such
scenario provides incorrect data.  Fix it by ensuring no other region
is folded into boot memory area.

Fixes: ced1bf52f477 ("powerpc/fadump: merge adjacent memory ranges to reduce PT_LOAD segements")
Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---
 arch/powerpc/kernel/fadump.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index 65562c4a0a69..dc2350b288cf 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -867,7 +867,6 @@ static int fadump_alloc_mem_ranges(struct fadump_mrange_info *mrange_info)
 				       sizeof(struct fadump_memory_range));
 	return 0;
 }
-
 static inline int fadump_add_mem_range(struct fadump_mrange_info *mrange_info,
 				       u64 base, u64 end)
 {
@@ -886,7 +885,12 @@ static inline int fadump_add_mem_range(struct fadump_mrange_info *mrange_info,
 		start = mem_ranges[mrange_info->mem_range_cnt - 1].base;
 		size  = mem_ranges[mrange_info->mem_range_cnt - 1].size;
 
-		if ((start + size) == base)
+		/*
+		 * Boot memory area needs separate PT_LOAD segment(s) as it
+		 * is moved to a different location at the time of crash.
+		 * So, fold only if the region is not boot memory area.
+		 */
+		if ((start + size) == base && start >= fw_dump.boot_mem_top)
 			is_adjacent = true;
 	}
 	if (!is_adjacent) {
-- 
2.35.1

