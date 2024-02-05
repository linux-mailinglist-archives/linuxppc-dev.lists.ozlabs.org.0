Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AD24F849266
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Feb 2024 03:32:01 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=m3Y3b4I+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TSr4H4WwQz3cVD
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Feb 2024 13:31:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=m3Y3b4I+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TSr3W0gmbz3brC
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Feb 2024 13:31:18 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 414MwiCQ008072;
	Mon, 5 Feb 2024 02:31:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=zRG2RhkHW2+gohe+erx1Gz4l4yPri0LNbxMSZC2OrF0=;
 b=m3Y3b4I+OnOd1Hf/lWHNABKP/a7DEn8Loxyf2mxWaLUSwtUbPTUOHPcbs9Yol8MwErvP
 /E9j5wak3D43QPH74BjHeo/6cymVmR9c7XG0t7hw2goFZ+HtjF3C0i66LEeLtNAJZsz4
 GkVoUXfoaiffj0x0Cplwl8QWPHq2yFO4bVGWsFUQPB5syfK4TqyvUTldbn5uL2/UcAlI
 uqkiCgNng1GypCuZXpx4Ef0MfR/TMWKAh+UhpxLh31E7Z2UWhQ8iJoFoHZK8+j53/o3X
 sau0vxmQi9R7Axi3yCGEcEdsVv7/GoQW1UHAimqQ20VXTVY5WZVvAHAvKQ5QenEAn9Qa 5Q== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w2ku0k5rj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Feb 2024 02:31:06 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 414NW9oF008765;
	Mon, 5 Feb 2024 02:30:57 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3w206y60d8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Feb 2024 02:30:57 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4152UtKO16908860
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 Feb 2024 02:30:55 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B420B2004B;
	Mon,  5 Feb 2024 02:30:55 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CB82A20043;
	Mon,  5 Feb 2024 02:30:54 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  5 Feb 2024 02:30:54 +0000 (GMT)
Received: from [10.61.2.107] (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 688D5600FC;
	Mon,  5 Feb 2024 13:30:47 +1100 (AEDT)
Message-ID: <74e39f168c5afafd56d6ea4b2f1274bfef6a3959.camel@linux.ibm.com>
Subject: Re: [PATCH v2 1/3] powerpc/code-patching: Add generic memory
 patching
From: Benjamin Gray <bgray@linux.ibm.com>
To: Naveen N Rao <naveen@kernel.org>
Date: Mon, 05 Feb 2024 13:30:46 +1100
In-Reply-To: <fwqfsxpnjoa5fjsvizu6nud4joa3btnzthrb6e5h4w6eplcfxu@oezlh56opyah>
References: <20231016050147.115686-1-bgray@linux.ibm.com>
	 <20231016050147.115686-2-bgray@linux.ibm.com>
	 <fwqfsxpnjoa5fjsvizu6nud4joa3btnzthrb6e5h4w6eplcfxu@oezlh56opyah>
Autocrypt: addr=bgray@linux.ibm.com; prefer-encrypt=mutual;
 keydata=mDMEYzuwexYJKwYBBAHaRw8BAQdAsgBYEqW6nNaL7i0B3z1RqyMl8ADupDef+5Sfe+JbzeC0I0JlbmphbWluIEdyYXkgPGJncmF5QGxpbnV4LmlibS5jb20+iJMEExYKADsWIQQ9K5v9I+L06Hi4yOJ5xrdpFsvehAUCYzuwewIbAwULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgAAKCRB5xrdpFsvehCiCAP4g7CDkmsakpwv9QxU2D8dophyCIS8meDOQX4/83/sjHgEA5HWbUsbRCpVmeIgu0iNwhw3cmqhkv7ZkBGe3HhHaXg65Ay4EYzuwkREIAJjQ1EDAmLbOENucLy7VUzyNNCHkBirK/+FbjwOW7VIphc8zgsbZ26ZjIu5vC1NY7U7DpOvLAfR0g4+2QeKiQ8EEcuxLhif5X+jsekq0oSTVLcyNYXArJ3mhmV7jRhz8wBueMoXY/k+P3HCVLi4vzroJzN06Hrnmeu5ELlC4MbuvGRTvW751Y/o7gTa6hyyLb2P4pQ+sj/PuIn2Ly1RJPF839HVcOOERkjZ2QZNJnXEhlpfDD7LyRsy9Xm6MxGKRE5VsfjaO+Q8B6ByhXIy5/QK41AF1uSIPBfkZ8+AsBFw8Z87VGQ61tDdzi0U77IdYr98KsgRJ30vHInfKKdSj4csBALzNKjOFmp7dS8mefp3viouy4vWPla8+XZU6ZrRNtD8hB/9FsE7KVTdIBp4xqf6oN1ieTD7PNsQsBQWdDA/rg2bP7IJQkf4Pvn0yoATOFgqhQwadkwT7fwWAfk0YPEE+DPom1V3JwNM6wPaEJeNaMjleqTfAfauLaB9Sc+zJvN5cORrEjSL/0jfJBBdjW5j5BmdUDM1mGuBNVQhGlWHc/Rf7qokMoZAfYiPi/z44rB9zvNfb8t6sVNqHbC2fKRBn/0k8cZ9+qBEIj6vbkqUuih8xNDA+TU+FxPqJxyahqFv+LL9cfZelC0v3D
	mjW5LaBPOdGiiDE1w95Ri9HRK27S2dRZpyib9L4mkfYWPAF41mTudjKmVpgtBLO//rO+zmF04OMB/4sWJhLfvhq1CXULDqw5dcuIAIYwf2ughOtyAPFK1ViDcMO5X1bVpNAFO5m4VBpZvFDQ0j0JfqfVBdL68uH05W1/8dMj76RaWj5m0rLM5slY1FQUPddSU+ic9vaZhlDepjU3ZyI8fmioofNGHaxJq6uNTytKdj87kwDV6PQ4hmuGtY56C7JCgjp053sRJ6sXqgKBWfe4ZOJH17mQm+fws93byLoZvvz4Z3im0Rb0MlFo/WirNyhu+TmTNLpnzFUZfenoKrqAkZLY8u1iCFquhgqA321P+sfYew66DtwQmaoi2GKmF89y2enXXzjLNKfLDKkuVoKxFSPeizYqrLi22R9iO8EGBYKACAWIQQ9K5v9I+L06Hi4yOJ5xrdpFsvehAUCYzuwkQIbAgCBCRB5xrdpFsvehHYgBBkRCAAdFiEESFUlaLYscsf4Dt5gaavCcpI6D/8FAmM7sJEACgkQaavCcpI6D/95UgEAqfSj0QhCrYfazQiLDKJstrz3oIKFjhB6+FYMZqt+K1MA/2ioFtHbypeeWbsqYYRhRyTjAKcvE1NZGtH/YWLgkViUidoBAN6gFX/P+VWB77/w8S/BnPmnJx45wmphlkCL8ckOyopFAQCj9eWamHCl2DSaASMSuoZed6C6Gm0OFtuZh/r8K485BQ==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3 (3.50.3-1.fc39) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: CtyRQLfXg8AdopV0UPDnwiMuGwMZ9WDX
X-Proofpoint-GUID: CtyRQLfXg8AdopV0UPDnwiMuGwMZ9WDX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-04_14,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 mlxscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 bulkscore=0 adultscore=0 phishscore=0 clxscore=1011 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402050018
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2023-11-30 at 15:55 +0530, Naveen N Rao wrote:
> On Mon, Oct 16, 2023 at 04:01:45PM +1100, Benjamin Gray wrote:
> > patch_instruction() is designed for patching instructions in
> > otherwise
> > readonly memory. Other consumers also sometimes need to patch
> > readonly
> > memory, so have abused patch_instruction() for arbitrary data
> > patches.
> >=20
> > This is a problem on ppc64 as patch_instruction() decides on the
> > patch
> > width using the 'instruction' opcode to see if it's a prefixed
> > instruction. Data that triggers this can lead to larger writes,
> > possibly
> > crossing a page boundary and failing the write altogether.
> >=20
> > Introduce patch_uint(), and patch_ulong(), with aliases
> > patch_u32(), and
> > patch_u64() (on ppc64) designed for aligned data patches. The patch
> > size is now determined by the called function, and is passed as an
> > additional parameter to generic internals.
> >=20
> > While the instruction flushing is not required for data patches,
> > the
> > use cases for data patching (mainly module loading and static
> > calls)
> > are less performance sensitive than for instruction patching
> > (ftrace activation).
>=20
> That's debatable. While it is nice to be able to activate function=20
> tracing quickly, it is not necessarily a hot path. On the flip side,
> I=20
> do have a use case for data patching for ftrace activation :)
>=20

True, but it's still correct to do so at least. Having a different path
for data writes is definitely a possibility, but would be added for
performance. This series is motivated by fixing a correctness issue
with data write sizes.

> > So the instruction flushing remains unconditional
> > in this patch.
> >=20
> > ppc32 does not support prefixed instructions, so is unaffected by
> > the
> > original issue. Care is taken in not exposing the size parameter in
> > the
> > public (non-static) interface, so the compiler can const-propagate
> > it
> > away.
> >=20
> > Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
> >=20
> > ---
> >=20
> > v2: * Deduplicate patch_32() definition
> > =C2=A0=C2=A0=C2=A0 * Use u32 for val32
> > =C2=A0=C2=A0=C2=A0 * Remove noinline
> > ---
> > =C2=A0arch/powerpc/include/asm/code-patching.h | 33 ++++++++++++
> > =C2=A0arch/powerpc/lib/code-patching.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 66 ++++++++++++++++++--
> > ----
> > =C2=A02 files changed, 83 insertions(+), 16 deletions(-)
> >=20
> > diff --git a/arch/powerpc/include/asm/code-patching.h
> > b/arch/powerpc/include/asm/code-patching.h
> > index 3f881548fb61..7c6056bb1706 100644
> > --- a/arch/powerpc/include/asm/code-patching.h
> > +++ b/arch/powerpc/include/asm/code-patching.h
> > @@ -75,6 +75,39 @@ int patch_branch(u32 *addr, unsigned long
> > target, int flags);
> > =C2=A0int patch_instruction(u32 *addr, ppc_inst_t instr);
> > =C2=A0int raw_patch_instruction(u32 *addr, ppc_inst_t instr);
> > =C2=A0
> > +/*
> > + * patch_uint() and patch_ulong() should only be called on
> > addresses where the
> > + * patch does not cross a cacheline, otherwise it may not be
> > flushed properly
> > + * and mixes of new and stale data may be observed. It cannot
> > cross a page
> > + * boundary, as only the target page is mapped as writable.
>=20
> Should we enforce alignment requirements, especially for
> patch_ulong()=20
> on 64-bit powerpc? I am not sure if there are use cases for unaligned
> 64-bit writes. That should also ensure that the write doesn't cross a
> cacheline.

Yeah, the current description is more just the technical restrictions,
not an endorsement of usage. If the caller isn't working with aligned
data, it seems unlikely it would still be cacheline aligned. The caller
should break it into 32bit patches if this is the case.

By enforce, are you suggesting a WARN_ON in the code too?

> > + *
> > + * patch_instruction() and other instruction patchers
> > automatically satisfy this
> > + * requirement due to instruction alignment requirements.
> > + */
> > +
> > +#ifdef CONFIG_PPC64
> > +
> > +int patch_uint(void *addr, unsigned int val);
> > +int patch_ulong(void *addr, unsigned long val);
> > +
> > +#define patch_u64 patch_ulong
> > +
> > +#else
> > +
> > +static inline int patch_uint(u32 *addr, unsigned int val)
>=20
> Is there a reason to use u32 * here?
>=20

No, fixed to void* for next series

> > +{
> > +	return patch_instruction(addr, ppc_inst(val));
> > +}
> > +
> > +static inline int patch_ulong(void *addr, unsigned long val)
> > +{
> > +	return patch_instruction(addr, ppc_inst(val));
> > +}
> > +
> > +#endif
> > +
> > +#define patch_u32 patch_uint
> > +
> > =C2=A0static inline unsigned long patch_site_addr(s32 *site)
> > =C2=A0{
> > =C2=A0	return (unsigned long)site + *site;
> > diff --git a/arch/powerpc/lib/code-patching.c
> > b/arch/powerpc/lib/code-patching.c
> > index b00112d7ad46..60289332412f 100644
> > --- a/arch/powerpc/lib/code-patching.c
> > +++ b/arch/powerpc/lib/code-patching.c
> > @@ -20,15 +20,14 @@
> > =C2=A0#include <asm/code-patching.h>
> > =C2=A0#include <asm/inst.h>
> > =C2=A0
> > -static int __patch_instruction(u32 *exec_addr, ppc_inst_t instr,
> > u32 *patch_addr)
> > +static int __patch_memory(void *exec_addr, unsigned long val, void
> > *patch_addr,
> > +			=C2=A0 bool is_dword)
> > =C2=A0{
> > -	if (!ppc_inst_prefixed(instr)) {
> > -		u32 val =3D ppc_inst_val(instr);
> > +	if (!IS_ENABLED(CONFIG_PPC64) || likely(!is_dword)) {
> > +		u32 val32 =3D val;
>=20
> Would be good to add a comment indicating the need for this for BE.
>=20

Yup, added

> - Naveen
>=20

