Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ADEE77FD05
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 19:31:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=k52BGbqL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RRX9C70Chz3cSq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Aug 2023 03:31:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=k52BGbqL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RRX8J1hgYz3bYx
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Aug 2023 03:30:23 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37HHJmrd005222;
	Thu, 17 Aug 2023 17:30:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=1KAubPcUxLh3dex57MSiu9HGBDi2i0vc2xRnUzGk9+A=;
 b=k52BGbqLjl4yMnXN7IiNu816MMzETOfu6zPVNgzBmPX5hOmm86WhtSQoS8fRyfsewuY5
 72OD7QGuZyIZFHkYXnPEJMpkQycm+TbFAXqUCt/T2eY0yr31ziaKDy9N0DAa9NbwZ5qJ
 OAqawmfRinu/q2YlICsdvmkS95JKcf13c6x3OogAT3uHGaBxfsaGcpJZQfNeNFfG9ekC
 CuTVyFRSV1K+aGleKqtJSdR+EsWf5mG/XSRCmqRg0uox1Qgx22GXJfYJMF/Q8oSgzkx4
 +fmZuzxROSsq/vYOz03Z4j7318Dw4P8T7JE/LO+KVkWC2GpjBIFmw6iBQpN3mVvf+WBV fQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3shqutr75y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Aug 2023 17:30:18 +0000
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 37HHNohR017981;
	Thu, 17 Aug 2023 17:30:18 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3shqutr75j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Aug 2023 17:30:18 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 37HFxg6s002403;
	Thu, 17 Aug 2023 17:30:17 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3sendnqwsk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Aug 2023 17:30:17 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 37HHUEVF21299718
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Aug 2023 17:30:14 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0951D2004F;
	Thu, 17 Aug 2023 17:30:14 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1973C20040;
	Thu, 17 Aug 2023 17:30:12 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.32.94])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 17 Aug 2023 17:30:11 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.500.231\))
Subject: Re: [PATCH] perf test: Fix parse-events tests to skip parametrized
 events
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <A776945C-DDE0-4A12-960E-50641D237C6F@linux.ibm.com>
Date: Thu, 17 Aug 2023 23:00:00 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <28C06F9A-2063-45C8-95FB-31EB3BE81221@linux.vnet.ibm.com>
References: <20230807045016.23409-1-atrajeev@linux.vnet.ibm.com>
 <A776945C-DDE0-4A12-960E-50641D237C6F@linux.ibm.com>
To: Sachin Sant <sachinp@linux.ibm.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>
X-Mailer: Apple Mail (2.3731.500.231)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 1pv-XkakowLIDVxYdUlaZ3Y_1izMcBTC
X-Proofpoint-GUID: c-D0Ud7qkLBJA1wn7srWExvNi1cfcY6c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-17_12,2023-08-17_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 mlxlogscore=999 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 mlxscore=0 impostorscore=0 clxscore=1015 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308170153
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
Cc: Ian Rogers <irogers@google.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>, linux-perf-users@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Disha Goel <disgoel@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 07-Aug-2023, at 11:40 AM, Sachin Sant <sachinp@linux.ibm.com> =
wrote:
>=20
>=20
>=20
>> On 07-Aug-2023, at 10:20 AM, Athira Rajeev =
<atrajeev@linux.vnet.ibm.com> wrote:
>>=20
>> Testcase "Parsing of all PMU events from sysfs" parse events for
>> all PMUs, and not just cpu. In case of powerpc, the PowerVM
>> environment supports events from hv_24x7 and hv_gpci PMU which
>> is of example format like below:
>>=20
>> - hv_24x7/CPM_ADJUNCT_INST,domain=3D?,core=3D?/
>> - hv_gpci/event,partition_id=3D?/
>>=20
>> The value for "?" needs to be filled in depending on system
>> configuration. It is better to skip these parametrized events
>> in this test as it is done in:
>> 'commit b50d691e50e6 ("perf test: Fix "all PMU test" to skip
>> parametrized events")' which handled a simialr instance with
>> "all PMU test".
>>=20
>> Fix parse-events test to skip parametrized events since
>> it needs proper setup of the parameters.
>>=20
>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>> =E2=80=94
>=20
> Thanks Athira for the fix. With this fix applied the reported problem
> Is fixed.
>=20
> 6.1: Test event parsing                                            : =
Ok
>  6.2: Parsing of all PMU events from sysfs             : Ok
>  6.3: Parsing of given PMU events from sysfs        : Ok
>=20
> Tested-by: Sachin Sant <sachinp@linux.ibm.com>
>=20
> - Sachin

Hi All,

Looking for review comments on this patch

Thanks
Athira


