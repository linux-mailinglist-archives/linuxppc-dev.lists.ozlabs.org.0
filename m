Return-Path: <linuxppc-dev+bounces-16878-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id COkLNQHwkmkQ0QEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16878-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Feb 2026 11:22:57 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CB81424F1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Feb 2026 11:22:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fDzP53X5nz3bf4;
	Mon, 16 Feb 2026 21:22:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771237369;
	cv=none; b=ZbuhX03CjzgIB2PseiNephox7dckOZCYcCUCG4nE5O7KJdGNmDX4zWNV/VrNgfnWEQx4g8l8QKij73nkZqQOQroi1NRWEkBvd8+R3A2rf7rf42QEOpNypqRdbqLJS7a5PK/pzVIYq3E2xjWcvkn9YvFvZEywkLO7BskRP/RVapdH6Sl6tIo6cjpsivl4KXnOfyjaeUE0U9oy+HJ/no42qLRi4YkoL//j247tyrZ1yrCKHq8EGVS9xN95RfDdTMxdNEMkR9HqzBkgzkv461N26NWbDBYoA+lpd7A57HZRyCrAs+G17ZrZ1VyLhhK0qU17SNzL1epxcsrC683mNkxS7w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771237369; c=relaxed/relaxed;
	bh=sL11sx23Rcy5IgZ8B9tWiGZp8lNaf1EwggY4I08LQUE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e5f4uf+MuOGywkLsVVLaCfU9ncyRo81qLqRBsqv92f9O6RYWPZyQ19B50ElFe/dIZ8l3tg6Pq/XqK4w+Ms6NVHIE1cQ5zNrsABUdvwQCbAua/XQkgZKW3mzRZK0FTPq9aqC+UHmKmQHpbeSp6To2AeWTfqPQNbebQssnT8om2fZTbGZ91hy6wYYAZxhX3zHbMohbB5UY4db7VC9AHyvWOrlCYBbNAlnKsJ101x8YHhs5/WbTZ8DTMutCZ4A4FzsRWKErO2uRUWo1R8+Rv+S0K88OQfjufM2p6Fp9p60xE1A6GUMWf7AHiIizT41zY+QthzOcMARfLcDp04c0qysOAQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bA5R2KBp; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bA5R2KBp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fDzP45Tx7z2xN4
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Feb 2026 21:22:48 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61G3KU1K1709464;
	Mon, 16 Feb 2026 10:22:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=sL11sx23Rcy5IgZ8B
	9tWiGZp8lNaf1EwggY4I08LQUE=; b=bA5R2KBpvKzAUssB2F2dOLp7QXnzdbLte
	lJ1tzoT+TU6gjzRT4ssqQvwURhtGVyDDa1YxpKKzqK5EaFCVo3y6ov/nXhzsdaoZ
	220uQ5utQb7e4wpWk8f34bVBYOGPZUhwveKX4xCx6taEMzRPbsc7tml19r3+ykla
	sxZHSoaZDgJz6VveGHR+yfZBwtSHny6wPLu0sbCguhKSn6ExcbyEJRtyW+70z9D9
	zUPm1bEI31aQQvlMU23knnFap8VcMzLMsQYKKGuDb7reN295uaNDu5D0EbIAgeBm
	DxFlLNupW2m2OfU7uHjwQlklUYF1FSHdf4L/GZDvfZLVfdbqa0cWQ==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cajcj6qnc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Feb 2026 10:22:26 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61G6Y5pj025024;
	Mon, 16 Feb 2026 10:22:26 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4cb3rxn2v5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Feb 2026 10:22:25 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61GAMLbY29622906
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Feb 2026 10:22:22 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DC92F20040;
	Mon, 16 Feb 2026 10:22:21 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 877A720049;
	Mon, 16 Feb 2026 10:22:19 +0000 (GMT)
Received: from ltcrain4-lp15.ltc.tadn.ibm.com (unknown [9.5.7.39])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 16 Feb 2026 10:22:19 +0000 (GMT)
From: adubey@linux.ibm.com
To: bpf@vger.kernel.org
Cc: hbathini@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, ast@kernel.org,
        daniel@iogearbox.net, andrii@kernel.org, martin.lau@kernel.org,
        eddyz87@gmail.com, yonghong.song@linux.dev, clm@meta.com,
        ihor.solodrai@linux.dev, chleroy@kernel.org,
        Abhishek Dubey <adubey@linux.ibm.com>
Subject: [PATCH 2/2] selftests/bpf: Enable private stack tests for powerpc64
Date: Mon, 16 Feb 2026 10:22:34 -0500
Message-ID: <20260216152234.36632-2-adubey@linux.ibm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260216152234.36632-1-adubey@linux.ibm.com>
References: <20260216152234.36632-1-adubey@linux.ibm.com>
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
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: uq8toAYtRcXOZJEv3DZWGNwdnPdm11On
X-Authority-Analysis: v=2.4 cv=Md9hep/f c=1 sm=1 tr=0 ts=6992efe3 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=VnNF1IyMAAAA:8 a=EpsnbLDfARfeqce_9zcA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA4NSBTYWx0ZWRfXzZGWrRpEcYiI
 +/4LXmVPNZ++J+aRrMv4stwH85DHzGO1939F2U+hTt9Y86p7cqR4eMXmekvPiMF7UPYqxlgfCx1
 GzAfWO0TBguDyZMMXpeuUcNCeeFaLlmo5AyyEEAJCpjb4MlzR8d9PJBJ4pRXmxntYOJBT12J0zG
 uWFfahQ8wOiWTrN7CiRk1xZcAYOqrTRhgrly+Oo2C2dFDb6+x/gjQbB/66kvyABYCgICi8hqmmv
 9H3BdHKwjnauwQMaOneGkSIOQ6VJbKVXBvLssejr7azRh6bNsiGawebQok8nNp40X2MqJSVe3Qb
 tHkLTQS5WqlRF5CaHaYblkUcLXT+C6hIOz1a5xVZJgFZ2tvDLGQBDwKXVlOQ2lrFSVUpuDHxGi8
 XTvfcKLW6JpW2jirrOVeEYCv4fhJtwH0EPvNLKTerSMwPhhhpRXWNWZ+sOH79WIkpfjZcUsLrRP
 ePhUJA+M7gqDLxz3QaA==
X-Proofpoint-GUID: hobbV_8NgA7Gjz-qHDS_pAbe9aXTBpKN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160085
X-Spam-Status: No, score=1.7 required=3.0 tests=DATE_IN_FUTURE_03_06,
	DKIM_SIGNED,DKIM_VALID,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.29 / 15.00];
	DATE_IN_FUTURE(4.00)[4];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[adubey@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-16878-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bpf@vger.kernel.org,m:hbathini@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:ast@kernel.org,m:daniel@iogearbox.net,m:andrii@kernel.org,m:martin.lau@kernel.org,m:eddyz87@gmail.com,m:yonghong.song@linux.dev,m:clm@meta.com,m:ihor.solodrai@linux.dev,m:chleroy@kernel.org,m:adubey@linux.ibm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[linux.ibm.com,lists.ozlabs.org,kernel.org,iogearbox.net,gmail.com,linux.dev,meta.com];
	DKIM_TRACE(0.00)[ibm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[adubey@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 04CB81424F1
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


