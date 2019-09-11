Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A519EB007B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2019 17:47:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46T5ql6ZgrzF3Tf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2019 01:46:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46T4cH6KdFzF3Cp
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 00:51:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46T4cH5WC7z8swG
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 00:51:59 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46T4cH4rmKz9sNT; Thu, 12 Sep 2019 00:51:59 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=hbathini@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46T4cH1f7Tz9sNF
 for <linuxppc-dev@ozlabs.org>; Thu, 12 Sep 2019 00:51:59 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8BEgemd051850
 for <linuxppc-dev@ozlabs.org>; Wed, 11 Sep 2019 10:51:57 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uy2702cnj-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Wed, 11 Sep 2019 10:51:57 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Wed, 11 Sep 2019 15:51:55 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 11 Sep 2019 15:51:51 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8BEpnPw55181460
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Sep 2019 14:51:49 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 92058A4060;
 Wed, 11 Sep 2019 14:51:49 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C75E8A405C;
 Wed, 11 Sep 2019 14:51:47 +0000 (GMT)
Received: from hbathini.in.ibm.com (unknown [9.102.24.71])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 11 Sep 2019 14:51:47 +0000 (GMT)
Subject: [PATCH v6 19/36] powernv/fadump: support copying multiple kernel
 boot memory regions
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>
Date: Wed, 11 Sep 2019 20:21:46 +0530
In-Reply-To: <156821308145.5656.2233728784001623843.stgit@hbathini.in.ibm.com>
References: <156821308145.5656.2233728784001623843.stgit@hbathini.in.ibm.com>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19091114-0020-0000-0000-0000036B0DF9
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091114-0021-0000-0000-000021C09B38
Message-Id: <156821350193.5656.3664853158523582019.stgit@hbathini.in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-11_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909110138
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
Cc: Ananth N Mavinakayanahalli <ananth@linux.ibm.com>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Vasant Hegde <hegdevasant@linux.ibm.com>, Oliver <oohall@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Firmware uses a 32-bit field for size while copying/backing-up memory
during MPIPL. So, the maximum value that could be represented with
a PAGE_SIZE aligned 32-bit field will be the maximum copy size for a
region but FADump capture kernel usually needs more memory than that
to be preserved to avoid running into out of memory errors.

So, request firmware to copy multiple kernel boot memory regions
instead of just one (which worked fine for pseries as 64-bit field
was used for size there).

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---

* No major changes in v6.


 arch/powerpc/platforms/powernv/opal-fadump.c |   34 +++++++++++++++++++++-----
 1 file changed, 27 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/opal-fadump.c b/arch/powerpc/platforms/powernv/opal-fadump.c
index b53007e..a4b96a7 100644
--- a/arch/powerpc/platforms/powernv/opal-fadump.c
+++ b/arch/powerpc/platforms/powernv/opal-fadump.c
@@ -26,6 +26,8 @@ static int opal_fadump_unregister(struct fw_dump *fadump_conf);
 static void opal_fadump_update_config(struct fw_dump *fadump_conf,
 				      const struct opal_fadump_mem_struct *fdm)
 {
+	pr_debug("Boot memory regions count: %d\n", fdm->region_cnt);
+
 	/*
 	 * The destination address of the first boot memory region is the
 	 * destination address of boot memory regions.
@@ -48,16 +50,34 @@ static void opal_fadump_init_metadata(struct opal_fadump_mem_struct *fdm)
 
 static u64 opal_fadump_init_mem_struct(struct fw_dump *fadump_conf)
 {
-	u64 addr = fadump_conf->reserve_dump_area_start;
+	int max_copy_size, cur_size, size;
+	u64 src_addr, dest_addr;
 
 	opal_fdm = __va(fadump_conf->kernel_metadata);
 	opal_fadump_init_metadata(opal_fdm);
 
-	opal_fdm->region_cnt = 1;
-	opal_fdm->rgn[0].src	= 0;
-	opal_fdm->rgn[0].dest	= addr;
-	opal_fdm->rgn[0].size	= fadump_conf->boot_memory_size;
-	addr += fadump_conf->boot_memory_size;
+	/*
+	 * Firmware supports 32-bit field for size. Align it to PAGE_SIZE
+	 * and request firmware to copy multiple kernel boot memory regions.
+	 */
+	max_copy_size = _ALIGN_DOWN(U32_MAX, PAGE_SIZE);
+
+	/* Boot memory regions */
+	src_addr = 0;
+	dest_addr = fadump_conf->reserve_dump_area_start;
+	size = fadump_conf->boot_memory_size;
+	while (size) {
+		cur_size = size > max_copy_size ? max_copy_size : size;
+
+		opal_fdm->rgn[opal_fdm->region_cnt].src  = src_addr;
+		opal_fdm->rgn[opal_fdm->region_cnt].dest = dest_addr;
+		opal_fdm->rgn[opal_fdm->region_cnt].size = cur_size;
+
+		opal_fdm->region_cnt++;
+		dest_addr	+= cur_size;
+		src_addr	+= cur_size;
+		size		-= cur_size;
+	}
 
 	/*
 	 * Kernel metadata is passed to f/w and retrieved in capture kerenl.
@@ -68,7 +88,7 @@ static u64 opal_fadump_init_mem_struct(struct fw_dump *fadump_conf)
 
 	opal_fadump_update_config(fadump_conf, opal_fdm);
 
-	return addr;
+	return dest_addr;
 }
 
 static u64 opal_fadump_get_metadata_size(void)

