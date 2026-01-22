Return-Path: <linuxppc-dev+bounces-16152-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ePSKNTtXcmkpiwAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16152-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jan 2026 17:58:35 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E03DE6A843
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jan 2026 17:58:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dxnMD1csDz2yql;
	Fri, 23 Jan 2026 03:58:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769101112;
	cv=none; b=XCMaqy741zEZ7Vc6DQSGjE7olM3Tw4O+aOB9Gg2Zt+x2N0wfZH3PtYEaeAjCjRI+wNzCcnj1BG03aziFNXojeO2cBtAjCWiAda86XrBqMhhz1kxg9VgXO8Y6qh/o//mS6q0Zjx3i11M5SfIflepmGUVAAnLPAisJv4ZN5dvfVqPWFvIwUYsj1lNeTWmfwdALNfcgrpMVURPk4sttFTUmayIFI2GfjXROSp9pLY9hjYjh5uErr0/wuUokA2Bo8l8S9QWnLf26eVA+MNOsIwBbp0kCG52xXTL9BWxU4ijES3dtINUHoMtL3oWCMNyVkrOwupqYZ9O3CotUH8KSBDEj+w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769101112; c=relaxed/relaxed;
	bh=sK0RzPLBtd5/Vgml1Md2BGiyAp1ZFl20b9r6NdIl3cY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UVTmbp8xznQRO2Rq4W9fIR0XGRzpKO912BIfrnfegHlLHsG3WXT6vtWKdzuth20XvlDJjr5E2pSFMxxOHFJD0SJlHAMljQz5NOcKRyJ2wJXbI3fWPEVjvA6BEmTqnkNPOv6LqKKJjkpFYO7QyId3cZlyrTJCdOFNghEGm6GfFwzSfbLFRVnxbQwsBuQfQ7+dvX6vBEMbIZspmH/rKdTCNuAmMSyczwtzMKYcHVoMtF+SFOUCws+uezKveJ/rdROBAwB/AScrGBTwPZyDelNv5I/e4+bRh7nHbfaFJ9IIgspM5XJIKUDf8f8PAzN+4N+2DpikmlkT/hL7FphQyDPJeQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=J5ZDfDxA; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=J5ZDfDxA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dxnMC1X3Wz2xl0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jan 2026 03:58:30 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60ME76dM019581;
	Thu, 22 Jan 2026 16:57:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=sK0RzPLBtd5/Vgml1Md2BGiyAp1ZFl20b9r6NdIl3
	cY=; b=J5ZDfDxAVCRFkBTe0vH7kQdFnsDwFdgCRrLG8bzQNh9GeoL1UhR4osJEv
	tSpjEISKJg+rqP4pnppwJGS193tsayxysKJ9geSjlZ7FPmnq1QWNeGz+zB/9+DIH
	7nJuyacDlIgN37JJbuthFi7kPo+gQ+kc9ml1pJoF3kIsFJ8U24VzlX3cvthx2DVX
	bnwe6IcPQRmhVGXYlcq+MEh/Ph7o+iFYNtUvtlb6ZPLP9qZUJRjgUjO/1Z6OplS8
	mQAJ9ZztsmKTDITwqCwJ+CmDMcLXs0KKWsySMqkBr1WlGllEsAdjjKbDSEWYKG4m
	jD+fs1kzseQFILpKquG+PrXtfoUpQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4br256axtw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Jan 2026 16:57:54 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 60MGvrpI005435;
	Thu, 22 Jan 2026 16:57:53 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4br256axtq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Jan 2026 16:57:53 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60MGjKO1009265;
	Thu, 22 Jan 2026 16:57:52 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4brp8kkd6b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Jan 2026 16:57:51 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60MGvlfx61473072
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 22 Jan 2026 16:57:47 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B01BD2004E;
	Thu, 22 Jan 2026 16:57:47 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F11BE20043;
	Thu, 22 Jan 2026 16:57:38 +0000 (GMT)
Received: from abhi.. (unknown [9.39.26.73])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 22 Jan 2026 16:57:38 +0000 (GMT)
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
Subject: [PATCH v3 0/6] powerpc64/bpf: Support tailcalls with subprogs & BPF exceptions
Date: Thu, 22 Jan 2026 22:27:10 +0530
Message-ID: <20260122165716.10508-1-adubey@linux.ibm.com>
X-Mailer: git-send-email 2.48.1
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDEyOSBTYWx0ZWRfX6s30fZC/NhV6
 OZvilTEC+HyDCxRuEiNpw1edPgx54N0BST3BLufSnH4UmNBFIATTaE3UBJxjTDagh544SF5h4xd
 DiYDOGHqqZLF3HfLptObTDck5AxfFtiuxAOtcEHFpyw2PMNDoTpUu06fiQyJI2/v+pkTUGwHssG
 aMpimOVvobNbSteomMo4xHpZDP+DRA3KCaXnXAjCtQkLIN6Cz4vVAnEG2ktqKO+4LyCz6mSptAE
 mRUM2UFpaXTQLs6GhZjdMP2xys7nWPkdi+0PLt9jVaMePCsoHhK8OgrWRv1eaCcHa504IL3jIJ3
 RRVqidbI78MGfX/JPfS9oVd1Gv6eARqQxNoI9nGcbjrsFD2k8jv9M2DmVK9TLbCVkMrSAojjUad
 WYWG+0g0RTViRT+YNZOOrIL1gRHrNHBnPGXHwIf+1cv7j8Xrwxb7r52AdtZs4vp0bAxIEikvZe/
 Bg9jTWVgXtwO8qromsQ==
X-Authority-Analysis: v=2.4 cv=BpSQAIX5 c=1 sm=1 tr=0 ts=69725712 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=iIzsfX1pHA8hvRYzEnUA:9
X-Proofpoint-GUID: KuW7bYMegJz6bkt5gO4fMccP2vX7PUGb
X-Proofpoint-ORIG-GUID: FRur8Q3Dy1cPBvQqZULQJ_HZTf5j09_J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_03,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2601150000
 definitions=main-2601220129
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16152-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bpf@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kselftest@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:hbathini@linux.ibm.com,m:sachinpb@linux.ibm.com,m:venkat88@linux.ibm.com,m:andrii@kernel.org,m:eddyz87@gmail.com,m:mykolal@fb.com,m:ast@kernel.org,m:daniel@iogearbox.net,m:martin.lau@linux.dev,m:song@kernel.org,m:yonghong.song@linux.dev,m:john.fastabend@gmail.com,m:kpsingh@kernel.org,m:sdf@fomichev.me,m:haoluo@google.com,m:jolsa@kernel.org,m:christophe.leroy@csgroup.eu,m:naveen@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:memxor@gmail.com,m:iii@linux.ibm.com,m:shuah@kernel.org,m:adubey@linux.ibm.com,m:johnfastabend@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORGED_SENDER(0.00)[adubey@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[linux.ibm.com,kernel.org,gmail.com,fb.com,iogearbox.net,linux.dev,fomichev.me,google.com,csgroup.eu,ellerman.id.au];
	DKIM_TRACE(0.00)[ibm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[adubey@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: E03DE6A843
X-Rspamd-Action: no action

From: Abhishek Dubey <adubey@linux.ibm.com>

This patch series enables support for two BPF JIT features
on powerpc64. The first three patches target support for
tail calls with subprogram combinations. The first patch
supports realignment of tail_call_cnt offset in stack frame.
Implementation details are provided in the commit messages.

The last three patches add support for BPF exceptions. An
architecture-specific stack walker is implemented to assist
with stack walk during exceptions.

All selftests related to tailcalls and exceptions are passing:

# ./test_progs -t tailcalls
#442/1   tailcalls/tailcall_1:OK
#442/2   tailcalls/tailcall_2:OK
#442/3   tailcalls/tailcall_3:OK
#442/4   tailcalls/tailcall_4:OK
#442/5   tailcalls/tailcall_5:OK
#442/6   tailcalls/tailcall_6:OK
#442/7   tailcalls/tailcall_bpf2bpf_1:OK
#442/8   tailcalls/tailcall_bpf2bpf_2:OK
#442/9   tailcalls/tailcall_bpf2bpf_3:OK
#442/10  tailcalls/tailcall_bpf2bpf_4:OK
#442/11  tailcalls/tailcall_bpf2bpf_5:OK
#442/12  tailcalls/tailcall_bpf2bpf_6:OK
#442/13  tailcalls/tailcall_bpf2bpf_fentry:OK
#442/14  tailcalls/tailcall_bpf2bpf_fexit:OK
#442/15  tailcalls/tailcall_bpf2bpf_fentry_fexit:OK
#442/16  tailcalls/tailcall_bpf2bpf_fentry_entry:OK
#442/17  tailcalls/tailcall_poke:OK
#442/18  tailcalls/tailcall_bpf2bpf_hierarchy_1:OK
#442/19  tailcalls/tailcall_bpf2bpf_hierarchy_fentry:OK
#442/20  tailcalls/tailcall_bpf2bpf_hierarchy_fexit:OK
#442/21  tailcalls/tailcall_bpf2bpf_hierarchy_fentry_fexit:OK
#442/22  tailcalls/tailcall_bpf2bpf_hierarchy_fentry_entry:OK
#442/23  tailcalls/tailcall_bpf2bpf_hierarchy_2:OK
#442/24  tailcalls/tailcall_bpf2bpf_hierarchy_3:OK
#442/25  tailcalls/tailcall_freplace:OK
#442/26  tailcalls/tailcall_bpf2bpf_freplace:OK
#442/27  tailcalls/tailcall_failure:OK
#442/28  tailcalls/reject_tail_call_spin_lock:OK
#442/29  tailcalls/reject_tail_call_rcu_lock:OK
#442/30  tailcalls/reject_tail_call_preempt_lock:OK
#442/31  tailcalls/reject_tail_call_ref:OK
#442     tailcalls:OK
Summary: 1/31 PASSED, 0 SKIPPED, 0 FAILED

# ./test_progs -t exceptions
#105/1   exceptions/exception_throw_always_1:OK
#105/2   exceptions/exception_throw_always_2:OK
#105/3   exceptions/exception_throw_unwind_1:OK
#105/4   exceptions/exception_throw_unwind_2:OK
#105/5   exceptions/exception_throw_default:OK
#105/6   exceptions/exception_throw_default_value:OK
#105/7   exceptions/exception_tail_call:OK
#105/8   exceptions/exception_ext:OK
#105/9   exceptions/exception_ext_mod_cb_runtime:OK
#105/10  exceptions/exception_throw_subprog:OK
#105/11  exceptions/exception_assert_nz_gfunc:OK
#105/12  exceptions/exception_assert_zero_gfunc:OK
#105/13  exceptions/exception_assert_neg_gfunc:OK
#105/14  exceptions/exception_assert_pos_gfunc:OK
#105/15  exceptions/exception_assert_negeq_gfunc:OK
#105/16  exceptions/exception_assert_poseq_gfunc:OK
#105/17  exceptions/exception_assert_nz_gfunc_with:OK
#105/18  exceptions/exception_assert_zero_gfunc_with:OK
#105/19  exceptions/exception_assert_neg_gfunc_with:OK
#105/20  exceptions/exception_assert_pos_gfunc_with:OK
#105/21  exceptions/exception_assert_negeq_gfunc_with:OK
#105/22  exceptions/exception_assert_poseq_gfunc_with:OK
#105/23  exceptions/exception_bad_assert_nz_gfunc:OK
#105/24  exceptions/exception_bad_assert_zero_gfunc:OK
#105/25  exceptions/exception_bad_assert_neg_gfunc:OK
#105/26  exceptions/exception_bad_assert_pos_gfunc:OK
#105/27  exceptions/exception_bad_assert_negeq_gfunc:OK
#105/28  exceptions/exception_bad_assert_poseq_gfunc:OK
#105/29  exceptions/exception_bad_assert_nz_gfunc_with:OK
#105/30  exceptions/exception_bad_assert_zero_gfunc_with:OK
#105/31  exceptions/exception_bad_assert_neg_gfunc_with:OK
#105/32  exceptions/exception_bad_assert_pos_gfunc_with:OK
#105/33  exceptions/exception_bad_assert_negeq_gfunc_with:OK
#105/34  exceptions/exception_bad_assert_poseq_gfunc_with:OK
#105/35  exceptions/exception_assert_range:OK
#105/36  exceptions/exception_assert_range_with:OK
#105/37  exceptions/exception_bad_assert_range:OK
#105/38  exceptions/exception_bad_assert_range_with:OK
#105/39  exceptions/non-throwing fentry -> exception_cb:OK
#105/40  exceptions/throwing fentry -> exception_cb:OK
#105/41  exceptions/non-throwing fexit -> exception_cb:OK
#105/42  exceptions/throwing fexit -> exception_cb:OK
#105/43  exceptions/throwing extension (with custom cb) -> exception_cb:OK
#105/44  exceptions/throwing extension -> global func in exception_cb:OK
#105/45  exceptions/exception_ext_mod_cb_runtime:OK
#105/46  exceptions/throwing extension (with custom cb) -> global func in exception_cb:OK
#105/47  exceptions/exception_ext:OK
#105/48  exceptions/non-throwing fentry -> non-throwing subprog:OK
#105/49  exceptions/throwing fentry -> non-throwing subprog:OK
#105/50  exceptions/non-throwing fentry -> throwing subprog:OK
#105/51  exceptions/throwing fentry -> throwing subprog:OK
#105/52  exceptions/non-throwing fexit -> non-throwing subprog:OK
#105/53  exceptions/throwing fexit -> non-throwing subprog:OK
#105/54  exceptions/non-throwing fexit -> throwing subprog:OK
#105/55  exceptions/throwing fexit -> throwing subprog:OK
#105/56  exceptions/non-throwing fmod_ret -> non-throwing subprog:OK
#105/57  exceptions/non-throwing fmod_ret -> non-throwing global subprog:OK
#105/58  exceptions/non-throwing extension -> non-throwing subprog:OK
#105/59  exceptions/non-throwing extension -> throwing subprog:OK
#105/60  exceptions/non-throwing extension -> non-throwing subprog:OK
#105/61  exceptions/non-throwing extension -> throwing global subprog:OK
#105/62  exceptions/throwing extension -> throwing global subprog:OK
#105/63  exceptions/throwing extension -> non-throwing global subprog:OK
#105/64  exceptions/non-throwing extension -> main subprog:OK
#105/65  exceptions/throwing extension -> main subprog:OK
#105/66  exceptions/reject_exception_cb_type_1:OK
#105/67  exceptions/reject_exception_cb_type_2:OK
#105/68  exceptions/reject_exception_cb_type_3:OK
#105/69  exceptions/reject_exception_cb_type_4:OK
#105/70  exceptions/reject_async_callback_throw:OK
#105/71  exceptions/reject_with_lock:OK
#105/72  exceptions/reject_subprog_with_lock:OK
#105/73  exceptions/reject_with_rcu_read_lock:OK
#105/74  exceptions/reject_subprog_with_rcu_read_lock:OK
#105/75  exceptions/reject_with_rbtree_add_throw:OK
#105/76  exceptions/reject_with_reference:OK
#105/77  exceptions/reject_with_cb_reference:OK
#105/78  exceptions/reject_with_cb:OK
#105/79  exceptions/reject_with_subprog_reference:OK
#105/80  exceptions/reject_throwing_exception_cb:OK
#105/81  exceptions/reject_exception_cb_call_global_func:OK
#105/82  exceptions/reject_exception_cb_call_static_func:OK
#105/83  exceptions/reject_multiple_exception_cb:OK
#105/84  exceptions/reject_exception_throw_cb:OK
#105/85  exceptions/reject_exception_throw_cb_diff:OK
#105/86  exceptions/reject_set_exception_cb_bad_ret1:OK
#105/87  exceptions/reject_set_exception_cb_bad_ret2:OK
#105/88  exceptions/check_assert_eq_int_min:OK
#105/89  exceptions/check_assert_eq_int_max:OK
#105/90  exceptions/check_assert_eq_zero:OK
#105/91  exceptions/check_assert_eq_llong_min:OK
#105/92  exceptions/check_assert_eq_llong_max:OK
#105/93  exceptions/check_assert_lt_pos:OK
#105/94  exceptions/check_assert_lt_zero:OK
#105/95  exceptions/check_assert_lt_neg:OK
#105/96  exceptions/check_assert_le_pos:OK
#105/97  exceptions/check_assert_le_zero:OK
#105/98  exceptions/check_assert_le_neg:OK
#105/99  exceptions/check_assert_gt_pos:OK
#105/100 exceptions/check_assert_gt_zero:OK
#105/101 exceptions/check_assert_gt_neg:OK
#105/102 exceptions/check_assert_ge_pos:OK
#105/103 exceptions/check_assert_ge_zero:OK
#105/104 exceptions/check_assert_ge_neg:OK
#105/105 exceptions/check_assert_range_s64:OK
#105/106 exceptions/check_assert_range_u64:OK
#105/107 exceptions/check_assert_single_range_s64:OK
#105/108 exceptions/check_assert_single_range_u64:OK
#105/109 exceptions/check_assert_generic:OK
#105/110 exceptions/check_assert_with_return:OK
#105     exceptions:OK
Summary: 1/110 PASSED, 0 SKIPPED, 0 FAILED

[v1]: https://lore.kernel.org/all/20260105105212.136645-1-adubey@linux.ibm.com/
[v2]: https://lore.kernel.org/all/20260114114450.30405-1-adubey@linux.ibm.com/

Changes v1->v2:
        Move tail_call_cnt to offset 0 in stack frame
        Remove trampoline NVR remapping-patch3/6[v1]
Changes v2->v3:
	Added PPC_BCC_CONST_SHORT for short jumps of constant offset
	Optimize tailcall allocation for BPF_TRAMP_F_CALL_ORIG flag
	New helper for stack size calculation during exceptions
	Prologue JIT optimizations during non exception prog case

Abhishek Dubey (6):
  powerpc64/bpf : Moving tail_call_cnt to bottom of frame
  powerpc64/bpf: Support tailcalls with subprogs
  powerpc64/bpf: Avoid tailcall restore from trampoline
  powerpc64/bpf: Add arch_bpf_stack_walk() for BPF JIT
  powerpc64/bpf: Support exceptions
  powerpc64/bpf: Additional NVR handling for bpf_throw

 arch/powerpc/net/bpf_jit.h        |  16 ++
 arch/powerpc/net/bpf_jit_comp.c   |  90 ++++++++--
 arch/powerpc/net/bpf_jit_comp64.c | 262 ++++++++++++++++++++++++------
 3 files changed, 303 insertions(+), 65 deletions(-)

-- 
2.48.1


