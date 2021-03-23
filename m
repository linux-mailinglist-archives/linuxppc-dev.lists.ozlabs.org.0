Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFC23465E9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 18:07:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4d842qXyz3bq5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Mar 2021 04:07:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ouai4AGx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sbhat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Ouai4AGx; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4d7c543fz30Bk
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Mar 2021 04:06:35 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12NH3xXf001480; Tue, 23 Mar 2021 13:06:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to : cc
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=6JBiiubwipK622upUtTmkHf38UHQC7sl7ULXNHJlHcY=;
 b=Ouai4AGxcFMeH/hwPoIwsjOw4HbYF+0qXD32A18FVdR7OCyoI2f8oqPmr+ayCyNFfC2m
 5ugs4nidVsGdG7kfoJiR4z9xWXDttetPuJrC6v/bOIITIq0pbvBGgDgDzs5Ln1m5HorY
 Rfmee4GrWAMDfSNiN+tLUV0zLvCcPFefkjMTmGKtC/WIeAMxKj551j0WQK1HYXDTChhc
 EayaYxCdLd8fBm4ieNNvpZUlF9JJbggbFrurFtgK8rX8cJ2Wlu8DK4nzXChcoJEp/XWe
 w1go329CyFDdfrdtHc/Hhj7z2DIhzlyg5SDaSNeujiTMywqkrxLLTbTOLHd8bvnZONNK 6Q== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37fm8cgbkr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Mar 2021 13:06:31 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12NGvFJp028891;
 Tue, 23 Mar 2021 17:06:29 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03fra.de.ibm.com with ESMTP id 37d9bpsuv1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Mar 2021 17:06:29 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12NH6QSW40763686
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Mar 2021 17:06:26 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 74A5F52050;
 Tue, 23 Mar 2021 17:06:26 +0000 (GMT)
Received: from [172.17.0.2] (unknown [9.40.192.207])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 4BF285204E;
 Tue, 23 Mar 2021 17:06:25 +0000 (GMT)
Subject: [PATCH v2] powerpc/papr_scm: Implement support for H_SCM_FLUSH hcall
From: Shivaprasad G Bhat <sbhat@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, kvm-ppc@vger.kernel.org,
 linux-nvdimm@lists.01.org, aneesh.kumar@linux.ibm.com, ellerman@au1.ibm.com
Date: Tue, 23 Mar 2021 13:06:24 -0400
Message-ID: <161651910115.13873.14215644994307713797.stgit@6532096d84d3>
User-Agent: StGit/0.21
Content-Type: text/plain; charset="utf-8"
X-TM-AS-GCONF: 00
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-23_07:2021-03-22,
 2021-03-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 mlxscore=0 impostorscore=0 clxscore=1011
 adultscore=0 suspectscore=0 mlxlogscore=999 spamscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103230126
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
Cc: vaibhav@linux.ibm.com, sbhat@linux.vnet.ibm.com, linux-doc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add support for ND_REGION_ASYNC capability if the device tree
indicates 'ibm,hcall-flush-required' property in the NVDIMM node.
Flush is done by issuing H_SCM_FLUSH hcall to the hypervisor.

If the flush request failed, the hypervisor is expected to
to reflect the problem in the subsequent dimm health request call.

This patch prevents mmap of namespaces with MAP_SYNC flag if the
nvdimm requires explicit flush[1].

References:
[1] https://github.com/avocado-framework-tests/avocado-misc-tests/blob/master/memory/ndctl.py.data/map_sync.c

Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
---
v1 - https://www.spinics.net/lists/kvm-ppc/msg18272.html
Changes from v1:
       - Hcall semantics finalized, all changes are to accomodate them.

 Documentation/powerpc/papr_hcalls.rst     |   14 ++++++++++
 arch/powerpc/include/asm/hvcall.h         |    3 +-
 arch/powerpc/platforms/pseries/papr_scm.c |   39 +++++++++++++++++++++++++++++
 3 files changed, 55 insertions(+), 1 deletion(-)

diff --git a/Documentation/powerpc/papr_hcalls.rst b/Documentation/powerpc/papr_hcalls.rst
index 48fcf1255a33..648f278eea8f 100644
--- a/Documentation/powerpc/papr_hcalls.rst
+++ b/Documentation/powerpc/papr_hcalls.rst
@@ -275,6 +275,20 @@ Health Bitmap Flags:
 Given a DRC Index collect the performance statistics for NVDIMM and copy them
 to the resultBuffer.
 
+**H_SCM_FLUSH**
+
+| Input: *drcIndex, continue-token*
+| Out: *continue-token*
+| Return Value: *H_SUCCESS, H_Parameter, H_P2, H_BUSY*
+
+Given a DRC Index Flush the data to backend NVDIMM device.
+
+The hcall returns H_BUSY when the flush takes longer time and the hcall needs
+to be issued multiple times in order to be completely serviced. The
+*continue-token* from the output to be passed in the argument list of
+subsequent hcalls to the hypervisor until the hcall is completely serviced
+at which point H_SUCCESS or other error is returned by the hypervisor.
+
 References
 ==========
 .. [1] "Power Architecture Platform Reference"
diff --git a/arch/powerpc/include/asm/hvcall.h b/arch/powerpc/include/asm/hvcall.h
index ed6086d57b22..9f7729a97ebd 100644
--- a/arch/powerpc/include/asm/hvcall.h
+++ b/arch/powerpc/include/asm/hvcall.h
@@ -315,7 +315,8 @@
 #define H_SCM_HEALTH            0x400
 #define H_SCM_PERFORMANCE_STATS 0x418
 #define H_RPT_INVALIDATE	0x448
-#define MAX_HCALL_OPCODE	H_RPT_INVALIDATE
+#define H_SCM_FLUSH		0x44C
+#define MAX_HCALL_OPCODE	H_SCM_FLUSH
 
 /* Scope args for H_SCM_UNBIND_ALL */
 #define H_UNBIND_SCOPE_ALL (0x1)
diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
index 835163f54244..f0407e135410 100644
--- a/arch/powerpc/platforms/pseries/papr_scm.c
+++ b/arch/powerpc/platforms/pseries/papr_scm.c
@@ -93,6 +93,7 @@ struct papr_scm_priv {
 	uint64_t block_size;
 	int metadata_size;
 	bool is_volatile;
+	bool hcall_flush_required;
 
 	uint64_t bound_addr;
 
@@ -117,6 +118,38 @@ struct papr_scm_priv {
 	size_t stat_buffer_len;
 };
 
+static int papr_scm_pmem_flush(struct nd_region *nd_region,
+			       struct bio *bio __maybe_unused)
+{
+	struct papr_scm_priv *p = nd_region_provider_data(nd_region);
+	unsigned long ret_buf[PLPAR_HCALL_BUFSIZE];
+	uint64_t token = 0;
+	int64_t rc;
+
+	do {
+		rc = plpar_hcall(H_SCM_FLUSH, ret_buf, p->drc_index, token);
+		token = ret_buf[0];
+
+		/* Check if we are stalled for some time */
+		if (H_IS_LONG_BUSY(rc)) {
+			msleep(get_longbusy_msecs(rc));
+			rc = H_BUSY;
+		} else if (rc == H_BUSY) {
+			cond_resched();
+		}
+
+	} while (rc == H_BUSY);
+
+	if (rc) {
+		dev_err(&p->pdev->dev, "flush error: %lld", rc);
+		rc = -EIO;
+	} else {
+		dev_dbg(&p->pdev->dev, "flush drc 0x%x complete", p->drc_index);
+	}
+
+	return rc;
+}
+
 static LIST_HEAD(papr_nd_regions);
 static DEFINE_MUTEX(papr_ndr_lock);
 
@@ -943,6 +976,11 @@ static int papr_scm_nvdimm_init(struct papr_scm_priv *p)
 	ndr_desc.num_mappings = 1;
 	ndr_desc.nd_set = &p->nd_set;
 
+	if (p->hcall_flush_required) {
+		set_bit(ND_REGION_ASYNC, &ndr_desc.flags);
+		ndr_desc.flush = papr_scm_pmem_flush;
+	}
+
 	if (p->is_volatile)
 		p->region = nvdimm_volatile_region_create(p->bus, &ndr_desc);
 	else {
@@ -1088,6 +1126,7 @@ static int papr_scm_probe(struct platform_device *pdev)
 	p->block_size = block_size;
 	p->blocks = blocks;
 	p->is_volatile = !of_property_read_bool(dn, "ibm,cache-flush-required");
+	p->hcall_flush_required = of_property_read_bool(dn, "ibm,hcall-flush-required");
 
 	/* We just need to ensure that set cookies are unique across */
 	uuid_parse(uuid_str, (uuid_t *) uuid);


