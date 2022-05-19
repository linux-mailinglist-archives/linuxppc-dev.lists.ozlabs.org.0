Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B0952CFFD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 May 2022 11:58:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L3lg93m9Xz3brf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 May 2022 19:58:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=O4mumotZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=O4mumotZ; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L3lfT20dSz301M
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 May 2022 19:58:08 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24J9hCU2012542;
 Thu, 19 May 2022 09:58:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=wFxZx8W8bwWKQXM4PE9relH1M19uKEVIoOHvXjmxzbU=;
 b=O4mumotZ46+ydNvH1co10GHxp+tztAaQxup2Rl6WHOQHhqYixn26v7X4Gq2qKCCOCqSB
 aXIIer4nXatJ2TwGQI+AY82WQoVvEemIjywbxm3mK21tPXFJkXT0AQYli5b/2u8E1JlQ
 gF4v/dfwKjzw6Ia5hkPGRzklR5OE/zey/02R7IcRMs9QOqe6U4/3wTalqXQdBd9xfq/9
 unQfcO9CRi7DCZ0r2x7L9fB5xcE1xdq8yUwy0qDqWAEo41cu64XhOLQQ9I1wz3gziv4H
 DWntE41MnhRAWESlEwEpS6UirU4dt29kB/Lh8CYGZZNh1yItM8wUUyyceWFM1c0gaEGm GA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g5kgqgaba-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 May 2022 09:58:00 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24J9i95D014484;
 Thu, 19 May 2022 09:58:00 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g5kgqgaav-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 May 2022 09:58:00 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24J9qdnV004511;
 Thu, 19 May 2022 09:57:58 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06ams.nl.ibm.com with ESMTP id 3g23pjf2j5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 May 2022 09:57:58 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24J9vtPO43712794
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 May 2022 09:57:55 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 542995204F;
 Thu, 19 May 2022 09:57:55 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.211.121.120])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id 01FEE52050;
 Thu, 19 May 2022 09:57:50 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH] tools/perf/test: Fix perf all PMU test to skip
 hv_24x7/hv_gpci tests on powerpc
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <87czgbng7z.fsf@mpe.ellerman.id.au>
Date: Thu, 19 May 2022 15:27:46 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <A6483EC1-243E-425D-97CE-9DC886513793@linux.vnet.ibm.com>
References: <20220518092903.7065-1-atrajeev@linux.vnet.ibm.com>
 <87czgbng7z.fsf@mpe.ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: cFbCfnA_CCrgqkA48CV_07VbJ8jFvjja
X-Proofpoint-ORIG-GUID: qFYHz4GcHc_XrI0Y1-P11WK2NosKW7S0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-19_02,2022-05-19_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 phishscore=0 clxscore=1011 suspectscore=0 bulkscore=0 mlxscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205190055
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
Cc: Ian Rogers <irogers@google.com>, maddy@linux.vnet.ibm.com,
 Nageswara Sastry <rnsastry@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, linux-perf-users@vger.kernel.org,
 Jiri Olsa <jolsa@kernel.org>, disgoel@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 18-May-2022, at 6:35 PM, Michael Ellerman <mpe@ellerman.id.au> =
wrote:
>=20
> Athira Rajeev <atrajeev@linux.vnet.ibm.com> writes:
>> "perf all PMU test" picks the input events from
>> "perf list --raw-dump pmu" list and runs "perf stat -e"
>> for each of the event in the list. In case of powerpc, the
>> PowerVM environment supports events from hv_24x7 and hv_gpci
>> PMU which is of example format like below:
>> - hv_24x7/CPM_ADJUNCT_INST,domain=3D?,core=3D?/
>> - hv_gpci/event,partition_id=3D?/
>>=20
>> The value for "?" needs to be filled in depending on
>> system and respective event. CPM_ADJUNCT_INST needs have
>> core value and domain value. hv_gpci event needs partition_id.
>> Similarly, there are other events for hv_24x7 and hv_gpci
>> having "?" in event format. Hence skip these events on powerpc
>> platform since values like partition_id, domain is specific
>> to system and event.
>>=20
>> Fixes: 3d5ac9effcc6 ("perf test: Workload test of all PMUs")
>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>> ---
>> tools/perf/tests/shell/stat_all_pmu.sh | 10 ++++++++++
>> 1 file changed, 10 insertions(+)
>>=20
>> diff --git a/tools/perf/tests/shell/stat_all_pmu.sh =
b/tools/perf/tests/shell/stat_all_pmu.sh
>> index b30dba455f36..4a854b545bec 100755
>> --- a/tools/perf/tests/shell/stat_all_pmu.sh
>> +++ b/tools/perf/tests/shell/stat_all_pmu.sh
>> @@ -5,6 +5,16 @@
>> set -e
>>=20
>> for p in $(perf list --raw-dump pmu); do
>> +  # In powerpc, skip the events for hv_24x7 and hv_gpci.
>> +  # These events needs input values to be filled in for
>> +  # core, chip, patition id based on system.
>> +  # Example: hv_24x7/CPM_ADJUNCT_INST,domain=3D?,core=3D?/
>> +  # hv_gpci/event,partition_id=3D?/
>> +  # Hence skip these events for ppc.
>> +  if lscpu  |grep ppc && echo "$p" |grep -Eq 'hv_24x7|hv_gpci' ; =
then
>=20
> My system doesn't have lscpu installed, why not use `uname -m`.
>=20
> But why check for ppc at all, the name of the pmu seems unique enough =
-
> no one else is going to call their pmu something so odd :)

Thanks Michael for the review.
Yes, I can directly use pmu name :)=20

Will address this change in V2

Thanks
Athira
>=20
> cheers

