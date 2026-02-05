Return-Path: <linuxppc-dev+bounces-16619-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qPnyC6+vhGk14QMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16619-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 05 Feb 2026 15:56:47 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4730AF44FE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 05 Feb 2026 15:56:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f6L0C4Z3Pz2yFb;
	Fri, 06 Feb 2026 01:56:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770303403;
	cv=none; b=PC27OgwRggIbqsAcvLh5u1wKEZXlS1uf9nO2nWUvi2p4R3aG7eCTQ1q70NbcsMcPYwxW0sfLs9SPCbHyTbYztzO4CbiwRyPrzaRFbP2FI2WK45dYrm9FoXS6qlmX0XUPEJS6Y+NFJhJmRUu7cf12Dc6Z86vWxt+pgZYdplpI+iy/cAhL7B5g9ylykSPEJSGTQ2JNneJmzC4zccfSXUQURt9KLEP4sK89ZdGXe/lhfkXCGRywzrRncyR5eo/LzgjNkg1gTcw4QC5npBOnyBOXaMX/0/38bPPWpOqEzNXGYqQ5PEXwmovofHkBML4+0WN3mQJOD76dBVzNxm3AIZY3WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770303403; c=relaxed/relaxed;
	bh=C1QVcx89xJLUfn8qHtMTrZdJKubsb+NMK2PGpnfJGaE=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=YpRJ24U7dKrTtjM1Me2wJLgM5A1yZIia4UjXUMdQvFoxOMja3kVxpKw/Slu08jEt41aUaLG/GFLFGVPYOgfHBL6VcyH0Hrxlw2RHDYdCz6SsBilT1uTLXxsH0RUEcctouYSzXACAa2Ws3/dU1GrKkICLQKIAWh0ingcanlvDBeUAb4iy6YVzSvzaF32D9eFKV+563zFoAl9UMByPb5vcgKbhpMIfPeyh2hXLG8vmRAw+Zwf8TMSV8y5xhgAR2n4Nx/g7j3bpt4+JBZhTY2ugHyTgepBG6Bv7tYp18CDQtfUSCLFjIE53jfBwoIX7ozBehiWYJNy1IlWpd0kkiKH0bQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sk88o5cv; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sk88o5cv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f6L0B4fB1z2xrk
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Feb 2026 01:56:42 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 615482Q8020399;
	Thu, 5 Feb 2026 14:56:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=C1QVcx
	89xJLUfn8qHtMTrZdJKubsb+NMK2PGpnfJGaE=; b=sk88o5cvWxFBYMs4NV1YwH
	Slk029KZmpP1iNiWjLwTrozfOHe0VZQwjG2JM3sf7wl21lmP7vMgn6iOBHCuEmLu
	ewHAc3oMMsRJ0mNUnNMpgriynBljbFtx3MLei37YwSY7t8kEN9meShC+nvXu215D
	zKc0aBKdnWIqLR8OI5X7NLEfcUD8Tlaonj0nBvS/A5r7fzaaMqdt7Zu/oI0QA1l3
	WMBMxC/d811JdCmupJZodbfSvBiYFcmKu34XBTu5o+Z84MBpRbcJhRq0jv+RKuyq
	H1hqH2alBtIvYpN9/NSC5UD1f6GMqIKc4TXN50AkVGtBQ1gC5IkhUb90cMAfqI/Q
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4c19f6qb07-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Feb 2026 14:56:03 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 615EsWZl017604;
	Thu, 5 Feb 2026 14:56:03 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4c19f6qb05-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Feb 2026 14:56:02 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 615CoaO9027353;
	Thu, 5 Feb 2026 14:56:01 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4c1xs1hx8h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Feb 2026 14:56:01 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 615Eu0Bl13173472
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 5 Feb 2026 14:56:00 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0686158052;
	Thu,  5 Feb 2026 14:56:00 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C029058050;
	Thu,  5 Feb 2026 14:55:51 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.246.105])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTPS;
	Thu,  5 Feb 2026 14:55:51 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
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
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [PATCH v5 0/6] powerpc64/bpf: Support tailcalls with subprogs &
 BPF exceptions
From: Venkat <venkat88@linux.ibm.com>
In-Reply-To: <20260124075223.6033-1-adubey@linux.ibm.com>
Date: Thu, 5 Feb 2026 20:25:38 +0530
Cc: bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
        hbathini@linux.ibm.com, sachinpb@linux.ibm.com, andrii@kernel.org,
        eddyz87@gmail.com, mykolal@fb.com, ast@kernel.org,
        daniel@iogearbox.net, martin.lau@linux.dev, song@kernel.org,
        yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org,
        sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org,
        christophe.leroy@csgroup.eu, naveen@kernel.org, maddy@linux.ibm.com,
        mpe@ellerman.id.au, npiggin@gmail.com, memxor@gmail.com,
        iii@linux.ibm.com, shuah@kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <806FB5EA-F429-406D-8916-CDA12476790A@linux.ibm.com>
References: <20260124075223.6033-1-adubey@linux.ibm.com>
To: adubey@linux.ibm.com
X-Mailer: Apple Mail (2.3864.300.41.1.7)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: YfAaPik6j-LOo4NcfkpKN9DtAt3n_Aha
X-Authority-Analysis: v=2.4 cv=drTWylg4 c=1 sm=1 tr=0 ts=6984af83 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=XfyschVtOzqIvrHFB38A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: wLblhyGenrLrhgE7dKEgdxYLBuM8naH5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDExMiBTYWx0ZWRfX+/aqUuKF+P4x
 ExXaTUMtHCEbOoekG3RwHkUkicvV52mVFlqiQ7OaopXYSoSDisv1Nj4fOF1KT1r8FQ8gd5jW3AV
 My2+LcdXb92lYqIoH7UNAQQwa/YX7AVRr0HXoLWh5T+Wohbvs11eqxDvJmQ7+QnmqtgiLTybP+n
 dCm59GzrE9pg2ML2ZkFT6ujZmq6kaChAvrFBFHLTfuYPpPd+BGH+sqGMipUMTqYfbbW4BffvB35
 Wmo2Cy3KUWthawCDem9vlrbTWPKNDFQ2tTvxxQWZTlybEF41GV+lmFuc0YyPrtNc7weIBkB/jAD
 hLGY2XsbAw5ac7CQuVmFRIOyQ13m6XnuKumoIlhJVw93P6xAfknFZqOP8803CzA99vVdtTSetiM
 ezDUmZIxSPXaS5ZsfuLCL7NuIxxHRPohg+GiUw9AaNeVQqoGcTZE0+5okM1m41qrghX5UvF9W2p
 e2bgk6oT1v6FbCqX2QQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_03,2026-02-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1011 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2601150000
 definitions=main-2602050112
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.ozlabs.org,linux.ibm.com,kernel.org,gmail.com,fb.com,iogearbox.net,linux.dev,fomichev.me,google.com,csgroup.eu,ellerman.id.au];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bpf@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kselftest@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:hbathini@linux.ibm.com,m:sachinpb@linux.ibm.com,m:andrii@kernel.org,m:eddyz87@gmail.com,m:mykolal@fb.com,m:ast@kernel.org,m:daniel@iogearbox.net,m:martin.lau@linux.dev,m:song@kernel.org,m:yonghong.song@linux.dev,m:john.fastabend@gmail.com,m:kpsingh@kernel.org,m:sdf@fomichev.me,m:haoluo@google.com,m:jolsa@kernel.org,m:christophe.leroy@csgroup.eu,m:naveen@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:memxor@gmail.com,m:iii@linux.ibm.com,m:shuah@kernel.org,m:adubey@linux.ibm.com,m:johnfastabend@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[venkat88@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16619-lists,linuxppc-dev=lfdr.de];
	DKIM_TRACE(0.00)[ibm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[venkat88@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28]
X-Rspamd-Queue-Id: 4730AF44FE
X-Rspamd-Action: no action



> On 24 Jan 2026, at 1:22=E2=80=AFPM, adubey@linux.ibm.com wrote:
>=20
> From: Abhishek Dubey <adubey@linux.ibm.com>
>=20
> This patch series enables support for two BPF JIT features
> on powerpc64. The first three patches target support for
> tail calls with subprogram combinations. The first patch
> supports realignment of tail_call_cnt offset in stack frame.
> Implementation details are provided in the commit messages.
>=20
> The last three patches add support for BPF exceptions. An
> architecture-specific stack walker is implemented to assist
> with stack walk during exceptions.
>=20
> All selftests related to tailcalls and exceptions are passing:
>=20
> # ./test_progs -t tailcalls
> #442/1   tailcalls/tailcall_1:OK
> #442/2   tailcalls/tailcall_2:OK
> #442/3   tailcalls/tailcall_3:OK
> #442/4   tailcalls/tailcall_4:OK
> #442/5   tailcalls/tailcall_5:OK
> #442/6   tailcalls/tailcall_6:OK
> #442/7   tailcalls/tailcall_bpf2bpf_1:OK
> #442/8   tailcalls/tailcall_bpf2bpf_2:OK
> #442/9   tailcalls/tailcall_bpf2bpf_3:OK
> #442/10  tailcalls/tailcall_bpf2bpf_4:OK
> #442/11  tailcalls/tailcall_bpf2bpf_5:OK
> #442/12  tailcalls/tailcall_bpf2bpf_6:OK
> #442/13  tailcalls/tailcall_bpf2bpf_fentry:OK
> #442/14  tailcalls/tailcall_bpf2bpf_fexit:OK
> #442/15  tailcalls/tailcall_bpf2bpf_fentry_fexit:OK
> #442/16  tailcalls/tailcall_bpf2bpf_fentry_entry:OK
> #442/17  tailcalls/tailcall_poke:OK
> #442/18  tailcalls/tailcall_bpf2bpf_hierarchy_1:OK
> #442/19  tailcalls/tailcall_bpf2bpf_hierarchy_fentry:OK
> #442/20  tailcalls/tailcall_bpf2bpf_hierarchy_fexit:OK
> #442/21  tailcalls/tailcall_bpf2bpf_hierarchy_fentry_fexit:OK
> #442/22  tailcalls/tailcall_bpf2bpf_hierarchy_fentry_entry:OK
> #442/23  tailcalls/tailcall_bpf2bpf_hierarchy_2:OK
> #442/24  tailcalls/tailcall_bpf2bpf_hierarchy_3:OK
> #442/25  tailcalls/tailcall_freplace:OK
> #442/26  tailcalls/tailcall_bpf2bpf_freplace:OK
> #442/27  tailcalls/tailcall_failure:OK
> #442/28  tailcalls/reject_tail_call_spin_lock:OK
> #442/29  tailcalls/reject_tail_call_rcu_lock:OK
> #442/30  tailcalls/reject_tail_call_preempt_lock:OK
> #442/31  tailcalls/reject_tail_call_ref:OK
> #442     tailcalls:OK
> Summary: 1/31 PASSED, 0 SKIPPED, 0 FAILED
>=20
> # ./test_progs -t exceptions
> #105/1   exceptions/exception_throw_always_1:OK
> #105/2   exceptions/exception_throw_always_2:OK
> #105/3   exceptions/exception_throw_unwind_1:OK
> #105/4   exceptions/exception_throw_unwind_2:OK
> #105/5   exceptions/exception_throw_default:OK
> #105/6   exceptions/exception_throw_default_value:OK
> #105/7   exceptions/exception_tail_call:OK
> #105/8   exceptions/exception_ext:OK
> #105/9   exceptions/exception_ext_mod_cb_runtime:OK
> #105/10  exceptions/exception_throw_subprog:OK
> #105/11  exceptions/exception_assert_nz_gfunc:OK
> #105/12  exceptions/exception_assert_zero_gfunc:OK
> #105/13  exceptions/exception_assert_neg_gfunc:OK
> #105/14  exceptions/exception_assert_pos_gfunc:OK
> #105/15  exceptions/exception_assert_negeq_gfunc:OK
> #105/16  exceptions/exception_assert_poseq_gfunc:OK
> #105/17  exceptions/exception_assert_nz_gfunc_with:OK
> #105/18  exceptions/exception_assert_zero_gfunc_with:OK
> #105/19  exceptions/exception_assert_neg_gfunc_with:OK
> #105/20  exceptions/exception_assert_pos_gfunc_with:OK
> #105/21  exceptions/exception_assert_negeq_gfunc_with:OK
> #105/22  exceptions/exception_assert_poseq_gfunc_with:OK
> #105/23  exceptions/exception_bad_assert_nz_gfunc:OK
> #105/24  exceptions/exception_bad_assert_zero_gfunc:OK
> #105/25  exceptions/exception_bad_assert_neg_gfunc:OK
> #105/26  exceptions/exception_bad_assert_pos_gfunc:OK
> #105/27  exceptions/exception_bad_assert_negeq_gfunc:OK
> #105/28  exceptions/exception_bad_assert_poseq_gfunc:OK
> #105/29  exceptions/exception_bad_assert_nz_gfunc_with:OK
> #105/30  exceptions/exception_bad_assert_zero_gfunc_with:OK
> #105/31  exceptions/exception_bad_assert_neg_gfunc_with:OK
> #105/32  exceptions/exception_bad_assert_pos_gfunc_with:OK
> #105/33  exceptions/exception_bad_assert_negeq_gfunc_with:OK
> #105/34  exceptions/exception_bad_assert_poseq_gfunc_with:OK
> #105/35  exceptions/exception_assert_range:OK
> #105/36  exceptions/exception_assert_range_with:OK
> #105/37  exceptions/exception_bad_assert_range:OK
> #105/38  exceptions/exception_bad_assert_range_with:OK
> #105/39  exceptions/non-throwing fentry -> exception_cb:OK
> #105/40  exceptions/throwing fentry -> exception_cb:OK
> #105/41  exceptions/non-throwing fexit -> exception_cb:OK
> #105/42  exceptions/throwing fexit -> exception_cb:OK
> #105/43  exceptions/throwing extension (with custom cb) -> =
exception_cb:OK
> #105/44  exceptions/throwing extension -> global func in =
exception_cb:OK
> #105/45  exceptions/exception_ext_mod_cb_runtime:OK
> #105/46  exceptions/throwing extension (with custom cb) -> global func =
in exception_cb:OK
> #105/47  exceptions/exception_ext:OK
> #105/48  exceptions/non-throwing fentry -> non-throwing subprog:OK
> #105/49  exceptions/throwing fentry -> non-throwing subprog:OK
> #105/50  exceptions/non-throwing fentry -> throwing subprog:OK
> #105/51  exceptions/throwing fentry -> throwing subprog:OK
> #105/52  exceptions/non-throwing fexit -> non-throwing subprog:OK
> #105/53  exceptions/throwing fexit -> non-throwing subprog:OK
> #105/54  exceptions/non-throwing fexit -> throwing subprog:OK
> #105/55  exceptions/throwing fexit -> throwing subprog:OK
> #105/56  exceptions/non-throwing fmod_ret -> non-throwing subprog:OK
> #105/57  exceptions/non-throwing fmod_ret -> non-throwing global =
subprog:OK
> #105/58  exceptions/non-throwing extension -> non-throwing subprog:OK
> #105/59  exceptions/non-throwing extension -> throwing subprog:OK
> #105/60  exceptions/non-throwing extension -> non-throwing subprog:OK
> #105/61  exceptions/non-throwing extension -> throwing global =
subprog:OK
> #105/62  exceptions/throwing extension -> throwing global subprog:OK
> #105/63  exceptions/throwing extension -> non-throwing global =
subprog:OK
> #105/64  exceptions/non-throwing extension -> main subprog:OK
> #105/65  exceptions/throwing extension -> main subprog:OK
> #105/66  exceptions/reject_exception_cb_type_1:OK
> #105/67  exceptions/reject_exception_cb_type_2:OK
> #105/68  exceptions/reject_exception_cb_type_3:OK
> #105/69  exceptions/reject_exception_cb_type_4:OK
> #105/70  exceptions/reject_async_callback_throw:OK
> #105/71  exceptions/reject_with_lock:OK
> #105/72  exceptions/reject_subprog_with_lock:OK
> #105/73  exceptions/reject_with_rcu_read_lock:OK
> #105/74  exceptions/reject_subprog_with_rcu_read_lock:OK
> #105/75  exceptions/reject_with_rbtree_add_throw:OK
> #105/76  exceptions/reject_with_reference:OK
> #105/77  exceptions/reject_with_cb_reference:OK
> #105/78  exceptions/reject_with_cb:OK
> #105/79  exceptions/reject_with_subprog_reference:OK
> #105/80  exceptions/reject_throwing_exception_cb:OK
> #105/81  exceptions/reject_exception_cb_call_global_func:OK
> #105/82  exceptions/reject_exception_cb_call_static_func:OK
> #105/83  exceptions/reject_multiple_exception_cb:OK
> #105/84  exceptions/reject_exception_throw_cb:OK
> #105/85  exceptions/reject_exception_throw_cb_diff:OK
> #105/86  exceptions/reject_set_exception_cb_bad_ret1:OK
> #105/87  exceptions/reject_set_exception_cb_bad_ret2:OK
> #105/88  exceptions/check_assert_eq_int_min:OK
> #105/89  exceptions/check_assert_eq_int_max:OK
> #105/90  exceptions/check_assert_eq_zero:OK
> #105/91  exceptions/check_assert_eq_llong_min:OK
> #105/92  exceptions/check_assert_eq_llong_max:OK
> #105/93  exceptions/check_assert_lt_pos:OK
> #105/94  exceptions/check_assert_lt_zero:OK
> #105/95  exceptions/check_assert_lt_neg:OK
> #105/96  exceptions/check_assert_le_pos:OK
> #105/97  exceptions/check_assert_le_zero:OK
> #105/98  exceptions/check_assert_le_neg:OK
> #105/99  exceptions/check_assert_gt_pos:OK
> #105/100 exceptions/check_assert_gt_zero:OK
> #105/101 exceptions/check_assert_gt_neg:OK
> #105/102 exceptions/check_assert_ge_pos:OK
> #105/103 exceptions/check_assert_ge_zero:OK
> #105/104 exceptions/check_assert_ge_neg:OK
> #105/105 exceptions/check_assert_range_s64:OK
> #105/106 exceptions/check_assert_range_u64:OK
> #105/107 exceptions/check_assert_single_range_s64:OK
> #105/108 exceptions/check_assert_single_range_u64:OK
> #105/109 exceptions/check_assert_generic:OK
> #105/110 exceptions/check_assert_with_return:OK
> #105     exceptions:OK
> Summary: 1/110 PASSED, 0 SKIPPED, 0 FAILED
>=20
> [v1]: =
https://lore.kernel.org/all/20260105105212.136645-1-adubey@linux.ibm.com/
> [v2]: =
https://lore.kernel.org/all/20260114114450.30405-1-adubey@linux.ibm.com/
> [v3]: =
https://lore.kernel.org/all/20260122165716.10508-1-adubey@linux.ibm.com/
> [v4]: =
https://lore.kernel.org/all/20260122211854.5508-1-adubey@linux.ibm.com/
>=20
> Changes v4->v5:
> Patch comments and code refactoring
> Handle exception callback and boundary frame checks
> Changes v3->v4:
>        Handle bpf-ci warnings
> Changes v2->v3:
>        Added PPC_BCC_CONST_SHORT for short jumps of constant offset
>        Optimize tailcall allocation for BPF_TRAMP_F_CALL_ORIG flag
>        New helper for stack size calculation during exceptions
>        Prologue JIT optimizations during non exception prog case
> Changes v1->v2:
>        Move tail_call_cnt to offset 0 in stack frame
>        Remove trampoline NVR remapping-patch3/6
>=20
> Abhishek Dubey (6):
>  powerpc64/bpf: Moving tail_call_cnt to bottom of frame
>  powerpc64/bpf: Support tailcalls with subprogs
>  powerpc64/bpf: Avoid tailcall restore from trampoline
>  powerpc64/bpf: Add arch_bpf_stack_walk() for BPF JIT
>  powerpc64/bpf: Support exceptions
>  powerpc64/bpf: Additional NVR handling for bpf_throw
>=20
> arch/powerpc/net/bpf_jit.h        |  16 ++
> arch/powerpc/net/bpf_jit_comp.c   |  85 +++++++--
> arch/powerpc/net/bpf_jit_comp64.c | 276 +++++++++++++++++++++++++-----
> 3 files changed, 315 insertions(+), 62 deletions(-)
>=20
> --=20
> 2.48.1
>=20

Tested this series, it=E2=80=99s working as expected. Please add below =
tag.

Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>

Regards,
Venkat.=

