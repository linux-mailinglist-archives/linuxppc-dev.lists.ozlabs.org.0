Return-Path: <linuxppc-dev+bounces-16166-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOEKM9SUcmksmQAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16166-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jan 2026 22:21:24 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5556DAD5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jan 2026 22:21:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dxvBP66CFz3bf2;
	Fri, 23 Jan 2026 08:21:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769116877;
	cv=none; b=HGIoWM54FryTAgan/fO7tuAKTeP0X9IjueA5aMg0YHjaZwzoTMJpZyxotAUv6exE5ePWG8yjIFfac97KjO3WH2BClLFVMA6i6JuiyVWeZkIUWGwY0MdO/QWCvctDX9EyspHNyHSLQg0Lk6hrlOACaCwghCBRfpXNEJ6qOLxSs+T7Fagek26doFWSkoJQOxjvkti8b1Y2qyDHOZnVDZN8YG+yH2BqsN91WLE4Fp1qbDCIaIGo1EvkkY5DDhvooCSQHf5gPhXKD4BXt4bIF4QkuSJwPWVTUPx/7L3tDkhYnF3QkSGmoZYFhlhDM1M7tF5SS6k7xlNhZ8sTH6kWKK7ODg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769116877; c=relaxed/relaxed;
	bh=BE8bTfnjziUpmPonwSdW10Ni9TABW/am7VyKoOkkbuM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZyehSHBmw+2asWzONcOmnq+RuRVHf6mfiKiKM/a2rVc1pKXoaotB3nUYdiOcs93DGjojqcpu5uPrtn88tYNJRhX6KANHfgjxz95jgDGrQsi56G1BD+p+ORz2fep9uNJxQYEn/CxlF7j86d4LAY2rbo/doDMVvUdocxMxgh6NLNKuVH1k/S6Zd9A3PP66ybTe00BICSEJEvLri1k8GKP2FUbzjEbfGwXnB/EFRCHHVm0OQK5ogUah0cKWsltScCjn7+rACIGVl4qqYejVAJfoTO2kl63+zZa2BZMBqkf9bXWp+hfQ53iX8VDC/A20ARSdD8+XeJ4q45Rfy+fad4Eiog==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=toAarroi; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=toAarroi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dxvBN6WJ4z2xqL
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jan 2026 08:21:16 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60MEDAqq028651;
	Thu, 22 Jan 2026 21:19:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=BE8bTfnjziUpmPonwSdW10Ni9TABW/am7VyKoOkkb
	uM=; b=toAarroikFRvAp0BB5au0Ue6iSKfB6XaUGsF/EwK24PUCRrsvUqFDnQDl
	jrnsQ0kSlPO8bh8p+PY9WbzODq6ArRAUYV9U8yfE3/9z/1oc1LG8iRbT68dVLxEl
	FlXh34nDCJdvzYqhM5TkHU/+jVwchEM6Z+Jc8p7L7EoMG3UNIk8sOpIe/LMJMlGs
	+6pnNTxWHfLV5x+G4j5K67k8E38z/KgsbH4SKNpfC7tiDfuO4UVVkFy/TpZYeQFx
	L7jWpjHwf5EhwTKOTscRIhgOsZHjb8iTRWknX16XjmzjiuimIY8w5RRMbFLBM9sG
	e2/0eu6iltNM/Woim1OGBfgOENxVw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bt60eys0u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Jan 2026 21:19:13 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 60MLEEkp012555;
	Thu, 22 Jan 2026 21:19:13 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bt60eys0r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Jan 2026 21:19:12 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60MJsc6J006427;
	Thu, 22 Jan 2026 21:19:11 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4brqf1vn4m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Jan 2026 21:19:11 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60MLJ8Zn44368352
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 22 Jan 2026 21:19:08 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2288720043;
	Thu, 22 Jan 2026 21:19:08 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 14EFC20040;
	Thu, 22 Jan 2026 21:19:01 +0000 (GMT)
Received: from abhi.. (unknown [9.124.222.159])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 22 Jan 2026 21:19:00 +0000 (GMT)
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
        iii@linux.ibm.com, shuah@kernel.org
Subject: [PATCH v4 0/6] powerpc64/bpf: Support tailcalls with subprogs & BPF exceptions
Date: Fri, 23 Jan 2026 02:48:48 +0530
Message-ID: <20260122211854.5508-1-adubey@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=WMdyn3sR c=1 sm=1 tr=0 ts=69729451 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=iIzsfX1pHA8hvRYzEnUA:9
X-Proofpoint-GUID: lVXSJcuh1r-XOp_8FEYyCj_uHOMajrQ2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDE2MiBTYWx0ZWRfX/HOzoq6wem5l
 Pjmsabe9xifKkX/23IMEqTICiuRU8b+sG0tefJpmevnWd0+TdOifqnmd99W4DBg28Ze9uT2l179
 Ik2Ilh7+lnVsR27XN0HZ37/wdxm1jcC7M91VWvQZ8BwTkDilenB2CylvMft6nAJ3mNl4hS7iBAr
 9tudUYYb7xcAgOPwda0iMlrStmaZQLsSQ1hA+CSlklouRgSxNs/lwt9TJ6TDqRygdksNv6HkXNQ
 rBceILPOjp1iYrt6d5diFkhJtuDI5yq+AIxkxcYpoTLa8dE8tdoSvH+uc4U5qOVpGpXlEyd/VMQ
 mLbd7CqpnuXjKw6zbZY6ay+dQausTmdRz2G/DVoejFc3EAL/egeM5KW3q8kPW4xwfXCyUVtxK4z
 JHCae8PngRsQW1rsSJdd3A2uP5jzfctNaNMw/FurfYtdPG5TZeZ152qPyMrI+KQGGwfZIVSq0cK
 +zWQIBiT5rtKE9biR3g==
X-Proofpoint-ORIG-GUID: 1j3Mzri4C22PWEG7M9RYSQT3pivWuPeL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_05,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0 adultscore=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2601150000
 definitions=main-2601220162
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[linux.ibm.com,kernel.org,gmail.com,fb.com,iogearbox.net,linux.dev,fomichev.me,google.com,csgroup.eu,ellerman.id.au];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-16166-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bpf@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kselftest@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:hbathini@linux.ibm.com,m:sachinpb@linux.ibm.com,m:venkat88@linux.ibm.com,m:andrii@kernel.org,m:eddyz87@gmail.com,m:mykolal@fb.com,m:ast@kernel.org,m:daniel@iogearbox.net,m:martin.lau@linux.dev,m:song@kernel.org,m:yonghong.song@linux.dev,m:john.fastabend@gmail.com,m:kpsingh@kernel.org,m:sdf@fomichev.me,m:haoluo@google.com,m:jolsa@kernel.org,m:christophe.leroy@csgroup.eu,m:naveen@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:memxor@gmail.com,m:iii@linux.ibm.com,m:shuah@kernel.org,m:johnfastabend@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[adubey@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[adubey@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[ibm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	NEURAL_HAM(-0.00)[-0.255];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid]
X-Rspamd-Queue-Id: DD5556DAD5
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

Changes v3->v4:
	Handle bpf-ci warnings
Changes v2->v3:
        Added PPC_BCC_CONST_SHORT for short jumps of constant offset
        Optimize tailcall allocation for BPF_TRAMP_F_CALL_ORIG flag
        New helper for stack size calculation during exceptions
        Prologue JIT optimizations during non exception prog case
Changes v1->v2:
        Move tail_call_cnt to offset 0 in stack frame
        Remove trampoline NVR remapping-patch3/6[v1]

Abhishek Dubey (6):
  powerpc64/bpf: Moving tail_call_cnt to bottom of frame
  powerpc64/bpf: Support tailcalls with subprogs
  powerpc64/bpf: Avoid tailcall restore from trampoline
  powerpc64/bpf: Add arch_bpf_stack_walk() for BPF JIT
  powerpc64/bpf: Support exceptions
  powerpc64/bpf: Additional NVR handling for bpf_throw

 arch/powerpc/net/bpf_jit.h        |  16 ++
 arch/powerpc/net/bpf_jit_comp.c   |  88 ++++++++--
 arch/powerpc/net/bpf_jit_comp64.c | 256 ++++++++++++++++++++++++------
 3 files changed, 297 insertions(+), 63 deletions(-)

-- 
2.48.1


