Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 269597EE09A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Nov 2023 13:22:01 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pA1Qvwob;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SWK0R0Flsz3dHK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Nov 2023 23:21:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pA1Qvwob;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SWJzV2X1cz2ys9
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Nov 2023 23:21:09 +1100 (AEDT)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AGBRL9o022526;
	Thu, 16 Nov 2023 12:20:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=2INGF+f6qw7Dhk/RceRDSvGMQcjewKtGURQTcnOj4h8=;
 b=pA1QvwobWTZQznxNjh/K2qi3bmUEkrcPcuMHHtpLPt2mjzgFgWoj48odmAWY28MkExKX
 cWMhJvA75B2iNCgtSRQsp5Fs01Fn1zBszmUXxzRgTLomKF6vOPC7eInwK07jCvy2LOWA
 ZGuVyyUXDn1W4fhbyLqs5Uqx2CGF3+PT4Ds4MZO43SIOc7V8Sre98WfRYVcQ2/ITi1Kp
 PxxXJXz+bmzqmq065xd4+fvPF3T2NWhnXFs7j+GRvdNY9N11IKYOq1V+fYtQkrDaTeHV
 pP29zbOfvdJjD2GN8cugyibXPG3D2qS8UsFGBhU3TiGjgSbLWEXkbCKMeGosOb2+HCRG +w== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3udj7fhceg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Nov 2023 12:20:58 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3AGBUlQa004471;
	Thu, 16 Nov 2023 12:20:57 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3uap5ke1w5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Nov 2023 12:20:57 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3AGCKs2Z17564190
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 Nov 2023 12:20:54 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9BF422004E;
	Thu, 16 Nov 2023 12:20:54 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CAF9B20040;
	Thu, 16 Nov 2023 12:20:52 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown [9.171.0.150])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 16 Nov 2023 12:20:52 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH 1/2] powerpc/hv-gpci: Add return value check in affinity_domain_via_partition_show function
Date: Thu, 16 Nov 2023 17:50:32 +0530
Message-Id: <20231116122033.160964-1-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: F5bZgGs7HGizv5fsFy4cH1n-oSI0lclc
X-Proofpoint-GUID: F5bZgGs7HGizv5fsFy4cH1n-oSI0lclc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_09,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1011
 malwarescore=0 suspectscore=0 mlxscore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2311160098
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
Cc: atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com, Disha Goel <disgoel@linux.vnet.ibm.com>, maddy@linux.ibm.com, disgoel@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

To access hv-gpci kernel interface files data, the
"Enable Performance Information Collection" option has to be set
in hmc. Incase that option is not set and user try to read
the interface files, it should give error message as
operation not permitted.

Result of accessing added interface files with disabled
performance collection option:

[command]# cat processor_bus_topology
cat: processor_bus_topology: Operation not permitted

[command]# cat processor_config
cat: processor_config: Operation not permitted

[command]# cat affinity_domain_via_domain
cat: affinity_domain_via_domain: Operation not permitted

[command]# cat affinity_domain_via_virtual_processor
cat: affinity_domain_via_virtual_processor: Operation not permitted

[command]# cat affinity_domain_via_partition

Based on above result there is no error message when reading
affinity_domain_via_partition file because of missing
check for failed hcall. Fix this issue by adding
a check in the start of affinity_domain_via_partition_show
function, to return error incase hcall fails, with error type
other then H_PARAMETER.

Fixes: a15e0d6a6929 ("powerpc/hv_gpci: Add sysfs file inside hv_gpci device to show affinity domain via partition information")
Reported-by: Disha Goel <disgoel@linux.vnet.ibm.com>
Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 arch/powerpc/perf/hv-gpci.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/perf/hv-gpci.c b/arch/powerpc/perf/hv-gpci.c
index 39dbe6b348df..27f18119fda1 100644
--- a/arch/powerpc/perf/hv-gpci.c
+++ b/arch/powerpc/perf/hv-gpci.c
@@ -534,6 +534,9 @@ static ssize_t affinity_domain_via_partition_show(struct device *dev, struct dev
 	if (!ret)
 		goto parse_result;
 
+	if (ret && (ret != H_PARAMETER))
+		goto out;
+
 	/*
 	 * ret value as 'H_PARAMETER' implies that the current buffer size
 	 * can't accommodate all the information, and a partial buffer
-- 
2.39.3

