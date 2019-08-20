Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4AD95F2D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 14:50:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CVyT6mDYzDqZy
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 22:50:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46CTz56zm6zDqwg
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 22:06:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46CTz549Cgz8tFS
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 22:06:09 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46CTz51022z9sML; Tue, 20 Aug 2019 22:06:09 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=hbathini@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46CTz4349Gz9sDQ
 for <linuxppc-dev@ozlabs.org>; Tue, 20 Aug 2019 22:06:08 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7KC1fBP097891
 for <linuxppc-dev@ozlabs.org>; Tue, 20 Aug 2019 08:06:06 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ugg74s2v2-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Tue, 20 Aug 2019 08:06:05 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Tue, 20 Aug 2019 13:06:04 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 20 Aug 2019 13:06:01 +0100
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7KC5xWf42336400
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Aug 2019 12:06:00 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DA4EF42041;
 Tue, 20 Aug 2019 12:05:59 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8947842049;
 Tue, 20 Aug 2019 12:05:58 +0000 (GMT)
Received: from hbathini.in.ibm.com (unknown [9.184.183.117])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 20 Aug 2019 12:05:58 +0000 (GMT)
Subject: [PATCH v5 15/31] powernv/fadump: support copying multiple kernel
 boot memory regions
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>
Date: Tue, 20 Aug 2019 17:35:57 +0530
In-Reply-To: <156630261682.8896.3418665808003586786.stgit@hbathini.in.ibm.com>
References: <156630261682.8896.3418665808003586786.stgit@hbathini.in.ibm.com>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19082012-0012-0000-0000-00000340AF03
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19082012-0013-0000-0000-0000217AD2E6
Message-Id: <156630275779.8896.7854485220030978790.stgit@hbathini.in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-20_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908200128
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

Firmware uses 32-bit field for region size while copying/backing-up
memory during MPIPL. So, the maximum copy size for a region would
be a page less than 4GB (aligned to pagesize) but FADump capture
kernel usually needs more memory than that to be preserved to avoid
running into out of memory errors.

So, request firmware to copy multiple kernel boot memory regions
instead of just one (which worked fine for pseries as 64-bit field
was used for size there).

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---
 arch/powerpc/platforms/powernv/opal-fadump.c |   35 +++++++++++++++++++++-----
 1 file changed, 28 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/opal-fadump.c b/arch/powerpc/platforms/powernv/opal-fadump.c
index 91fb909..a755705 100644
--- a/arch/powerpc/platforms/powernv/opal-fadump.c
+++ b/arch/powerpc/platforms/powernv/opal-fadump.c
@@ -28,6 +28,8 @@ static int opal_fadump_unregister(struct fw_dump *fadump_conf);
 static void opal_fadump_update_config(struct fw_dump *fadump_conf,
 				      const struct opal_fadump_mem_struct *fdm)
 {
+	pr_debug("Boot memory regions count: %d\n", fdm->region_cnt);
+
 	/*
 	 * The destination address of the first boot memory region is the
 	 * destination address of boot memory regions.
@@ -50,16 +52,35 @@ static void opal_fadump_init_metadata(struct opal_fadump_mem_struct *fdm)
 
 static ulong opal_fadump_init_mem_struct(struct fw_dump *fadump_conf)
 {
-	ulong addr = fadump_conf->reserve_dump_area_start;
+	ulong src_addr, dest_addr;
+	int max_copy_size, cur_size, size;
 
 	opal_fdm = __va(fadump_conf->kernel_metadata);
 	opal_fadump_init_metadata(opal_fdm);
 
-	opal_fdm->region_cnt = 1;
-	opal_fdm->rgn[0].src	= RMA_START;
-	opal_fdm->rgn[0].dest	= addr;
-	opal_fdm->rgn[0].size	= fadump_conf->boot_memory_size;
-	addr += fadump_conf->boot_memory_size;
+	/*
+	 * Firmware currently supports only 32-bit value for size,
+	 * align it to pagesize and request firmware to copy multiple
+	 * kernel boot memory regions.
+	 */
+	max_copy_size = _ALIGN_DOWN(U32_MAX, PAGE_SIZE);
+
+	/* Boot memory regions */
+	src_addr = RMA_START;
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
@@ -70,7 +91,7 @@ static ulong opal_fadump_init_mem_struct(struct fw_dump *fadump_conf)
 
 	opal_fadump_update_config(fadump_conf, opal_fdm);
 
-	return addr;
+	return dest_addr;
 }
 
 static ulong opal_fadump_get_metadata_size(void)

