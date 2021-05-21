Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F7B38C574
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 13:11:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmkST5GXgz3091
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 21:11:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SRpiI4jH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=SRpiI4jH; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmkRx0hlFz302G
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 May 2021 21:10:52 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14LB4IJL116803; Fri, 21 May 2021 07:10:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=hWT09L9ljNy4yORz3gVXW0/71Ki9gDCCpOc9kh8bEeU=;
 b=SRpiI4jHI+Z7jXDFIflaxN2rWIgAzX+9Makc6yovQTl2OcvTRLdZl2y1bnZQdbYIfS4h
 BFvfHpvGPDqvz2MPw95P8qaV615PVTj8KyHFryCPjua/Y4hKEVkcdPRfBVoJUCsh/74z
 Rl6aiuAq8Ia0MZfpi9bK5SHa8DshyzpArox0NrYWIB9U+ZcVIEtSzdRfYK1pCMO1FjNU
 LIVunLW3nU2fVyFvNpC4gqAz3UljyjgErpHIXBXbvp5fSNaYIKnMJ4/Z3LBK3c3l4U0P
 gzRbY+brne2ZE8dDB0FD1K9qzby466yB8SechamcM7EEfrSBcmrDf2G6NJMvtJbeZIZE dA== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38pb21141m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 07:10:34 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14LB8Odi025900;
 Fri, 21 May 2021 11:10:32 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 38j5x7u3th-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 11:10:32 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 14LBA0Dm31392058
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 May 2021 11:10:00 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1345911C054;
 Fri, 21 May 2021 11:10:29 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6842711C04A;
 Fri, 21 May 2021 11:10:26 +0000 (GMT)
Received: from vajain21.in.ibm.com (unknown [9.102.3.140])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 21 May 2021 11:10:26 +0000 (GMT)
Received: by vajain21.in.ibm.com (sSMTP sendmail emulation);
 Fri, 21 May 2021 16:40:25 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: nvdimm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/papr_scm: Add support for reporting
 dirty-shutdown-count
Date: Fri, 21 May 2021 16:40:23 +0530
Message-Id: <20210521111023.413732-1-vaibhav@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: y_8j6DILhaXMkoDtjVEIzK7urMLy_z7C
X-Proofpoint-GUID: y_8j6DILhaXMkoDtjVEIzK7urMLy_z7C
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-21_04:2021-05-20,
 2021-05-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 mlxscore=0
 mlxlogscore=999 bulkscore=0 phishscore=0 malwarescore=0 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105210069
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
Cc: Santosh Sivaraj <santosh@fossix.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Vaibhav Jain <vaibhav@linux.ibm.com>, Dan Williams <dan.j.williams@intel.com>,
 Ira Weiny <ira.weiny@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Persistent memory devices like NVDIMMs can loose cached writes in case
something prevents flush on power-fail. Such situations are termed as
dirty shutdown and are exposed to applications as
last-shutdown-state (LSS) flag and a dirty-shutdown-counter(DSC) as
described at [1]. The latter being useful in conditions where multiple
applications want to detect a dirty shutdown event without racing with
one another.

PAPR-NVDIMMs have so far only exposed LSS style flags to indicate a
dirty-shutdown-state. This patch further adds support for DSC via the
"ibm,persistence-failed-count" device tree property of an NVDIMM. This
property is a monotonic increasing 64-bit counter thats an indication
of number of times an NVDIMM has encountered a dirty-shutdown event
causing persistence loss.

Since this value is not expected to change after system-boot hence
papr_scm reads & caches its value during NVDIMM probe and exposes it
as a PAPR sysfs attributed named 'dirty_shutdown' to match the name of
similarly named NFIT sysfs attribute. Also this value is available to
libnvdimm via PAPR_PDSM_HEALTH payload. 'struct nd_papr_pdsm_health'
has been extended to add a new member called 'dimm_dsc' presence of
which is indicated by the newly introduced PDSM_DIMM_DSC_VALID flag.

References:
[1] https://pmem.io/documents/Dirty_Shutdown_Handling-V1.0.pdf

Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
---
 arch/powerpc/include/uapi/asm/papr_pdsm.h |  6 +++++
 arch/powerpc/platforms/pseries/papr_scm.c | 30 +++++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/arch/powerpc/include/uapi/asm/papr_pdsm.h b/arch/powerpc/include/uapi/asm/papr_pdsm.h
index 50ef95e2f5b1..82488b1e7276 100644
--- a/arch/powerpc/include/uapi/asm/papr_pdsm.h
+++ b/arch/powerpc/include/uapi/asm/papr_pdsm.h
@@ -77,6 +77,9 @@
 /* Indicate that the 'dimm_fuel_gauge' field is valid */
 #define PDSM_DIMM_HEALTH_RUN_GAUGE_VALID 1
 
+/* Indicate that the 'dimm_dsc' field is valid */
+#define PDSM_DIMM_DSC_VALID 2
+
 /*
  * Struct exchanged between kernel & ndctl in for PAPR_PDSM_HEALTH
  * Various flags indicate the health status of the dimm.
@@ -105,6 +108,9 @@ struct nd_papr_pdsm_health {
 
 			/* Extension flag PDSM_DIMM_HEALTH_RUN_GAUGE_VALID */
 			__u16 dimm_fuel_gauge;
+
+			/* Extension flag PDSM_DIMM_DSC_VALID */
+			__u64 dimm_dsc;
 		};
 		__u8 buf[ND_PDSM_PAYLOAD_MAX_SIZE];
 	};
diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
index 11e7b90a3360..68f0d3d5e899 100644
--- a/arch/powerpc/platforms/pseries/papr_scm.c
+++ b/arch/powerpc/platforms/pseries/papr_scm.c
@@ -114,6 +114,9 @@ struct papr_scm_priv {
 	/* Health information for the dimm */
 	u64 health_bitmap;
 
+	/* Holds the last known dirty shutdown counter value */
+	u64 dirty_shutdown_counter;
+
 	/* length of the stat buffer as expected by phyp */
 	size_t stat_buffer_len;
 };
@@ -603,6 +606,16 @@ static int papr_pdsm_fuel_gauge(struct papr_scm_priv *p,
 	return rc;
 }
 
+/* Add the dirty-shutdown-counter value to the pdsm */
+static int papr_psdm_dsc(struct papr_scm_priv *p,
+			 union nd_pdsm_payload *payload)
+{
+	payload->health.extension_flags |= PDSM_DIMM_DSC_VALID;
+	payload->health.dimm_dsc = p->dirty_shutdown_counter;
+
+	return sizeof(struct nd_papr_pdsm_health);
+}
+
 /* Fetch the DIMM health info and populate it in provided package. */
 static int papr_pdsm_health(struct papr_scm_priv *p,
 			    union nd_pdsm_payload *payload)
@@ -646,6 +659,8 @@ static int papr_pdsm_health(struct papr_scm_priv *p,
 
 	/* Populate the fuel gauge meter in the payload */
 	papr_pdsm_fuel_gauge(p, payload);
+	/* Populate the dirty-shutdown-counter field */
+	papr_psdm_dsc(p, payload);
 
 	rc = sizeof(struct nd_papr_pdsm_health);
 
@@ -907,6 +922,16 @@ static ssize_t flags_show(struct device *dev,
 }
 DEVICE_ATTR_RO(flags);
 
+static ssize_t dirty_shutdown_show(struct device *dev,
+			  struct device_attribute *attr, char *buf)
+{
+	struct nvdimm *dimm = to_nvdimm(dev);
+	struct papr_scm_priv *p = nvdimm_provider_data(dimm);
+
+	return sysfs_emit(buf, "%llu\n", p->dirty_shutdown_counter);
+}
+DEVICE_ATTR_RO(dirty_shutdown);
+
 static umode_t papr_nd_attribute_visible(struct kobject *kobj,
 					 struct attribute *attr, int n)
 {
@@ -925,6 +950,7 @@ static umode_t papr_nd_attribute_visible(struct kobject *kobj,
 static struct attribute *papr_nd_attributes[] = {
 	&dev_attr_flags.attr,
 	&dev_attr_perf_stats.attr,
+	&dev_attr_dirty_shutdown.attr,
 	NULL,
 };
 
@@ -1149,6 +1175,10 @@ static int papr_scm_probe(struct platform_device *pdev)
 	p->is_volatile = !of_property_read_bool(dn, "ibm,cache-flush-required");
 	p->hcall_flush_required = of_property_read_bool(dn, "ibm,hcall-flush-required");
 
+	if (of_property_read_u64(dn, "ibm,persistence-failed-count",
+				 &p->dirty_shutdown_counter))
+		p->dirty_shutdown_counter = 0;
+
 	/* We just need to ensure that set cookies are unique across */
 	uuid_parse(uuid_str, (uuid_t *) uuid);
 	/*
-- 
2.31.1

