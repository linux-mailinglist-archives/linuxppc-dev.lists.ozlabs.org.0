Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F022259CE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jul 2020 10:16:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B9F1p31k0zDqWk
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jul 2020 18:16:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B9DvJ00RrzDqQY
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jul 2020 18:11:07 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06K82vhq031028; Mon, 20 Jul 2020 04:10:55 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32cea0u2cv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jul 2020 04:10:55 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06K853vK011110;
 Mon, 20 Jul 2020 08:09:56 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 32brq7jdw5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jul 2020 08:09:56 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 06K88UPg54919658
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Jul 2020 08:08:30 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 40076A4059;
 Mon, 20 Jul 2020 08:09:54 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EA615A4051;
 Mon, 20 Jul 2020 08:09:49 +0000 (GMT)
Received: from [9.79.219.218] (unknown [9.79.219.218])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon, 20 Jul 2020 08:09:49 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Message-Id: <E9CBA3E7-A31C-44A8-B4F5-42DF58FE21BE@linux.vnet.ibm.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_A5551C5C-F653-4A8F-8DFB-D9ACF0D5F7B6"
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [v3 12/15] powerpc/perf: Add support for outputting extended regs
 in perf intr_regs
Date: Mon, 20 Jul 2020 13:39:47 +0530
In-Reply-To: <202007191932.4rHY8FD8%lkp@intel.com>
To: kernel test robot <lkp@intel.com>
References: <1594996707-3727-13-git-send-email-atrajeev@linux.vnet.ibm.com>
 <202007191932.4rHY8FD8%lkp@intel.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-20_04:2020-07-17,
 2020-07-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 impostorscore=0 spamscore=0 malwarescore=0 mlxscore=0 phishscore=0
 adultscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 mlxlogscore=999 clxscore=1011 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2007200060
X-Mailman-Approved-At: Mon, 20 Jul 2020 18:15:07 +1000
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
Cc: ego <ego@linux.vnet.ibm.com>, Michael Neuling <mikey@neuling.org>,
 maddy@linux.vnet.ibm.com, kbuild-all@lists.01.org, kvm@vger.kernel.org,
 kvm-ppc@vger.kernel.org, svaidyan@in.ibm.com,
 clang-built-linux@googlegroups.com, acme@kernel.org, jolsa@kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--Apple-Mail=_A5551C5C-F653-4A8F-8DFB-D9ACF0D5F7B6
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On 19-Jul-2020, at 4:47 PM, kernel test robot <lkp@intel.com> wrote:
>=20
> Hi Athira,
>=20
> Thank you for the patch! Yet something to improve:
>=20
> [auto build test ERROR on powerpc/next]
> [also build test ERROR on tip/perf/core v5.8-rc5 next-20200717]
> [If your patch is applied to the wrong git tree, kindly drop us a =
note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
>=20
> url:    =
https://github.com/0day-ci/linux/commits/Athira-Rajeev/powerpc-perf-Add-su=
pport-for-power10-PMU-Hardware/20200717-224353
> base:   =
https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
> config: powerpc64-randconfig-r024-20200719 (attached as .config)
> compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project =
ed6b578040a85977026c93bf4188f996148f3218)
> reproduce (this is a W=3D1 build):
>        wget =
https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross =
-O ~/bin/make.cross
>        chmod +x ~/bin/make.cross
>        # install powerpc64 cross compiling tool for clang build
>        # apt-get install binutils-powerpc64-linux-gnu
>        # save the attached .config to linux build tree
>        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross =
ARCH=3Dpowerpc64=20
>=20
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>=20
> All errors (new ones prefixed by >>):
>=20
>   arch/powerpc/include/asm/io-defs.h:45:1: warning: performing pointer =
arithmetic on a null pointer has undefined behavior =
[-Wnull-pointer-arithmetic]
>   DEF_PCI_AC_NORET(insw, (unsigned long p, void *b, unsigned long c),
>   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   arch/powerpc/include/asm/io.h:601:3: note: expanded from macro =
'DEF_PCI_AC_NORET'
>                   __do_##name al;                                 \
>                   ^~~~~~~~~~~~~~
>   <scratch space>:221:1: note: expanded from here
>   __do_insw
>   ^
>   arch/powerpc/include/asm/io.h:542:56: note: expanded from macro =
'__do_insw'
>   #define __do_insw(p, b, n)      readsw((PCI_IO_ADDR)_IO_BASE+(p), =
(b), (n))
>                                          ~~~~~~~~~~~~~~~~~~~~~^
>   In file included from arch/powerpc/perf/perf_regs.c:10:
>   In file included from include/linux/perf_event.h:57:
>   In file included from include/linux/cgroup.h:26:
>   In file included from include/linux/kernel_stat.h:9:
>   In file included from include/linux/interrupt.h:11:
>   In file included from include/linux/hardirq.h:10:
>   In file included from arch/powerpc/include/asm/hardirq.h:6:
>   In file included from include/linux/irq.h:20:
>   In file included from include/linux/io.h:13:
>   In file included from arch/powerpc/include/asm/io.h:604:
>   arch/powerpc/include/asm/io-defs.h:47:1: warning: performing pointer =
arithmetic on a null pointer has undefined behavior =
[-Wnull-pointer-arithmetic]
>   DEF_PCI_AC_NORET(insl, (unsigned long p, void *b, unsigned long c),
>   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   arch/powerpc/include/asm/io.h:601:3: note: expanded from macro =
'DEF_PCI_AC_NORET'
>                   __do_##name al;                                 \
>                   ^~~~~~~~~~~~~~
>   <scratch space>:223:1: note: expanded from here
>   __do_insl
>   ^
>   arch/powerpc/include/asm/io.h:543:56: note: expanded from macro =
'__do_insl'
>   #define __do_insl(p, b, n)      readsl((PCI_IO_ADDR)_IO_BASE+(p), =
(b), (n))
>                                          ~~~~~~~~~~~~~~~~~~~~~^
>   In file included from arch/powerpc/perf/perf_regs.c:10:
>   In file included from include/linux/perf_event.h:57:
>   In file included from include/linux/cgroup.h:26:
>   In file included from include/linux/kernel_stat.h:9:
>   In file included from include/linux/interrupt.h:11:
>   In file included from include/linux/hardirq.h:10:
>   In file included from arch/powerpc/include/asm/hardirq.h:6:
>   In file included from include/linux/irq.h:20:
>   In file included from include/linux/io.h:13:
>   In file included from arch/powerpc/include/asm/io.h:604:
>   arch/powerpc/include/asm/io-defs.h:49:1: warning: performing pointer =
arithmetic on a null pointer has undefined behavior =
[-Wnull-pointer-arithmetic]
>   DEF_PCI_AC_NORET(outsb, (unsigned long p, const void *b, unsigned =
long c),
>   =
^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=

>   arch/powerpc/include/asm/io.h:601:3: note: expanded from macro =
'DEF_PCI_AC_NORET'
>                   __do_##name al;                                 \
>                   ^~~~~~~~~~~~~~
>   <scratch space>:225:1: note: expanded from here
>   __do_outsb
>   ^
>   arch/powerpc/include/asm/io.h:544:58: note: expanded from macro =
'__do_outsb'
>   #define __do_outsb(p, b, n)     =
writesb((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
>                                           ~~~~~~~~~~~~~~~~~~~~~^
>   In file included from arch/powerpc/perf/perf_regs.c:10:
>   In file included from include/linux/perf_event.h:57:
>   In file included from include/linux/cgroup.h:26:
>   In file included from include/linux/kernel_stat.h:9:
>   In file included from include/linux/interrupt.h:11:
>   In file included from include/linux/hardirq.h:10:
>   In file included from arch/powerpc/include/asm/hardirq.h:6:
>   In file included from include/linux/irq.h:20:
>   In file included from include/linux/io.h:13:
>   In file included from arch/powerpc/include/asm/io.h:604:
>   arch/powerpc/include/asm/io-defs.h:51:1: warning: performing pointer =
arithmetic on a null pointer has undefined behavior =
[-Wnull-pointer-arithmetic]
>   DEF_PCI_AC_NORET(outsw, (unsigned long p, const void *b, unsigned =
long c),
>   =
^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=

>   arch/powerpc/include/asm/io.h:601:3: note: expanded from macro =
'DEF_PCI_AC_NORET'
>                   __do_##name al;                                 \
>                   ^~~~~~~~~~~~~~
>   <scratch space>:227:1: note: expanded from here
>   __do_outsw
>   ^
>   arch/powerpc/include/asm/io.h:545:58: note: expanded from macro =
'__do_outsw'
>   #define __do_outsw(p, b, n)     =
writesw((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
>                                           ~~~~~~~~~~~~~~~~~~~~~^
>   In file included from arch/powerpc/perf/perf_regs.c:10:
>   In file included from include/linux/perf_event.h:57:
>   In file included from include/linux/cgroup.h:26:
>   In file included from include/linux/kernel_stat.h:9:
>   In file included from include/linux/interrupt.h:11:
>   In file included from include/linux/hardirq.h:10:
>   In file included from arch/powerpc/include/asm/hardirq.h:6:
>   In file included from include/linux/irq.h:20:
>   In file included from include/linux/io.h:13:
>   In file included from arch/powerpc/include/asm/io.h:604:
>   arch/powerpc/include/asm/io-defs.h:53:1: warning: performing pointer =
arithmetic on a null pointer has undefined behavior =
[-Wnull-pointer-arithmetic]
>   DEF_PCI_AC_NORET(outsl, (unsigned long p, const void *b, unsigned =
long c),
>   =
^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=

>   arch/powerpc/include/asm/io.h:601:3: note: expanded from macro =
'DEF_PCI_AC_NORET'
>                   __do_##name al;                                 \
>                   ^~~~~~~~~~~~~~
>   <scratch space>:229:1: note: expanded from here
>   __do_outsl
>   ^
>   arch/powerpc/include/asm/io.h:546:58: note: expanded from macro =
'__do_outsl'
>   #define __do_outsl(p, b, n)     =
writesl((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
>                                           ~~~~~~~~~~~~~~~~~~~~~^
>>> arch/powerpc/perf/perf_regs.c:16:5: error: expected identifier or =
'('
>   u64 PERF_REG_EXTENDED_MASK;
>       ^
>   include/linux/perf_regs.h:16:32: note: expanded from macro =
'PERF_REG_EXTENDED_MASK'
>   #define PERF_REG_EXTENDED_MASK  0
>                                   ^
>   12 warnings and 1 error generated.
>=20
> vim +16 arch/powerpc/perf/perf_regs.c
>=20
>    15=09
>> 16	u64 PERF_REG_EXTENDED_MASK;
>    17=09

Hi,

This patch defines PERF_REG_EXTENDED_MASK
in arch/powerpc/include/asm/perf_event_server.h and this header file is =
included conditionally based on
CONFIG_PPC_PERF_CTRS in arch/powerpc/include/asm/perf_event.h.
So build breaks happens with config having CONFIG_PERF_EVENTS set
and without CONFIG_PPC_PERF_CTRS.=20

This will be fixed by defining PERF_REG_EXTENDED_MASK in perf_event.h as =
below:

=E2=80=94
diff --git a/arch/powerpc/include/asm/perf_event.h =
b/arch/powerpc/include/asm/perf_event.h
index eed3954082fa..b1c3a91aa6fa 100644
--- a/arch/powerpc/include/asm/perf_event.h
+++ b/arch/powerpc/include/asm/perf_event.h
@@ -38,4 +38,6 @@
=20
 /* To support perf_regs sier update */
 extern bool is_sier_available(void);
+extern u64 PERF_REG_EXTENDED_MASK;
+#define PERF_REG_EXTENDED_MASK	PERF_REG_EXTENDED_MASK
 #endif
diff --git a/arch/powerpc/include/asm/perf_event_server.h =
b/arch/powerpc/include/asm/perf_event_server.h
index bf85d1a0b59e..5d368e81445f 100644
--- a/arch/powerpc/include/asm/perf_event_server.h
+++ b/arch/powerpc/include/asm/perf_event_server.h
@@ -15,9 +15,6 @@
 #define MAX_EVENT_ALTERNATIVES	8
 #define MAX_LIMITED_HWCOUNTERS	2
=20
-extern u64 PERF_REG_EXTENDED_MASK;
-#define PERF_REG_EXTENDED_MASK	PERF_REG_EXTENDED_MASK
-
 struct perf_event;
=20
 struct mmcr_regs {
=E2=80=94

We also need this patch by Madhavan Sirinivasan : =
https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=3D183203
to solve similar build break with `is_sier_available`

Thanks
Athira=20

>=20
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
> <.config.gz>


--Apple-Mail=_A5551C5C-F653-4A8F-8DFB-D9ACF0D5F7B6
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On 19-Jul-2020, at 4:47 PM, kernel test robot &lt;<a =
href=3D"mailto:lkp@intel.com" class=3D"">lkp@intel.com</a>&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><div class=3D""><div =
class=3D"">Hi Athira,<br class=3D""><br class=3D"">Thank you for the =
patch! Yet something to improve:<br class=3D""><br class=3D"">[auto =
build test ERROR on powerpc/next]<br class=3D"">[also build test ERROR =
on tip/perf/core v5.8-rc5 next-20200717]<br class=3D"">[If your patch is =
applied to the wrong git tree, kindly drop us a note.<br class=3D"">And =
when submitting patch, we suggest to use '--base' as documented in<br =
class=3D""><a href=3D"https://git-scm.com/docs/git-format-patch" =
class=3D"">https://git-scm.com/docs/git-format-patch</a>]<br =
class=3D""><br class=3D"">url: &nbsp;&nbsp;&nbsp;<a =
href=3D"https://github.com/0day-ci/linux/commits/Athira-Rajeev/powerpc-per=
f-Add-support-for-power10-PMU-Hardware/20200717-224353" =
class=3D"">https://github.com/0day-ci/linux/commits/Athira-Rajeev/powerpc-=
perf-Add-support-for-power10-PMU-Hardware/20200717-224353</a><br =
class=3D"">base: &nbsp;&nbsp;<a =
href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git"=
 =
class=3D"">https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.g=
it</a> next<br class=3D"">config: powerpc64-randconfig-r024-20200719 =
(attached as .config)<br class=3D"">compiler: clang version 12.0.0 (<a =
href=3D"https://github.com/llvm/llvm-project" =
class=3D"">https://github.com/llvm/llvm-project</a> =
ed6b578040a85977026c93bf4188f996148f3218)<br class=3D"">reproduce (this =
is a W=3D1 build):<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;wget <a =
href=3D"https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make=
.cross" =
class=3D"">https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/m=
ake.cross</a> -O ~/bin/make.cross<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;chmod +x ~/bin/make.cross<br =
class=3D""> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# install =
powerpc64 cross compiling tool for clang build<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# apt-get install =
binutils-powerpc64-linux-gnu<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# save the attached .config to =
linux build tree<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;COMPILER_INSTALL_PATH=3D$HOME/0d=
ay COMPILER=3Dclang make.cross ARCH=3Dpowerpc64 <br class=3D""><br =
class=3D"">If you fix the issue, kindly add following tag as =
appropriate<br class=3D"">Reported-by: kernel test robot &lt;<a =
href=3D"mailto:lkp@intel.com" class=3D"">lkp@intel.com</a>&gt;<br =
class=3D""><br class=3D"">All errors (new ones prefixed by &gt;&gt;):<br =
class=3D""><br class=3D""> =
&nbsp;&nbsp;arch/powerpc/include/asm/io-defs.h:45:1: warning: performing =
pointer arithmetic on a null pointer has undefined behavior =
[-Wnull-pointer-arithmetic]<br class=3D""> =
&nbsp;&nbsp;DEF_PCI_AC_NORET(insw, (unsigned long p, void *b, unsigned =
long c),<br class=3D""> =
&nbsp;&nbsp;^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~<br class=3D""> &nbsp;&nbsp;arch/powerpc/include/asm/io.h:601:3: =
note: expanded from macro 'DEF_PCI_AC_NORET'<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;__do_##name al; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;^~~~~~~~~~~~~~<br class=3D""> =
&nbsp;&nbsp;&lt;scratch space&gt;:221:1: note: expanded from here<br =
class=3D""> &nbsp;&nbsp;__do_insw<br class=3D""> &nbsp;&nbsp;^<br =
class=3D""> &nbsp;&nbsp;arch/powerpc/include/asm/io.h:542:56: note: =
expanded from macro '__do_insw'<br class=3D""> &nbsp;&nbsp;#define =
__do_insw(p, b, n) =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;readsw((PCI_IO_ADDR)_IO_BASE+(p), (b), =
(n))<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;~~~~~~~~~~~~~~~~~~~~~^<br class=3D""> =
&nbsp;&nbsp;In file included from arch/powerpc/perf/perf_regs.c:10:<br =
class=3D""> &nbsp;&nbsp;In file included from =
include/linux/perf_event.h:57:<br class=3D""> &nbsp;&nbsp;In file =
included from include/linux/cgroup.h:26:<br class=3D""> &nbsp;&nbsp;In =
file included from include/linux/kernel_stat.h:9:<br class=3D""> =
&nbsp;&nbsp;In file included from include/linux/interrupt.h:11:<br =
class=3D""> &nbsp;&nbsp;In file included from =
include/linux/hardirq.h:10:<br class=3D""> &nbsp;&nbsp;In file included =
from arch/powerpc/include/asm/hardirq.h:6:<br class=3D""> &nbsp;&nbsp;In =
file included from include/linux/irq.h:20:<br class=3D""> &nbsp;&nbsp;In =
file included from include/linux/io.h:13:<br class=3D""> &nbsp;&nbsp;In =
file included from arch/powerpc/include/asm/io.h:604:<br class=3D""> =
&nbsp;&nbsp;arch/powerpc/include/asm/io-defs.h:47:1: warning: performing =
pointer arithmetic on a null pointer has undefined behavior =
[-Wnull-pointer-arithmetic]<br class=3D""> =
&nbsp;&nbsp;DEF_PCI_AC_NORET(insl, (unsigned long p, void *b, unsigned =
long c),<br class=3D""> =
&nbsp;&nbsp;^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~<br class=3D""> &nbsp;&nbsp;arch/powerpc/include/asm/io.h:601:3: =
note: expanded from macro 'DEF_PCI_AC_NORET'<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;__do_##name al; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;^~~~~~~~~~~~~~<br class=3D""> =
&nbsp;&nbsp;&lt;scratch space&gt;:223:1: note: expanded from here<br =
class=3D""> &nbsp;&nbsp;__do_insl<br class=3D""> &nbsp;&nbsp;^<br =
class=3D""> &nbsp;&nbsp;arch/powerpc/include/asm/io.h:543:56: note: =
expanded from macro '__do_insl'<br class=3D""> &nbsp;&nbsp;#define =
__do_insl(p, b, n) =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;readsl((PCI_IO_ADDR)_IO_BASE+(p), (b), =
(n))<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;~~~~~~~~~~~~~~~~~~~~~^<br class=3D""> =
&nbsp;&nbsp;In file included from arch/powerpc/perf/perf_regs.c:10:<br =
class=3D""> &nbsp;&nbsp;In file included from =
include/linux/perf_event.h:57:<br class=3D""> &nbsp;&nbsp;In file =
included from include/linux/cgroup.h:26:<br class=3D""> &nbsp;&nbsp;In =
file included from include/linux/kernel_stat.h:9:<br class=3D""> =
&nbsp;&nbsp;In file included from include/linux/interrupt.h:11:<br =
class=3D""> &nbsp;&nbsp;In file included from =
include/linux/hardirq.h:10:<br class=3D""> &nbsp;&nbsp;In file included =
from arch/powerpc/include/asm/hardirq.h:6:<br class=3D""> &nbsp;&nbsp;In =
file included from include/linux/irq.h:20:<br class=3D""> &nbsp;&nbsp;In =
file included from include/linux/io.h:13:<br class=3D""> &nbsp;&nbsp;In =
file included from arch/powerpc/include/asm/io.h:604:<br class=3D""> =
&nbsp;&nbsp;arch/powerpc/include/asm/io-defs.h:49:1: warning: performing =
pointer arithmetic on a null pointer has undefined behavior =
[-Wnull-pointer-arithmetic]<br class=3D""> =
&nbsp;&nbsp;DEF_PCI_AC_NORET(outsb, (unsigned long p, const void *b, =
unsigned long c),<br class=3D""> =
&nbsp;&nbsp;^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~<br class=3D""> =
&nbsp;&nbsp;arch/powerpc/include/asm/io.h:601:3: note: expanded from =
macro 'DEF_PCI_AC_NORET'<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;__do_##name al; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;^~~~~~~~~~~~~~<br class=3D""> =
&nbsp;&nbsp;&lt;scratch space&gt;:225:1: note: expanded from here<br =
class=3D""> &nbsp;&nbsp;__do_outsb<br class=3D""> &nbsp;&nbsp;^<br =
class=3D""> &nbsp;&nbsp;arch/powerpc/include/asm/io.h:544:58: note: =
expanded from macro '__do_outsb'<br class=3D""> &nbsp;&nbsp;#define =
__do_outsb(p, b, n) =
&nbsp;&nbsp;&nbsp;&nbsp;writesb((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))<br =
class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;~~~~~~~~~~~~~~~~~~~~~^<br class=3D""> =
&nbsp;&nbsp;In file included from arch/powerpc/perf/perf_regs.c:10:<br =
class=3D""> &nbsp;&nbsp;In file included from =
include/linux/perf_event.h:57:<br class=3D""> &nbsp;&nbsp;In file =
included from include/linux/cgroup.h:26:<br class=3D""> &nbsp;&nbsp;In =
file included from include/linux/kernel_stat.h:9:<br class=3D""> =
&nbsp;&nbsp;In file included from include/linux/interrupt.h:11:<br =
class=3D""> &nbsp;&nbsp;In file included from =
include/linux/hardirq.h:10:<br class=3D""> &nbsp;&nbsp;In file included =
from arch/powerpc/include/asm/hardirq.h:6:<br class=3D""> &nbsp;&nbsp;In =
file included from include/linux/irq.h:20:<br class=3D""> &nbsp;&nbsp;In =
file included from include/linux/io.h:13:<br class=3D""> &nbsp;&nbsp;In =
file included from arch/powerpc/include/asm/io.h:604:<br class=3D""> =
&nbsp;&nbsp;arch/powerpc/include/asm/io-defs.h:51:1: warning: performing =
pointer arithmetic on a null pointer has undefined behavior =
[-Wnull-pointer-arithmetic]<br class=3D""> =
&nbsp;&nbsp;DEF_PCI_AC_NORET(outsw, (unsigned long p, const void *b, =
unsigned long c),<br class=3D""> =
&nbsp;&nbsp;^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~<br class=3D""> =
&nbsp;&nbsp;arch/powerpc/include/asm/io.h:601:3: note: expanded from =
macro 'DEF_PCI_AC_NORET'<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;__do_##name al; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;^~~~~~~~~~~~~~<br class=3D""> =
&nbsp;&nbsp;&lt;scratch space&gt;:227:1: note: expanded from here<br =
class=3D""> &nbsp;&nbsp;__do_outsw<br class=3D""> &nbsp;&nbsp;^<br =
class=3D""> &nbsp;&nbsp;arch/powerpc/include/asm/io.h:545:58: note: =
expanded from macro '__do_outsw'<br class=3D""> &nbsp;&nbsp;#define =
__do_outsw(p, b, n) =
&nbsp;&nbsp;&nbsp;&nbsp;writesw((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))<br =
class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;~~~~~~~~~~~~~~~~~~~~~^<br class=3D""> =
&nbsp;&nbsp;In file included from arch/powerpc/perf/perf_regs.c:10:<br =
class=3D""> &nbsp;&nbsp;In file included from =
include/linux/perf_event.h:57:<br class=3D""> &nbsp;&nbsp;In file =
included from include/linux/cgroup.h:26:<br class=3D""> &nbsp;&nbsp;In =
file included from include/linux/kernel_stat.h:9:<br class=3D""> =
&nbsp;&nbsp;In file included from include/linux/interrupt.h:11:<br =
class=3D""> &nbsp;&nbsp;In file included from =
include/linux/hardirq.h:10:<br class=3D""> &nbsp;&nbsp;In file included =
from arch/powerpc/include/asm/hardirq.h:6:<br class=3D""> &nbsp;&nbsp;In =
file included from include/linux/irq.h:20:<br class=3D""> &nbsp;&nbsp;In =
file included from include/linux/io.h:13:<br class=3D""> &nbsp;&nbsp;In =
file included from arch/powerpc/include/asm/io.h:604:<br class=3D""> =
&nbsp;&nbsp;arch/powerpc/include/asm/io-defs.h:53:1: warning: performing =
pointer arithmetic on a null pointer has undefined behavior =
[-Wnull-pointer-arithmetic]<br class=3D""> =
&nbsp;&nbsp;DEF_PCI_AC_NORET(outsl, (unsigned long p, const void *b, =
unsigned long c),<br class=3D""> =
&nbsp;&nbsp;^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~<br class=3D""> =
&nbsp;&nbsp;arch/powerpc/include/asm/io.h:601:3: note: expanded from =
macro 'DEF_PCI_AC_NORET'<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;__do_##name al; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;^~~~~~~~~~~~~~<br class=3D""> =
&nbsp;&nbsp;&lt;scratch space&gt;:229:1: note: expanded from here<br =
class=3D""> &nbsp;&nbsp;__do_outsl<br class=3D""> &nbsp;&nbsp;^<br =
class=3D""> &nbsp;&nbsp;arch/powerpc/include/asm/io.h:546:58: note: =
expanded from macro '__do_outsl'<br class=3D""> &nbsp;&nbsp;#define =
__do_outsl(p, b, n) =
&nbsp;&nbsp;&nbsp;&nbsp;writesl((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))<br =
class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;~~~~~~~~~~~~~~~~~~~~~^<br =
class=3D""><blockquote type=3D"cite" class=3D""><blockquote type=3D"cite" =
class=3D"">arch/powerpc/perf/perf_regs.c:16:5: error: expected =
identifier or '('<br class=3D""></blockquote></blockquote> =
&nbsp;&nbsp;u64 PERF_REG_EXTENDED_MASK;<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;^<br class=3D""> =
&nbsp;&nbsp;include/linux/perf_regs.h:16:32: note: expanded from macro =
'PERF_REG_EXTENDED_MASK'<br class=3D""> &nbsp;&nbsp;#define =
PERF_REG_EXTENDED_MASK &nbsp;0<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;^<br class=3D""> =
&nbsp;&nbsp;12 warnings and 1 error generated.<br class=3D""><br =
class=3D"">vim +16 arch/powerpc/perf/perf_regs.c<br class=3D""><br =
class=3D""> &nbsp;&nbsp;&nbsp;15<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><br class=3D""><blockquote =
type=3D"cite" class=3D"">16<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>u64 PERF_REG_EXTENDED_MASK;<br =
class=3D""></blockquote> &nbsp;&nbsp;&nbsp;17<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><br =
class=3D""></div></div></blockquote><div><br =
class=3D""></div><div>Hi,</div><div><br class=3D""></div><div><span =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" class=3D"">This =
patch defines&nbsp;</span>PERF_REG_EXTENDED_MASK</div><div>in =
arch/powerpc/include/asm/perf_event_server.h and this header file is =
included conditionally based on</div><div>CONFIG_PPC_PERF_CTRS in =
arch/powerpc/include/asm/perf_event.h.</div><div><div>So build breaks =
happens with config having&nbsp;<span style=3D"caret-color: rgb(0, 0, =
0); color: rgb(0, 0, 0);" class=3D"">CONFIG_PERF_EVENTS =
set</span></div><div><font color=3D"#000000" class=3D"">and =
without&nbsp;</font><span style=3D"caret-color: rgb(0, 0, 0); color: =
rgb(0, 0, 0);" =
class=3D"">CONFIG_PPC_PERF_CTRS.&nbsp;</span></div><div><span =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" class=3D""><br =
class=3D""></span></div><div><span style=3D"caret-color: rgb(0, 0, 0); =
color: rgb(0, 0, 0);" class=3D"">This will be fixed by =
defining&nbsp;</span><span style=3D"caret-color: rgb(0, 0, 0); color: =
rgb(0, 0, 0);" class=3D"">PERF_REG_EXTENDED_MASK in&nbsp;</span><span =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" =
class=3D"">perf_event.h as below:</span></div><div><span =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" class=3D""><br =
class=3D""></span></div><div><font color=3D"#000000" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0);" =
class=3D"">=E2=80=94</span></font></div><div><div style=3D"margin: 0px; =
font-stretch: normal; line-height: normal; font-family: &quot;Helvetica =
Neue&quot;;" class=3D"">diff --git =
a/arch/powerpc/include/asm/perf_event.h =
b/arch/powerpc/include/asm/perf_event.h</div><div style=3D"margin: 0px; =
font-stretch: normal; line-height: normal; font-family: &quot;Helvetica =
Neue&quot;;" class=3D"">index eed3954082fa..b1c3a91aa6fa =
100644</div><div style=3D"margin: 0px; font-stretch: normal; =
line-height: normal; font-family: &quot;Helvetica Neue&quot;;" =
class=3D"">--- a/arch/powerpc/include/asm/perf_event.h</div><div =
style=3D"margin: 0px; font-stretch: normal; line-height: normal; =
font-family: &quot;Helvetica Neue&quot;;" class=3D"">+++ =
b/arch/powerpc/include/asm/perf_event.h</div><div style=3D"margin: 0px; =
font-stretch: normal; line-height: normal; font-family: &quot;Helvetica =
Neue&quot;;" class=3D"">@@ -38,4 +38,6 @@</div><p style=3D"margin: 0px; =
font-stretch: normal; line-height: normal; font-family: &quot;Helvetica =
Neue&quot;; min-height: 14px;" class=3D"">&nbsp;<br =
class=3D"webkit-block-placeholder"></p><div style=3D"margin: 0px; =
font-stretch: normal; line-height: normal; font-family: &quot;Helvetica =
Neue&quot;;" class=3D"">&nbsp;/* To support perf_regs sier update =
*/</div><div style=3D"margin: 0px; font-stretch: normal; line-height: =
normal; font-family: &quot;Helvetica Neue&quot;;" class=3D"">&nbsp;extern =
bool is_sier_available(void);</div><div style=3D"margin: 0px; =
font-stretch: normal; line-height: normal; font-family: &quot;Helvetica =
Neue&quot;;" class=3D"">+extern u64 PERF_REG_EXTENDED_MASK;</div><div =
style=3D"margin: 0px; font-stretch: normal; line-height: normal; =
font-family: &quot;Helvetica Neue&quot;;" class=3D"">+#define =
PERF_REG_EXTENDED_MASK<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>PERF_REG_EXTENDED_MASK</div><div =
style=3D"margin: 0px; font-stretch: normal; line-height: normal; =
font-family: &quot;Helvetica Neue&quot;;" =
class=3D"">&nbsp;#endif</div><div style=3D"margin: 0px; font-stretch: =
normal; line-height: normal; font-family: &quot;Helvetica Neue&quot;;" =
class=3D"">diff --git a/arch/powerpc/include/asm/perf_event_server.h =
b/arch/powerpc/include/asm/perf_event_server.h</div><div style=3D"margin: =
0px; font-stretch: normal; line-height: normal; font-family: =
&quot;Helvetica Neue&quot;;" class=3D"">index bf85d1a0b59e..5d368e81445f =
100644</div><div style=3D"margin: 0px; font-stretch: normal; =
line-height: normal; font-family: &quot;Helvetica Neue&quot;;" =
class=3D"">--- a/arch/powerpc/include/asm/perf_event_server.h</div><div =
style=3D"margin: 0px; font-stretch: normal; line-height: normal; =
font-family: &quot;Helvetica Neue&quot;;" class=3D"">+++ =
b/arch/powerpc/include/asm/perf_event_server.h</div><div style=3D"margin: =
0px; font-stretch: normal; line-height: normal; font-family: =
&quot;Helvetica Neue&quot;;" class=3D"">@@ -15,9 +15,6 @@</div><div =
style=3D"margin: 0px; font-stretch: normal; line-height: normal; =
font-family: &quot;Helvetica Neue&quot;;" class=3D"">&nbsp;#define =
MAX_EVENT_ALTERNATIVES<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>8</div><div style=3D"margin: 0px; =
font-stretch: normal; line-height: normal; font-family: &quot;Helvetica =
Neue&quot;;" class=3D"">&nbsp;#define MAX_LIMITED_HWCOUNTERS<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>2</div><p =
style=3D"margin: 0px; font-stretch: normal; line-height: normal; =
font-family: &quot;Helvetica Neue&quot;; min-height: 14px;" =
class=3D"">&nbsp;<br class=3D"webkit-block-placeholder"></p><div =
style=3D"margin: 0px; font-stretch: normal; line-height: normal; =
font-family: &quot;Helvetica Neue&quot;;" class=3D"">-extern u64 =
PERF_REG_EXTENDED_MASK;</div><div style=3D"margin: 0px; font-stretch: =
normal; line-height: normal; font-family: &quot;Helvetica Neue&quot;;" =
class=3D"">-#define PERF_REG_EXTENDED_MASK<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>PERF_REG_EXTENDED_MASK</div><div =
style=3D"margin: 0px; font-stretch: normal; line-height: normal; =
font-family: &quot;Helvetica Neue&quot;;" class=3D"">-</div><div =
style=3D"margin: 0px; font-stretch: normal; line-height: normal; =
font-family: &quot;Helvetica Neue&quot;;" class=3D"">&nbsp;struct =
perf_event;</div><p style=3D"margin: 0px; font-stretch: normal; =
line-height: normal; font-family: &quot;Helvetica Neue&quot;; =
min-height: 14px;" class=3D"">&nbsp;<br =
class=3D"webkit-block-placeholder"></p><div style=3D"margin: 0px; =
font-stretch: normal; line-height: normal; font-family: &quot;Helvetica =
Neue&quot;;" class=3D"">&nbsp;struct mmcr_regs {</div><div =
style=3D"margin: 0px; font-stretch: normal; line-height: normal; =
font-family: &quot;Helvetica Neue&quot;;" class=3D"">=E2=80=94</div><div =
style=3D"margin: 0px; font-stretch: normal; line-height: normal; =
font-family: &quot;Helvetica Neue&quot;;" class=3D""><br =
class=3D""></div></div><div><span style=3D"caret-color: rgb(0, 0, 0); =
color: rgb(0, 0, 0);" class=3D"">We also need this patch by Madhavan =
Sirinivasan :&nbsp;</span><font color=3D"#000000" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0);" class=3D""><a =
href=3D"https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=3D1=
83203" =
class=3D"">https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=3D=
183203</a></span></font></div><div><font color=3D"#000000" class=3D"">to =
solve similar build break with =
`is_sier_available`</font></div></div><div><br =
class=3D""></div><div>Thanks</div><div>Athira&nbsp;</div><br =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D""><div =
class=3D""><br class=3D"">---<br class=3D"">0-DAY CI Kernel Test =
Service, Intel Corporation<br class=3D""><a =
href=3D"https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org" =
class=3D"">https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org</a=
><br class=3D""><span =
id=3D"cid:61136650-2C38-4F4C-81B9-B38529B45A87">&lt;.config.gz&gt;</span><=
/div></div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_A5551C5C-F653-4A8F-8DFB-D9ACF0D5F7B6--

