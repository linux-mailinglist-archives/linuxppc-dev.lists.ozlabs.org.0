Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A251E0C29
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 May 2020 12:50:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Vv5G6HtlzDqBj
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 May 2020 20:50:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49VtxG74dwzDqR6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 May 2020 20:43:46 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04PAVcxv061226; Mon, 25 May 2020 06:43:35 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 316y4taf4y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 May 2020 06:43:35 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 04PAWCZi062781;
 Mon, 25 May 2020 06:43:35 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 316y4taf4d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 May 2020 06:43:35 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 04PAex6x006002;
 Mon, 25 May 2020 10:43:32 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03ams.nl.ibm.com with ESMTP id 316uf83vhv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 May 2020 10:43:32 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 04PAhUPH53936624
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 25 May 2020 10:43:30 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DA87511C06E;
 Mon, 25 May 2020 10:43:29 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 050C211C050;
 Mon, 25 May 2020 10:43:26 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.199.38.13])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 25 May 2020 10:43:25 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, suka@us.ibm.com,
 nathanl@linux.ibm.com
Subject: [PATCH v10 3/5] powerpc/hv-24x7: Add sysfs files inside hv-24x7
 device to show processor details
Date: Mon, 25 May 2020 16:13:05 +0530
Message-Id: <20200525104308.9814-4-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200525104308.9814-1-kjain@linux.ibm.com>
References: <20200525104308.9814-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-25_04:2020-05-22,
 2020-05-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0
 adultscore=0 impostorscore=0 phishscore=0 spamscore=0 cotscore=-2147483648
 lowpriorityscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=999
 clxscore=1015 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2005250077
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
Cc: ravi.bangoria@linux.ibm.com, maddy@linux.vnet.ibm.com, mpetlan@redhat.com,
 peterz@infradead.org, gregkh@linuxfoundation.org,
 alexander.shishkin@linux.intel.com, anju@linux.vnet.ibm.com,
 mamatha4@linux.vnet.ibm.com, jmario@redhat.com, namhyung@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

To expose the system dependent parameter like total number of
sockets and numbers of chips per socket, patch adds two sysfs files.
"sockets" and "chips" are added to /sys/devices/hv_24x7/interface/
of the "hv_24x7" pmu.

Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 arch/powerpc/perf/hv-24x7.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/powerpc/perf/hv-24x7.c b/arch/powerpc/perf/hv-24x7.c
index 5cd954af5445..995dd170ca4b 100644
--- a/arch/powerpc/perf/hv-24x7.c
+++ b/arch/powerpc/perf/hv-24x7.c
@@ -448,6 +448,24 @@ static ssize_t device_show_string(struct device *dev,
 	return sprintf(buf, "%s\n", (char *)d->var);
 }
 
+static ssize_t sockets_show(struct device *dev,
+			    struct device_attribute *attr, char *buf)
+{
+	return sprintf(buf, "%d\n", phys_sockets);
+}
+
+static ssize_t chipspersocket_show(struct device *dev,
+				   struct device_attribute *attr, char *buf)
+{
+	return sprintf(buf, "%d\n", phys_chipspersocket);
+}
+
+static ssize_t coresperchip_show(struct device *dev,
+				 struct device_attribute *attr, char *buf)
+{
+	return sprintf(buf, "%d\n", phys_coresperchip);
+}
+
 static struct attribute *device_str_attr_create_(char *name, char *str)
 {
 	struct dev_ext_attribute *attr = kzalloc(sizeof(*attr), GFP_KERNEL);
@@ -1094,6 +1112,9 @@ PAGE_0_ATTR(catalog_len, "%lld\n",
 		(unsigned long long)be32_to_cpu(page_0->length) * 4096);
 static BIN_ATTR_RO(catalog, 0/* real length varies */);
 static DEVICE_ATTR_RO(domains);
+static DEVICE_ATTR_RO(sockets);
+static DEVICE_ATTR_RO(chipspersocket);
+static DEVICE_ATTR_RO(coresperchip);
 
 static struct bin_attribute *if_bin_attrs[] = {
 	&bin_attr_catalog,
@@ -1104,6 +1125,9 @@ static struct attribute *if_attrs[] = {
 	&dev_attr_catalog_len.attr,
 	&dev_attr_catalog_version.attr,
 	&dev_attr_domains.attr,
+	&dev_attr_sockets.attr,
+	&dev_attr_chipspersocket.attr,
+	&dev_attr_coresperchip.attr,
 	NULL,
 };
 
-- 
2.18.2

