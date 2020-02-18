Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C1929162351
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Feb 2020 10:23:34 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48MFlR1dNKzDqbs
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Feb 2020 20:23:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=in.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nasastry@in.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=in.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48MF4B5XLSzDqX3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Feb 2020 19:52:52 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01I8oEMN061533
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Feb 2020 03:52:49 -0500
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.93])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2y6dp97dvs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Feb 2020 03:52:48 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <linuxppc-dev@lists.ozlabs.org> from <nasastry@in.ibm.com>;
 Tue, 18 Feb 2020 08:52:48 -0000
Received: from us1a3-smtp03.a3.dal06.isc4sb.com (10.106.154.98)
 by smtp.notes.na.collabserv.com (10.106.227.39) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 18 Feb 2020 08:52:43 -0000
Received: from us1a3-mail120.a3.dal06.isc4sb.com ([10.146.45.191])
 by us1a3-smtp03.a3.dal06.isc4sb.com
 with ESMTP id 2020021808524348-221160 ;
 Tue, 18 Feb 2020 08:52:43 +0000 
MIME-Version: 1.0
In-Reply-To: <20200214080606.26872-2-kjain@linux.ibm.com>
Subject: Re: [PATCH 2/2] powerpc/kernel/sysfs: Add new config option PMU_SYSFS
 to enable PMU SPRs sysfs file creation
To: "Kajol Jain" <kjain@linux.ibm.com>
From: "Nageswara R Sastry" <nasastry@in.ibm.com>
Date: Tue, 18 Feb 2020 14:22:41 +0530
References: <20200214080606.26872-1-kjain@linux.ibm.com>
 <20200214080606.26872-2-kjain@linux.ibm.com>
X-KeepSent: 77C44664:8CD0A59C-65258512:00306110;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Build V1001FP3_08092019 August 09, 2019
X-LLNOutbound: False
X-Disclaimed: 46379
X-TNEFEvaluated: 1
Content-type: multipart/alternative; 
 Boundary="0__=EABB0F81DFA3E7808f9e8a93df938690918cEABB0F81DFA3E780"
Content-Disposition: inline
x-cbid: 20021808-8889-0000-0000-000001F1F378
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.417846; ST=0; TS=0; UL=0; ISC=; MB=0.004883
X-IBM-SpamModules-Versions: BY=3.00012596; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000292; SDB=6.01335614; UDB=6.00711495; IPR=6.01117974; 
 MB=3.00030856; MTD=3.00000008; XFM=3.00000015; UTC=2020-02-18 08:52:46
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-02-18 03:11:07 - 6.00011018
x-cbparentid: 20021808-8890-0000-0000-00005F5E3455
Message-Id: <OF77C44664.8CD0A59C-ON65258512.00306110-65258512.0030C501@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-18_01:2020-02-17,
 2020-02-18 signatures=0
X-Proofpoint-Spam-Reason: safe
X-Mailman-Approved-At: Tue, 18 Feb 2020 20:21:50 +1100
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
Cc: anju@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 maddy@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--0__=EABB0F81DFA3E7808f9e8a93df938690918cEABB0F81DFA3E780
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII


"Kajol Jain" <kjain@linux.ibm.com> wrote on 14/02/2020 01:36:06 PM:

> From: "Kajol Jain" <kjain@linux.ibm.com>
> To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
> Cc: maddy@linux.vnet.ibm.com, anju@linux.vnet.ibm.com, Nageswara R
> Sastry/India/IBM@IBMIN, kjain@linux.ibm.com
> Date: 14/02/2020 01:36 PM
> Subject: [PATCH 2/2] powerpc/kernel/sysfs: Add new config option
> PMU=5FSYSFS to enable PMU SPRs sysfs file creation
>
> Many of the performance monitoring unit (PMU) SPRs are
> exposed in the sysfs. This may not be a desirable since
> "perf" API is the primary interface to program PMU and
> collect counter data in the system. But that said, we
> cant remove these sysfs files since we dont whether
> anyone/anything is using them.
>
> So the patch adds a new CONFIG option 'CONFIG=5FPMU=5FSYSFS'
> (user selectable) to be used in sysfs file creation for
> PMU SPRs. New option by default is disabled, but can be
> enabled if user needs it.
>
> Tested this patch behaviour in powernv and pseries machines.
> Patch is also tested for pmac32=5Fdefconfig.
>
> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>

Tested-by: Nageswara R Sastry <nasastry@in.ibm.com>

Tested on PowerVM, PowerNV machines with and with out CONFIG=5FPMU=5FSYSFS
With CONFIG=5FPMU=5FSYSFS=3Dy
    For online CPUs can see the SPR files namely mmcr*, pmc*
With CONFIG=5FPMU=5FSYSFS=3Dn
    Not seeing the SPR files


> ---
>  arch/powerpc/kernel/sysfs.c            | 6 ++++++
>  arch/powerpc/platforms/Kconfig.cputype | 6 ++++++
>  2 files changed, 12 insertions(+)
>
> diff --git a/arch/powerpc/kernel/sysfs.c b/arch/powerpc/kernel/sysfs.c
> index 74da5eb..cd807e8 100644
> --- a/arch/powerpc/kernel/sysfs.c
> +++ b/arch/powerpc/kernel/sysfs.c
> @@ -562,6 +562,7 @@ void ppc=5Fenable=5Fpmcs(void)
>   * that are implemented on the current processor
>   */
>
> +#ifdef CONFIG=5FPMU=5FSYSFS
>  #if defined(CONFIG=5FPPC64) || defined(CONFIG=5FPPC=5FBOOK3S=5F32)
>  #define HAS=5FPPC=5FPMC=5FCLASSIC   1
>  #define HAS=5FPPC=5FPMC=5FIBM      1
> @@ -575,6 +576,7 @@ void ppc=5Fenable=5Fpmcs(void)
>  #ifdef CONFIG=5FPPC=5FBOOK3S=5F32
>  #define HAS=5FPPC=5FPMC=5FG4      1
>  #endif
> +#endif /* CONFIG=5FPMU=5FSYSFS */
>
>  #if defined(CONFIG=5FPPC64) && defined(CONFIG=5FDEBUG=5FMISC)
>  #define HAS=5FPPC=5FPA6T
> @@ -812,8 +814,10 @@ static int register=5Fcpu=5Fonline(unsigned int cpu)
>           device=5Fcreate=5Ffile(s, &pmc=5Fattrs[i]);
>
>  #ifdef CONFIG=5FPPC64
> +#ifdef   CONFIG=5FPMU=5FSYSFS
>     if (cpu=5Fhas=5Ffeature(CPU=5FFTR=5FMMCRA))
>        device=5Fcreate=5Ffile(s, &dev=5Fattr=5Fmmcra);
> +#endif /* CONFIG=5FPMU=5FSYSFS */
>
>     if (cpu=5Fhas=5Ffeature(CPU=5FFTR=5FPURR)) {
>        if (!firmware=5Fhas=5Ffeature(FW=5FFEATURE=5FLPAR))
> @@ -901,8 +905,10 @@ static int unregister=5Fcpu=5Fonline(unsigned int cp=
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
> index 8d7f9c3..e58b48d 100644
> --- a/arch/powerpc/platforms/Kconfig.cputype
> +++ b/arch/powerpc/platforms/Kconfig.cputype
> @@ -417,6 +417,12 @@ config PPC=5FMM=5FSLICES
>  config PPC=5FHAVE=5FPMU=5FSUPPORT
>     bool
>
> +config PMU=5FSYSFS
> +   bool "Create PMU SPRs sysfs file"
> +   default n
> +   help
> +     This option enables sysfs file creation for PMU SPRs like
> MMCR* and PMC*.
> +
>  config PPC=5FPERF=5FCTRS
>     def=5Fbool y
>     depends on PERF=5FEVENTS && PPC=5FHAVE=5FPMU=5FSUPPORT
> --
> 1.8.3.1
>

--0__=EABB0F81DFA3E7808f9e8a93df938690918cEABB0F81DFA3E780
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p><tt><font size=3D"2">&quot;Kajol Jain&quot; &lt;kjain@linux.=
ibm.com&gt; wrote on 14/02/2020 01:36:06 PM:<br><br>&gt; From: &quot;Kajol =
Jain&quot; &lt;kjain@linux.ibm.com&gt;</font></tt><br><tt><font size=3D"2">=
&gt; To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au</font></tt><br><=
tt><font size=3D"2">&gt; Cc: maddy@linux.vnet.ibm.com, anju@linux.vnet.ibm.=
com, Nageswara R <br>&gt; Sastry/India/IBM@IBMIN, kjain@linux.ibm.com</font=
></tt><br><tt><font size=3D"2">&gt; Date: 14/02/2020 01:36 PM</font></tt><b=
r><tt><font size=3D"2">&gt; Subject: [PATCH 2/2] powerpc/kernel/sysfs: Add =
new config option <br>&gt; PMU=5FSYSFS to enable PMU SPRs sysfs file creati=
on</font></tt><br><tt><font size=3D"2">&gt; <br>&gt; Many of the performanc=
e monitoring unit (PMU) SPRs are<br>&gt; exposed in the sysfs. This may not=
 be a desirable since<br>&gt; &quot;perf&quot; API is the primary interface=
 to program PMU and<br>&gt; collect counter data in the system. But that sa=
id, we<br>&gt; cant remove these sysfs files since we dont whether<br>&gt; =
anyone/anything is using them.<br>&gt; <br>&gt; So the patch adds a new CON=
FIG option 'CONFIG=5FPMU=5FSYSFS'<br>&gt; (user selectable) to be used in s=
ysfs file creation for<br>&gt; PMU SPRs. New option by default is disabled,=
 but can be<br>&gt; enabled if user needs it.<br>&gt; <br>&gt; Tested this =
patch behaviour in powernv and pseries machines.<br>&gt; Patch is also test=
ed for pmac32=5Fdefconfig.<br>&gt; <br>&gt; Signed-off-by: Kajol Jain &lt;k=
jain@linux.ibm.com&gt;</font></tt><br><br><tt><font size=3D"2">Tested-by: N=
ageswara R Sastry &lt;nasastry@in.ibm.com&gt;<br><br>Tested on PowerVM, Pow=
erNV machines with and with out CONFIG=5FPMU=5FSYSFS</font></tt><br><tt><fo=
nt size=3D"2">With CONFIG=5FPMU=5FSYSFS=3Dy<br> &nbsp; &nbsp;For online CPU=
s can see the SPR files namely mmcr*, pmc*<br>With CONFIG=5FPMU=5FSYSFS=3Dn=
<br> &nbsp; &nbsp;Not seeing the SPR files<br></font></tt><br><tt><font siz=
e=3D"2"><br>&gt; ---<br>&gt; &nbsp;arch/powerpc/kernel/sysfs.c &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp;| 6 ++++++<br>&gt; &nbsp;arch/powerpc/platform=
s/Kconfig.cputype | 6 ++++++<br>&gt; &nbsp;2 files changed, 12 insertions(+=
)<br>&gt; <br>&gt; diff --git a/arch/powerpc/kernel/sysfs.c b/arch/powerpc/=
kernel/sysfs.c<br>&gt; index 74da5eb..cd807e8 100644<br>&gt; --- a/arch/pow=
erpc/kernel/sysfs.c<br>&gt; +++ b/arch/powerpc/kernel/sysfs.c<br>&gt; @@ -5=
62,6 +562,7 @@ void ppc=5Fenable=5Fpmcs(void)<br>&gt; &nbsp; * that are imp=
lemented on the current processor<br>&gt; &nbsp; */<br>&gt; &nbsp;<br>&gt; =
+#ifdef CONFIG=5FPMU=5FSYSFS<br>&gt; &nbsp;#if defined(CONFIG=5FPPC64) || d=
efined(CONFIG=5FPPC=5FBOOK3S=5F32)<br>&gt; &nbsp;#define HAS=5FPPC=5FPMC=5F=
CLASSIC &nbsp; 1<br>&gt; &nbsp;#define HAS=5FPPC=5FPMC=5FIBM &nbsp; &nbsp; =
&nbsp;1<br>&gt; @@ -575,6 +576,7 @@ void ppc=5Fenable=5Fpmcs(void)<br>&gt; =
&nbsp;#ifdef CONFIG=5FPPC=5FBOOK3S=5F32<br>&gt; &nbsp;#define HAS=5FPPC=5FP=
MC=5FG4 &nbsp; &nbsp; &nbsp;1<br>&gt; &nbsp;#endif<br>&gt; +#endif /* CONFI=
G=5FPMU=5FSYSFS */<br>&gt; &nbsp;<br>&gt; &nbsp;#if defined(CONFIG=5FPPC64)=
 &amp;&amp; defined(CONFIG=5FDEBUG=5FMISC)<br>&gt; &nbsp;#define HAS=5FPPC=
=5FPA6T<br>&gt; @@ -812,8 +814,10 @@ static int register=5Fcpu=5Fonline(uns=
igned int cpu)<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; device=5Fcreate=
=5Ffile(s, &amp;pmc=5Fattrs[i]);<br>&gt; &nbsp;<br>&gt; &nbsp;#ifdef CONFIG=
=5FPPC64<br>&gt; +#ifdef &nbsp; CONFIG=5FPMU=5FSYSFS<br>&gt; &nbsp; &nbsp; =
if (cpu=5Fhas=5Ffeature(CPU=5FFTR=5FMMCRA))<br>&gt; &nbsp; &nbsp; &nbsp; &n=
bsp;device=5Fcreate=5Ffile(s, &amp;dev=5Fattr=5Fmmcra);<br>&gt; +#endif /* =
CONFIG=5FPMU=5FSYSFS */<br>&gt; &nbsp;<br>&gt; &nbsp; &nbsp; if (cpu=5Fhas=
=5Ffeature(CPU=5FFTR=5FPURR)) {<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp;if (!fir=
mware=5Fhas=5Ffeature(FW=5FFEATURE=5FLPAR))<br>&gt; @@ -901,8 +905,10 @@ st=
atic int unregister=5Fcpu=5Fonline(unsigned int cpu)<br>&gt; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; device=5Fremove=5Ffile(s, &amp;pmc=5Fattrs[i]);<br>&gt=
; &nbsp;<br>&gt; &nbsp;#ifdef CONFIG=5FPPC64<br>&gt; +#ifdef CONFIG=5FPMU=
=5FSYSFS<br>&gt; &nbsp; &nbsp; if (cpu=5Fhas=5Ffeature(CPU=5FFTR=5FMMCRA))<=
br>&gt; &nbsp; &nbsp; &nbsp; &nbsp;device=5Fremove=5Ffile(s, &amp;dev=5Fatt=
r=5Fmmcra);<br>&gt; +#endif /* CONFIG=5FPMU=5FSYSFS */<br>&gt; &nbsp;<br>&g=
t; &nbsp; &nbsp; if (cpu=5Fhas=5Ffeature(CPU=5FFTR=5FPURR))<br>&gt; &nbsp; =
&nbsp; &nbsp; &nbsp;device=5Fremove=5Ffile(s, &amp;dev=5Fattr=5Fpurr);<br>&=
gt; diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/<br>=
&gt; platforms/Kconfig.cputype<br>&gt; index 8d7f9c3..e58b48d 100644<br>&gt=
; --- a/arch/powerpc/platforms/Kconfig.cputype<br>&gt; +++ b/arch/powerpc/p=
latforms/Kconfig.cputype<br>&gt; @@ -417,6 +417,12 @@ config PPC=5FMM=5FSLI=
CES<br>&gt; &nbsp;config PPC=5FHAVE=5FPMU=5FSUPPORT<br>&gt; &nbsp; &nbsp; b=
ool<br>&gt; &nbsp;<br>&gt; +config PMU=5FSYSFS<br>&gt; + &nbsp; bool &quot;=
Create PMU SPRs sysfs file&quot;<br>&gt; + &nbsp; default n<br>&gt; + &nbsp=
; help<br>&gt; + &nbsp; &nbsp; This option enables sysfs file creation for =
PMU SPRs like <br>&gt; MMCR* and PMC*.<br>&gt; +<br>&gt; &nbsp;config PPC=
=5FPERF=5FCTRS<br>&gt; &nbsp; &nbsp; def=5Fbool y<br>&gt; &nbsp; &nbsp; dep=
ends on PERF=5FEVENTS &amp;&amp; PPC=5FHAVE=5FPMU=5FSUPPORT<br>&gt; -- <br>=
&gt; 1.8.3.1<br>&gt; <br></font></tt><BR>
</body></html>

--0__=EABB0F81DFA3E7808f9e8a93df938690918cEABB0F81DFA3E780--

