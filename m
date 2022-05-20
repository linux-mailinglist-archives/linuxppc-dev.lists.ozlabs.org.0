Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0697752E803
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 10:48:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4L3s6DH6z3dvq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 18:48:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rO8T+XZJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=rO8T+XZJ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L4L1q6v73z3bq2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 May 2022 18:46:55 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24K5mhho030040;
 Fri, 20 May 2022 08:46:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=y9mVKtccokxmVHzYzYmB7GoWZjwMwFt/swEe+h+kpg4=;
 b=rO8T+XZJycmA8pMLpJg8ylY8RZCYX1+RvRoRSeEGyWUzVCnyLS1XDm4jfsPJfuYsryPD
 OLPyT0YgplK9OYzfw1iAR7I3Q+SpRIntgaOAtiF/Fu7tae2bG92ah7rjFYvuVqyti3fP
 DO58BgMiK6sA8elZjXzZMqMxY/4cjMqWKExQZ0orOUyP+qGDMXlOdQLux+blWgu0uB3F
 DN6AA1ruE6BBpkFhfz5MMvwSWe/iuuQzFB5RVlFoNSQWVPdWIlGcgFPkwcYO+4lXVHEN
 jYZn7/xzKvN9YQkCOIDT2wDPBO1N2U4OCnw/v3lMKy6asnCqIik5wcoVI3XpFcTAraci nQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g655vu1jt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 08:46:50 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24K8c6Rf031841;
 Fri, 20 May 2022 08:46:50 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g655vu1jc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 08:46:49 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24K8b1Jn001605;
 Fri, 20 May 2022 08:46:47 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma02fra.de.ibm.com with ESMTP id 3g2428q9v8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 08:46:47 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 24K8k4E326673500
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 May 2022 08:46:04 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2641D42041;
 Fri, 20 May 2022 08:46:44 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0EEAB4203F;
 Fri, 20 May 2022 08:46:39 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.163.31.125])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 20 May 2022 08:46:38 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, mpe@ellerman.id.au
Subject: [PATCH V3 2/2] docs: ABI: sysfs-bus-event_source-devices: Document
 sysfs caps entry for PMU
Date: Fri, 20 May 2022 14:16:30 +0530
Message-Id: <20220520084630.15181-2-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220520084630.15181-1-atrajeev@linux.vnet.ibm.com>
References: <20220520084630.15181-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Cib__CD5jPSDwEZXgRac3-p_LNprtz_1
X-Proofpoint-GUID: Jl7j6Ne0drQ21XUYW4nEKhB6wmjGkWaQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-20_03,2022-05-19_03,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205200061
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

Details is added about "caps" attribute group in the ABI documentation.
This is used to expose some of the PMU attributes in "caps"
directory under : /sys/bus/event_source/devices/<dev>/. The dev/caps
will contain information about features that platform specific PMU
supports.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 .../sysfs-bus-event_source-devices-caps        | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-event_source-devices-caps

diff --git a/Documentation/ABI/testing/sysfs-bus-event_source-devices-caps b/Documentation/ABI/testing/sysfs-bus-event_source-devices-caps
new file mode 100644
index 000000000000..8757dcf41c08
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
+		grep . /sys/bus/event_source/devices/cpu/caps/*
+		/sys/bus/event_source/devices/cpu/caps/pmu_name:POWER9
-- 
2.35.1

