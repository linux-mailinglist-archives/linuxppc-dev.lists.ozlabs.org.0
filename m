Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A667451F40C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 May 2022 07:53:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KxVj33W1Qz3dpL
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 May 2022 15:53:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tNEAniXw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=tNEAniXw; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KxVhL5pYcz2xh0
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 May 2022 15:53:06 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2495Qoub024638;
 Mon, 9 May 2022 05:52:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=GvFVmSAUaXgUDfm3VUBKuJukbZuZvQVmCj/7PTCy4aU=;
 b=tNEAniXw1EAz1DVdYlhm1xzlh5IeXkKP1gH9+EahLKLw7lo8gTs32yQZ72kgZNRK4Uq4
 U+HdHiVONc0CNvnt3RyaVU1dNLwSLp/S9zeCBibgxJV3pdzdaslAlTOqeRlLW67j7vhL
 +R+0rOhwF/DibXpIjq5+wGLWuh9gFYABaT4sS9OtQ/L3dj7PmOPC+lNYTjP08dgc5ROR
 v3ibJmJ4gOqNjQMLP8ezFyJ0dpHaIjMsuiTmLSOrUC2r43O+yDaZwRySMhXDHfQdrpxL
 qc6AAO5TLbHE5Dm255BHH1D6voz9GSci0B5Qlf+QVpnp8SyfsD8udMlfYy/cIncfN0LE Sw== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fx22ub1w3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 May 2022 05:52:58 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2495iJGw016950;
 Mon, 9 May 2022 05:52:56 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma01fra.de.ibm.com with ESMTP id 3fwgd8hher-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 May 2022 05:52:56 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2495qqXj32702724
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 May 2022 05:52:52 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BE6FCA404D;
 Mon,  9 May 2022 05:52:52 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0D32DA4040;
 Mon,  9 May 2022 05:52:50 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.211.104.241])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon,  9 May 2022 05:52:49 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH 1/2] powerpc/perf: Fix the threshold compare group
 constraint for power10
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20220506061015.43916-1-kjain@linux.ibm.com>
Date: Mon, 9 May 2022 11:22:45 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <86313E33-2772-4E30-B7F4-750162E441D3@linux.vnet.ibm.com>
References: <20220506061015.43916-1-kjain@linux.ibm.com>
To: Kajol Jain <kjain@linux.ibm.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: SxiAIkbP_RuauuTvsw5YhpfHUvuHoW2P
X-Proofpoint-GUID: SxiAIkbP_RuauuTvsw5YhpfHUvuHoW2P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-09_01,2022-05-06_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 spamscore=0 mlxlogscore=999
 phishscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205090032
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
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 disgoel@linux.vnet.ibm.com, Nageswara Sastry <rnsastry@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 06-May-2022, at 11:40 AM, Kajol Jain <kjain@linux.ibm.com> wrote:
>=20
> Thresh compare bits for a event is used to program thresh compare
> field in Monitor Mode Control Register A (MMCRA: 8-18 bits for =
power10).
> When scheduling events as a group, all events in that group should
> match value in threshold bits. Otherwise event open for the sibling
> events should fail. But in the current code, incase thresh compare =
bits are
> not valid, we are not failing in group_constraint function which can =
result
> in invalid group schduling.
>=20
> Fix the issue by returning -1 incase event is threshold and threshold
> compare value is not valid in group_constraint function.
>=20
> Patch also fixes the p10_thresh_cmp_val function to return -1,
> incase threshold bits are not valid and changes corresponding check in
> is_thresh_cmp_valid function to return false only when the thresh_cmp
> value is less then 0.
>=20
> Thresh control bits in the event code is used to program thresh_ctl
> field in Monitor Mode Control Register A (MMCRA: 48-55). In below =
example,
> the scheduling of group events PM_MRK_INST_CMPL (3534401e0) and
> PM_THRESH_MET (34340101ec) is expected to fail as both event
> request different thresh control bits.
>=20
> Result before the patch changes:
>=20
> [command]# perf stat -e "{r35340401e0,r34340101ec}" sleep 1
>=20
> Performance counter stats for 'sleep 1':
>=20
>             8,482      r35340401e0
>                 0      r34340101ec
>=20
>       1.001474838 seconds time elapsed
>=20
>       0.001145000 seconds user
>       0.000000000 seconds sys
>=20
> Result after the patch changes:
>=20
> [command]# perf stat -e "{r35340401e0,r34340101ec}" sleep 1
>=20
> Performance counter stats for 'sleep 1':
>=20
>     <not counted>      r35340401e0
>   <not supported>      r34340101ec
>=20
>       1.001499607 seconds time elapsed
>=20
>       0.000204000 seconds user
>       0.000760000 seconds sys
>=20
> Fixes: 82d2c16b350f7 ("powerpc/perf: Adds support for programming
> of Thresholding in P10")
> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>

Reviewed-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>

Thanks
Athira
> ---
> arch/powerpc/perf/isa207-common.c | 9 +++++----
> 1 file changed, 5 insertions(+), 4 deletions(-)
>=20
> diff --git a/arch/powerpc/perf/isa207-common.c =
b/arch/powerpc/perf/isa207-common.c
> index a74d382ecbb7..013b06af6fe6 100644
> --- a/arch/powerpc/perf/isa207-common.c
> +++ b/arch/powerpc/perf/isa207-common.c
> @@ -108,7 +108,7 @@ static void mmcra_sdar_mode(u64 event, unsigned =
long *mmcra)
> 		*mmcra |=3D MMCRA_SDAR_MODE_TLB;
> }
>=20
> -static u64 p10_thresh_cmp_val(u64 value)
> +static int p10_thresh_cmp_val(u64 value)
> {
> 	int exp =3D 0;
> 	u64 result =3D value;
> @@ -139,7 +139,7 @@ static u64 p10_thresh_cmp_val(u64 value)
> 		 * exponent is also zero.
> 		 */
> 		if (!(value & 0xC0) && exp)
> -			result =3D 0;
> +			result =3D -1;
> 		else
> 			result =3D (exp << 8) | value;
> 	}
> @@ -187,7 +187,7 @@ static bool is_thresh_cmp_valid(u64 event)
> 	unsigned int cmp, exp;
>=20
> 	if (cpu_has_feature(CPU_FTR_ARCH_31))
> -		return p10_thresh_cmp_val(event) !=3D 0;
> +		return p10_thresh_cmp_val(event) >=3D 0;
>=20
> 	/*
> 	 * Check the mantissa upper two bits are not zero, unless the
> @@ -502,7 +502,8 @@ int isa207_get_constraint(u64 event, unsigned long =
*maskp, unsigned long *valp,
> 			value |=3D CNST_THRESH_CTL_SEL_VAL(event >> =
EVENT_THRESH_SHIFT);
> 			mask  |=3D p10_CNST_THRESH_CMP_MASK;
> 			value |=3D =
p10_CNST_THRESH_CMP_VAL(p10_thresh_cmp_val(event_config1));
> -		}
> +		} else if (event_is_threshold(event))
> +			return -1;
> 	} else if (cpu_has_feature(CPU_FTR_ARCH_300))  {
> 		if (event_is_threshold(event) && =
is_thresh_cmp_valid(event)) {
> 			mask  |=3D CNST_THRESH_MASK;
> --=20
> 2.31.1
>=20

