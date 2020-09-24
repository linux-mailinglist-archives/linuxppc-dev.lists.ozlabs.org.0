Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A472766D0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Sep 2020 05:17:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BxgG23F2xzDqW3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Sep 2020 13:17:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=h0/G95Tb; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BxgDF4DvHzDqT9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Sep 2020 13:15:57 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08O31C0g173811; Wed, 23 Sep 2020 23:15:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=g9tmMRJjOxwYyc0NxqdXuEhIq1MgBAjOQBkUCajvask=;
 b=h0/G95Tbtarkl6kRIdKa0VSkaTRs4sSARCEaFqEKbFJ/9HwwiPPRVsidP+mZ0QyeKVD5
 bTCom0efZ7C0o5eJVw14W/7P/xE2mCE+QMzoj7y2pNbBHT/ZisupD20zzejsJ0VVJaI6
 R0kS2MncMdjUyqWSiYZSgwW02K3Yp68sesgDiz7Bm4WkH/RZL/uD9ezUxEMHeFV2pA6Z
 C6y9SaPmz087ilrqtzfTL0dWmHepy2elP406Bd3CKyUTHs+7RItnmjo2fFY/s9jxMori
 /73BTiWIU0NiL3A7NyoPln8TihKXT5AbklmrIFSiIy/FALEj2HUudvk6r8TO61PRPc48 FQ== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33rjg2h3cf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Sep 2020 23:15:45 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08O38t3O001075;
 Thu, 24 Sep 2020 03:15:44 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06fra.de.ibm.com with ESMTP id 33n98gtgcr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Sep 2020 03:15:43 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08O3FfXa13762896
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Sep 2020 03:15:41 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9D60CA4051;
 Thu, 24 Sep 2020 03:15:41 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D2676A405B;
 Thu, 24 Sep 2020 03:15:38 +0000 (GMT)
Received: from [9.77.196.90] (unknown [9.77.196.90])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu, 24 Sep 2020 03:15:38 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: [PATCH -next v2] powerpc/perf: Fix symbol undeclared warning
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20200923071453.2540-1-wangwensheng4@huawei.com>
Date: Thu, 24 Sep 2020 08:45:36 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <6BDE5740-1EC8-494B-87CC-88B839D0E595@linux.vnet.ibm.com>
References: <20200923071453.2540-1-wangwensheng4@huawei.com>
To: Wang Wensheng <wangwensheng4@huawei.com>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-24_01:2020-09-23,
 2020-09-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 spamscore=0 impostorscore=0 mlxlogscore=999 lowpriorityscore=0
 suspectscore=0 mlxscore=0 phishscore=0 malwarescore=0 clxscore=1011
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009240019
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
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, linux-kernel@vger.kernel.org,
 rui.xiang@huawei.com, "anju@linux.vnet.ibm.com" <anju@linux.vnet.ibm.com>,
 paulus@samba.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 23-Sep-2020, at 12:44 PM, Wang Wensheng <wangwensheng4@huawei.com> =
wrote:
>=20
> Build kernel with `C=3D2`:
> arch/powerpc/perf/isa207-common.c:24:18: warning: symbol
> 'isa207_pmu_format_attr' was not declared. Should it be static?
> arch/powerpc/perf/power9-pmu.c:101:5: warning: symbol 'p9_dd21_bl_ev'
> was not declared. Should it be static?
> arch/powerpc/perf/power9-pmu.c:115:5: warning: symbol 'p9_dd22_bl_ev'
> was not declared. Should it be static?
>=20
> Those symbols are used only in the files that define them so we =
declare
> them as static to fix the warnings.

Hi,=20

Looks fine to me.=20

Reviewed-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>

Thanks
Athira
>=20
> Signed-off-by: Wang Wensheng <wangwensheng4@huawei.com>
> ---
> arch/powerpc/perf/isa207-common.c | 2 +-
> arch/powerpc/perf/power9-pmu.c    | 4 ++--
> 2 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/powerpc/perf/isa207-common.c =
b/arch/powerpc/perf/isa207-common.c
> index 964437adec18..85dc860b265b 100644
> --- a/arch/powerpc/perf/isa207-common.c
> +++ b/arch/powerpc/perf/isa207-common.c
> @@ -21,7 +21,7 @@ PMU_FORMAT_ATTR(thresh_stop,	"config:32-35");
> PMU_FORMAT_ATTR(thresh_start,	"config:36-39");
> PMU_FORMAT_ATTR(thresh_cmp,	"config:40-49");
>=20
> -struct attribute *isa207_pmu_format_attr[] =3D {
> +static struct attribute *isa207_pmu_format_attr[] =3D {
> 	&format_attr_event.attr,
> 	&format_attr_pmcxsel.attr,
> 	&format_attr_mark.attr,
> diff --git a/arch/powerpc/perf/power9-pmu.c =
b/arch/powerpc/perf/power9-pmu.c
> index 2a57e93a79dc..4a315fad1f99 100644
> --- a/arch/powerpc/perf/power9-pmu.c
> +++ b/arch/powerpc/perf/power9-pmu.c
> @@ -98,7 +98,7 @@ extern u64 PERF_REG_EXTENDED_MASK;
> /* PowerISA v2.07 format attribute structure*/
> extern struct attribute_group isa207_pmu_format_group;
>=20
> -int p9_dd21_bl_ev[] =3D {
> +static int p9_dd21_bl_ev[] =3D {
> 	PM_MRK_ST_DONE_L2,
> 	PM_RADIX_PWC_L1_HIT,
> 	PM_FLOP_CMPL,
> @@ -112,7 +112,7 @@ int p9_dd21_bl_ev[] =3D {
> 	PM_DISP_HELD_SYNC_HOLD,
> };
>=20
> -int p9_dd22_bl_ev[] =3D {
> +static int p9_dd22_bl_ev[] =3D {
> 	PM_DTLB_MISS_16G,
> 	PM_DERAT_MISS_2M,
> 	PM_DTLB_MISS_2M,
> --=20
> 2.25.0
>=20

