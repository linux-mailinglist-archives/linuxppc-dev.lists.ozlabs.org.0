Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 376DC3E249C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Aug 2021 09:57:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GgyWR18hwz3cX0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Aug 2021 17:57:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=C9sJGTzl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=in.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=puvichakravarthy@in.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=C9sJGTzl; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GgyVv2XrYz307Z
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Aug 2021 17:57:10 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1767hsGK173941; Fri, 6 Aug 2021 03:57:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=to : cc : subject : from
 : message-id : date : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=0BH2xqetlBG6lv0Zh4Y+tDhCIjOHXrQYLAstUQSCNxo=;
 b=C9sJGTzlHbIuUvrScwT1mdFdsmZpWVk+GTk4xETEXntVPz4mZ8XTEwbde9e5HBqLPwp6
 kPtEJ/JBWPMn2ZUaY2MZgjRDpyllVwmW/otMuh/EuOkPszMApg8KerChDc7Q/FAJeSVh
 sF55nPWriq00/p5BJazWIeGsuqQ8ZBpd7fDxp17fGo61oJaExJXZdkwXGUlwWK7gLyxI
 3rWpc8Fe4J+dz2JyqmRzuunEIxTRf88/3BHa5DlhXCsYJyrPFG0SJpcUBJJLRB2a1Q+L
 5p9vVeedlkLqs1Po0er6w3QNdfpktQBfwOu/1dad3yTx58CnrhB2s+4G5NeXwpth3liR Lg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a83gqkb56-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Aug 2021 03:57:04 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1767hwhm174008;
 Fri, 6 Aug 2021 03:57:03 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a83gqkb4w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Aug 2021 03:57:03 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1767qLpJ021758;
 Fri, 6 Aug 2021 07:57:03 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma03dal.us.ibm.com with ESMTP id 3a7ankguf8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Aug 2021 07:57:03 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1767v1w113763170
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 6 Aug 2021 07:57:01 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D31B16A051;
 Fri,  6 Aug 2021 07:57:01 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BCA4E6A05F;
 Fri,  6 Aug 2021 07:57:01 +0000 (GMT)
Received: from mww0882.dal12m.mail.ibm.com (unknown [9.208.88.142])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Fri,  6 Aug 2021 07:57:01 +0000 (GMT)
To: aneesh.kumar@linux.ibm.com
Subject: Re: [RFC PATCH] powerpc/book3s64/radix: Upgrade va tlbie to PID tlbie
 if we cross PMD_SIZE
From: "Puvichakravarthy Ramachandran" <puvichakravarthy@in.ibm.com>
Message-ID: <OFAE67F802.E3873360-ON00258729.0020407B-65258729.002BAB12@ibm.com>
Date: Fri, 6 Aug 2021 13:26:59 +0530
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-KeepSent: AE67F802:E3873360-00258729:0020407B; name=$KeepSent; type=4
X-Mailer: HCL Notes Build V1101FP3_03312021 SHF15 May 21, 2021
X-Disclaimed: 37479
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: oZlSlJkPHOItQMM6ixANbhd1_4HBIX-M
X-Proofpoint-GUID: KsqYNgf2Y6fRzAdzaGmPc6QSv6YOTN9w
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-06_02:2021-08-05,
 2021-08-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0 adultscore=0
 mlxscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108060052
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
Cc: linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> With shared mapping, even though we are unmapping a large range, the=20
kernel
> will force a TLB flush with ptl lock held to avoid the race mentioned in
> commit 1cf35d47712d ("mm: split 'tlb=5Fflush=5Fmmu()' into tlb flushing a=
nd=20
memory freeing parts")
> This results in the kernel issuing a high number of TLB flushes even for =

a large
> range. This can be improved by making sure the kernel switch to pid=20
based flush if the
> kernel is unmapping a 2M range.
>=20
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  arch/powerpc/mm/book3s64/radix=5Ftlb.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/arch/powerpc/mm/book3s64/radix=5Ftlb.c=20
b/arch/powerpc/mm/book3s64/radix=5Ftlb.c
> index aefc100d79a7..21d0f098e43b 100644
> --- a/arch/powerpc/mm/book3s64/radix=5Ftlb.c
> +++ b/arch/powerpc/mm/book3s64/radix=5Ftlb.c
> @@ -1106,7 +1106,7 @@ EXPORT=5FSYMBOL(radix=5F=5Fflush=5Ftlb=5Fkernel=5Fr=
ange);
>   * invalidating a full PID, so it has a far lower threshold to change=20
from
>   * individual page flushes to full-pid flushes.
>   */
> -static unsigned long tlb=5Fsingle=5Fpage=5Fflush=5Fceiling =5F=5Fread=5F=
mostly =3D 33;
> +static unsigned long tlb=5Fsingle=5Fpage=5Fflush=5Fceiling =5F=5Fread=5F=
mostly =3D 32;
>  static unsigned long tlb=5Flocal=5Fsingle=5Fpage=5Fflush=5Fceiling =5F=
=5Fread=5Fmostly=20
=3D POWER9=5FTLB=5FSETS=5FRADIX * 2;
>=20
>  static inline void =5F=5Fradix=5F=5Fflush=5Ftlb=5Frange(struct mm=5Fstru=
ct *mm,
> @@ -1133,7 +1133,7 @@ static inline void =5F=5Fradix=5F=5Fflush=5Ftlb=5Fr=
ange(struct=20
mm=5Fstruct *mm,
>       if (fullmm)
>               flush=5Fpid =3D true;
>       else if (type =3D=3D FLUSH=5FTYPE=5FGLOBAL)
> -             flush=5Fpid =3D nr=5Fpages > tlb=5Fsingle=5Fpage=5Fflush=5F=
ceiling;
> +             flush=5Fpid =3D nr=5Fpages >=3D tlb=5Fsingle=5Fpage=5Fflush=
=5Fceiling;
>       else
>               flush=5Fpid =3D nr=5Fpages >=20
tlb=5Flocal=5Fsingle=5Fpage=5Fflush=5Fceiling;

Additional details on the test environment. This was tested on a 2 Node/8=20
socket Power10 system.
The LPAR had 105 cores and the LPAR spanned across all the sockets.=20

# perf stat -I 1000 -a -e cycles,instructions -e=20
"{cpu/config=3D0x030008,name=3DPM=5FEXEC=5FSTALL/}" -e=20
"{cpu/config=3D0x02E01C,name=3DPM=5FEXEC=5FSTALL=5FTLBIE/}" ./tlbie -i 10 -=
c 1  -t 1
 Rate of work: =3D 176=20
#           time             counts unit events
     1.029206442         4198594519      cycles =20
     1.029206442         2458254252      instructions              # 0.59=20
insn per cycle=20
     1.029206442         3004031488      PM=5FEXEC=5FSTALL  =20
     1.029206442         1798186036      PM=5FEXEC=5FSTALL=5FTLBIE  =20
 Rate of work: =3D 181=20
     2.054288539         4183883450      cycles =20
     2.054288539         2472178171      instructions              # 0.59=20
insn per cycle=20
     2.054288539         3014609313      PM=5FEXEC=5FSTALL  =20
     2.054288539         1797851642      PM=5FEXEC=5FSTALL=5FTLBIE  =20
 Rate of work: =3D 180=20
     3.078306883         4171250717      cycles =20
     3.078306883         2468341094      instructions              # 0.59=20
insn per cycle=20
     3.078306883         2993036205      PM=5FEXEC=5FSTALL  =20
     3.078306883         1798181890      PM=5FEXEC=5FSTALL=5FTLBIE  =20
.
.=20

# cat /sys/kernel/debug/powerpc/tlb=5Fsingle=5Fpage=5Fflush=5Fceiling
34

# echo 32 > /sys/kernel/debug/powerpc/tlb=5Fsingle=5Fpage=5Fflush=5Fceiling

# perf stat -I 1000 -a -e cycles,instructions -e=20
"{cpu/config=3D0x030008,name=3DPM=5FEXEC=5FSTALL/}" -e=20
"{cpu/config=3D0x02E01C,name=3DPM=5FEXEC=5FSTALL=5FTLBIE/}" ./tlbie -i 10 -=
c 1  -t 1
 Rate of work: =3D 313=20
#           time             counts unit events
     1.030310506         4206071143      cycles =20
     1.030310506         4314716958      instructions              # 1.03=20
insn per cycle=20
     1.030310506         2157762167      PM=5FEXEC=5FSTALL  =20
     1.030310506          110825573      PM=5FEXEC=5FSTALL=5FTLBIE  =20
 Rate of work: =3D 322=20
     2.056034068         4331745630      cycles =20
     2.056034068         4531658304      instructions              # 1.05=20
insn per cycle=20
     2.056034068         2288971361      PM=5FEXEC=5FSTALL  =20
     2.056034068          111267927      PM=5FEXEC=5FSTALL=5FTLBIE  =20
 Rate of work: =3D 321=20
     3.081216434         4327050349      cycles =20
     3.081216434         4379679508      instructions              # 1.01=20
insn per cycle=20
     3.081216434         2252602550      PM=5FEXEC=5FSTALL  =20
     3.081216434          110974887      PM=5FEXEC=5FSTALL=5FTLBIE  =20
.
.
=20

Regards,
Puvichakravarthy Ramachandran




