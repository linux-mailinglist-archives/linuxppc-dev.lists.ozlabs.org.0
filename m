Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 466962CA2A3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 13:26:28 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ClhCz0zdTzDqpv
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 23:26:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sbhat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=X2Vi2Fy4; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Clh3P0D0ZzDqpK
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Dec 2020 23:18:55 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B1C42NB187405; Tue, 1 Dec 2020 07:18:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to : cc
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=WldaJ6r7cz1uGhPcT+6RdE+DzhSCbQJDfLs4Sx4eDQw=;
 b=X2Vi2Fy4aM1eIz4SPNPUF1jhpxOtmInIuYFAQrjAzrHlzZBPvThAzlkZvfaSMNz3I+3f
 ve/Fbyq8irliUG0Ohv0jxszWbQKxp8IajK1TMmKexwByGqTR7BP+d1ZU3+c/LjN0fkV+
 f5AWpSZ9YpmYw2thuwsQlMLeLPDYLb173HHD9HyWFBvznHuJfF9ff3k1b9sN7LTITuId
 cdX2ZXeg3ubRZdYfv4VRs5MZ0TakRlCx8HWPDN9zSWCL5Qw32XKtV5ugJ7pWJIAqNbAh
 VXj8BZ1951gOiclM9MClEks0YG2Nk7BYOoG5HQA0V8Lk1+lfADLz5CYs0u+4Zdrje6OA kA== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 355jaaxeje-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Dec 2020 07:18:51 -0500
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B1CDg82004709;
 Tue, 1 Dec 2020 12:18:49 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 353e6833yc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Dec 2020 12:18:49 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B1CIi6B4981502
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Dec 2020 12:18:44 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A71B511C04C;
 Tue,  1 Dec 2020 12:18:44 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DF41811C052;
 Tue,  1 Dec 2020 12:18:43 +0000 (GMT)
Received: from lep8c.aus.stglabs.ibm.com (unknown [9.40.192.207])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  1 Dec 2020 12:18:43 +0000 (GMT)
Subject: [RFC PATCH] powerpc/papr_scm: Implement scm async flush
From: Shivaprasad G Bhat <sbhat@linux.ibm.com>
To: ellerman@au1.ibm.com
Date: Tue, 01 Dec 2020 06:18:43 -0600
Message-ID: <160682501436.2579014.14501834468510806255.stgit@lep8c.aus.stglabs.ibm.com>
User-Agent: StGit/0.19
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-01_04:2020-11-30,
 2020-12-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=999 clxscore=1015 adultscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 mlxscore=0 malwarescore=0 bulkscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012010079
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
Cc: aneesh.kumar@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 kvm-ppc@vger.kernel.org, linux-nvdimm@lists.01.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Tha patch implements SCM async-flush hcall and sets the
ND_REGION_ASYNC capability when the platform device tree
has "ibm,async-flush-required" set.

The below demonstration shows the map_sync behavior when
ibm,async-flush-required is present in device tree.
(https://github.com/avocado-framework-tests/avocado-misc-tests/blob/master/memory/ndctl.py.data/map_sync.c)

The pmem0 is from nvdimm without async-flush-required,
and pmem1 is from nvdimm with async-flush-required, mounted as
/dev/pmem0 on /mnt1 type xfs (rw,relatime,attr2,dax=always,inode64,logbufs=8,logbsize=32k,noquota)
/dev/pmem1 on /mnt2 type xfs (rw,relatime,attr2,dax=always,inode64,logbufs=8,logbsize=32k,noquota)

#./mapsync /mnt1/newfile    ----> Without async-flush-required
#./mapsync /mnt2/newfile    ----> With async-flush-required
Failed to mmap  with Operation not supported

Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
---
The HCALL semantics are in review, not final.

 Documentation/powerpc/papr_hcalls.rst     |   14 ++++++++++
 arch/powerpc/include/asm/hvcall.h         |    3 +-
 arch/powerpc/platforms/pseries/papr_scm.c |   39 +++++++++++++++++++++++++++++
 3 files changed, 55 insertions(+), 1 deletion(-)

diff --git a/Documentation/powerpc/papr_hcalls.rst b/Documentation/powerpc/papr_hcalls.rst
index 48fcf1255a33..cc310814f24c 100644
--- a/Documentation/powerpc/papr_hcalls.rst
+++ b/Documentation/powerpc/papr_hcalls.rst
@@ -275,6 +275,20 @@ Health Bitmap Flags:
 Given a DRC Index collect the performance statistics for NVDIMM and copy them
 to the resultBuffer.
 
+**H_SCM_ASYNC_FLUSH**
+
+| Input: *drcIndex*
+| Out: *continue-token*
+| Return Value: *H_SUCCESS, H_Parameter, H_P2, H_BUSY*
+
+Given a DRC Index Flush the data to backend NVDIMM device.
+
+The hcall returns H_BUSY when the flush takes longer time and the hcall needs
+to be issued multiple times in order to be completely serviced. The
+*continue-token* from the output to be passed in the argument list in
+subsequent hcalls to the hypervisor until the hcall is completely serviced
+at which point H_SUCCESS is returned by the hypervisor.
+
 References
 ==========
 .. [1] "Power Architecture Platform Reference"
diff --git a/arch/powerpc/include/asm/hvcall.h b/arch/powerpc/include/asm/hvcall.h
index c1fbccb04390..4a13074bc782 100644
--- a/arch/powerpc/include/asm/hvcall.h
+++ b/arch/powerpc/include/asm/hvcall.h
@@ -306,7 +306,8 @@
 #define H_SCM_HEALTH            0x400
 #define H_SCM_PERFORMANCE_STATS 0x418
 #define H_RPT_INVALIDATE	0x448
-#define MAX_HCALL_OPCODE	H_RPT_INVALIDATE
+#define H_SCM_ASYNC_FLUSH	0x4A0
+#define MAX_HCALL_OPCODE	H_SCM_ASYNC_FLUSH
 
 /* Scope args for H_SCM_UNBIND_ALL */
 #define H_UNBIND_SCOPE_ALL (0x1)
diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
index 835163f54244..1f8c5153cb3d 100644
--- a/arch/powerpc/platforms/pseries/papr_scm.c
+++ b/arch/powerpc/platforms/pseries/papr_scm.c
@@ -93,6 +93,7 @@ struct papr_scm_priv {
 	uint64_t block_size;
 	int metadata_size;
 	bool is_volatile;
+	bool async_flush_required;
 
 	uint64_t bound_addr;
 
@@ -117,6 +118,38 @@ struct papr_scm_priv {
 	size_t stat_buffer_len;
 };
 
+static int papr_scm_pmem_flush(struct nd_region *nd_region, struct bio *bio)
+{
+	unsigned long ret[PLPAR_HCALL_BUFSIZE];
+	struct papr_scm_priv *p = nd_region_provider_data(nd_region);
+	int64_t rc;
+	uint64_t token = 0;
+
+	do {
+		rc = plpar_hcall(H_SCM_ASYNC_FLUSH, ret, p->drc_index, token);
+
+		/* Check if we are stalled for some time */
+		token = ret[0];
+		if (H_IS_LONG_BUSY(rc)) {
+			msleep(get_longbusy_msecs(rc));
+			rc = H_BUSY;
+		} else if (rc == H_BUSY) {
+			cond_resched();
+		}
+
+	} while (rc == H_BUSY);
+
+	if (rc)
+		dev_err(&p->pdev->dev, "flush error: %lld\n", rc);
+	else
+		dev_dbg(&p->pdev->dev, "flush drc 0x%x complete\n",
+			p->drc_index);
+
+	dev_dbg(&p->pdev->dev, "Flush call complete\n");
+
+	return rc;
+}
+
 static LIST_HEAD(papr_nd_regions);
 static DEFINE_MUTEX(papr_ndr_lock);
 
@@ -943,6 +976,11 @@ static int papr_scm_nvdimm_init(struct papr_scm_priv *p)
 	ndr_desc.num_mappings = 1;
 	ndr_desc.nd_set = &p->nd_set;
 
+	if (p->async_flush_required) {
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
+	p->async_flush_required = of_property_read_bool(dn, "ibm,async-flush-required");
 
 	/* We just need to ensure that set cookies are unique across */
 	uuid_parse(uuid_str, (uuid_t *) uuid);


