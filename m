Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1404521369
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 13:16:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KyFqK5pBKz3c5C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 21:16:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iGRfjeSG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=iGRfjeSG; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KyFpX5Kmlz2yXP
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 May 2022 21:16:04 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24A9rgDP020336;
 Tue, 10 May 2022 11:15:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=6y+S2gFMxOTPgNBnnU9ALJ/Y/bo+wkwoPamZwjTr6pU=;
 b=iGRfjeSGeBlIXMFj6h/CTelL2AtYvMTqP699lKhAPZ8h5MAyFwOHUJJ52+riwT+VY+ff
 i/3uvuSwnfGuI6CaWkA93Df52TBxT1zXYk+c1Ks0jAKRqI7ZlJWvCDSc9rwsjHVznCLo
 c03w5FnxZZ65E6ck0CYptxuMSSKwhLOQH1v1Kgcq/3sGURiBrffsDckmjd+9VUAazBaP
 w/vx9dAMD3sD9vMo5N+pytNozQBFsGJqPggimzaCdF6Tgt2/8G+vG/JInkQpvSK7mz4H
 E6/Si7i9+u6yoMHJq/lXAegf0+Loaouf14LLrRRc/tAVRDr6idEBF8Sv0DQ4Mzz/IPdr /A== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3fyntr1fyu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 May 2022 11:15:57 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24AB8On6007457;
 Tue, 10 May 2022 11:15:55 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03fra.de.ibm.com with ESMTP id 3fwgd8u2jk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 May 2022 11:15:55 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24ABFpoX54919584
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 May 2022 11:15:51 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CDC39AE045;
 Tue, 10 May 2022 11:15:51 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BB148AE055;
 Tue, 10 May 2022 11:15:49 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.163.24.192])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Tue, 10 May 2022 11:15:49 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH] powerpc/perf: Add support for caps under sysfs in powerpc
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <87leveu722.fsf@mpe.ellerman.id.au>
Date: Tue, 10 May 2022 16:45:45 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <6819C055-F74A-4659-A110-5F8D6091D340@linux.vnet.ibm.com>
References: <20220428054937.28006-1-atrajeev@linux.vnet.ibm.com>
 <87leveu722.fsf@mpe.ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ksgnrO0-ehtbgCo2jbOCDhOyZO9Xfpg-
X-Proofpoint-GUID: ksgnrO0-ehtbgCo2jbOCDhOyZO9Xfpg-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-10_01,2022-05-10_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0 phishscore=0
 impostorscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2205100050
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
Cc: Kajol Jain <kjain@linux.ibm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 06-May-2022, at 6:55 PM, Michael Ellerman <mpe@ellerman.id.au> =
wrote:
>=20
> Hi Athira,
>=20
> Some comments below :)
>=20
> Athira Rajeev <atrajeev@linux.vnet.ibm.com> writes:
>> Add caps support under "/sys/bus/event_source/devices/<pmu>/"
>> for powerpc. This directory can be used to expose some of the
>> specific features that powerpc PMU supports to the user.
>> Example: pmu_name. The name of PMU registered will depend on
>> platform, say power9 or power10 or it could be Generic Compat
>> PMU.
>=20
> Is there precedent for adding a "caps" directory? ie. do other PMUs on
> other architectures already do that?
Hi Michael,

Thanks for the review comments.

Yes, There are other PMU=E2=80=99s on other architectures already having =
=E2=80=9Ccaps=E2=80=9D support.
I will add them in changelog for reference in V2.
>=20
> Is there precedent for adding "pmu_name"?
>=20
> I don't see any mention of them in Documentation/ABI anywhere.
>=20
> If we're the first to do that we should add it to the documentation.
>=20
> As this would set a precedent for other PMUs, please Cc the perf
> maintainers on v2.
>=20
>> Currently the only way to know which is the registered
>> PMU is from the dmesg logs. But clearing the dmesg will make it
>> difficult to know exact PMU backend used. And even extracting
>> from dmesg will be complicated, as we need  to parse the dmesg
>> logs and add filters for pmu name. Whereas by exposing it via
>> caps will make it easy as we just need to directly read it from
>> the sysfs.
>>=20
>> Add a caps directory to /sys/bus/event_source/devices/cpu/
>> for power8, power9, power10 and generic compat PMU.
>>=20
>> The information exposed currently:
>> - pmu_name : Underlying PMU name from the driver
>>=20
>> Example result with power9 pmu:
>>=20
>> # ls /sys/bus/event_source/devices/cpu/caps
>> pmu_name
>>=20
>> # cat /sys/bus/event_source/devices/cpu/caps/pmu_name
>> power9
>>=20
>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>> Reviewed-by: Madhavan Srinivasan <maddy@linux.ibm.com>
>> ---
>> arch/powerpc/perf/generic-compat-pmu.c | 20 ++++++++++++++++++++
>> arch/powerpc/perf/power10-pmu.c        | 20 ++++++++++++++++++++
>> arch/powerpc/perf/power8-pmu.c         | 20 ++++++++++++++++++++
>> arch/powerpc/perf/power9-pmu.c         | 20 ++++++++++++++++++++
>> 4 files changed, 80 insertions(+)
>>=20
>> diff --git a/arch/powerpc/perf/generic-compat-pmu.c =
b/arch/powerpc/perf/generic-compat-pmu.c
>> index f3db88aee4dd..7b5fe2d89007 100644
>> --- a/arch/powerpc/perf/generic-compat-pmu.c
>> +++ b/arch/powerpc/perf/generic-compat-pmu.c
>> @@ -151,9 +151,29 @@ static const struct attribute_group =
generic_compat_pmu_format_group =3D {
>> 	.attrs =3D generic_compat_pmu_format_attr,
>> };
>>=20
>> +static ssize_t pmu_name_show(struct device *cdev,
>> +		struct device_attribute *attr,
>> +		char *buf)
>> +{
>> +	return snprintf(buf, PAGE_SIZE, "generic_compat_pmu");
>> +}
>=20
> That's not a great name, now that it's exposed to userspace.
>=20
> For starters it's only generic on Book3S, and if you look at
> init_generic_compat_pmu() it's really a "ISA >=3D v3.0 fallback PMU" - =
or
> something like that.
>=20
>> +static DEVICE_ATTR_RO(pmu_name);
>> +
>> +static struct attribute *generic_compat_pmu_caps_attrs[] =3D {
>> +	&dev_attr_pmu_name.attr,
>> +	NULL
>> +};
>> +
>> +static struct attribute_group generic_compat_pmu_caps_group =3D {
>> +	.name  =3D "caps",
>> +	.attrs =3D generic_compat_pmu_caps_attrs,
>> +};
>> +
>> static const struct attribute_group *generic_compat_pmu_attr_groups[] =
=3D {
>> 	&generic_compat_pmu_format_group,
>> 	&generic_compat_pmu_events_group,
>> +	&generic_compat_pmu_caps_group,
>> 	NULL,
>> };
>>=20
>> diff --git a/arch/powerpc/perf/power10-pmu.c =
b/arch/powerpc/perf/power10-pmu.c
>> index d3398100a60f..a622ff783719 100644
>> --- a/arch/powerpc/perf/power10-pmu.c
>> +++ b/arch/powerpc/perf/power10-pmu.c
>> @@ -258,6 +258,25 @@ static const struct attribute_group =
power10_pmu_format_group =3D {
>> 	.attrs =3D power10_pmu_format_attr,
>> };
>>=20
>> +static ssize_t pmu_name_show(struct device *cdev,
>> +		struct device_attribute *attr,
>> +		char *buf)
>> +{
>> +	return snprintf(buf, PAGE_SIZE, "power10");
>=20
> I believe that should use sysfs_emit().

Sure will change this.
>=20
>> +}
>> +
>> +static DEVICE_ATTR_RO(pmu_name);
>> +
>> +static struct attribute *power10_pmu_caps_attrs[] =3D {
>> +	&dev_attr_pmu_name.attr,
>> +	NULL
>> +};
>> +
>> +static struct attribute_group power10_pmu_caps_group =3D {
>> +	.name  =3D "caps",
>> +	.attrs =3D power10_pmu_caps_attrs,
>> +};
>> +
>> static const struct attribute_group *power10_pmu_attr_groups_dd1[] =3D =
{
>> 	&power10_pmu_format_group,
>> 	&power10_pmu_events_group_dd1,
>> @@ -267,6 +286,7 @@ static const struct attribute_group =
*power10_pmu_attr_groups_dd1[] =3D {
>> static const struct attribute_group *power10_pmu_attr_groups[] =3D {
>> 	&power10_pmu_format_group,
>> 	&power10_pmu_events_group,
>> +	&power10_pmu_caps_group,
>> 	NULL,
>> };
>=20
> There's a lot of boiler plate repeated for each PMU.
>=20
> We already have power_pmu->name, can we use that and make the show
> function generic at least in core-book3s.c ?

Sure, I will rework on V2 to make the show function generic in =
core-book3s.
For the Generic Compat PMU, now that I am going to use show function =
from core-book3s, the
name exposed will be that of power_pmu->name

Thanks
Athira=20
>=20
> cheers

