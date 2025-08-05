Return-Path: <linuxppc-dev+bounces-10639-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61EF4B1AE48
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Aug 2025 08:29:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bx3Rc4Xnlz3bqP;
	Tue,  5 Aug 2025 16:29:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754375356;
	cv=none; b=TuRnqFOta8bDcnKb4cRHcIY5w+kj584KlMx5scWZcuuCLB+pbWi+NyKhuKtGlCy4p+npWuBbdKwG24S+OqE5lPN8s9gVJN4XPsm0eqbA6mae3R/e3w4TZ1P+4BwyrAZHBPdbkKklLJDAE2W7eHmLWGEdVfi3VtmdD37TADNnwITr+QPo1+AThDhdZBVym1Bq3ARAQWshmn2qVSgQffquPYdZ+UVH+5WTH/NaHlZ1qFVHCIYRi8F8PCNs4oKvtAHYdcJob/EsQbaJUFGoKDs/+hw4ikclRw/75xhftD/MXjEOYL7euVtPSNYDYGTz9Xy/VpojRPLCZknoLlpAQsiNoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754375356; c=relaxed/relaxed;
	bh=v7OKblw0xucwCWLwh8AHjg9A9qvlAn86fZ/L6YQyAcg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JxibZJ+7zY5bWjkEvdsfXETRbcCdY1FX0T7ay04qzfq0S/6wC5YeE+JQxz4jog181gJYiJQWVwb6CbsdAXZDRo/EFKJMlhBt2UBoOWG4WrQH0XnpMFMXkTYV2jn3+8fOm5XohdUSnfmlBH81kFddFEgduXQsqvwDWmIY278TJWtETCTR3sbEy4hTC6SXZlc/ZrHl15Y91uX1xx6l84fWcWikFmW+JkxsO79PlVMt0/dzDOccoxx2jBJCafSolP9cZiqFfbMqi9wlWE2NJTBlQo2c30s70977xsRFiTYJpQNNPB11NqQ7yy9sXWhD6nU8UWh/gCg8yN7RwdYhxNYs2g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qJgEW7D4; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=skb99@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qJgEW7D4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=skb99@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bx3Rb5wHFz3bqM
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Aug 2025 16:29:15 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5754tZcq032572;
	Tue, 5 Aug 2025 06:28:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=v7OKblw0xucwCWLwh
	8AHjg9A9qvlAn86fZ/L6YQyAcg=; b=qJgEW7D4jZQywXjKTqkIH8sEYppO3MUH1
	3NDYlbrWKE10yRXc1rduDYTurdEiILjhPCYb7mQJU6JJpFP36oY5eE7OcYH5zLyS
	8Mj1yIae7GtjO+Omuu8iNb2YSsPWZ1/G1FmlmdBYHw00hvY8Q2GFSt2EqrJGQCcb
	NU2HuCieoDkIVL4Vdc9Sza95U0B25B22Nvr7qgN90UqEMhZkfEqibX7/LwDw0cHl
	eKMjYiNC323Q61uHxkzhdIEy1guc7pAZgrUlTfsFQdWgArc+W0/Qyc7zpMAUkG2G
	Y3/IbCdXeGwEdEzd7zHlnkBHDdfb2RSDq64U7WMLoZNFYH+If6fdg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48bbbq09v0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Aug 2025 06:28:51 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5756SpDh018514;
	Tue, 5 Aug 2025 06:28:51 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48bbbq09uw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Aug 2025 06:28:51 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5754NkDb009584;
	Tue, 5 Aug 2025 06:28:50 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 489x0p16fk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Aug 2025 06:28:50 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5756Sk4k33358382
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 5 Aug 2025 06:28:46 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3B7C920040;
	Tue,  5 Aug 2025 06:28:46 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8934B20043;
	Tue,  5 Aug 2025 06:28:39 +0000 (GMT)
Received: from li-621bac4c-27c7-11b2-a85c-c2bf7c4b3c07.ibm.com.com (unknown [9.43.39.141])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  5 Aug 2025 06:28:39 +0000 (GMT)
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
Subject: [bpf-next 6/6] selftests/bpf: Fix arena_spin_lock selftest failure
Date: Tue,  5 Aug 2025 11:57:47 +0530
Message-ID: <20250805062747.3479221-7-skb99@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250805062747.3479221-1-skb99@linux.ibm.com>
References: <20250805062747.3479221-1-skb99@linux.ibm.com>
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
X-Proofpoint-GUID: MHtfuhSBX86H1GS-EDUE7_iMFDkm4UOi
X-Authority-Analysis: v=2.4 cv=M65NKzws c=1 sm=1 tr=0 ts=6891a4a3 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=2OwXVqhp2XgA:10 a=VnNF1IyMAAAA:8 a=JZnv35P8lLju3lMB9JkA:9
X-Proofpoint-ORIG-GUID: RLgM9aYmcIzILwAR7Iotf-RVGtxWO2zm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDA0NSBTYWx0ZWRfX1K7J+oUmd5nL
 mfCZkWQLhWPVY9M222gUMff3yf4Zg+BRL0jXdtdHhtkRVXWByE6K8Uh1KpHEC7LoLklxpQGD/r9
 hIimr1BHSV7ECIDd6qkwC4BRM/cedilc7J58riP9sgBy/RBTa31HyO4ui6C7VHH/gohDCwhI3AL
 3krUVIZFugLWIcW3NsTJAIzSAQh8/ddSezjMSMmPZRPQep/931tnHC+X+0HOfPH83KwVp/82iUP
 F7z6aVpGcFdwdZeaSOuSQW+zdompotUc+Q34c3lO5X8yREM553guktYZzyAksnNR2ToJybF33kn
 zAvMFtPrgIdtWoWhJ32V3HR9xtldl8cJssl1j0X8D2MgUVn2Yxb43rla10I6c0JNNOG7cDxbBjW
 34enIJSqdMAGf20IWycsqEe9nNXw2euxgZ98BCDMleohl3EHgxqVI3Br6cMRfzxWpOQswMIa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_01,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 mlxscore=0 phishscore=0 priorityscore=1501
 mlxlogscore=999 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508050045
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

For systems having CONFIG_NR_CPUS set to > 1024 in kernel config
the selftest fails even though the current number of online cpus
is less. For example, on powerpc the default value for
CONFIG_NR_CPUS is set to 8192.

get_nprocs() is used to get the number of available cpus in test
driver code and the same is passed to the bpf program using rodata.

Also the selftest is skipped incase bpf program returns EOPNOTSUPP,
with a descriptive message logged.

Signed-off-by: Saket Kumar Bhaskar <skb99@linux.ibm.com>
---
 .../bpf/prog_tests/arena_spin_lock.c          | 23 +++++++++++++++++--
 .../selftests/bpf/progs/arena_spin_lock.c     |  8 ++++++-
 .../selftests/bpf/progs/bpf_arena_spin_lock.h |  4 +---
 3 files changed, 29 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/arena_spin_lock.c b/tools/testing/selftests/bpf/prog_tests/arena_spin_lock.c
index 0223fce4db2b..fa0b4f0240a3 100644
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
 
@@ -60,9 +65,16 @@ static void test_arena_spin_lock_size(int size)
 		return;
 	}
 
-	skel = arena_spin_lock__open_and_load();
-	if (!ASSERT_OK_PTR(skel, "arena_spin_lock__open_and_load"))
+	skel = arena_spin_lock__open();
+	if (!ASSERT_OK_PTR(skel, "arena_spin_lock__open"))
 		return;
+
+	skel->rodata->nr_cpus = get_nprocs();
+
+	err = arena_spin_lock__load(skel);
+	if (!ASSERT_OK(err, "arena_spin_lock__load"))
+		goto end;
+
 	if (skel->data->test_skip == 2) {
 		test__skip();
 		goto end;
@@ -86,6 +98,13 @@ static void test_arena_spin_lock_size(int size)
 			goto end_barrier;
 	}
 
+	if (skel->data->test_skip == 2) {
+		printf("%s:SKIP: %d online CPUs exceed the maximum supported by arena spinlock\n",
+		       __func__, get_nprocs());
+		test__skip();
+		goto end_barrier;
+	}
+
 	ASSERT_EQ(skel->bss->counter, repeat * nthreads, "check counter value");
 
 end_barrier:
diff --git a/tools/testing/selftests/bpf/progs/arena_spin_lock.c b/tools/testing/selftests/bpf/progs/arena_spin_lock.c
index c4500c37f85e..9ed5a3281fd4 100644
--- a/tools/testing/selftests/bpf/progs/arena_spin_lock.c
+++ b/tools/testing/selftests/bpf/progs/arena_spin_lock.c
@@ -4,6 +4,9 @@
 #include <bpf/bpf_tracing.h>
 #include <bpf/bpf_helpers.h>
 #include "bpf_misc.h"
+
+const volatile int nr_cpus;
+
 #include "bpf_arena_spin_lock.h"
 
 struct {
@@ -37,8 +40,11 @@ int prog(void *ctx)
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
diff --git a/tools/testing/selftests/bpf/progs/bpf_arena_spin_lock.h b/tools/testing/selftests/bpf/progs/bpf_arena_spin_lock.h
index d67466c1ff77..752131161315 100644
--- a/tools/testing/selftests/bpf/progs/bpf_arena_spin_lock.h
+++ b/tools/testing/selftests/bpf/progs/bpf_arena_spin_lock.h
@@ -20,8 +20,6 @@
 #define __arena __attribute__((address_space(1)))
 #endif
 
-extern unsigned long CONFIG_NR_CPUS __kconfig;
-
 /*
  * Typically, we'd just rely on the definition in vmlinux.h for qspinlock, but
  * PowerPC overrides the definition to define lock->val as u32 instead of
@@ -494,7 +492,7 @@ static __always_inline int arena_spin_lock(arena_spinlock_t __arena *lock)
 {
 	int val = 0;
 
-	if (CONFIG_NR_CPUS > 1024)
+	if (nr_cpus > 1024)
 		return -EOPNOTSUPP;
 
 	bpf_preempt_disable();
-- 
2.43.5


