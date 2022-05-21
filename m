Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A872652F8BC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 May 2022 06:48:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4rgj0Q6Xz3bsl
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 May 2022 14:48:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Vcvqi9qW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Vcvqi9qW; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L4rfz4lmYz306j
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 May 2022 14:47:22 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24L45293028200;
 Sat, 21 May 2022 04:47:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=P4n6t9DMCk0SfMsdRfYM/lkWoUkdNmhGBwKQDsLys2U=;
 b=Vcvqi9qWWLttOW0cce5UwkKNI2tbNI7wWZEhKKbexjnSl9LIhTsbNXNY8TlsBe2h4PtL
 t0IXaWeAydh30CHgs5zIsbcQkTQih1lxDQA5eDk0yrf/0ETNJObINoJhLfJrc/76dkmH
 hS9YC1si83xckDzBPVBUg0Du+eFQ7aut5eQWaT0v/EJn/z/QDNNAle80EPx1g+3qPMoE
 bCjN0r/fg107LWCOf01p7Xdg21Bsh7KjRh497+cdNSDCThvhANrw95dtljhapLTKP/mc
 bUw9m4NIkXKk/GLlfvnno75fwY3JtQHeHRpem53nVWQUOInvbOUeUFz7lcUaKbd1pN1Y PQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3g6rr98eej-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 21 May 2022 04:47:12 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24L4lCOB028758;
 Sat, 21 May 2022 04:47:12 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3g6rr98eeb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 21 May 2022 04:47:12 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24L47hQc011690;
 Sat, 21 May 2022 04:47:10 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 3g6qq982xm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 21 May 2022 04:47:10 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 24L4X8HR50004282
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 21 May 2022 04:33:08 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3AFF24C044;
 Sat, 21 May 2022 04:47:07 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0FD664C040;
 Sat, 21 May 2022 04:47:03 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.163.18.237])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Sat, 21 May 2022 04:47:02 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH V2] tools/perf/tests: Fix session topology test to skip
 the test in guest environment
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <CAP-5=fVAfjUHvhLF2E2UZo+BwneSex0GV5BgbHAV6bvdUxj_9w@mail.gmail.com>
Date: Sat, 21 May 2022 10:16:59 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <BD2D6432-8327-4090-958A-71573169E9AA@linux.vnet.ibm.com>
References: <20220511114959.84002-1-atrajeev@linux.vnet.ibm.com>
 <151b1538daf92259702242dbf734230aea3199fe.camel@linux.vnet.ibm.com>
 <CAP-5=fVAfjUHvhLF2E2UZo+BwneSex0GV5BgbHAV6bvdUxj_9w@mail.gmail.com>
To: Ian Rogers <irogers@google.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: GuGcSAaL2YTWwohfHTw9kOZWql6kuAkF
X-Proofpoint-ORIG-GUID: op8Yi7aU6ikE6yj1TgTkl_GXzcOu4dTn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-20_08,2022-05-20_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 mlxscore=0 spamscore=0
 clxscore=1015 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2205210023
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
Cc: maddy@linux.vnet.ibm.com, Nageswara Sastry <rnsastry@linux.ibm.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, linux-perf-users@vger.kernel.org,
 Jiri Olsa <jolsa@kernel.org>, kjain@linux.ibm.com,
 Disha Goel <disgoel@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 14-May-2022, at 12:03 AM, Ian Rogers <irogers@google.com> wrote:
>=20
> On Thu, May 12, 2022 at 11:18 PM Disha Goel =
<disgoel@linux.vnet.ibm.com> wrote:
>>=20
>>=20
>>=20
>> -----Original Message-----
>> From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>> To: acme@kernel.org, jolsa@kernel.org
>> Cc: mpe@ellerman.id.au, linux-perf-users@vger.kernel.org, =
linuxppc-dev@lists.ozlabs.org, maddy@linux.vnet.ibm.com, =
rnsastry@linux.ibm.com, kjain@linux.ibm.com, disgoel@linux.vnet.ibm.com, =
irogers@google.com
>> Subject: [PATCH V2] tools/perf/tests: Fix session topology test to =
skip the test in guest environment
>> Date: Wed, 11 May 2022 17:19:59 +0530
>>=20
>> The session topology test fails in powerpc pSeries platform.
>>=20
>> Test logs:
>>=20
>> <<>>
>>=20
>> Session topology : FAILED!
>>=20
>> <<>>
>>=20
>>=20
>> This testcases tests cpu topology by checking the core_id and
>>=20
>> socket_id stored in perf_env from perf session. The data from
>>=20
>> perf session is compared with the cpu topology information
>>=20
>> from "/sys/devices/system/cpu/cpuX/topology" like core_id,
>>=20
>> physical_package_id. In case of virtual environment, detail
>>=20
>> like physical_package_id is restricted to be exposed. Hence
>>=20
>> physical_package_id is set to -1. The testcase fails on such
>>=20
>> platforms since socket_id can't be fetched from topology info.
>>=20
>>=20
>> Skip the testcase in powerpc if physical_package_id returns -1
>>=20
>>=20
>> Signed-off-by: Athira Rajeev <
>>=20
>> atrajeev@linux.vnet.ibm.com
>>=20
>>>=20
>>=20
>> ---
>>=20
>> Changelog:
>>=20
>> v1 -> v2:
>>=20
>> Addressed review comments from Arnaldo and Michael Ellerman.
>>=20
>> skip the test in powerpc when physical_package_id is set to
>>=20
>> -1.
>>=20
>> Dropped patch 1 from V1 since current change doesn't use info
>>=20
>> from /proc/cpuinfo and rather uses physical_package_id value.
>>=20
>>=20
>> tools/perf/tests/topology.c | 11 +++++++++++
>>=20
>> 1 file changed, 11 insertions(+)
>>=20
>>=20
>> Tested the patch on powerpc and powernv, session topology test works =
fine with the patch.
>>=20
>> Tested-by: Disha Goel <disgoel@linux.vnet.ibm.com>
>=20
>=20
> Acked-by: Ian Rogers <irogers@google.com>
>=20
> Thanks,
> Ian

Hi,

Thanks all for the review.

Athira
>=20
>> diff --git a/tools/perf/tests/topology.c =
b/tools/perf/tests/topology.c
>>=20
>> index ee1e3dcbc0bd..d23a9e322ff5 100644
>>=20
>> --- a/tools/perf/tests/topology.c
>>=20
>> +++ b/tools/perf/tests/topology.c
>>=20
>> @@ -109,6 +109,17 @@ static int check_cpu_topology(char *path, struct =
perf_cpu_map *map)
>>=20
>>  && strncmp(session->header.env.arch, "aarch64", 7))
>>=20
>>  return TEST_SKIP;
>>=20
>>=20
>> + /*
>>=20
>> + * In powerpc pSeries platform, not all the topology information
>>=20
>> + * are exposed via sysfs. Due to restriction, detail like
>>=20
>> + * physical_package_id will be set to -1. Hence skip this
>>=20
>> + * test if physical_package_id returns -1 for cpu from perf_cpu_map.
>>=20
>> + */
>>=20
>> + if (strncmp(session->header.env.arch, "powerpc", 7)) {
>>=20
>> + if (cpu__get_socket_id(perf_cpu_map__cpu(map, 0)) =3D=3D -1)
>>=20
>> + return TEST_SKIP;
>>=20
>> + }
>>=20
>> +
>>=20
>>  TEST_ASSERT_VAL("Session header CPU map not set", =
session->header.env.cpu);
>>=20
>>=20
>>  for (i =3D 0; i < session->header.env.nr_cpus_avail; i++) {

