Return-Path: <linuxppc-dev+bounces-12191-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78521B5713F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Sep 2025 09:23:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQGhs07N2z3dHt;
	Mon, 15 Sep 2025 17:23:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757920988;
	cv=none; b=U9u1ZUd61EHNa2BAjJ9793k2cr1RXIqvu+DAiO6bN6bVGKqoQxPHoVt7Vn/3pa3a8chdOCIFKpx70NHp8g59uW+zP8fF94edxHLiBRMKmh4cCFy+F04VQAc/RgqJndXFqjZ7bA4bIODQ1cZHCJpb3v7H4li218ozCuaWEek0p7yNVu0cztKcvkDpXCYUWvB7rUi0XBxTznt1rFlAz3YNuUWfZYHOcQXONUYy2fErS7HVgT6SB+hOFhoOD/sJPtA7ReH+ME1HXj/Az50tHGvYyBSpJVdfL3Y5ksvmjdpi0AegFfsJdT6ixmlQHqG4cSivYZ/smxIkjbd5ofejl4Mx0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757920988; c=relaxed/relaxed;
	bh=sN4Kv1SAK5z+C/9Du14GsTaXj4uIJRc+GYlzWFU0beo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TkNO/oPOHVz8iHreFFVDSjCuxhKW2vWCn/FiSmnamqeil6KNmS/9XV9HfBtfLPwNNDui1SDKWSOA5rU0BizNZ+ODuT1j9j+NRCJhsBHGSG8DVhycjTHv7xhSs004esvZnQF1MSOBSB/dUEQMId5n6N6RVGe+xhqzZgxtZycX7MeflRR64uWw5KFG+kiyIGu+3vlOP41W9bh6HhsUPyPSVBccow+r3YHL9lvxH4FSJRVF2VDXkNlyMITjjRouVTOEIxURQT2YwQyjm96gaz1qHVxN6VtigafRjF0WBoKBdcME4rsYZrARrjNf6sktcK+MupEaf6ZpfBtpVTR66AejYw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hx2yzcal; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hx2yzcal;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cQGhr25rKz3dBk
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Sep 2025 17:23:08 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58F3PmOl024216;
	Mon, 15 Sep 2025 07:23:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=sN4Kv1SAK5z+C/9Du
	14GsTaXj4uIJRc+GYlzWFU0beo=; b=hx2yzcalUtFGhfJlqpX2ZXuPhBCgiuvxN
	/2kGwOMLWArMWX/FTTFiuHDPvwzPnU+/WBHlNXrWRR6p9+L8LQyR792nCkuAG4Sv
	MRU4Qr5EftHFm0oRLQOiDDRj0oY86rwenR6bI5h2GkZ/Zlcmo9XqXC2BrQlIFDaJ
	U5ZMSUdTMgW2InSx0bCGFSLNb0uifxLdIitrddY3hUWPvGjy5XZueRuzYG8Du7zr
	S9K2F1b2hi1l2yddHvb2WoVeAlWruuW7DaxsO9Z1EEDM256gnXOiD61ngiTbK956
	XseF+meOnOump1K9ph7E0n2R6hsBdlh7RuMkl99Pk+25wldE1HrPg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 496avngw61-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Sep 2025 07:23:03 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58F7MI3l025847;
	Mon, 15 Sep 2025 07:23:03 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 496avngw5x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Sep 2025 07:23:03 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58F52ddu009367;
	Mon, 15 Sep 2025 07:23:02 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 495nn34v8p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Sep 2025 07:23:02 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58F7Mwp732703074
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 15 Sep 2025 07:22:58 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6608520040;
	Mon, 15 Sep 2025 07:22:58 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CECCF20043;
	Mon, 15 Sep 2025 07:22:51 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.244.131])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 15 Sep 2025 07:22:51 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org,
        linux-perf-users@vger.kernel.org, aboorvad@linux.ibm.com,
        sshegde@linux.ibm.com, atrajeev@linux.ibm.com,
        hbathini@linux.vnet.ibm.com, Aditya.Bodkhe1@ibm.com,
        venkat88@linux.ibm.com, Tejas.Manhas1@ibm.com,
        Kajol Jain <kjain@linux.ibm.com>
Subject: [PATCH V2 3/7] docs: ABI: sysfs-bus-event_source-devices-vpa-dtl: Document sysfs event format entries for vpa_dtl pmu
Date: Mon, 15 Sep 2025 12:52:20 +0530
Message-Id: <20250915072224.98958-4-atrajeev@linux.ibm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250915072224.98958-1-atrajeev@linux.ibm.com>
References: <20250915072224.98958-1-atrajeev@linux.ibm.com>
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: -RkQ8esc4Ob-D2XvXmHiJQSIU1CThME4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDAyOCBTYWx0ZWRfX2dV/8I9OSgd5
 Ckx8eRMd69VTdZUSB0ZkmeKBPqHz5rP25KHdQ/LBsA95Nd3aRo4UQkBVRmEoJTMzkfWXL8Yi0/4
 Wus2znIMfHhfVDeHdkoKHFRJh1GQ7dQo4zSHEduyYjkAhYO+Qfjicrf61wsN+D2BttFdgfQ+LQ6
 /uP7/JosaJlbrc5BJJmPByJ+zoJLtyMk3W+6dmj1KanOZ+9LpfIJ/lj/AK9Mof/cDO/zNpfWxGr
 U7P+cCHLxrgIWDAE5u8QSuXNmZ+ywE+nf8evFCmvPlDHvKpdv/Lat9mG2munLqGjI1y7MDtElBB
 KFUzOk3jmlUrQxrFcehT0foEZ5DNBGuoLyZxsjKkndJ8M2YMsYAx3dIQ2D9geRco3LXfmSakwtM
 k1hSSMg0
X-Authority-Analysis: v=2.4 cv=HecUTjE8 c=1 sm=1 tr=0 ts=68c7bed7 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=yJojWOMRYYMA:10 a=VnNF1IyMAAAA:8 a=voM4FWlXAAAA:8 a=aXd4d0V2UHYFZ3CtnQMA:9
 a=IC2XNlieTeVoXbcui8wp:22
X-Proofpoint-GUID: CFg1oCfJEaup490fUoZARLvoRw6eYgAu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_03,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509150028
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Kajol Jain <kjain@linux.ibm.com>

Details are added for the vpa_dtl pmu event and format
attributes in the ABI documentation.

Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 .../sysfs-bus-event_source-devices-vpa-dtl    | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-event_source-devices-vpa-dtl

diff --git a/Documentation/ABI/testing/sysfs-bus-event_source-devices-vpa-dtl b/Documentation/ABI/testing/sysfs-bus-event_source-devices-vpa-dtl
new file mode 100644
index 000000000000..7b7c789a5cf5
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-event_source-devices-vpa-dtl
@@ -0,0 +1,25 @@
+What:           /sys/bus/event_source/devices/vpa_dtl/format
+Date:           February 2025
+Contact:        Linux on PowerPC Developer List <linuxppc-dev at lists.ozlabs.org>
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
+Date:           February 2025
+Contact:        Linux on PowerPC Developer List <linuxppc-dev at lists.ozlabs.org>
+Description:	(RO) Attribute group to describe performance monitoring events
+                for the Virtual Processor Dispatch Trace Log. Each attribute in
+		this group describes a single performance monitoring event
+		supported by vpa_dtl pmu.  The name of the file is the name of
+		the event (See ABI/testing/sysfs-bus-event_source-devices-events).
-- 
2.47.1


