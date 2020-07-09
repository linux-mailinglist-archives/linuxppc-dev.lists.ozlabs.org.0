Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D03E421972C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 06:24:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B2NNY4jlvzF24P
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 14:24:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B2Llf3X6vzDqCV
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jul 2020 13:10:38 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06933XP3053751; Wed, 8 Jul 2020 23:10:33 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 325k3r3rs1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Jul 2020 23:10:32 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06932qJD010001;
 Thu, 9 Jul 2020 03:10:30 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06fra.de.ibm.com with ESMTP id 325k2qr5hw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jul 2020 03:10:29 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0693ARCe54067426
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 9 Jul 2020 03:10:27 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8EC03AE056;
 Thu,  9 Jul 2020 03:10:27 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 39943AE053;
 Thu,  9 Jul 2020 03:10:25 +0000 (GMT)
Received: from [9.79.221.246] (unknown [9.79.221.246])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu,  9 Jul 2020 03:10:24 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Message-Id: <FFC0AE06-9BF8-446C-B6D8-C4D62B61FDBE@linux.vnet.ibm.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_5BBB7FC7-0E9B-4121-AFCB-D131E29B56AC"
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH v2 09/10] tools/perf: Add perf tools support for extended
 register capability in powerpc
Date: Thu, 9 Jul 2020 08:40:22 +0530
In-Reply-To: <87pn962owo.fsf@mpe.ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>
References: <1593595262-1433-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <1593595262-1433-10-git-send-email-atrajeev@linux.vnet.ibm.com>
 <87pn962owo.fsf@mpe.ellerman.id.au>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-08_19:2020-07-08,
 2020-07-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 mlxlogscore=999
 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007090023
X-Mailman-Approved-At: Thu, 09 Jul 2020 14:05:26 +1000
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
Cc: mikey@neuling.org, maddy@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--Apple-Mail=_5BBB7FC7-0E9B-4121-AFCB-D131E29B56AC
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> On 08-Jul-2020, at 5:34 PM, Michael Ellerman <mpe@ellerman.id.au> =
wrote:
>=20
> Athira Rajeev <atrajeev@linux.vnet.ibm.com =
<mailto:atrajeev@linux.vnet.ibm.com>> writes:
>> From: Anju T Sudhakar <anju@linux.vnet.ibm.com>
>>=20
>> Add extended regs to sample_reg_mask in the tool side to use
>> with `-I?` option. Perf tools side uses extended mask to display
>> the platform supported register names (with -I? option) to the user
>> and also send this mask to the kernel to capture the extended =
registers
>> in each sample. Hence decide the mask value based on the processor
>> version.
>>=20
>> Signed-off-by: Anju T Sudhakar <anju@linux.vnet.ibm.com>
>> [Decide extended mask at run time based on platform]
>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>> Reviewed-by: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
>=20
> Will need an ack from perf tools folks, who are not on Cc by the =
looks.
>=20

Yes, my bad. Will make sure to add proper Cc=20

>> diff --git a/tools/arch/powerpc/include/uapi/asm/perf_regs.h =
b/tools/arch/powerpc/include/uapi/asm/perf_regs.h
>> index f599064..485b1d5 100644
>> --- a/tools/arch/powerpc/include/uapi/asm/perf_regs.h
>> +++ b/tools/arch/powerpc/include/uapi/asm/perf_regs.h
>> @@ -48,6 +48,18 @@ enum perf_event_powerpc_regs {
>> 	PERF_REG_POWERPC_DSISR,
>> 	PERF_REG_POWERPC_SIER,
>> 	PERF_REG_POWERPC_MMCRA,
>> -	PERF_REG_POWERPC_MAX,
>> +	/* Extended registers */
>> +	PERF_REG_POWERPC_MMCR0,
>> +	PERF_REG_POWERPC_MMCR1,
>> +	PERF_REG_POWERPC_MMCR2,
>> +	/* Max regs without the extended regs */
>> +	PERF_REG_POWERPC_MAX =3D PERF_REG_POWERPC_MMCRA + 1,
>=20
> I don't really understand this idea of a max that's not the max.
>=20
>> };
>> +
>> +#define PERF_REG_PMU_MASK	((1ULL << PERF_REG_POWERPC_MAX) - 1)
>> +
>> +/* PERF_REG_EXTENDED_MASK value for CPU_FTR_ARCH_300 */
>> +#define PERF_REG_PMU_MASK_300   (((1ULL << (PERF_REG_POWERPC_MMCR2 + =
1)) - 1) \
>> +				- PERF_REG_PMU_MASK)
>> +
>> #endif /* _UAPI_ASM_POWERPC_PERF_REGS_H */
>> diff --git a/tools/perf/arch/powerpc/include/perf_regs.h =
b/tools/perf/arch/powerpc/include/perf_regs.h
>> index e18a355..46ed00d 100644
>> --- a/tools/perf/arch/powerpc/include/perf_regs.h
>> +++ b/tools/perf/arch/powerpc/include/perf_regs.h
>> @@ -64,7 +64,10 @@
>> 	[PERF_REG_POWERPC_DAR] =3D "dar",
>> 	[PERF_REG_POWERPC_DSISR] =3D "dsisr",
>> 	[PERF_REG_POWERPC_SIER] =3D "sier",
>> -	[PERF_REG_POWERPC_MMCRA] =3D "mmcra"
>> +	[PERF_REG_POWERPC_MMCRA] =3D "mmcra",
>> +	[PERF_REG_POWERPC_MMCR0] =3D "mmcr0",
>> +	[PERF_REG_POWERPC_MMCR1] =3D "mmcr1",
>> +	[PERF_REG_POWERPC_MMCR2] =3D "mmcr2",
>> };
>>=20
>> static inline const char *perf_reg_name(int id)
>> diff --git a/tools/perf/arch/powerpc/util/perf_regs.c =
b/tools/perf/arch/powerpc/util/perf_regs.c
>> index 0a52429..9179230 100644
>> --- a/tools/perf/arch/powerpc/util/perf_regs.c
>> +++ b/tools/perf/arch/powerpc/util/perf_regs.c
>> @@ -6,9 +6,14 @@
>>=20
>> #include "../../../util/perf_regs.h"
>> #include "../../../util/debug.h"
>> +#include "../../../util/event.h"
>> +#include "../../../util/header.h"
>> +#include "../../../perf-sys.h"
>>=20
>> #include <linux/kernel.h>
>>=20
>> +#define PVR_POWER9		0x004E
>> +
>> const struct sample_reg sample_reg_masks[] =3D {
>> 	SMPL_REG(r0, PERF_REG_POWERPC_R0),
>> 	SMPL_REG(r1, PERF_REG_POWERPC_R1),
>> @@ -55,6 +60,9 @@
>> 	SMPL_REG(dsisr, PERF_REG_POWERPC_DSISR),
>> 	SMPL_REG(sier, PERF_REG_POWERPC_SIER),
>> 	SMPL_REG(mmcra, PERF_REG_POWERPC_MMCRA),
>> +	SMPL_REG(mmcr0, PERF_REG_POWERPC_MMCR0),
>> +	SMPL_REG(mmcr1, PERF_REG_POWERPC_MMCR1),
>> +	SMPL_REG(mmcr2, PERF_REG_POWERPC_MMCR2),
>> 	SMPL_REG_END
>> };
>>=20
>> @@ -163,3 +171,50 @@ int arch_sdt_arg_parse_op(char *old_op, char =
**new_op)
>>=20
>> 	return SDT_ARG_VALID;
>> }
>> +
>> +uint64_t arch__intr_reg_mask(void)
>> +{
>> +	struct perf_event_attr attr =3D {
>> +		.type                   =3D PERF_TYPE_HARDWARE,
>> +		.config                 =3D PERF_COUNT_HW_CPU_CYCLES,
>> +		.sample_type            =3D PERF_SAMPLE_REGS_INTR,
>> +		.precise_ip             =3D 1,
>> +		.disabled               =3D 1,
>> +		.exclude_kernel         =3D 1,
>> +	};
>> +	int fd, ret;
>> +	char buffer[64];
>> +	u32 version;
>> +	u64 extended_mask =3D 0;
>> +
>> +	/* Get the PVR value to set the extended
>> +	 * mask specific to platform
>=20
> Comment format is wrong, and punctuation please.
>=20
>> +	 */
>> +	get_cpuid(buffer, sizeof(buffer));
>> +	ret =3D sscanf(buffer, "%u,", &version);
>=20
> This is powerpc specific code, why not just use mfspr(SPRN_PVR), =
rather
> than redirecting via printf/sscanf.

Hi Michael

For perf tools, defines for `mfspr` , `SPRN_PVR` are in =
arch/powerpc/util/header.c=20
So I have re-used existing utility. Otherwise, we will need to include =
these defines here as well
Does that sounds good ?

>=20
>> +
>> +	if (ret !=3D 1) {
>> +		pr_debug("Failed to get the processor version, unable to =
output extended registers\n");
>> +		return PERF_REGS_MASK;
>> +	}
>> +
>> +	if (version =3D=3D PVR_POWER9)
>> +		extended_mask =3D PERF_REG_PMU_MASK_300;
>> +	else
>> +		return PERF_REGS_MASK;
>> +
>> +	attr.sample_regs_intr =3D extended_mask;
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
>> +		return (extended_mask | PERF_REGS_MASK);
>> +	}
>> +	return PERF_REGS_MASK;
>=20
> I think this would read a bit better like:
>=20
> 	mask =3D PERF_REGS_MASK;
>=20
> 	if (version =3D=3D PVR_POWER9)
> 		extended_mask =3D PERF_REG_PMU_MASK_300;
>        else
>        	return mask;
>=20
>        attr.sample_regs_intr =3D extended_mask;
>        attr.sample_period =3D 1;
>        event_attr_init(&attr);
>=20
>        /*
>          * check if the pmu supports perf extended regs, before
>          * returning the register mask to sample.
>          */
>        fd =3D sys_perf_event_open(&attr, 0, -1, -1, 0);
>        if (fd !=3D -1) {
>                close(fd);
>                mask |=3D extended_mask;
>        }
>=20
> 	return mask;

Sure, I will try with this change

Thanks
Athira
>=20
>=20
> cheers


--Apple-Mail=_5BBB7FC7-0E9B-4121-AFCB-D131E29B56AC
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On 08-Jul-2020, at 5:34 PM, Michael Ellerman &lt;<a =
href=3D"mailto:mpe@ellerman.id.au" class=3D"">mpe@ellerman.id.au</a>&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><div class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">Athira Rajeev &lt;</span><a =
href=3D"mailto:atrajeev@linux.vnet.ibm.com" style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px;" =
class=3D"">atrajeev@linux.vnet.ibm.com</a><span style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">&gt; writes:</span><br style=3D"caret-color: rgb(0, 0, 0); =
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
text-decoration: none;" class=3D"">From: Anju T Sudhakar &lt;<a =
href=3D"mailto:anju@linux.vnet.ibm.com" =
class=3D"">anju@linux.vnet.ibm.com</a>&gt;<br class=3D""><br =
class=3D"">Add extended regs to sample_reg_mask in the tool side to =
use<br class=3D"">with `-I?` option. Perf tools side uses extended mask =
to display<br class=3D"">the platform supported register names (with -I? =
option) to the user<br class=3D"">and also send this mask to the kernel =
to capture the extended registers<br class=3D"">in each sample. Hence =
decide the mask value based on the processor<br class=3D"">version.<br =
class=3D""><br class=3D"">Signed-off-by: Anju T Sudhakar &lt;<a =
href=3D"mailto:anju@linux.vnet.ibm.com" =
class=3D"">anju@linux.vnet.ibm.com</a>&gt;<br class=3D"">[Decide =
extended mask at run time based on platform]<br class=3D"">Signed-off-by: =
Athira Rajeev &lt;<a href=3D"mailto:atrajeev@linux.vnet.ibm.com" =
class=3D"">atrajeev@linux.vnet.ibm.com</a>&gt;<br class=3D"">Reviewed-by: =
Madhavan Srinivasan &lt;<a href=3D"mailto:maddy@linux.vnet.ibm.com" =
class=3D"">maddy@linux.vnet.ibm.com</a>&gt;<br class=3D""></blockquote><br=
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
display: inline !important;" class=3D"">Will need an ack from perf tools =
folks, who are not on Cc by the looks.</span><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""></div></blockquote><div><br =
class=3D""></div>Yes, my bad. Will make sure to add proper =
Cc&nbsp;</div><div><br class=3D""><blockquote type=3D"cite" =
class=3D""><div class=3D""><blockquote type=3D"cite" style=3D"font-family:=
 Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">diff =
--git a/tools/arch/powerpc/include/uapi/asm/perf_regs.h =
b/tools/arch/powerpc/include/uapi/asm/perf_regs.h<br class=3D"">index =
f599064..485b1d5 100644<br class=3D"">--- =
a/tools/arch/powerpc/include/uapi/asm/perf_regs.h<br class=3D"">+++ =
b/tools/arch/powerpc/include/uapi/asm/perf_regs.h<br class=3D"">@@ -48,6 =
+48,18 @@ enum perf_event_powerpc_regs {<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>PERF_REG_POWERPC_DSISR,<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>PERF_REG_POWERPC_SIER,<br class=3D""><span class=3D"Apple-tab-span"=
 style=3D"white-space: pre;">	</span>PERF_REG_POWERPC_MMCRA,<br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>PERF_REG_POWERPC_MAX,<br class=3D"">+<span class=3D"Apple-tab-span"=
 style=3D"white-space: pre;">	</span>/* Extended registers */<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>PERF_REG_POWERPC_MMCR0,<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>PERF_REG_POWERPC_MMCR1,<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>PERF_REG_POWERPC_MMCR2,<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>/* Max =
regs without the extended regs */<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>PERF_REG_POWERPC_MAX =3D PERF_REG_POWERPC_MMCRA + 1,<br =
class=3D""></blockquote><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">I don't really understand this idea of a max that's not the =
max.</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><blockquote type=3D"cite" style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">};<br =
class=3D"">+<br class=3D"">+#define PERF_REG_PMU_MASK<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>((1ULL =
&lt;&lt; PERF_REG_POWERPC_MAX) - 1)<br class=3D"">+<br class=3D"">+/* =
PERF_REG_EXTENDED_MASK value for CPU_FTR_ARCH_300 */<br =
class=3D"">+#define PERF_REG_PMU_MASK_300 &nbsp;&nbsp;(((1ULL &lt;&lt; =
(PERF_REG_POWERPC_MMCR2 + 1)) - 1) \<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>- =
PERF_REG_PMU_MASK)<br class=3D"">+<br class=3D"">#endif /* =
_UAPI_ASM_POWERPC_PERF_REGS_H */<br class=3D"">diff --git =
a/tools/perf/arch/powerpc/include/perf_regs.h =
b/tools/perf/arch/powerpc/include/perf_regs.h<br class=3D"">index =
e18a355..46ed00d 100644<br class=3D"">--- =
a/tools/perf/arch/powerpc/include/perf_regs.h<br class=3D"">+++ =
b/tools/perf/arch/powerpc/include/perf_regs.h<br class=3D"">@@ -64,7 =
+64,10 @@<br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>[PERF_REG_POWERPC_DAR] =3D =
"dar",<br class=3D""><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>[PERF_REG_POWERPC_DSISR] =3D "dsisr",<br class=3D""><span =
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
</span>[PERF_REG_POWERPC_MMCR2] =3D "mmcr2",<br class=3D"">};<br =
class=3D""><br class=3D"">static inline const char *perf_reg_name(int =
id)<br class=3D"">diff --git a/tools/perf/arch/powerpc/util/perf_regs.c =
b/tools/perf/arch/powerpc/util/perf_regs.c<br class=3D"">index =
0a52429..9179230 100644<br class=3D"">--- =
a/tools/perf/arch/powerpc/util/perf_regs.c<br class=3D"">+++ =
b/tools/perf/arch/powerpc/util/perf_regs.c<br class=3D"">@@ -6,9 +6,14 =
@@<br class=3D""><br class=3D"">#include "../../../util/perf_regs.h"<br =
class=3D"">#include "../../../util/debug.h"<br class=3D"">+#include =
"../../../util/event.h"<br class=3D"">+#include =
"../../../util/header.h"<br class=3D"">+#include =
"../../../perf-sys.h"<br class=3D""><br class=3D"">#include =
&lt;linux/kernel.h&gt;<br class=3D""><br class=3D"">+#define =
PVR_POWER9<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>0x004E<br class=3D"">+<br class=3D"">const struct sample_reg =
sample_reg_masks[] =3D {<br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>SMPL_REG(r0, =
PERF_REG_POWERPC_R0),<br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>SMPL_REG(r1, =
PERF_REG_POWERPC_R1),<br class=3D"">@@ -55,6 +60,9 @@<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>SMPL_REG(dsisr, PERF_REG_POWERPC_DSISR),<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>SMPL_REG(sier, PERF_REG_POWERPC_SIER),<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>SMPL_REG(mmcra, PERF_REG_POWERPC_MMCRA),<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>SMPL_REG(mmcr0, PERF_REG_POWERPC_MMCR0),<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>SMPL_REG(mmcr1, PERF_REG_POWERPC_MMCR1),<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>SMPL_REG(mmcr2, PERF_REG_POWERPC_MMCR2),<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>SMPL_REG_END<br class=3D"">};<br class=3D""><br class=3D"">@@ =
-163,3 +171,50 @@ int arch_sdt_arg_parse_op(char *old_op, char =
**new_op)<br class=3D""><br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>return SDT_ARG_VALID;<br =
class=3D"">}<br class=3D"">+<br class=3D"">+uint64_t =
arch__intr_reg_mask(void)<br class=3D"">+{<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>struct =
perf_event_attr attr =3D {<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>.type =
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
style=3D"white-space: pre;">	</span>.precise_ip =
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
style=3D"white-space: pre;">	</span>int fd, ret;<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>char =
buffer[64];<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>u32 version;<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>u64 =
extended_mask =3D 0;<br class=3D"">+<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>/* Get =
the PVR value to set the extended<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>* mask specific to =
platform<br class=3D""></blockquote><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">Comment format is wrong, and punctuation please.</span><br =
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
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>*/<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>get_cpuid(buffer, sizeof(buffer));<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>ret =3D =
sscanf(buffer, "%u,", &amp;version);<br class=3D""></blockquote><br =
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
display: inline !important;" class=3D"">This is powerpc specific code, =
why not just use mfspr(SPRN_PVR), rather</span><br style=3D"caret-color: =
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
class=3D"">than redirecting via printf/sscanf.</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" =
class=3D""></div></blockquote><div><br class=3D""></div>Hi =
Michael</div><div><br class=3D""></div><div>For perf tools, defines for =
`mfspr` , `SPRN_PVR` are in =
arch/powerpc/util/header.c&nbsp;</div><div>So I have re-used existing =
utility. Otherwise, we will need to include these defines here as =
well</div><div>Does that sounds good ?</div><div><br =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D""><br =
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
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">+<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>if (ret !=3D 1) {<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>pr_debug("Failed to get the =
processor version, unable to output extended registers\n");<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>return PERF_REGS_MASK;<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>}<br =
class=3D"">+<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>if (version =3D=3D PVR_POWER9)<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>extended_mask =3D PERF_REG_PMU_MASK_300;<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>else<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>return PERF_REGS_MASK;<br class=3D"">+<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>attr.sample_regs_intr =3D extended_mask;<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
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
style=3D"white-space: pre;">	</span>return (extended_mask | =
PERF_REGS_MASK);<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>}<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>return =
PERF_REGS_MASK;<br class=3D""></blockquote><br style=3D"caret-color: =
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
class=3D"">I think this would read a bit better like:</span><br =
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
class=3D"Apple-tab-span" style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
pre; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;">	</span><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">mask =3D =
PERF_REGS_MASK;</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span class=3D"Apple-tab-span" =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: pre; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;">	=
</span><span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">if (version =
=3D=3D PVR_POWER9)</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span class=3D"Apple-tab-span" =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: pre; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;">	=
</span><span class=3D"Apple-tab-span" style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
pre; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;">	</span><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">extended_mask =
=3D PERF_REG_PMU_MASK_300;</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;else</span><br =
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
display: inline !important;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span =
class=3D"Apple-tab-span" style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
pre; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;">	</span><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">return =
mask;</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;attr.sample_regs_intr=
 =3D extended_mask;</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;attr.sample_period =
=3D 1;</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;event_attr_init(&amp;=
attr);</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*</span><br =
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
display: inline !important;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* check =
if the pmu supports perf extended regs, before</span><br =
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
display: inline !important;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* =
returning the register mask to sample.</span><br style=3D"caret-color: =
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
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*/</span>=
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;fd =3D =
sys_perf_event_open(&amp;attr, 0, -1, -1, 0);</span><br =
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
display: inline !important;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (fd !=3D -1) =
{</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;close(fd);</span><br style=3D"caret-color: =
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
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;mask |=3D extended_mask;</span><br =
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
display: inline !important;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}</span><br =
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
class=3D"Apple-tab-span" style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
pre; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;">	</span><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">return =
mask;</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""></div></blockquote><div><br class=3D""></div>Sure, I =
will try with this change</div><div><br =
class=3D""></div><div>Thanks</div><div>Athira<br class=3D""><blockquote =
type=3D"cite" class=3D""><div class=3D""><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">cheers</span></div></blockquote></div><br =
class=3D""></body></html>=

--Apple-Mail=_5BBB7FC7-0E9B-4121-AFCB-D131E29B56AC--

