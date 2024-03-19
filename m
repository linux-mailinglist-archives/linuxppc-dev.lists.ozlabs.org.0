Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4172387F76C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Mar 2024 07:34:29 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fujitsu.com header.i=@fujitsu.com header.a=rsa-sha256 header.s=fj2 header.b=t5NhxBpr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TzMQC0TTpz3vXm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Mar 2024 17:34:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fujitsu.com header.i=@fujitsu.com header.a=rsa-sha256 header.s=fj2 header.b=t5NhxBpr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fujitsu.com (client-ip=68.232.139.117; helo=esa4.hc1455-7.c3s2.iphmx.com; envelope-from=lizhijian@fujitsu.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 65 seconds by postgrey-1.37 at boromir; Tue, 19 Mar 2024 17:33:46 AEDT
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TzMPQ52Plz3btQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Mar 2024 17:33:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710830027; x=1742366027;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XKaJQGnrPDnTTf8+bpmOJUwGHXq0K1nBOh01/qp66RQ=;
  b=t5NhxBpryARyha641I9DRtirkGVpu4ZU6pCHO7c2edtoZonfDym3FhlX
   Jf21C4Lfc8YDxoyldv4cewnDRqxYKFHFSzXtHcCaAIHwiPKUGnaMwrPab
   QMjH2EnEv+0m5tjBrxUVyevGSUxYpaNjf0Q0hVIJveF0hZP6IU3q0r/kH
   F08qDg/Vu2TQtnTSpIgNCG9Xudpo52kPGi7FCQde0NzGMqCht5gNH6DyX
   o9ltMDPRIbeDvlrzfOsqP3uFXMYmvGvML3L9seZXjSH4FOgYhd5tVcR1b
   cMDXirw/YqEZ4Z50nJ7D3Y883n3BGnf2pI84xl0ccBPAvvdnbj6V0ejWl
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="152971411"
X-IronPort-AV: E=Sophos;i="6.07,136,1708354800"; 
   d="scan'208";a="152971411"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 15:32:32 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5E0C6141206
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Mar 2024 15:32:30 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8BA50D6152
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Mar 2024 15:32:29 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0A55520097CC5
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Mar 2024 15:32:29 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.226.45])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1D0D51A006F;
	Tue, 19 Mar 2024 14:32:28 +0800 (CST)
From: Li Zhijian <lizhijian@fujitsu.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 25/25] scsi: ibmvscsi: Convert sprintf() family to sysfs_emit() family
Date: Tue, 19 Mar 2024 14:31:32 +0800
Message-Id: <20240319063132.1588443-25-lizhijian@fujitsu.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20240319063132.1588443-1-lizhijian@fujitsu.com>
References: <20240319063132.1588443-1-lizhijian@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28260.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28260.005
X-TMASE-Result: 10--8.425400-10.000000
X-TMASE-MatchedRID: pfKaEBrCt3IbO59FK9BdmJiHtCNYjckMjkDrBOJwwnQ8JmmJxjOaQXVX
	Q3/qdw5yDiqGKKMcNgRhoUIS5GGeEs1HQN/TlJ3ZOIQ9GP2P2u/0swHSFcVJ6GluHEj++VqU18a
	7/fBfKbtruPzTKuxCyQhBeNJICtc+zK2lwdvrNt2qH6mIBejVf2ItZ2e1geixEd+K6O5Nt52/BR
	68O365bn9eOltIlLtrSwG3KDMI8e8exiL4/gRNNd9JA2lmQRNU0MQw+++ihy8BBwEKSykzoBhBv
	WgZlX+84vM1YF6AJbbCCfuIMF6xLSAHAopEd76vJH1ETRymjvVTmpy1fm7ylE0j3AxyBQR0Gu7j
	sbmvaqF8NRIiaC/nhQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, linux-scsi@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Li Zhijian <lizhijian@fujitsu.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Per filesystems/sysfs.rst, show() should only use sysfs_emit()
or sysfs_emit_at() when formatting the value to be returned to user space.

coccinelle complains that there are still a couple of functions that use
snprintf(). Convert them to sysfs_emit().

sprintf() and scnprintf() will be converted as well if they have.

Generally, this patch is generated by
make coccicheck M=<path/to/file> MODE=patch \
COCCI=scripts/coccinelle/api/device_attr_show.cocci

No functional change intended

CC: Tyrel Datwyler <tyreld@linux.ibm.com>
CC: Michael Ellerman <mpe@ellerman.id.au>
CC: Nicholas Piggin <npiggin@gmail.com>
CC: Christophe Leroy <christophe.leroy@csgroup.eu>
CC: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
CC: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
CC: "James E.J. Bottomley" <jejb@linux.ibm.com>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: linux-scsi@vger.kernel.org
CC: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Li Zhijian <lizhijian@fujitsu.com>
---
This is a part of the work "Fix coccicheck device_attr_show warnings"[1]
Split them per subsystem so that the maintainer can review it easily
[1] https://lore.kernel.org/lkml/20240116041129.3937800-1-lizhijian@fujitsu.com/
---
 drivers/scsi/ibmvscsi/ibmvscsi.c | 38 +++++++++-----------------------
 1 file changed, 10 insertions(+), 28 deletions(-)

diff --git a/drivers/scsi/ibmvscsi/ibmvscsi.c b/drivers/scsi/ibmvscsi/ibmvscsi.c
index 71f3e9563520..d6f205d30dcd 100644
--- a/drivers/scsi/ibmvscsi/ibmvscsi.c
+++ b/drivers/scsi/ibmvscsi/ibmvscsi.c
@@ -1904,11 +1904,8 @@ static ssize_t show_host_vhost_loc(struct device *dev,
 {
 	struct Scsi_Host *shost = class_to_shost(dev);
 	struct ibmvscsi_host_data *hostdata = shost_priv(shost);
-	int len;
 
-	len = snprintf(buf, sizeof(hostdata->caps.loc), "%s\n",
-		       hostdata->caps.loc);
-	return len;
+	return sysfs_emit(buf, "%s\n", hostdata->caps.loc);
 }
 
 static struct device_attribute ibmvscsi_host_vhost_loc = {
@@ -1924,11 +1921,8 @@ static ssize_t show_host_vhost_name(struct device *dev,
 {
 	struct Scsi_Host *shost = class_to_shost(dev);
 	struct ibmvscsi_host_data *hostdata = shost_priv(shost);
-	int len;
 
-	len = snprintf(buf, sizeof(hostdata->caps.name), "%s\n",
-		       hostdata->caps.name);
-	return len;
+	return sysfs_emit(buf, "%s\n", hostdata->caps.name);
 }
 
 static struct device_attribute ibmvscsi_host_vhost_name = {
@@ -1944,11 +1938,8 @@ static ssize_t show_host_srp_version(struct device *dev,
 {
 	struct Scsi_Host *shost = class_to_shost(dev);
 	struct ibmvscsi_host_data *hostdata = shost_priv(shost);
-	int len;
 
-	len = snprintf(buf, PAGE_SIZE, "%s\n",
-		       hostdata->madapter_info.srp_version);
-	return len;
+	return sysfs_emit(buf, "%s\n", hostdata->madapter_info.srp_version);
 }
 
 static struct device_attribute ibmvscsi_host_srp_version = {
@@ -1965,11 +1956,8 @@ static ssize_t show_host_partition_name(struct device *dev,
 {
 	struct Scsi_Host *shost = class_to_shost(dev);
 	struct ibmvscsi_host_data *hostdata = shost_priv(shost);
-	int len;
 
-	len = snprintf(buf, PAGE_SIZE, "%s\n",
-		       hostdata->madapter_info.partition_name);
-	return len;
+	return sysfs_emit(buf, "%s\n", hostdata->madapter_info.partition_name);
 }
 
 static struct device_attribute ibmvscsi_host_partition_name = {
@@ -1986,11 +1974,9 @@ static ssize_t show_host_partition_number(struct device *dev,
 {
 	struct Scsi_Host *shost = class_to_shost(dev);
 	struct ibmvscsi_host_data *hostdata = shost_priv(shost);
-	int len;
 
-	len = snprintf(buf, PAGE_SIZE, "%d\n",
-		       be32_to_cpu(hostdata->madapter_info.partition_number));
-	return len;
+	return sysfs_emit(buf, "%d\n",
+			 be32_to_cpu(hostdata->madapter_info.partition_number));
 }
 
 static struct device_attribute ibmvscsi_host_partition_number = {
@@ -2006,11 +1992,9 @@ static ssize_t show_host_mad_version(struct device *dev,
 {
 	struct Scsi_Host *shost = class_to_shost(dev);
 	struct ibmvscsi_host_data *hostdata = shost_priv(shost);
-	int len;
 
-	len = snprintf(buf, PAGE_SIZE, "%d\n",
-		       be32_to_cpu(hostdata->madapter_info.mad_version));
-	return len;
+	return sysfs_emit(buf, "%d\n",
+			 be32_to_cpu(hostdata->madapter_info.mad_version));
 }
 
 static struct device_attribute ibmvscsi_host_mad_version = {
@@ -2026,11 +2010,9 @@ static ssize_t show_host_os_type(struct device *dev,
 {
 	struct Scsi_Host *shost = class_to_shost(dev);
 	struct ibmvscsi_host_data *hostdata = shost_priv(shost);
-	int len;
 
-	len = snprintf(buf, PAGE_SIZE, "%d\n",
-		       be32_to_cpu(hostdata->madapter_info.os_type));
-	return len;
+	return sysfs_emit(buf, "%d\n",
+			 be32_to_cpu(hostdata->madapter_info.os_type));
 }
 
 static struct device_attribute ibmvscsi_host_os_type = {
-- 
2.29.2

