Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A760E52B531
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 10:56:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L36LB3pxFz3cLx
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 18:56:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DPu98iqP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=DPu98iqP; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L36Jl48sxz3bwT
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 May 2022 18:55:35 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24I8j23g018135;
 Wed, 18 May 2022 08:55:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=QGey1s4N7eooipYKBAp1GL4ewsHrnLCq7uhlEEENmGo=;
 b=DPu98iqPN8NNBECEGtEtjxS632Y2ikn2FNabgqKWkHBJNl7r+iLxEaf1bcLPJgsdD1zU
 MG1wVnVVjNVixiIdLBWyMvl3vtWfm/2gqMfnAYZ8Ckt3MsRuyyc7uPCxRHy8Kkieifft
 BqpETXfOFLqw9ykol8QagPIfyUjJM5GxgYfYkxaborb3n5XRtk6cADdVn+6woHph/i5M
 y8FysF/xlZ20q6N1fC3iFvD4uE87Rvu1UXjhAfJ5ihcAzwAJwMfguCbX7gr2EL91XzS1
 x7+lhFM/330sE98k6RWaqDStp4mmOQPvqIyCcDq45oyD+7X6Mel1VfW7C9+jheKseg67 tg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g4wjh85p0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 May 2022 08:55:24 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24I8jQg3019940;
 Wed, 18 May 2022 08:55:23 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g4wjh85na-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 May 2022 08:55:23 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24I8qkla004907;
 Wed, 18 May 2022 08:55:21 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 3g2429ddum-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 May 2022 08:55:21 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24I8tI3V54919440
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 May 2022 08:55:18 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 234E542042;
 Wed, 18 May 2022 08:55:18 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 167014203F;
 Wed, 18 May 2022 08:55:13 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.163.14.86])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 18 May 2022 08:55:12 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, mpe@ellerman.id.au
Subject: [PATCH V2 2/2] docs: ABI: sysfs-bus-event_source-devices: Document
 sysfs caps entry for PMU
Date: Wed, 18 May 2022 14:25:02 +0530
Message-Id: <20220518085502.6914-2-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220518085502.6914-1-atrajeev@linux.vnet.ibm.com>
References: <20220518085502.6914-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: N_QWmeI9DHuKDxwH-gnK1jz4_lXT_zwD
X-Proofpoint-ORIG-GUID: SHKo-jeO8CxlWkLtOZ_A5kWC_nQPnrwN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-18_03,2022-05-17_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 mlxscore=0 priorityscore=1501 adultscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 lowpriorityscore=0 mlxlogscore=999 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205180044
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
Cc: irogers@google.com, maddy@linux.vnet.ibm.com, rnsastry@linux.ibm.com,
 kjain@linux.ibm.com, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, disgoel@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add ABI documentation for "caps" attribute group.
Some of the platform specific PMU features can be exposed
in "caps" attribute group/directory:
/sys/bus/event_source/devices/<dev>/

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 .../sysfs-bus-event_source-devices-caps        | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-event_source-devices-caps

diff --git a/Documentation/ABI/testing/sysfs-bus-event_source-devices-caps b/Documentation/ABI/testing/sysfs-bus-event_source-devices-caps
new file mode 100644
index 000000000000..ef5f537bdd83
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-event_source-devices-caps
@@ -0,0 +1,18 @@
+What:		/sys/bus/event_source/devices/<dev>/caps
+Date:		May 2022
+KernelVersion:	5.19
+Contact:	Linux kernel mailing list <linux-kernel@vger.kernel.org>
+Description:
+		Attribute group to describe the capabilities exposed
+		for a particular pmu. Each attribute of this group can
+		expose information specific to a PMU, say pmu_name, so that
+		userspace can understand some of the feature which the
+		platform specific PMU supports.
+
+		One of the example available capability in supported platform
+		like Intel is pmu_name, which exposes underlying CPU name known
+		to the PMU driver.
+
+		Example output in powerpc:
+		grep -H . /sys/bus/event_source/devices/cpu/caps/*
+		/sys/bus/event_source/devices/cpu/caps/pmu_name:POWER9
-- 
2.31.1

