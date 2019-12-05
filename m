Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 36608114534
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Dec 2019 17:56:03 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47TML85HLHzDqZb
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Dec 2019 03:56:00 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47TMJ675V7zDqZS
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Dec 2019 03:54:08 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB5GqrcY102201
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 5 Dec 2019 11:54:06 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wq5t8r1e6-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Dec 2019 11:54:05 -0500
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <naveen.n.rao@linux.vnet.ibm.com>;
 Thu, 5 Dec 2019 16:54:03 -0000
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 5 Dec 2019 16:54:02 -0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id xB5GrJng46662034
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 Dec 2019 16:53:19 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6F8664C052;
 Thu,  5 Dec 2019 16:54:00 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 107F14C044;
 Thu,  5 Dec 2019 16:54:00 +0000 (GMT)
Received: from localhost (unknown [9.199.48.150])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  5 Dec 2019 16:53:59 +0000 (GMT)
Date: Thu, 05 Dec 2019 22:23:58 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH 2/3] powerpc/sysfs: Show idle_purr and idle_spurr for
 every CPU
To: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>, Kamalesh Babulal
 <kamalesh@linux.vnet.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Nathan Lynch <nathanl@linux.ibm.com>, Vaidyanathan Srinivasan
 <svaidy@linux.vnet.ibm.com>, Tyrel Datwyler <tyreld@linux.ibm.com>
References: <1574856072-30972-1-git-send-email-ego@linux.vnet.ibm.com>
 <1574856072-30972-3-git-send-email-ego@linux.vnet.ibm.com>
In-Reply-To: <1574856072-30972-3-git-send-email-ego@linux.vnet.ibm.com>
MIME-Version: 1.0
User-Agent: astroid/v0.15-13-gb675b421 (https://github.com/astroidmail/astroid)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
x-cbid: 19120516-0008-0000-0000-0000033DB5EB
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19120516-0009-0000-0000-00004A5CDA0B
Message-Id: <1575564547.si4rk0s96p.naveen@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-05_05:2019-12-04,2019-12-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0 mlxlogscore=920
 spamscore=0 clxscore=1011 suspectscore=0 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1910280000
 definitions=main-1912050141
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Gautham R. Shenoy wrote:
> From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
>=20
> On Pseries LPARs, to calculate utilization, we need to know the
> [S]PURR ticks when the CPUs were busy or idle.
>=20
> The total PURR and SPURR ticks are already exposed via the per-cpu
> sysfs files /sys/devices/system/cpu/cpuX/purr and
> /sys/devices/system/cpu/cpuX/spurr.
>=20
> This patch adds support for exposing the idle PURR and SPURR ticks via
> /sys/devices/system/cpu/cpuX/idle_purr and
> /sys/devices/system/cpu/cpuX/idle_spurr.
>=20
> Signed-off-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
> ---
>  arch/powerpc/kernel/sysfs.c | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>=20
> diff --git a/arch/powerpc/kernel/sysfs.c b/arch/powerpc/kernel/sysfs.c
> index 80a676d..42ade55 100644
> --- a/arch/powerpc/kernel/sysfs.c
> +++ b/arch/powerpc/kernel/sysfs.c
> @@ -1044,6 +1044,36 @@ static ssize_t show_physical_id(struct device *dev=
,
>  }
>  static DEVICE_ATTR(physical_id, 0444, show_physical_id, NULL);
>=20
> +static ssize_t idle_purr_show(struct device *dev,
> +			      struct device_attribute *attr, char *buf)
> +{
> +	struct cpu *cpu =3D container_of(dev, struct cpu, dev);
> +	unsigned int cpuid =3D cpu->dev.id;
> +	struct lppaca *cpu_lppaca_ptr =3D paca_ptrs[cpuid]->lppaca_ptr;
> +	u64 idle_purr_cycles =3D be64_to_cpu(cpu_lppaca_ptr->wait_state_cycles)=
;
> +
> +	return sprintf(buf, "%llx\n", idle_purr_cycles);
> +}
> +static DEVICE_ATTR_RO(idle_purr);
> +
> +DECLARE_PER_CPU(u64, idle_spurr_cycles);
> +static ssize_t idle_spurr_show(struct device *dev,
> +			       struct device_attribute *attr, char *buf)
> +{
> +	struct cpu *cpu =3D container_of(dev, struct cpu, dev);
> +	unsigned int cpuid =3D cpu->dev.id;
> +	u64 *idle_spurr_cycles_ptr =3D per_cpu_ptr(&idle_spurr_cycles, cpuid);

Is it possible for a user to read stale values if a particular cpu is in=20
an extended cede? Is it possible to use smp_call_function_single() to=20
force the cpu out of idle?

- Naveen

