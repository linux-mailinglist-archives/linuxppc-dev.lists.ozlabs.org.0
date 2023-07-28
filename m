Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 354757677F2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jul 2023 23:56:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fzluV/sP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RCM0c30SVz3cTd
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jul 2023 07:56:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fzluV/sP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=arbab@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RCLzh5h90z3cKC
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jul 2023 07:55:44 +1000 (AEST)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36SLg8Na004101;
	Fri, 28 Jul 2023 21:55:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=Z0KQipUX684zPBgdOZJNOmOFRos7OFxqhDBCsvU3lv4=;
 b=fzluV/sPSQX/YNSgYgavF2pIDlVfqmEI+E+a+0KqhVf0dR/zNAl4uY0ZXaz3I2t4vINK
 wUln2V112qoYjCp+KgULbtIk1FEPX3TMc8eFij5LaToiMuYtdPfEKUA+RkjVOVDV6nns
 KR8p01d54/j0drnlyk2QSduRCHlkCQFTxcRLatyc8PGoZJDzL34pno3BUkOo8IivHw5C
 Gviil1JVYERyR3RSkZOrlCCNnlpLepSUm8NMhg6aCYA7pUcQkClOSMGk+Su7UNztYTq+
 SJC1fmPCfYedQmCEx/NcPcMrMApUY5zg1TTizXzFuqtbLXcjLZXxSHqD++JmZIMAlvcT ag== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s4ntmr8ej-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jul 2023 21:55:35 +0000
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36SLrL9R001885;
	Fri, 28 Jul 2023 21:55:34 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s4ntmr8e6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jul 2023 21:55:34 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36SK18JH002059;
	Fri, 28 Jul 2023 21:55:33 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3s0tenspjb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jul 2023 21:55:33 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36SLtWXr5440248
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 28 Jul 2023 21:55:32 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8222758056;
	Fri, 28 Jul 2023 21:55:32 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4572158052;
	Fri, 28 Jul 2023 21:55:32 +0000 (GMT)
Received: from arbab-laptop.localdomain (unknown [9.61.53.90])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with SMTP;
	Fri, 28 Jul 2023 21:55:32 +0000 (GMT)
Received: from arbab-laptop.ghola.net (localhost [IPv6:::1])
	by arbab-laptop.localdomain (Postfix) with ESMTPS id 2BB2F14FDA9;
	Fri, 28 Jul 2023 16:55:31 -0500 (CDT)
Date: Fri, 28 Jul 2023 16:55:23 -0500
From: Reza Arbab <arbab@linux.ibm.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v3 1/2] powerpc/mm: Cleanup memory block size probing
Message-ID: <f38660ab-89ed-44f5-ac7e-34c89a3e66d1@arbab-laptop>
References: <20230728103556.745681-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20230728103556.745681-1-aneesh.kumar@linux.ibm.com>
Organization: IBM Linux Technology Center
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 6a1m7UrZw0WXJO3HBHiNhZVzanoXJczw
X-Proofpoint-ORIG-GUID: FaflA7oD7CRGD84NQacOFEVG0E3-qT1G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-27_10,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 malwarescore=0 mlxlogscore=999 clxscore=1011 lowpriorityscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 mlxscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307280197
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
Cc: foraker1@llnl.gov, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 28, 2023 at 04:05:55PM +0530, Aneesh Kumar K.V wrote:
>--- a/arch/powerpc/mm/init_64.c
>+++ b/arch/powerpc/mm/init_64.c
[snip]
>+	/*
>+	 * "ibm,coherent-device-memory with linux,usable-memory = 0
>+	 * Force 256MiB block size. Work around for GPUs on P9 PowerNV
>+	 * linux,usable-memory == 0 implies driver managed memory and
>+	 * we can't use large memory block size due to hotplug/unplug
>+	 * limitations.
>+	 */
>+	compatible = of_get_flat_dt_prop(node, "compatible", NULL);
>+	if (compatible && !strcmp(compatible, "ibm,coherent-device-memory")) {
>+		int len = 0;
>+		const __be32 *usm;
>+
>+		usm = of_get_flat_dt_prop(node, "linux,drconf-usable-memory", &len);

I think this should be "linux,usable-memory".

>+		if (usm && !len) {
>+			*block_size = SZ_256M;
>+			return 1;
>+		}

This isn't quite right. The criteria is not that the property itself has 
no registers, it's that the base/size combo has size zero.

If you fold in the patch appended to the end of this mail, things worked 
for me.

>+	}
>+
>+	reg = of_get_flat_dt_prop(node, "reg", &l);
>+	endp = reg + (l / sizeof(__be32));
>+
>+	while ((endp - reg) >= (dt_root_addr_cells + dt_root_size_cells)) {
>+		u64 base, size;
>+
>+		base = dt_mem_next_cell(dt_root_addr_cells, &reg);
>+		size = dt_mem_next_cell(dt_root_size_cells, &reg);
>+
>+		if (size == 0)
>+			continue;
>+
>+		update_memory_block_size(block_size, size);
>+	}
>+	/* continue looking for other memory device types */
>+	return 0;
>+}
>+
>+/*
>+ * start with 1G memory block size. Early init will
>+ * fix this with correct value.
>+ */
>+unsigned long memory_block_size __ro_after_init = 1UL << 30;

Could use SZ_1G here.

With the following fixup, I got 256MiB blocks on a system with
"ibm,coherent-device-memory" nodes.

diff --git a/arch/powerpc/mm/init_64.c b/arch/powerpc/mm/init_64.c
index dbed37d6cffb..1ac58e72a885 100644
--- a/arch/powerpc/mm/init_64.c
+++ b/arch/powerpc/mm/init_64.c
@@ -487,7 +487,6 @@ static int __init probe_memory_block_size(unsigned long node, const char *uname,
  					  depth, void *data)
  {
  	const char *type;
-	const char *compatible;
  	unsigned long *block_size = (unsigned long *)data;
  	const __be32 *reg, *endp;
  	int l;
@@ -532,38 +531,38 @@ static int __init probe_memory_block_size(unsigned long node, const char *uname,
  	if (type == NULL || strcmp(type, "memory") != 0)
  		return 0;
  
-	/*
-	 * "ibm,coherent-device-memory with linux,usable-memory = 0
-	 * Force 256MiB block size. Work around for GPUs on P9 PowerNV
-	 * linux,usable-memory == 0 implies driver managed memory and
-	 * we can't use large memory block size due to hotplug/unplug
-	 * limitations.
-	 */
-	compatible = of_get_flat_dt_prop(node, "compatible", NULL);
-	if (compatible && !strcmp(compatible, "ibm,coherent-device-memory")) {
-		int len = 0;
-		const __be32 *usm;
-
-		usm = of_get_flat_dt_prop(node, "linux,drconf-usable-memory", &len);
-		if (usm && !len) {
-			*block_size = SZ_256M;
-			return 1;
-		}
-	}
+	reg = of_get_flat_dt_prop(node, "linux,usable-memory", &l);
+	if (!reg)
+		reg = of_get_flat_dt_prop(node, "reg", &l);
+	if (!reg)
+		return 0;
  
-	reg = of_get_flat_dt_prop(node, "reg", &l);
  	endp = reg + (l / sizeof(__be32));
  
  	while ((endp - reg) >= (dt_root_addr_cells + dt_root_size_cells)) {
+		const char *compatible;
  		u64 base, size;
  
  		base = dt_mem_next_cell(dt_root_addr_cells, &reg);
  		size = dt_mem_next_cell(dt_root_size_cells, &reg);
  
-		if (size == 0)
+		if (size) {
+			update_memory_block_size(block_size, size);
  			continue;
+		}
  
-		update_memory_block_size(block_size, size);
+		/*
+		 * ibm,coherent-device-memory with linux,usable-memory = 0
+		 * Force 256MiB block size. Work around for GPUs on P9 PowerNV
+		 * linux,usable-memory == 0 implies driver managed memory and
+		 * we can't use large memory block size due to hotplug/unplug
+		 * limitations.
+		 */
+		compatible = of_get_flat_dt_prop(node, "compatible", NULL);
+		if (compatible && !strcmp(compatible, "ibm,coherent-device-memory")) {
+			*block_size = SZ_256M;
+			return 1;
+		}
  	}
  	/* continue looking for other memory device types */
  	return 0;
-- 
Reza Arbab
