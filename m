Return-Path: <linuxppc-dev+bounces-16880-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8J2aDin3kmlx0gEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16880-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Feb 2026 11:53:29 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 599D9142846
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Feb 2026 11:53:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fF04P4yqkz2yhZ;
	Mon, 16 Feb 2026 21:53:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771239205;
	cv=none; b=Bv/VRqKdys7wgFrXHd9v92TmkNfeMlnPeu3X/i4smGSqFuhRaQgzaKE28s3Edniv3xLMRCCW552Kuz4F5lf1th3Ch7Re5cWyMg5Y0R7ZRiIRiU7XLZe1FGYplBs8kLruVNvQACtCjsNW8przOE0FguAFSvr/jfz+2gUqlq2Rl3hMb1AohK+/AAJlyxZjkA6ftdPZ/tbKJO9kD8YwS9sDrMV/pG5Jptba9HyeIDKuVuYRhsggPzvcNNCz7zFEuPsd2IFVEoHjx3g56F90ALBP6y+f6Cd/WEfCwYtrwJDeE8jn44I3KEK9iaGjGBkzZTwnX9YB0kgcRY+WgiorAtpERA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771239205; c=relaxed/relaxed;
	bh=XKAe0UdH4VvYka3cegfu01NSGhxdoMyut4g2Su5xT9s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kXu0SAuAWOrMCjm9bby87J9ajoNViYPT1j28kab8lhY0ecQaBfdhtsz0hatCgSRUFh7NEXZgDcwNsgqZ2+mmqaL67pLFciA8GSLApXmZmIVAb2M+BNrINKYMnLir4Q07Rcj1JwWdxa5JYWIGYKZmgrMR4xXRfYB0+TmvUIJN9T1KxVx5gz1AHHSboEVAyavG82+fvfnTWUIVhg0xKQKKTDiygWThc+nRFGApfMj4YCekzvJYcoAeQ8ArdmlbPFvH4T/iJ4rW/X1kpPiPrRDZi/Rbeje42uJAcI2PryLJ4enbRhOMO1qbSTXe4/gpuXhXrHb/UXriRMCGkkZYMOzBhA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MnLZPRqD; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MnLZPRqD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fF04N36kGz2xN4
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Feb 2026 21:53:24 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61FM1J5G3669128;
	Mon, 16 Feb 2026 10:53:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=XKAe0UdH4VvYka3ce
	gfu01NSGhxdoMyut4g2Su5xT9s=; b=MnLZPRqDWVPfyibT+uwAEBWUzOS7S1xKw
	io+TbwUZlyAQfgYhOU2syis6+ANyTg4qu+8db6W4IKrfaxXgT6iZfjzZDTT1tV+T
	RCeAcqah360ggy93Uw3tnfgHwGGnVwcF6tJseAXupntO0nxygiCYl266cyJe036B
	Bln5ZhsQEIVWT/Nxqnq0P3krOOPloerfdWxO9IU50NGopLMUGu77g7Wm2+HlENbV
	XXoeZj+NjDmHls1tKEUR2I2FvimHm13q9/6rJtRmOflf6RJ7BPoxnCB47bNit57O
	+cexBMSEgbRfrPRVG1qurnNWBIk896bABD3SDntnhC0MlcRwbmdvg==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cajcj6tnb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Feb 2026 10:53:00 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61G8ehZS029078;
	Mon, 16 Feb 2026 10:52:59 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4cb6314s4m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Feb 2026 10:52:59 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61GAquJu54395200
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Feb 2026 10:52:56 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E5CE32004B;
	Mon, 16 Feb 2026 10:52:55 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9BAD720043;
	Mon, 16 Feb 2026 10:52:53 +0000 (GMT)
Received: from ltcrain4-lp15.ltc.tadn.ibm.com (unknown [9.5.7.39])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 16 Feb 2026 10:52:53 +0000 (GMT)
From: adubey@linux.ibm.com
To: bpf@vger.kernel.org
Cc: hbathini@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, ast@kernel.org,
        daniel@iogearbox.net, andrii@kernel.org, martin.lau@kernel.org,
        eddyz87@gmail.com, yonghong.song@linux.dev, clm@meta.com,
        ihor.solodrai@linux.dev, chleroy@kernel.org,
        Abhishek Dubey <adubey@linux.ibm.com>
Subject: [PATCH 2/3] selftest/bpf: Enable get_func_args and get_func_ip tests on powerpc64
Date: Mon, 16 Feb 2026 10:53:09 -0500
Message-ID: <20260216155310.38457-2-adubey@linux.ibm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260216155310.38457-1-adubey@linux.ibm.com>
References: <20260216155310.38457-1-adubey@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: FFv_YSACmUjl7w-XBH3SiS-oniKgljEB
X-Authority-Analysis: v=2.4 cv=Md9hep/f c=1 sm=1 tr=0 ts=6992f70c cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=VnNF1IyMAAAA:8 a=DqXwyqWM9aSI_JVwGXwA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA5MCBTYWx0ZWRfX0LiVAHaFcwZM
 qqOzTL5L0jKYXwGc3BJoW6pf65y6JgouqRW7rxVllR70sw1R+K0pyLP0WmpWArmeP9iFF3eID+4
 RugzfE7/vxdAWU9ozci3zPLdhM9EvInq+s0jhGTq4ia9blQUrsQSAmi8Lb8U1QivTr/QFnO7aEM
 BQ4ttLaZsK+sNhBpDL9Nec5mYKudZAO6weQq5HMfhK4P//yIz6yRQJVYw+mQ4zQgaTX8B1yDk1g
 KnWpsoQzBTvo0Ju3lJIFHObLMmEeLSXJWwlPdGw38W6evXe/vzc7LJlqemVf7CjhLaxz2OzuiuF
 hh3q2OqMVORGjsFL3plhkxQ9Dy6Eb54va4TdN66EgUAvWMw6MJJKXb+HOjfk/uCflWf52mfSGAe
 piWaTQGb6Vx7MQ+THPI3nlD4JQKn6cEyuT9CDSLenpPJhpWrhDwMdlEDzeZLTJ9DL4peKsHrtrF
 FVIes3yGEGSBV3UtnXg==
X-Proofpoint-GUID: l6LAAxqDsgQDuBuDyPk6V2EOYmOiGqj0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160090
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
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.ibm.com,lists.ozlabs.org,kernel.org,iogearbox.net,gmail.com,linux.dev,meta.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-16880-lists,linuxppc-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[adubey@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:bpf@vger.kernel.org,m:hbathini@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:ast@kernel.org,m:daniel@iogearbox.net,m:andrii@kernel.org,m:martin.lau@kernel.org,m:eddyz87@gmail.com,m:yonghong.song@linux.dev,m:clm@meta.com,m:ihor.solodrai@linux.dev,m:chleroy@kernel.org,m:adubey@linux.ibm.com,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[ibm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid];
	FROM_NEQ_ENVFROM(0.00)[adubey@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 599D9142846
X-Rspamd-Action: no action

From: Abhishek Dubey <adubey@linux.ibm.com>

Allow get_func_args, and get_func_ip fsession selftests to run on powerpc64.

# ./test_progs -t fsession
#135/1   fsession_test/fsession_test:OK
#135/2   fsession_test/fsession_reattach:OK
#135/3   fsession_test/fsession_cookie:OK
#135     fsession_test:OK
Summary: 1/3 PASSED, 0 SKIPPED, 0 FAILED

# ./test_progs -t get_func
#138     get_func_args_test:OK
#139     get_func_ip_test:OK
Summary: 2/0 PASSED, 0 SKIPPED, 0 FAILED

Signed-off-by: Abhishek Dubey <adubey@linux.ibm.com>
---
 tools/testing/selftests/bpf/progs/get_func_args_test.c | 2 +-
 tools/testing/selftests/bpf/progs/get_func_ip_test.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/progs/get_func_args_test.c b/tools/testing/selftests/bpf/progs/get_func_args_test.c
index 180ba5098ca1..5579141ea45e 100644
--- a/tools/testing/selftests/bpf/progs/get_func_args_test.c
+++ b/tools/testing/selftests/bpf/progs/get_func_args_test.c
@@ -167,7 +167,7 @@ int BPF_PROG(tp_test2)
 }
 
 __u64 test7_result = 0;
-#if defined(bpf_target_x86) || defined(bpf_target_arm64)
+#if defined(bpf_target_x86) || defined(bpf_target_arm64) || defined(bpf_target_powerpc64)
 SEC("fsession/bpf_fentry_test1")
 int BPF_PROG(test7)
 {
diff --git a/tools/testing/selftests/bpf/progs/get_func_ip_test.c b/tools/testing/selftests/bpf/progs/get_func_ip_test.c
index 43ff836a8ed8..2558dda4d82c 100644
--- a/tools/testing/selftests/bpf/progs/get_func_ip_test.c
+++ b/tools/testing/selftests/bpf/progs/get_func_ip_test.c
@@ -106,7 +106,7 @@ int BPF_URETPROBE(test8, int ret)
 
 __u64 test9_entry_result = 0;
 __u64 test9_exit_result = 0;
-#if defined(bpf_target_x86) || defined(bpf_target_arm64)
+#if defined(bpf_target_x86) || defined(bpf_target_arm64) || defined(bpf_target_powerpc64)
 SEC("fsession/bpf_fentry_test1")
 int BPF_PROG(test9, int a)
 {
-- 
2.52.0


