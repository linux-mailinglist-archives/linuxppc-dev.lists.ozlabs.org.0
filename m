Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD5B1E61A4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 May 2020 15:05:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Xnxk34V4zDqZ1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 May 2020 23:05:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=in.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nasastry@in.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=in.ibm.com
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="signature verification failed" (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=kzpl54O3; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49XjK40PrBzDqP5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 May 2020 19:37:11 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04S9WqHE032026
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 May 2020 05:37:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=mime-version :
 in-reply-to : subject : to : cc : from : date : references : content-type
 : message-id; s=pp1; bh=oEdnxjTDdU5HzMzTtWsJo+xUOVSgh4j0r4yvhW7DdTY=;
 b=kzpl54O3u/M5gykkus7n3mML5pEF840G0cgRM8zEvSnl6R873ia9BY8ckvrCqDuxctEb
 98MezRDGJmIE2cbZwwpgfpOjijkD1Ri06f992MFpqd6irUa4jMSimb1XdVglF+7b5IT5
 VfeGWuLrnye915EIc9h+H/tFJg1MvKoSf32c0M11Y2HGMKp7utDXI7rcd6kBmJVNZCqn
 I3Bx5ci7MoapJXSMNih2EWfOYQlo4cAsqe+SNyNTXdwjVLwj2r8fmBoKg/MecX+Liof5
 Yy4zdm9RPuyBAGyHY60rOsNPcxJ6K0p5atYOQpq0Hw5BhlYr+O+Z1U8UhBtZyEJdr4zQ eg== 
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.81])
 by mx0a-001b2d01.pphosted.com with ESMTP id 316ygd4r1a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 May 2020 05:37:09 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <linuxppc-dev@lists.ozlabs.org> from <nasastry@in.ibm.com>;
 Thu, 28 May 2020 09:37:07 -0000
Received: from us1a3-smtp06.a3.dal06.isc4sb.com (10.146.103.243)
 by smtp.notes.na.collabserv.com (10.106.227.88) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 28 May 2020 09:37:03 -0000
Received: from us1a3-mail120.a3.dal06.isc4sb.com ([10.146.45.191])
 by us1a3-smtp06.a3.dal06.isc4sb.com
 with ESMTP id 2020052809370203-257051 ;
 Thu, 28 May 2020 09:37:02 +0000 
MIME-Version: 1.0
In-Reply-To: <1590573018-5201-3-git-send-email-atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH V4 2/2] tools/perf: Add perf tools support for extended
 register capability in powerpc
To: "Athira Rajeev" <atrajeev@linux.vnet.ibm.com>
From: "Nageswara R Sastry" <nasastry@in.ibm.com>
Date: Thu, 28 May 2020 15:07:00 +0530
References: <1590573018-5201-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <1590573018-5201-3-git-send-email-atrajeev@linux.vnet.ibm.com>
X-KeepSent: 55F0D394:4FEBDB60-65258576:00347011;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Build V1001FP3_08092019 August 09, 2019
X-LLNOutbound: False
X-Disclaimed: 41131
X-TNEFEvaluated: 1
Content-type: multipart/alternative; 
 Boundary="0__=EABB0FE5DFA7F6818f9e8a93df938690918cEABB0FE5DFA7F681"
Content-Disposition: inline
x-cbid: 20052809-3067-0000-0000-00000344D47B
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.417846; ST=0; TS=0; UL=0; ISC=; MB=0.000015
X-IBM-SpamModules-Versions: BY=3.00013180; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000295; SDB=6.01383239; UDB=6.00739728; IPR=6.01165512; 
 MB=3.00032355; MTD=3.00000008; XFM=3.00000015; UTC=2020-05-28 09:37:06
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-05-28 07:45:26 - 6.00011415
x-cbparentid: 20052809-3068-0000-0000-00006A46F587
Message-Id: <OF55F0D394.4FEBDB60-ON65258576.00347011-65258576.0034D3BA@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-05-28_02:2020-05-28,
 2020-05-27 signatures=0
X-Proofpoint-Spam-Reason: orgsafe
X-Mailman-Approved-At: Thu, 28 May 2020 23:03:26 +1000
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
Cc: maddy@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--0__=EABB0FE5DFA7F6818f9e8a93df938690918cEABB0FE5DFA7F681
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII


"Athira Rajeev" <atrajeev@linux.vnet.ibm.com> wrote on 27/05/2020 03:20:18
PM:

> From: "Athira Rajeev" <atrajeev@linux.vnet.ibm.com>
> To: linuxppc-dev@lists.ozlabs.org
> Cc: linux-kernel@vger.kernel.org, ravi.bangoria@linux.ibm.com,
> maddy@linux.vnet.ibm.com, acme@kernel.org, anju@linux.vnet.ibm.com,
> jolsa@kernel.org, mpe@ellerman.id.au, atrajeev@linux.vnet.ibm.com
> Date: 28/05/2020 02:46 PM
> Subject: [PATCH V4 2/2] tools/perf: Add perf tools support for
> extended register capability in powerpc
>
> From: Anju T Sudhakar <anju@linux.vnet.ibm.com>
>
> Add extended regs to sample=5Freg=5Fmask in the tool side to use
> with `-I?` option. Perf tools side uses extended mask to display
> the platform supported register names (with -I? option) to the user
> and also send this mask to the kernel to capture the extended registers
> in each sample. Hence decide the mask value based on the processor
> version.
>
> Signed-off-by: Anju T Sudhakar <anju@linux.vnet.ibm.com>
> [Decide extended mask at run time based on platform]
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> Reviewed-by: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>

Tested-by: Nageswara R Sastry <nasastry@in.ibm.com>
Tested with 5.7.0-rc2
Tested the following scenarios
1. perf record -I
2. perf report -D  # in output check for the registers
3. perf record -I<register name>
4. perf record -I<non existing register name>
5. perf record -I<non existing register name with special characters>
6. perf record -I<register name> -e <different event names>

> ---
>  tools/arch/powerpc/include/uapi/asm/perf=5Fregs.h | 14 ++++++-
>  tools/perf/arch/powerpc/include/perf=5Fregs.h     |  5 ++-
>  tools/perf/arch/powerpc/util/perf=5Fregs.c        | 55 ++++++++++++++
> +++++++++++
>  3 files changed, 72 insertions(+), 2 deletions(-)
>
> diff --git a/tools/arch/powerpc/include/uapi/asm/perf=5Fregs.h b/
> tools/arch/powerpc/include/uapi/asm/perf=5Fregs.h
> index f599064..485b1d5 100644
> --- a/tools/arch/powerpc/include/uapi/asm/perf=5Fregs.h
> +++ b/tools/arch/powerpc/include/uapi/asm/perf=5Fregs.h
> @@ -48,6 +48,18 @@ enum perf=5Fevent=5Fpowerpc=5Fregs {
>     PERF=5FREG=5FPOWERPC=5FDSISR,
>     PERF=5FREG=5FPOWERPC=5FSIER,
>     PERF=5FREG=5FPOWERPC=5FMMCRA,
> -   PERF=5FREG=5FPOWERPC=5FMAX,
> +   /* Extended registers */
> +   PERF=5FREG=5FPOWERPC=5FMMCR0,
> +   PERF=5FREG=5FPOWERPC=5FMMCR1,
> +   PERF=5FREG=5FPOWERPC=5FMMCR2,
> +   /* Max regs without the extended regs */
> +   PERF=5FREG=5FPOWERPC=5FMAX =3D PERF=5FREG=5FPOWERPC=5FMMCRA + 1,
>  };
> +
> +#define PERF=5FREG=5FPMU=5FMASK   ((1ULL << PERF=5FREG=5FPOWERPC=5FMAX) =
- 1)
> +
> +/* PERF=5FREG=5FEXTENDED=5FMASK value for CPU=5FFTR=5FARCH=5F300 */
> +#define PERF=5FREG=5FPMU=5FMASK=5F300   (((1ULL << (PERF=5FREG=5FPOWERPC=
=5FMMCR2
> + 1)) - 1) \
> +            - PERF=5FREG=5FPMU=5FMASK)
> +
>  #endif /* =5FUAPI=5FASM=5FPOWERPC=5FPERF=5FREGS=5FH */
> diff --git a/tools/perf/arch/powerpc/include/perf=5Fregs.h b/tools/
> perf/arch/powerpc/include/perf=5Fregs.h
> index e18a355..46ed00d 100644
> --- a/tools/perf/arch/powerpc/include/perf=5Fregs.h
> +++ b/tools/perf/arch/powerpc/include/perf=5Fregs.h
> @@ -64,7 +64,10 @@
>     [PERF=5FREG=5FPOWERPC=5FDAR] =3D "dar",
>     [PERF=5FREG=5FPOWERPC=5FDSISR] =3D "dsisr",
>     [PERF=5FREG=5FPOWERPC=5FSIER] =3D "sier",
> -   [PERF=5FREG=5FPOWERPC=5FMMCRA] =3D "mmcra"
> +   [PERF=5FREG=5FPOWERPC=5FMMCRA] =3D "mmcra",
> +   [PERF=5FREG=5FPOWERPC=5FMMCR0] =3D "mmcr0",
> +   [PERF=5FREG=5FPOWERPC=5FMMCR1] =3D "mmcr1",
> +   [PERF=5FREG=5FPOWERPC=5FMMCR2] =3D "mmcr2",
>  };
>
>  static inline const char *perf=5Freg=5Fname(int id)
> diff --git a/tools/perf/arch/powerpc/util/perf=5Fregs.c b/tools/perf/
> arch/powerpc/util/perf=5Fregs.c
> index 0a52429..9179230 100644
> --- a/tools/perf/arch/powerpc/util/perf=5Fregs.c
> +++ b/tools/perf/arch/powerpc/util/perf=5Fregs.c
> @@ -6,9 +6,14 @@
>
>  #include "../../../util/perf=5Fregs.h"
>  #include "../../../util/debug.h"
> +#include "../../../util/event.h"
> +#include "../../../util/header.h"
> +#include "../../../perf-sys.h"
>
>  #include <linux/kernel.h>
>
> +#define PVR=5FPOWER9      0x004E
> +
>  const struct sample=5Freg sample=5Freg=5Fmasks[] =3D {
>     SMPL=5FREG(r0, PERF=5FREG=5FPOWERPC=5FR0),
>     SMPL=5FREG(r1, PERF=5FREG=5FPOWERPC=5FR1),
> @@ -55,6 +60,9 @@
>     SMPL=5FREG(dsisr, PERF=5FREG=5FPOWERPC=5FDSISR),
>     SMPL=5FREG(sier, PERF=5FREG=5FPOWERPC=5FSIER),
>     SMPL=5FREG(mmcra, PERF=5FREG=5FPOWERPC=5FMMCRA),
> +   SMPL=5FREG(mmcr0, PERF=5FREG=5FPOWERPC=5FMMCR0),
> +   SMPL=5FREG(mmcr1, PERF=5FREG=5FPOWERPC=5FMMCR1),
> +   SMPL=5FREG(mmcr2, PERF=5FREG=5FPOWERPC=5FMMCR2),
>     SMPL=5FREG=5FEND
>  };
>
> @@ -163,3 +171,50 @@ int arch=5Fsdt=5Farg=5Fparse=5Fop(char *old=5Fop, ch=
ar
**new=5Fop)
>
>     return SDT=5FARG=5FVALID;
>  }
> +
> +uint64=5Ft arch=5F=5Fintr=5Freg=5Fmask(void)
> +{
> +   struct perf=5Fevent=5Fattr attr =3D {
> +      .type                   =3D PERF=5FTYPE=5FHARDWARE,
> +      .config                 =3D PERF=5FCOUNT=5FHW=5FCPU=5FCYCLES,
> +      .sample=5Ftype            =3D PERF=5FSAMPLE=5FREGS=5FINTR,
> +      .precise=5Fip             =3D 1,
> +      .disabled               =3D 1,
> +      .exclude=5Fkernel         =3D 1,
> +   };
> +   int fd, ret;
> +   char buffer[64];
> +   u32 version;
> +   u64 extended=5Fmask =3D 0;
> +
> +   /* Get the PVR value to set the extended
> +    * mask specific to platform
> +    */
> +   get=5Fcpuid(buffer, sizeof(buffer));
> +   ret =3D sscanf(buffer, "%u,", &version);
> +
> +   if (ret !=3D 1) {
> +      pr=5Fdebug("Failed to get the processor version, unable to
> output extended registers\n");
> +      return PERF=5FREGS=5FMASK;
> +   }
> +
> +   if (version =3D=3D PVR=5FPOWER9)
> +      extended=5Fmask =3D PERF=5FREG=5FPMU=5FMASK=5F300;
> +   else
> +      return PERF=5FREGS=5FMASK;
> +
> +   attr.sample=5Fregs=5Fintr =3D extended=5Fmask;
> +   attr.sample=5Fperiod =3D 1;
> +   event=5Fattr=5Finit(&attr);
> +
> +   /*
> +    * check if the pmu supports perf extended regs, before
> +    * returning the register mask to sample.
> +    */
> +   fd =3D sys=5Fperf=5Fevent=5Fopen(&attr, 0, -1, -1, 0);
> +   if (fd !=3D -1) {
> +      close(fd);
> +      return (extended=5Fmask | PERF=5FREGS=5FMASK);
> +   }
> +   return PERF=5FREGS=5FMASK;
> +}
> --
> 1.8.3.1
>

--0__=EABB0FE5DFA7F6818f9e8a93df938690918cEABB0FE5DFA7F681
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p><tt><font size=3D"2">&quot;Athira Rajeev&quot; &lt;atrajeev@=
linux.vnet.ibm.com&gt; wrote on 27/05/2020 03:20:18 PM:<br><br>&gt; From: &=
quot;Athira Rajeev&quot; &lt;atrajeev@linux.vnet.ibm.com&gt;</font></tt><br=
><tt><font size=3D"2">&gt; To: linuxppc-dev@lists.ozlabs.org</font></tt><br=
><tt><font size=3D"2">&gt; Cc: linux-kernel@vger.kernel.org, ravi.bangoria@=
linux.ibm.com, <br>&gt; maddy@linux.vnet.ibm.com, acme@kernel.org, anju@lin=
ux.vnet.ibm.com, <br>&gt; jolsa@kernel.org, mpe@ellerman.id.au, atrajeev@li=
nux.vnet.ibm.com</font></tt><br><tt><font size=3D"2">&gt; Date: 28/05/2020 =
02:46 PM</font></tt><br><tt><font size=3D"2">&gt; Subject: [PATCH V4 2/2] t=
ools/perf: Add perf tools support for <br>&gt; extended register capability=
 in powerpc</font></tt><br><tt><font size=3D"2">&gt; <br>&gt; From: Anju T =
Sudhakar &lt;anju@linux.vnet.ibm.com&gt;<br>&gt; <br>&gt; Add extended regs=
 to sample=5Freg=5Fmask in the tool side to use<br>&gt; with `-I?` option. =
Perf tools side uses extended mask to display<br>&gt; the platform supporte=
d register names (with -I? option) to the user<br>&gt; and also send this m=
ask to the kernel to capture the extended registers<br>&gt; in each sample.=
 Hence decide the mask value based on the processor<br>&gt; version.<br>&gt=
; <br>&gt; Signed-off-by: Anju T Sudhakar &lt;anju@linux.vnet.ibm.com&gt;<b=
r>&gt; [Decide extended mask at run time based on platform]<br>&gt; Signed-=
off-by: Athira Rajeev &lt;atrajeev@linux.vnet.ibm.com&gt;<br>&gt; Reviewed-=
by: Madhavan Srinivasan &lt;maddy@linux.vnet.ibm.com&gt;</font></tt><br><br=
><tt><font size=3D"2">Tested-by: Nageswara R Sastry &lt;nasastry@in.ibm.com=
&gt;</font></tt><br><tt><font size=3D"2">Tested with 5.7.0-rc2</font></tt><=
br><tt><font size=3D"2">Tested the following scenarios</font></tt><br><tt><=
font size=3D"2">1. perf record -I<br>2. perf report -D &nbsp;# in output ch=
eck for the registers<br>3. perf record -I&lt;register name&gt;<br>4. perf =
record -I&lt;non existing register name&gt;<br>5. perf record -I&lt;non exi=
sting register name with special characters&gt;<br>6. perf record -I&lt;reg=
ister name&gt; -e &lt;different event names&gt;</font></tt><br><tt><font si=
ze=3D"2"><br>&gt; ---<br>&gt; &nbsp;tools/arch/powerpc/include/uapi/asm/per=
f=5Fregs.h | 14 ++++++-<br>&gt; &nbsp;tools/perf/arch/powerpc/include/perf=
=5Fregs.h &nbsp; &nbsp; | &nbsp;5 ++-<br>&gt; &nbsp;tools/perf/arch/powerpc=
/util/perf=5Fregs.c &nbsp; &nbsp; &nbsp; &nbsp;| 55 ++++++++++++++<br>&gt; =
+++++++++++<br>&gt; &nbsp;3 files changed, 72 insertions(+), 2 deletions(-)=
<br>&gt; <br>&gt; diff --git a/tools/arch/powerpc/include/uapi/asm/perf=5Fr=
egs.h b/<br>&gt; tools/arch/powerpc/include/uapi/asm/perf=5Fregs.h<br>&gt; =
index f599064..485b1d5 100644<br>&gt; --- a/tools/arch/powerpc/include/uapi=
/asm/perf=5Fregs.h<br>&gt; +++ b/tools/arch/powerpc/include/uapi/asm/perf=
=5Fregs.h<br>&gt; @@ -48,6 +48,18 @@ enum perf=5Fevent=5Fpowerpc=5Fregs {<b=
r>&gt; &nbsp; &nbsp; PERF=5FREG=5FPOWERPC=5FDSISR,<br>&gt; &nbsp; &nbsp; PE=
RF=5FREG=5FPOWERPC=5FSIER,<br>&gt; &nbsp; &nbsp; PERF=5FREG=5FPOWERPC=5FMMC=
RA,<br>&gt; - &nbsp; PERF=5FREG=5FPOWERPC=5FMAX,<br>&gt; + &nbsp; /* Extend=
ed registers */<br>&gt; + &nbsp; PERF=5FREG=5FPOWERPC=5FMMCR0,<br>&gt; + &n=
bsp; PERF=5FREG=5FPOWERPC=5FMMCR1,<br>&gt; + &nbsp; PERF=5FREG=5FPOWERPC=5F=
MMCR2,<br>&gt; + &nbsp; /* Max regs without the extended regs */<br>&gt; + =
&nbsp; PERF=5FREG=5FPOWERPC=5FMAX =3D PERF=5FREG=5FPOWERPC=5FMMCRA + 1,<br>=
&gt; &nbsp;};<br>&gt; +<br>&gt; +#define PERF=5FREG=5FPMU=5FMASK &nbsp; ((1=
ULL &lt;&lt; PERF=5FREG=5FPOWERPC=5FMAX) - 1)<br>&gt; +<br>&gt; +/* PERF=5F=
REG=5FEXTENDED=5FMASK value for CPU=5FFTR=5FARCH=5F300 */<br>&gt; +#define =
PERF=5FREG=5FPMU=5FMASK=5F300 &nbsp; (((1ULL &lt;&lt; (PERF=5FREG=5FPOWERPC=
=5FMMCR2 <br>&gt; + 1)) - 1) \<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;- PERF=5FREG=5FPMU=5FMASK)<br>&gt; +<br>&gt; &nbsp;#endif /* =5FUAPI=
=5FASM=5FPOWERPC=5FPERF=5FREGS=5FH */<br>&gt; diff --git a/tools/perf/arch/=
powerpc/include/perf=5Fregs.h b/tools/<br>&gt; perf/arch/powerpc/include/pe=
rf=5Fregs.h<br>&gt; index e18a355..46ed00d 100644<br>&gt; --- a/tools/perf/=
arch/powerpc/include/perf=5Fregs.h<br>&gt; +++ b/tools/perf/arch/powerpc/in=
clude/perf=5Fregs.h<br>&gt; @@ -64,7 +64,10 @@<br>&gt; &nbsp; &nbsp; [PERF=
=5FREG=5FPOWERPC=5FDAR] =3D &quot;dar&quot;,<br>&gt; &nbsp; &nbsp; [PERF=5F=
REG=5FPOWERPC=5FDSISR] =3D &quot;dsisr&quot;,<br>&gt; &nbsp; &nbsp; [PERF=
=5FREG=5FPOWERPC=5FSIER] =3D &quot;sier&quot;,<br>&gt; - &nbsp; [PERF=5FREG=
=5FPOWERPC=5FMMCRA] =3D &quot;mmcra&quot;<br>&gt; + &nbsp; [PERF=5FREG=5FPO=
WERPC=5FMMCRA] =3D &quot;mmcra&quot;,<br>&gt; + &nbsp; [PERF=5FREG=5FPOWERP=
C=5FMMCR0] =3D &quot;mmcr0&quot;,<br>&gt; + &nbsp; [PERF=5FREG=5FPOWERPC=5F=
MMCR1] =3D &quot;mmcr1&quot;,<br>&gt; + &nbsp; [PERF=5FREG=5FPOWERPC=5FMMCR=
2] =3D &quot;mmcr2&quot;,<br>&gt; &nbsp;};<br>&gt; <br>&gt; &nbsp;static in=
line const char *perf=5Freg=5Fname(int id)<br>&gt; diff --git a/tools/perf/=
arch/powerpc/util/perf=5Fregs.c b/tools/perf/<br>&gt; arch/powerpc/util/per=
f=5Fregs.c<br>&gt; index 0a52429..9179230 100644<br>&gt; --- a/tools/perf/a=
rch/powerpc/util/perf=5Fregs.c<br>&gt; +++ b/tools/perf/arch/powerpc/util/p=
erf=5Fregs.c<br>&gt; @@ -6,9 +6,14 @@<br>&gt; <br>&gt; &nbsp;#include &quot=
;../../../util/perf=5Fregs.h&quot;<br>&gt; &nbsp;#include &quot;../../../ut=
il/debug.h&quot;<br>&gt; +#include &quot;../../../util/event.h&quot;<br>&gt=
; +#include &quot;../../../util/header.h&quot;<br>&gt; +#include &quot;../.=
./../perf-sys.h&quot;<br>&gt; <br>&gt; &nbsp;#include &lt;linux/kernel.h&gt=
;<br>&gt; <br>&gt; +#define PVR=5FPOWER9 &nbsp; &nbsp; &nbsp;0x004E<br>&gt;=
 +<br>&gt; &nbsp;const struct sample=5Freg sample=5Freg=5Fmasks[] =3D {<br>=
&gt; &nbsp; &nbsp; SMPL=5FREG(r0, PERF=5FREG=5FPOWERPC=5FR0),<br>&gt; &nbsp=
; &nbsp; SMPL=5FREG(r1, PERF=5FREG=5FPOWERPC=5FR1),<br>&gt; @@ -55,6 +60,9 =
@@<br>&gt; &nbsp; &nbsp; SMPL=5FREG(dsisr, PERF=5FREG=5FPOWERPC=5FDSISR),<b=
r>&gt; &nbsp; &nbsp; SMPL=5FREG(sier, PERF=5FREG=5FPOWERPC=5FSIER),<br>&gt;=
 &nbsp; &nbsp; SMPL=5FREG(mmcra, PERF=5FREG=5FPOWERPC=5FMMCRA),<br>&gt; + &=
nbsp; SMPL=5FREG(mmcr0, PERF=5FREG=5FPOWERPC=5FMMCR0),<br>&gt; + &nbsp; SMP=
L=5FREG(mmcr1, PERF=5FREG=5FPOWERPC=5FMMCR1),<br>&gt; + &nbsp; SMPL=5FREG(m=
mcr2, PERF=5FREG=5FPOWERPC=5FMMCR2),<br>&gt; &nbsp; &nbsp; SMPL=5FREG=5FEND=
<br>&gt; &nbsp;};<br>&gt; <br>&gt; @@ -163,3 +171,50 @@ int arch=5Fsdt=5Far=
g=5Fparse=5Fop(char *old=5Fop, char **new=5Fop)<br>&gt; <br>&gt; &nbsp; &nb=
sp; return SDT=5FARG=5FVALID;<br>&gt; &nbsp;}<br>&gt; +<br>&gt; +uint64=5Ft=
 arch=5F=5Fintr=5Freg=5Fmask(void)<br>&gt; +{<br>&gt; + &nbsp; struct perf=
=5Fevent=5Fattr attr =3D {<br>&gt; + &nbsp; &nbsp; &nbsp;.type &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D PERF=5FTYPE=5FHARDWA=
RE,<br>&gt; + &nbsp; &nbsp; &nbsp;.config &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; =3D PERF=5FCOUNT=5FHW=5FCPU=5FCYCLES,<br>&gt; + &nbs=
p; &nbsp; &nbsp;.sample=5Ftype &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D=
 PERF=5FSAMPLE=5FREGS=5FINTR,<br>&gt; + &nbsp; &nbsp; &nbsp;.precise=5Fip &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 1,<br>&gt; + &nbsp; &nbsp; &nb=
sp;.disabled &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 1,<br>&gt=
; + &nbsp; &nbsp; &nbsp;.exclude=5Fkernel &nbsp; &nbsp; &nbsp; &nbsp; =3D 1=
,<br>&gt; + &nbsp; };<br>&gt; + &nbsp; int fd, ret;<br>&gt; + &nbsp; char b=
uffer[64];<br>&gt; + &nbsp; u32 version;<br>&gt; + &nbsp; u64 extended=5Fma=
sk =3D 0;<br>&gt; +<br>&gt; + &nbsp; /* Get the PVR value to set the extend=
ed<br>&gt; + &nbsp; &nbsp;* mask specific to platform<br>&gt; + &nbsp; &nbs=
p;*/<br>&gt; + &nbsp; get=5Fcpuid(buffer, sizeof(buffer));<br>&gt; + &nbsp;=
 ret =3D sscanf(buffer, &quot;%u,&quot;, &amp;version);<br>&gt; +<br>&gt; +=
 &nbsp; if (ret !=3D 1) {<br>&gt; + &nbsp; &nbsp; &nbsp;pr=5Fdebug(&quot;Fa=
iled to get the processor version, unable to <br>&gt; output extended regis=
ters\n&quot;);<br>&gt; + &nbsp; &nbsp; &nbsp;return PERF=5FREGS=5FMASK;<br>=
&gt; + &nbsp; }<br>&gt; +<br>&gt; + &nbsp; if (version =3D=3D PVR=5FPOWER9)=
<br>&gt; + &nbsp; &nbsp; &nbsp;extended=5Fmask =3D PERF=5FREG=5FPMU=5FMASK=
=5F300;<br>&gt; + &nbsp; else<br>&gt; + &nbsp; &nbsp; &nbsp;return PERF=5FR=
EGS=5FMASK;<br>&gt; +<br>&gt; + &nbsp; attr.sample=5Fregs=5Fintr =3D extend=
ed=5Fmask;<br>&gt; + &nbsp; attr.sample=5Fperiod =3D 1;<br>&gt; + &nbsp; ev=
ent=5Fattr=5Finit(&amp;attr);<br>&gt; +<br>&gt; + &nbsp; /*<br>&gt; + &nbsp=
; &nbsp;* check if the pmu supports perf extended regs, before<br>&gt; + &n=
bsp; &nbsp;* returning the register mask to sample.<br>&gt; + &nbsp; &nbsp;=
*/<br>&gt; + &nbsp; fd =3D sys=5Fperf=5Fevent=5Fopen(&amp;attr, 0, -1, -1, =
0);<br>&gt; + &nbsp; if (fd !=3D -1) {<br>&gt; + &nbsp; &nbsp; &nbsp;close(=
fd);<br>&gt; + &nbsp; &nbsp; &nbsp;return (extended=5Fmask | PERF=5FREGS=5F=
MASK);<br>&gt; + &nbsp; }<br>&gt; + &nbsp; return PERF=5FREGS=5FMASK;<br>&g=
t; +}<br>&gt; -- <br>&gt; 1.8.3.1<br>&gt; <br></font></tt><BR>
</body></html>

--0__=EABB0FE5DFA7F6818f9e8a93df938690918cEABB0FE5DFA7F681--

