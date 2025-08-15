Return-Path: <linuxppc-dev+bounces-11045-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0AFB27B22
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Aug 2025 10:35:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c3FmR1Jpxz3cZ8;
	Fri, 15 Aug 2025 18:35:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755246919;
	cv=none; b=KXFNkPk7jg1cYQJYRHy9jr5Ei0xHcNbkVLs8ec8keo/a0f9FDKbciwjES6PSZB89WlHsROhZc8Gxckl3te0LbwNm7VaYqGWjcxS+2gZ2tw6ULWG0OmWV2Uhv+f81RsMTO0SLyyW5ratiLGBoVK5Pk/W/ntUx6wSLa6997P1XrJQp/oxJLmpjdKX1+kajH7yaQsg5vwQPsZeebQSMw8HcUyktsV/B4wlY036jeYSLNJOjJdIAgOqUQtesLv1CxgiywVdzkNzPEEU1LC1Zlo5Py+/GUmJXnrbw8FXRN2z+hWvSFZqtNo17ZVfCrpOx53ut2RXTb4nNIC6Iitef9ys6Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755246919; c=relaxed/relaxed;
	bh=sN4Kv1SAK5z+C/9Du14GsTaXj4uIJRc+GYlzWFU0beo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Xl654nSp4f8SHQy+ppwwgcEns77ZfO7sznwdZKudOdeSNhYQCIc2BCI0FHfcfOjL4UKBv6gutytmi8PATQgEKXC8p6c2qazC+keDWcLmSrtz1IlD8B0qcVXB5WGCInYQySZ4JZ4GYp52zYrbBPGIYV86fCilefL/4xyU7ETNS+YAjdmD5Vee56Kw+pB7aEtlORXGVA4ycxn5xgu0nYVPLYfUJxmsymyU8UJYnXjGKmSPNgVCQzG22OfVhJN0h4FTj/c4/eTFZ+qS0Suw28BR33pOUDNeInByX7hdQUXIpgx+yGKNJUG5tw4eFPxglMSgv/8DRQlMlo1+JZQ3A0GA9g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=F2Tz72Oq; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=F2Tz72Oq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c3FmQ2pYvz3cYx
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Aug 2025 18:35:18 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57F3FP9E020189;
	Fri, 15 Aug 2025 08:35:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=sN4Kv1SAK5z+C/9Du
	14GsTaXj4uIJRc+GYlzWFU0beo=; b=F2Tz72Oqzl3FwGd4UnAdUJSfEgCe6+1wF
	G/e/mZp+cLut+aha4x4LHw6p/kdUDDKqxhRGaFT93lfnJAnb4FCOOAMzOklOk2s9
	tycYrpxAuplwaLdkf9N7LOmsFiXJTaGEPEaoyROVOogeWJUAVYba3TtE2XmHEnJx
	BdCcjTqKedltsmj31Eq7Qus/R8GtvqOIRWDt4quZlFP8VivcNfkpQCweMoxlFhDn
	UJdVgiw3Tkccp9t5rmusI3y0VEz48UtFF0w7dp+8QjWIqwUQoR4Nj3cYOeBuz530
	hrNftWvc2hZkxySFVvS5S3xsWRwFfO5OB2t9ZqmNDQfRk1+MOiOng==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48durupf97-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Aug 2025 08:35:06 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 57F8Z6dh022928;
	Fri, 15 Aug 2025 08:35:06 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48durupf96-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Aug 2025 08:35:06 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57F7Ik0U020795;
	Fri, 15 Aug 2025 08:35:05 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 48ehnq83h3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Aug 2025 08:35:05 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 57F8Z1d748562572
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 15 Aug 2025 08:35:01 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C194120043;
	Fri, 15 Aug 2025 08:35:01 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F015420040;
	Fri, 15 Aug 2025 08:34:54 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.240.145])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 15 Aug 2025 08:34:54 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        maddy@linux.ibm.com, irogers@google.com, namhyung@kernel.org
Cc: linux-perf-users@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        aboorvad@linux.ibm.com, sshegde@linux.ibm.com, atrajeev@linux.ibm.com,
        kjain@linux.ibm.com, hbathini@linux.vnet.ibm.com,
        Aditya.Bodkhe1@ibm.com, venkat88@linux.ibm.com
Subject: [PATCH 03/14] docs: ABI: sysfs-bus-event_source-devices-vpa-dtl: Document sysfs event format entries for vpa_dtl pmu
Date: Fri, 15 Aug 2025 14:03:56 +0530
Message-Id: <20250815083407.27953-4-atrajeev@linux.ibm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250815083407.27953-1-atrajeev@linux.ibm.com>
References: <20250815083407.27953-1-atrajeev@linux.ibm.com>
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
X-Proofpoint-GUID: bwstJNHZAjthoIehob1eAni_NILpAR0Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDIyNCBTYWx0ZWRfXzowO+7f6++AR
 0Mrsvl38Dwa5bDmaYBjDjtM0VchfjjCBwXvp5nJLfqURl69AjSh7e6dtMXVMvcsOp5+8iOQ83Lo
 K30Zz3KaZfm1JZ5MmLg2q0qs1f5ai0zGLtjn1YieKi/14hQpKsOozEPbg4ZRbUNxCbqnVRBKYkq
 kuAFH2t9E/mBuUPDq004HKBD//WkDJDDTsjd2Q1DOs5ijnHKLIcMLBehMesiQrTVSRB6Foj/6R8
 G51VjtkW406N7J/qX/jgyO7HjszpvgOi1euJ07z6cZqMgaFWwiPE9buBV5WiCipwgtHbHRawY5z
 PsEfI/nVidRG5qzWhPKoTr8N7G7tAf+HRcvSHa4R//yn8khiiOaiAs/mF9EM6FvXQNrCuMwBlTN
 RuwMPvD0
X-Authority-Analysis: v=2.4 cv=QtNe3Uyd c=1 sm=1 tr=0 ts=689ef13a cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=2OwXVqhp2XgA:10 a=VnNF1IyMAAAA:8 a=voM4FWlXAAAA:8 a=aXd4d0V2UHYFZ3CtnQMA:9
 a=IC2XNlieTeVoXbcui8wp:22
X-Proofpoint-ORIG-GUID: -IzlBlaBfE1HOKryQFX9KZKvRW3oYGc9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 clxscore=1015 malwarescore=0
 spamscore=0 suspectscore=0 impostorscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508120224
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


