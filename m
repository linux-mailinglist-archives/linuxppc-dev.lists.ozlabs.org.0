Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C351745F7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Feb 2020 10:49:26 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48V1pC17xgzDrNy
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Feb 2020 20:49:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48V1fl3RH0zDr6L
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Feb 2020 20:42:55 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01T9gde2066166
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Feb 2020 04:42:52 -0500
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yfkn7j7fj-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Feb 2020 04:42:52 -0500
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <kjain@linux.ibm.com>;
 Sat, 29 Feb 2020 09:42:49 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Sat, 29 Feb 2020 09:42:42 -0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01T9gf3n44826812
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 29 Feb 2020 09:42:41 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 363014C058;
 Sat, 29 Feb 2020 09:42:41 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 539094C040;
 Sat, 29 Feb 2020 09:42:36 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.199.53.249])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sat, 29 Feb 2020 09:42:35 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: acme@kernel.org, linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au,
 sukadev@linux.vnet.ibm.com
Subject: [PATCH v3 3/8] powerpc/hv-24x7: Add sysfs files inside hv-24x7 device
 to show processor details
Date: Sat, 29 Feb 2020 15:11:54 +0530
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200229094159.25573-1-kjain@linux.ibm.com>
References: <20200229094159.25573-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20022909-0016-0000-0000-000002EB659F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20022909-0017-0000-0000-0000334EA1BB
Message-Id: <20200229094159.25573-4-kjain@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-29_02:2020-02-28,
 2020-02-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 mlxlogscore=999 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 suspectscore=0 clxscore=1015 mlxscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002290074
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
Cc: mark.rutland@arm.com, maddy@linux.vnet.ibm.com, peterz@infradead.org,
 yao.jin@linux.intel.com, mingo@kernel.org, kan.liang@linux.intel.com,
 ak@linux.intel.com, alexander.shishkin@linux.intel.com,
 anju@linux.vnet.ibm.com, mamatha4@linux.vnet.ibm.com,
 ravi.bangoria@linux.ibm.com, kjain@linux.ibm.com, jmario@redhat.com,
 namhyung@kernel.org, tglx@linutronix.de, mpetlan@redhat.com,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, jolsa@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

To expose the system dependent parameter like total number of
sockets and numbers of chips per socket, patch adds two sysfs files.
"sockets" and "chips" are added to /sys/devices/hv_24x7/interface/
of the "hv_24x7" pmu.

Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 arch/powerpc/perf/hv-24x7.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/powerpc/perf/hv-24x7.c b/arch/powerpc/perf/hv-24x7.c
index 9ae00f29bd21..a31bd5b88f7a 100644
--- a/arch/powerpc/perf/hv-24x7.c
+++ b/arch/powerpc/perf/hv-24x7.c
@@ -454,6 +454,20 @@ static ssize_t device_show_string(struct device *dev,
 	return sprintf(buf, "%s\n", (char *)d->var);
 }
 
+#ifdef CONFIG_PPC_RTAS
+static ssize_t sockets_show(struct device *dev,
+			    struct device_attribute *attr, char *buf)
+{
+	return sprintf(buf, "%d\n", physsockets);
+}
+
+static ssize_t chips_show(struct device *dev, struct device_attribute *attr,
+			  char *buf)
+{
+	return sprintf(buf, "%d\n", physchips);
+}
+#endif
+
 static struct attribute *device_str_attr_create_(char *name, char *str)
 {
 	struct dev_ext_attribute *attr = kzalloc(sizeof(*attr), GFP_KERNEL);
@@ -1100,6 +1114,10 @@ PAGE_0_ATTR(catalog_len, "%lld\n",
 		(unsigned long long)be32_to_cpu(page_0->length) * 4096);
 static BIN_ATTR_RO(catalog, 0/* real length varies */);
 static DEVICE_ATTR_RO(domains);
+#ifdef CONFIG_PPC_RTAS
+static DEVICE_ATTR_RO(sockets);
+static DEVICE_ATTR_RO(chips);
+#endif
 
 static struct bin_attribute *if_bin_attrs[] = {
 	&bin_attr_catalog,
@@ -1110,6 +1128,10 @@ static struct attribute *if_attrs[] = {
 	&dev_attr_catalog_len.attr,
 	&dev_attr_catalog_version.attr,
 	&dev_attr_domains.attr,
+#ifdef CONFIG_PPC_RTAS
+	&dev_attr_sockets.attr,
+	&dev_attr_chips.attr,
+#endif
 	NULL,
 };
 
-- 
2.21.0

