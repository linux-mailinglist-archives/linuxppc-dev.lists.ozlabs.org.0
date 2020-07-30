Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D724232CBD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jul 2020 09:56:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BHN6865n6zDr4F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jul 2020 17:56:48 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BHN430FbGzDqWj
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jul 2020 17:54:58 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06U7XV61100597; Thu, 30 Jul 2020 03:54:50 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32jw2m8kmq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Jul 2020 03:54:50 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06U7pEfK027677;
 Thu, 30 Jul 2020 07:54:48 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04ams.nl.ibm.com with ESMTP id 32gcy4nxnv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Jul 2020 07:54:47 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06U7sjKb40239188
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 30 Jul 2020 07:54:45 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 38F7752051;
 Thu, 30 Jul 2020 07:54:45 +0000 (GMT)
Received: from [9.85.117.159] (unknown [9.85.117.159])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id B61895204E;
 Thu, 30 Jul 2020 07:54:42 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: [PATCH V5 0/4] powerpc/perf: Add support for perf extended regs
 in powerpc
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <1595870184-1460-1-git-send-email-atrajeev@linux.vnet.ibm.com>
Date: Thu, 30 Jul 2020 13:24:40 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <27D1CE26-A506-4CFF-B1C2-E0545F26E637@linux.vnet.ibm.com>
References: <1595870184-1460-1-git-send-email-atrajeev@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@kernel.org>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-30_04:2020-07-30,
 2020-07-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0
 impostorscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999 clxscore=1015
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007300054
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
Cc: Ravi Bangoria <ravi.bangoria@linux.ibm.com>,
 Michael Neuling <mikey@neuling.org>, maddy@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, kjain@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 27-Jul-2020, at 10:46 PM, Athira Rajeev =
<atrajeev@linux.vnet.ibm.com> wrote:
>=20
> Patch set to add support for perf extended register capability in
> powerpc. The capability flag PERF_PMU_CAP_EXTENDED_REGS, is used to
> indicate the PMU which support extended registers. The generic code
> define the mask of extended registers as 0 for non supported =
architectures.
>=20
> Patches 1 and 2 are the kernel side changes needed to include
> base support for extended regs in powerpc and in power10.
> Patches 3 and 4 are the perf tools side changes needed to support the
> extended registers.
>=20

Hi Arnaldo, Jiri

please let me know if you have any comments/suggestions on this patch =
series to add support for perf extended regs.

Thanks
Athira

> patch 1/4 defines the PERF_PMU_CAP_EXTENDED_REGS mask to output the
> values of mmcr0,mmcr1,mmcr2 for POWER9. Defines =
`PERF_REG_EXTENDED_MASK`
> at runtime which contains mask value of the supported registers under
> extended regs.
>=20
> patch 2/4 adds the extended regs support for power10 and exposes
> MMCR3, SIER2, SIER3 registers as part of extended regs.
>=20
> Patch 3/4 and 4/4 adds extended regs to sample_reg_mask in the tool
> side to use with `-I?` option for power9 and power10 respectively.
>=20
> Ravi bangoria found an issue with `perf record -I` while testing the
> changes. The same issue is currently being worked on here:
> https://lkml.org/lkml/2020/7/19/413 and will be resolved once fix
> from Jin Yao is merged.
>=20
> This patch series is based on powerpc/next
>=20
> Changelog:
>=20
> Changes from v4 -> v5
> - initialize `perf_reg_extended_max` to work on
>  all platforms as suggested by Ravi Bangoria
> - Added Reviewed-and-Tested-by from Ravi Bangoria
>=20
> Changes from v3 -> v4
> - Split the series and send extended regs as separate patch set here.
>  Link to previous series :
>  =
https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=3D190462&st=
ate=3D*
>  Other PMU patches are already merged in powerpc/next.
>=20
> - Fixed kernel build issue when using config having
>  CONFIG_PERF_EVENTS set and without CONFIG_PPC_PERF_CTRS
>  reported by kernel build bot.
> - Included Reviewed-by from Kajol Jain.
> - Addressed review comments from Ravi Bangoria to initialize =
`perf_reg_extended_max`
>  and define it in lowercase since it is local variable.
>=20
> Anju T Sudhakar (2):
>  powerpc/perf: Add support for outputting extended regs in perf
>    intr_regs
>  tools/perf: Add perf tools support for extended register capability =
in
>    powerpc
>=20
> Athira Rajeev (2):
>  powerpc/perf: Add extended regs support for power10 platform
>  tools/perf: Add perf tools support for extended regs in power10
>=20
> arch/powerpc/include/asm/perf_event.h           |  3 ++
> arch/powerpc/include/asm/perf_event_server.h    |  5 +++
> arch/powerpc/include/uapi/asm/perf_regs.h       | 20 ++++++++-
> arch/powerpc/perf/core-book3s.c                 |  1 +
> arch/powerpc/perf/perf_regs.c                   | 44 =
++++++++++++++++++--
> arch/powerpc/perf/power10-pmu.c                 |  6 +++
> arch/powerpc/perf/power9-pmu.c                  |  6 +++
> tools/arch/powerpc/include/uapi/asm/perf_regs.h | 20 ++++++++-
> tools/perf/arch/powerpc/include/perf_regs.h     |  8 +++-
> tools/perf/arch/powerpc/util/header.c           |  9 +---
> tools/perf/arch/powerpc/util/perf_regs.c        | 55 =
+++++++++++++++++++++++++
> tools/perf/arch/powerpc/util/utils_header.h     | 15 +++++++
> 12 files changed, 178 insertions(+), 14 deletions(-)
> create mode 100644 tools/perf/arch/powerpc/util/utils_header.h
>=20
> --=20
> 1.8.3.1
>=20

