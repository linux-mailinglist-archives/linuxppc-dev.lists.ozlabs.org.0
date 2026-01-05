Return-Path: <linuxppc-dev+bounces-15250-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E37F0CF3119
	for <lists+linuxppc-dev@lfdr.de>; Mon, 05 Jan 2026 11:53:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dlB3c1tS4z2yCL;
	Mon, 05 Jan 2026 21:53:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767610396;
	cv=none; b=FsN73HEfwJa8eShJUVl+A9mWn1jv+MKTPnCJfUKRKXCp9q1fL7dXOyNPjMtlR7c6brmYIG6PQEI50TzTVduZbV8lQtrhRTJTPhoE56RflVsZzP04DkAS7t15RxRPN9XAz6MBTvoN7WnLS7fXg6pPDFyTwmzDxFegBBgjbkgYZTxENoU6XDBr17kLpavqAfVR9ZzCvNSSvIzCSqr+i5yO1cIL7p7bQb/u441PFy9sXXxNtLitYI/2nnR5C6SSr/kWN1WlAOsLEygeVm0v8202SFxI1VPtYCf3FUsGe3nbFevOLZv7EId/t5VguUB7FHi8KMthutLJlJm9aDFDltSkeg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767610396; c=relaxed/relaxed;
	bh=1Ch459TmqXBIPON/FrdLOd7rTgxg4aff4Ts6ksixOXE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mJlVgbUi/gFtpkzLYrptNuJMJE92rwQIDU6lGSzspF92qzAdztk3Hf1CHbmUEYUazjVHaCPv9IJrP8+7R0ZKFriWVvVk+XIWk/EGZqeBzkT487/xOAYybukBSoKD4lFI5Z83s9XWfvC6PanvDgVlXDLDPNhU7VCZDcqZ1L2knYlnW7fnzcMzIRXeMK59W0m9xN3hSac434PQKJ/012EP90Wpqw5AONRhrfpC4E+NrMlPHABOq8bP+/uHlfJBZuhX4yUJuUXtHhScXxVUNzkhGFoS1IwaS3bY7ke6cF3/EQggb1g4f3BraxotD5PZbFxNBg1Vn8K4C5xUacOHfapJUA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eXk1t0wH; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eXk1t0wH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dlB3Z4QnKz2xqG
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jan 2026 21:53:13 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 605AKF0n028393;
	Mon, 5 Jan 2026 10:53:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=1Ch459TmqXBIPON/F
	rdLOd7rTgxg4aff4Ts6ksixOXE=; b=eXk1t0wH+Or63fDYasmaV9vcP4d9zX+SX
	pA6HXoTSORZeCrDThc8DBtVPLj8ODlRzytSmjd7MvJM8b3H3cADH8AB8MzkvYrsk
	8Tvq84H95Qgwo0gpi80xi4XlC+dVEXjtVoz+qszIYPQmAQcbl3HARQnlYu1e+7T1
	oM6WwLZrLRvtLk3qLWfhHtMnLSyP8JWUIls2CSpbFLImKBDyN67Y5fLheb8vKhZW
	FC0clK/Dizexk0E/zeoYw02omaNAMpGE/Pk4fvSXqRcpK4MjF8JvBeGxRNNOUts8
	PLIExMmpTKoyglTcHD/9BgXPSdjH7cguopKmnlZwc7WmJBr+9eGgw==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4betrte68t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Jan 2026 10:53:10 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 605ACNBw023487;
	Mon, 5 Jan 2026 10:53:10 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4bg3rm1vxq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Jan 2026 10:53:09 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 605Ar8dI50397668
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 Jan 2026 10:53:08 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DDCC82004B;
	Mon,  5 Jan 2026 10:53:07 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F16AC20040;
	Mon,  5 Jan 2026 10:53:01 +0000 (GMT)
Received: from abhi.. (unknown [9.124.213.127])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  5 Jan 2026 10:53:01 +0000 (GMT)
From: adubey@linux.ibm.com
To: bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: hbathini@linux.ibm.com, sachinpb@linux.ibm.com, venkat88@linux.ibm.com,
        andrii@kernel.org, eddyz87@gmail.com, mykolal@fb.com, ast@kernel.org,
        daniel@iogearbox.net, martin.lau@linux.dev, song@kernel.org,
        yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org,
        sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org,
        christophe.leroy@csgroup.eu, naveen@kernel.org, maddy@linux.ibm.com,
        mpe@ellerman.id.au, npiggin@gmail.com, memxor@gmail.com,
        iii@linux.ibm.com, shuah@kernel.org,
        Abhishek Dubey <adubey@linux.ibm.com>
Subject: [PATCH 5/6] powerpc64/bpf: Support exceptions
Date: Mon,  5 Jan 2026 16:22:11 +0530
Message-ID: <20260105105212.136645-6-adubey@linux.ibm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260105105212.136645-1-adubey@linux.ibm.com>
References: <20260105105212.136645-1-adubey@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=aaJsXBot c=1 sm=1 tr=0 ts=695b9816 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=DU0EyFXtAAAA:8 a=VnNF1IyMAAAA:8
 a=6hNtxff-4WC3rVPnFXsA:9 a=UCR5be5CC-YrbG9FbbB0:22
X-Proofpoint-GUID: 2tmgi0fkjpV-W-oQLTgztyuvNsfasF8d
X-Proofpoint-ORIG-GUID: 2tmgi0fkjpV-W-oQLTgztyuvNsfasF8d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDA5NSBTYWx0ZWRfX1dM2ENzClrAH
 HERnCj62mrLk7oS+7Sbx0MIbm/Ql0UpSdX/1dB6055lXdHA2bkCb+/fJWboP0W4FBN6xxk27lDo
 c7cPMDHN5vN8a/wTtcISqBs5RPopGGFP1DEviJlkTMYIWgxtT0EOgf/ooNir7KLRlx4IZkZbRFC
 5wCjzayns0KxUTGYZuLJZswhiBRjVTWfoBx/AMaRlf+PUaEyMG30kScdkz9bqPa9modIbVrvHYQ
 l1GyPfMafGyH4/GL4gH0lQsRPZVWo1LhBVDkHzXic7lEq6pDG9+W2/qrGUaF7k+Bkgy7PTZGsaR
 xcdR7kjzBaRkdlnOkQQh+Bv9l2Ni2pnVCtDvVKPhn634gFM/LYp1NEex75NZmKYdSmAdW5GV1dB
 cEQxwuVUsEZx0NN8TrVZWa32/e/cabFUpjSJUX4zLoJijbtIsd3p4QYJJ8DltR9tGPL2p23MWLR
 Yme2OdpVnf8y+ASjB8w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2512120000 definitions=main-2601050095
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Abhishek Dubey <adubey@linux.ibm.com>

The modified prologue/epilogue generation code now
enables exception-callback to use the stack frame of
the program marked as exception boundary, where callee
saved registers are stored.

As per ppc64 ABIv2 documentation[1], r14-r31 are callee
saved registers. BPF programs on ppc64 already saves
r26-r31 registers. Saving the remaining set of callee
saved registers(r14-r25) is handled in the next patch.

[1] https://ftp.rtems.org/pub/rtems/people/sebh/ABI64BitOpenPOWERv1.1_16July2015_pub.pdf

Following is exceptions selftest result on ppc64le:

# ./test_progs -t exceptions
#100/1   exceptions/exception_throw_always_1:OK
#100/2   exceptions/exception_throw_always_2:OK
#100/3   exceptions/exception_throw_unwind_1:OK
#100/4   exceptions/exception_throw_unwind_2:OK
#100/5   exceptions/exception_throw_default:OK
#100/6   exceptions/exception_throw_default_value:OK
#100/7   exceptions/exception_tail_call:OK
#100/8   exceptions/exception_ext:OK
#100/9   exceptions/exception_ext_mod_cb_runtime:OK
#100/10  exceptions/exception_throw_subprog:OK
#100/11  exceptions/exception_assert_nz_gfunc:OK
#100/12  exceptions/exception_assert_zero_gfunc:OK
#100/13  exceptions/exception_assert_neg_gfunc:OK
#100/14  exceptions/exception_assert_pos_gfunc:OK
#100/15  exceptions/exception_assert_negeq_gfunc:OK
#100/16  exceptions/exception_assert_poseq_gfunc:OK
#100/17  exceptions/exception_assert_nz_gfunc_with:OK
#100/18  exceptions/exception_assert_zero_gfunc_with:OK
#100/19  exceptions/exception_assert_neg_gfunc_with:OK
#100/20  exceptions/exception_assert_pos_gfunc_with:OK
#100/21  exceptions/exception_assert_negeq_gfunc_with:OK
#100/22  exceptions/exception_assert_poseq_gfunc_with:OK
#100/23  exceptions/exception_bad_assert_nz_gfunc:OK
#100/24  exceptions/exception_bad_assert_zero_gfunc:OK
#100/25  exceptions/exception_bad_assert_neg_gfunc:OK
#100/26  exceptions/exception_bad_assert_pos_gfunc:OK
#100/27  exceptions/exception_bad_assert_negeq_gfunc:OK
#100/28  exceptions/exception_bad_assert_poseq_gfunc:OK
#100/29  exceptions/exception_bad_assert_nz_gfunc_with:OK
#100/30  exceptions/exception_bad_assert_zero_gfunc_with:OK
#100/31  exceptions/exception_bad_assert_neg_gfunc_with:OK
#100/32  exceptions/exception_bad_assert_pos_gfunc_with:OK
#100/33  exceptions/exception_bad_assert_negeq_gfunc_with:OK
#100/34  exceptions/exception_bad_assert_poseq_gfunc_with:OK
#100/35  exceptions/exception_assert_range:OK
#100/36  exceptions/exception_assert_range_with:OK
#100/37  exceptions/exception_bad_assert_range:OK
#100/38  exceptions/exception_bad_assert_range_with:OK
#100/39  exceptions/non-throwing fentry -> exception_cb:OK
#100/40  exceptions/throwing fentry -> exception_cb:OK
#100/41  exceptions/non-throwing fexit -> exception_cb:OK
#100/42  exceptions/throwing fexit -> exception_cb:OK
#100/43  exceptions/throwing extension (with custom cb) -> exception_cb:OK
#100/44  exceptions/throwing extension -> global func in exception_cb:OK
#100/45  exceptions/exception_ext_mod_cb_runtime:OK
#100/46  exceptions/throwing extension (with custom cb) -> global func in exception_cb:OK
#100/47  exceptions/exception_ext:OK
#100/48  exceptions/non-throwing fentry -> non-throwing subprog:OK
#100/49  exceptions/throwing fentry -> non-throwing subprog:OK
#100/50  exceptions/non-throwing fentry -> throwing subprog:OK
#100/51  exceptions/throwing fentry -> throwing subprog:OK
#100/52  exceptions/non-throwing fexit -> non-throwing subprog:OK
#100/53  exceptions/throwing fexit -> non-throwing subprog:OK
#100/54  exceptions/non-throwing fexit -> throwing subprog:OK
#100/55  exceptions/throwing fexit -> throwing subprog:OK
#100/56  exceptions/non-throwing fmod_ret -> non-throwing subprog:OK
#100/57  exceptions/non-throwing fmod_ret -> non-throwing global subprog:OK
#100/58  exceptions/non-throwing extension -> non-throwing subprog:OK
#100/59  exceptions/non-throwing extension -> throwing subprog:OK
#100/60  exceptions/non-throwing extension -> non-throwing subprog:OK
#100/61  exceptions/non-throwing extension -> throwing global subprog:OK
#100/62  exceptions/throwing extension -> throwing global subprog:OK
#100/63  exceptions/throwing extension -> non-throwing global subprog:OK
#100/64  exceptions/non-throwing extension -> main subprog:OK
#100/65  exceptions/throwing extension -> main subprog:OK
#100/66  exceptions/reject_exception_cb_type_1:OK
#100/67  exceptions/reject_exception_cb_type_2:OK
#100/68  exceptions/reject_exception_cb_type_3:OK
#100/69  exceptions/reject_exception_cb_type_4:OK
#100/70  exceptions/reject_async_callback_throw:OK
#100/71  exceptions/reject_with_lock:OK
#100/72  exceptions/reject_subprog_with_lock:OK
#100/73  exceptions/reject_with_rcu_read_lock:OK
#100/74  exceptions/reject_subprog_with_rcu_read_lock:OK
#100/75  exceptions/reject_with_rbtree_add_throw:OK
#100/76  exceptions/reject_with_reference:OK
#100/77  exceptions/reject_with_cb_reference:OK
#100/78  exceptions/reject_with_cb:OK
#100/79  exceptions/reject_with_subprog_reference:OK
#100/80  exceptions/reject_throwing_exception_cb:OK
#100/81  exceptions/reject_exception_cb_call_global_func:OK
#100/82  exceptions/reject_exception_cb_call_static_func:OK
#100/83  exceptions/reject_multiple_exception_cb:OK
#100/84  exceptions/reject_exception_throw_cb:OK
#100/85  exceptions/reject_exception_throw_cb_diff:OK
#100/86  exceptions/reject_set_exception_cb_bad_ret1:OK
#100/87  exceptions/reject_set_exception_cb_bad_ret2:OK
#100/88  exceptions/check_assert_eq_int_min:OK
#100/89  exceptions/check_assert_eq_int_max:OK
#100/90  exceptions/check_assert_eq_zero:OK
#100/91  exceptions/check_assert_eq_llong_min:OK
#100/92  exceptions/check_assert_eq_llong_max:OK
#100/93  exceptions/check_assert_lt_pos:OK
#100/94  exceptions/check_assert_lt_zero:OK
#100/95  exceptions/check_assert_lt_neg:OK
#100/96  exceptions/check_assert_le_pos:OK
#100/97  exceptions/check_assert_le_zero:OK
#100/98  exceptions/check_assert_le_neg:OK
#100/99  exceptions/check_assert_gt_pos:OK
#100/100 exceptions/check_assert_gt_zero:OK
#100/101 exceptions/check_assert_gt_neg:OK
#100/102 exceptions/check_assert_ge_pos:OK
#100/103 exceptions/check_assert_ge_zero:OK
#100/104 exceptions/check_assert_ge_neg:OK
#100/105 exceptions/check_assert_range_s64:OK
#100/106 exceptions/check_assert_range_u64:OK
#100/107 exceptions/check_assert_single_range_s64:OK
#100/108 exceptions/check_assert_single_range_u64:OK
#100/109 exceptions/check_assert_generic:OK
#100/110 exceptions/check_assert_with_return:OK
#100     exceptions:OK
Summary: 1/110 PASSED, 0 SKIPPED, 0 FAILED

Signed-off-by: Abhishek Dubey <adubey@linux.ibm.com>
---
 arch/powerpc/net/bpf_jit.h        |  2 ++
 arch/powerpc/net/bpf_jit_comp.c   |  7 ++++
 arch/powerpc/net/bpf_jit_comp64.c | 53 +++++++++++++++++++++----------
 3 files changed, 45 insertions(+), 17 deletions(-)

diff --git a/arch/powerpc/net/bpf_jit.h b/arch/powerpc/net/bpf_jit.h
index 98e8b1f9c2f9..b9316780a501 100644
--- a/arch/powerpc/net/bpf_jit.h
+++ b/arch/powerpc/net/bpf_jit.h
@@ -177,6 +177,8 @@ struct codegen_context {
 	u64 arena_vm_start;
 	u64 user_vm_start;
 	bool is_subprog;
+	bool exception_boundary;
+	bool exception_cb;
 };
 
 #define bpf_to_ppc(r)	(ctx->b2p[r])
diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
index b09d294084d4..3c030a7d8e73 100644
--- a/arch/powerpc/net/bpf_jit_comp.c
+++ b/arch/powerpc/net/bpf_jit_comp.c
@@ -207,6 +207,8 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
 	cgctx.arena_vm_start = bpf_arena_get_kern_vm_start(fp->aux->arena);
 	cgctx.user_vm_start = bpf_arena_get_user_vm_start(fp->aux->arena);
 	cgctx.is_subprog = bpf_is_subprog(fp);
+	cgctx.exception_boundary = fp->aux->exception_boundary;
+	cgctx.exception_cb = fp->aux->exception_cb;
 
 	/* Scouting faux-generate pass 0 */
 	if (bpf_jit_build_body(fp, NULL, NULL, &cgctx, addrs, 0, false)) {
@@ -436,6 +438,11 @@ void bpf_jit_free(struct bpf_prog *fp)
 	bpf_prog_unlock_free(fp);
 }
 
+bool bpf_jit_supports_exceptions(void)
+{
+       return IS_ENABLED(CONFIG_PPC64);
+}
+
 bool bpf_jit_supports_subprog_tailcalls(void)
 {
 	return IS_ENABLED(CONFIG_PPC64);
diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
index 0f3af67914d6..5ec8e3654098 100644
--- a/arch/powerpc/net/bpf_jit_comp64.c
+++ b/arch/powerpc/net/bpf_jit_comp64.c
@@ -85,7 +85,9 @@ static inline bool bpf_has_stack_frame(struct codegen_context *ctx)
 	 * - the bpf program uses its stack area
 	 * The latter condition is deduced from the usage of BPF_REG_FP
 	 */
-	return ctx->seen & SEEN_FUNC || bpf_is_seen_register(ctx, bpf_to_ppc(BPF_REG_FP));
+	return ctx->seen & SEEN_FUNC ||
+	       bpf_is_seen_register(ctx, bpf_to_ppc(BPF_REG_FP)) ||
+	       ctx->exception_cb;
 }
 
 /*
@@ -180,23 +182,32 @@ void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx)
 		EMIT(PPC_RAW_STDU(_R1, _R1, -(BPF_PPC_STACKFRAME + ctx->stack_size)));
 	}
 
-	/*
-	 * Back up non-volatile regs -- BPF registers 6-10
-	 * If we haven't created our own stack frame, we save these
-	 * in the protected zone below the previous stack frame
-	 */
-	for (i = BPF_REG_6; i <= BPF_REG_10; i++)
-		if (bpf_is_seen_register(ctx, bpf_to_ppc(i)))
-			EMIT(PPC_RAW_STD(bpf_to_ppc(i), _R1, bpf_jit_stack_offsetof(ctx, bpf_to_ppc(i))));
+	if (!ctx->exception_cb) {
+		/*
+		 * Back up non-volatile regs -- BPF registers 6-10
+		 * If we haven't created our own stack frame, we save these
+		 * in the protected zone below the previous stack frame
+		 */
+		for (i = BPF_REG_6; i <= BPF_REG_10; i++)
+			if (ctx->exception_boundary || bpf_is_seen_register(ctx, bpf_to_ppc(i)))
+				EMIT(PPC_RAW_STD(bpf_to_ppc(i), _R1,
+					bpf_jit_stack_offsetof(ctx, bpf_to_ppc(i))));
 
-	if (ctx->arena_vm_start)
-		EMIT(PPC_RAW_STD(bpf_to_ppc(ARENA_VM_START), _R1,
+		if (ctx->exception_boundary || ctx->arena_vm_start)
+			EMIT(PPC_RAW_STD(bpf_to_ppc(ARENA_VM_START), _R1,
 				 bpf_jit_stack_offsetof(ctx, bpf_to_ppc(ARENA_VM_START))));
 
-	/* Setup frame pointer to point to the bpf stack area */
-	if (bpf_is_seen_register(ctx, bpf_to_ppc(BPF_REG_FP)))
-		EMIT(PPC_RAW_ADDI(bpf_to_ppc(BPF_REG_FP), _R1,
+		/* Setup frame pointer to point to the bpf stack area */
+		if (bpf_is_seen_register(ctx, bpf_to_ppc(BPF_REG_FP)))
+			EMIT(PPC_RAW_ADDI(bpf_to_ppc(BPF_REG_FP), _R1,
 				STACK_FRAME_MIN_SIZE + ctx->stack_size));
+	} else {
+		/*
+		 * Exception callback receives Frame Pointer of main
+		 * program as third arg
+		 */
+		EMIT(PPC_RAW_MR(_R1, _R5));
+        }
 
 	if (ctx->arena_vm_start)
 		PPC_LI64(bpf_to_ppc(ARENA_VM_START), ctx->arena_vm_start);
@@ -208,17 +219,25 @@ static void bpf_jit_emit_common_epilogue(u32 *image, struct codegen_context *ctx
 
 	/* Restore NVRs */
 	for (i = BPF_REG_6; i <= BPF_REG_10; i++)
-		if (bpf_is_seen_register(ctx, bpf_to_ppc(i)))
+		if (ctx->exception_cb || bpf_is_seen_register(ctx, bpf_to_ppc(i)))
 			EMIT(PPC_RAW_LD(bpf_to_ppc(i), _R1, bpf_jit_stack_offsetof(ctx, bpf_to_ppc(i))));
 
-	if (ctx->arena_vm_start)
+	if (ctx->exception_cb || ctx->arena_vm_start)
 		EMIT(PPC_RAW_LD(bpf_to_ppc(ARENA_VM_START), _R1,
 				bpf_jit_stack_offsetof(ctx, bpf_to_ppc(ARENA_VM_START))));
 
+	if (ctx->exception_cb) {
+		/*
+		 * LR value from boundary-frame is received as second parameter
+		 * in exception callback.
+		 */
+		EMIT(PPC_RAW_MTLR(_R4));
+	}
+
 	/* Tear down our stack frame */
 	if (bpf_has_stack_frame(ctx)) {
 		EMIT(PPC_RAW_ADDI(_R1, _R1, BPF_PPC_STACKFRAME + ctx->stack_size));
-		if (ctx->seen & SEEN_FUNC) {
+		if (ctx->seen & SEEN_FUNC || ctx->exception_cb) {
 			EMIT(PPC_RAW_LD(_R0, _R1, PPC_LR_STKOFF));
 			EMIT(PPC_RAW_MTLR(_R0));
 		}
-- 
2.48.1


