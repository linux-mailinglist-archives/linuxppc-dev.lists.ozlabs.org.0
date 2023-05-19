Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2072A708FE9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 May 2023 08:31:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QMxnv522Zz3fHN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 May 2023 16:31:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=inB3dteE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=inB3dteE;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QMxn03zLhz3f7W
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 May 2023 16:30:59 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34J6EjlJ028489;
	Fri, 19 May 2023 06:30:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=Nfs66LzAnHvE57Xngnbd2IkZW7oKWssPmRiExjFJzfk=;
 b=inB3dteEUEKMgzA6LbKk+fSk0LjAKZjmf3QG5CgePkH3eBC+oC9n9Rp6c41sggminxvD
 18g8QPL2MB4K39Q1gR3VKQxn99C7+asuun+ihRfvmUuhjyjqW8l1zhn+WTpAiUPsSF2E
 F34/LgKYw4bxapDDUY+JX2O+zwJPHvsnlR8kH+DehtT8N2qFAFAQUFE/bYn5G01ZWkB0
 JwdT3N6k/PWTeGwSdvlKEXm8fNzkeAeAaIzVdvRpYRWKafggM0N3dS1/o+Si0dTm4YrW
 RqJaR6nV27x/mjUTSunbh/L2GEHvdp6ONABou8bG7Rn4Qix/86QgMW99jMIqP9zHj7lD zA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qp2vysen6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 May 2023 06:30:06 +0000
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34J6GPOI001298;
	Fri, 19 May 2023 06:30:06 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qp2vysej1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 May 2023 06:30:05 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 34J3tih4031373;
	Fri, 19 May 2023 06:30:02 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3qj264u139-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 May 2023 06:30:02 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 34J6TxZ010420934
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 19 May 2023 06:29:59 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5AA2420043;
	Fri, 19 May 2023 06:29:59 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5D27220040;
	Fri, 19 May 2023 06:29:58 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 19 May 2023 06:29:58 +0000 (GMT)
Received: from [10.61.2.107] (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 514E2600A8;
	Fri, 19 May 2023 16:29:55 +1000 (AEST)
Message-ID: <d63250048e4b224973b5a8d50e4c92547d4a9c34.camel@linux.ibm.com>
Subject: Re: [PATCH] mm: kfence: Fix false positives on big endian
From: Benjamin Gray <bgray@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
        Andrew Morton
	 <akpm@linux-foundation.org>,
        David Laight <David.Laight@ACULAB.COM>
Date: Fri, 19 May 2023 16:29:43 +1000
In-Reply-To: <87o7mgzyw1.fsf@mail.lhotse>
References: <20230505035127.195387-1-mpe@ellerman.id.au>
	 <826f836f41db41eeb0fc32061994ac39@AcuMS.aculab.com>
	 <20230517152028.86b6d2d5afa4541b4269131b@linux-foundation.org>
	 <87o7mgzyw1.fsf@mail.lhotse>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: p0t0azZCbbe8nBx9wVLF6WwuwZif2W3Z
X-Proofpoint-GUID: 2e0BP1duRbj9IgAbPgXGuR7mm33ijuw0
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-19_03,2023-05-17_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 adultscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 mlxscore=0
 impostorscore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305190052
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
Cc: "zhangpeng.00@bytedance.com" <zhangpeng.00@bytedance.com>, "elver@google.com" <elver@google.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "glider@google.com" <glider@google.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2023-05-19 at 15:14 +1000, Michael Ellerman wrote:
> Andrew Morton <akpm@linux-foundation.org> writes:
> > On Fri, 5 May 2023 16:02:17 +0000 David Laight
> > <David.Laight@ACULAB.COM> wrote:
> >=20
> > > From: Michael Ellerman
> > > > Sent: 05 May 2023 04:51
> > > >=20
> > > > Since commit 1ba3cbf3ec3b ("mm: kfence: improve the performance
> > > > of
> > > > __kfence_alloc() and __kfence_free()"), kfence reports failures
> > > > in
> > > > random places at boot on big endian machines.
> > > >=20
> > > > The problem is that the new KFENCE_CANARY_PATTERN_U64 encodes
> > > > the
> > > > address of each byte in its value, so it needs to be byte
> > > > swapped on big
> > > > endian machines.
> > > >=20
> > > > The compiler is smart enough to do the le64_to_cpu() at compile
> > > > time, so
> > > > there is no runtime overhead.
> > > >=20
> > > > Fixes: 1ba3cbf3ec3b ("mm: kfence: improve the performance of
> > > > __kfence_alloc() and __kfence_free()")
> > > > Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> > > > ---
> > > > =C2=A0mm/kfence/kfence.h | 2 +-
> > > > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> > > >=20
> > > > diff --git a/mm/kfence/kfence.h b/mm/kfence/kfence.h
> > > > index 2aafc46a4aaf..392fb273e7bd 100644
> > > > --- a/mm/kfence/kfence.h
> > > > +++ b/mm/kfence/kfence.h
> > > > @@ -29,7 +29,7 @@
> > > > =C2=A0 * canary of every 8 bytes is the same. 64-bit memory can be
> > > > filled and checked
> > > > =C2=A0 * at a time instead of byte by byte to improve performance.
> > > > =C2=A0 */
> > > > -#define KFENCE_CANARY_PATTERN_U64 ((u64)0xaaaaaaaaaaaaaaaa ^
> > > > (u64)(0x0706050403020100))
> > > > +#define KFENCE_CANARY_PATTERN_U64 ((u64)0xaaaaaaaaaaaaaaaa ^
> > > > (u64)(le64_to_cpu(0x0706050403020100)))
> > >=20
> > > What at the (u64) casts for?
> > > The constants should probably have a ul (or ull) suffix.
> > >=20
> >=20
> > I tried that, didn't fix the sparse warnings described at
> > https://lkml.kernel.org/r/202305132244.DwzBUcUd-lkp@intel.com.
> >=20
> > Michael, have you looked into this?
>=20
> I haven't sorry, been chasing other bugs.
>=20
> > I'll merge it upstream - I guess we can live with the warnings for
> > a while.
>=20
> Thanks, yeah spurious WARNs are more of a pain than some sparse
> warnings.
>=20
> Maybe using le64_to_cpu() is too fancy, could just do it with an
> ifdef? eg.
>=20
> diff --git a/mm/kfence/kfence.h b/mm/kfence/kfence.h
> index 392fb273e7bd..510355a5382b 100644
> --- a/mm/kfence/kfence.h
> +++ b/mm/kfence/kfence.h
> @@ -29,7 +29,11 @@
> =C2=A0 * canary of every 8 bytes is the same. 64-bit memory can be filled
> and checked
> =C2=A0 * at a time instead of byte by byte to improve performance.
> =C2=A0 */
> -#define KFENCE_CANARY_PATTERN_U64 ((u64)0xaaaaaaaaaaaaaaaa ^
> (u64)(le64_to_cpu(0x0706050403020100)))
> +#ifdef __LITTLE_ENDIAN__
> +#define KFENCE_CANARY_PATTERN_U64 (0xaaaaaaaaaaaaaaaaULL ^
> 0x0706050403020100ULL)
> +#else
> +#define KFENCE_CANARY_PATTERN_U64 (0xaaaaaaaaaaaaaaaaULL ^
> 0x0001020304050607ULL)
> +#endif
> =C2=A0
> =C2=A0/* Maximum stack depth for reports. */
> =C2=A0#define KFENCE_STACK_DEPTH 64
>=20
>=20
> cheers

(for the sparse errors)

As I understand, we require memory to look like "00 01 02 03 04 05 06
07" such that iterating byte-by-byte gives 00, 01, etc. (with
everything XORed with aaa...)

I think it would be most semantically correct to use cpu_to_le64 on
KFENCE_CANARY_PATTERN_U64 and annotate the values being compared
against it as __le64.=C2=A0This is because we want the integer literal
0x0706050403020100 to be stored as "00 01 02 03 04 05 06 07", which is
the definition of little endian.

Masking this with an #ifdef leaves the type as cpu endian, which could
result in future issues.

(or I've just misunderstood and can disregard this)
