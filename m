Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B6B2AAD9C
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Nov 2020 22:17:59 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CTn5v5H4NzDqjX
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Nov 2020 08:17:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=laYinAt4; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CTn3y3rTVzDqh3
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Nov 2020 08:16:14 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A8L1eCt086646; Sun, 8 Nov 2020 16:16:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=gIkrjQ6tArcB431xvOWmyzSECk+X6fCJ1oyR7svE9Wk=;
 b=laYinAt4HYbSq1xyMaGX+iEsdP6Tybfsdme7fDf7WCQ1lq4H7DwEwwlfo3jy4ynXMQbB
 9cYPTWAA5Wk7ZFIq6xGG3cyA6BySSpg3KI9uaBZD7iVRdqSU0ArjD9d91E7hoVxtO0qg
 DqJEgtRVuTVBykJ5mM1jnC41Is+OHn4yXFlta69++3OwtCgsbR/2fP4pNZNGWkM9nZkC
 1hjv1PKFBg02CqGtb2E5icXtHG8IoNar1yX9C7wnJwIgAxgaWkMp4t4BAqasItxactS1
 VJRnhO61xXuwzK6pH6DHd/WIu2NSjjSPQ35veDUx1+nfEZbmxqEIpAmCSnTYIAhodvQp tQ== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34nqs3anh3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 08 Nov 2020 16:16:02 -0500
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0A8LCKHa026033;
 Sun, 8 Nov 2020 21:16:00 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 34nk78hb6u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 08 Nov 2020 21:16:00 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0A8LFvEP2032336
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 8 Nov 2020 21:15:57 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 981E45204F;
 Sun,  8 Nov 2020 21:15:57 +0000 (GMT)
Received: from vajain21.in.ibm.com (unknown [9.199.47.5])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id C8FB152051;
 Sun,  8 Nov 2020 21:15:53 +0000 (GMT)
Received: by vajain21.in.ibm.com (sSMTP sendmail emulation);
 Mon, 09 Nov 2020 02:45:52 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-nvdimm@lists.01.org
Subject: [RFC][PATCH 1/2] libnvdimm: Introduce ND_CMD_GET_STAT to retrieve
 nvdimm statistics
Date: Mon,  9 Nov 2020 02:45:48 +0530
Message-Id: <20201108211549.122018-1-vaibhav@linux.ibm.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-08_10:2020-11-05,
 2020-11-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 phishscore=0 clxscore=1011 suspectscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011080148
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

Implement support for exposing generic nvdimm statistics via newly
introduced dimm-command ND_CMD_GET_STAT that can be handled by nvdimm
command handler function and provide values for these statistics back
to libnvdimm. Following generic nvdimm statistics are defined as an
enumeration in 'uapi/ndctl.h':

* "media_reads" : Number of media reads that have occurred since reboot.
* "media_writes" : Number of media writes that have occurred since reboot.
* "read_requests" : Number of read requests that have occurred since reboot.
* "write_requests" : Number of write requests that have occurred since reboot.
* "total_media_reads" : Total number of media reads that have occurred.
* "total_media_writes" : Total number of media writes that have occurred.
* "total_read_requests" : Total number of read requests that have occurred.
* "total_write_requests" : Total number of write requests that have occurred.

Apart from ND_CMD_GET_STAT ioctl these nvdimm statistics are also
exposed via sysfs '<nvdimm-device>/stats' directory for easy user-space
access like below:

/sys/class/nd/ndctl0/device/nmem0/stats # tail -n +1 *
==> media_reads <==
252197707602
==> media_writes <==
20684685172
==> read_requests <==
658810924962
==> write_requests <==
404464081574

In case a specific nvdimm-statistic is not supported than nvdimm
command handler function can simply return an error (e.g -ENOENT) for
request to read that nvdimm-statistic.

The value for a specific nvdimm-stat is exchanged via newly introduced
'struct nd_cmd_get_dimm_stat' that hold a single statistics and a
union of possible values types. Presently only '__s64' type of generic
attributes are supported. These attributes are defined in
'ndvimm/dimm_devs.c' via a helper macro 'NVDIMM_STAT_ATTR'.

Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
---
 drivers/nvdimm/bus.c       |   6 ++
 drivers/nvdimm/dimm_devs.c | 109 +++++++++++++++++++++++++++++++++++++
 drivers/nvdimm/nd.h        |   5 ++
 include/uapi/linux/ndctl.h |  27 +++++++++
 4 files changed, 147 insertions(+)

diff --git a/drivers/nvdimm/bus.c b/drivers/nvdimm/bus.c
index 2304c6183822..d53564477437 100644
--- a/drivers/nvdimm/bus.c
+++ b/drivers/nvdimm/bus.c
@@ -794,6 +794,12 @@ static const struct nd_cmd_desc __nd_cmd_dimm_descs[] = {
 		.out_num = 1,
 		.out_sizes = { UINT_MAX, },
 	},
+	[ND_CMD_GET_STAT] = {
+		.in_num = 1,
+		.in_sizes = { sizeof(struct nd_cmd_get_dimm_stat), },
+		.out_num = 1,
+		.out_sizes = { sizeof(struct nd_cmd_get_dimm_stat), },
+	},
 };
 
 const struct nd_cmd_desc *nd_cmd_dimm_desc(int cmd)
diff --git a/drivers/nvdimm/dimm_devs.c b/drivers/nvdimm/dimm_devs.c
index b59032e0859b..68aaa294def7 100644
--- a/drivers/nvdimm/dimm_devs.c
+++ b/drivers/nvdimm/dimm_devs.c
@@ -555,6 +555,114 @@ static umode_t nvdimm_firmware_visible(struct kobject *kobj, struct attribute *a
 	return a->mode;
 }
 
+/* Request a dimm stat from the bus driver */
+static int __request_dimm_stat(struct nvdimm_bus *nvdimm_bus,
+			       struct nvdimm *dimm, u64 stat_id,
+			       s64 *stat_val)
+{
+	struct nvdimm_bus_descriptor *nd_desc = nvdimm_bus->nd_desc;
+	struct nd_cmd_get_dimm_stat stat = { .stat_id = stat_id };
+	int rc, cmd_rc;
+
+	if (!test_bit(ND_CMD_GET_STAT, &dimm->cmd_mask)) {
+		pr_debug("CMD_GET_STAT not set for bus driver 0x%lx\n",
+			 nd_desc->cmd_mask);
+		return -ENOENT;
+	}
+
+	/* Is stat requested is known & bus driver supports fetching stats */
+	if (stat_id <= ND_DIMM_STAT_INVALID || stat_id > ND_DIMM_STAT_MAX) {
+		WARN(1, "Unknown stat-id(%llu) requested", stat_id);
+		return -ENOENT;
+	}
+
+	/* Ask bus driver for its stat value */
+	rc = nd_desc->ndctl(nd_desc, dimm, ND_CMD_GET_STAT,
+			    &stat, sizeof(stat), &cmd_rc);
+	if (rc || cmd_rc) {
+		pr_debug("Unable to request stat %lld. Error (%d,%d)\n",
+			 stat_id, rc, cmd_rc);
+		return rc ? rc : cmd_rc;
+	}
+
+	/* Indicate error in case returned struct doesn't have the stat_id set */
+	if (stat.stat_id != stat_id) {
+		pr_debug("Invalid statid %llu returned\n", stat.stat_id);
+		return -ENOENT;
+	}
+
+	*stat_val = stat.int_val;
+	return 0;
+}
+
+static ssize_t nvdimm_stat_attr_show(struct device *dev,
+				     struct device_attribute *attr,
+				     char *buf)
+{
+	struct nvdimm_stat_attr *nattr = container_of(attr, typeof(*nattr), attr);
+	struct nvdimm_bus *nvdimm_bus = walk_to_nvdimm_bus(dev);
+	struct nvdimm *nvdimm = to_nvdimm(dev);
+	s64 stat_val;
+	int rc;
+
+	rc = __request_dimm_stat(nvdimm_bus, nvdimm, nattr->stat_id, &stat_val);
+
+	if (rc)
+		return rc;
+
+	return snprintf(buf, PAGE_SIZE, "%lld", stat_val);
+}
+
+static umode_t nvdimm_stats_visible(struct kobject *kobj, struct attribute *a, int n)
+{
+	struct nvdimm_stat_attr *nattr = container_of(a, typeof(*nattr), attr.attr);
+	struct device *dev = container_of(kobj, typeof(*dev), kobj);
+	struct nvdimm_bus *nvdimm_bus = walk_to_nvdimm_bus(dev);
+	struct nvdimm *nvdimm = to_nvdimm(dev);
+	u64 stat_val;
+	int rc;
+
+	/* request dimm stat from bus driver and is success mark attribute as visible */
+	rc = __request_dimm_stat(nvdimm_bus, nvdimm, nattr->stat_id, &stat_val);
+	if (rc)
+		pr_info("Unable to query stat %llu . Error(%d)\n", nattr->stat_id, rc);
+
+	return rc ? 0 : a->mode;
+}
+
+#define NVDIMM_STAT_ATTR(_name, _stat_id)				\
+	struct nvdimm_stat_attr nvdimm_stat_attr_##_name = {			\
+		.attr = __ATTR(_name, 0400, nvdimm_stat_attr_show, NULL), \
+		.stat_id = _stat_id,					\
+	}
+
+static NVDIMM_STAT_ATTR(media_reads, ND_DIMM_STAT_MEDIA_READS);
+static NVDIMM_STAT_ATTR(media_writes,	ND_DIMM_STAT_MEDIA_WRITES);
+static NVDIMM_STAT_ATTR(read_requests, ND_DIMM_STAT_READ_REQUESTS);
+static NVDIMM_STAT_ATTR(write_requests, ND_DIMM_STAT_WRITE_REQUESTS);
+static NVDIMM_STAT_ATTR(total_media_reads, ND_DIMM_STAT_TOTAL_MEDIA_READS);
+static NVDIMM_STAT_ATTR(total_media_writes, ND_DIMM_STAT_TOTAL_MEDIA_WRITES);
+static NVDIMM_STAT_ATTR(total_read_requests, ND_DIMM_STAT_TOTAL_READ_REQUESTS);
+static NVDIMM_STAT_ATTR(total_write_requests,	ND_DIMM_STAT_TOTAL_WRITE_REQUESTS);
+
+static struct attribute *nvdimm_stats_attributes[] = {
+	&nvdimm_stat_attr_media_reads.attr.attr,
+	&nvdimm_stat_attr_media_writes.attr.attr,
+	&nvdimm_stat_attr_read_requests.attr.attr,
+	&nvdimm_stat_attr_write_requests.attr.attr,
+	&nvdimm_stat_attr_total_media_reads.attr.attr,
+	&nvdimm_stat_attr_total_media_writes.attr.attr,
+	&nvdimm_stat_attr_total_read_requests.attr.attr,
+	&nvdimm_stat_attr_total_write_requests.attr.attr,
+	NULL,
+};
+
+static const struct attribute_group nvdimm_stats_group = {
+	.name = "stats",
+	.attrs = nvdimm_stats_attributes,
+	.is_visible = nvdimm_stats_visible,
+};
+
 static const struct attribute_group nvdimm_firmware_attribute_group = {
 	.name = "firmware",
 	.attrs = nvdimm_firmware_attributes,
@@ -565,6 +673,7 @@ static const struct attribute_group *nvdimm_attribute_groups[] = {
 	&nd_device_attribute_group,
 	&nvdimm_attribute_group,
 	&nvdimm_firmware_attribute_group,
+	&nvdimm_stats_group,
 	NULL,
 };
 
diff --git a/drivers/nvdimm/nd.h b/drivers/nvdimm/nd.h
index 696b55556d4d..ea9e846ae245 100644
--- a/drivers/nvdimm/nd.h
+++ b/drivers/nvdimm/nd.h
@@ -223,6 +223,11 @@ enum nd_async_mode {
 	ND_ASYNC,
 };
 
+struct nvdimm_stat_attr {
+	struct device_attribute attr;
+	u64 stat_id;
+};
+
 int nd_integrity_init(struct gendisk *disk, unsigned long meta_size);
 void wait_nvdimm_bus_probe_idle(struct device *dev);
 void nd_device_register(struct device *dev);
diff --git a/include/uapi/linux/ndctl.h b/include/uapi/linux/ndctl.h
index 8cf1e4884fd5..81b76986b423 100644
--- a/include/uapi/linux/ndctl.h
+++ b/include/uapi/linux/ndctl.h
@@ -97,6 +97,31 @@ struct nd_cmd_clear_error {
 	__u64 cleared;
 } __packed;
 
+/* Various generic dimm stats that can be reported */
+enum {
+	ND_DIMM_STAT_INVALID = 0,
+	ND_DIMM_STAT_MEDIA_READS = 1,  /* Media reads after power cycle */
+	ND_DIMM_STAT_MEDIA_WRITES = 2, /* Media writes after power cycle */
+	ND_DIMM_STAT_READ_REQUESTS = 3, /* Read requests after power cycle */
+	ND_DIMM_STAT_WRITE_REQUESTS = 4, /* Write requests after power cycle */
+	ND_DIMM_STAT_TOTAL_MEDIA_READS = 5, /* Total Media Reads */
+	ND_DIMM_STAT_TOTAL_MEDIA_WRITES = 6, /* Total Media Writes */
+	ND_DIMM_STAT_TOTAL_READ_REQUESTS = 7, /* Total Read Requests */
+	ND_DIMM_STAT_TOTAL_WRITE_REQUESTS = 8, /* Total Write  Requests */
+	ND_DIMM_STAT_MAX = 8,
+};
+
+struct nd_cmd_get_dimm_stat {
+	/* See enum above for valid values */
+	__u64 stat_id;
+
+	/* Holds a single dimm stat value */
+	union {
+		__s64 int_val;
+		char  str_val[120];
+	};
+} __packed;
+
 enum {
 	ND_CMD_IMPLEMENTED = 0,
 
@@ -117,6 +142,7 @@ enum {
 	ND_CMD_VENDOR_EFFECT_LOG = 8,
 	ND_CMD_VENDOR = 9,
 	ND_CMD_CALL = 10,
+	ND_CMD_GET_STAT = 11,
 };
 
 enum {
@@ -151,6 +177,7 @@ static inline const char *nvdimm_cmd_name(unsigned cmd)
 	case ND_CMD_VENDOR_EFFECT_LOG:		return "effect_log";
 	case ND_CMD_VENDOR:			return "vendor";
 	case ND_CMD_CALL:			return "cmd_call";
+	case ND_CMD_GET_STAT:			return "get_stat";
 	default:				return "unknown";
 	}
 }
-- 
2.28.0

