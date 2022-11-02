Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C913615D88
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Nov 2022 09:20:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2Kb84P87z3cRW
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Nov 2022 19:20:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=D7WKNDLV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=D7WKNDLV;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2KZ90M0vz2yxd
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Nov 2022 19:19:59 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A26oTe3001526;
	Wed, 2 Nov 2022 08:19:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=js1Lu0//I9VGl7gfT9uz8O/3ugKZA96/iR1SoLjuf6g=;
 b=D7WKNDLVY5LD7z5t6iX30aZJYQtdPTpyxHEYM3qvw75yAy1AiKFwN0gHMG7pjGpPjbEy
 +HEMaCabMTorWiLlvaCm4IssmnZrFihAttFmHVbTvrly/7kZlWiJDWYNsfPVXcixNyxz
 5/RapZK+UPux6NM6ePZ9e34lF+wqcGkINURoOSM02TTVwN7zlGzwTaPXOFKSY/noGp53
 q92VB9o+4I46kRkXcF8+s5EQMhIMWEXWMb2h8jKeEbI5x2bSDYifJANpo1Yy99FpEyp6
 Ijbhu3/x2N+VJie4OhaJ4wsVY4MNUTEXMbjuXKLmxbhec+z1/Ab7KdCZWKzw0lCc73Ka eg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kkh3qy1nw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Nov 2022 08:19:45 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2A28BgR9021824;
	Wed, 2 Nov 2022 08:19:44 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kkh3qy1nc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Nov 2022 08:19:44 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A286c8n006948;
	Wed, 2 Nov 2022 08:19:42 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by ppma04ams.nl.ibm.com with ESMTP id 3kgut969aq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Nov 2022 08:19:42 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2A28Jdfb655986
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 2 Nov 2022 08:19:39 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 60821A404D;
	Wed,  2 Nov 2022 08:19:39 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CA6D5A4040;
	Wed,  2 Nov 2022 08:19:36 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.40.163])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
	Wed,  2 Nov 2022 08:19:36 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH] [perf/core: Update sample_flags for raw_data in
 perf_output_sample
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <Y1Fd57P5I+aSNT/V@hirez.programming.kicks-ass.net>
Date: Wed, 2 Nov 2022 13:49:34 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <164ED8DD-C9A0-40C2-AA12-EB8FA9D4C4C1@linux.vnet.ibm.com>
References: <20221020070657.21571-1-atrajeev@linux.vnet.ibm.com>
 <Y1Fd57P5I+aSNT/V@hirez.programming.kicks-ass.net>
To: Peter Zijlstra <peterz@infradead.org>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: adkodxSF1G9EWweVkaq_Agl-B2UyfgJj
X-Proofpoint-GUID: xoh5G8LW7eUt5W0p11G7KN0OWnHqXz64
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-02_04,2022-11-01_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1011 priorityscore=1501 mlxscore=0 suspectscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 adultscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211020048
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
Cc: Ian Rogers <irogers@google.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Nageswara Sastry <rnsastry@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>, LKML <linux-kernel@vger.kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-perf-users@vger.kernel.org, James Clark <james.clark@arm.com>, Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>, disgoel@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 20-Oct-2022, at 8:10 PM, Peter Zijlstra <peterz@infradead.org> =
wrote:
>=20
> On Thu, Oct 20, 2022 at 12:36:56PM +0530, Athira Rajeev wrote:
>> commit 838d9bb62d13 ("perf: Use sample_flags for raw_data")
>> added check for PERF_SAMPLE_RAW in sample_flags in
>> perf_prepare_sample(). But while copying the sample in memory,
>> the check for sample_flags is not added in perf_output_sample().
>> Fix adds the same in perf_output_sample as well.
>>=20
>> Fixes: 838d9bb62d13 ("perf: Use sample_flags for raw_data")
>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>> ---
>> kernel/events/core.c | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/kernel/events/core.c b/kernel/events/core.c
>> index 4ec3717003d5..daf387c75d33 100644
>> --- a/kernel/events/core.c
>> +++ b/kernel/events/core.c
>> @@ -7099,7 +7099,7 @@ void perf_output_sample(struct =
perf_output_handle *handle,
>> 	if (sample_type & PERF_SAMPLE_RAW) {
>> 		struct perf_raw_record *raw =3D data->raw;
>>=20
>> -		if (raw) {
>> +		if (raw && (data->sample_flags & PERF_SAMPLE_RAW)) {
>> 			struct perf_raw_frag *frag =3D &raw->frag;
>>=20
>> 			perf_output_put(handle, raw->size);
>=20
> Urgh.. something smells here. We already did a PERF_SAMPLE_RAW test.
>=20
> And perf_prepare_sample() explicitly makes data->raw be NULL when not
> set earlier.
>=20
> So what's going wrong?

Hi Peter,

Sorry for late response. I was out on vacation couple of days.

I didn't hit any specific issue or fail with current code. But patch =
intention was
to keep the perf_prepare_sample and perf_output_sample to be in sync =
with the checks that we
are doing.

Thanks
Athira

