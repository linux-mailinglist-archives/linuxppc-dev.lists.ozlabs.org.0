Return-Path: <linuxppc-dev+bounces-670-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F20B9624B3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2024 12:22:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wv0p64lsJz2yhD;
	Wed, 28 Aug 2024 20:22:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724840526;
	cv=none; b=Z87qy+/geWZc/2X+xAIxGCT/K929FXPzEJFqO9xsAWyW/ZEn05QN37NXDelNS0SVERjxKYXdCT+lwFSJcMKlbtAP2X3P/vuqIwM+trzg5r9XW46fV+GY4MyJyjZVBMsLiHmfePGwQu8c3b3VBc9T35IL5undRAGiGkKaHamaxZ2Xa4FBYgJgTft+D1pH09c0JCeP9Y9w6/7T/1ypu1riuQRD9Vw7FGat5hMtUgjXEd8WtUnH1X8hlojwIqDnHUI17+RT/xEhj0GMDqfq9hnGcqeD5CRcmL4Ll5uymHW3+FzqCWMnfXepDRqN/QrbyDz5EzKozgAOB14lvhFmGfQIcA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724840526; c=relaxed/relaxed;
	bh=fxVn1ZCwU1ThPWqmvG1/xTlv/rjqUuGcE2CdKTCGB/Q=;
	h=Received:DKIM-Signature:Received:Received:Received:Received:
	 Received:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-TM-AS-GCONF:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details; b=f+Fqf4o1OMEq5gADrm7X8Ji+9JV2ipoIQYU3knbVHFfM90/84xx0kzpNLz3dwXPQ4T/FRgy4djihRoj9Q/zV4o6qkQdce4OnRF8F+GekgwDo2TvlOuAX/2NNbcKOo1hC7B+C6nSiSfW1hkDNmcZ8wKFMtmXUgYqZEoQK+xH3HI1gs+jl8k5+KIQFfffusoT1WNvTtuLnOj2VBwZIYkLIWlnCB47L+S8O7Tx8vw/01OsSP+B2xhLO/ywxW6Mp07w9cEK/pJdr4t5t61WO9q8qLVQNipyRuR45LS7IB1eX/fwSJnr85bCtZQEyUsSdnAPmvIWLCmDOcY2lDhZR/tjQsw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dAjcx30g; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dAjcx30g;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wv0p62Hb6z2yLT
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 20:22:06 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47RM42d6025304;
	Wed, 28 Aug 2024 10:22:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=pp1; bh=fxVn1ZCwU1ThP
	WqmvG1/xTlv/rjqUuGcE2CdKTCGB/Q=; b=dAjcx30g81pdf2ggr1cBe+lq54Ua1
	uECXkNeE+LKAU5qdg87wfL+XYPLi0m2JyMBBxaZ8i+TGP24WQz+UQcEzRIpOPfr3
	ciMwI/blOLlsS5Veq278WfXrvmbNBD7mS75urtA7L+dwJTduQGcr0gvbTkXOuaRz
	BFVAer1sII6nQUMhhh9tzv+1FbPlcUcv9WG7WqH4Pm/eEsHAYjOyByBpVlDK3uOE
	+RoEGtLTifw7nd0ZaVcayXC/UlT5bU0oxSRxclur0zFcNkTETv1deEZGFbl4HmYT
	8M6YfhK5uoPw7NfInDdwrmChQtl88h04b7EJsp+/OOj539MWFcvuVtQIQ==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 419q8pj9jp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 10:22:01 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 47S9tGpF003137;
	Wed, 28 Aug 2024 10:22:00 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 417tupy2gq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 10:22:00 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 47SALuah21824112
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 28 Aug 2024 10:21:56 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B9B2C20043;
	Wed, 28 Aug 2024 10:21:56 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 696CE20040;
	Wed, 28 Aug 2024 10:21:54 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com (unknown [9.171.52.187])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 28 Aug 2024 10:21:54 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au
Cc: atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com,
        linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
        maddy@linux.ibm.com, disgoel@linux.ibm.com,
        linuxppc-dev@lists.ozlabs.org, hbathini@linux.ibm.com,
        adubey@linux.ibm.com
Subject: [PATCH 2/2] docs: ABI: sysfs-bus-event_source-devices-vpa-dtl: Document sysfs event format entries for vpa_dtl pmu
Date: Wed, 28 Aug 2024 15:51:41 +0530
Message-ID: <20240828102141.1052332-2-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20240828102141.1052332-1-kjain@linux.ibm.com>
References: <20240828102141.1052332-1-kjain@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Clj-fWv8Hasgi3MSLjlojEwL27SH_gvE
X-Proofpoint-GUID: Clj-fWv8Hasgi3MSLjlojEwL27SH_gvE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-28_03,2024-08-27_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 adultscore=0 impostorscore=0 suspectscore=0
 clxscore=1015 mlxlogscore=999 bulkscore=0 spamscore=0 mlxscore=0
 lowpriorityscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2408280072

Details are added for the vpa_dtl pmu event and format
attributes in the ABI documentation.

Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 .../sysfs-bus-event_source-devices-vpa-dtl    | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-event_source-devices-vpa-dtl

diff --git a/Documentation/ABI/testing/sysfs-bus-event_source-devices-vpa-dtl b/Documentation/ABI/testing/sysfs-bus-event_source-devices-vpa-dtl
new file mode 100644
index 000000000000..21459b7bb158
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-event_source-devices-vpa-dtl
@@ -0,0 +1,25 @@
+What:           /sys/bus/event_source/devices/vpa_dtl/format
+Date:           August 2024
+Contact:        Linux on PowerPC Developer List <linuxppc-dev@lists.ozlabs.org>
+Description:    Read-only. Attribute group to describe the magic bits
+                that go into perf_event_attr.config for a particular pmu.
+                (See ABI/testing/sysfs-bus-event_source-devices-format).
+
+                Each attribute under this group defines a bit range of the
+                perf_event_attr.config. Supported attribute are listed
+                below::
+
+				event  = "config:0-7"  - event ID
+
+		For example::
+
+		  dtl_cede = "event=0x1"
+
+What:           /sys/bus/event_source/devices/vpa_dtl/events
+Date:           August 2024
+Contact:        Linux on PowerPC Developer List <linuxppc-dev@lists.ozlabs.org>
+Description:	(RO) Attribute group to describe performance monitoring events
+                for the Virtual Processor Dispatch Trace Log. Each attribute in
+		this group describes a single performance monitoring event
+		supported by vpa_dtl pmu.  The name of the file is the name of
+		the event (See ABI/testing/sysfs-bus-event_source-devices-events).
-- 
2.43.5


