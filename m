Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AE84816BE82
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2020 11:22:23 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48RZk46sFLzDqRs
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2020 21:22:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48RZhS6pyPzDqNZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2020 21:20:56 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01PAKpVs045676
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2020 05:20:54 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yb0g4d95f-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2020 05:20:52 -0500
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <naveen.n.rao@linux.vnet.ibm.com>;
 Tue, 25 Feb 2020 10:20:35 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 25 Feb 2020 10:20:32 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01PAKVIW52625566
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Feb 2020 10:20:31 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1812052052;
 Tue, 25 Feb 2020 10:20:31 +0000 (GMT)
Received: from localhost (unknown [9.199.61.128])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 7018052051;
 Tue, 25 Feb 2020 10:20:30 +0000 (GMT)
Date: Tue, 25 Feb 2020 15:50:28 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 4/5] powerpc/sysfs: Show idle_purr and idle_spurr for
 every CPU
To: ego@linux.vnet.ibm.com, Nathan Lynch <nathanl@linux.ibm.com>
References: <1582262314-8319-1-git-send-email-ego@linux.vnet.ibm.com>
 <1582262314-8319-5-git-send-email-ego@linux.vnet.ibm.com>
 <87eeunubp7.fsf@linux.ibm.com> <20200224051447.GC12846@in.ibm.com>
In-Reply-To: <20200224051447.GC12846@in.ibm.com>
MIME-Version: 1.0
User-Agent: astroid/v0.15-13-gb675b421 (https://github.com/astroidmail/astroid)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
x-cbid: 20022510-4275-0000-0000-000003A5436E
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20022510-4276-0000-0000-000038B958DB
Message-Id: <1582625516.nbsanohdks.naveen@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-25_02:2020-02-21,
 2020-02-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0 phishscore=0
 priorityscore=1501 spamscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002250083
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Gautham R Shenoy wrote:
> On Fri, Feb 21, 2020 at 10:50:12AM -0600, Nathan Lynch wrote:
>> "Gautham R. Shenoy" <ego@linux.vnet.ibm.com> writes:
>> > diff --git a/arch/powerpc/kernel/sysfs.c b/arch/powerpc/kernel/sysfs.c
>> > index 80a676d..5b4b450 100644
>> > --- a/arch/powerpc/kernel/sysfs.c
>> > +++ b/arch/powerpc/kernel/sysfs.c
>> > @@ -19,6 +19,7 @@
>> >  #include <asm/smp.h>
>> >  #include <asm/pmc.h>
>> >  #include <asm/firmware.h>
>> > +#include <asm/idle.h>
>> >  #include <asm/svm.h>
>> > =20
>> >  #include "cacheinfo.h"
>> > @@ -733,6 +734,42 @@ static void create_svm_file(void)
>> >  }
>> >  #endif /* CONFIG_PPC_SVM */
>> > =20
>> > +static void read_idle_purr(void *val)
>> > +{
>> > +	u64 *ret =3D (u64 *)val;
>>=20
>> No cast from void* needed.
>=20
> Will fix this. Thanks.
>=20
>>=20
>>=20
>> > +
>> > +	*ret =3D read_this_idle_purr();
>> > +}
>> > +
>> > +static ssize_t idle_purr_show(struct device *dev,
>> > +			      struct device_attribute *attr, char *buf)
>> > +{
>> > +	struct cpu *cpu =3D container_of(dev, struct cpu, dev);
>> > +	u64 val;
>> > +
>> > +	smp_call_function_single(cpu->dev.id, read_idle_purr, &val, 1);
>> > +	return sprintf(buf, "%llx\n", val);
>> > +}
>> > +static DEVICE_ATTR(idle_purr, 0400, idle_purr_show, NULL);
>> > +
>> > +static void read_idle_spurr(void *val)
>> > +{
>> > +	u64 *ret =3D (u64 *)val;
>> > +
>> > +	*ret =3D read_this_idle_spurr();
>> > +}
>> > +
>> > +static ssize_t idle_spurr_show(struct device *dev,
>> > +			       struct device_attribute *attr, char *buf)
>> > +{
>> > +	struct cpu *cpu =3D container_of(dev, struct cpu, dev);
>> > +	u64 val;
>> > +
>> > +	smp_call_function_single(cpu->dev.id, read_idle_spurr, &val, 1);
>> > +	return sprintf(buf, "%llx\n", val);
>> > +}
>> > +static DEVICE_ATTR(idle_spurr, 0400, idle_spurr_show, NULL);
>>=20
>> It's regrettable that we have to wake up potentially idle CPUs in order
>> to derive correct idle statistics for them, but I suppose the main user
>> (lparstat) of these interfaces already is causing this to happen by
>> polling the existing per-cpu purr and spurr attributes.
>>=20
>> So now lparstat will incur at minimum four syscalls and four IPIs per
>> CPU per polling interval -- one for each of purr, spurr, idle_purr and
>> idle_spurr. Correct?
>=20
> Yes, it is unforunate that we will end up making four syscalls and
> generating IPI noise, and this is something that I discussed with
> Naveen and Kamalesh. We have the following two constraints:
>=20
> 1) These values of PURR and SPURR required are per-cpu. Hence putting
> them in lparcfg is not an option.
>=20
> 2) sysfs semantics encourages a single value per key, the key being
> the sysfs-file. Something like the following would have made far more
> sense.
>=20
> cat /sys/devices/system/cpu/cpuX/purr_spurr_accounting
> purr:A
> idle_purr:B
> spurr:C
> idle_spurr:D
>=20
> There are some sysfs files which allow something like this. Eg:=20
> /sys/devices/system/cpu/cpu0/cpufreq/stats/time_in_state
>=20
> Thoughts on any other alternatives?

Umm... procfs?
/me ducks

>=20
>=20
>>=20
>> At some point it's going to make sense to batch sampling of remote CPUs'
>> SPRs.

How did you mean this? It looks like we first need to provide a separate=20
user interface, since with the existing sysfs interface providing=20
separate files, I am not sure if we can batch such reads.


- Naveen

