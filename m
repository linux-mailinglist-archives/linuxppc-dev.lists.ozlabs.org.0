Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CDC3E243E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Aug 2021 09:42:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ggy9j17dtz3cnJ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Aug 2021 17:42:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=r/W3FJUD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=in.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=puvichakravarthy@in.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=r/W3FJUD; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ggv4l6zklz3027
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Aug 2021 15:22:47 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17658spW151455; Fri, 6 Aug 2021 01:22:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=to : cc : subject : from
 : message-id : date : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=/z2VZhBHIQCXilpUgdfVc+K/UD4OWhoaNmS4y9K9bUM=;
 b=r/W3FJUDAtfaHiAi0daliPebl6uNc5NzJfQRvD2ezY4YkIyG9rKdqDJgwGCm1qzubshf
 KMzOjxPlGu/QycdGFEFjm+HhJT81h0auymKnbKiX2zHlRgFuMkLTNvR77xI5Yh4z3jAf
 CkElB45tvY9CN1qP46qeYC//v3Qvop6SsiCEtGrsAXsaKgvxFn9kaW/04aS0KU75uYAM
 nNK1TDS1uY7lmZcyXrZRcYaiUN+L5lV2pjAXmIzdq5thmw+NGXIuFshTrhEuXmH9N8sQ
 gZVjfi6acVQ3xjNLnb9Sqr8An2qCXJgWz9HVz7+O0C7hkxq5I5PngvhMrWITGazhYfdB zg== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a83gqfxb7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Aug 2021 01:22:37 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1765Ik96019520;
 Fri, 6 Aug 2021 05:22:37 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma02wdc.us.ibm.com with ESMTP id 3a6nhy7pvr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Aug 2021 05:22:37 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1765MZbo50332000
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 6 Aug 2021 05:22:36 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D5C8E6A066;
 Fri,  6 Aug 2021 05:22:35 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CA0B86A05A;
 Fri,  6 Aug 2021 05:22:35 +0000 (GMT)
Received: from mww0882.dal12m.mail.ibm.com (unknown [9.208.88.142])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Fri,  6 Aug 2021 05:22:35 +0000 (GMT)
To: aneesh.kumar@linux.ibm.com
Subject: Re: [RFC PATCH] powerpc/book3s64/radix: Upgrade va tlbie to PID tlbie
 if we cross PMD_SIZE
From: "Puvichakravarthy Ramachandran" <puvichakravarthy@in.ibm.com>
Message-ID: <OFE4737EA1.C7459055-ON00258729.001AF95B-65258729.001D8729@ibm.com>
Date: Fri, 6 Aug 2021 10:52:32 +0530
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-KeepSent: E4737EA1:C7459055-00258729:001AF95B; name=$KeepSent; type=4
X-Mailer: HCL Notes Build V1101FP3_03312021 SHF15 May 21, 2021
X-Disclaimed: 9819
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: qxCcCjxOWmTIGsvQpj-HWcX4j-z7v9BC
X-Proofpoint-GUID: qxCcCjxOWmTIGsvQpj-HWcX4j-z7v9BC
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-06_01:2021-08-05,
 2021-08-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 bulkscore=0
 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0 adultscore=0
 mlxscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108060032
X-Mailman-Approved-At: Fri, 06 Aug 2021 17:41:54 +1000
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

I evaluated the patches from Aneesh with a micro benchmark which does=20
shmat, shmdt of 256 MB segment.
Higher the rate of work, better the performance. With a value of 32, we=20
match the performance of=20
GTSE=3Doff. This was evaluated on SLES15 SP3 kernel.


# cat /sys/kernel/debug/powerpc/tlb=5Fsingle=5Fpage=5Fflush=5Fceiling=20
32

# perf stat -I 1000 -a -e powerpc:tlbie,r30058 ./tlbie -i 5 -c 1 t 1
 Rate of work: =3D 311=20
#           time             counts unit events
     1.013131404              50939      powerpc:tlbie  =20
     1.013131404              50658      r30058 =20
 Rate of work: =3D 318=20
     2.026957019              51520      powerpc:tlbie  =20
     2.026957019              51481      r30058 =20
 Rate of work: =3D 318=20
     3.038884431              51485      powerpc:tlbie  =20
     3.038884431              51461      r30058 =20
 Rate of work: =3D 318=20
     4.051483926              51485      powerpc:tlbie  =20
     4.051483926              51520      r30058 =20
 Rate of work: =3D 318=20
     5.063635713              48577      powerpc:tlbie  =20
     5.063635713              48347      r30058 =20
=20
# echo 34 > /sys/kernel/debug/powerpc/tlb=5Fsingle=5Fpage=5Fflush=5Fceiling=
=20

# perf stat -I 1000 -a -e powerpc:tlbie,r30058 ./tlbie -i 5 -c 1 t 1
 Rate of work: =3D 174=20
#           time             counts unit events
     1.012672696             721471      powerpc:tlbie  =20
     1.012672696             726491      r30058 =20
 Rate of work: =3D 177=20
     2.026348661             737460      powerpc:tlbie  =20
     2.026348661             736138      r30058 =20
 Rate of work: =3D 178=20
     3.037932122             737460      powerpc:tlbie  =20
     3.037932122             737460      r30058 =20
 Rate of work: =3D 178=20
     4.050198819             737044      powerpc:tlbie  =20
     4.050198819             737460      r30058 =20
 Rate of work: =3D 177=20
     5.062400776             692832      powerpc:tlbie  =20
     5.062400776             688319      r30058         =20


Regards,
Puvichakravarthy Ramachandran



