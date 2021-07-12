Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0FA3C4621
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jul 2021 10:49:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GNcry6ZQPz3bVT
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jul 2021 18:49:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cMw3V2lc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=cMw3V2lc; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GNcrS3MW4z3002
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jul 2021 18:49:11 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16C8Xn3C112987; Mon, 12 Jul 2021 04:48:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=hhaFh1bdiVXfa0mbzwOPOB1EtpdGUT9yWlIQEVGNJWo=;
 b=cMw3V2lcCiEA6v0CmcfT0+W4mC2VXdaHrsTs85yCWLmPQrKwInQcEOFieX2ONhFoDt1R
 7+TTt8ewpAi51anwftY4icJmT+XRPwZiEFpI3b04wU3RFkY+fm/8jl9lOL64DdZfCPJp
 4xDN1Kgi/wzn/Hw4heTVDTXSfIAN9XI7DGaW4rr0AhSPPVz57GCBkf2lnZ02VEyyVLOO
 g5k5Rtp6s1tNXipo9Pd17TuvlQ/ozSosSO/+mdsEeoEjzgyrQhLQOYAOnoTGRk5ap/2U
 Mcmwc0RY2sjmuM4imiPGUOXGxyYc4cohhQKuEystooEwIjJE0qf/wAqwaQI1Jtc60ZYz WA== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39qrhyk0y0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Jul 2021 04:48:55 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16C8iVsH025238;
 Mon, 12 Jul 2021 08:48:53 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06ams.nl.ibm.com with ESMTP id 39q2th8nsy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Jul 2021 08:48:53 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 16C8kixN29360434
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Jul 2021 08:46:45 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2617FA4070;
 Mon, 12 Jul 2021 08:48:50 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 32EDEA40A3;
 Mon, 12 Jul 2021 08:48:47 +0000 (GMT)
Received: from vajain21.in.ibm.com (unknown [9.85.98.133])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 12 Jul 2021 08:48:46 +0000 (GMT)
Received: by vajain21.in.ibm.com (sSMTP sendmail emulation);
 Mon, 12 Jul 2021 14:18:46 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: linux-nvdimm@lists.01.org, nvdimm@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/papr_scm: Implement initial support for injecting
 smart errors
Date: Mon, 12 Jul 2021 14:18:19 +0530
Message-Id: <20210712084819.1150350-1-vaibhav@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: veuxCgwDcfy7YcJ1T5-KJ2GqmqVVhbnS
X-Proofpoint-GUID: veuxCgwDcfy7YcJ1T5-KJ2GqmqVVhbnS
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-12_04:2021-07-12,
 2021-07-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=999 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0
 bulkscore=0 impostorscore=0 mlxscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107120067
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
 Shivaprasad G Bhat <sbhat@linux.ibm.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Vaibhav Jain <vaibhav@linux.ibm.com>, Dan Williams <dan.j.williams@intel.com>,
 Ira Weiny <ira.weiny@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Presently PAPR doesn't support injecting smart errors on an
NVDIMM. This makes testing the NVDIMM health reporting functionality
difficult as simulating NVDIMM health related events need a hacked up
qemu version.

To solve this problem this patch proposes simulating certain set of
NVDIMM health related events in papr_scm. Specifically 'fatal' health
state and 'dirty' shutdown state. These error can be injected via the
user-space 'ndctl-inject-smart(1)' command. With the proposed patch and
corresponding ndctl patches following command flow is expected:

$ sudo ndctl list -DH -d nmem0
...
      "health_state":"ok",
      "shutdown_state":"clean",
...
 # inject unsafe shutdown and fatal health error
$ sudo ndctl inject-smart nmem0 -Uf
...
      "health_state":"fatal",
      "shutdown_state":"dirty",
...
 # uninject all errors
$ sudo ndctl inject-smart nmem0 -N
...
      "health_state":"ok",
      "shutdown_state":"clean",
...

The patch adds two members 'health_bitmap_mask' and
'health_bitmap_override' inside struct papr_scm_priv which are then
bit blt'ed[1] to the health bitmaps fetched from the hypervisor. In case
we are not able to fetch health information from the hypervisor we
service the health bitmap from these two members. These members are
accessible from sysfs at nmemX/papr/health_bitmap_override

A new PDSM named 'SMART_INJECT' is proposed that accepts newly
introduced 'struct nd_papr_pdsm_smart_inject' as payload thats
exchanged between libndctl and papr_scm to indicate the requested
smart-error states.

When the processing the PDSM 'SMART_INJECT', papr_pdsm_smart_inject()
constructs a pair or 'mask' and 'override' bitmaps from the payload
and bit-blt it to the 'health_bitmap_{mask, override}' members. This
ensures the after being fetched from the hypervisor, the health_bitmap
reflects requested smart-error states.

The patch is based on [2] "powerpc/papr_scm: Move duplicate
definitions to common header files".

[1] : https://en.wikipedia.org/wiki/Bit_blit
[2] :
https://lore.kernel.org/nvdimm/162505488483.72147.12741153746322191381.stgit@56e104a48989

Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/papr_scm.c | 94 ++++++++++++++++++++++-
 include/uapi/linux/papr_pdsm.h            | 18 +++++
 2 files changed, 109 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
index 0c56db5a1427..b7437c61a270 100644
--- a/arch/powerpc/platforms/pseries/papr_scm.c
+++ b/arch/powerpc/platforms/pseries/papr_scm.c
@@ -29,6 +29,10 @@
 	 (1ul << ND_CMD_SET_CONFIG_DATA) | \
 	 (1ul << ND_CMD_CALL))
 
+/* Use bitblt method to override specific bits in the '_bitmap_' */
+#define BITBLT_BITMAP(_bitmap_, _mask_, _override_)		\
+	(((_bitmap_) & ~(_mask_)) | ((_mask_) & (_override_)))
+
 /* Struct holding a single performance metric */
 struct papr_scm_perf_stat {
 	u8 stat_id[8];
@@ -81,6 +85,12 @@ struct papr_scm_priv {
 
 	/* length of the stat buffer as expected by phyp */
 	size_t stat_buffer_len;
+
+	/* The bits which needs to be overridden */
+	u64 health_bitmap_mask;
+
+	/* The overridden values for the bits having the masks set */
+	u64 health_bitmap_override;
 };
 
 static int papr_scm_pmem_flush(struct nd_region *nd_region,
@@ -308,19 +318,28 @@ static ssize_t drc_pmem_query_stats(struct papr_scm_priv *p,
 static int __drc_pmem_query_health(struct papr_scm_priv *p)
 {
 	unsigned long ret[PLPAR_HCALL_BUFSIZE];
+	u64 bitmap = 0;
 	long rc;
 
 	/* issue the hcall */
 	rc = plpar_hcall(H_SCM_HEALTH, ret, p->drc_index);
-	if (rc != H_SUCCESS) {
+	if (rc == H_SUCCESS)
+		bitmap = ret[0] & ret[1];
+	else if (rc == H_FUNCTION)
+		dev_info_once(&p->pdev->dev,
+			      "Hcall H_SCM_HEALTH not implemented, assuming empty health bitmap");
+	else {
+
 		dev_err(&p->pdev->dev,
 			"Failed to query health information, Err:%ld\n", rc);
 		return -ENXIO;
 	}
 
 	p->lasthealth_jiffies = jiffies;
-	p->health_bitmap = ret[0] & ret[1];
-
+	/* Allow overriding specific health bits via bit blt. */
+	bitmap = BITBLT_BITMAP(bitmap, p->health_bitmap_mask,
+			       p->health_bitmap_override);
+	WRITE_ONCE(p->health_bitmap, bitmap);
 	dev_dbg(&p->pdev->dev,
 		"Queried dimm health info. Bitmap:0x%016lx Mask:0x%016lx\n",
 		ret[0], ret[1]);
@@ -630,6 +649,54 @@ static int papr_pdsm_health(struct papr_scm_priv *p,
 	return rc;
 }
 
+/* Inject a smart error Add the dirty-shutdown-counter value to the pdsm */
+static int papr_pdsm_smart_inject(struct papr_scm_priv *p,
+				  union nd_pdsm_payload *payload)
+{
+	int rc;
+	u32 supported_flags = 0;
+	u64 mask = 0, override = 0;
+
+	/* Check for individual smart error flags and update mask and override */
+	if (payload->smart_inject.flags & PDSM_SMART_INJECT_HEALTH_FATAL) {
+		supported_flags |= PDSM_SMART_INJECT_HEALTH_FATAL;
+		mask |= PAPR_PMEM_HEALTH_FATAL;
+		override |= payload->smart_inject.fatal_enable ?
+			PAPR_PMEM_HEALTH_FATAL : 0;
+	}
+
+	if (payload->smart_inject.flags & PDSM_SMART_INJECT_BAD_SHUTDOWN) {
+		supported_flags |= PDSM_SMART_INJECT_BAD_SHUTDOWN;
+		mask |= PAPR_PMEM_SHUTDOWN_DIRTY;
+		override |= payload->smart_inject.unsafe_shutdown_enable ?
+			PAPR_PMEM_SHUTDOWN_DIRTY : 0;
+	}
+
+	dev_dbg(&p->pdev->dev, "[Smart-inject] Mask=%#llx override=%#llx\n",
+		mask, override);
+
+	/* Prevent concurrent access to dimm health bitmap related members */
+	rc = mutex_lock_interruptible(&p->health_mutex);
+	if (rc)
+		return rc;
+
+	/* Bitblt mask/override to corrosponding health_bitmap couterparts */
+	p->health_bitmap_mask = BITBLT_BITMAP(p->health_bitmap_mask,
+					      mask, override);
+	p->health_bitmap_override = BITBLT_BITMAP(p->health_bitmap_override,
+						  mask, override);
+
+	/* Invalidate cached health bitmap */
+	p->lasthealth_jiffies = 0;
+
+	mutex_unlock(&p->health_mutex);
+
+	/* Return the supported flags back to userspace */
+	payload->smart_inject.flags = supported_flags;
+
+	return sizeof(struct nd_papr_pdsm_health);
+}
+
 /*
  * 'struct pdsm_cmd_desc'
  * Identifies supported PDSMs' expected length of in/out payloads
@@ -663,6 +730,12 @@ static const struct pdsm_cmd_desc __pdsm_cmd_descriptors[] = {
 		.size_out = sizeof(struct nd_papr_pdsm_health),
 		.service = papr_pdsm_health,
 	},
+
+	[PAPR_PDSM_SMART_INJECT] = {
+		.size_in = sizeof(struct nd_papr_pdsm_smart_inject),
+		.size_out = sizeof(struct nd_papr_pdsm_smart_inject),
+		.service = papr_pdsm_smart_inject,
+	},
 	/* Empty */
 	[PAPR_PDSM_MAX] = {
 		.size_in = 0,
@@ -799,6 +872,20 @@ static int papr_scm_ndctl(struct nvdimm_bus_descriptor *nd_desc,
 	return 0;
 }
 
+static ssize_t health_bitmap_override_show(struct device *dev,
+					   struct device_attribute *attr,
+					   char *buf)
+{
+	struct nvdimm *dimm = to_nvdimm(dev);
+	struct papr_scm_priv *p = nvdimm_provider_data(dimm);
+
+	return sprintf(buf, "mask=%#llx override=%#llx\n",
+		       READ_ONCE(p->health_bitmap_mask),
+		       READ_ONCE(p->health_bitmap_override));
+}
+
+static DEVICE_ATTR_ADMIN_RO(health_bitmap_override);
+
 static ssize_t perf_stats_show(struct device *dev,
 			       struct device_attribute *attr, char *buf)
 {
@@ -913,6 +1000,7 @@ static struct attribute *papr_nd_attributes[] = {
 	&dev_attr_flags.attr,
 	&dev_attr_perf_stats.attr,
 	&dev_attr_dirty_shutdown.attr,
+	&dev_attr_health_bitmap_override.attr,
 	NULL,
 };
 
diff --git a/include/uapi/linux/papr_pdsm.h b/include/uapi/linux/papr_pdsm.h
index 1ef46fe8d905..14ec90912460 100644
--- a/include/uapi/linux/papr_pdsm.h
+++ b/include/uapi/linux/papr_pdsm.h
@@ -116,6 +116,22 @@ struct nd_papr_pdsm_health {
 	};
 };
 
+/* Flags for injecting specific smart errors */
+#define PDSM_SMART_INJECT_HEALTH_FATAL		(1 << 0)
+#define PDSM_SMART_INJECT_BAD_SHUTDOWN		(1 << 1)
+
+struct nd_papr_pdsm_smart_inject {
+	union {
+		struct {
+			/* One or more of PDSM_SMART_INJECT_ */
+			__u32 flags;
+			__u8 fatal_enable;
+			__u8 unsafe_shutdown_enable;
+		};
+		__u8 buf[ND_PDSM_PAYLOAD_MAX_SIZE];
+	};
+} __packed;
+
 /*
  * Methods to be embedded in ND_CMD_CALL request. These are sent to the kernel
  * via 'nd_cmd_pkg.nd_command' member of the ioctl struct
@@ -123,12 +139,14 @@ struct nd_papr_pdsm_health {
 enum papr_pdsm {
 	PAPR_PDSM_MIN = 0x0,
 	PAPR_PDSM_HEALTH,
+	PAPR_PDSM_SMART_INJECT,
 	PAPR_PDSM_MAX,
 };
 
 /* Maximal union that can hold all possible payload types */
 union nd_pdsm_payload {
 	struct nd_papr_pdsm_health health;
+	struct nd_papr_pdsm_smart_inject smart_inject;
 	__u8 buf[ND_PDSM_PAYLOAD_MAX_SIZE];
 } __packed;
 
-- 
2.31.1

