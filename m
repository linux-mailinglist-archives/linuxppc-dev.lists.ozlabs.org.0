Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4943310986D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2019 06:00:54 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47MWv73R0QzDqfP
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2019 16:00:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=in.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nasastry@in.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=in.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47MWm334SvzDq62
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Nov 2019 15:54:39 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAQ4pwcK068595
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Nov 2019 23:54:36 -0500
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.66])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2wfju8x8hg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Nov 2019 23:54:36 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <linuxppc-dev@lists.ozlabs.org> from <nasastry@in.ibm.com>;
 Tue, 26 Nov 2019 04:54:35 -0000
Received: from us1a3-smtp05.a3.dal06.isc4sb.com (10.146.71.159)
 by smtp.notes.na.collabserv.com (10.106.227.127) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 26 Nov 2019 04:54:30 -0000
Received: from us1a3-mail120.a3.dal06.isc4sb.com ([10.146.45.191])
 by us1a3-smtp05.a3.dal06.isc4sb.com
 with ESMTP id 2019112604542993-35025 ;
 Tue, 26 Nov 2019 04:54:29 +0000 
MIME-Version: 1.0
In-Reply-To: <20191113161056.7414-1-kjain@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
From: "Nageswara R Sastry" <nasastry@in.ibm.com>
Date: Tue, 26 Nov 2019 10:24:28 +0530
References: <20191113161056.7414-1-kjain@linux.ibm.com>
X-KeepSent: 147E2CDC:A7D91487-652584BE:001A8A96;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Build V1001FP3_08092019 August 09, 2019
X-LLNOutbound: False
X-Disclaimed: 59867
X-TNEFEvaluated: 1
Content-type: multipart/alternative; 
 Boundary="0__=EABB0E2DDF890C068f9e8a93df938690918cEABB0E2DDF890C06"
Content-Disposition: inline
x-cbid: 19112604-4409-0000-0000-00000140E17B
X-IBM-SpamModules-Scores: BY=0.227026; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.417846; ST=0; TS=0; UL=0; ISC=; MB=0.011813
X-IBM-SpamModules-Versions: BY=3.00012168; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000292; SDB=6.01295517; UDB=6.00687540; IPR=6.01077760; 
 MB=3.00029711; MTD=3.00000008; XFM=3.00000015; UTC=2019-11-26 04:54:35
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2019-11-26 02:52:45 - 6.00010694
x-cbparentid: 19112604-4410-0000-0000-00003D292215
Message-Id: <OF147E2CDC.A7D91487-ON652584BE.001A8A96-652584BE.001AF5B1@notes.na.collabserv.com>
Subject: Re: [PATCH v2] powerpc/kernel/sysfs: Add PMU_SYSFS config option to
 enable PMU SPRs sysfs file creation
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-25_06:2019-11-21,2019-11-25 signatures=0
X-Proofpoint-Spam-Reason: safe
X-Mailman-Approved-At: Tue, 26 Nov 2019 15:59:02 +1100
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
Cc: kjain@linux.ibm.com, anju@linux.vnet.ibm.com, maddy@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--0__=EABB0E2DDF890C068f9e8a93df938690918cEABB0E2DDF890C06
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII


Kajol Jain <kjain@linux.ibm.com> wrote on 13/11/2019 09:40:56 PM:

> From: Kajol Jain <kjain@linux.ibm.com>
> To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
> Cc: kjain@linux.ibm.com, anju@linux.vnet.ibm.com,
maddy@linux.vnet.ibm.com
> Date: 26/11/2019 10:16 AM
> Subject: [EXTERNAL] [PATCH v2] powerpc/kernel/sysfs: Add PMU=5FSYSFS
> config option to enable PMU SPRs sysfs file creation
>
> Many of the performance moniroting unit (PMU) SPRs are
> exposed in the sysfs. "perf" API is the primary interface to program
> PMU and collect counter data in the system. So expose these
> PMU SPRs in the absence of CONFIG=5FPERF=5FEVENTS.
>
> Patch adds a new CONFIG option 'CONFIG=5FPMU=5FSYSFS'. The new config
> option used in kernel/sysfs.c for PMU SPRs sysfs file creation and
> this new option is enabled only if 'CONFIG=5FPERF=5FEVENTS' option is
> disabled.
>
> Tested this patch with enable/disable CONFIG=5FPERF=5FEVENTS option
> in powernv and pseries machines.
> Also did compilation testing for different architecture include:
> x86, mips, mips64, alpha, arm. And with book3s=5F32.config option.
>
> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
> ---
>  arch/powerpc/kernel/sysfs.c            | 21 +++++++++++++++++++++
>  arch/powerpc/platforms/Kconfig.cputype |  8 ++++++++
>  2 files changed, 29 insertions(+)

Tested-by: Nageswara R Sastry <nasastry@in.ibm.com>
Tested using the following different scenarios:
1. CONFIG=5FPERF=5FEVENT - enabled, CONFIG=5FPMU=5FSYSFS - disabled,
RESULT: not seen any sysfs files(mmrc*, pmc*)
from /sys/bus/cpu/devices/cpu?/
2. CONFIG=5FPERF=5FEVENT - disabled, CONFIG=5FPMU=5FSYSFS - enabled,
RESULT: seen any sysfs files(mmrc*, pmc*) from /sys/bus/cpu/devices/cpu?/
3. CONFIG=5FPERF=5FEVENT -disabled, CONFIG=5FPMU=5FSYSFS - disabled,
RESULT: not possible, any one of the config options need to be enabled.
4. CONFIG=5FPERF=5FEVENT -enabled, CONFIG=5FPMU=5FSYSFS - enabled,
RESULT: not possible, any one of the config options need to be enabled.

>
> ---
> Changelog:
> v1 -> v2
> - Added new config option 'PMU=5FSYSFS' for PMU SPR's creation
>   rather than using PERF=5FEVENTS config option directly and make
>   sure SPR's file creation only if 'CONFIG=5FPERF=5FEVENTS' disabled.
> ---
> diff --git a/arch/powerpc/kernel/sysfs.c b/arch/powerpc/kernel/sysfs.c
> index 80a676da11cb..b7c01f1ef236 100644
> --- a/arch/powerpc/kernel/sysfs.c
> +++ b/arch/powerpc/kernel/sysfs.c
> @@ -457,16 +457,21 @@ static ssize=5Ft =5F=5Fused \
>
>  #if defined(CONFIG=5FPPC64)
>  #define HAS=5FPPC=5FPMC=5FCLASSIC   1
> +#ifdef CONFIG=5FPMU=5FSYSFS
>  #define HAS=5FPPC=5FPMC=5FIBM      1
> +#endif
>  #define HAS=5FPPC=5FPMC=5FPA6T   1
>  #elif defined(CONFIG=5FPPC=5FBOOK3S=5F32)
>  #define HAS=5FPPC=5FPMC=5FCLASSIC   1
> +#ifdef CONFIG=5FPMU=5FSYSFS
>  #define HAS=5FPPC=5FPMC=5FIBM      1
>  #define HAS=5FPPC=5FPMC=5FG4      1
>  #endif
> +#endif
>
>
>  #ifdef HAS=5FPPC=5FPMC=5FCLASSIC
> +#ifdef CONFIG=5FPMU=5FSYSFS
>  SYSFS=5FPMCSETUP(mmcr0, SPRN=5FMMCR0);
>  SYSFS=5FPMCSETUP(mmcr1, SPRN=5FMMCR1);
>  SYSFS=5FPMCSETUP(pmc1, SPRN=5FPMC1);
> @@ -485,6 +490,10 @@ SYSFS=5FPMCSETUP(pmc7, SPRN=5FPMC7);
>  SYSFS=5FPMCSETUP(pmc8, SPRN=5FPMC8);
>
>  SYSFS=5FPMCSETUP(mmcra, SPRN=5FMMCRA);
> +#endif /* CONFIG=5FPPC64 */
> +#endif /* CONFIG=5FPMU=5FSYSFS */
> +
> +#ifdef CONFIG=5FPPC64
>  SYSFS=5FSPRSETUP(purr, SPRN=5FPURR);
>  SYSFS=5FSPRSETUP(spurr, SPRN=5FSPURR);
>  SYSFS=5FSPRSETUP(pir, SPRN=5FPIR);
> @@ -495,7 +504,9 @@ SYSFS=5FSPRSETUP(tscr, SPRN=5FTSCR);
>    enable write when needed with a separate function.
>    Lets be conservative and default to pseries.
>  */
> +#ifdef CONFIG=5FPMU=5FSYSFS
>  static DEVICE=5FATTR(mmcra, 0600, show=5Fmmcra, store=5Fmmcra);
> +#endif /* CONFIG=5FPMU=5FSYSFS */
>  static DEVICE=5FATTR(spurr, 0400, show=5Fspurr, NULL);
>  static DEVICE=5FATTR(purr, 0400, show=5Fpurr, store=5Fpurr);
>  static DEVICE=5FATTR(pir, 0400, show=5Fpir, NULL);
> @@ -606,12 +617,14 @@ static void sysfs=5Fcreate=5Fdscr=5Fdefault(void)
>  #endif /* CONFIG=5FPPC64 */
>
>  #ifdef HAS=5FPPC=5FPMC=5FPA6T
> +#ifdef CONFIG=5FPMU=5FSYSFS
>  SYSFS=5FPMCSETUP(pa6t=5Fpmc0, SPRN=5FPA6T=5FPMC0);
>  SYSFS=5FPMCSETUP(pa6t=5Fpmc1, SPRN=5FPA6T=5FPMC1);
>  SYSFS=5FPMCSETUP(pa6t=5Fpmc2, SPRN=5FPA6T=5FPMC2);
>  SYSFS=5FPMCSETUP(pa6t=5Fpmc3, SPRN=5FPA6T=5FPMC3);
>  SYSFS=5FPMCSETUP(pa6t=5Fpmc4, SPRN=5FPA6T=5FPMC4);
>  SYSFS=5FPMCSETUP(pa6t=5Fpmc5, SPRN=5FPA6T=5FPMC5);
> +#endif /* CONFIG=5FPMU=5FSYSFS */
>  #ifdef CONFIG=5FDEBUG=5FMISC
>  SYSFS=5FSPRSETUP(hid0, SPRN=5FHID0);
>  SYSFS=5FSPRSETUP(hid1, SPRN=5FHID1);
> @@ -644,6 +657,7 @@ SYSFS=5FSPRSETUP(tsr3, SPRN=5FPA6T=5FTSR3);
>  #endif /* CONFIG=5FDEBUG=5FMISC */
>  #endif /* HAS=5FPPC=5FPMC=5FPA6T */
>
> +#ifdef CONFIG=5FPMU=5FSYSFS
>  #ifdef HAS=5FPPC=5FPMC=5FIBM
>  static struct device=5Fattribute ibm=5Fcommon=5Fattrs[] =3D {
>     =5F=5FATTR(mmcr0, 0600, show=5Fmmcr0, store=5Fmmcr0),
> @@ -671,9 +685,11 @@ static struct device=5Fattribute classic=5Fpmc=5Fatt=
rs[] =3D
{
>     =5F=5FATTR(pmc8, 0600, show=5Fpmc8, store=5Fpmc8),
>  #endif
>  };
> +#endif /* CONFIG=5FPMU=5FSYSFS */
>
>  #ifdef HAS=5FPPC=5FPMC=5FPA6T
>  static struct device=5Fattribute pa6t=5Fattrs[] =3D {
> +#ifdef CONFIG=5FPMU=5FSYSFS
>     =5F=5FATTR(mmcr0, 0600, show=5Fmmcr0, store=5Fmmcr0),
>     =5F=5FATTR(mmcr1, 0600, show=5Fmmcr1, store=5Fmmcr1),
>     =5F=5FATTR(pmc0, 0600, show=5Fpa6t=5Fpmc0, store=5Fpa6t=5Fpmc0),
> @@ -682,6 +698,7 @@ static struct device=5Fattribute pa6t=5Fattrs[] =3D {
>     =5F=5FATTR(pmc3, 0600, show=5Fpa6t=5Fpmc3, store=5Fpa6t=5Fpmc3),
>     =5F=5FATTR(pmc4, 0600, show=5Fpa6t=5Fpmc4, store=5Fpa6t=5Fpmc4),
>     =5F=5FATTR(pmc5, 0600, show=5Fpa6t=5Fpmc5, store=5Fpa6t=5Fpmc5),
> +#endif /* CONFIG=5FPMU=5FSYSFS */
>  #ifdef CONFIG=5FDEBUG=5FMISC
>     =5F=5FATTR(hid0, 0600, show=5Fhid0, store=5Fhid0),
>     =5F=5FATTR(hid1, 0600, show=5Fhid1, store=5Fhid1),
> @@ -787,8 +804,10 @@ static int register=5Fcpu=5Fonline(unsigned int cpu)
>           device=5Fcreate=5Ffile(s, &pmc=5Fattrs[i]);
>
>  #ifdef CONFIG=5FPPC64
> +#ifdef CONFIG=5FPMU=5FSYSFS
>     if (cpu=5Fhas=5Ffeature(CPU=5FFTR=5FMMCRA))
>        device=5Fcreate=5Ffile(s, &dev=5Fattr=5Fmmcra);
> +#endif /* CONFIG=5FPMU=5FSYSFS */
>
>     if (cpu=5Fhas=5Ffeature(CPU=5FFTR=5FPURR)) {
>        if (!firmware=5Fhas=5Ffeature(FW=5FFEATURE=5FLPAR))
> @@ -876,8 +895,10 @@ static int unregister=5Fcpu=5Fonline(unsigned int cp=
u)
>           device=5Fremove=5Ffile(s, &pmc=5Fattrs[i]);
>
>  #ifdef CONFIG=5FPPC64
> +#ifdef CONFIG=5FPMU=5FSYSFS
>     if (cpu=5Fhas=5Ffeature(CPU=5FFTR=5FMMCRA))
>        device=5Fremove=5Ffile(s, &dev=5Fattr=5Fmmcra);
> +#endif /* CONFIG=5FPMU=5FSYSFS */
>
>     if (cpu=5Fhas=5Ffeature(CPU=5FFTR=5FPURR))
>        device=5Fremove=5Ffile(s, &dev=5Fattr=5Fpurr);
> diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/
> platforms/Kconfig.cputype
> index 12543e53fa96..f3ad579c559f 100644
> --- a/arch/powerpc/platforms/Kconfig.cputype
> +++ b/arch/powerpc/platforms/Kconfig.cputype
> @@ -417,6 +417,14 @@ config PPC=5FMM=5FSLICES
>  config PPC=5FHAVE=5FPMU=5FSUPPORT
>         bool
>
> +config PMU=5FSYSFS
> +   bool
> +   default y if !PERF=5FEVENTS
> +   help
> +     This option enables PMU SPR sysfs file creation. Since PMU SPRs are
> +     intended to be used via "perf" interface, config option is enabled
> +     only when CONFIG=5FPERF=5FEVENTS is disabled.
> +
>  config PPC=5FPERF=5FCTRS
>         def=5Fbool y
>         depends on PERF=5FEVENTS && PPC=5FHAVE=5FPMU=5FSUPPORT
> --
> 2.12.3
>

--0__=EABB0E2DDF890C068f9e8a93df938690918cEABB0E2DDF890C06
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p><tt><font size=3D"2">Kajol Jain &lt;kjain@linux.ibm.com&gt; =
wrote on 13/11/2019 09:40:56 PM:<br><br>&gt; From: Kajol Jain &lt;kjain@lin=
ux.ibm.com&gt;</font></tt><br><tt><font size=3D"2">&gt; To: linuxppc-dev@li=
sts.ozlabs.org, mpe@ellerman.id.au</font></tt><br><tt><font size=3D"2">&gt;=
 Cc: kjain@linux.ibm.com, anju@linux.vnet.ibm.com, maddy@linux.vnet.ibm.com=
</font></tt><br><tt><font size=3D"2">&gt; Date: 26/11/2019 10:16 AM</font><=
/tt><br><tt><font size=3D"2">&gt; Subject: [EXTERNAL] [PATCH v2] powerpc/ke=
rnel/sysfs: Add PMU=5FSYSFS <br>&gt; config option to enable PMU SPRs sysfs=
 file creation</font></tt><br><tt><font size=3D"2">&gt; <br>&gt; Many of th=
e performance moniroting unit (PMU) SPRs are<br>&gt; exposed in the sysfs. =
&quot;perf&quot; API is the primary interface to program<br>&gt; PMU and co=
llect counter data in the system. So expose these<br>&gt; PMU SPRs in the a=
bsence of CONFIG=5FPERF=5FEVENTS.<br>&gt; <br>&gt; Patch adds a new CONFIG =
option 'CONFIG=5FPMU=5FSYSFS'. The new config<br>&gt; option used in kernel=
/sysfs.c for PMU SPRs sysfs file creation and<br>&gt; this new option is en=
abled only if 'CONFIG=5FPERF=5FEVENTS' option is<br>&gt; disabled.<br>&gt; =
<br>&gt; Tested this patch with enable/disable CONFIG=5FPERF=5FEVENTS optio=
n<br>&gt; in powernv and pseries machines.<br>&gt; Also did compilation tes=
ting for different architecture include:<br>&gt; x86, mips, mips64, alpha, =
arm. And with book3s=5F32.config option.<br>&gt; <br>&gt; Signed-off-by: Ka=
jol Jain &lt;kjain@linux.ibm.com&gt;<br>&gt; ---<br>&gt; &nbsp;arch/powerpc=
/kernel/sysfs.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| 21 +++++++++++++=
++++++++<br>&gt; &nbsp;arch/powerpc/platforms/Kconfig.cputype | &nbsp;8 +++=
+++++<br>&gt; &nbsp;2 files changed, 29 insertions(+)<br></font></tt><br><t=
t><font size=3D"2">Tested-by: Nageswara R Sastry &lt;nasastry@in.ibm.com&gt=
;</font></tt><br><tt><font size=3D"2" color=3D"#1D1C1D">Tested using the fo=
llowing different scenarios:<br>1. CONFIG=5FPERF=5FEVENT - enabled, CONFIG=
=5FPMU=5FSYSFS - disabled,</font></tt><br><tt><font size=3D"2" color=3D"#1D=
1C1D">RESULT: not seen any sysfs files(mmrc*, pmc*) from /sys/bus/cpu/devic=
es/cpu?/<br>2. CONFIG=5FPERF=5FEVENT - disabled, CONFIG=5FPMU=5FSYSFS - ena=
bled,</font></tt><br><tt><font size=3D"2" color=3D"#1D1C1D">RESULT: seen an=
y sysfs files(mmrc*, pmc*) from /sys/bus/cpu/devices/cpu?/<br>3. CONFIG=5FP=
ERF=5FEVENT -disabled, CONFIG=5FPMU=5FSYSFS - disabled,</font></tt><br><tt>=
<font size=3D"2" color=3D"#1D1C1D">RESULT: not possible, any one of the con=
fig options need to be enabled.<br>4. CONFIG=5FPERF=5FEVENT -enabled, CONFI=
G=5FPMU=5FSYSFS - enabled,</font></tt><br><tt><font size=3D"2" color=3D"#1D=
1C1D">RESULT: not possible, any one of the config options need to be enable=
d.</font></tt><br><br><tt><font size=3D"2">&gt; <br>&gt; ---<br>&gt; Change=
log:<br>&gt; v1 -&gt; v2<br>&gt; - Added new config option 'PMU=5FSYSFS' fo=
r PMU SPR's creation<br>&gt; &nbsp; rather than using PERF=5FEVENTS config =
option directly and make<br>&gt; &nbsp; sure SPR's file creation only if 'C=
ONFIG=5FPERF=5FEVENTS' disabled.<br>&gt; ---<br>&gt; diff --git a/arch/powe=
rpc/kernel/sysfs.c b/arch/powerpc/kernel/sysfs.c<br>&gt; index 80a676da11cb=
..b7c01f1ef236 100644<br>&gt; --- a/arch/powerpc/kernel/sysfs.c<br>&gt; +++=
 b/arch/powerpc/kernel/sysfs.c<br>&gt; @@ -457,16 +457,21 @@ static ssize=
=5Ft =5F=5Fused \<br>&gt; &nbsp;<br>&gt; &nbsp;#if defined(CONFIG=5FPPC64)<=
br>&gt; &nbsp;#define HAS=5FPPC=5FPMC=5FCLASSIC &nbsp; 1<br>&gt; +#ifdef CO=
NFIG=5FPMU=5FSYSFS<br>&gt; &nbsp;#define HAS=5FPPC=5FPMC=5FIBM &nbsp; &nbsp=
; &nbsp;1<br>&gt; +#endif<br>&gt; &nbsp;#define HAS=5FPPC=5FPMC=5FPA6T &nbs=
p; 1<br>&gt; &nbsp;#elif defined(CONFIG=5FPPC=5FBOOK3S=5F32)<br>&gt; &nbsp;=
#define HAS=5FPPC=5FPMC=5FCLASSIC &nbsp; 1<br>&gt; +#ifdef CONFIG=5FPMU=5FS=
YSFS<br>&gt; &nbsp;#define HAS=5FPPC=5FPMC=5FIBM &nbsp; &nbsp; &nbsp;1<br>&=
gt; &nbsp;#define HAS=5FPPC=5FPMC=5FG4 &nbsp; &nbsp; &nbsp;1<br>&gt; &nbsp;=
#endif<br>&gt; +#endif<br>&gt; &nbsp;<br>&gt; &nbsp;<br>&gt; &nbsp;#ifdef H=
AS=5FPPC=5FPMC=5FCLASSIC<br>&gt; +#ifdef CONFIG=5FPMU=5FSYSFS<br>&gt; &nbsp=
;SYSFS=5FPMCSETUP(mmcr0, SPRN=5FMMCR0);<br>&gt; &nbsp;SYSFS=5FPMCSETUP(mmcr=
1, SPRN=5FMMCR1);<br>&gt; &nbsp;SYSFS=5FPMCSETUP(pmc1, SPRN=5FPMC1);<br>&gt=
; @@ -485,6 +490,10 @@ SYSFS=5FPMCSETUP(pmc7, SPRN=5FPMC7);<br>&gt; &nbsp;S=
YSFS=5FPMCSETUP(pmc8, SPRN=5FPMC8);<br>&gt; &nbsp;<br>&gt; &nbsp;SYSFS=5FPM=
CSETUP(mmcra, SPRN=5FMMCRA);<br>&gt; +#endif /* CONFIG=5FPPC64 */<br>&gt; +=
#endif /* CONFIG=5FPMU=5FSYSFS */<br>&gt; +<br>&gt; +#ifdef CONFIG=5FPPC64<=
br>&gt; &nbsp;SYSFS=5FSPRSETUP(purr, SPRN=5FPURR);<br>&gt; &nbsp;SYSFS=5FSP=
RSETUP(spurr, SPRN=5FSPURR);<br>&gt; &nbsp;SYSFS=5FSPRSETUP(pir, SPRN=5FPIR=
);<br>&gt; @@ -495,7 +504,9 @@ SYSFS=5FSPRSETUP(tscr, SPRN=5FTSCR);<br>&gt;=
 &nbsp; &nbsp;enable write when needed with a separate function.<br>&gt; &n=
bsp; &nbsp;Lets be conservative and default to pseries.<br>&gt; &nbsp;*/<br=
>&gt; +#ifdef CONFIG=5FPMU=5FSYSFS<br>&gt; &nbsp;static DEVICE=5FATTR(mmcra=
, 0600, show=5Fmmcra, store=5Fmmcra);<br>&gt; +#endif /* CONFIG=5FPMU=5FSYS=
FS */<br>&gt; &nbsp;static DEVICE=5FATTR(spurr, 0400, show=5Fspurr, NULL);<=
br>&gt; &nbsp;static DEVICE=5FATTR(purr, 0400, show=5Fpurr, store=5Fpurr);<=
br>&gt; &nbsp;static DEVICE=5FATTR(pir, 0400, show=5Fpir, NULL);<br>&gt; @@=
 -606,12 +617,14 @@ static void sysfs=5Fcreate=5Fdscr=5Fdefault(void)<br>&g=
t; &nbsp;#endif /* CONFIG=5FPPC64 */<br>&gt; &nbsp;<br>&gt; &nbsp;#ifdef HA=
S=5FPPC=5FPMC=5FPA6T<br>&gt; +#ifdef CONFIG=5FPMU=5FSYSFS<br>&gt; &nbsp;SYS=
FS=5FPMCSETUP(pa6t=5Fpmc0, SPRN=5FPA6T=5FPMC0);<br>&gt; &nbsp;SYSFS=5FPMCSE=
TUP(pa6t=5Fpmc1, SPRN=5FPA6T=5FPMC1);<br>&gt; &nbsp;SYSFS=5FPMCSETUP(pa6t=
=5Fpmc2, SPRN=5FPA6T=5FPMC2);<br>&gt; &nbsp;SYSFS=5FPMCSETUP(pa6t=5Fpmc3, S=
PRN=5FPA6T=5FPMC3);<br>&gt; &nbsp;SYSFS=5FPMCSETUP(pa6t=5Fpmc4, SPRN=5FPA6T=
=5FPMC4);<br>&gt; &nbsp;SYSFS=5FPMCSETUP(pa6t=5Fpmc5, SPRN=5FPA6T=5FPMC5);<=
br>&gt; +#endif /* CONFIG=5FPMU=5FSYSFS */<br>&gt; &nbsp;#ifdef CONFIG=5FDE=
BUG=5FMISC<br>&gt; &nbsp;SYSFS=5FSPRSETUP(hid0, SPRN=5FHID0);<br>&gt; &nbsp=
;SYSFS=5FSPRSETUP(hid1, SPRN=5FHID1);<br>&gt; @@ -644,6 +657,7 @@ SYSFS=5FS=
PRSETUP(tsr3, SPRN=5FPA6T=5FTSR3);<br>&gt; &nbsp;#endif /* CONFIG=5FDEBUG=
=5FMISC */<br>&gt; &nbsp;#endif /* HAS=5FPPC=5FPMC=5FPA6T */<br>&gt; &nbsp;=
<br>&gt; +#ifdef CONFIG=5FPMU=5FSYSFS<br>&gt; &nbsp;#ifdef HAS=5FPPC=5FPMC=
=5FIBM<br>&gt; &nbsp;static struct device=5Fattribute ibm=5Fcommon=5Fattrs[=
] =3D {<br>&gt; &nbsp; &nbsp; =5F=5FATTR(mmcr0, 0600, show=5Fmmcr0, store=
=5Fmmcr0),<br>&gt; @@ -671,9 +685,11 @@ static struct device=5Fattribute cl=
assic=5Fpmc=5Fattrs[] =3D {<br>&gt; &nbsp; &nbsp; =5F=5FATTR(pmc8, 0600, sh=
ow=5Fpmc8, store=5Fpmc8),<br>&gt; &nbsp;#endif<br>&gt; &nbsp;};<br>&gt; +#e=
ndif /* CONFIG=5FPMU=5FSYSFS */<br>&gt; &nbsp;<br>&gt; &nbsp;#ifdef HAS=5FP=
PC=5FPMC=5FPA6T<br>&gt; &nbsp;static struct device=5Fattribute pa6t=5Fattrs=
[] =3D {<br>&gt; +#ifdef CONFIG=5FPMU=5FSYSFS<br>&gt; &nbsp; &nbsp; =5F=5FA=
TTR(mmcr0, 0600, show=5Fmmcr0, store=5Fmmcr0),<br>&gt; &nbsp; &nbsp; =5F=5F=
ATTR(mmcr1, 0600, show=5Fmmcr1, store=5Fmmcr1),<br>&gt; &nbsp; &nbsp; =5F=
=5FATTR(pmc0, 0600, show=5Fpa6t=5Fpmc0, store=5Fpa6t=5Fpmc0),<br>&gt; @@ -6=
82,6 +698,7 @@ static struct device=5Fattribute pa6t=5Fattrs[] =3D {<br>&gt=
; &nbsp; &nbsp; =5F=5FATTR(pmc3, 0600, show=5Fpa6t=5Fpmc3, store=5Fpa6t=5Fp=
mc3),<br>&gt; &nbsp; &nbsp; =5F=5FATTR(pmc4, 0600, show=5Fpa6t=5Fpmc4, stor=
e=5Fpa6t=5Fpmc4),<br>&gt; &nbsp; &nbsp; =5F=5FATTR(pmc5, 0600, show=5Fpa6t=
=5Fpmc5, store=5Fpa6t=5Fpmc5),<br>&gt; +#endif /* CONFIG=5FPMU=5FSYSFS */<b=
r>&gt; &nbsp;#ifdef CONFIG=5FDEBUG=5FMISC<br>&gt; &nbsp; &nbsp; =5F=5FATTR(=
hid0, 0600, show=5Fhid0, store=5Fhid0),<br>&gt; &nbsp; &nbsp; =5F=5FATTR(hi=
d1, 0600, show=5Fhid1, store=5Fhid1),<br>&gt; @@ -787,8 +804,10 @@ static i=
nt register=5Fcpu=5Fonline(unsigned int cpu)<br>&gt; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; device=5Fcreate=5Ffile(s, &amp;pmc=5Fattrs[i]);<br>&gt; &nbsp;=
<br>&gt; &nbsp;#ifdef CONFIG=5FPPC64<br>&gt; +#ifdef CONFIG=5FPMU=5FSYSFS<b=
r>&gt; &nbsp; &nbsp; if (cpu=5Fhas=5Ffeature(CPU=5FFTR=5FMMCRA))<br>&gt; &n=
bsp; &nbsp; &nbsp; &nbsp;device=5Fcreate=5Ffile(s, &amp;dev=5Fattr=5Fmmcra)=
;<br>&gt; +#endif /* CONFIG=5FPMU=5FSYSFS */<br>&gt; &nbsp;<br>&gt; &nbsp; =
&nbsp; if (cpu=5Fhas=5Ffeature(CPU=5FFTR=5FPURR)) {<br>&gt; &nbsp; &nbsp; &=
nbsp; &nbsp;if (!firmware=5Fhas=5Ffeature(FW=5FFEATURE=5FLPAR))<br>&gt; @@ =
-876,8 +895,10 @@ static int unregister=5Fcpu=5Fonline(unsigned int cpu)<br=
>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; device=5Fremove=5Ffile(s, &amp;pmc=
=5Fattrs[i]);<br>&gt; &nbsp;<br>&gt; &nbsp;#ifdef CONFIG=5FPPC64<br>&gt; +#=
ifdef CONFIG=5FPMU=5FSYSFS<br>&gt; &nbsp; &nbsp; if (cpu=5Fhas=5Ffeature(CP=
U=5FFTR=5FMMCRA))<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp;device=5Fremove=5Ffile=
(s, &amp;dev=5Fattr=5Fmmcra);<br>&gt; +#endif /* CONFIG=5FPMU=5FSYSFS */<br=
>&gt; &nbsp;<br>&gt; &nbsp; &nbsp; if (cpu=5Fhas=5Ffeature(CPU=5FFTR=5FPURR=
))<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp;device=5Fremove=5Ffile(s, &amp;dev=5F=
attr=5Fpurr);<br>&gt; diff --git a/arch/powerpc/platforms/Kconfig.cputype b=
/arch/powerpc/<br>&gt; platforms/Kconfig.cputype<br>&gt; index 12543e53fa96=
..f3ad579c559f 100644<br>&gt; --- a/arch/powerpc/platforms/Kconfig.cputype<=
br>&gt; +++ b/arch/powerpc/platforms/Kconfig.cputype<br>&gt; @@ -417,6 +417=
,14 @@ config PPC=5FMM=5FSLICES<br>&gt; &nbsp;config PPC=5FHAVE=5FPMU=5FSUP=
PORT<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; bool<br>&gt; &nbsp;<br>&gt; +confi=
g PMU=5FSYSFS<br>&gt; + &nbsp; bool<br>&gt; + &nbsp; default y if !PERF=5FE=
VENTS<br>&gt; + &nbsp; help<br>&gt; + &nbsp; &nbsp; This option enables PMU=
 SPR sysfs file creation. Since PMU SPRs are<br>&gt; + &nbsp; &nbsp; intend=
ed to be used via &quot;perf&quot; interface, config option is enabled<br>&=
gt; + &nbsp; &nbsp; only when CONFIG=5FPERF=5FEVENTS is disabled.<br>&gt; +=
<br>&gt; &nbsp;config PPC=5FPERF=5FCTRS<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp;=
 def=5Fbool y<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; depends on PERF=5FEVENTS =
&amp;&amp; PPC=5FHAVE=5FPMU=5FSUPPORT<br>&gt; -- <br>&gt; 2.12.3<br>&gt; <b=
r></font></tt><BR>
</body></html>

--0__=EABB0E2DDF890C068f9e8a93df938690918cEABB0E2DDF890C06--

