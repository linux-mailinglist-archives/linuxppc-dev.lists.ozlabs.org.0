Return-Path: <linuxppc-dev+bounces-11851-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 242CBB48243
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Sep 2025 03:46:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cKqYb6VHDz2yw7;
	Mon,  8 Sep 2025 11:46:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757295987;
	cv=none; b=MclZnbFE6wMnKPiWaHWzU7YPh7MdRkwT4vjgbpErgcFSMy1QuZasGhM23iK7upoWKUOR5n4OA8bz73ondujLLCwHDeyvW/FKeqSCemYZpg9CpLGAOPiW1mdE2gpIgEX7Qki09Og74z4PujrnhZCFUyQ6xvtKO1R9L4u36np302oKxgPvh3fHUqMZsdA1xucBRxZlJctNXTB9iVQK3WLsTUSqpKRdHOjbQD11giA+sSDntRlNk7t8WKsnM0Qb7WkKQ9LRrsTrvCoF9DfU5ThoR+yLUvIsb2iEtfWcN5Fm2adLOL2u2YYLZMaaFF4Jv/oYFMWA038vhoNKsT3b0VO8ug==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757295987; c=relaxed/relaxed;
	bh=UccKeaxhS+HpFDIrljo7TBOyyvOWjiyq8kuiNMMZAWw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GIAdJA+M2qM1KT1rdVRndKQaHkJfiJoTPJtrHY9LmvIFrjPOcYdklsNv4YLlklEnB20IxuGr6PqqisXy6JLcUw6Cr3R73H0UrmqUVvdtiq2RZy1FeHjnq+UZQVfDypp8nLReCJ6DqwWp3vXvNUN+4qo/oGuvGuS+FoiLZYp2pRD32M3Egbq8t2Jut8UK1H8UwIL5RCZVEvSqEDGd7XDgWTnXbGlgTXTyS3wvYER8SoJ1mU12+b3Nm6q+i6PLff0Wc2ucgX+DYytGlIhfmhC64orA8srYimh8/pRsWbwGAnXN+VOdo2UmnYfgkKl52A2aYcdAW/Y65H6j1ZsV3QIxPA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MyE9vVH1; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MyE9vVH1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cKqYZ3bQTz2xS2
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Sep 2025 11:46:25 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587LVcFq030119;
	Mon, 8 Sep 2025 01:46:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=UccKea
	xhS+HpFDIrljo7TBOyyvOWjiyq8kuiNMMZAWw=; b=MyE9vVH1NqMsBA38TFDXwK
	45OlmY0JG7ZdzxSHrhnn6o3/cgaIrM5mgAyce92T8OGicQWk7DdjkBcfIBl/mXOp
	7EvJKCuqYw6aZLBJQf9aFLFivupUIAZspTs12tEtQ3+Zz4UHDFNZbcBfacDfVIRs
	JyHStqnI3dBsfv5EOdvCcw/+IEZrYWeZhex2dqFLmgOtMhDq0kD3U8GMRbPzAbmC
	JYdx47C7p/WJyBSEkECeYqCLaziK/GkEMBFFm5wTGNaBdJqGRQX9TFbHBg/Khuhj
	HnDbzBgjEEpBEYSc/PFCoefuvISItc5wPmv/mPnowVxfZWhWFmQoORzl12FLDWbg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490uke40rc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Sep 2025 01:46:03 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5881k2sV002110;
	Mon, 8 Sep 2025 01:46:02 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490uke40r6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Sep 2025 01:46:02 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 587KJ5Ol001156;
	Mon, 8 Sep 2025 01:46:01 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4912033gxb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Sep 2025 01:46:01 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5881k0TY16122400
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 8 Sep 2025 01:46:00 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 261C25804E;
	Mon,  8 Sep 2025 01:46:00 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CEAAC58054;
	Mon,  8 Sep 2025 01:45:53 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com (unknown [9.150.15.230])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  8 Sep 2025 01:45:53 +0000 (GMT)
Message-ID: <c8c5778822344161acec7101fa9f19726ca99d31.camel@linux.ibm.com>
Subject: Re: [PATCH RFC] powerpc: Panic on jump label code patching failure
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        "Ritesh Harjani (IBM)"
	 <riteshh@linux.ibm.com>,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        maddy@linux.ibm.com, mpe@ellerman.id.au, peterz@infradead.org,
        jpoimboe@kernel.org, jbaron@akamai.com
Cc: npiggin@gmail.com, rostedt@goodmis.org, ardb@kernel.org,
        Erhard Furtner
	 <erhard_f@mailbox.org>
Date: Mon, 08 Sep 2025 11:45:52 +1000
In-Reply-To: <1b4cc6d5-5f5b-4b39-8fdf-ac02c94cd5e2@csgroup.eu>
References: <20250905061135.1451362-1-ajd@linux.ibm.com>
	 <87qzwki6fv.fsf@ritesh.list@gmail.com>
	 <1b4cc6d5-5f5b-4b39-8fdf-ac02c94cd5e2@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDE5NSBTYWx0ZWRfX31IU+4LQ9/fn
 usx8Uw9c80Powr+cbFK4OzEAEqQt0UGcpgPcCQoJpH2LPJfLXWNE2dzDT+erpMujpg+HiH3kNMj
 EdFkzvKO2aiaf/7J9ii8CxvkH98c1gqZalX+qBfR0TG2PQoXpxvVTf0mhCkXfgiktyhxpnHEVIt
 +/KKks/upJkSQo3oKCXrIFXKG4g2DfuQ3Odjmhvr0y6Mr+/nVX7ykXSOfVlykQ3wNMrEi6PuyIi
 uMioOVHyHXlfH3gUCeymcGMXgmLV8bRVO9YC+9Ko0sN7WOyvDHsFp/3/Pu/C8hF09F0/sJqNAUo
 jhkKwtt3UhRi9HEhcUuU1RusBOIHxdYNlgmIA+h9Joz8bJsDvuQvYBcJ5nkjilRT4ShBx9IYjGx
 xP64b1fJ
X-Proofpoint-ORIG-GUID: nerRj6-0BR0gN8pD3HmGmni6d9Jwj5yb
X-Proofpoint-GUID: hb_MV_qymDWLP0LPeYEwIfhE5uwg_uIa
X-Authority-Analysis: v=2.4 cv=StCQ6OO0 c=1 sm=1 tr=0 ts=68be355b cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VnNF1IyMAAAA:8 a=_z8MWtvD0Tm20lTwb9kA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-07_10,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060195
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat, 2025-09-06 at 08:42 +0200, Christophe Leroy wrote:
> > arch_jump_label_transform() is mainly getting called from
> > __jump_level_update() and it's used for enabling or updating static key=
s /
> > branch.
> >=20
> > But static keys can also be used by drivers / module subsystem whose
> > initialization happens late. Although I understand that if the above
> > fails, it might fail much before, from the arch setup code itself, but
> > panic() still feels like a big hammer.
>=20
> But not being able to patch the kernel as required means that you get a=
=20
> kernel behaving differently from what is expected.
>=20
> Imagine a kernel running on a board that is controlling a saw. There is=
=20
> a patch_instruction() to activate the safety feature which detects when=
=20
> your hands are too close to the blade. Do you want the kernel to=20
> continue running seamlessly when that patch_instruction() fails ? I'm=20
> sure you don't !

This is my thinking exactly - a failed patch leaves the kernel in an abnorm=
al
state, and we don't have the infrastructure to safely roll back any patches=
 that
have already succeeded or other associated state changes, so this should be
treated as an unrecoverable error. The resulting kernel is a different kern=
el
from the one you expect to have.

The fact that drivers/modules can trigger this just means that drivers/modu=
les
can permanently ruin your kernel too, which makes this more important not l=
ess,
I think?

>=20
> >=20
> > Would pr_err() print with WARN_ON_ONCE(1) would suffice in case of an
> > err?
>=20
> No, that's not enough, you can't rely on a kernel that will no behave as=
=20
> expected.
>=20
> >=20
> > Also you said you ran into a problem at just one call site where above
> > was silently failing. With the above change are you able to hit the
> > panic() now? Because from what I see in patch_instruction(), it mainly
> > will boil down to calling __patch_mem() which always returns 0.
>=20
> As far as I can see, __patch_mem() returns -EPERM when=20
> __put_kernel_nofault() fails:
>=20
> static int __patch_mem(void *exec_addr, unsigned long val, void=20
> *patch_addr, bool is_dword)
> {
> 	if (!IS_ENABLED(CONFIG_PPC64) || likely(!is_dword)) {
> 		/* For big endian correctness: plain address would use the
> wrong half */
> 		u32 val32 =3D val;
>=20
> 		__put_kernel_nofault(patch_addr, &val32, u32, failed);
> 	} else {
> 		__put_kernel_nofault(patch_addr, &val, u64, failed);
> 	}
>=20
> 	asm ("dcbst 0, %0; sync; icbi 0,%1; sync; isync" :: "r" (patch_addr),
> 							=C2=A0=C2=A0=C2=A0 "r" (exec_addr));
>=20
> 	return 0;
>=20
> failed:
> 	mb();=C2=A0 /* sync */
> 	return -EPERM;
> }

Yes, I can confirm that -EPERM from __patch_mem() is what I was seeing, and=
 I
experimented with the assembly to confirm that it was triggered by the stw =
in
__put_kernel_nofault(). __put_kernel_nofault() uses the address of the fail=
ed:
label to create a handler in the exception table for when the store instruc=
tion
faults.

>=20
>=20
> > Although there are other places where there can be an error returned,
> > so I was wondering if that is what you were hitting or something else?
>=20
> Andrew was hitting the -EPERM because the memory area was read-only.
>=20
> Christophe

--=20
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited

