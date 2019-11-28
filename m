Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 853DE10C6A2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Nov 2019 11:27:40 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Nv3F1lX6zDr0T
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Nov 2019 21:27:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=in.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=nasastry@in.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=in.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47NtvQ15DbzDqxt
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Nov 2019 21:20:48 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xASAIpdk063473
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Nov 2019 05:20:44 -0500
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.75])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wjar8bc0e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Nov 2019 05:20:44 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <linuxppc-dev@lists.ozlabs.org> from <nasastry@in.ibm.com>;
 Thu, 28 Nov 2019 10:20:43 -0000
Received: from us1a3-smtp06.a3.dal06.isc4sb.com (10.146.103.243)
 by smtp.notes.na.collabserv.com (10.106.227.123) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 28 Nov 2019 10:20:39 -0000
Received: from us1a3-mail120.a3.dal06.isc4sb.com ([10.146.45.191])
 by us1a3-smtp06.a3.dal06.isc4sb.com
 with ESMTP id 2019112810203921-267290 ;
 Thu, 28 Nov 2019 10:20:39 +0000 
MIME-Version: 1.0
In-Reply-To: <20191127072035.4283-1-anju@linux.vnet.ibm.com>
Subject: Re: [PATCH v3] platforms/powernv: Avoid re-registration of imc debugfs
 directory
To: "Anju T Sudhakar" <anju@linux.vnet.ibm.com>
From: "Nageswara R Sastry" <nasastry@in.ibm.com>
Date: Thu, 28 Nov 2019 15:50:36 +0530
References: <20191127072035.4283-1-anju@linux.vnet.ibm.com>
X-KeepSent: 14C9B4C3:B03A7C39-652584C0:0037AA8C;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Build V1001FP3_08092019 August 09, 2019
X-LLNOutbound: False
X-Disclaimed: 24987
X-TNEFEvaluated: 1
Content-type: multipart/alternative; 
 Boundary="0__=EABB0E53DFA42C1C8f9e8a93df938690918cEABB0E53DFA42C1C"
Content-Disposition: inline
x-cbid: 19112810-6875-0000-0000-0000011FFD00
X-IBM-SpamModules-Scores: BY=0.226348; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.433748; ST=0; TS=0; UL=0; ISC=; MB=0.141207
X-IBM-SpamModules-Versions: BY=3.00012177; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000292; SDB=6.01296553; UDB=6.00688162; IPR=6.01078808; 
 MB=3.00029752; MTD=3.00000008; XFM=3.00000015; UTC=2019-11-28 10:20:42
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2019-11-28 09:19:48 - 6.00010703
x-cbparentid: 19112810-6876-0000-0000-000001C2B154
Message-Id: <OF14C9B4C3.B03A7C39-ON652584C0.0037AA8C-652584C0.0038D198@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-28_01:2019-11-28,2019-11-28 signatures=0
X-Proofpoint-Spam-Reason: safe
X-Mailman-Approved-At: Thu, 28 Nov 2019 21:25:14 +1100
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--0__=EABB0E53DFA42C1C8f9e8a93df938690918cEABB0E53DFA42C1C
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII

"Anju T Sudhakar" <anju@linux.vnet.ibm.com> wrote on 27/11/2019 12:50:35
PM:

> From: "Anju T Sudhakar" <anju@linux.vnet.ibm.com>
> To: mpe@ellerman.id.au
> Cc: linuxppc-dev@lists.ozlabs.org, anju@linux.vnet.ibm.com,
> Nageswara R Sastry/India/IBM@IBMIN
> Date: 27/11/2019 12:50 PM
> Subject: [PATCH v3] platforms/powernv: Avoid re-registration of imc
> debugfs directory
>
> export=5Fimc=5Fmode=5Fand=5Fcmd() function which creates the debugfs inte=
rface
for
> imc-mode and imc-command, is invoked when each nest pmu units is
> registered.
> When the first nest pmu unit is registered, export=5Fimc=5Fmode=5Fand=5Fc=
md()
> creates 'imc' directory under `/debug/powerpc/`. In the subsequent
> invocations debugfs=5Fcreate=5Fdir() function returns, since the directory
> already exists.
>
> The recent commit <c33d442328f55> (debugfs: make error message a bit more
> verbose), throws a warning if we try to invoke `debugfs=5Fcreate=5Fdir()`
> with an already existing directory name.
>
> Address this warning by making the debugfs directory registration
> in the opal=5Fimc=5Fcounters=5Fprobe() function, i.e invoke
> export=5Fimc=5Fmode=5Fand=5Fcmd() function from the probe function.
>
> Signed-off-by: Anju T Sudhakar <anju@linux.vnet.ibm.com>
> ---
> Changes from v2 -> v3:
>
> * Invoke export=5Fimc=5Fmode=5Fand=5Fcmd(), which does the imc debugfs
>   directory registration and deletion, from the probe fucntion.
> * Change the return type of imc=5Fpmu=5Fcreate() to get the
>   control block address for nest units in the probe
>   function
> * Remove unnecessary comments

Tested-by: Nageswara R Sastry <nasastry@in.ibm.com>

Not seeing any Kernel OOPs/warnings in dmesg
# cat /sys/kernel/debug/powerpc/imc/*
0x0000000000000000
0x0000000000000000
0x0000000000000000
0x0000000000000000


> ---
>  arch/powerpc/platforms/powernv/opal-imc.c | 39 ++++++++++++
> +------------------
>  1 file changed, 16 insertions(+), 23 deletions(-)
>
> diff --git a/arch/powerpc/platforms/powernv/opal-imc.c b/arch/
> powerpc/platforms/powernv/opal-imc.c
> index e04b206..3b4518f 100644
> --- a/arch/powerpc/platforms/powernv/opal-imc.c
> +++ b/arch/powerpc/platforms/powernv/opal-imc.c
> @@ -59,10 +59,6 @@ static void export=5Fimc=5Fmode=5Fand=5Fcmd(struct
> device=5Fnode *node,
>
>     imc=5Fdebugfs=5Fparent =3D debugfs=5Fcreate=5Fdir("imc", powerpc=5Fde=
bugfs=5Froot);
>
> -   /*
> -    * Return here, either because 'imc' directory already exists,
> -    * Or failed to create a new one.
> -    */
>     if (!imc=5Fdebugfs=5Fparent)
>        return;
>
> @@ -135,7 +131,6 @@ static int imc=5Fget=5Fmem=5Faddr=5Fnest(struct devic=
e=5Fnode
*node,
>     }
>
>     pmu=5Fptr->imc=5Fcounter=5Fmmaped =3D true;
> -   export=5Fimc=5Fmode=5Fand=5Fcmd(node, pmu=5Fptr);
>     kfree(base=5Faddr=5Farr);
>     kfree(chipid=5Farr);
>     return 0;
> @@ -151,7 +146,7 @@ static int imc=5Fget=5Fmem=5Faddr=5Fnest(struct devic=
e=5Fnode
*node,
>   *          and domain as the inputs.
>   * Allocates memory for the struct imc=5Fpmu, sets up its domain,
> size and offsets
>   */
> -static int imc=5Fpmu=5Fcreate(struct device=5Fnode *parent, int
> pmu=5Findex, int domain)
> +static struct imc=5Fpmu *imc=5Fpmu=5Fcreate(struct device=5Fnode *parent,
> int pmu=5Findex, int domain)
>  {
>     int ret =3D 0;
>     struct imc=5Fpmu *pmu=5Fptr;
> @@ -159,27 +154,23 @@ static int imc=5Fpmu=5Fcreate(struct device=5Fnode
> *parent, int pmu=5Findex, int domain)
>
>     /* Return for unknown domain */
>     if (domain < 0)
> -      return -EINVAL;
> +      return NULL;
>
>     /* memory for pmu */
>     pmu=5Fptr =3D kzalloc(sizeof(*pmu=5Fptr), GFP=5FKERNEL);
>     if (!pmu=5Fptr)
> -      return -ENOMEM;
> +      return NULL;
>
>     /* Set the domain */
>     pmu=5Fptr->domain =3D domain;
>
>     ret =3D of=5Fproperty=5Fread=5Fu32(parent, "size", &pmu=5Fptr->
counter=5Fmem=5Fsize);
> -   if (ret) {
> -      ret =3D -EINVAL;
> +   if (ret)
>        goto free=5Fpmu;
> -   }
>
>     if (!of=5Fproperty=5Fread=5Fu32(parent, "offset", &offset)) {
> -      if (imc=5Fget=5Fmem=5Faddr=5Fnest(parent, pmu=5Fptr, offset)) {
> -         ret =3D -EINVAL;
> +      if (imc=5Fget=5Fmem=5Faddr=5Fnest(parent, pmu=5Fptr, offset))
>           goto free=5Fpmu;
> -      }
>     }
>
>     /* Function to register IMC pmu */
> @@ -190,14 +181,14 @@ static int imc=5Fpmu=5Fcreate(struct device=5Fnode
> *parent, int pmu=5Findex, int domain)
>        if (pmu=5Fptr->domain =3D=3D IMC=5FDOMAIN=5FNEST)
>           kfree(pmu=5Fptr->mem=5Finfo);
>        kfree(pmu=5Fptr);
> -      return ret;
> +      return NULL;
>     }
>
> -   return 0;
> +   return pmu=5Fptr;
>
>  free=5Fpmu:
>     kfree(pmu=5Fptr);
> -   return ret;
> +   return NULL;
>  }
>
>  static void disable=5Fnest=5Fpmu=5Fcounters(void)
> @@ -254,6 +245,7 @@ int get=5Fmax=5Fnest=5Fdev(void)
>  static int opal=5Fimc=5Fcounters=5Fprobe(struct platform=5Fdevice *pdev)
>  {
>     struct device=5Fnode *imc=5Fdev =3D pdev->dev.of=5Fnode;
> +   struct imc=5Fpmu *pmu;
>     int pmu=5Fcount =3D 0, domain;
>     bool core=5Fimc=5Freg =3D false, thread=5Fimc=5Freg =3D false;
>     u32 type;
> @@ -269,6 +261,7 @@ static int opal=5Fimc=5Fcounters=5Fprobe(struct
> platform=5Fdevice *pdev)
>     }
>
>     for=5Feach=5Fcompatible=5Fnode(imc=5Fdev, NULL, IMC=5FDTB=5FUNIT=5FCO=
MPAT) {
> +      pmu =3D NULL;
>        if (of=5Fproperty=5Fread=5Fu32(imc=5Fdev, "type", &type)) {
>           pr=5Fwarn("IMC Device without type property\n");
>           continue;
> @@ -293,9 +286,13 @@ static int opal=5Fimc=5Fcounters=5Fprobe(struct
> platform=5Fdevice *pdev)
>           break;
>        }
>
> -      if (!imc=5Fpmu=5Fcreate(imc=5Fdev, pmu=5Fcount, domain)) {
> -         if (domain =3D=3D IMC=5FDOMAIN=5FNEST)
> +      pmu =3D imc=5Fpmu=5Fcreate(imc=5Fdev, pmu=5Fcount, domain);
> +      if (pmu !=3D NULL) {
> +         if (domain =3D=3D IMC=5FDOMAIN=5FNEST) {
> +            if (!imc=5Fdebugfs=5Fparent)
> +               export=5Fimc=5Fmode=5Fand=5Fcmd(imc=5Fdev, pmu);
>              pmu=5Fcount++;
> +         }
>           if (domain =3D=3D IMC=5FDOMAIN=5FCORE)
>              core=5Fimc=5Freg =3D true;
>           if (domain =3D=3D IMC=5FDOMAIN=5FTHREAD)
> @@ -303,10 +300,6 @@ static int opal=5Fimc=5Fcounters=5Fprobe(struct
> platform=5Fdevice *pdev)
>        }
>     }
>
> -   /* If none of the nest units are registered, remove debugfs interface
*/
> -   if (pmu=5Fcount =3D=3D 0)
> -      debugfs=5Fremove=5Frecursive(imc=5Fdebugfs=5Fparent);
> -
>     /* If core imc is not registered, unregister thread-imc */
>     if (!core=5Fimc=5Freg && thread=5Fimc=5Freg)
>        unregister=5Fthread=5Fimc();
> --
> 1.8.3.1
>

--0__=EABB0E53DFA42C1C8f9e8a93df938690918cEABB0E53DFA42C1C
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p><tt><font size=3D"2">&quot;Anju T Sudhakar&quot; &lt;anju@li=
nux.vnet.ibm.com&gt; wrote on 27/11/2019 12:50:35 PM:<br><br>&gt; From: &qu=
ot;Anju T Sudhakar&quot; &lt;anju@linux.vnet.ibm.com&gt;</font></tt><br><tt=
><font size=3D"2">&gt; To: mpe@ellerman.id.au</font></tt><br><tt><font size=
=3D"2">&gt; Cc: linuxppc-dev@lists.ozlabs.org, anju@linux.vnet.ibm.com, <br=
>&gt; Nageswara R Sastry/India/IBM@IBMIN</font></tt><br><tt><font size=3D"2=
">&gt; Date: 27/11/2019 12:50 PM</font></tt><br><tt><font size=3D"2">&gt; S=
ubject: [PATCH v3] platforms/powernv: Avoid re-registration of imc <br>&gt;=
 debugfs directory</font></tt><br><tt><font size=3D"2">&gt; <br>&gt; export=
=5Fimc=5Fmode=5Fand=5Fcmd() function which creates the debugfs interface fo=
r<br>&gt; imc-mode and imc-command, is invoked when each nest pmu units is<=
br>&gt; registered.<br>&gt; When the first nest pmu unit is registered, exp=
ort=5Fimc=5Fmode=5Fand=5Fcmd()<br>&gt; creates 'imc' directory under `/debu=
g/powerpc/`. In the subsequent<br>&gt; invocations debugfs=5Fcreate=5Fdir()=
 function returns, since the directory<br>&gt; already exists.<br>&gt; <br>=
&gt; The recent commit &lt;c33d442328f55&gt; (debugfs: make error message a=
 bit more<br>&gt; verbose), throws a warning if we try to invoke `debugfs=
=5Fcreate=5Fdir()`<br>&gt; with an already existing directory name.<br>&gt;=
 <br>&gt; Address this warning by making the debugfs directory registration=
<br>&gt; in the opal=5Fimc=5Fcounters=5Fprobe() function, i.e invoke<br>&gt=
; export=5Fimc=5Fmode=5Fand=5Fcmd() function from the probe function.<br>&g=
t; <br>&gt; Signed-off-by: Anju T Sudhakar &lt;anju@linux.vnet.ibm.com&gt;<=
br>&gt; ---<br>&gt; Changes from v2 -&gt; v3:<br>&gt; <br>&gt; * Invoke exp=
ort=5Fimc=5Fmode=5Fand=5Fcmd(), which does the imc debugfs<br>&gt; &nbsp; d=
irectory registration and deletion, from the probe fucntion.<br>&gt; * Chan=
ge the return type of imc=5Fpmu=5Fcreate() to get the<br>&gt; &nbsp; contro=
l block address for nest units in the probe<br>&gt; &nbsp; function<br>&gt;=
 * Remove unnecessary comments<br></font></tt><br><tt><font size=3D"2">Test=
ed-by: Nageswara R Sastry &lt;nasastry@in.ibm.com&gt;<br></font></tt><br><t=
t><font size=3D"2">Not seeing any Kernel OOPs/warnings in dmesg<br></font><=
/tt><tt><font size=3D"2" color=3D"#5F5F5F"># cat /sys/kernel/debug/powerpc/=
imc/*</font></tt><br><tt><font size=3D"2" color=3D"#5F5F5F">0x0000000000000=
000</font></tt><br><tt><font size=3D"2" color=3D"#5F5F5F">0x000000000000000=
0</font></tt><br><tt><font size=3D"2" color=3D"#5F5F5F">0x0000000000000000<=
/font></tt><br><tt><font size=3D"2" color=3D"#5F5F5F">0x0000000000000000</f=
ont></tt><br><br><tt><font size=3D"2"><br>&gt; ---<br>&gt; &nbsp;arch/power=
pc/platforms/powernv/opal-imc.c | 39 ++++++++++++<br>&gt; +----------------=
--<br>&gt; &nbsp;1 file changed, 16 insertions(+), 23 deletions(-)<br>&gt; =
<br>&gt; diff --git a/arch/powerpc/platforms/powernv/opal-imc.c b/arch/<br>=
&gt; powerpc/platforms/powernv/opal-imc.c<br>&gt; index e04b206..3b4518f 10=
0644<br>&gt; --- a/arch/powerpc/platforms/powernv/opal-imc.c<br>&gt; +++ b/=
arch/powerpc/platforms/powernv/opal-imc.c<br>&gt; @@ -59,10 +59,6 @@ static=
 void export=5Fimc=5Fmode=5Fand=5Fcmd(struct <br>&gt; device=5Fnode *node,<=
br>&gt; &nbsp;<br>&gt; &nbsp; &nbsp; imc=5Fdebugfs=5Fparent =3D debugfs=5Fc=
reate=5Fdir(&quot;imc&quot;, powerpc=5Fdebugfs=5Froot);<br>&gt; &nbsp;<br>&=
gt; - &nbsp; /*<br>&gt; - &nbsp; &nbsp;* Return here, either because 'imc' =
directory already exists,<br>&gt; - &nbsp; &nbsp;* Or failed to create a ne=
w one.<br>&gt; - &nbsp; &nbsp;*/<br>&gt; &nbsp; &nbsp; if (!imc=5Fdebugfs=
=5Fparent)<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp;return;<br>&gt; &nbsp;<br>&gt=
; @@ -135,7 +131,6 @@ static int imc=5Fget=5Fmem=5Faddr=5Fnest(struct devic=
e=5Fnode *node,<br>&gt; &nbsp; &nbsp; }<br>&gt; &nbsp;<br>&gt; &nbsp; &nbsp=
; pmu=5Fptr-&gt;imc=5Fcounter=5Fmmaped =3D true;<br>&gt; - &nbsp; export=5F=
imc=5Fmode=5Fand=5Fcmd(node, pmu=5Fptr);<br>&gt; &nbsp; &nbsp; kfree(base=
=5Faddr=5Farr);<br>&gt; &nbsp; &nbsp; kfree(chipid=5Farr);<br>&gt; &nbsp; &=
nbsp; return 0;<br>&gt; @@ -151,7 +146,7 @@ static int imc=5Fget=5Fmem=5Fad=
dr=5Fnest(struct device=5Fnode *node,<br>&gt; &nbsp; * &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;and domain as the inputs.<br>&gt; &nbsp; * Allocates memory f=
or the struct imc=5Fpmu, sets up its domain, <br>&gt; size and offsets<br>&=
gt; &nbsp; */<br>&gt; -static int imc=5Fpmu=5Fcreate(struct device=5Fnode *=
parent, int <br>&gt; pmu=5Findex, int domain)<br>&gt; +static struct imc=5F=
pmu *imc=5Fpmu=5Fcreate(struct device=5Fnode *parent, <br>&gt; int pmu=5Fin=
dex, int domain)<br>&gt; &nbsp;{<br>&gt; &nbsp; &nbsp; int ret =3D 0;<br>&g=
t; &nbsp; &nbsp; struct imc=5Fpmu *pmu=5Fptr;<br>&gt; @@ -159,27 +154,23 @@=
 static int imc=5Fpmu=5Fcreate(struct device=5Fnode <br>&gt; *parent, int p=
mu=5Findex, int domain)<br>&gt; &nbsp;<br>&gt; &nbsp; &nbsp; /* Return for =
unknown domain */<br>&gt; &nbsp; &nbsp; if (domain &lt; 0)<br>&gt; - &nbsp;=
 &nbsp; &nbsp;return -EINVAL;<br>&gt; + &nbsp; &nbsp; &nbsp;return NULL;<br=
>&gt; &nbsp;<br>&gt; &nbsp; &nbsp; /* memory for pmu */<br>&gt; &nbsp; &nbs=
p; pmu=5Fptr =3D kzalloc(sizeof(*pmu=5Fptr), GFP=5FKERNEL);<br>&gt; &nbsp; =
&nbsp; if (!pmu=5Fptr)<br>&gt; - &nbsp; &nbsp; &nbsp;return -ENOMEM;<br>&gt=
; + &nbsp; &nbsp; &nbsp;return NULL;<br>&gt; &nbsp;<br>&gt; &nbsp; &nbsp; /=
* Set the domain */<br>&gt; &nbsp; &nbsp; pmu=5Fptr-&gt;domain =3D domain;<=
br>&gt; &nbsp;<br>&gt; &nbsp; &nbsp; ret =3D of=5Fproperty=5Fread=5Fu32(par=
ent, &quot;size&quot;, &amp;pmu=5Fptr-&gt;counter=5Fmem=5Fsize);<br>&gt; - =
&nbsp; if (ret) {<br>&gt; - &nbsp; &nbsp; &nbsp;ret =3D -EINVAL;<br>&gt; + =
&nbsp; if (ret)<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp;goto free=5Fpmu;<br>&gt;=
 - &nbsp; }<br>&gt; &nbsp;<br>&gt; &nbsp; &nbsp; if (!of=5Fproperty=5Fread=
=5Fu32(parent, &quot;offset&quot;, &amp;offset)) {<br>&gt; - &nbsp; &nbsp; =
&nbsp;if (imc=5Fget=5Fmem=5Faddr=5Fnest(parent, pmu=5Fptr, offset)) {<br>&g=
t; - &nbsp; &nbsp; &nbsp; &nbsp; ret =3D -EINVAL;<br>&gt; + &nbsp; &nbsp; &=
nbsp;if (imc=5Fget=5Fmem=5Faddr=5Fnest(parent, pmu=5Fptr, offset))<br>&gt; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; goto free=5Fpmu;<br>&gt; - &nbsp; &nbsp;=
 &nbsp;}<br>&gt; &nbsp; &nbsp; }<br>&gt; &nbsp;<br>&gt; &nbsp; &nbsp; /* Fu=
nction to register IMC pmu */<br>&gt; @@ -190,14 +181,14 @@ static int imc=
=5Fpmu=5Fcreate(struct device=5Fnode <br>&gt; *parent, int pmu=5Findex, int=
 domain)<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp;if (pmu=5Fptr-&gt;domain =3D=3D=
 IMC=5FDOMAIN=5FNEST)<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; kfree(pmu=
=5Fptr-&gt;mem=5Finfo);<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp;kfree(pmu=5Fptr)=
;<br>&gt; - &nbsp; &nbsp; &nbsp;return ret;<br>&gt; + &nbsp; &nbsp; &nbsp;r=
eturn NULL;<br>&gt; &nbsp; &nbsp; }<br>&gt; &nbsp;<br>&gt; - &nbsp; return =
0;<br>&gt; + &nbsp; return pmu=5Fptr;<br>&gt; &nbsp;<br>&gt; &nbsp;free=5Fp=
mu:<br>&gt; &nbsp; &nbsp; kfree(pmu=5Fptr);<br>&gt; - &nbsp; return ret;<br=
>&gt; + &nbsp; return NULL;<br>&gt; &nbsp;}<br>&gt; &nbsp;<br>&gt; &nbsp;st=
atic void disable=5Fnest=5Fpmu=5Fcounters(void)<br>&gt; @@ -254,6 +245,7 @@=
 int get=5Fmax=5Fnest=5Fdev(void)<br>&gt; &nbsp;static int opal=5Fimc=5Fcou=
nters=5Fprobe(struct platform=5Fdevice *pdev)<br>&gt; &nbsp;{<br>&gt; &nbsp=
; &nbsp; struct device=5Fnode *imc=5Fdev =3D pdev-&gt;dev.of=5Fnode;<br>&gt=
; + &nbsp; struct imc=5Fpmu *pmu;<br>&gt; &nbsp; &nbsp; int pmu=5Fcount =3D=
 0, domain;<br>&gt; &nbsp; &nbsp; bool core=5Fimc=5Freg =3D false, thread=
=5Fimc=5Freg =3D false;<br>&gt; &nbsp; &nbsp; u32 type;<br>&gt; @@ -269,6 +=
261,7 @@ static int opal=5Fimc=5Fcounters=5Fprobe(struct <br>&gt; platform=
=5Fdevice *pdev)<br>&gt; &nbsp; &nbsp; }<br>&gt; &nbsp;<br>&gt; &nbsp; &nbs=
p; for=5Feach=5Fcompatible=5Fnode(imc=5Fdev, NULL, IMC=5FDTB=5FUNIT=5FCOMPA=
T) {<br>&gt; + &nbsp; &nbsp; &nbsp;pmu =3D NULL;<br>&gt; &nbsp; &nbsp; &nbs=
p; &nbsp;if (of=5Fproperty=5Fread=5Fu32(imc=5Fdev, &quot;type&quot;, &amp;t=
ype)) {<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; pr=5Fwarn(&quot;IMC Devi=
ce without type property\n&quot;);<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; continue;<br>&gt; @@ -293,9 +286,13 @@ static int opal=5Fimc=5Fcounters=
=5Fprobe(struct <br>&gt; platform=5Fdevice *pdev)<br>&gt; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; break;<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp;}<br>&gt; &nbsp=
;<br>&gt; - &nbsp; &nbsp; &nbsp;if (!imc=5Fpmu=5Fcreate(imc=5Fdev, pmu=5Fco=
unt, domain)) {<br>&gt; - &nbsp; &nbsp; &nbsp; &nbsp; if (domain =3D=3D IMC=
=5FDOMAIN=5FNEST)<br>&gt; + &nbsp; &nbsp; &nbsp;pmu =3D imc=5Fpmu=5Fcreate(=
imc=5Fdev, pmu=5Fcount, domain);<br>&gt; + &nbsp; &nbsp; &nbsp;if (pmu !=3D=
 NULL) {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; if (domain =3D=3D IMC=5FDOMA=
IN=5FNEST) {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (!imc=5F=
debugfs=5Fparent)<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; export=5Fimc=5Fmode=5Fand=5Fcmd(imc=5Fdev, pmu);<br>&gt; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;pmu=5Fcount++;<br>&gt; + &nbsp; &nbsp; &nbs=
p; &nbsp; }<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (domain =3D=3D IM=
C=5FDOMAIN=5FCORE)<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
core=5Fimc=5Freg =3D true;<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (d=
omain =3D=3D IMC=5FDOMAIN=5FTHREAD)<br>&gt; @@ -303,10 +300,6 @@ static int=
 opal=5Fimc=5Fcounters=5Fprobe(struct <br>&gt; platform=5Fdevice *pdev)<br>=
&gt; &nbsp; &nbsp; &nbsp; &nbsp;}<br>&gt; &nbsp; &nbsp; }<br>&gt; &nbsp;<br=
>&gt; - &nbsp; /* If none of the nest units are registered, remove debugfs =
interface */<br>&gt; - &nbsp; if (pmu=5Fcount =3D=3D 0)<br>&gt; - &nbsp; &n=
bsp; &nbsp;debugfs=5Fremove=5Frecursive(imc=5Fdebugfs=5Fparent);<br>&gt; -<=
br>&gt; &nbsp; &nbsp; /* If core imc is not registered, unregister thread-i=
mc */<br>&gt; &nbsp; &nbsp; if (!core=5Fimc=5Freg &amp;&amp; thread=5Fimc=
=5Freg)<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp;unregister=5Fthread=5Fimc();<br>=
&gt; -- <br>&gt; 1.8.3.1<br>&gt; <br></font></tt><BR>
</body></html>

--0__=EABB0E53DFA42C1C8f9e8a93df938690918cEABB0E53DFA42C1C--

