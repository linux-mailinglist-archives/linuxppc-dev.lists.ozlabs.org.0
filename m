Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF1876136B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 13:10:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IiVsIIEr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R9Dpr5NTBz3bdV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 21:10:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IiVsIIEr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R9Dnv6L5wz2yGg
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 21:09:55 +1000 (AEST)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36PB9R6P009270;
	Tue, 25 Jul 2023 11:09:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=+Iygf2tGqoRwuW0+Vy2AWM7vI5r+nyDtBDPS1VhS6xE=;
 b=IiVsIIErdmO+7kGkBe657iOAnRkkR5UfdUFT7wkBO6D/ZP1MYhsoQdm/EfaXpbwLj2l8
 U3lzgTHcUu/kpgxHFOucTwcNWwPeNHsjb4QpkLjvrdx6VF/ZXX7wgGRYPqIqJjfHAdqm
 eE5x3WmmO5Fh96N/X3Z7g73ql4UeYAfMDlbIfuWsabg71zwvlRM0o0K1FSq1uJdR3VMK
 v8NVIHN+TmLRbxYuGGtu7Fb5LIBoFRzEAxyO3k0gJ4E8YqgU3Z7oR8M/IL8QTusZxDDs
 CL5CZEssbQgCMsvYgvhNmdRwO9A18+FLNcUtACIfV8gnmcl2Xu1ietlKOp1ZY22cwYwn LA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s2cmnrqu8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jul 2023 11:09:48 +0000
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36PB9lOC011167;
	Tue, 25 Jul 2023 11:09:47 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s2cmnrqu1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jul 2023 11:09:47 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36PAFSLd016584;
	Tue, 25 Jul 2023 11:09:47 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3s0v512tnq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jul 2023 11:09:47 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36PB9iF325690836
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Jul 2023 11:09:44 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 14AE520040;
	Tue, 25 Jul 2023 11:09:44 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D0AAF20043;
	Tue, 25 Jul 2023 11:09:41 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.119.82])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 25 Jul 2023 11:09:41 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.500.231\))
Subject: Re: [PATCH] tools/perf: Fix addr location init during
 arch_skip_callchain_idx function
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <ZL7nLEFFjTCTcZW6@kernel.org>
Date: Tue, 25 Jul 2023 16:39:29 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <6C610EE0-DA53-4341-B3B2-D1EE3120F149@linux.vnet.ibm.com>
References: <20230724165815.17810-1-atrajeev@linux.vnet.ibm.com>
 <ZL7nLEFFjTCTcZW6@kernel.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
X-Mailer: Apple Mail (2.3731.500.231)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Y3MQ_Pjajee0snIasVKZr-EeyNgAjpz1
X-Proofpoint-ORIG-GUID: ysG283ScSmkWr3q3BI6ERA6En7XWS1Dy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-25_06,2023-07-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 adultscore=0 spamscore=0 clxscore=1011 lowpriorityscore=0 suspectscore=0
 mlxlogscore=999 phishscore=0 mlxscore=0 impostorscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2307250096
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
Cc: Ian Rogers <irogers@google.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>, Adrian Hunter <adrian.hunter@intel.com>, linux-perf-users@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, Namhyung Kim <namhyung@kernel.org>, Disha Goel <disgoel@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 25-Jul-2023, at 2:33 AM, Arnaldo Carvalho de Melo <acme@kernel.org> =
wrote:
>=20
> Em Mon, Jul 24, 2023 at 10:28:15PM +0530, Athira Rajeev escreveu:
>> perf record with callchain recording fails as below
>> in powerpc:
>>=20
>>   ./perf record -a -gR sleep 10
>>   ./perf report
>>   perf: Segmentation fault
>>=20
>> gdb trace points to thread__find_map
>>=20
>>   0  0x00000000101df314 in atomic_cmpxchg (newval=3D1818846826, =
oldval=3D1818846827, v=3D0x1001a8f3) at =
/home/athira/linux/tools/include/asm-generic/atomic-gcc.h:70
>>   1  refcount_sub_and_test (i=3D1, r=3D0x1001a8f3) at =
/home/athira/linux/tools/include/linux/refcount.h:135
>>   2  refcount_dec_and_test (r=3D0x1001a8f3) at =
/home/athira/linux/tools/include/linux/refcount.h:148
>>   3  map__put (map=3D0x1001a8b3) at util/map.c:311
>>   4  0x000000001016842c in __map__zput (map=3D0x7fffffffa368) at =
util/map.h:190
>>   5  thread__find_map (thread=3D0x105b92f0, cpumode=3D<optimized =
out>, addr=3D13835058055283572736, al=3Dal@entry=3D0x7fffffffa358) at =
util/event.c:582
>>   6  0x000000001016882c in thread__find_symbol (thread=3D<optimized =
out>, cpumode=3D<optimized out>, addr=3D<optimized out>, =
al=3D0x7fffffffa358) at util/event.c:656
>>   7  0x00000000102e12b4 in arch_skip_callchain_idx (thread=3D<optimized=
 out>, chain=3D<optimized out>) at =
arch/powerpc/util/skip-callchain-idx.c:255
>>   8  0x00000000101d3bf4 in thread__resolve_callchain_sample =
(thread=3D0x105b92f0, cursor=3D0x1053d160, evsel=3D<optimized out>, =
sample=3D0x7fffffffa908, parent=3D0x7fffffffa778, =
root_al=3D0x7fffffffa710,
>>       max_stack=3D<optimized out>) at util/machine.c:2940
>>   9  0x00000000101cd210 in sample__resolve_callchain =
(sample=3D<optimized out>, cursor=3D<optimized out>, parent=3D<optimized =
out>, evsel=3D<optimized out>, al=3D<optimized out>, =
max_stack=3D<optimized out>)
>>       at util/callchain.c:1112
>>   10 0x000000001022a9d8 in hist_entry_iter__add (iter=3D0x7fffffffa750,=
 al=3D0x7fffffffa710, max_stack_depth=3D<optimized out>, =
arg=3D0x7fffffffbbd0) at util/hist.c:1232
>>   11 0x0000000010056d98 in process_sample_event (tool=3D0x7fffffffbbd0,=
 event=3D0x7ffff6223c38, sample=3D0x7fffffffa908, evsel=3D<optimized =
out>, machine=3D0x10524ef8) at builtin-report.c:332
>>=20
>> Here arch_skip_callchain_idx calls thread__find_symbol and which
>> invokes thread__find_map with uninitialised "addr_location".
>> Snippet:
>>=20
>> thread__find_symbol(thread, PERF_RECORD_MISC_USER, ip, &al);
>>=20
>> Recent change with commit 0dd5041c9a0ea ("perf addr_location:
>> Add init/exit/copy functions"), introduced "maps__zput" in the
>> function thread__find_map. This could result in segfault while
>> accessing uninitialised map from "struct addr_location". Fix this
>> by adding addr_location__init and addr_location__exit in
>> arch_skip_callchain_idx.
>=20
> Thanks, applied.

Hi Arnaldo,

Thanks for picking the fix=20

Athira
>=20
>> Fixes: 0dd5041c9a0ea ("perf addr_location: Add init/exit/copy =
functions")
>=20
>> Reported-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>=20
> I'll also do a audit of all calls to thread__find_map() and its =
callers
> to check for other such cases :-\
>=20
> For instance, this one seem buggy as well, Adrian?
>=20
> diff --git a/tools/perf/util/dlfilter.c b/tools/perf/util/dlfilter.c
> index 46f74b2344dbb34c..798a53d7e6c9dfc5 100644
> --- a/tools/perf/util/dlfilter.c
> +++ b/tools/perf/util/dlfilter.c
> @@ -166,6 +166,7 @@ static __s32 dlfilter__resolve_address(void *ctx, =
__u64 address, struct perf_dlf
> if (!thread)
> return -1;
>=20
> + addr_location__init(&al);
> thread__find_symbol_fb(thread, d->sample->cpumode, address, &al);
>=20
> al_to_d_al(&al, &d_al);


