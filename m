Return-Path: <linuxppc-dev+bounces-16261-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wMHVNHN6dGnU5wAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16261-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Jan 2026 08:53:23 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5717CE3D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Jan 2026 08:53:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dyn9D1m8Nz2yql;
	Sat, 24 Jan 2026 18:53:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769241200;
	cv=none; b=Mo62vBONqvH2y8dQNeIxR7tne917bE9R+Cv5QMhwwIZTBVnysHzP3ni26SUYnHuyFA54v+bpj/pMgEDUMh92P8DRWHXxaZId1cP8d6IQtc5MPx2swwEVjJt1tEBsYGjc5ehmqZe27pOAnYyiasxQkajRUlcvql8WTC81b7Ezlr8kIcFykjxMP8QI1x0h+pDD8V7rnPLKppdOqsaFR7reuYk7CqAuo/CBhzjWBWn1l6CLqWEwK+OOkHHKh9PiVk0FthHqLtxwmQAX9ifDQAmlqGiE5E4Vdgk91SSF0Veq2LejfuMRyzv+DRq2IBywHLH/RqwXuhV1qrPbki6L7Ps/5g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769241200; c=relaxed/relaxed;
	bh=tywiFIe2xb8dzvU64lxLZYOWsPqpMqem8e+4KXuWaHk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bK3QsnaUK+E10xpUkfzqJ7fAUk9i2nzMB7ymwDz6D5oOt8h+ngxcTXlw4j+QyNJ4ftroiMbSzg/vkc8ox0hozoRqcorUpxjNfjtCcIMI+O8eYGiMC7xSiUWn557TbvikL7KAIz5LOav0tNYPZawH6tgna/8YNBR7JegSScNGTszykLgf7BZh1FaWe8quNPGv1me1is49BzeGBTBQIGTBQP+3r13LjwBZi5dgTNpDg5hS8vfIFi2VID6cTz3kR4v4qM91FI7du6eGF2wFef1Ns/CwyD9gYhXEQQWxLr1sjl4B8iq6/BiXtvDDiXqyi8NhwOVY1yClc14pD63pAXGheQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=N5WiANOT; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=N5WiANOT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dyn9C0gH5z2xSN
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Jan 2026 18:53:18 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60O4GlQl005990;
	Sat, 24 Jan 2026 07:52:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=tywiFIe2xb8dzvU64lxLZYOWsPqpMqem8e+4KXuWa
	Hk=; b=N5WiANOT/VhFDtdHWwY7ISeZ4EjahNTrDu8yJW5BY6W42EFOFaPV+W+LJ
	Of/0Jj7xBxBjhP6kFOzM4SDlQQwiENdFON3/5DTcW/ITZFoNx/53UPlkh28zs3OA
	NL148BGIHCpFTwt1M9PdhoF5ZAg15t2RubVkEE5bgI665MIdzSL95NGpM6iYI4i3
	tomjvjs+iWg4hX2jFyPuXSGfe1esmMFulGwhbqKxzX26nd+aPvVXU9txwqHiJr//
	+Qfw0JeizOh79A8NLz8sqNGAOdxq49VMNmDG6sVIgXn26pjKcYtJ1VVg8WR+/OMJ
	ggKbhZctcd9rrIR8nT4Gx6XQtEZrQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bvnk6grkc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 24 Jan 2026 07:52:44 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 60O7qisx012033;
	Sat, 24 Jan 2026 07:52:44 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bvnk6grk8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 24 Jan 2026 07:52:44 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60O21Vjj001404;
	Sat, 24 Jan 2026 07:52:43 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4brpykcr6d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 24 Jan 2026 07:52:43 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60O7qdrT23200220
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 24 Jan 2026 07:52:39 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2921020043;
	Sat, 24 Jan 2026 07:52:39 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8C91B20040;
	Sat, 24 Jan 2026 07:52:32 +0000 (GMT)
Received: from abhi.. (unknown [9.124.223.59])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 24 Jan 2026 07:52:32 +0000 (GMT)
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
Subject: [PATCH v5 0/6] powerpc64/bpf: Support tailcalls with subprogs & BPF exceptions
Date: Sat, 24 Jan 2026 13:22:17 +0530
Message-ID: <20260124075223.6033-1-adubey@linux.ibm.com>
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
X-Proofpoint-GUID: gFYUwwVC4HYBvHkQpOC5-YrRXcdAE85U
X-Proofpoint-ORIG-GUID: MdtGFG5A_kD6WTIHR7MF2x8XkOXcJNzr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI0MDA2MCBTYWx0ZWRfX5uXUe0fKWbD6
 HaOzEShGAsDAeLkNU0Fey20Br9A3ijnZUB5cG9QUtMKGccseR0bxPenx+WZvG/jxEjbNqGL7vXR
 uKsSvD2mQUvO3FUwzrAe0i2s3CczOZbLEztzeQArjECFw0I2wDAMK4zlfjLBFFjWolW8RpIgyPG
 y0I9RPMW1syQU8aTLqNMihxXJXeIjwPySSMOiv6B20rLeOK+M8uitoy384qwtgNLpCKmnIuhnHI
 ZLoUQVpxER2U1KR6nYSty5B3lU6tHqmGq94mdNCnOXDttNu0WFkvrk7M40aVSsuoUpMHNY+9g2+
 3xNqRTEIrRn6dVT2VemrATxW3JHJBvhOVeTojIRRA/TLFvPAib7e+Ytp68fg2V+UPN2DnG/9/FV
 uH17EI11Ujf96VPWoJ35JSBrFOlXvwl2bsFc4/kbaw7i7cfCbK1aN+k/eURgS4PLKCnH+hSnUnX
 ed/DoyJ9M6iC+0TgjeA==
X-Authority-Analysis: v=2.4 cv=AMiVTGgp c=1 sm=1 tr=0 ts=69747a4c cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=iIzsfX1pHA8hvRYzEnUA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-24_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2601150000
 definitions=main-2601240060
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux.ibm.com,kernel.org,gmail.com,fb.com,iogearbox.net,linux.dev,fomichev.me,google.com,csgroup.eu,ellerman.id.au];
	TAGGED_FROM(0.00)[bounces-16261-lists,linuxppc-dev=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[29];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[adubey@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:bpf@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kselftest@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:hbathini@linux.ibm.com,m:sachinpb@linux.ibm.com,m:venkat88@linux.ibm.com,m:andrii@kernel.org,m:eddyz87@gmail.com,m:mykolal@fb.com,m:ast@kernel.org,m:daniel@iogearbox.net,m:martin.lau@linux.dev,m:song@kernel.org,m:yonghong.song@linux.dev,m:john.fastabend@gmail.com,m:kpsingh@kernel.org,m:sdf@fomichev.me,m:haoluo@google.com,m:jolsa@kernel.org,m:christophe.leroy@csgroup.eu,m:naveen@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:memxor@gmail.com,m:iii@linux.ibm.com,m:shuah@kernel.org,m:adubey@linux.ibm.com,m:johnfastabend@gmail.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[adubey@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[ibm.com:+];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,linux.ibm.com:mid]
X-Rspamd-Queue-Id: DA5717CE3D
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
[v3]: https://lore.kernel.org/all/20260122165716.10508-1-adubey@linux.ibm.com/
[v4]: https://lore.kernel.org/all/20260122211854.5508-1-adubey@linux.ibm.com/

Changes v4->v5:
	Patch comments and code refactoring
	Handle exception callback and boundary frame checks
Changes v3->v4:
        Handle bpf-ci warnings
Changes v2->v3:
        Added PPC_BCC_CONST_SHORT for short jumps of constant offset
        Optimize tailcall allocation for BPF_TRAMP_F_CALL_ORIG flag
        New helper for stack size calculation during exceptions
        Prologue JIT optimizations during non exception prog case
Changes v1->v2:
        Move tail_call_cnt to offset 0 in stack frame
        Remove trampoline NVR remapping-patch3/6

Abhishek Dubey (6):
  powerpc64/bpf: Moving tail_call_cnt to bottom of frame
  powerpc64/bpf: Support tailcalls with subprogs
  powerpc64/bpf: Avoid tailcall restore from trampoline
  powerpc64/bpf: Add arch_bpf_stack_walk() for BPF JIT
  powerpc64/bpf: Support exceptions
  powerpc64/bpf: Additional NVR handling for bpf_throw

 arch/powerpc/net/bpf_jit.h        |  16 ++
 arch/powerpc/net/bpf_jit_comp.c   |  85 +++++++--
 arch/powerpc/net/bpf_jit_comp64.c | 276 +++++++++++++++++++++++++-----
 3 files changed, 315 insertions(+), 62 deletions(-)

-- 
2.48.1


