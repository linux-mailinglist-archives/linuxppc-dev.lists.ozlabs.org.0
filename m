Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 062387B9D06
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Oct 2023 14:38:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Lu7JGnLb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S1WLS0Fklz3vr1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Oct 2023 23:38:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Lu7JGnLb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S1WKY1hHhz3vjB
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Oct 2023 23:37:20 +1100 (AEDT)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 395CTwWT021621;
	Thu, 5 Oct 2023 12:37:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=KSvqe88UqMhs1BFDwE92o7l8E+W28D8lGwwLKPNmq7c=;
 b=Lu7JGnLbjqH8fzzoaC3H1mOO2RnhlB23Y2VVTmD4g3dH3IVLxoCDUNua9Ybil/1/8QHP
 ajthKg5FSaHV/WM34z+7KDkpvdfG29hnumO3UUXZm0UjSFeNB2M6p/1AmLbGvl8r+5HX
 LM4yhhgFrsPW2Sn0x2rKMcIRXK5YEWfd7rFPY8XPh6efSKOPWaXlz1JK91LshSZB7T6w
 JrYP072n3EsywTywAhzHYY1RWZpZrWrwZmMCOiL2MhtNcGT65+XIu39vA00pH/zi3KJW
 rS5X1fS5K4pr20tR3mRGMQmPnIf/CMQRp9Ieb5083DZg0Lo98B0/qOwzTQBT2HQsbE6Z qQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tht0grujg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Oct 2023 12:37:00 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 395CA1O8010621;
	Thu, 5 Oct 2023 12:32:12 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tht0gr870-168
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Oct 2023 12:32:11 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39561oxa007456;
	Thu, 5 Oct 2023 08:54:32 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3teygm25k4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Oct 2023 08:54:32 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3958sTs642795268
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 5 Oct 2023 08:54:29 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 679722004D;
	Thu,  5 Oct 2023 08:54:29 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4574E20043;
	Thu,  5 Oct 2023 08:54:27 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.109.214.47])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu,  5 Oct 2023 08:54:27 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.700.6\))
Subject: Re: [PATCH 1/3] perf tests test_arm_coresight: Fix the shellcheck
 warning in latest test_arm_coresight.sh
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <552cbde4-6077-d5a4-251e-6c77786e1b31@arm.com>
Date: Thu, 5 Oct 2023 14:24:15 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <3AFF6660-5A0E-4028-BA5A-D18CBAC8E1A4@linux.vnet.ibm.com>
References: <20230929041133.95355-1-atrajeev@linux.vnet.ibm.com>
 <20230929041133.95355-2-atrajeev@linux.vnet.ibm.com>
 <552cbde4-6077-d5a4-251e-6c77786e1b31@arm.com>
To: James Clark <james.clark@arm.com>
X-Mailer: Apple Mail (2.3731.700.6)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: rDdUcwk9BAMp2TffWHz3ssQ6rY7vJpN_
X-Proofpoint-GUID: GL5AbmbCDsQBvxZoRH3FjdjLVBY16lSi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-05_08,2023-10-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=999
 mlxscore=0 clxscore=1011 priorityscore=1501 spamscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310050098
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
Cc: Ian Rogers <irogers@google.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>, "coresight@lists.linaro.org" <coresight@lists.linaro.org>, Adrian Hunter <adrian.hunter@intel.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-perf-users <linux-perf-users@vger.kernel.org>, Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Disha Goel <disgoel@linux.vnet.ibm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 05-Oct-2023, at 1:50 PM, James Clark <james.clark@arm.com> wrote:
>=20
>=20
>=20
> On 29/09/2023 05:11, Athira Rajeev wrote:
>> Running shellcheck on tests/shell/test_arm_coresight.sh
>> throws below warnings:
>>=20
>> In tests/shell/test_arm_coresight.sh line 15:
>> cs_etm_path=3D$(find  /sys/bus/event_source/devices/cs_etm/ -name =
cpu* -print -quit)
>>                  ^--^ SC2061: Quote the parameter to -name so the =
shell won't interpret it.
>>=20
>> In tests/shell/test_arm_coresight.sh line 20:
>> if [ $archhver -eq 5 -a "$(printf "0x%X\n" $archpart)" =3D "0xA13" ] =
; then
>>                              ^-- SC2166: Prefer [ p ] && [ q ] as [ p =
-a q ] is not well defined
>>=20
>> This warning is observed after commit:
>> "commit bb350847965d ("perf test: Update cs_etm testcase for Arm =
ETE")"
>>=20
>> Fixed this issue by using quoting 'cpu*' for SC2061 and
>> using "&&" in line number 20 for SC2166 warning
>>=20
>> Fixes: bb350847965d ("perf test: Update cs_etm testcase for Arm ETE")
>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>> ---
>> tools/perf/tests/shell/test_arm_coresight.sh | 4 ++--
>> 1 file changed, 2 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/tools/perf/tests/shell/test_arm_coresight.sh =
b/tools/perf/tests/shell/test_arm_coresight.sh
>> index fe78c4626e45..f2115dfa24a5 100755
>> --- a/tools/perf/tests/shell/test_arm_coresight.sh
>> +++ b/tools/perf/tests/shell/test_arm_coresight.sh
>> @@ -12,12 +12,12 @@
>> glb_err=3D0
>>=20
>> cs_etm_dev_name() {
>> - cs_etm_path=3D$(find  /sys/bus/event_source/devices/cs_etm/ -name =
cpu* -print -quit)
>> + cs_etm_path=3D$(find  /sys/bus/event_source/devices/cs_etm/ -name =
'cpu*' -print -quit)
>> trcdevarch=3D$(cat ${cs_etm_path}/mgmt/trcdevarch)
>> archhver=3D$((($trcdevarch >> 12) & 0xf))
>> archpart=3D$(($trcdevarch & 0xfff))
>>=20
>> - if [ $archhver -eq 5 -a "$(printf "0x%X\n" $archpart)" =3D "0xA13" =
] ; then
>> + if [ $archhver -eq 5 ] && [ "$(printf "0x%X\n" $archpart)" =3D =
"0xA13" ] ; then
>> echo "ete"
>> else
>> echo "etm"
>=20
>=20
> Reviewed-by: James Clark <james.clark@arm.com>

Thanks James for checking

Athira


