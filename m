Return-Path: <linuxppc-dev+bounces-4548-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A62339FF327
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jan 2025 07:47:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YNL4r30Z0z2yFP;
	Wed,  1 Jan 2025 17:47:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735714076;
	cv=none; b=l2f9QWX71bF6AyA9tsgbmpygeQa86jcOG6bvL+9rzbiCltnAAIljVwCAvlOoQ6vrBfPw34MzeA4OxxJWwyMmazlQcvx/pYqlskX1nJx9jOuvZzBLP4KfErzOOJ05SQjYgRJqFQoQTYDQSMqZbMaXwfxDCXTo8RPaFPK7cSLRvb6/d9h1WFGkMP4qGY4yuBz8qrfIHGN4AgBfG6EelytS2+tMQc6CkRXTyWIn/bVDmGqcQ15IeiqU9qi7Dhl3K5m5I4t3dxKN2sU1FExSeokD2eWr3vu/fE+JC7qQhiCTeZPM9ZLX2+YHnjGAmhLLUjsrQx8s8lgvzno/pJ5rnVsNmA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735714076; c=relaxed/relaxed;
	bh=frO7ktX0N9GLq4XmD+pUCsOtKvZJHs3osowN7Qj+UAo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lKxs3Nd6BqnwhN4gP3rbrBkRwZKKj4gsITfYlJdNDUC8AzdZKVebvd+RyRWCQOPbxD92amckmlR+kWfy/AQ4pSf7qCMu2UrqvmWhNic/yKyljcfAWFADvfhTuvXDgOENStsWOhyWVoAyHrSkZZrjpBpqpg5OGkyCGrUW+t+lQ1rVNO0Hg8gzBbKCOmHfTrRMPtRtEDkDpIQGkAspVryYG1i+WV+Th5aceV94pZ2qJkzGOb8QFT33l/9+wYz9RYVlX54ATpfcqRVX7CPanahTuWOXS3PmarOGwb6/wR9lhtrBW3RuQ7aOHgD48/fku23nD23Q+NGjj9TFbPZ7IruFew==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=h3CU9Cqk; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=h3CU9Cqk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YNL4q3BM7z2y66
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Jan 2025 17:47:55 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5013qiX5029761
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 1 Jan 2025 06:47:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=frO7ktX0N9GLq4XmD
	+pUCsOtKvZJHs3osowN7Qj+UAo=; b=h3CU9CqkakHi+GI3zQuriXSWlQyK4NoPQ
	Ctlgy0olNFZs/ojum/F6Hl962cmvKjKhv8Q4zjz6nbQjTY/PliqCptW7fki8JH80
	WWWrod6EyQy25mWejxbkksfu5BIoansqokuInR5aQq0N02y902Q+e4Idz3l8LRJf
	5pkSx6gVhWUEjdUV2HR9eBja6VCRqF7l0Zm34WuGJnoA2w+wBmwCbfAyfKJxapaO
	YuspLaglAWgLxEk+dBQJQTlqti5csYV62hDm6zbDNBqBX6BXcRvusCBsntO6teSE
	GtBm3rPedaZbmCQ2/51xpZc+89xbXbUaYWjvG65YTmDF4wU0RpZuA==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43vx6hrdgu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Jan 2025 06:47:53 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5011rBUp016708
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 1 Jan 2025 06:47:52 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 43tw5kd5pq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Jan 2025 06:47:52 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5016llsj49152506
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 1 Jan 2025 06:47:47 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 90F1B20049;
	Wed,  1 Jan 2025 06:47:47 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A4B0A20040;
	Wed,  1 Jan 2025 06:47:46 +0000 (GMT)
Received: from ltcden3-lp14.aus.stglabs.ibm.com (unknown [9.53.174.165])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  1 Jan 2025 06:47:46 +0000 (GMT)
From: Abhishek Dubey <adubey@linux.ibm.com>
To: maddy@linux.ibm.com, atrajeev@linux.vnet.ibm.com, hbathini@linux.ibm.com
Cc: linuxppc-dev@lists.ozlabs.org, Abhishek Dubey <adubey@linux.ibm.com>
Subject: [PATCH v5 3/3] powerpc: Document details on H_HTM hcall
Date: Wed,  1 Jan 2025 01:47:44 -0500
Message-ID: <aba1981d209559cbcc8a17adb594d5457824c51a.1734277855.git.adubey@linux.ibm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <a102e9d6923c4696c54f399b5c5ded7d28415fa5.1734277855.git.adubey@linux.ibm.com>
References: <a102e9d6923c4696c54f399b5c5ded7d28415fa5.1734277855.git.adubey@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: zfERpvAje5HmPuOma8Sw9e7fS0b-2795
X-Proofpoint-GUID: zfERpvAje5HmPuOma8Sw9e7fS0b-2795
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0 impostorscore=0
 mlxlogscore=903 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501010054
X-Spam-Status: No, score=1.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
	SUSPICIOUS_RECIPS autolearn=disabled version=4.0.0
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Add documentation to 'papr_hcalls.rst' describing the
input, output and return values of the H_HTM hcall as
per the internal specification.

v3 patch:
  https://lore.kernel.org/linuxppc-dev/20240828085223.42177-3-maddy@linux.ibm.com/

Signed-off-by: Abhishek Dubey <adubey@linux.ibm.com>
Co-developed-by: Madhavan Srinivasan <maddy@linux.ibm.com>
Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
 Documentation/arch/powerpc/papr_hcalls.rst | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/arch/powerpc/papr_hcalls.rst b/Documentation/arch/powerpc/papr_hcalls.rst
index 80d2c0aadab5..805e1cb9bab9 100644
--- a/Documentation/arch/powerpc/papr_hcalls.rst
+++ b/Documentation/arch/powerpc/papr_hcalls.rst
@@ -289,6 +289,17 @@ to be issued multiple times in order to be completely serviced. The
 subsequent hcalls to the hypervisor until the hcall is completely serviced
 at which point H_SUCCESS or other error is returned by the hypervisor.
 
+**H_HTM**
+
+| Input: flags, target, operation (op), op-param1, op-param2, op-param3
+| Out: *dumphtmbufferdata*
+| Return Value: *H_Success,H_Busy,H_LongBusyOrder,H_Partial,H_Parameter,
+		 H_P2,H_P3,H_P4,H_P5,H_P6,H_State,H_Not_Available,H_Authority*
+
+H_HTM supports setup, configuration, control and dumping of Hardware Trace
+Macro (HTM) function and its data. HTM buffer stores tracing data for functions
+like core instruction, core LLAT and nest.
+
 References
 ==========
 .. [1] "Power Architecture Platform Reference"
-- 
2.44.0


