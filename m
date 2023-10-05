Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 53ACF7B9C0E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Oct 2023 11:08:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QHLBaL9G;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S1QhQ2RqCz3vhX
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Oct 2023 20:08:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QHLBaL9G;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S1QgV5jBxz3vXq
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Oct 2023 20:07:34 +1100 (AEDT)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39596Nqq011211;
	Thu, 5 Oct 2023 09:07:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=Grf+04K4KmQG0j0DL9GUzHxA+oovzw2UPAPICVoes/Y=;
 b=QHLBaL9GPXir7qQoeCyVEXi7C2TWZCz4Fc9kbBOLNC/wfDaJAjyR2QQLpjo3oiTtHACh
 P5fhioNA2kzIPazk2dXzf1RBtrODeA3Hj02KO74n5k6lAo/Kgujzl19g6nfTI382agIc
 M+6Y9k6/JAAsMVVOUsablDVcLO2kKbcUeofTQEP7x+9LycIVUYuKSNauhDBLERKWgAhX
 ybiBzkhVi5OYM00gqwTuhJirC6Lc+M5p7h4Y1F2P6MrEE/ybcqjSqOtnI+Vf2parOGtH
 1hMN2wYb2pkMXtS1E5+T0cxLPhANPqTv8WbjOiv1ZD905g+qXQFN4MLDJEYioIE+a6ad sg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tht0ggkj3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Oct 2023 09:07:18 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 395904B8026975;
	Thu, 5 Oct 2023 09:02:18 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tht0gg9cs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Oct 2023 09:02:15 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39565FVq007512;
	Thu, 5 Oct 2023 08:55:30 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3teygm25sr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Oct 2023 08:55:30 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3958tRrg20906638
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 5 Oct 2023 08:55:27 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F144920043;
	Thu,  5 Oct 2023 08:55:26 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3ED9120040;
	Thu,  5 Oct 2023 08:55:25 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.109.214.47])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu,  5 Oct 2023 08:55:25 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.700.6\))
Subject: Re: [PATCH 3/3] tools/perf/tests: Fix shellcheck warning in
 record_sideband.sh test
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <CAM9d7cjr0TDjrMkgu3TJ-JTDbi17SAVfeE0_2=ZCjLJ8_uS=Pw@mail.gmail.com>
Date: Thu, 5 Oct 2023 14:25:14 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <D0806824-6468-4765-A08E-DD7A4DA10F9A@linux.vnet.ibm.com>
References: <20230929041133.95355-1-atrajeev@linux.vnet.ibm.com>
 <20230929041133.95355-4-atrajeev@linux.vnet.ibm.com>
 <CAM9d7cjr0TDjrMkgu3TJ-JTDbi17SAVfeE0_2=ZCjLJ8_uS=Pw@mail.gmail.com>
To: Namhyung Kim <namhyung@kernel.org>
X-Mailer: Apple Mail (2.3731.700.6)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: McLIvj3uJnJyGtW60dDCyzZC2iCMew9S
X-Proofpoint-GUID: R-w7WApHr9jgka9BBXRt5ey6jPMFH0hs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-05_06,2023-10-02_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=999
 mlxscore=0 clxscore=1015 priorityscore=1501 spamscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310050069
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
Cc: irogers@google.com, maddy@linux.ibm.com, kjain@linux.ibm.com, Adrian Hunter <adrian.hunter@intel.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-perf-users@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 05-Oct-2023, at 10:34 AM, Namhyung Kim <namhyung@kernel.org> wrote:
>=20
> On Thu, Sep 28, 2023 at 9:11=E2=80=AFPM Athira Rajeev
> <atrajeev@linux.vnet.ibm.com> wrote:
>>=20
>> Running shellcheck on record_sideband.sh throws below
>> warning:
>>=20
>>        In tests/shell/record_sideband.sh line 25:
>>          if ! perf record -o ${perfdata} -BN --no-bpf-event -C $1 =
true 2>&1 >/dev/null
>>            ^--^ SC2069: To redirect stdout+stderr, 2>&1 must be last =
(or use '{ cmd > file; } 2>&1' to clarify).
>>=20
>> This shows shellcheck warning SC2069 where the redirection
>> order needs to be fixed. Use { cmd > file; } 2>&1 to fix the
>> redirection of perf record output
>>=20
>> Fixes: 23b97c7ee963 ("perf test: Add test case for record sideband =
events")
>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>> ---
>> tools/perf/tests/shell/record_sideband.sh | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/tools/perf/tests/shell/record_sideband.sh =
b/tools/perf/tests/shell/record_sideband.sh
>> index 5024a7ce0c51..7e036763a43c 100755
>> --- a/tools/perf/tests/shell/record_sideband.sh
>> +++ b/tools/perf/tests/shell/record_sideband.sh
>> @@ -22,7 +22,7 @@ trap trap_cleanup EXIT TERM INT
>>=20
>> can_cpu_wide()
>> {
>> -    if ! perf record -o ${perfdata} -BN --no-bpf-event -C $1 true =
2>&1 >/dev/null
>> +    if ! { perf record -o ${perfdata} -BN --no-bpf-event -C $1 true =
> /dev/null; } 2>&1
>=20
> I think we usually go without braces.

Hi Namhyung

Thanks for reviving.I will fix this in V2

Thanks
Athira
>=20
> Thanks,
> Namhyung
>=20
>=20
>>     then
>>         echo "record sideband test [Skipped cannot record cpu$1]"
>>         err=3D2
>> --
>> 2.31.1


