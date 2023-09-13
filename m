Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9918F79DF81
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 07:40:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hRomS70a;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rlq762l38z30D2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 15:40:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hRomS70a;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rlq6B15ZLz2ytj
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 15:40:01 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38D52F1P032023;
	Wed, 13 Sep 2023 05:39:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=V+qqAU4aWLT/K9NukPHojyet8r53u/6M7Sg0bPugTsA=;
 b=hRomS70agy/Dv/CnlU2iuexSM5uSLVXVzg92vGI6i1Bx/ez/C+Lj33NRC3g1SbIitnnY
 iBhMlfee5KlfdK5CxSssOzLiGb87N2HkToGaFQmCPWfkonMNidzYRIBSUHAL9RD9KSgW
 mx1NY+H5RSF5ECn52GHlQuJx/T8xUCfKYMxiaJ4GBKcwZQVyxIyd6cRlSIzTYWNHyyrW
 sWtXgEcAWJihYnLU9dmyPNx7pvxEilBkBlUCI5AG6W1Tzy2xR1TF0a1b1mOXNhZz+LQ8
 tbX5Fd2cGx5SAPC2mkH8sHpc0bPCyqcEfrpi8iy1RkX/jslVeM2guaomtsoXNOpy/90J tQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t36k596vf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Sep 2023 05:39:53 +0000
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 38D52Lh3032512;
	Wed, 13 Sep 2023 05:39:15 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t36k590fv-14
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Sep 2023 05:39:15 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 38D373LM002410;
	Wed, 13 Sep 2023 05:02:07 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3t158k88tr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Sep 2023 05:02:07 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 38D524CS59507088
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 13 Sep 2023 05:02:04 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8764C20040;
	Wed, 13 Sep 2023 05:02:04 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 850E820043;
	Wed, 13 Sep 2023 05:02:02 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.17.124])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 13 Sep 2023 05:02:02 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.700.6\))
Subject: Re: [PATCH V2] perf test: Fix parse-events tests to skip parametrized
 events
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <298307AE-8AB5-40B6-A9CC-C1DBE720450C@linux.vnet.ibm.com>
Date: Wed, 13 Sep 2023 10:31:50 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <2C5606DF-4532-4263-9482-50D5668C09AF@linux.vnet.ibm.com>
References: <20230907165933.36442-1-atrajeev@linux.vnet.ibm.com>
 <1F3D650F-91B5-4570-85D2-A925320BE7AE@linux.ibm.com>
 <298307AE-8AB5-40B6-A9CC-C1DBE720450C@linux.vnet.ibm.com>
To: Sachin Sant <sachinp@linux.ibm.com>, Ian Rogers <irogers@google.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>
X-Mailer: Apple Mail (2.3731.700.6)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: QuA4RmqRUySjQbnn1S5Acye_0NWqTD5b
X-Proofpoint-ORIG-GUID: UDIjy8fPTgrXM4BKHXqenGwJGSeGIp0j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-12_24,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 phishscore=0 mlxscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309130046
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
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>, Adrian Hunter <adrian.hunter@intel.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-perf-users@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Disha Goel <disgoel@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 08-Sep-2023, at 7:48 PM, Athira Rajeev =
<atrajeev@linux.vnet.ibm.com> wrote:
>=20
>=20
>=20
>> On 08-Sep-2023, at 11:04 AM, Sachin Sant <sachinp@linux.ibm.com> =
wrote:
>>=20
>>=20
>>=20
>>> On 07-Sep-2023, at 10:29 PM, Athira Rajeev =
<atrajeev@linux.vnet.ibm.com> wrote:
>>>=20
>>> Testcase "Parsing of all PMU events from sysfs" parse events for
>>> all PMUs, and not just cpu. In case of powerpc, the PowerVM
>>> environment supports events from hv_24x7 and hv_gpci PMU which
>>> is of example format like below:
>>>=20
>>> - hv_24x7/CPM_ADJUNCT_INST,domain=3D?,core=3D?/
>>> - hv_gpci/event,partition_id=3D?/
>>>=20
>>> The value for "?" needs to be filled in depending on system
>>> configuration. It is better to skip these parametrized events
>>> in this test as it is done in:
>>> 'commit b50d691e50e6 ("perf test: Fix "all PMU test" to skip
>>> parametrized events")' which handled a simialr instance with
>>> "all PMU test".
>>>=20
>>> Fix parse-events test to skip parametrized events since
>>> it needs proper setup of the parameters.
>>>=20
>>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>>> ---
>>> Changelog:
>>> v1 -> v2:
>>> Addressed review comments from Ian. Updated size of
>>> pmu event name variable and changed bool name which is
>>> used to skip the test.
>>>=20
>>=20
>> The patch fixes the reported issue.
>>=20
>> 6.2: Parsing of all PMU events from sysfs                          : =
Ok
>> 6.3: Parsing of given PMU events from sysfs                        : =
Ok
>>=20
>> Tested-by: Sachin Sant <sachinp@linux.ibm.com>
>>=20
>> - Sachin
>=20
> Hi Sachin, Ian
>=20
> Thanks for testing the patch

Hi Arnaldo

Can you please check and pull this if it looks good to go .

Thanks
Athira
>=20
> Athira
>=20
>=20

