Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 645691516A6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Feb 2020 08:54:08 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48BcQj6CpSzDqLg
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Feb 2020 18:54:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48BcNx5K3JzDqBg
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Feb 2020 18:52:30 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0147nB9R051704
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 4 Feb 2020 02:52:28 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2xxk9hag6k-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Feb 2020 02:52:28 -0500
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <naveen.n.rao@linux.vnet.ibm.com>;
 Tue, 4 Feb 2020 07:52:26 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 4 Feb 2020 07:52:23 -0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0147qLFh40960210
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 4 Feb 2020 07:52:21 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8E5C242049;
 Tue,  4 Feb 2020 07:52:21 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2D45842041;
 Tue,  4 Feb 2020 07:52:21 +0000 (GMT)
Received: from localhost (unknown [9.199.60.222])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  4 Feb 2020 07:52:20 +0000 (GMT)
Date: Tue, 04 Feb 2020 13:22:19 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH 2/3] powerpc/sysfs: Show idle_purr and idle_spurr for
 every CPU
To: ego@linux.vnet.ibm.com
References: <1574856072-30972-1-git-send-email-ego@linux.vnet.ibm.com>
 <1574856072-30972-3-git-send-email-ego@linux.vnet.ibm.com>
 <1575564547.si4rk0s96p.naveen@linux.ibm.com>
 <20200203045013.GC13468@in.ibm.com>
In-Reply-To: <20200203045013.GC13468@in.ibm.com>
MIME-Version: 1.0
User-Agent: astroid/v0.15-13-gb675b421 (https://github.com/astroidmail/astroid)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
x-cbid: 20020407-0008-0000-0000-0000034F8587
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20020407-0009-0000-0000-00004A70116E
Message-Id: <1580802180.jpxk9s8apz.naveen@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-04_01:2020-02-04,
 2020-02-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 mlxscore=0 impostorscore=0 clxscore=1011 mlxlogscore=894
 suspectscore=1 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1911200001 definitions=main-2002040057
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Tyrel Datwyler <tyreld@linux.ibm.com>,
 linux-kernel@vger.kernel.org, Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Gautham R Shenoy wrote:
> Hi Naveen,
>=20
> On Thu, Dec 05, 2019 at 10:23:58PM +0530, Naveen N. Rao wrote:
>> >diff --git a/arch/powerpc/kernel/sysfs.c b/arch/powerpc/kernel/sysfs.c
>> >index 80a676d..42ade55 100644
>> >--- a/arch/powerpc/kernel/sysfs.c
>> >+++ b/arch/powerpc/kernel/sysfs.c
>> >@@ -1044,6 +1044,36 @@ static ssize_t show_physical_id(struct device *d=
ev,
>> > }
>> > static DEVICE_ATTR(physical_id, 0444, show_physical_id, NULL);
>> >
>> >+static ssize_t idle_purr_show(struct device *dev,
>> >+			      struct device_attribute *attr, char *buf)
>> >+{
>> >+	struct cpu *cpu =3D container_of(dev, struct cpu, dev);
>> >+	unsigned int cpuid =3D cpu->dev.id;
>> >+	struct lppaca *cpu_lppaca_ptr =3D paca_ptrs[cpuid]->lppaca_ptr;
>> >+	u64 idle_purr_cycles =3D be64_to_cpu(cpu_lppaca_ptr->wait_state_cycle=
s);
>> >+
>> >+	return sprintf(buf, "%llx\n", idle_purr_cycles);
>> >+}
>> >+static DEVICE_ATTR_RO(idle_purr);
>> >+
>> >+DECLARE_PER_CPU(u64, idle_spurr_cycles);
>> >+static ssize_t idle_spurr_show(struct device *dev,
>> >+			       struct device_attribute *attr, char *buf)
>> >+{
>> >+	struct cpu *cpu =3D container_of(dev, struct cpu, dev);
>> >+	unsigned int cpuid =3D cpu->dev.id;
>> >+	u64 *idle_spurr_cycles_ptr =3D per_cpu_ptr(&idle_spurr_cycles, cpuid)=
;
>>=20
>> Is it possible for a user to read stale values if a particular cpu is in=
 an
>> extended cede? Is it possible to use smp_call_function_single() to force=
 the
>> cpu out of idle?
>=20
> Yes, if the CPU whose idle_spurr cycle is being read is still in idle,
> then we will miss reporting the delta spurr cycles for this last
> idle-duration. Yes, we can use an smp_call_function_single(), though
> that will introduce IPI noise. How often will idle_[s]purr be read ?

Since it is possible for a cpu to go into extended cede for multiple=20
seconds during which time it is possible to mis-report utilization, I=20
think it is better to ensure that the sysfs interface for idle_[s]purr=20
report the proper values through use of IPI.

With repect to lparstat, the read interval is user-specified and just=20
gets passed onto sleep().

- Naveen

