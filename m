Return-Path: <linuxppc-dev+bounces-17173-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJ8RBYjRnmnwXQQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17173-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 11:40:08 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4AE195E11
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 11:40:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fLWLn2g00z3f0r;
	Wed, 25 Feb 2026 21:40:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772016001;
	cv=none; b=i5TPeAUWjswZtxcKCNHDw0nA1/OCSjg7biB3ZVFQRoM4BtVLYvVo4P6NTtqXNk67UBehaWhUwK42opfxxwwoY4dXA6dweKy8CSdPbqRmfdb1qnbJslCSdMfG7DwPOhiUVeAHspFvome6bpemJo++OMYLsE9d1mmpNcr9Qm9582SLfBvJCeIsLVGOnBqWX3YFykA9gq68CzDskwhuj9OY56j0MGzkYfQr6vfvOhNYxPmkQfunoUay1B0eZtdHgRnR9MotxcesfNsMr6NSdRI87nJuNSyCoYoDeRoiFZQP3pgJyMahtQgZhP3RLudMdD/Bd9/HABymFchlcP1fS8lVrg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772016001; c=relaxed/relaxed;
	bh=sL11sx23Rcy5IgZ8B9tWiGZp8lNaf1EwggY4I08LQUE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lpi+H0+auKIsfzd3O9vNfQBO0Em9PFzPBEq+ilmgtzuZfwFJ7G8T+Z8PKy98PNxtkIaETJjKS6gjiwi9Ewhz/cofAcQ1g/9QalLsNI3JjQPxwStfSooREzuQKGXVC2ok2ry6ZWlWHzqurNTuRdxEzYf9VsPRFcYLnrDheXicmtcLp9HMcH3AbPESeFEXle36X5Mky6tIcS3oXEuK6H/vB/x2tpz9J5o7dnZbpxzHtzSOdLdXqq3TkB48JGXjsia2bfuD/5dwmEAEpK3s4LHbFKJWTJuz9KzHEm0uIfKXvJyOdh9AWsQYl4QgxWPPFvYaFxgAyyOQMtMZmS80+Agf1w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EQeZDU2l; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EQeZDU2l;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fLWLm3gJYz3f0P
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Feb 2026 21:40:00 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OIfMf92461030;
	Wed, 25 Feb 2026 10:39:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=sL11sx23Rcy5IgZ8B
	9tWiGZp8lNaf1EwggY4I08LQUE=; b=EQeZDU2lzepoFDMBXLJR7Xj/Wag++ZZ0D
	+fp8War+AQl4lwwUNzEE9z2GmhVX6fqk8STybj0YcLP0uaThf0lQCmpOPRmea1mq
	J3FABFZg3xbD3k1hO2S2PA+CvLted51VetVaPRnQm8yi9BfdjHV5XsxxlKZ2qAG4
	WG5+Lg0/Ouw6EDhj+dfFIq7P8NpPvKoCfkSFA4rZhN1oQ7jBt2wqLi67qARVqK9n
	QqUWSEFMEHU9gtOJc6Lt9o5mmytCJ5HYxO/kYfSQFeREYHMQ1K8UTbkCfdxZ7yNz
	/YFVR7PK0TRLimXCPDFUEB6Sx0jmUyxr7oKIRDgDQxxnaidp32BZQ==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cf34c73ee-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Feb 2026 10:39:45 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61P8eqqI030385;
	Wed, 25 Feb 2026 10:39:44 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4cfrhkcuvt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Feb 2026 10:39:44 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61PAdeV330474614
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Feb 2026 10:39:40 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 96B0A2004D;
	Wed, 25 Feb 2026 10:39:40 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1668A20043;
	Wed, 25 Feb 2026 10:39:39 +0000 (GMT)
Received: from ltcrain4-lp15.ltc.tadn.ibm.com (unknown [9.5.7.39])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 25 Feb 2026 10:39:38 +0000 (GMT)
From: adubey@linux.ibm.com
To: linuxppc-dev@lists.ozlabs.org
Cc: bpf@vger.kernel.org, hbathini@linux.ibm.com, ast@kernel.org,
        daniel@iogearbox.net, andrii@kernel.org, maddy@linux.ibm.com,
        Abhishek Dubey <adubey@linux.ibm.com>
Subject: [PATCH v2 2/2] selftests/bpf: Enable private stack tests for powerpc64
Date: Wed, 25 Feb 2026 10:39:50 -0500
Message-ID: <20260225153950.15331-2-adubey@linux.ibm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260225153950.15331-1-adubey@linux.ibm.com>
References: <20260225153950.15331-1-adubey@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDEwNCBTYWx0ZWRfXxR83Y1wvvITm
 0hPGeZ+1ESt36/n022OZrBuNgv74hI/nLW/lnOtaFC+in+HpWgxpG0qM1i3ZA23Zaez3T0YS2X8
 ZFProcHL3dwKRbEefeFi/JG5Wq6dvCMNWeiP3GW9llGM9iMvl3KDwXIftwXGVlmtxI0HZJBBIzI
 cerr5jSZw/fyN6TgLR1Rjj2cTCBW7gyEZk3Act3x+Csk2V68FxVbX+pCBf+Kg7kfKCI7fYS0xgq
 V+DEUD8/om/KEQezm+SR0rVKp4qNIpEdzXO+ZIQb3GXmnUkw9fF3UaXmCbmmMmJ9P5FwMlPsppc
 o+pd9pS6M0qjyHlkrDXqolYDDbHGs5Db3EbMqQrgN01ED0s3WyflsVpNS/JRmrAV0wlcPO14Qam
 NXDkclYqCWsZzXs6xgGSoFnPoXYOlcYIl9kupyDJWb6QXDVIoXA8fO9Qh3+EdC1wbSBj3fNyTpM
 l+C3yCUSBHjVfQDbabQ==
X-Proofpoint-ORIG-GUID: nYQJL7GUvBs5ndoM5BjXt5AP51Nean3q
X-Authority-Analysis: v=2.4 cv=F9lat6hN c=1 sm=1 tr=0 ts=699ed171 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=VnNF1IyMAAAA:8 a=EpsnbLDfARfeqce_9zcA:9
X-Proofpoint-GUID: nYQJL7GUvBs5ndoM5BjXt5AP51Nean3q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0 spamscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602250104
X-Spam-Status: No, score=1.7 required=3.0 tests=DATE_IN_FUTURE_03_06,
	DKIM_SIGNED,DKIM_VALID,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.29 / 15.00];
	DATE_IN_FUTURE(4.00)[4];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17173-lists,linuxppc-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ibm.com:+];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	FROM_NO_DN(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[adubey@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: DF4AE195E11
X-Rspamd-Action: no action

From: Abhishek Dubey <adubey@linux.ibm.com>

With support of private stack, relevant tests must pass
on powerpc64.

#./test_progs -t struct_ops_private_stack
#434/1   struct_ops_private_stack/private_stack:OK
#434/2   struct_ops_private_stack/private_stack_fail:OK
#434/3   struct_ops_private_stack/private_stack_recur:OK
#434     struct_ops_private_stack:OK
Summary: 1/3 PASSED, 0 SKIPPED, 0 FAILED

Signed-off-by: Abhishek Dubey <adubey@linux.ibm.com>
---
 tools/testing/selftests/bpf/progs/struct_ops_private_stack.c   | 3 ++-
 .../selftests/bpf/progs/struct_ops_private_stack_fail.c        | 3 ++-
 .../selftests/bpf/progs/struct_ops_private_stack_recur.c       | 3 ++-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/bpf/progs/struct_ops_private_stack.c b/tools/testing/selftests/bpf/progs/struct_ops_private_stack.c
index dbe646013811..1df1111cd029 100644
--- a/tools/testing/selftests/bpf/progs/struct_ops_private_stack.c
+++ b/tools/testing/selftests/bpf/progs/struct_ops_private_stack.c
@@ -7,7 +7,8 @@
 
 char _license[] SEC("license") = "GPL";
 
-#if defined(__TARGET_ARCH_x86) || defined(__TARGET_ARCH_arm64)
+#if defined(__TARGET_ARCH_x86) || defined(__TARGET_ARCH_arm64) \
+				|| defined(__TARGET_ARCH_powerpc)
 bool skip __attribute((__section__(".data"))) = false;
 #else
 bool skip = true;
diff --git a/tools/testing/selftests/bpf/progs/struct_ops_private_stack_fail.c b/tools/testing/selftests/bpf/progs/struct_ops_private_stack_fail.c
index 3d89ad7cbe2a..e09c1a8782b4 100644
--- a/tools/testing/selftests/bpf/progs/struct_ops_private_stack_fail.c
+++ b/tools/testing/selftests/bpf/progs/struct_ops_private_stack_fail.c
@@ -7,7 +7,8 @@
 
 char _license[] SEC("license") = "GPL";
 
-#if defined(__TARGET_ARCH_x86) || defined(__TARGET_ARCH_arm64)
+#if defined(__TARGET_ARCH_x86) || defined(__TARGET_ARCH_arm64) \
+				|| defined(__TARGET_ARCH_powerpc)
 bool skip __attribute((__section__(".data"))) = false;
 #else
 bool skip = true;
diff --git a/tools/testing/selftests/bpf/progs/struct_ops_private_stack_recur.c b/tools/testing/selftests/bpf/progs/struct_ops_private_stack_recur.c
index b1f6d7e5a8e5..791800835673 100644
--- a/tools/testing/selftests/bpf/progs/struct_ops_private_stack_recur.c
+++ b/tools/testing/selftests/bpf/progs/struct_ops_private_stack_recur.c
@@ -7,7 +7,8 @@
 
 char _license[] SEC("license") = "GPL";
 
-#if defined(__TARGET_ARCH_x86) || defined(__TARGET_ARCH_arm64)
+#if defined(__TARGET_ARCH_x86) || defined(__TARGET_ARCH_arm64) \
+				|| defined(__TARGET_ARCH_powerpc)
 bool skip __attribute((__section__(".data"))) = false;
 #else
 bool skip = true;
-- 
2.52.0


