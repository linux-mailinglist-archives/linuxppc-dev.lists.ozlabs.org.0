Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9674D5F69C3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 16:38:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MjvFc3ZDkz3dqX
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Oct 2022 01:38:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Azhj3cVZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Azhj3cVZ;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MjvDh006zz30MT
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Oct 2022 01:37:55 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 296EUQKK011927;
	Thu, 6 Oct 2022 14:37:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type : subject :
 from : in-reply-to : date : cc : message-id : references : to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=9X8/74YpkaBXABy1eOaGKcz/s6roABjBgguu5B9+XEQ=;
 b=Azhj3cVZ9REp5yEFkKKTX/lK6/3VFUljplAte0Mgko1LmgTITqe+oyt2MCxIT+L7QLgr
 toNy4IerVEtCh7JEUblrKjWNy8vVR1BpEhfKNxZ3/ZJamHuG9T0LPQyBYuuoXiRW7KX/
 7oDLaUJvMY/kwakv/PvUEmMvdMwRRx5OQ+MlQs7d7KK7T8/EXXgmBljfWarjm2iJfl8I
 mB75vW7pMqmJJEJRFuWgdwFsauE9B3Z85i9iAeLNMXtRaKoV5djTUHVvEcGpXl5kI2XH
 zSE7yQxHWmGF0gfEwaEvkzxysV2un2jUw50G4uyZMXVlJTavfowM6oW5+X5/Gne8Zifs cQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3k20uf07c1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Oct 2022 14:37:47 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 296EVkmR016783;
	Thu, 6 Oct 2022 14:37:47 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3k20uf07b2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Oct 2022 14:37:46 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 296EZkXH005516;
	Thu, 6 Oct 2022 14:37:45 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma01fra.de.ibm.com with ESMTP id 3jxd68waeh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Oct 2022 14:37:45 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 296EbfGl65274364
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 6 Oct 2022 14:37:41 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 99FAA4C044;
	Thu,  6 Oct 2022 14:37:41 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 404DE4C040;
	Thu,  6 Oct 2022 14:37:39 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.77.239])
	by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
	Thu,  6 Oct 2022 14:37:39 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Subject: Re: [PATCH] tools/perf: Fix aggr_printout to display cpu field
 irrespective of core value
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <Yz7gIHyBhvR5UcaM@kernel.org>
Date: Thu, 6 Oct 2022 20:07:36 +0530
Message-Id: <F6A73E40-46B2-4054-8AD1-C906A0F2CD31@linux.vnet.ibm.com>
References: <993a1391ee931e859d972c460644d171@imap.linux.ibm.com>
 <CAP-5=fWJ0YBxdCarpNSfbzoAZ9uTAtgj4CdR7sQU8748Y-+DVA@mail.gmail.com>
 <6A5D0603-CF66-43B4-A13F-0308CF01967A@linux.vnet.ibm.com>
 <CAP-5=fU=bwv-e_53QagWsKvW8wjibOjfGvnivWFFVba5A55boA@mail.gmail.com>
 <Yzx4A+2I4yWTlbEn@kernel.org> <Yzx4ET7QU2VpCcsx@kernel.org>
 <137635B2-F4E8-4C65-B797-5C6511E265A8@linux.vnet.ibm.com>
 <Yz14hG3EVJPph11m@kernel.org> <Yz16FdcUF+Wn8xvA@kernel.org>
 <3D36EC01-B516-46CA-BC71-010617DB4A9D@linux.vnet.ibm.com>
 <Yz7gIHyBhvR5UcaM@kernel.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: zJHtSjxVP7z3aZDxsjBNGqN6e6OfAZeS
X-Proofpoint-ORIG-GUID: KIg7qIVGLDWW7H4n5MG-ElXtK_BjRgbn
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-06_02,2022-10-06_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 priorityscore=1501 bulkscore=0 mlxscore=0 impostorscore=0 adultscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210060085
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
Cc: Ian Rogers <irogers@google.com>, maddy@linux.vnet.ibm.com, Nageswara Sastry <rnsastry@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>, linux-perf-users <linux-perf-users@vger.kernel.org>, James Clark <james.clark@arm.com>, Jiri Olsa <jolsa@kernel.org>, atrajeev <atrajeev@imap.linux.ibm.com>, Disha Goel <disgoel@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 06-Oct-2022, at 7:33 PM, Arnaldo Carvalho de Melo <acme@kernel.org> wr=
ote:
>=20
> Em Thu, Oct 06, 2022 at 06:16:14PM +0530, Athira Rajeev escreveu:
>>=20
>>=20
>>> On 05-Oct-2022, at 6:05 PM, Arnaldo Carvalho de Melo <acme@kernel.org> =
wrote:
>>>=20
>>> Em Wed, Oct 05, 2022 at 09:28:52AM -0300, Arnaldo Carvalho de Melo escr=
eveu:
>>>> Em Wed, Oct 05, 2022 at 10:23:39AM +0530, Athira Rajeev escreveu:
>>>>> diff --git a/tools/perf/util/stat-display.c b/tools/perf/util/stat-di=
splay.c
>>>>> index b82844cb0ce7..cf28020798ec 100644
>>>>> --- a/tools/perf/util/stat-display.c
>>>>> +++ b/tools/perf/util/stat-display.c
>>>>> @@ -168,7 +168,7 @@ static void aggr_printout(struct perf_stat_config=
 *config,
>>>>> 					id.socket,
>>>>> 					id.die,
>>>>> 					id.core);
>>>>> -			} else if (id.core > -1) {
>>>>> +			} else if (id.cpu.cpu > -1) {
>>>>> 				fprintf(config->output, "\"cpu\" : \"%d\", ",
>>>>> 					id.cpu.cpu);
>>>>> 			}
>>>>> @@ -179,7 +179,7 @@ static void aggr_printout(struct perf_stat_config=
 *config,
>>>>> 					id.die,
>>>>> 					config->csv_output ? 0 : -3,
>>>>> 					id.core, config->csv_sep);
>>>>> -			} else if (id.core > -1) {
>>>>> +			} else if (id.cpu.cpu > -1) {
>>>>> 				fprintf(config->output, "CPU%*d%s",
>>>>> 					config->csv_output ? 0 : -7,
>>>>> 					id.cpu.cpu, config->csv_sep);
>>>>> --=20
>>>>> If it is confusing, shall I send it as a separate patch along with Te=
sted-by from Ian ?
>>>>=20
>>>> I'll have to do this by hand, tried pointing b4 to this message and it
>>>> picked the old one, also tried to save the message and apply by hand,
>>>> its mangled.
>>>=20
>>> This is what I have now, will force push later, please triple check :-)
>>=20
>>=20
>> Sorry for all the confusion Arnaldo. Hereafter, I will resubmit the patc=
h to avoid this.
>> In below patch which you shared, code change is correct. But commit mess=
age is different.
>> So to avoid further confusion, I went ahead and posted a separate patch =
in the mailing list with:
>>=20
>> subject: [PATCH] tools/perf: Fix cpu check to use id.cpu.cpu in aggr_pri=
ntout
>> Patch link: https://lore.kernel.org/lkml/20221006114225.66303-1-atrajeev=
@linux.vnet.ibm.com/T/#u
>>=20
>> Please pick the separately send patch.
>=20
> Ok, will do.

Thanks Arnaldo.
>=20
> - Arnaldo

