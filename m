Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 74EE51E61C8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 May 2020 15:09:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Xp1W4w8QzDqX7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 May 2020 23:09:03 +1000 (AEST)
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
 header.s=pp1 header.b=bhlWmyn1; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Xkp45S1HzDqVR
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 May 2020 20:43:56 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04S9Wq2B032046
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 May 2020 05:32:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=mime-version :
 in-reply-to : subject : to : cc : from : date : references : content-type
 : message-id; s=pp1; bh=HEcJecpkQpK5EoXJ+hKZ+X2FYcf9lqG6Z/QvurBVlAA=;
 b=bhlWmyn1U+R2WUrqMaNWie2mgh/UnG7UmvZ7JaVTMABgWvDGxFe5r6CNM1/9B1wOaBCA
 So2MNkr4lwMhQEPKleJAkwRAEZKzmUMmal2xJUukcJsrzuXh4c8HlQNH7CSOf/z5lWeu
 eAAwmYKGtbbqGORZxhv/gzfGytzdhdYxNc8zKnwOtJnrEJN8av+j0bNWt0iVQTfi9lEd
 CzANo56KAcatiawhSIRb2zFrHwAyC5Cxm+VhzBr3iHUvMFMU/qQc6jG8c8WFRkWWYyea
 7rAK4fJWzu3qknEeH+xONL8TKnrMbvfprLcmWb7o/1eUKOr1l6RcyZxOyQPFAcqrKFs6 4A== 
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.90])
 by mx0a-001b2d01.pphosted.com with ESMTP id 316ygd4m5e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 May 2020 05:32:57 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <linuxppc-dev@lists.ozlabs.org> from <nasastry@in.ibm.com>;
 Thu, 28 May 2020 09:32:42 -0000
Received: from us1a3-smtp03.a3.dal06.isc4sb.com (10.106.154.98)
 by smtp.notes.na.collabserv.com (10.106.227.141) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 28 May 2020 09:32:38 -0000
Received: from us1a3-mail120.a3.dal06.isc4sb.com ([10.146.45.191])
 by us1a3-smtp03.a3.dal06.isc4sb.com
 with ESMTP id 2020052809323820-267537 ;
 Thu, 28 May 2020 09:32:38 +0000 
MIME-Version: 1.0
In-Reply-To: <1590573018-5201-2-git-send-email-atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH V4 1/2] powerpc/perf: Add support for outputting extended
 regs in perf intr_regs
To: "Athira Rajeev" <atrajeev@linux.vnet.ibm.com>
From: "Nageswara R Sastry" <nasastry@in.ibm.com>
Date: Thu, 28 May 2020 15:02:36 +0530
References: <1590573018-5201-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <1590573018-5201-2-git-send-email-atrajeev@linux.vnet.ibm.com>
X-KeepSent: C215EAC7:37BAA4C8-65258576:00343CF0;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Build V1001FP3_08092019 August 09, 2019
X-LLNOutbound: False
X-Disclaimed: 52155
X-TNEFEvaluated: 1
Content-type: multipart/alternative; 
 Boundary="0__=EABB0FE5DFA7BA608f9e8a93df938690918cEABB0FE5DFA7BA60"
Content-Disposition: inline
x-cbid: 20052809-3649-0000-0000-0000031DC4B4
X-IBM-SpamModules-Scores: BY=0.019565; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.433748; ST=0; TS=0; UL=0; ISC=; MB=0.000042
X-IBM-SpamModules-Versions: BY=3.00013180; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000295; SDB=6.01383237; UDB=6.00739727; IPR=6.01165510; 
 MB=3.00032355; MTD=3.00000008; XFM=3.00000015; UTC=2020-05-28 09:32:41
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-05-28 08:09:56 - 6.00011415
x-cbparentid: 20052809-3650-0000-0000-00006D4AE676
Message-Id: <OFC215EAC7.37BAA4C8-ON65258576.00343CF0-65258576.00346C85@notes.na.collabserv.com>
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


--0__=EABB0FE5DFA7BA608f9e8a93df938690918cEABB0FE5DFA7BA60
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII


"Linuxppc-dev" <linuxppc-dev-bounces
+maddy=3Dlinux.vnet.ibm.com@lists.ozlabs.org> wrote on 27/05/2020 03:20:17
PM:

> From: "Athira Rajeev" <atrajeev@linux.vnet.ibm.com>
> To: linuxppc-dev@lists.ozlabs.org
> Cc: ravi.bangoria@linux.ibm.com, atrajeev@linux.vnet.ibm.com,
> maddy@linux.vnet.ibm.com, linux-kernel@vger.kernel.org,
> acme@kernel.org, anju@linux.vnet.ibm.com, jolsa@kernel.org
> Date: 28/05/2020 02:46 PM
> Subject: [PATCH V4 1/2] powerpc/perf: Add support for outputting
> extended regs in perf intr=5Fregs
> Sent by: "Linuxppc-dev" <linuxppc-dev-bounces
> +maddy=3Dlinux.vnet.ibm.com@lists.ozlabs.org>
>
> From: Anju T Sudhakar <anju@linux.vnet.ibm.com>
>
> Add support for perf extended register capability in powerpc.
> The capability flag PERF=5FPMU=5FCAP=5FEXTENDED=5FREGS, is used to indica=
te the
> PMU which support extended registers. The generic code define the mask
> of extended registers as 0 for non supported architectures.
>
> Patch adds extended regs support for power9 platform by
> exposing MMCR0, MMCR1 and MMCR2 registers.
>
> REG=5FRESERVED mask needs update to include extended regs.
> `PERF=5FREG=5FEXTENDED=5FMASK`, contains mask value of the supported regi=
sters,
> is defined at runtime in the kernel based on platform since the supported
> registers may differ from one processor version to another and hence the
> MASK value.
>
> with patch
> ----------
>
> available registers: r0 r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11
> r12 r13 r14 r15 r16 r17 r18 r19 r20 r21 r22 r23 r24 r25 r26
> r27 r28 r29 r30 r31 nip msr orig=5Fr3 ctr link xer ccr softe
> trap dar dsisr sier mmcra mmcr0 mmcr1 mmcr2
>
> PERF=5FRECORD=5FSAMPLE(IP, 0x1): 4784/4784: 0 period: 1 addr: 0
> ... intr regs: mask 0xffffffffffff ABI 64-bit
> .... r0    0xc00000000012b77c
> .... r1    0xc000003fe5e03930
> .... r2    0xc000000001b0e000
> .... r3    0xc000003fdcddf800
> .... r4    0xc000003fc7880000
> .... r5    0x9c422724be
> .... r6    0xc000003fe5e03908
> .... r7    0xffffff63bddc8706
> .... r8    0x9e4
> .... r9    0x0
> .... r10   0x1
> .... r11   0x0
> .... r12   0xc0000000001299c0
> .... r13   0xc000003ffffc4800
> .... r14   0x0
> .... r15   0x7fffdd8b8b00
> .... r16   0x0
> .... r17   0x7fffdd8be6b8
> .... r18   0x7e7076607730
> .... r19   0x2f
> .... r20   0xc00000001fc26c68
> .... r21   0xc0002041e4227e00
> .... r22   0xc00000002018fb60
> .... r23   0x1
> .... r24   0xc000003ffec4d900
> .... r25   0x80000000
> .... r26   0x0
> .... r27   0x1
> .... r28   0x1
> .... r29   0xc000000001be1260
> .... r30   0x6008010
> .... r31   0xc000003ffebb7218
> .... nip   0xc00000000012b910
> .... msr   0x9000000000009033
> .... orig=5Fr3 0xc00000000012b86c
> .... ctr   0xc0000000001299c0
> .... link  0xc00000000012b77c
> .... xer   0x0
> .... ccr   0x28002222
> .... softe 0x1
> .... trap  0xf00
> .... dar   0x0
> .... dsisr 0x80000000000
> .... sier  0x0
> .... mmcra 0x80000000000
> .... mmcr0 0x82008090
> .... mmcr1 0x1e000000
> .... mmcr2 0x0
>  ... thread: perf:4784
>
> Signed-off-by: Anju T Sudhakar <anju@linux.vnet.ibm.com>
> [Defined PERF=5FREG=5FEXTENDED=5FMASK at run time to add support for
> different platforms ]
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> Reviewed-by: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>

Tested with 5.7.0-rc2
Tested-by: Nageswara R Sastry <nasastry@in.ibm.com>


> ---
>  arch/powerpc/include/asm/perf=5Fevent=5Fserver.h |  8 +++++++
>  arch/powerpc/include/uapi/asm/perf=5Fregs.h    | 14 +++++++++++-
>  arch/powerpc/perf/core-book3s.c              |  1 +
>  arch/powerpc/perf/perf=5Fregs.c                | 34 +++++++++++++++++
> ++++++++---
>  arch/powerpc/perf/power9-pmu.c               |  6 +++++
>  5 files changed, 59 insertions(+), 4 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/perf=5Fevent=5Fserver.h b/arch/
> powerpc/include/asm/perf=5Fevent=5Fserver.h
> index 3e9703f..1458e1a 100644
> --- a/arch/powerpc/include/asm/perf=5Fevent=5Fserver.h
> +++ b/arch/powerpc/include/asm/perf=5Fevent=5Fserver.h
> @@ -15,6 +15,9 @@
>  #define MAX=5FEVENT=5FALTERNATIVES   8
>  #define MAX=5FLIMITED=5FHWCOUNTERS   2
>
> +extern u64 mask=5Fvar;
> +#define PERF=5FREG=5FEXTENDED=5FMASK          mask=5Fvar
> +
>  struct perf=5Fevent;
>
>  /*
> @@ -55,6 +58,11 @@ struct power=5Fpmu {
>     int       *blacklist=5Fev;
>     /* BHRB entries in the PMU */
>     int      bhrb=5Fnr;
> +   /*
> +    * set this flag with `PERF=5FPMU=5FCAP=5FEXTENDED=5FREGS` if
> +    * the pmu supports extended perf regs capability
> +    */
> +   int      capabilities;
>  };
>
>  /*
> diff --git a/arch/powerpc/include/uapi/asm/perf=5Fregs.h b/arch/
> powerpc/include/uapi/asm/perf=5Fregs.h
> index f599064..485b1d5 100644
> --- a/arch/powerpc/include/uapi/asm/perf=5Fregs.h
> +++ b/arch/powerpc/include/uapi/asm/perf=5Fregs.h
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
> diff --git a/arch/powerpc/perf/core-book3s.c
b/arch/powerpc/perf/core-book3s.c
> index 3dcfecf..7f63edf 100644
> --- a/arch/powerpc/perf/core-book3s.c
> +++ b/arch/powerpc/perf/core-book3s.c
> @@ -2275,6 +2275,7 @@ int register=5Fpower=5Fpmu(struct power=5Fpmu *pmu)
>        pmu->name);
>
>     power=5Fpmu.attr=5Fgroups =3D ppmu->attr=5Fgroups;
> +   power=5Fpmu.capabilities |=3D (ppmu->capabilities &
> PERF=5FPMU=5FCAP=5FEXTENDED=5FREGS);
>
>  #ifdef MSR=5FHV
>     /*
> diff --git a/arch/powerpc/perf/perf=5Fregs.c
b/arch/powerpc/perf/perf=5Fregs.c
> index a213a0a..c8a7e8c 100644
> --- a/arch/powerpc/perf/perf=5Fregs.c
> +++ b/arch/powerpc/perf/perf=5Fregs.c
> @@ -13,9 +13,11 @@
>  #include <asm/ptrace.h>
>  #include <asm/perf=5Fregs.h>
>
> +u64 mask=5Fvar;
> +
>  #define PT=5FREGS=5FOFFSET(id, r) [id] =3D offsetof(struct pt=5Fregs, r)
>
> -#define REG=5FRESERVED (~((1ULL << PERF=5FREG=5FPOWERPC=5FMAX) - 1))
> +#define REG=5FRESERVED (~(PERF=5FREG=5FEXTENDED=5FMASK | PERF=5FREG=5FPM=
U=5FMASK))
>
>  static unsigned int pt=5Fregs=5Foffset[PERF=5FREG=5FPOWERPC=5FMAX] =3D {
>     PT=5FREGS=5FOFFSET(PERF=5FREG=5FPOWERPC=5FR0,  gpr[0]),
> @@ -69,10 +71,26 @@
>     PT=5FREGS=5FOFFSET(PERF=5FREG=5FPOWERPC=5FMMCRA, dsisr),
>  };
>
> +/* Function to return the extended register values */
> +static u64 get=5Fext=5Fregs=5Fvalue(int idx)
> +{
> +   switch (idx) {
> +   case PERF=5FREG=5FPOWERPC=5FMMCR0:
> +      return mfspr(SPRN=5FMMCR0);
> +   case PERF=5FREG=5FPOWERPC=5FMMCR1:
> +      return mfspr(SPRN=5FMMCR1);
> +   case PERF=5FREG=5FPOWERPC=5FMMCR2:
> +      return mfspr(SPRN=5FMMCR2);
> +   default: return 0;
> +   }
> +}
> +
>  u64 perf=5Freg=5Fvalue(struct pt=5Fregs *regs, int idx)
>  {
> -   if (WARN=5FON=5FONCE(idx >=3D PERF=5FREG=5FPOWERPC=5FMAX))
> -      return 0;
> +   u64 PERF=5FREG=5FEXTENDED=5FMAX;
> +
> +   if (cpu=5Fhas=5Ffeature(CPU=5FFTR=5FARCH=5F300))
> +      PERF=5FREG=5FEXTENDED=5FMAX =3D PERF=5FREG=5FPOWERPC=5FMMCR2 + 1;
>
>     if (idx =3D=3D PERF=5FREG=5FPOWERPC=5FSIER &&
>        (IS=5FENABLED(CONFIG=5FFSL=5FEMB=5FPERF=5FEVENT) ||
> @@ -85,6 +103,16 @@ u64 perf=5Freg=5Fvalue(struct pt=5Fregs *regs, int id=
x)
>         IS=5FENABLED(CONFIG=5FPPC32)))
>        return 0;
>
> +   if (idx >=3D PERF=5FREG=5FPOWERPC=5FMAX && idx < PERF=5FREG=5FEXTENDE=
D=5FMAX)
> +      return get=5Fext=5Fregs=5Fvalue(idx);
> +
> +   /*
> +    * If the idx is referring to value beyond the
> +    * supported registers, return 0 with a warning
> +    */
> +   if (WARN=5FON=5FONCE(idx >=3D PERF=5FREG=5FEXTENDED=5FMAX))
> +      return 0;
> +
>     return regs=5Fget=5Fregister(regs, pt=5Fregs=5Foffset[idx]);
>  }
>
> diff --git a/arch/powerpc/perf/power9-pmu.c
b/arch/powerpc/perf/power9-pmu.c
> index 08c3ef7..4525090 100644
> --- a/arch/powerpc/perf/power9-pmu.c
> +++ b/arch/powerpc/perf/power9-pmu.c
> @@ -90,6 +90,8 @@ enum {
>  #define POWER9=5FMMCRA=5FIFM3      0x00000000C0000000UL
>  #define POWER9=5FMMCRA=5FBHRB=5FMASK      0x00000000C0000000UL
>
> +extern u64 mask=5Fvar;
> +
>  /* Nasty Power9 specific hack */
>  #define PVR=5FPOWER9=5FCUMULUS      0x00002000
>
> @@ -434,6 +436,7 @@ static void power9=5Fconfig=5Fbhrb(u64 pmu=5Fbhrb=5Ff=
ilter)
>     .cache=5Fevents      =3D &power9=5Fcache=5Fevents,
>     .attr=5Fgroups      =3D power9=5Fpmu=5Fattr=5Fgroups,
>     .bhrb=5Fnr      =3D 32,
> +   .capabilities           =3D PERF=5FPMU=5FCAP=5FEXTENDED=5FREGS,
>  };
>
>  int init=5Fpower9=5Fpmu(void)
> @@ -457,6 +460,9 @@ int init=5Fpower9=5Fpmu(void)
>        }
>     }
>
> +   /* Set the PERF=5FREG=5FEXTENDED=5FMASK here */
> +   mask=5Fvar =3D PERF=5FREG=5FPMU=5FMASK=5F300;
> +
>     rc =3D register=5Fpower=5Fpmu(&power9=5Fpmu);
>     if (rc)
>        return rc;
> --
> 1.8.3.1
>

--0__=EABB0FE5DFA7BA608f9e8a93df938690918cEABB0FE5DFA7BA60
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p><tt><font size=3D"2">&quot;Linuxppc-dev&quot; &lt;linuxppc-d=
ev-bounces+maddy=3Dlinux.vnet.ibm.com@lists.ozlabs.org&gt; wrote on 27/05/2=
020 03:20:17 PM:<br><br>&gt; From: &quot;Athira Rajeev&quot; &lt;atrajeev@l=
inux.vnet.ibm.com&gt;</font></tt><br><tt><font size=3D"2">&gt; To: linuxppc=
-dev@lists.ozlabs.org</font></tt><br><tt><font size=3D"2">&gt; Cc: ravi.ban=
goria@linux.ibm.com, atrajeev@linux.vnet.ibm.com, <br>&gt; maddy@linux.vnet=
.ibm.com, linux-kernel@vger.kernel.org, <br>&gt; acme@kernel.org, anju@linu=
x.vnet.ibm.com, jolsa@kernel.org</font></tt><br><tt><font size=3D"2">&gt; D=
ate: 28/05/2020 02:46 PM</font></tt><br><tt><font size=3D"2">&gt; Subject: =
[PATCH V4 1/2] powerpc/perf: Add support for outputting <br>&gt; extended r=
egs in perf intr=5Fregs</font></tt><br><tt><font size=3D"2">&gt; Sent by: &=
quot;Linuxppc-dev&quot; &lt;linuxppc-dev-bounces<br>&gt; +maddy=3Dlinux.vne=
t.ibm.com@lists.ozlabs.org&gt;</font></tt><br><tt><font size=3D"2">&gt; <br=
>&gt; From: Anju T Sudhakar &lt;anju@linux.vnet.ibm.com&gt;<br>&gt; <br>&gt=
; Add support for perf extended register capability in powerpc.<br>&gt; The=
 capability flag PERF=5FPMU=5FCAP=5FEXTENDED=5FREGS, is used to indicate th=
e<br>&gt; PMU which support extended registers. The generic code define the=
 mask<br>&gt; of extended registers as 0 for non supported architectures.<b=
r>&gt; <br>&gt; Patch adds extended regs support for power9 platform by<br>=
&gt; exposing MMCR0, MMCR1 and MMCR2 registers.<br>&gt; <br>&gt; REG=5FRESE=
RVED mask needs update to include extended regs.<br>&gt; `PERF=5FREG=5FEXTE=
NDED=5FMASK`, contains mask value of the supported registers,<br>&gt; is de=
fined at runtime in the kernel based on platform since the supported<br>&gt=
; registers may differ from one processor version to another and hence the<=
br>&gt; MASK value.<br>&gt; <br>&gt; with patch<br>&gt; ----------<br>&gt; =
<br>&gt; available registers: r0 r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11<br>&gt;=
 r12 r13 r14 r15 r16 r17 r18 r19 r20 r21 r22 r23 r24 r25 r26<br>&gt; r27 r2=
8 r29 r30 r31 nip msr orig=5Fr3 ctr link xer ccr softe<br>&gt; trap dar dsi=
sr sier mmcra mmcr0 mmcr1 mmcr2<br>&gt; <br>&gt; PERF=5FRECORD=5FSAMPLE(IP,=
 0x1): 4784/4784: 0 period: 1 addr: 0<br>&gt; ... intr regs: mask 0xfffffff=
fffff ABI 64-bit<br>&gt; .... r0 &nbsp; &nbsp;0xc00000000012b77c<br>&gt; ..=
.. r1 &nbsp; &nbsp;0xc000003fe5e03930<br>&gt; .... r2 &nbsp; &nbsp;0xc00000=
0001b0e000<br>&gt; .... r3 &nbsp; &nbsp;0xc000003fdcddf800<br>&gt; .... r4 =
&nbsp; &nbsp;0xc000003fc7880000<br>&gt; .... r5 &nbsp; &nbsp;0x9c422724be<b=
r>&gt; .... r6 &nbsp; &nbsp;0xc000003fe5e03908<br>&gt; .... r7 &nbsp; &nbsp=
;0xffffff63bddc8706<br>&gt; .... r8 &nbsp; &nbsp;0x9e4<br>&gt; .... r9 &nbs=
p; &nbsp;0x0<br>&gt; .... r10 &nbsp; 0x1<br>&gt; .... r11 &nbsp; 0x0<br>&gt=
; .... r12 &nbsp; 0xc0000000001299c0<br>&gt; .... r13 &nbsp; 0xc000003ffffc=
4800<br>&gt; .... r14 &nbsp; 0x0<br>&gt; .... r15 &nbsp; 0x7fffdd8b8b00<br>=
&gt; .... r16 &nbsp; 0x0<br>&gt; .... r17 &nbsp; 0x7fffdd8be6b8<br>&gt; ...=
. r18 &nbsp; 0x7e7076607730<br>&gt; .... r19 &nbsp; 0x2f<br>&gt; .... r20 &=
nbsp; 0xc00000001fc26c68<br>&gt; .... r21 &nbsp; 0xc0002041e4227e00<br>&gt;=
 .... r22 &nbsp; 0xc00000002018fb60<br>&gt; .... r23 &nbsp; 0x1<br>&gt; ...=
. r24 &nbsp; 0xc000003ffec4d900<br>&gt; .... r25 &nbsp; 0x80000000<br>&gt; =
.... r26 &nbsp; 0x0<br>&gt; .... r27 &nbsp; 0x1<br>&gt; .... r28 &nbsp; 0x1=
<br>&gt; .... r29 &nbsp; 0xc000000001be1260<br>&gt; .... r30 &nbsp; 0x60080=
10<br>&gt; .... r31 &nbsp; 0xc000003ffebb7218<br>&gt; .... nip &nbsp; 0xc00=
000000012b910<br>&gt; .... msr &nbsp; 0x9000000000009033<br>&gt; .... orig=
=5Fr3 0xc00000000012b86c<br>&gt; .... ctr &nbsp; 0xc0000000001299c0<br>&gt;=
 .... link &nbsp;0xc00000000012b77c<br>&gt; .... xer &nbsp; 0x0<br>&gt; ...=
. ccr &nbsp; 0x28002222<br>&gt; .... softe 0x1<br>&gt; .... trap &nbsp;0xf0=
0<br>&gt; .... dar &nbsp; 0x0<br>&gt; .... dsisr 0x80000000000<br>&gt; ....=
 sier &nbsp;0x0<br>&gt; .... mmcra 0x80000000000<br>&gt; .... mmcr0 0x82008=
090<br>&gt; .... mmcr1 0x1e000000<br>&gt; .... mmcr2 0x0<br>&gt; &nbsp;... =
thread: perf:4784<br>&gt; <br>&gt; Signed-off-by: Anju T Sudhakar &lt;anju@=
linux.vnet.ibm.com&gt;<br>&gt; [Defined PERF=5FREG=5FEXTENDED=5FMASK at run=
 time to add support for <br>&gt; different platforms ]<br>&gt; Signed-off-=
by: Athira Rajeev &lt;atrajeev@linux.vnet.ibm.com&gt;<br>&gt; Reviewed-by: =
Madhavan Srinivasan &lt;maddy@linux.vnet.ibm.com&gt;</font></tt><br><br><tt=
><font size=3D"2">Tested with 5.7.0-rc2</font></tt><br><tt><font size=3D"2"=
>Tested-by: Nageswara R Sastry &lt;nasastry@in.ibm.com&gt;</font></tt><br><=
br><tt><font size=3D"2"><br>&gt; ---<br>&gt; &nbsp;arch/powerpc/include/asm=
/perf=5Fevent=5Fserver.h | &nbsp;8 +++++++<br>&gt; &nbsp;arch/powerpc/inclu=
de/uapi/asm/perf=5Fregs.h &nbsp; &nbsp;| 14 +++++++++++-<br>&gt; &nbsp;arch=
/powerpc/perf/core-book3s.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;| &nbsp;1 +<br>&gt; &nbsp;arch/powerpc/perf/perf=5Fregs.c &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| 34 +++++++++++++++++<br>&gt; +++++=
+++---<br>&gt; &nbsp;arch/powerpc/perf/power9-pmu.c &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; | &nbsp;6 +++++<br>&gt; &nbsp;5 files changed, 59=
 insertions(+), 4 deletions(-)<br>&gt; <br>&gt; diff --git a/arch/powerpc/i=
nclude/asm/perf=5Fevent=5Fserver.h b/arch/<br>&gt; powerpc/include/asm/perf=
=5Fevent=5Fserver.h<br>&gt; index 3e9703f..1458e1a 100644<br>&gt; --- a/arc=
h/powerpc/include/asm/perf=5Fevent=5Fserver.h<br>&gt; +++ b/arch/powerpc/in=
clude/asm/perf=5Fevent=5Fserver.h<br>&gt; @@ -15,6 +15,9 @@<br>&gt; &nbsp;#=
define MAX=5FEVENT=5FALTERNATIVES &nbsp; 8<br>&gt; &nbsp;#define MAX=5FLIMI=
TED=5FHWCOUNTERS &nbsp; 2<br>&gt; <br>&gt; +extern u64 mask=5Fvar;<br>&gt; =
+#define PERF=5FREG=5FEXTENDED=5FMASK &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;mas=
k=5Fvar<br>&gt; +<br>&gt; &nbsp;struct perf=5Fevent;<br>&gt; <br>&gt; &nbsp=
;/*<br>&gt; @@ -55,6 +58,11 @@ struct power=5Fpmu {<br>&gt; &nbsp; &nbsp; i=
nt &nbsp; &nbsp; &nbsp; *blacklist=5Fev;<br>&gt; &nbsp; &nbsp; /* BHRB entr=
ies in the PMU */<br>&gt; &nbsp; &nbsp; int &nbsp; &nbsp; &nbsp;bhrb=5Fnr;<=
br>&gt; + &nbsp; /*<br>&gt; + &nbsp; &nbsp;* set this flag with `PERF=5FPMU=
=5FCAP=5FEXTENDED=5FREGS` if<br>&gt; + &nbsp; &nbsp;* the pmu supports exte=
nded perf regs capability<br>&gt; + &nbsp; &nbsp;*/<br>&gt; + &nbsp; int &n=
bsp; &nbsp; &nbsp;capabilities;<br>&gt; &nbsp;};<br>&gt; <br>&gt; &nbsp;/*<=
br>&gt; diff --git a/arch/powerpc/include/uapi/asm/perf=5Fregs.h b/arch/<br=
>&gt; powerpc/include/uapi/asm/perf=5Fregs.h<br>&gt; index f599064..485b1d5=
 100644<br>&gt; --- a/arch/powerpc/include/uapi/asm/perf=5Fregs.h<br>&gt; +=
++ b/arch/powerpc/include/uapi/asm/perf=5Fregs.h<br>&gt; @@ -48,6 +48,18 @@=
 enum perf=5Fevent=5Fpowerpc=5Fregs {<br>&gt; &nbsp; &nbsp; PERF=5FREG=5FPO=
WERPC=5FDSISR,<br>&gt; &nbsp; &nbsp; PERF=5FREG=5FPOWERPC=5FSIER,<br>&gt; &=
nbsp; &nbsp; PERF=5FREG=5FPOWERPC=5FMMCRA,<br>&gt; - &nbsp; PERF=5FREG=5FPO=
WERPC=5FMAX,<br>&gt; + &nbsp; /* Extended registers */<br>&gt; + &nbsp; PER=
F=5FREG=5FPOWERPC=5FMMCR0,<br>&gt; + &nbsp; PERF=5FREG=5FPOWERPC=5FMMCR1,<b=
r>&gt; + &nbsp; PERF=5FREG=5FPOWERPC=5FMMCR2,<br>&gt; + &nbsp; /* Max regs =
without the extended regs */<br>&gt; + &nbsp; PERF=5FREG=5FPOWERPC=5FMAX =
=3D PERF=5FREG=5FPOWERPC=5FMMCRA + 1,<br>&gt; &nbsp;};<br>&gt; +<br>&gt; +#=
define PERF=5FREG=5FPMU=5FMASK &nbsp; ((1ULL &lt;&lt; PERF=5FREG=5FPOWERPC=
=5FMAX) - 1)<br>&gt; +<br>&gt; +/* PERF=5FREG=5FEXTENDED=5FMASK value for C=
PU=5FFTR=5FARCH=5F300 */<br>&gt; +#define PERF=5FREG=5FPMU=5FMASK=5F300 &nb=
sp; (((1ULL &lt;&lt; (PERF=5FREG=5FPOWERPC=5FMMCR2 <br>&gt; + 1)) - 1) \<br=
>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;- PERF=5FREG=5FPMU=5FMASK)=
<br>&gt; +<br>&gt; &nbsp;#endif /* =5FUAPI=5FASM=5FPOWERPC=5FPERF=5FREGS=5F=
H */<br>&gt; diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/pe=
rf/core-book3s.c<br>&gt; index 3dcfecf..7f63edf 100644<br>&gt; --- a/arch/p=
owerpc/perf/core-book3s.c<br>&gt; +++ b/arch/powerpc/perf/core-book3s.c<br>=
&gt; @@ -2275,6 +2275,7 @@ int register=5Fpower=5Fpmu(struct power=5Fpmu *p=
mu)<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp;pmu-&gt;name);<br>&gt; <br>&gt; &nbs=
p; &nbsp; power=5Fpmu.attr=5Fgroups =3D ppmu-&gt;attr=5Fgroups;<br>&gt; + &=
nbsp; power=5Fpmu.capabilities |=3D (ppmu-&gt;capabilities &amp; <br>&gt; P=
ERF=5FPMU=5FCAP=5FEXTENDED=5FREGS);<br>&gt; <br>&gt; &nbsp;#ifdef MSR=5FHV<=
br>&gt; &nbsp; &nbsp; /*<br>&gt; diff --git a/arch/powerpc/perf/perf=5Fregs=
.c b/arch/powerpc/perf/perf=5Fregs.c<br>&gt; index a213a0a..c8a7e8c 100644<=
br>&gt; --- a/arch/powerpc/perf/perf=5Fregs.c<br>&gt; +++ b/arch/powerpc/pe=
rf/perf=5Fregs.c<br>&gt; @@ -13,9 +13,11 @@<br>&gt; &nbsp;#include &lt;asm/=
ptrace.h&gt;<br>&gt; &nbsp;#include &lt;asm/perf=5Fregs.h&gt;<br>&gt; <br>&=
gt; +u64 mask=5Fvar;<br>&gt; +<br>&gt; &nbsp;#define PT=5FREGS=5FOFFSET(id,=
 r) [id] =3D offsetof(struct pt=5Fregs, r)<br>&gt; <br>&gt; -#define REG=5F=
RESERVED (~((1ULL &lt;&lt; PERF=5FREG=5FPOWERPC=5FMAX) - 1))<br>&gt; +#defi=
ne REG=5FRESERVED (~(PERF=5FREG=5FEXTENDED=5FMASK | PERF=5FREG=5FPMU=5FMASK=
))<br>&gt; <br>&gt; &nbsp;static unsigned int pt=5Fregs=5Foffset[PERF=5FREG=
=5FPOWERPC=5FMAX] =3D {<br>&gt; &nbsp; &nbsp; PT=5FREGS=5FOFFSET(PERF=5FREG=
=5FPOWERPC=5FR0, &nbsp;gpr[0]),<br>&gt; @@ -69,10 +71,26 @@<br>&gt; &nbsp; =
&nbsp; PT=5FREGS=5FOFFSET(PERF=5FREG=5FPOWERPC=5FMMCRA, dsisr),<br>&gt; &nb=
sp;};<br>&gt; <br>&gt; +/* Function to return the extended register values =
*/<br>&gt; +static u64 get=5Fext=5Fregs=5Fvalue(int idx)<br>&gt; +{<br>&gt;=
 + &nbsp; switch (idx) {<br>&gt; + &nbsp; case PERF=5FREG=5FPOWERPC=5FMMCR0=
:<br>&gt; + &nbsp; &nbsp; &nbsp;return mfspr(SPRN=5FMMCR0);<br>&gt; + &nbsp=
; case PERF=5FREG=5FPOWERPC=5FMMCR1:<br>&gt; + &nbsp; &nbsp; &nbsp;return m=
fspr(SPRN=5FMMCR1);<br>&gt; + &nbsp; case PERF=5FREG=5FPOWERPC=5FMMCR2:<br>=
&gt; + &nbsp; &nbsp; &nbsp;return mfspr(SPRN=5FMMCR2);<br>&gt; + &nbsp; def=
ault: return 0;<br>&gt; + &nbsp; }<br>&gt; +}<br>&gt; +<br>&gt; &nbsp;u64 p=
erf=5Freg=5Fvalue(struct pt=5Fregs *regs, int idx)<br>&gt; &nbsp;{<br>&gt; =
- &nbsp; if (WARN=5FON=5FONCE(idx &gt;=3D PERF=5FREG=5FPOWERPC=5FMAX))<br>&=
gt; - &nbsp; &nbsp; &nbsp;return 0;<br>&gt; + &nbsp; u64 PERF=5FREG=5FEXTEN=
DED=5FMAX;<br>&gt; +<br>&gt; + &nbsp; if (cpu=5Fhas=5Ffeature(CPU=5FFTR=5FA=
RCH=5F300))<br>&gt; + &nbsp; &nbsp; &nbsp;PERF=5FREG=5FEXTENDED=5FMAX =3D P=
ERF=5FREG=5FPOWERPC=5FMMCR2 + 1;<br>&gt; <br>&gt; &nbsp; &nbsp; if (idx =3D=
=3D PERF=5FREG=5FPOWERPC=5FSIER &amp;&amp;<br>&gt; &nbsp; &nbsp; &nbsp; &nb=
sp;(IS=5FENABLED(CONFIG=5FFSL=5FEMB=5FPERF=5FEVENT) ||<br>&gt; @@ -85,6 +10=
3,16 @@ u64 perf=5Freg=5Fvalue(struct pt=5Fregs *regs, int idx)<br>&gt; &nb=
sp; &nbsp; &nbsp; &nbsp; IS=5FENABLED(CONFIG=5FPPC32)))<br>&gt; &nbsp; &nbs=
p; &nbsp; &nbsp;return 0;<br>&gt; <br>&gt; + &nbsp; if (idx &gt;=3D PERF=5F=
REG=5FPOWERPC=5FMAX &amp;&amp; idx &lt; PERF=5FREG=5FEXTENDED=5FMAX)<br>&gt=
; + &nbsp; &nbsp; &nbsp;return get=5Fext=5Fregs=5Fvalue(idx);<br>&gt; +<br>=
&gt; + &nbsp; /*<br>&gt; + &nbsp; &nbsp;* If the idx is referring to value =
beyond the<br>&gt; + &nbsp; &nbsp;* supported registers, return 0 with a wa=
rning<br>&gt; + &nbsp; &nbsp;*/<br>&gt; + &nbsp; if (WARN=5FON=5FONCE(idx &=
gt;=3D PERF=5FREG=5FEXTENDED=5FMAX))<br>&gt; + &nbsp; &nbsp; &nbsp;return 0=
;<br>&gt; +<br>&gt; &nbsp; &nbsp; return regs=5Fget=5Fregister(regs, pt=5Fr=
egs=5Foffset[idx]);<br>&gt; &nbsp;}<br>&gt; <br>&gt; diff --git a/arch/powe=
rpc/perf/power9-pmu.c b/arch/powerpc/perf/power9-pmu.c<br>&gt; index 08c3ef=
7..4525090 100644<br>&gt; --- a/arch/powerpc/perf/power9-pmu.c<br>&gt; +++ =
b/arch/powerpc/perf/power9-pmu.c<br>&gt; @@ -90,6 +90,8 @@ enum {<br>&gt; &=
nbsp;#define POWER9=5FMMCRA=5FIFM3 &nbsp; &nbsp; &nbsp;0x00000000C0000000UL=
<br>&gt; &nbsp;#define POWER9=5FMMCRA=5FBHRB=5FMASK &nbsp; &nbsp; &nbsp;0x0=
0000000C0000000UL<br>&gt; <br>&gt; +extern u64 mask=5Fvar;<br>&gt; +<br>&gt=
; &nbsp;/* Nasty Power9 specific hack */<br>&gt; &nbsp;#define PVR=5FPOWER9=
=5FCUMULUS &nbsp; &nbsp; &nbsp;0x00002000<br>&gt; <br>&gt; @@ -434,6 +436,7=
 @@ static void power9=5Fconfig=5Fbhrb(u64 pmu=5Fbhrb=5Ffilter)<br>&gt; &nb=
sp; &nbsp; .cache=5Fevents &nbsp; &nbsp; &nbsp;=3D &amp;power9=5Fcache=5Fev=
ents,<br>&gt; &nbsp; &nbsp; .attr=5Fgroups &nbsp; &nbsp; &nbsp;=3D power9=
=5Fpmu=5Fattr=5Fgroups,<br>&gt; &nbsp; &nbsp; .bhrb=5Fnr &nbsp; &nbsp; &nbs=
p;=3D 32,<br>&gt; + &nbsp; .capabilities &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 =3D PERF=5FPMU=5FCAP=5FEXTENDED=5FREGS,<br>&gt; &nbsp;};<br>&gt; <br>&gt; =
&nbsp;int init=5Fpower9=5Fpmu(void)<br>&gt; @@ -457,6 +460,9 @@ int init=5F=
power9=5Fpmu(void)<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp;}<br>&gt; &nbsp; &nbs=
p; }<br>&gt; <br>&gt; + &nbsp; /* Set the PERF=5FREG=5FEXTENDED=5FMASK here=
 */<br>&gt; + &nbsp; mask=5Fvar =3D PERF=5FREG=5FPMU=5FMASK=5F300;<br>&gt; =
+<br>&gt; &nbsp; &nbsp; rc =3D register=5Fpower=5Fpmu(&amp;power9=5Fpmu);<b=
r>&gt; &nbsp; &nbsp; if (rc)<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp;return rc;<=
br>&gt; -- <br>&gt; 1.8.3.1<br>&gt; <br></font></tt><BR>
</body></html>

--0__=EABB0FE5DFA7BA608f9e8a93df938690918cEABB0FE5DFA7BA60--

