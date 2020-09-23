Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E342274EF5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Sep 2020 04:20:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bx2306SmFzDqYC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Sep 2020 12:20:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=n10/zlOX; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bx20l731fzDqYC
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Sep 2020 12:18:47 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08N21QIv141657; Tue, 22 Sep 2020 22:18:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=R2pKAg/axVd/E/0hSB/v+MTIdnTq6p/mXulo9Rktldc=;
 b=n10/zlOXEzLx08aoP308cJGillji3l817oM5jxAGUnltZEZ7O0H6t9xrHRDoyT9x5oCE
 04zZSe/LRcZryuF7c0vBaeCvkgOtrl+bQonDVccxlpqzDIVtmEAcsi5biOVtZqb3n3K4
 b9vxxgy8gAgtY/gfFETNY0aOIn4xsOz2HPO80o6Vh8SrPLJEvWoEfAxwAlfiddPAuCAw
 NR517WHVHnislaYXL2kUqyoupjUYijKp9jT7UrtJDbeqWZUTJxMRmV5eOq9uSkQUiqvn
 EecuxrDWewla9PnFVjOchrkCanTad6vB0KewznnqAW93TmtBZqkJg6wWNfLMgMxjkFzb uQ== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 33qw0wrkkb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Sep 2020 22:18:32 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08N2IURh002069;
 Wed, 23 Sep 2020 02:18:30 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03fra.de.ibm.com with ESMTP id 33p1f3sec9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Sep 2020 02:18:30 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 08N2GqTD32506208
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Sep 2020 02:16:52 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9C1664203F;
 Wed, 23 Sep 2020 02:18:27 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2EC1442041;
 Wed, 23 Sep 2020 02:18:25 +0000 (GMT)
Received: from [9.79.221.51] (unknown [9.79.221.51])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed, 23 Sep 2020 02:18:24 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: [PATCH -next] powerpc/perf: Fix symbol undeclared warning
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20200921112557.85471-1-wangwensheng4@huawei.com>
Date: Wed, 23 Sep 2020 07:48:22 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <931F16F9-CE90-40B8-A69D-B75E80BF5DE5@linux.vnet.ibm.com>
References: <20200921112557.85471-1-wangwensheng4@huawei.com>
To: Wang Wensheng <wangwensheng4@huawei.com>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-23_02:2020-09-21,
 2020-09-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 mlxscore=0
 bulkscore=0 adultscore=0 clxscore=1011 priorityscore=1501 spamscore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009230007
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
 "anju@linux.vnet.ibm.com" <anju@linux.vnet.ibm.com>, paulus@samba.org,
 kajoljain <kjain@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 21-Sep-2020, at 4:55 PM, Wang Wensheng <wangwensheng4@huawei.com> =
wrote:
>=20
> Build kernel with `C=3D2`:
> arch/powerpc/perf/isa207-common.c:24:18: warning: symbol
> 'isa207_pmu_format_attr' was not declared. Should it be static?
> arch/powerpc/perf/power9-pmu.c:101:5: warning: symbol 'p9_dd21_bl_ev'
> was not declared. Should it be static?
> arch/powerpc/perf/power9-pmu.c:115:5: warning: symbol 'p9_dd22_bl_ev'
> was not declared. Should it be static?

Hi,=20

It will be good to include a comment in the commit message saying what =
is the fix here.=20
ex, declare p9_dd21_bl_ev/p9_dd22_bl_ev as static variable.

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

