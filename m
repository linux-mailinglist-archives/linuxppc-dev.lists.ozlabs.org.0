Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D1552E4D9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 08:15:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4GgS6JFLz3bmD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 16:15:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ATzd5hgk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ATzd5hgk; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L4Gfm1dKGz2ywj
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 May 2022 16:15:11 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24K5HpKu031635;
 Fri, 20 May 2022 06:15:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=Hoe/XsaJ00glkaVH2ZqTSi8OiMgAqlNehX7+8B6G9pI=;
 b=ATzd5hgkuK+xT6Dmu32XG4z6CQgoQMq4UWbXHkV+WRtIHlzTm83iPBVtXjcUTU2xG4NQ
 cQxOxEygEWwFXSt0lk7R5ziJV4MFXjotEFoG2+KjUqWbycs2zrbm5ldmD2n4KxpyU41C
 5/cy64KrnBOqeSN6mc95dNuIJEJoUpU1hkO8dm0RuhhyIGxBpf0xadq/NWE0GXdVC1m5
 sikN6HW+sWFgyxlDiQuQGzdKWuedI5ly00o73UiGw6bFgQdPTmHT8a4WT4PedxA+4ROU
 eVP4/nNf5vAlkRAR454GgmraajDBg674Q8wSSuYJxaNTLSE4q7VRgwd06T7XorwH1tOA VQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g64qerxxu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 06:15:06 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24K60ll4020846;
 Fri, 20 May 2022 06:15:06 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g64qerxwx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 06:15:06 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24K6Ch3H009357;
 Fri, 20 May 2022 06:15:03 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 3g2429g9m2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 06:15:03 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24K6F0GO49545512
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 May 2022 06:15:00 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6AFC552051;
 Fri, 20 May 2022 06:15:00 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.163.31.125])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id 3C3D75204F;
 Fri, 20 May 2022 06:14:55 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH V2 1/2] powerpc/perf: Add support for caps under sysfs in
 powerpc
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <CAP-5=fURkncicNEs87=QisBJhPkujRUZ51Z1S4A63fz+SXV6rg@mail.gmail.com>
Date: Fri, 20 May 2022 11:44:52 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <03549C78-8965-4599-BE66-D5920B6C1376@linux.vnet.ibm.com>
References: <20220518085502.6914-1-atrajeev@linux.vnet.ibm.com>
 <CAP-5=fWN3Sgyp_hTyYvDrLrnr-7dj6ozERn0tDm5MrU2SEJ2Fg@mail.gmail.com>
 <4D9BD7B3-1FA0-4EFE-A7D9-75BBB84ED308@linux.vnet.ibm.com>
 <CAP-5=fURkncicNEs87=QisBJhPkujRUZ51Z1S4A63fz+SXV6rg@mail.gmail.com>
To: Ian Rogers <irogers@google.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 8rmXbz9Uvdu_zUEEn-xdYIoEnVeTI4sY
X-Proofpoint-ORIG-GUID: _ihGu-k5RsJzCje7oSGNuihal26ESqW8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-20_02,2022-05-19_03,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 mlxscore=0 clxscore=1015
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205200044
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
 Kajol Jain <kjain@linux.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, linux-perf-users@vger.kernel.org,
 Jiri Olsa <jolsa@kernel.org>, disgoel@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 20-May-2022, at 3:06 AM, Ian Rogers <irogers@google.com> wrote:
>=20
> On Thu, May 19, 2022 at 4:29 AM Athira Rajeev
> <atrajeev@linux.vnet.ibm.com> wrote:
>>=20
>>> On 19-May-2022, at 10:12 AM, Ian Rogers <irogers@google.com> wrote:
>>>=20
>>> On Wed, May 18, 2022 at 1:55 AM Athira Rajeev
>>> <atrajeev@linux.vnet.ibm.com> wrote:
>>>>=20
>>>> Add caps support under "/sys/bus/event_source/devices/<pmu>/"
>>>> for powerpc. This directory can be used to expose some of the
>>>> specific features that powerpc PMU supports to the user.
>>>> Example: pmu_name. The name of PMU registered will depend on
>>>> platform, say power9 or power10 or it could be Generic Compat
>>>> PMU.
>>>>=20
>>>> Currently the only way to know which is the registered
>>>> PMU is from the dmesg logs. But clearing the dmesg will make it
>>>> difficult to know exact PMU backend used. And even extracting
>>>> from dmesg will be complicated, as we need  to parse the dmesg
>>>> logs and add filters for pmu name. Whereas by exposing it via
>>>> caps will make it easy as we just need to directly read it from
>>>> the sysfs.
>>>=20
>>> For ARM and x86 in the perf tool this is normally done through a =
cpuid
>>> like function, is there a reason to differ on Power?
>>>=20
>>> Thanks,
>>> Ian
>>=20
>> Hi Ian,
>>=20
>> Thanks for review. The information from cpuid or cpuinfo will provide
>> us the information of the platform/model/machine etc. In case of =
powerpc,
>> we have one case where, though platform points to specific generation =
of the
>> processor, say power9 or power10, the registered PMU could point to
>> different one. To be specific, this is named as Generic Compat PMU =
which
>> is a fallback PMU. This gets registered when the distro doesn't have =
support
>> for platform specific PMU. In that case distro will have a Generic
>> Compat PMU registered which supports basic features for performance =
monitoring.
>> This information can't be fetched from the cpuid data since that will =
point
>> to current platform.
>>=20
>> So the pmu_name exposed via "caps" will be useful to detect the PMU
>> registered and also we target to use this information in some of our
>> selftests.
>=20
> Thanks, I've no problem with the change. Do we need to do a similar
> discovery in the perf tool on old kernels? Perhaps then this
> information could be exposed in the perf list command for self tests.


Hi Ian,

Thanks for review. Thats good one to have. I see in perf tools, we are =
parsing caps data : "env->cpu_pmu_caps" already.
I will check on how this is used and option of having in perf list.
After checking, I will send a follow up patch for the same.

Thanks
Athira
>=20
> Thanks,
> Ian
>=20
>> Thanks
>> Athira
>>>=20
>>>> Add a caps directory to /sys/bus/event_source/devices/cpu/
>>>> for power8, power9, power10 and generic compat PMU in respective
>>>> PMU driver code. Update the pmu_name file under caps folder
>>>> in core-book3s using "attr_update".
>>>>=20
>>>> The information exposed currently:
>>>> - pmu_name : Underlying PMU name from the driver
>>>>=20
>>>> Example result with power9 pmu:
>>>>=20
>>>> # ls /sys/bus/event_source/devices/cpu/caps
>>>> pmu_name
>>>>=20
>>>> # cat /sys/bus/event_source/devices/cpu/caps/pmu_name
>>>> POWER9
>>>>=20
>>>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>>>> ---
>>>> Changelog:
>>>> v1 -> v2:
>>>> Move the show function as generic in core-book3s
>>>> and update show function using sysfs_emit and ppmu->name
>>>> Added Documention for this ABI in patch 2.
>>>> Notes: The caps directory is implemented in PMU for other
>>>> architectures already. Reference commit for x86:
>>>> commit b00233b53065 ("perf/x86: Export some PMU attributes in caps/ =
directory")
>>>>=20
>>>> arch/powerpc/perf/core-book3s.c        | 31 =
++++++++++++++++++++++++++
>>>> arch/powerpc/perf/generic-compat-pmu.c | 10 +++++++++
>>>> arch/powerpc/perf/power10-pmu.c        | 10 +++++++++
>>>> arch/powerpc/perf/power8-pmu.c         | 10 +++++++++
>>>> arch/powerpc/perf/power9-pmu.c         | 10 +++++++++
>>>> 5 files changed, 71 insertions(+)
>>>>=20
>>>> diff --git a/arch/powerpc/perf/core-book3s.c =
b/arch/powerpc/perf/core-book3s.c
>>>> index b5b42cf0a703..a208f502a80b 100644
>>>> --- a/arch/powerpc/perf/core-book3s.c
>>>> +++ b/arch/powerpc/perf/core-book3s.c
>>>> @@ -2488,6 +2488,33 @@ static int power_pmu_prepare_cpu(unsigned =
int cpu)
>>>>      return 0;
>>>> }
>>>>=20
>>>> +static ssize_t pmu_name_show(struct device *cdev,
>>>> +               struct device_attribute *attr,
>>>> +               char *buf)
>>>> +{
>>>> +       if (ppmu)
>>>> +               return sysfs_emit(buf, "%s\n", ppmu->name);
>>>> +
>>>> +       return 0;
>>>> +}
>>>> +
>>>> +static DEVICE_ATTR_RO(pmu_name);
>>>> +
>>>> +static struct attribute *pmu_caps_attrs[] =3D {
>>>> +       &dev_attr_pmu_name.attr,
>>>> +       NULL
>>>> +};
>>>> +
>>>> +static const struct attribute_group pmu_caps_group =3D {
>>>> +       .name  =3D "caps",
>>>> +       .attrs =3D pmu_caps_attrs,
>>>> +};
>>>> +
>>>> +static const struct attribute_group *pmu_caps_groups[] =3D {
>>>> +       &pmu_caps_group,
>>>> +       NULL,
>>>> +};
>>>> +
>>>> int __init register_power_pmu(struct power_pmu *pmu)
>>>> {
>>>>      if (ppmu)
>>>> @@ -2498,6 +2525,10 @@ int __init register_power_pmu(struct =
power_pmu *pmu)
>>>>              pmu->name);
>>>>=20
>>>>      power_pmu.attr_groups =3D ppmu->attr_groups;
>>>> +
>>>> +       if (ppmu->flags & PPMU_ARCH_207S)
>>>> +               power_pmu.attr_update =3D pmu_caps_groups;
>>>> +
>>>>      power_pmu.capabilities |=3D (ppmu->capabilities & =
PERF_PMU_CAP_EXTENDED_REGS);
>>>>=20
>>>> #ifdef MSR_HV
>>>> diff --git a/arch/powerpc/perf/generic-compat-pmu.c =
b/arch/powerpc/perf/generic-compat-pmu.c
>>>> index f3db88aee4dd..817c69863038 100644
>>>> --- a/arch/powerpc/perf/generic-compat-pmu.c
>>>> +++ b/arch/powerpc/perf/generic-compat-pmu.c
>>>> @@ -151,9 +151,19 @@ static const struct attribute_group =
generic_compat_pmu_format_group =3D {
>>>>      .attrs =3D generic_compat_pmu_format_attr,
>>>> };
>>>>=20
>>>> +static struct attribute *generic_compat_pmu_caps_attrs[] =3D {
>>>> +       NULL
>>>> +};
>>>> +
>>>> +static struct attribute_group generic_compat_pmu_caps_group =3D {
>>>> +       .name  =3D "caps",
>>>> +       .attrs =3D generic_compat_pmu_caps_attrs,
>>>> +};
>>>> +
>>>> static const struct attribute_group =
*generic_compat_pmu_attr_groups[] =3D {
>>>>      &generic_compat_pmu_format_group,
>>>>      &generic_compat_pmu_events_group,
>>>> +       &generic_compat_pmu_caps_group,
>>>>      NULL,
>>>> };
>>>>=20
>>>> diff --git a/arch/powerpc/perf/power10-pmu.c =
b/arch/powerpc/perf/power10-pmu.c
>>>> index c6d51e7093cf..d1adcd9f52e2 100644
>>>> --- a/arch/powerpc/perf/power10-pmu.c
>>>> +++ b/arch/powerpc/perf/power10-pmu.c
>>>> @@ -258,6 +258,15 @@ static const struct attribute_group =
power10_pmu_format_group =3D {
>>>>      .attrs =3D power10_pmu_format_attr,
>>>> };
>>>>=20
>>>> +static struct attribute *power10_pmu_caps_attrs[] =3D {
>>>> +       NULL
>>>> +};
>>>> +
>>>> +static struct attribute_group power10_pmu_caps_group =3D {
>>>> +       .name  =3D "caps",
>>>> +       .attrs =3D power10_pmu_caps_attrs,
>>>> +};
>>>> +
>>>> static const struct attribute_group *power10_pmu_attr_groups_dd1[] =
=3D {
>>>>      &power10_pmu_format_group,
>>>>      &power10_pmu_events_group_dd1,
>>>> @@ -267,6 +276,7 @@ static const struct attribute_group =
*power10_pmu_attr_groups_dd1[] =3D {
>>>> static const struct attribute_group *power10_pmu_attr_groups[] =3D =
{
>>>>      &power10_pmu_format_group,
>>>>      &power10_pmu_events_group,
>>>> +       &power10_pmu_caps_group,
>>>>      NULL,
>>>> };
>>>>=20
>>>> diff --git a/arch/powerpc/perf/power8-pmu.c =
b/arch/powerpc/perf/power8-pmu.c
>>>> index e37b1e714d2b..2518f5375d4a 100644
>>>> --- a/arch/powerpc/perf/power8-pmu.c
>>>> +++ b/arch/powerpc/perf/power8-pmu.c
>>>> @@ -187,9 +187,19 @@ static const struct attribute_group =
power8_pmu_events_group =3D {
>>>>      .attrs =3D power8_events_attr,
>>>> };
>>>>=20
>>>> +static struct attribute *power8_pmu_caps_attrs[] =3D {
>>>> +       NULL
>>>> +};
>>>> +
>>>> +static struct attribute_group power8_pmu_caps_group =3D {
>>>> +       .name  =3D "caps",
>>>> +       .attrs =3D power8_pmu_caps_attrs,
>>>> +};
>>>> +
>>>> static const struct attribute_group *power8_pmu_attr_groups[] =3D {
>>>>      &isa207_pmu_format_group,
>>>>      &power8_pmu_events_group,
>>>> +       &power8_pmu_caps_group,
>>>>      NULL,
>>>> };
>>>>=20
>>>> diff --git a/arch/powerpc/perf/power9-pmu.c =
b/arch/powerpc/perf/power9-pmu.c
>>>> index c393e837648e..5c654ce1a417 100644
>>>> --- a/arch/powerpc/perf/power9-pmu.c
>>>> +++ b/arch/powerpc/perf/power9-pmu.c
>>>> @@ -258,9 +258,19 @@ static const struct attribute_group =
power9_pmu_format_group =3D {
>>>>      .attrs =3D power9_pmu_format_attr,
>>>> };
>>>>=20
>>>> +static struct attribute *power9_pmu_caps_attrs[] =3D {
>>>> +       NULL
>>>> +};
>>>> +
>>>> +static struct attribute_group power9_pmu_caps_group =3D {
>>>> +       .name  =3D "caps",
>>>> +       .attrs =3D power9_pmu_caps_attrs,
>>>> +};
>>>> +
>>>> static const struct attribute_group *power9_pmu_attr_groups[] =3D {
>>>>      &power9_pmu_format_group,
>>>>      &power9_pmu_events_group,
>>>> +       &power9_pmu_caps_group,
>>>>      NULL,
>>>> };
>>>>=20
>>>> --
>>>> 2.31.1

