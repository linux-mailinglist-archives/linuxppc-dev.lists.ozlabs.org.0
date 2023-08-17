Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 955FC77FD12
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 19:36:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tqTWsysm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RRXH03by5z3cT3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Aug 2023 03:36:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tqTWsysm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RRXG65FJvz3bh5
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Aug 2023 03:35:26 +1000 (AEST)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37HHVfbr017300;
	Thu, 17 Aug 2023 17:35:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=gvEIoVHewZpykRyHOiRra4fEnMFiFcmAqDfXxz3J1Lk=;
 b=tqTWsysmBVwUyqN6/1qK7f5y+9ngHt+yiPLeJQUDgHQPplAqSHgDoGiIubBqmvw3vu6S
 UtUwU5Xo/JaOkQU+gCk3K8o6C++vQRUV9TcRp9w9jBFUgSUi2Qiblw2xV+YoGFLB5U7X
 iTZ9kQVKhBpRt0lnReHf2PSE8NesUJGvKThV4dCbMCyCvM2Vi+EyoGk9/ryyhELP8icW
 vgrG8yKDG4uJhDj9TtCoM5+NP/sIIRlISd4+II46CmQPL+txKrRvvkp8NhjiBwptSzZF
 6sWR4bih2G7eWSBOTX698TgZZtHgoAdXZt4M2n/gYULIW4Hte8BiwzUHvY/m6mVgv91Y Mg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3shr1e850j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Aug 2023 17:35:21 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 37HHX2Yb023898;
	Thu, 17 Aug 2023 17:35:21 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3shr1e84yv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Aug 2023 17:35:21 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 37HHPu8l013223;
	Thu, 17 Aug 2023 17:35:20 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3sepmk7g2r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Aug 2023 17:35:20 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 37HHZHwQ40304900
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Aug 2023 17:35:17 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 14DB52004B;
	Thu, 17 Aug 2023 17:35:17 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EFE9E20040;
	Thu, 17 Aug 2023 17:35:14 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.32.94])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 17 Aug 2023 17:35:14 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.500.231\))
Subject: Re: [PATCH] tools/perf: Fix bpf__probe to set bpf_prog_type type only
 if differs from the desired one
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <D01070A8-D55B-4A9D-B81E-A9946920BBF8@linux.ibm.com>
Date: Thu, 17 Aug 2023 23:05:02 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <A9D8B3C5-B663-4D27-B6CF-BE4873BB39B9@linux.vnet.ibm.com>
References: <20230807045223.23452-1-atrajeev@linux.vnet.ibm.com>
 <D01070A8-D55B-4A9D-B81E-A9946920BBF8@linux.ibm.com>
To: Sachin Sant <sachinp@linux.ibm.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>
X-Mailer: Apple Mail (2.3731.500.231)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: aDHW_JdlUKrFOO-V5MW6_5Bd1tIv3K4G
X-Proofpoint-GUID: 1bGyPHvCDAZpScphus32p-EEKyKQyDym
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-17_13,2023-08-17_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 mlxlogscore=974 spamscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308170158
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>, Ian Rogers <irogers@google.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>, linux-perf-users@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Disha Goel <disgoel@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 07-Aug-2023, at 11:07 AM, Sachin Sant <sachinp@linux.ibm.com> =
wrote:
>=20
>=20
>=20
>> On 07-Aug-2023, at 10:22 AM, Athira Rajeev =
<atrajeev@linux.vnet.ibm.com> wrote:
>>=20
>> The test "BPF prologue generation" fails as below:
>>=20
>>  Writing event: p:perf_bpf_probe/func _text+10423200 =
f_mode=3D+20(%gpr3):x32 offset=3D%gpr4:s64 orig=3D%gpr5:s32
>>  In map_prologue, ntevs=3D1
>>  mapping[0]=3D0
>>  libbpf: prog 'bpf_func__null_lseek': BPF program load failed: =
Permission denied
>>  libbpf: prog 'bpf_func__null_lseek': -- BEGIN PROG LOAD LOG --
>>  btf_vmlinux is malformed
>>  reg type unsupported for arg#0 function bpf_func__null_lseek#5
>>  0: R1=3Dctx(off=3D0,imm=3D0) R10=3Dfp0
>>  ;
>>  0: (57) r3 &=3D 2
>>  R3 !read_ok
>>  processed 1 insns (limit 1000000) max_states_per_insn 0 total_states =
0 peak_states 0 mark_read 0
>>  -- END PROG LOAD LOG --
>>  libbpf: prog 'bpf_func__null_lseek': failed to load: -13
>>  libbpf: failed to load object '[bpf_prologue_test]'
>>  bpf: load objects failed: err=3D-13: (Permission denied)
>>  Failed to add events selected by BPF
>>=20
>> This fails occurs after this commit:
>> commit d6e6286a12e7 ("libbpf: disassociate section handler
>> on explicit bpf_program__set_type() call")'
>>=20
>> With this change, SEC_DEF handler libbpf which is determined
>> initially based on program's SEC() is set to NULL. The change
>> is made because sec_def is not valid when user sets the program
>> type with bpf_program__set_type function. This commit also fixed
>> bpf_prog_test_load() helper in selftests/bpf to force-set program
>> type only if it differs from the desired one.
>>=20
>> The "bpf__probe" function in util/bpf-loader.c, also calls
>> bpf_program__set_type to set bpf_prog_type. Add similar fix in
>> here as well to avoid setting sec_def to NULL.
>>=20
>> Reported-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>> ---
>=20
> Thanks Athira for the fix.
> With this patch applied perf BPF prologue sub test works correctly.
>=20
> 42: BPF filter                                                     :
> 42.1: Basic BPF filtering                                    : Ok
> 42.2: BPF pinning                                              : Ok
> 42.3: BPF prologue generation                          : Ok
>=20
> Tested-by: Sachin Sant <sachinp@linux.ibm.com>
>=20
> Can you please use the above mentioned id(without vnet) in the =
reported-by ?
>=20
> - Sachin

Hi All,

Looking for review comments on this patch

Athira


