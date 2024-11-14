Return-Path: <linuxppc-dev+bounces-3168-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4030D9C84EE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2024 09:40:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xpts935Yqz2yNB;
	Thu, 14 Nov 2024 19:40:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731573645;
	cv=none; b=TUCFtn6cGkaz0jk9u8/wRYlhdj8eJVrY4GoEs7nyFvh/rW5/u6vbx4h9sxToejkPCHBA6K8D3qhhL1H4GbzSSqn3tb9/OejBu85KF083q/88Tt0F3egF7cnoAIQOhb0yvOw0VaTcTv5np5NOmfVXpBykTIOolWXrDtsy+8livt6EORefx7IFO5mlxHoZidPq1DCmXvyZbyENmnwGwDoXFebeoC80pPBrrHdHefLp/0Q/9atkv3MRK/VAFUM/Ov8qM9mYYvM60etKlnmrOsDK1k827BUWYWmQIf+bDYWbRl1V3aLviT5XtDLqE7htP9Q3SVy6a6mTzLH8Hvr9yBpzuA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731573645; c=relaxed/relaxed;
	bh=6xrE/gtThAVFqCKFClL7h8R5FiTofGAnJybX2eQOVFU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mdx2iPLnoBdnYbxN1gEbmGKfBHNmVezLxkheKFWs1waXIlq1nN4PK5PjPQmY/S5lBX7ExOadgLypnRZMmlowmJnVqQlzNlWj/uYZ4mpp2jURsbevVk708BeRmgFleU/C4zCQyEIxNl+cnOv/FVUNUxnZU4g7UhpFOgyXB59neWHtEftuQULpgTrCk7IKp1W2pu+ZKlW1Cl7pvRVdnI3aAoxIEGpvgUkneMkBPpFfFwrKQ7+LwP5RUbYCVdERVSh5ixsPEFOj8ZelpG7gekO07igjscSQiCqa4mxfciDZXfCdDvI2VZYXTyVfO8IW1t7/9KamQVRkWeyidZL9uvl3FQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gXp5Z3KT; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gXp5Z3KT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xpts81H9jz2yLV
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2024 19:40:43 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AE6e2kw002152;
	Thu, 14 Nov 2024 08:40:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=6xrE/gtThAVFqCKFC
	lL7h8R5FiTofGAnJybX2eQOVFU=; b=gXp5Z3KTexQUjO+SF/UC68WSFM1PnReLz
	2wvvJ0trYizFdY+BrVy4OFmYL5wSyvdnqds8bfsxvseumUN42ZX1E3/TgCJjnMOI
	BWB3V0LqfALAmSDejUZy2KlGBbuYWTzZj3U7ZNh517p9e81RpvCKlHaXBF/QS2bd
	dmbiyLwOHlgqIoT3AEgzDjnsp9KuexLy+fvvx6grQPWIxdUoUcX0e7cRBHAu1oBi
	h1KQO+a4SH0nHIr4SifDcs7+GB23/kDVe1e6Jc8QntUO6S1ehOc27tEyfo/CP22R
	fDQALqpDxob4vkK5x7evO2H6BddBKtDOYrU3yuz1x++q1db5Q343g==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42wc4s8xca-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Nov 2024 08:40:37 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4AE3mTQo021445;
	Thu, 14 Nov 2024 08:40:36 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 42tms17u10-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Nov 2024 08:40:36 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4AE8eVfO57606558
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 14 Nov 2024 08:40:31 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 83E512004F;
	Thu, 14 Nov 2024 08:40:31 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3EA2C20043;
	Thu, 14 Nov 2024 08:40:29 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown [9.43.39.126])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 14 Nov 2024 08:40:29 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au, maddy@linux.ibm.com
Cc: atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com, disgoel@linux.ibm.com,
        hbathini@linux.ibm.com, adubey@linux.ibm.com, gautam@linux.ibm.com,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] docs: ABI: sysfs-bus-event_source-devices-vpa-pmu: Document sysfs event format entries for vpa_pmu
Date: Thu, 14 Nov 2024 14:10:11 +0530
Message-ID: <20241114084013.1140010-2-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20241114084013.1140010-1-kjain@linux.ibm.com>
References: <20241114084013.1140010-1-kjain@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ma5GWSP6fJWRUATXD1zioukZMnd3MUDf
X-Proofpoint-ORIG-GUID: ma5GWSP6fJWRUATXD1zioukZMnd3MUDf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 mlxlogscore=999
 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411140065
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Details are added for the vpa_pmu event and format
attributes in the ABI documentation.

Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
Co-developed-by: Madhavan Srinivasan <maddy@linux.ibm.com>
Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
 .../sysfs-bus-event_source-devices-vpa-pmu    | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-event_source-devices-vpa-pmu

diff --git a/Documentation/ABI/testing/sysfs-bus-event_source-devices-vpa-pmu b/Documentation/ABI/testing/sysfs-bus-event_source-devices-vpa-pmu
new file mode 100644
index 000000000000..8285263ff78d
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-event_source-devices-vpa-pmu
@@ -0,0 +1,24 @@
+What:           /sys/bus/event_source/devices/vpa_pmu/format
+Date:           November 2024
+Contact:        Linux on PowerPC Developer List <linuxppc-dev@lists.ozlabs.org>
+Description:    Read-only. Attribute group to describe the magic bits
+                that go into perf_event_attr.config for a particular pmu.
+                (See ABI/testing/sysfs-bus-event_source-devices-format).
+
+                Each attribute under this group defines a bit range of the
+                perf_event_attr.config. Supported attribute are listed
+                below::
+			event = "config:0-31" - event ID
+
+		For example::
+
+		  l1_to_l2_lat = "event=0x1"
+
+What:           /sys/bus/event_source/devices/vpa_pmu/events
+Date:           November 2024
+Contact:        Linux on PowerPC Developer List <linuxppc-dev@lists.ozlabs.org>
+Description:	Read-only. Attribute group to describe performance monitoring
+               events for the Virtual Processor Area events. Each attribute
+		in this group describes a single performance monitoring event
+		supported by vpa_pmu. The name of the file is the name of
+		the event (See ABI/testing/sysfs-bus-event_source-devices-events).
-- 
2.43.5


