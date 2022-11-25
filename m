Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C697638285
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Nov 2022 03:43:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NJK1g0X3Pz3cd4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Nov 2022 13:43:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OOroD5gp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OOroD5gp;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NJK0c5JGXz3f4p
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Nov 2022 13:42:56 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AP11dXV026900;
	Fri, 25 Nov 2022 02:42:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=TOk7xL//C9cRcOBfqRI/sp7yEi/zoTm2LKH1VntiAMw=;
 b=OOroD5gp5jAB/TWZpAi6ifEsdC5Qje53IF+0wEvIcWCOUEdBiUQnDckrX9MFP3fCXDZY
 pE0/VczZj1AIVeJjhKPEe2yeMWiUPU7Z1sZ5O1xYALK62QgUEy2njskKoZH8Xj1E+Fi1
 8d8a2Arwqal4XDzqhoJrAUls4YbMU3tV+fffgoU2tLlWV9YKer+4VXRu5Nt3M/YHAZZN
 7RjGmNrzCmjEUVHMftjHXfZldhaXhQdqocgq14Jv3unRmMJ6hbEzMpUwt99neC/PtQxf
 f+06UQTUKZPn+aCFu8YMtYE2hCYND8XW4S+3GdGpysYFFr1JleyNBHu4P4IAcox28SEE Ag== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m2k6ua7e3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Nov 2022 02:42:45 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AP2giTa028536;
	Fri, 25 Nov 2022 02:42:44 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m2k6ua7dm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Nov 2022 02:42:44 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AP2Zsxs014446;
	Fri, 25 Nov 2022 02:42:42 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma06ams.nl.ibm.com with ESMTP id 3kxpdj0xvy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Nov 2022 02:42:41 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AP2gdNI52494596
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Nov 2022 02:42:39 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B13D1A405C;
	Fri, 25 Nov 2022 02:42:39 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5B268A405B;
	Fri, 25 Nov 2022 02:42:39 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri, 25 Nov 2022 02:42:39 +0000 (GMT)
Received: from [10.61.2.128] (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id BBE3E6005B;
	Fri, 25 Nov 2022 13:42:35 +1100 (AEDT)
Message-ID: <773fc15ae2f350c7586a8181c9fe2ca53814cc4b.camel@linux.ibm.com>
Subject: Re: [PATCH v10 5/9] cxl: Use radix__flush_all_mm instead of generic
 flush_all_mm
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Benjamin Gray <bgray@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Date: Fri, 25 Nov 2022 13:42:35 +1100
In-Reply-To: <20221109045112.187069-6-bgray@linux.ibm.com>
References: <20221109045112.187069-1-bgray@linux.ibm.com>
	 <20221109045112.187069-6-bgray@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1 (3.46.1-1.fc37) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: m1uICyajKwRU0KZCkS1kxuTQ0cRNGjDP
X-Proofpoint-ORIG-GUID: 3Uw_8tyJtdZCaow2KgGUW7H04stG8z3u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-24_14,2022-11-24_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 mlxscore=0 spamscore=0 phishscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 mlxlogscore=725 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2211250017
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
Cc: jniethe5@gmail.com, npiggin@gmail.com, cmr@bluescreens.de, fbarrat@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2022-11-09 at 15:51 +1100, Benjamin Gray wrote:
> The generic implementation of this function isn't really generic
> (Hash
> is not implemented). Unfortunately, the runtime warnings cannot be
> replaced with BUILD_BUG's, so it seems safer not to provide a stub in
> the first place.
>=20
> Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>

[+ Fred]

This seems fine to me.

Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>

> ---
> v10:=C2=A0=C2=A0=C2=A0=C2=A0* New in v10 to remove hash__flush_all_mm,
> hash__local_flush_all_mm
> ---
> =C2=A0arch/powerpc/include/asm/mmu_context.h | 6 +++---
> =C2=A01 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/mmu_context.h
> b/arch/powerpc/include/asm/mmu_context.h
> index c1ea270bb848..57f5017111f4 100644
> --- a/arch/powerpc/include/asm/mmu_context.h
> +++ b/arch/powerpc/include/asm/mmu_context.h
> @@ -151,8 +151,8 @@ static inline void mm_context_remove_copro(struct
> mm_struct *mm)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * nMMU and/or PSL need t=
o be cleaned up.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Both the 'copros' and =
'active_cpus' counts are looked at
> in
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * flush_all_mm() to determine=
 the scope (local/global) of
> the
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * TLBIs, so we need to flush =
first before decrementing
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * radix__flush_all_mm() to de=
termine the scope
> (local/global)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * of the TLBIs, so we need to=
 flush first before
> decrementing
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * 'copros'. If this API =
is used by several callers for the
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * same context, it can l=
ead to over-flushing. It's hopefully
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * not common enough to b=
e a problem.
> @@ -164,7 +164,7 @@ static inline void mm_context_remove_copro(struct
> mm_struct *mm)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * in-between.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (radix_enabled()) {
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0flush_all_mm(mm);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0radix__flush_all_mm(mm);
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0c =3D atomic_dec_if_positive(&mm->context.copros);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0/* Detect imbalance between add and remove */

--=20
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited
