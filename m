Return-Path: <linuxppc-dev+bounces-11496-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 48139B3C141
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Aug 2025 18:53:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cD48n0ww8z2yrb;
	Sat, 30 Aug 2025 02:53:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756486409;
	cv=none; b=kCyeEZ+00missEZOE/HSt1nIkcqBv22QRmiKqncOz4x21QaXdE+y/bra0c+JQJchNB2HRdeStPqFVKrY/GrHVGFQaNu1IHloST9Ow3xbCeRMstGhI1SIHfoSJZOyeU/GhlUf0NU/ly4HyKOUxgsi5CXwok+l4L7oRgA5eNEGi31ecR4gzq2yr7UJYGgdTC+yf/TuZ9Qx9IeaSklmBFDTD3NH3Zy5aYYNTxr3+fJDemfQ5qxVzp8D3sOluEdurmKMeEtMsx/FBrYgFFMt6e/BICD0Bb/R+gwKngctnP/jHOYT8znDT0ZYpj2ANOhXMZpwPK4AklRsm0MI7xp7s4A4zg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756486409; c=relaxed/relaxed;
	bh=wlQ/7c3rr2aJ6RJOQVKI6Viuq+AoqlPLvHQiVunbhEM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=buUy9NYCjP+VFYAeUDaj+oFyLLZGE86d+4TokYHmCpLdi/PcheWIoIuZt30dNwTNRxZrRhyKYgOItY6jvsyXl6mevadzsNTvW3XzQx3HKWqhDcE79RyhqHEjirpVV3aH86FI1qvldIoBnwkHzF1xHe11m+1QXg+v3sOntDzKUIFDwkaCdtg5Dm2QSSnECsG/OahsBtx5dADypgv4JD0cqEXSH3cT7qqvmOYi56uB0AZCJSDTJF/rnhPbbMTxOWrCWi8iwwjoW/qcQAhsQTQhXTfcQTS2OkQ14D18Z0v3ZCqliDLBy79bhdMKAxOf+CtSPQ57yFrbqsV2FeXmhZz0oA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bV8oV+uj; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=skb99@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bV8oV+uj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=skb99@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cD48m2ZZLz2yrX
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Aug 2025 02:53:28 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57T8HQTC006066;
	Fri, 29 Aug 2025 16:53:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=wlQ/7c3rr2aJ6RJOQ
	VKI6Viuq+AoqlPLvHQiVunbhEM=; b=bV8oV+ujkRy7ajVWehnsSa6bmca92t1lh
	D7aUk8lXfP6+ZvMQydOu5RCGFNT+VpciYnbQIQvtMLbhwvlJlqz3LObzzPLnvqV6
	yM67jDWVPePVww3dyKrmrB1F9KIztHWIq1jINMmLb58Rkvqd/TubvTO/NZRfkvqb
	E90kltUNQkoVT8bqDON33bBDX98yvZ9qvuyzH/gmroHrJ8+3+x/QG5nMn+06bwCZ
	00cuAKy1jiYMRmBGGcEaZ/LiBy4dK6/bEUmGN9PSnFo4Z0QANAzd5JdPNtgYW0Gx
	VmnHQGW0ifZkDL/97YuiU5/NNYnGIX4t0VlyeUTpcnq4jnTY95bJg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48tuaj5dfa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Aug 2025 16:53:03 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 57TGfafe007210;
	Fri, 29 Aug 2025 16:53:03 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48tuaj5df5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Aug 2025 16:53:03 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57TD5eBL017963;
	Fri, 29 Aug 2025 16:53:02 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 48qtp3tbxg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Aug 2025 16:53:02 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 57TGqwYl50463098
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 29 Aug 2025 16:52:58 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 78CE32004F;
	Fri, 29 Aug 2025 16:52:58 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AD5CB20043;
	Fri, 29 Aug 2025 16:52:46 +0000 (GMT)
Received: from li-621bac4c-27c7-11b2-a85c-c2bf7c4b3c07.ibm.com.com (unknown [9.43.115.92])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 29 Aug 2025 16:52:46 +0000 (GMT)
From: Saket Kumar Bhaskar <skb99@linux.ibm.com>
To: bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: hbathini@linux.ibm.com, sachinpb@linux.ibm.com, venkat88@linux.ibm.com,
        andrii@kernel.org, eddyz87@gmail.com, mykolal@fb.com, ast@kernel.org,
        daniel@iogearbox.net, martin.lau@linux.dev, song@kernel.org,
        yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org,
        sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org,
        christophe.leroy@csgroup.eu, naveen@kernel.org, maddy@linux.ibm.com,
        mpe@ellerman.id.au, npiggin@gmail.com, memxor@gmail.com,
        iii@linux.ibm.com, shuah@kernel.org
Subject: [PATCH bpf-next v2 5/5] selftests/bpf: Fix arena_spin_lock selftest failure
Date: Fri, 29 Aug 2025 22:21:35 +0530
Message-ID: <20250829165135.1273071-6-skb99@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250829165135.1273071-1-skb99@linux.ibm.com>
References: <20250829165135.1273071-1-skb99@linux.ibm.com>
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
X-Proofpoint-GUID: lJPbpMxxCuoUV2wEYR8WIRlW-ihiAIKb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI4MDE0MCBTYWx0ZWRfX3iokaRGCKrjx
 v+MT8ILcp1yH1C7IUl0vluo9d9b6WyKiSU2mhtAXLlSr6PmppMNLhUCLceO+gjz2pvw7t2i1b0j
 7KUz3ZI2HiXJbek1VP2tyc3ZeAIzqJjmk367RuXavsN/JqzpY1H3HPT+6Sr4d5o1k2h4Ix3T9yl
 fnDc+chQ2/AC4LfYBow6zqeFvTHW+ZYXpyFAg7Up99+Bn8GHs7Czm36UVZbWA59eDVHjUKG3OL9
 iOdPK0GjKAmKsnTIKKhsNckqov82hD/sydcqtTYxXe2GZcr2GfuKL1TuscrHBKJ/YYiqvIjkj20
 sJnBzXXu8zZ/B4A0+oK4vJ69GpPnLW7+w3WR1fdEEuCTSyLvgW+mCrfikm53pTgyoxODucKC58u
 d/Ou1h5N
X-Authority-Analysis: v=2.4 cv=YfW95xRf c=1 sm=1 tr=0 ts=68b1daf0 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=2OwXVqhp2XgA:10 a=VnNF1IyMAAAA:8 a=dOPeAGjUFLo6ntbE7XwA:9
X-Proofpoint-ORIG-GUID: ljkqhl2cCsTRUbADYNfMguYbVHlJ4kQl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508280140
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

For systems having CONFIG_NR_CPUS set to > 1024 in kernel config
the selftest fails as arena_spin_lock_irqsave() returns EOPNOTSUPP.

The selftest is skipped incase bpf program returns EOPNOTSUPP,
with a descriptive message logged.

Signed-off-by: Saket Kumar Bhaskar <skb99@linux.ibm.com>
---
 .../selftests/bpf/prog_tests/arena_spin_lock.c      | 13 +++++++++++++
 tools/testing/selftests/bpf/progs/arena_spin_lock.c |  5 ++++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/arena_spin_lock.c b/tools/testing/selftests/bpf/prog_tests/arena_spin_lock.c
index 0223fce4db2b..1ec1ca987893 100644
--- a/tools/testing/selftests/bpf/prog_tests/arena_spin_lock.c
+++ b/tools/testing/selftests/bpf/prog_tests/arena_spin_lock.c
@@ -40,8 +40,13 @@ static void *spin_lock_thread(void *arg)
 
 	err = bpf_prog_test_run_opts(prog_fd, &topts);
 	ASSERT_OK(err, "test_run err");
+
+	if (topts.retval == -EOPNOTSUPP)
+		goto end;
+
 	ASSERT_EQ((int)topts.retval, 0, "test_run retval");
 
+end:
 	pthread_exit(arg);
 }
 
@@ -63,6 +68,7 @@ static void test_arena_spin_lock_size(int size)
 	skel = arena_spin_lock__open_and_load();
 	if (!ASSERT_OK_PTR(skel, "arena_spin_lock__open_and_load"))
 		return;
+
 	if (skel->data->test_skip == 2) {
 		test__skip();
 		goto end;
@@ -86,6 +92,13 @@ static void test_arena_spin_lock_size(int size)
 			goto end_barrier;
 	}
 
+	if (skel->data->test_skip == 2) {
+		printf("%s:SKIP: %d CPUs exceed the maximum supported by arena spinlock\n",
+		       __func__, get_nprocs());
+		test__skip();
+		goto end_barrier;
+	}
+
 	ASSERT_EQ(skel->bss->counter, repeat * nthreads, "check counter value");
 
 end_barrier:
diff --git a/tools/testing/selftests/bpf/progs/arena_spin_lock.c b/tools/testing/selftests/bpf/progs/arena_spin_lock.c
index c4500c37f85e..a475b974438e 100644
--- a/tools/testing/selftests/bpf/progs/arena_spin_lock.c
+++ b/tools/testing/selftests/bpf/progs/arena_spin_lock.c
@@ -37,8 +37,11 @@ int prog(void *ctx)
 #if defined(ENABLE_ATOMICS_TESTS) && defined(__BPF_FEATURE_ADDR_SPACE_CAST)
 	unsigned long flags;
 
-	if ((ret = arena_spin_lock_irqsave(&lock, flags)))
+	if ((ret = arena_spin_lock_irqsave(&lock, flags))) {
+		if (ret == -EOPNOTSUPP)
+			test_skip = 2;
 		return ret;
+	}
 	if (counter != limit)
 		counter++;
 	bpf_repeat(cs_count);
-- 
2.43.5


