Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 153DD6915D6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Feb 2023 01:46:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PCZmW6ZvBz3cdC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Feb 2023 11:46:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JxRZ2wss;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JxRZ2wss;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PCZlY3qHCz3bf7
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Feb 2023 11:45:29 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31A0KKuM028206;
	Fri, 10 Feb 2023 00:45:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=HNjO3rAJRFru6xsI7socoZLiUxDF8uEACllAfNjdtsY=;
 b=JxRZ2wss+hQuyW4VDhke1c+TyCHzDq0g30zcL0YUMqdYoNOQxRXo6/d5fHeq7Dl/xCSP
 ApW4/DKrN6osy+1EoksNwswp7GrWmCJbfIQl14QbNaTBJj5MGHepnpYIqcX0kEkDjGIo
 K1uzBsYEjld3Gak1/qs8UDAi4SdnXbRiofFvRbNW5Ukp3VNWnEtfZR4Otl8fTpN3kDvW
 urm/tl/oDm5r5DMCYpmpZ2anHo96dw1V4fixp+aWzyvR3U4RAu6B3OT1PSvQza4BshPd
 r2bCQ9BEGLlYFDj+iyiY45FXXTjOfvqSlQLy36dSNEn215EzzQ0SIlCrT0eMuaR+/iZ+ qQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nnb9yreu1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Feb 2023 00:45:23 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31A0UXFm000824;
	Fri, 10 Feb 2023 00:45:22 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nnb9yret8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Feb 2023 00:45:22 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 319CniW4022560;
	Fri, 10 Feb 2023 00:45:21 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3nhemfpugq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Feb 2023 00:45:21 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 31A0jIiW28770804
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Feb 2023 00:45:18 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C64262004D;
	Fri, 10 Feb 2023 00:45:18 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C023F20040;
	Fri, 10 Feb 2023 00:45:17 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 10 Feb 2023 00:45:17 +0000 (GMT)
Received: from [10.61.2.107] (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 806C860394;
	Fri, 10 Feb 2023 11:45:12 +1100 (AEDT)
Message-ID: <50d7c326e1eb65e996ee1a99139e4b50c06fadb3.camel@linux.ibm.com>
Subject: Re: [PATCH 1/3] powerpc/code-patching: Add generic memory patching
From: Benjamin Gray <bgray@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        "linuxppc-dev@lists.ozlabs.org"
	 <linuxppc-dev@lists.ozlabs.org>
Date: Fri, 10 Feb 2023 11:45:12 +1100
In-Reply-To: <39ef8e60-679e-a244-8273-67e50671e513@csgroup.eu>
References: <20230207015643.590684-1-bgray@linux.ibm.com>
	 <20230207015643.590684-2-bgray@linux.ibm.com>
	 <39ef8e60-679e-a244-8273-67e50671e513@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: WFsX1mSZj6mGWE9ppsYi5m4URfPJ5nnz
X-Proofpoint-ORIG-GUID: 7mf6Onqw3xxDYOo8Awv0vjpfaeQawwQd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-09_16,2023-02-09_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 mlxlogscore=999
 malwarescore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302100002
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
Cc: "erhard_f@mailbox.org" <erhard_f@mailbox.org>, "npiggin@gmail.com" <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2023-02-09 at 07:15 +0000, Christophe Leroy wrote:
> > +static inline int patch_uint(u32 *addr, unsigned int val)
> > +{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return patch_instruction(add=
r, ppc_inst(val));
>=20
> Would it make more sense that patch_instruction() calls patch_uint()=20
> instead of the reverse ?
>=20

That's what I had originally, but I figured it would be nicer to see
'patch_instruction' in the disassembly given it's still the main usage.
It's equivalent otherwise though.

> > diff --git a/arch/powerpc/lib/code-patching.c
> > b/arch/powerpc/lib/code-patching.c
> > index b00112d7ad46..0f7e9949faf0 100644
> > --- a/arch/powerpc/lib/code-patching.c
> > +++ b/arch/powerpc/lib/code-patching.c
> > @@ -20,16 +20,14 @@
> > =C2=A0 #include <asm/code-patching.h>
> > =C2=A0 #include <asm/inst.h>
> > =C2=A0=20
> > -static int __patch_instruction(u32 *exec_addr, ppc_inst_t instr,
> > u32 *patch_addr)
> > +static int __patch_memory(void *exec_addr, unsigned long val, void
> > *patch_addr,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 bool is_dword)
> > =C2=A0 {
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!ppc_inst_prefixed(instr=
)) {
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0u32 val =3D ppc_inst_val(instr);
> > -
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0__put_kernel_nofault(patch_addr, &val, u32,
> > failed);
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0} else {
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0u64 val =3D ppc_inst_as_ulong(instr);
> > -
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (IS_ENABLED(CONFIG_PPC64)=
 && unlikely(is_dword)) {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0__put_kernel_nofault(patch_addr, &val, u64,
> > failed);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0} else {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0unsigned int val32 =3D val;
>=20
> Why unsigned int and not u32 as before ?
>=20

No particular reason, I just tend to use int/long over 32/64 in code
compiled on 32 bit as well and there was a long period of time between
removing the original vars and fixing the big endian issue.

> > +#ifdef CONFIG_PPC64
> > +
> > +int patch_instruction(u32 *addr, ppc_inst_t instr)
> > +{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (ppc_inst_prefixed(instr)=
)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0return patch_memory(addr, ppc_inst_as_ulong(instr),
> > true);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0else
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0return patch_memory(addr, ppc_inst_val(instr),
> > false);
> > +}
> > +NOKPROBE_SYMBOL(patch_instruction)
> > +
> > +int patch_uint(void *addr, unsigned int val)
> > +{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return patch_memory(addr, va=
l, false);
> > +}
> > +NOKPROBE_SYMBOL(patch_uint)
> > +
> > +int patch_ulong(void *addr, unsigned long val)
> > +{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return patch_memory(addr, va=
l, true);
> > +}
> > +NOKPROBE_SYMBOL(patch_ulong)
> > +
> > +#else
> > +
> > +noinline int patch_instruction(u32 *addr, ppc_inst_t instr)
> > +{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return patch_memory(addr, pp=
c_inst_val(instr), false);
> > +}
>=20
> A comment explaining the reason for the noinline would be welcome
> here.

Yeah makes sense

> By the way, would the noinline change anything on PPC64 ? If not we=20
> could have a common function as ppc_inst_prefixed() constant folds to
> false in PPC32.

On ppc64 that prevents patch_branch() from calling patch_memory()
directly with is_dword=3Dfalse.
