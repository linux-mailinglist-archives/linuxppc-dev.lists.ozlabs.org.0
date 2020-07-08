Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3247B217CD9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 03:55:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1j7d4qbpzDr15
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 11:55:41 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1j5M3mLqzDqfY
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jul 2020 11:53:43 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0681b6Ob158443; Tue, 7 Jul 2020 21:53:33 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3250rtnrm8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Jul 2020 21:53:33 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0681oG5q011070;
 Wed, 8 Jul 2020 01:53:31 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 322hd7v0gd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Jul 2020 01:53:30 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0681rS1Q49872960
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 8 Jul 2020 01:53:28 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C269DA405C;
 Wed,  8 Jul 2020 01:53:28 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E2321A405B;
 Wed,  8 Jul 2020 01:53:26 +0000 (GMT)
Received: from [9.77.206.84] (unknown [9.77.206.84])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed,  8 Jul 2020 01:53:26 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH v2 10/10] powerpc/perf: Add extended regs support for
 power10 platform
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <202007021706.LsuCoheg%lkp@intel.com>
Date: Wed, 8 Jul 2020 07:23:24 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <F6ED4C16-9ED2-49D5-B9DF-372868933824@linux.vnet.ibm.com>
References: <1593595262-1433-11-git-send-email-atrajeev@linux.vnet.ibm.com>
 <202007021706.LsuCoheg%lkp@intel.com>
To: kernel test robot <lkp@intel.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-07_15:2020-07-07,
 2020-07-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 cotscore=-2147483648 bulkscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 lowpriorityscore=0 mlxlogscore=999 phishscore=0
 clxscore=1011 spamscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2007080002
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
Cc: mikey@neuling.org, maddy@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 kbuild-all@lists.01.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 02-Jul-2020, at 3:10 PM, kernel test robot <lkp@intel.com> wrote:
>=20
> Hi Athira,
>=20
> Thank you for the patch! Yet something to improve:
>=20
> [auto build test ERROR on powerpc/next]
> [also build test ERROR on tip/perf/core v5.8-rc3 next-20200702]
> [If your patch is applied to the wrong git tree, kindly drop us a =
note.
> And when submitting patch, we suggest to use  as documented in
> https://git-scm.com/docs/git-format-patch]
>=20
> url:    =
https://github.com/0day-ci/linux/commits/Athira-Rajeev/powerpc-perf-Add-su=
pport-for-power10-PMU-Hardware/20200701-181147
> base:   =
https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
> config: powerpc-pmac32_defconfig (attached as .config)
> compiler: powerpc-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=3D1 build):
>        wget =
https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross =
-O ~/bin/make.cross
>        chmod +x ~/bin/make.cross
>        # save the attached .config to linux build tree
>        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 =
make.cross ARCH=3Dpowerpc=20
>=20
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>=20
> All errors (new ones prefixed by >>):
>=20
>   {standard input}: Assembler messages:
>>> {standard input}:84: Error: unsupported relocation against =
SPRN_SIER2
>>> {standard input}:91: Error: unsupported relocation against =
SPRN_SIER3
>>> {standard input}:119: Error: unsupported relocation against =
SPRN_MMCR3

These regs are not valid for ppc32 platform. Will fix this by including =
usage of these regs under conditional check for
=E2=80=9CCONFIG_PPC64=E2=80=9D in next version

Thanks
Athira Rajeev
>=20
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
> <.config.gz>

