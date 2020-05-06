Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E501C6C47
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 10:57:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49H9TW5Fb4zDqpq
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 18:57:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49H88S1bVkzDqcF
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 May 2020 17:57:40 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0467uSQR154282; Wed, 6 May 2020 03:57:36 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30sp8kn1pv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 May 2020 03:57:34 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 0467ncGX006579;
 Wed, 6 May 2020 07:57:32 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03fra.de.ibm.com with ESMTP id 30s0g5kg8k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 May 2020 07:57:32 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0467vThb55705784
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 6 May 2020 07:57:29 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E043411C05B;
 Wed,  6 May 2020 07:57:28 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 932EB11C04A;
 Wed,  6 May 2020 07:57:26 +0000 (GMT)
Received: from [9.85.75.60] (unknown [9.85.75.60])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed,  6 May 2020 07:57:26 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Message-Id: <E71219FA-ECC5-42FE-B8FF-AA4AF765C9EC@linux.vnet.ibm.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_F5D9CB60-EE0C-4A3F-AC02-E10589582E8B"
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH 2/2] powerpc/perf: Add support for outputting extended
 regs in perf intr_regs
Date: Wed, 6 May 2020 13:24:58 +0530
In-Reply-To: <b3c3c1e6-077b-89d0-d550-b2784577ccd9@linux.ibm.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20200429060415.25930-1-anju@linux.vnet.ibm.com>
 <20200429060415.25930-3-anju@linux.vnet.ibm.com>
 <b3c3c1e6-077b-89d0-d550-b2784577ccd9@linux.ibm.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-05-06_02:2020-05-04,
 2020-05-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0 clxscore=1011
 mlxscore=0 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2005060057
X-Mailman-Approved-At: Wed, 06 May 2020 18:56:07 +1000
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
Cc: ravi.bangoria@linux.ibm.com, maddy@linux.vnet.ibm.com,
 linux-kernel@vger.kernel.org, acme@kernel.org,
 "anju@linux.vnet.ibm.com" <anju@linux.vnet.ibm.com>, jolsa@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--Apple-Mail=_F5D9CB60-EE0C-4A3F-AC02-E10589582E8B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> On 06-May-2020, at 9:56 AM, Madhavan Srinivasan <maddy@linux.ibm.com> =
wrote:
>=20
>=20
>=20
> On 4/29/20 11:34 AM, Anju T Sudhakar wrote:
>> The capability flag PERF_PMU_CAP_EXTENDED_REGS, is used to indicate =
the
>> PMU which support extended registers. The generic code define the =
mask
>> of extended registers as 0 for non supported architectures.
>>=20
>> Add support for extended registers in POWER9 architecture. For =
POWER9,
>> the extended registers are mmcr0, mmc1 and mmcr2.
>>=20
>> REG_RESERVED mask is redefined to accommodate the extended registers.
>>=20
>> With patch:
>> ----------------
>>=20
>> # perf record -I?
>> available registers: r0 r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11 r12 r13 =
r14
>> r15 r16 r17 r18 r19 r20 r21 r22 r23 r24 r25 r26 r27 r28 r29 r30 r31 =
nip
>> msr orig_r3 ctr link xer ccr softe trap dar dsisr sier mmcra mmcr0
>> mmcr1 mmcr2
>=20

> Would prefer to have some flexibility in deciding what to expose
> in as extended regs. Meaning say if we want to add extended regs
> in power8 and if we dont want to show for ex say mmcr2 (just for =
example).
>=20

One way to approach this is to have the "extended mask" exposed in=20
sysfs: "/sys/bus/event_source/devices/cpu/caps/ext_regs_mask" by the =
platform pmu
driver. This way the perf tool side can look at this and platform driver =
will also have control=20
on what to expose as part of the extended regs.

perf tools side uses extended mask to display the platform supported =
register names (with -I? option)
to the user and also send this mask to the kernel to capture the =
extended registers in each sample.=20
Hence we need to expose the appropriated mask to the perf tool side.

Thanks
Athira

> Maddy
>=20
>>=20
>> # perf record -I ls
>> # perf script -D
>>=20
>> PERF_RECORD_SAMPLE(IP, 0x1): 9019/9019: 0 period: 1 addr: 0
>> ... intr regs: mask 0xffffffffffff ABI 64-bit
>> .... r0    0xc00000000011b12c
>> .... r1    0xc000003f9a98b930
>> .... r2    0xc000000001a32100
>> .... r3    0xc000003f8fe9a800
>> .... r4    0xc000003fd1810000
>> .... r5    0x3e32557150
>> .... r6    0xc000003f9a98b908
>> .... r7    0xffffffc1cdae06ac
>> .... r8    0x818
>> [.....]
>> .... r31   0xc000003ffd047230
>> .... nip   0xc00000000011b2c0
>> .... msr   0x9000000000009033
>> .... orig_r3 0xc00000000011b21c
>> .... ctr   0xc000000000119380
>> .... link  0xc00000000011b12c
>> .... xer   0x0
>> .... ccr   0x28002222
>> .... softe 0x1
>> .... trap  0xf00
>> .... dar   0x0
>> .... dsisr 0x80000000000
>> .... sier  0x0
>> .... mmcra 0x80000000000
>> .... mmcr0 0x82008090
>> .... mmcr1 0x1e000000
>> .... mmcr2 0x0
>>  ... thread: perf:9019
>>=20
>> Signed-off-by: Anju T Sudhakar <anju@linux.vnet.ibm.com>
>> ---
>>  arch/powerpc/include/asm/perf_event_server.h  |  5 +++
>>  arch/powerpc/include/uapi/asm/perf_regs.h     | 13 +++++++-
>>  arch/powerpc/perf/core-book3s.c               |  1 +
>>  arch/powerpc/perf/perf_regs.c                 | 29 ++++++++++++++--
>>  arch/powerpc/perf/power9-pmu.c                |  1 +
>>  .../arch/powerpc/include/uapi/asm/perf_regs.h | 13 +++++++-
>>  tools/perf/arch/powerpc/include/perf_regs.h   |  6 +++-
>>  tools/perf/arch/powerpc/util/perf_regs.c      | 33 =
+++++++++++++++++++
>>  8 files changed, 95 insertions(+), 6 deletions(-)
>>=20
>> diff --git a/arch/powerpc/include/asm/perf_event_server.h =
b/arch/powerpc/include/asm/perf_event_server.h
>> index 3e9703f44c7c..1d15953bd99e 100644
>> --- a/arch/powerpc/include/asm/perf_event_server.h
>> +++ b/arch/powerpc/include/asm/perf_event_server.h
>> @@ -55,6 +55,11 @@ struct power_pmu {
>>  	int 		*blacklist_ev;
>>  	/* BHRB entries in the PMU */
>>  	int		bhrb_nr;
>> +	/*
>> +	 * set this flag with `PERF_PMU_CAP_EXTENDED_REGS` if
>> +	 * the pmu supports extended perf regs capability
>> +	 */
>> +	int		capabilities;
>>  };
>>=20
>>  /*
>> diff --git a/arch/powerpc/include/uapi/asm/perf_regs.h =
b/arch/powerpc/include/uapi/asm/perf_regs.h
>> index f599064dd8dc..604b831378fe 100644
>> --- a/arch/powerpc/include/uapi/asm/perf_regs.h
>> +++ b/arch/powerpc/include/uapi/asm/perf_regs.h
>> @@ -48,6 +48,17 @@ enum perf_event_powerpc_regs {
>>  	PERF_REG_POWERPC_DSISR,
>>  	PERF_REG_POWERPC_SIER,
>>  	PERF_REG_POWERPC_MMCRA,
>> -	PERF_REG_POWERPC_MAX,
>> +	/* Extended registers */
>> +	PERF_REG_POWERPC_MMCR0,
>> +	PERF_REG_POWERPC_MMCR1,
>> +	PERF_REG_POWERPC_MMCR2,
>> +	PERF_REG_EXTENDED_MAX,
>> +	/* Max regs without the extended regs */
>> +	PERF_REG_POWERPC_MAX =3D PERF_REG_POWERPC_MMCRA + 1,
>>  };
>> +
>> +#define PERF_REG_PMU_MASK	((1ULL << PERF_REG_POWERPC_MAX) - 1)
>> +#define PERF_REG_EXTENDED_MASK  (((1ULL << (PERF_REG_EXTENDED_MAX))	=
\
>> +			- 1) - PERF_REG_PMU_MASK)
>> +
>>  #endif /* _UAPI_ASM_POWERPC_PERF_REGS_H */
>> diff --git a/arch/powerpc/perf/core-book3s.c =
b/arch/powerpc/perf/core-book3s.c
>> index 3dcfecf858f3..f56b77800a7b 100644
>> --- a/arch/powerpc/perf/core-book3s.c
>> +++ b/arch/powerpc/perf/core-book3s.c
>> @@ -2276,6 +2276,7 @@ int register_power_pmu(struct power_pmu *pmu)
>>=20
>>  	power_pmu.attr_groups =3D ppmu->attr_groups;
>>=20
>> +	power_pmu.capabilities |=3D (ppmu->capabilities & =
PERF_PMU_CAP_EXTENDED_REGS);
>>  #ifdef MSR_HV
>>  	/*
>>  	 * Use FCHV to ignore kernel events if MSR.HV is set.
>> diff --git a/arch/powerpc/perf/perf_regs.c =
b/arch/powerpc/perf/perf_regs.c
>> index a213a0aa5d25..57aa02568caf 100644
>> --- a/arch/powerpc/perf/perf_regs.c
>> +++ b/arch/powerpc/perf/perf_regs.c
>> @@ -15,7 +15,8 @@
>>=20
>>  #define PT_REGS_OFFSET(id, r) [id] =3D offsetof(struct pt_regs, r)
>>=20
>> -#define REG_RESERVED (~((1ULL << PERF_REG_POWERPC_MAX) - 1))
>> +#define REG_RESERVED (~(PERF_REG_EXTENDED_MASK) &	\
>> +			(~((1ULL << PERF_REG_POWERPC_MAX) - 1)))
>>=20
>>  static unsigned int pt_regs_offset[PERF_REG_POWERPC_MAX] =3D {
>>  	PT_REGS_OFFSET(PERF_REG_POWERPC_R0,  gpr[0]),
>> @@ -69,10 +70,22 @@ static unsigned int =
pt_regs_offset[PERF_REG_POWERPC_MAX] =3D {
>>  	PT_REGS_OFFSET(PERF_REG_POWERPC_MMCRA, dsisr),
>>  };
>>=20
>> +/* Function to return the extended register values */
>> +static u64 get_ext_regs_value(int idx)
>> +{
>> +	switch (idx) {
>> +	case PERF_REG_POWERPC_MMCR0:
>> +				    return mfspr(SPRN_MMCR0);
>> +	case PERF_REG_POWERPC_MMCR1:
>> +				    return mfspr(SPRN_MMCR1);
>> +	case PERF_REG_POWERPC_MMCR2:
>> +				    return mfspr(SPRN_MMCR2);
>> +	default: return 0;
>> +	}
>> +}
>> +
>>  u64 perf_reg_value(struct pt_regs *regs, int idx)
>>  {
>> -	if (WARN_ON_ONCE(idx >=3D PERF_REG_POWERPC_MAX))
>> -		return 0;
>>=20
>>  	if (idx =3D=3D PERF_REG_POWERPC_SIER &&
>>  	   (IS_ENABLED(CONFIG_FSL_EMB_PERF_EVENT) ||
>> @@ -85,6 +98,16 @@ u64 perf_reg_value(struct pt_regs *regs, int idx)
>>  	    IS_ENABLED(CONFIG_PPC32)))
>>  		return 0;
>>=20
>> +	if (idx >=3D PERF_REG_POWERPC_MAX && idx < =
PERF_REG_EXTENDED_MAX)
>> +		return get_ext_regs_value(idx);
>> +
>> +	/*
>> +	 * If the idx is referring to value beyond the
>> +	 * supported registers, return 0 with a warning
>> +	 */
>> +	if (WARN_ON_ONCE(idx >=3D PERF_REG_EXTENDED_MAX))
>> +		return 0;
>> +
>>  	return regs_get_register(regs, pt_regs_offset[idx]);
>>  }
>>=20
>> diff --git a/arch/powerpc/perf/power9-pmu.c =
b/arch/powerpc/perf/power9-pmu.c
>> index 08c3ef796198..c37193b3e73f 100644
>> --- a/arch/powerpc/perf/power9-pmu.c
>> +++ b/arch/powerpc/perf/power9-pmu.c
>> @@ -434,6 +434,7 @@ static struct power_pmu power9_pmu =3D {
>>  	.cache_events		=3D &power9_cache_events,
>>  	.attr_groups		=3D power9_pmu_attr_groups,
>>  	.bhrb_nr		=3D 32,
>> +	.capabilities		=3D PERF_PMU_CAP_EXTENDED_REGS,
>>  };
>>=20
>>  int init_power9_pmu(void)
>> diff --git a/tools/arch/powerpc/include/uapi/asm/perf_regs.h =
b/tools/arch/powerpc/include/uapi/asm/perf_regs.h
>> index f599064dd8dc..d66953294c73 100644
>> --- a/tools/arch/powerpc/include/uapi/asm/perf_regs.h
>> +++ b/tools/arch/powerpc/include/uapi/asm/perf_regs.h
>> @@ -48,6 +48,17 @@ enum perf_event_powerpc_regs {
>>  	PERF_REG_POWERPC_DSISR,
>>  	PERF_REG_POWERPC_SIER,
>>  	PERF_REG_POWERPC_MMCRA,
>> -	PERF_REG_POWERPC_MAX,
>> +	/* Extended arch registers */
>> +	PERF_REG_POWERPC_MMCR0,
>> +	PERF_REG_POWERPC_MMCR1,
>> +	PERF_REG_POWERPC_MMCR2,
>> +	PERF_REG_EXTENDED_MAX,
>> +	/* Max regs without extended arch regs */
>> +	PERF_REG_POWERPC_MAX =3D PERF_REG_POWERPC_MMCRA + 1,
>> +
>>  };
>> +#define PERF_REG_PMU_MASK	((1ULL << PERF_REG_POWERPC_MAX) - 1)
>> +#define PERF_REG_EXTENDED_MASK  (((1ULL << (PERF_REG_EXTENDED_MAX))\
>> +			- 1) - PERF_REG_PMU_MASK)
>> +
>>  #endif /* _UAPI_ASM_POWERPC_PERF_REGS_H */
>> diff --git a/tools/perf/arch/powerpc/include/perf_regs.h =
b/tools/perf/arch/powerpc/include/perf_regs.h
>> index e18a3556f5e3..f7bbdb816f88 100644
>> --- a/tools/perf/arch/powerpc/include/perf_regs.h
>> +++ b/tools/perf/arch/powerpc/include/perf_regs.h
>> @@ -64,7 +64,11 @@ static const char *reg_names[] =3D {
>>  	[PERF_REG_POWERPC_DAR] =3D "dar",
>>  	[PERF_REG_POWERPC_DSISR] =3D "dsisr",
>>  	[PERF_REG_POWERPC_SIER] =3D "sier",
>> -	[PERF_REG_POWERPC_MMCRA] =3D "mmcra"
>> +	[PERF_REG_POWERPC_MMCRA] =3D "mmcra",
>> +	[PERF_REG_POWERPC_MMCR0] =3D "mmcr0",
>> +	[PERF_REG_POWERPC_MMCR1] =3D "mmcr1",
>> +	[PERF_REG_POWERPC_MMCR2] =3D "mmcr2",
>> +
>>  };
>>=20
>>  static inline const char *perf_reg_name(int id)
>> diff --git a/tools/perf/arch/powerpc/util/perf_regs.c =
b/tools/perf/arch/powerpc/util/perf_regs.c
>> index 0a5242900248..37b150f9d1a1 100644
>> --- a/tools/perf/arch/powerpc/util/perf_regs.c
>> +++ b/tools/perf/arch/powerpc/util/perf_regs.c
>> @@ -6,6 +6,8 @@
>>=20
>>  #include "../../../util/perf_regs.h"
>>  #include "../../../util/debug.h"
>> +#include "../../../util/event.h"
>> +#include "../../../perf-sys.h"
>>=20
>>  #include <linux/kernel.h>
>>=20
>> @@ -55,6 +57,9 @@ const struct sample_reg sample_reg_masks[] =3D {
>>  	SMPL_REG(dsisr, PERF_REG_POWERPC_DSISR),
>>  	SMPL_REG(sier, PERF_REG_POWERPC_SIER),
>>  	SMPL_REG(mmcra, PERF_REG_POWERPC_MMCRA),
>> +	SMPL_REG(mmcr0, PERF_REG_POWERPC_MMCR0),
>> +	SMPL_REG(mmcr1, PERF_REG_POWERPC_MMCR1),
>> +	SMPL_REG(mmcr2, PERF_REG_POWERPC_MMCR2),
>>  	SMPL_REG_END
>>  };
>>=20
>> @@ -163,3 +168,31 @@ int arch_sdt_arg_parse_op(char *old_op, char =
**new_op)
>>=20
>>  	return SDT_ARG_VALID;
>>  }
>> +
>> +uint64_t arch__intr_reg_mask(void)
>> +{
>> +	struct perf_event_attr attr =3D {
>> +		.type                   =3D PERF_TYPE_HARDWARE,
>> +		.config                 =3D PERF_COUNT_HW_CPU_CYCLES,
>> +		.sample_type            =3D PERF_SAMPLE_REGS_INTR,
>> +		.sample_regs_intr       =3D PERF_REG_EXTENDED_MASK,
>> +		.precise_ip             =3D 1,
>> +		.disabled               =3D 1,
>> +		.exclude_kernel         =3D 1,
>> +	};
>> +	int fd;
>> +
>> +	attr.sample_period =3D 1;
>> +	event_attr_init(&attr);
>> +
>> +	/*
>> +	 * check if the pmu supports perf extended regs, before
>> +	 * returning the register mask to sample.
>> +	 */
>> +	fd =3D sys_perf_event_open(&attr, 0, -1, -1, 0);
>> +	if (fd !=3D -1) {
>> +		close(fd);
>> +		return (PERF_REG_EXTENDED_MASK | PERF_REGS_MASK);
>> +	}
>> +	return PERF_REGS_MASK;
>> +}


--Apple-Mail=_F5D9CB60-EE0C-4A3F-AC02-E10589582E8B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On 06-May-2020, at 9:56 AM, Madhavan Srinivasan &lt;<a =
href=3D"mailto:maddy@linux.ibm.com" class=3D"">maddy@linux.ibm.com</a>&gt;=
 wrote:</div><br class=3D"Apple-interchange-newline"><div class=3D""><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">On 4/29/20 11:34 AM, Anju T =
Sudhakar wrote:</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><blockquote type=3D"cite" =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D"">The capability flag =
PERF_PMU_CAP_EXTENDED_REGS, is used to indicate the<br class=3D"">PMU =
which support extended registers. The generic code define the mask<br =
class=3D"">of extended registers as 0 for non supported =
architectures.<br class=3D""><br class=3D"">Add support for extended =
registers in POWER9 architecture. For POWER9,<br class=3D"">the extended =
registers are mmcr0, mmc1 and mmcr2.<br class=3D""><br =
class=3D"">REG_RESERVED mask is redefined to accommodate the extended =
registers.<br class=3D""><br class=3D"">With patch:<br =
class=3D"">----------------<br class=3D""><br class=3D""># perf record =
-I?<br class=3D"">available registers: r0 r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 =
r11 r12 r13 r14<br class=3D"">r15 r16 r17 r18 r19 r20 r21 r22 r23 r24 =
r25 r26 r27 r28 r29 r30 r31 nip<br class=3D"">msr orig_r3 ctr link xer =
ccr softe trap dar dsisr sier mmcra mmcr0<br class=3D"">mmcr1 mmcr2<br =
class=3D""></blockquote><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""></div></blockquote><br =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">Would prefer to have some =
flexibility in deciding what to expose</span><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">in as extended regs. Meaning say if we want to add extended =
regs</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">in power8 and =
if we dont want to show for ex say mmcr2 (just for example).</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" =
class=3D""></div></blockquote><div><br class=3D""></div><div>One way to =
approach this is to have the "extended mask" exposed =
in&nbsp;</div><div>sysfs: =
"/sys/bus/event_source/devices/cpu/caps/ext_regs_mask" by the platform =
pmu</div><div>driver. This way the perf tool side can look at this and =
platform driver will also have control&nbsp;</div><div>on what to expose =
as part of the extended regs.</div><div><br class=3D""></div><div>perf =
tools side uses extended mask to display the platform supported register =
names (with -I? option)</div><div>to the user and also send this mask to =
the kernel to capture the extended registers in each =
sample.&nbsp;</div><div>Hence we need to expose the appropriated mask to =
the perf tool side.</div><div><br =
class=3D""></div><div>Thanks</div><div>Athira</div><div><br =
class=3D""></div><blockquote type=3D"cite" class=3D""><div =
class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">Maddy</span><br=
 style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" =
class=3D""><blockquote type=3D"cite" style=3D"font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><br =
class=3D""># perf record -I ls<br class=3D""># perf script -D<br =
class=3D""><br class=3D"">PERF_RECORD_SAMPLE(IP, 0x1): 9019/9019: 0 =
period: 1 addr: 0<br class=3D"">... intr regs: mask 0xffffffffffff ABI =
64-bit<br class=3D"">.... r0 &nbsp;&nbsp;&nbsp;0xc00000000011b12c<br =
class=3D"">.... r1 &nbsp;&nbsp;&nbsp;0xc000003f9a98b930<br class=3D"">....=
 r2 &nbsp;&nbsp;&nbsp;0xc000000001a32100<br class=3D"">.... r3 =
&nbsp;&nbsp;&nbsp;0xc000003f8fe9a800<br class=3D"">.... r4 =
&nbsp;&nbsp;&nbsp;0xc000003fd1810000<br class=3D"">.... r5 =
&nbsp;&nbsp;&nbsp;0x3e32557150<br class=3D"">.... r6 =
&nbsp;&nbsp;&nbsp;0xc000003f9a98b908<br class=3D"">.... r7 =
&nbsp;&nbsp;&nbsp;0xffffffc1cdae06ac<br class=3D"">.... r8 =
&nbsp;&nbsp;&nbsp;0x818<br class=3D"">[.....]<br class=3D"">.... r31 =
&nbsp;&nbsp;0xc000003ffd047230<br class=3D"">.... nip =
&nbsp;&nbsp;0xc00000000011b2c0<br class=3D"">.... msr =
&nbsp;&nbsp;0x9000000000009033<br class=3D"">.... orig_r3 =
0xc00000000011b21c<br class=3D"">.... ctr =
&nbsp;&nbsp;0xc000000000119380<br class=3D"">.... link =
&nbsp;0xc00000000011b12c<br class=3D"">.... xer &nbsp;&nbsp;0x0<br =
class=3D"">.... ccr &nbsp;&nbsp;0x28002222<br class=3D"">.... softe =
0x1<br class=3D"">.... trap &nbsp;0xf00<br class=3D"">.... dar =
&nbsp;&nbsp;0x0<br class=3D"">.... dsisr 0x80000000000<br class=3D"">.... =
sier &nbsp;0x0<br class=3D"">.... mmcra 0x80000000000<br class=3D"">.... =
mmcr0 0x82008090<br class=3D"">.... mmcr1 0x1e000000<br class=3D"">.... =
mmcr2 0x0<br class=3D"">&nbsp;... thread: perf:9019<br class=3D""><br =
class=3D"">Signed-off-by: Anju T Sudhakar &lt;<a =
href=3D"mailto:anju@linux.vnet.ibm.com" =
class=3D"">anju@linux.vnet.ibm.com</a>&gt;<br class=3D"">---<br =
class=3D"">&nbsp;arch/powerpc/include/asm/perf_event_server.h &nbsp;| =
&nbsp;5 +++<br class=3D"">&nbsp;arch/powerpc/include/uapi/asm/perf_regs.h =
&nbsp;&nbsp;&nbsp;&nbsp;| 13 +++++++-<br =
class=3D"">&nbsp;arch/powerpc/perf/core-book3s.c =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;| &nbsp;1 +<br class=3D"">&nbsp;arch/powerpc/perf/perf_regs.c =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;| 29 ++++++++++++++--<br =
class=3D"">&nbsp;arch/powerpc/perf/power9-pmu.c =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;| &nbsp;1 +<br =
class=3D"">&nbsp;.../arch/powerpc/include/uapi/asm/perf_regs.h | 13 =
+++++++-<br class=3D"">&nbsp;tools/perf/arch/powerpc/include/perf_regs.h =
&nbsp;&nbsp;| &nbsp;6 +++-<br =
class=3D"">&nbsp;tools/perf/arch/powerpc/util/perf_regs.c =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 33 +++++++++++++++++++<br =
class=3D"">&nbsp;8 files changed, 95 insertions(+), 6 deletions(-)<br =
class=3D""><br class=3D"">diff --git =
a/arch/powerpc/include/asm/perf_event_server.h =
b/arch/powerpc/include/asm/perf_event_server.h<br class=3D"">index =
3e9703f44c7c..1d15953bd99e 100644<br class=3D"">--- =
a/arch/powerpc/include/asm/perf_event_server.h<br class=3D"">+++ =
b/arch/powerpc/include/asm/perf_event_server.h<br class=3D"">@@ -55,6 =
+55,11 @@ struct power_pmu {<br class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>int<span =
class=3D"Apple-converted-space">&nbsp;</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>*blacklist_ev;<br class=3D"">&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>/* BHRB entries in the PMU */<br =
class=3D"">&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>int<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>bhrb_nr;<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>/*<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>* set this flag with =
`PERF_PMU_CAP_EXTENDED_REGS` if<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>* the pmu supports extended =
perf regs capability<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>*/<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>int<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>capabilities;<br class=3D"">&nbsp;};<br class=3D""><br =
class=3D"">&nbsp;/*<br class=3D"">diff --git =
a/arch/powerpc/include/uapi/asm/perf_regs.h =
b/arch/powerpc/include/uapi/asm/perf_regs.h<br class=3D"">index =
f599064dd8dc..604b831378fe 100644<br class=3D"">--- =
a/arch/powerpc/include/uapi/asm/perf_regs.h<br class=3D"">+++ =
b/arch/powerpc/include/uapi/asm/perf_regs.h<br class=3D"">@@ -48,6 =
+48,17 @@ enum perf_event_powerpc_regs {<br class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>PERF_REG_POWERPC_DSISR,<br class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>PERF_REG_POWERPC_SIER,<br class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>PERF_REG_POWERPC_MMCRA,<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>PERF_REG_POWERPC_MAX,<br class=3D"">+<span class=3D"Apple-tab-span"=
 style=3D"white-space: pre;">	</span>/* Extended registers */<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>PERF_REG_POWERPC_MMCR0,<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>PERF_REG_POWERPC_MMCR1,<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>PERF_REG_POWERPC_MMCR2,<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>PERF_REG_EXTENDED_MAX,<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>/* Max =
regs without the extended regs */<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>PERF_REG_POWERPC_MAX =3D PERF_REG_POWERPC_MMCRA + 1,<br =
class=3D"">&nbsp;};<br class=3D"">+<br class=3D"">+#define =
PERF_REG_PMU_MASK<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>((1ULL &lt;&lt; PERF_REG_POWERPC_MAX) - 1)<br =
class=3D"">+#define PERF_REG_EXTENDED_MASK &nbsp;(((1ULL &lt;&lt; =
(PERF_REG_EXTENDED_MAX))<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>\<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>- 1) - =
PERF_REG_PMU_MASK)<br class=3D"">+<br class=3D"">&nbsp;#endif /* =
_UAPI_ASM_POWERPC_PERF_REGS_H */<br class=3D"">diff --git =
a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c<br =
class=3D"">index 3dcfecf858f3..f56b77800a7b 100644<br class=3D"">--- =
a/arch/powerpc/perf/core-book3s.c<br class=3D"">+++ =
b/arch/powerpc/perf/core-book3s.c<br class=3D"">@@ -2276,6 +2276,7 @@ =
int register_power_pmu(struct power_pmu *pmu)<br class=3D""><br =
class=3D"">&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>power_pmu.attr_groups =3D ppmu-&gt;attr_groups;<br =
class=3D""><br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>power_pmu.capabilities |=3D =
(ppmu-&gt;capabilities &amp; PERF_PMU_CAP_EXTENDED_REGS);<br =
class=3D"">&nbsp;#ifdef MSR_HV<br class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>/*<br =
class=3D"">&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-converted-space">&nbsp;</span>* Use =
FCHV to ignore kernel events if MSR.HV is set.<br class=3D"">diff --git =
a/arch/powerpc/perf/perf_regs.c b/arch/powerpc/perf/perf_regs.c<br =
class=3D"">index a213a0aa5d25..57aa02568caf 100644<br class=3D"">--- =
a/arch/powerpc/perf/perf_regs.c<br class=3D"">+++ =
b/arch/powerpc/perf/perf_regs.c<br class=3D"">@@ -15,7 +15,8 @@<br =
class=3D""><br class=3D"">&nbsp;#define PT_REGS_OFFSET(id, r) [id] =3D =
offsetof(struct pt_regs, r)<br class=3D""><br class=3D"">-#define =
REG_RESERVED (~((1ULL &lt;&lt; PERF_REG_POWERPC_MAX) - 1))<br =
class=3D"">+#define REG_RESERVED (~(PERF_REG_EXTENDED_MASK) &amp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>\<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>(~((1ULL &lt;&lt; PERF_REG_POWERPC_MAX) - 1)))<br class=3D""><br =
class=3D"">&nbsp;static unsigned int =
pt_regs_offset[PERF_REG_POWERPC_MAX] =3D {<br class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>PT_REGS_OFFSET(PERF_REG_POWERPC_R0, &nbsp;gpr[0]),<br class=3D"">@@=
 -69,10 +70,22 @@ static unsigned int =
pt_regs_offset[PERF_REG_POWERPC_MAX] =3D {<br class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>PT_REGS_OFFSET(PERF_REG_POWERPC_MMCRA, dsisr),<br =
class=3D"">&nbsp;};<br class=3D""><br class=3D"">+/* Function to return =
the extended register values */<br class=3D"">+static u64 =
get_ext_regs_value(int idx)<br class=3D"">+{<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>switch =
(idx) {<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>case PERF_REG_POWERPC_MMCR0:<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;&nbsp;return =
mfspr(SPRN_MMCR0);<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>case PERF_REG_POWERPC_MMCR1:<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;&nbsp;return =
mfspr(SPRN_MMCR1);<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>case PERF_REG_POWERPC_MMCR2:<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;&nbsp;return =
mfspr(SPRN_MMCR2);<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>default: return 0;<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>}<br class=3D"">+}<br class=3D"">+<br class=3D"">&nbsp;u64 =
perf_reg_value(struct pt_regs *regs, int idx)<br class=3D"">&nbsp;{<br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>if (WARN_ON_ONCE(idx &gt;=3D PERF_REG_POWERPC_MAX))<br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>return 0;<br class=3D""><br class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>if (idx =
=3D=3D PERF_REG_POWERPC_SIER &amp;&amp;<br class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;(IS_ENABLED(CONFI=
G_FSL_EMB_PERF_EVENT) ||<br class=3D"">@@ -85,6 +98,16 @@ u64 =
perf_reg_value(struct pt_regs *regs, int idx)<br class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;&nbsp;IS_ENABLED(=
CONFIG_PPC32)))<br class=3D"">&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>return 0;<br class=3D""><br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>if (idx &gt;=3D PERF_REG_POWERPC_MAX &amp;&amp; idx &lt; =
PERF_REG_EXTENDED_MAX)<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>return =
get_ext_regs_value(idx);<br class=3D"">+<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>/*<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-converted-space">&nbsp;</span>* If the idx =
is referring to value beyond the<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>* supported registers, =
return 0 with a warning<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>*/<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>if =
(WARN_ON_ONCE(idx &gt;=3D PERF_REG_EXTENDED_MAX))<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>return =
0;<br class=3D"">+<br class=3D"">&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>return regs_get_register(regs, =
pt_regs_offset[idx]);<br class=3D"">&nbsp;}<br class=3D""><br =
class=3D"">diff --git a/arch/powerpc/perf/power9-pmu.c =
b/arch/powerpc/perf/power9-pmu.c<br class=3D"">index =
08c3ef796198..c37193b3e73f 100644<br class=3D"">--- =
a/arch/powerpc/perf/power9-pmu.c<br class=3D"">+++ =
b/arch/powerpc/perf/power9-pmu.c<br class=3D"">@@ -434,6 +434,7 @@ =
static struct power_pmu power9_pmu =3D {<br class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>.cache_events<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>=3D &amp;power9_cache_events,<br class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>.attr_groups<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>=3D power9_pmu_attr_groups,<br class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>.bhrb_nr<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>=3D 32,<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>.capabilities<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>=3D =
PERF_PMU_CAP_EXTENDED_REGS,<br class=3D"">&nbsp;};<br class=3D""><br =
class=3D"">&nbsp;int init_power9_pmu(void)<br class=3D"">diff --git =
a/tools/arch/powerpc/include/uapi/asm/perf_regs.h =
b/tools/arch/powerpc/include/uapi/asm/perf_regs.h<br class=3D"">index =
f599064dd8dc..d66953294c73 100644<br class=3D"">--- =
a/tools/arch/powerpc/include/uapi/asm/perf_regs.h<br class=3D"">+++ =
b/tools/arch/powerpc/include/uapi/asm/perf_regs.h<br class=3D"">@@ -48,6 =
+48,17 @@ enum perf_event_powerpc_regs {<br class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>PERF_REG_POWERPC_DSISR,<br class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>PERF_REG_POWERPC_SIER,<br class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>PERF_REG_POWERPC_MMCRA,<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>PERF_REG_POWERPC_MAX,<br class=3D"">+<span class=3D"Apple-tab-span"=
 style=3D"white-space: pre;">	</span>/* Extended arch registers */<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>PERF_REG_POWERPC_MMCR0,<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>PERF_REG_POWERPC_MMCR1,<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>PERF_REG_POWERPC_MMCR2,<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>PERF_REG_EXTENDED_MAX,<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>/* Max =
regs without extended arch regs */<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>PERF_REG_POWERPC_MAX =3D PERF_REG_POWERPC_MMCRA + 1,<br =
class=3D"">+<br class=3D"">&nbsp;};<br class=3D"">+#define =
PERF_REG_PMU_MASK<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>((1ULL &lt;&lt; PERF_REG_POWERPC_MAX) - 1)<br =
class=3D"">+#define PERF_REG_EXTENDED_MASK &nbsp;(((1ULL &lt;&lt; =
(PERF_REG_EXTENDED_MAX))\<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>- 1) - PERF_REG_PMU_MASK)<br =
class=3D"">+<br class=3D"">&nbsp;#endif /* _UAPI_ASM_POWERPC_PERF_REGS_H =
*/<br class=3D"">diff --git =
a/tools/perf/arch/powerpc/include/perf_regs.h =
b/tools/perf/arch/powerpc/include/perf_regs.h<br class=3D"">index =
e18a3556f5e3..f7bbdb816f88 100644<br class=3D"">--- =
a/tools/perf/arch/powerpc/include/perf_regs.h<br class=3D"">+++ =
b/tools/perf/arch/powerpc/include/perf_regs.h<br class=3D"">@@ -64,7 =
+64,11 @@ static const char *reg_names[] =3D {<br class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>[PERF_REG_POWERPC_DAR] =3D "dar",<br class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>[PERF_REG_POWERPC_DSISR] =3D "dsisr",<br class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>[PERF_REG_POWERPC_SIER] =3D "sier",<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>[PERF_REG_POWERPC_MMCRA] =3D "mmcra"<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>[PERF_REG_POWERPC_MMCRA] =3D "mmcra",<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>[PERF_REG_POWERPC_MMCR0] =3D "mmcr0",<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>[PERF_REG_POWERPC_MMCR1] =3D "mmcr1",<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>[PERF_REG_POWERPC_MMCR2] =3D "mmcr2",<br class=3D"">+<br =
class=3D"">&nbsp;};<br class=3D""><br class=3D"">&nbsp;static inline =
const char *perf_reg_name(int id)<br class=3D"">diff --git =
a/tools/perf/arch/powerpc/util/perf_regs.c =
b/tools/perf/arch/powerpc/util/perf_regs.c<br class=3D"">index =
0a5242900248..37b150f9d1a1 100644<br class=3D"">--- =
a/tools/perf/arch/powerpc/util/perf_regs.c<br class=3D"">+++ =
b/tools/perf/arch/powerpc/util/perf_regs.c<br class=3D"">@@ -6,6 +6,8 =
@@<br class=3D""><br class=3D"">&nbsp;#include =
"../../../util/perf_regs.h"<br class=3D"">&nbsp;#include =
"../../../util/debug.h"<br class=3D"">+#include =
"../../../util/event.h"<br class=3D"">+#include "../../../perf-sys.h"<br =
class=3D""><br class=3D"">&nbsp;#include &lt;linux/kernel.h&gt;<br =
class=3D""><br class=3D"">@@ -55,6 +57,9 @@ const struct sample_reg =
sample_reg_masks[] =3D {<br class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>SMPL_REG(dsisr, PERF_REG_POWERPC_DSISR),<br class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>SMPL_REG(sier, PERF_REG_POWERPC_SIER),<br class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>SMPL_REG(mmcra, PERF_REG_POWERPC_MMCRA),<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>SMPL_REG(mmcr0, PERF_REG_POWERPC_MMCR0),<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>SMPL_REG(mmcr1, PERF_REG_POWERPC_MMCR1),<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>SMPL_REG(mmcr2, PERF_REG_POWERPC_MMCR2),<br class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>SMPL_REG_END<br class=3D"">&nbsp;};<br class=3D""><br class=3D"">@@=
 -163,3 +168,31 @@ int arch_sdt_arg_parse_op(char *old_op, char =
**new_op)<br class=3D""><br class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>return =
SDT_ARG_VALID;<br class=3D"">&nbsp;}<br class=3D"">+<br =
class=3D"">+uint64_t arch__intr_reg_mask(void)<br class=3D"">+{<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>struct perf_event_attr attr =3D {<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>.type =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=3D PERF_TYPE_HARDWARE,<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>.config =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;=3D PERF_COUNT_HW_CPU_CYCLES,<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>.sample_type =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=3D =
PERF_SAMPLE_REGS_INTR,<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>.sample_regs_intr =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=3D PERF_REG_EXTENDED_MASK,<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>.precise_ip =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=3D=
 1,<br class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>.disabled =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;=3D 1,<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>.exclude_kernel =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=3D 1,<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>};<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>int fd;<br class=3D"">+<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>attr.sample_period =3D 1;<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>event_attr_init(&amp;attr);<br class=3D"">+<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>/*<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-converted-space">&nbsp;</span>* check if the =
pmu supports perf extended regs, before<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>* returning the register =
mask to sample.<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>*/<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>fd =3D =
sys_perf_event_open(&amp;attr, 0, -1, -1, 0);<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>if (fd !=3D=
 -1) {<br class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:=
 pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>close(fd);<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>return (PERF_REG_EXTENDED_MASK | =
PERF_REGS_MASK);<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>}<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>return =
PERF_REGS_MASK;<br class=3D"">+}</blockquote></div></blockquote></div><br =
class=3D""></body></html>=

--Apple-Mail=_F5D9CB60-EE0C-4A3F-AC02-E10589582E8B--

