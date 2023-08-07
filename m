Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB65771A01
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Aug 2023 08:07:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OdY4Rd0E;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RK5SM4GmVz30NN
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Aug 2023 16:06:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OdY4Rd0E;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RK5RR3dLhz2xVn
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Aug 2023 16:06:11 +1000 (AEST)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37760f8b022432;
	Mon, 7 Aug 2023 06:06:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=R5rrfQDMRX9CKsljEDMRN0A4IEiVdE81GWneIu/0opc=;
 b=OdY4Rd0E+2YElGk7mk0vVNIgm+jwgIGPiXW3blByDw307pWvMGHAPgIno2gq7Iv9gJc1
 1j4RQhAbpdQdqoaNl2uy/GpFccYF3x9GHk3Xax0gHuxE3lB3ipRO69F+RQyiA8dlTIlE
 G32X24GkiZ9+KR6m3wGNX1UWKytGDCgjBgUSu+OzsYK8R5e4at67ziNeZmG5RX3K4RVe
 k0Ee3D0IMaJ9Tvp289XqhT43knPH88bFuaLyQ9BfDJ86Z+v/RBLrtvNmUWYGlTORTXRe
 41nTOlZ8lLhcotu9E9+ne/pafWVkm8ll2oX9P26RoR2fGplyeFO542nShk5TROU7LYaN rQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3satyhg6fj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Aug 2023 06:06:05 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 37760dwW022316;
	Mon, 7 Aug 2023 06:06:05 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3satyhg6b5-8
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Aug 2023 06:06:04 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 37750xXn001610;
	Mon, 7 Aug 2023 05:38:07 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3sa2yjhxpp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Aug 2023 05:38:06 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3775c4w055509394
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Aug 2023 05:38:04 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1D6FE20040;
	Mon,  7 Aug 2023 05:38:04 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 58A2D20049;
	Mon,  7 Aug 2023 05:38:02 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.109.241.238])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  7 Aug 2023 05:38:02 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.600.7\))
Subject: Re: [PATCH] tools/perf: Fix bpf__probe to set bpf_prog_type type only
 if differs from the desired one
From: Sachin Sant <sachinp@linux.ibm.com>
In-Reply-To: <20230807045223.23452-1-atrajeev@linux.vnet.ibm.com>
Date: Mon, 7 Aug 2023 11:07:51 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <D01070A8-D55B-4A9D-B81E-A9946920BBF8@linux.ibm.com>
References: <20230807045223.23452-1-atrajeev@linux.vnet.ibm.com>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
X-Mailer: Apple Mail (2.3731.600.7)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: nhekmyVDLR3wSyE1-W04J0EvlmycmSf5
X-Proofpoint-GUID: oOtkQZNQ0paRisUGPB3rV1TPJt05ZOYo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-07_04,2023-08-03_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 adultscore=0 clxscore=1011 mlxscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0
 mlxlogscore=979 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308070055
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>, irogers@google.com, maddy@linux.ibm.com, kjain@linux.ibm.com, acme@kernel.org, linux-perf-users@vger.kernel.org, jolsa@kernel.org, namhyung@kernel.org, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 07-Aug-2023, at 10:22 AM, Athira Rajeev =
<atrajeev@linux.vnet.ibm.com> wrote:
>=20
> The test "BPF prologue generation" fails as below:
>=20
>   Writing event: p:perf_bpf_probe/func _text+10423200 =
f_mode=3D+20(%gpr3):x32 offset=3D%gpr4:s64 orig=3D%gpr5:s32
>   In map_prologue, ntevs=3D1
>   mapping[0]=3D0
>   libbpf: prog 'bpf_func__null_lseek': BPF program load failed: =
Permission denied
>   libbpf: prog 'bpf_func__null_lseek': -- BEGIN PROG LOAD LOG --
>   btf_vmlinux is malformed
>   reg type unsupported for arg#0 function bpf_func__null_lseek#5
>   0: R1=3Dctx(off=3D0,imm=3D0) R10=3Dfp0
>   ;
>   0: (57) r3 &=3D 2
>   R3 !read_ok
>   processed 1 insns (limit 1000000) max_states_per_insn 0 total_states =
0 peak_states 0 mark_read 0
>   -- END PROG LOAD LOG --
>   libbpf: prog 'bpf_func__null_lseek': failed to load: -13
>   libbpf: failed to load object '[bpf_prologue_test]'
>   bpf: load objects failed: err=3D-13: (Permission denied)
>   Failed to add events selected by BPF
>=20
> This fails occurs after this commit:
> commit d6e6286a12e7 ("libbpf: disassociate section handler
> on explicit bpf_program__set_type() call")'
>=20
> With this change, SEC_DEF handler libbpf which is determined
> initially based on program's SEC() is set to NULL. The change
> is made because sec_def is not valid when user sets the program
> type with bpf_program__set_type function. This commit also fixed
> bpf_prog_test_load() helper in selftests/bpf to force-set program
> type only if it differs from the desired one.
>=20
> The "bpf__probe" function in util/bpf-loader.c, also calls
> bpf_program__set_type to set bpf_prog_type. Add similar fix in
> here as well to avoid setting sec_def to NULL.
>=20
> Reported-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> ---

Thanks Athira for the fix.
With this patch applied perf BPF prologue sub test works correctly.

 42: BPF filter                                                     :
 42.1: Basic BPF filtering                                    : Ok
 42.2: BPF pinning                                              : Ok
 42.3: BPF prologue generation                          : Ok

Tested-by: Sachin Sant <sachinp@linux.ibm.com>

Can you please use the above mentioned id(without vnet) in the =
reported-by ?

- Sachin

