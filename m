Return-Path: <linuxppc-dev+bounces-17136-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kPUDOoU8nmkrUQQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17136-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 01:04:21 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22AB818E434
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 01:04:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fLFFC6tDPz3dHK;
	Wed, 25 Feb 2026 11:04:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771977855;
	cv=none; b=SuMMoOhSB6uIWkeSpRZQCA2sJptAMmeCgNztZ6WR4Ei0QU5V5RZ9dufrGFVqQ3cZRdZP4IjHo33cSehvCZVPsDMwQ6E3t3QqlNYPAyKOWHdTOrl1wEWJi2AbR/eq5kjE4j/hbBlYv4klFVk1Y9futyM4DuOgRFJCxUPhxP4lxF1Dn/lpz1SXN9iuItHLkTZo/rCFDxfwQQFwPayG2JXNHNhVG16/iQ+Ze4IpOUvke25PWG7MAaFA+CYkEcp8awSgpEu5D/c966T7Ev4glF3suhHhY5fZqOrgvLM4v7R08iJA00O9+ul+pFikAKbd2sD8BXk+Fc7SI29wiFLRrOKbzA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771977855; c=relaxed/relaxed;
	bh=cFbFxILw8z/WHEBjoq2ZMztetevIFEwE8orbafe4X+g=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=k3Y7WfLTWk+PcvK1c10oyzN9WZIn/XBxewRj9zNryAVDmI6mCgifZls9VgPdpBW6vG0zXqUVy4G2kSB1jNon0+tAUrJXvWlCAblA/vnhC22NqTLgKBzO1Ocx8YhiwtC6DIMi+DBN1JWGW3Ax6+7mMqWZOOUxaj5aRCakw8xCTVQNonMY0IYlR8ri4wXgJ12OdIGdmI6VWoeYxdjNYfYdA08GL+RJgD08/yFNVLkHTt4GUv4aaYU7H3MMzPm+FUCDR3ym3PgwNonYXZLywf2WmYUgukRrFA15w4vvpUdDFiUaZQhKq3QfRCYXOvD7aTVDWJcgDL1LnvzPOVSBN77OPA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TDPeo8v/; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=zohar@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TDPeo8v/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=zohar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fLFFB5WgLz3d8p
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Feb 2026 11:04:14 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OKo3mo2894740;
	Wed, 25 Feb 2026 00:03:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=cFbFxI
	Lw8z/WHEBjoq2ZMztetevIFEwE8orbafe4X+g=; b=TDPeo8v/2+wirzhVbwsQUy
	hYpVYSVAc0lg1TDb8j+bjbT6nU7ETrG+IW1bV3dwqFTJ6ryXa/vazci9dAxEZTNG
	za6txZ0VpMGiiTyrUkYkGSynN5Ugck33b3VltjtkuYTBAXc2QR0FcN2P2Jgs9bPx
	33pfHCbLbYKsuq2iKQ4mZMaPcoeJcGDnQZdFaoTQPUpF6waYgUBh2mw1Xmyj4WfK
	jmg+Q3C2q+Q8FFiQtMa7+TqiQdMIpB2/iOqevicTdezsXzN5wVOQkBIzazGpnvp9
	ZrPaq3cjiJH4QOKOjUUkRtj0uNcvGJ+LBM3BOZgkZvNY8O2h1gvNk7hddd9AbgWQ
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cf471x2sa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Feb 2026 00:03:15 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61OLXORR030259;
	Wed, 25 Feb 2026 00:03:14 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4cfrhkb1gd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Feb 2026 00:03:14 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61P03DrN32375318
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Feb 2026 00:03:13 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1E5865805A;
	Wed, 25 Feb 2026 00:03:13 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D3A8E5805C;
	Wed, 25 Feb 2026 00:03:10 +0000 (GMT)
Received: from li-43857255-d5e6-4659-90f1-fc5cee4750ad.ibm.com (unknown [9.61.83.151])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 25 Feb 2026 00:03:10 +0000 (GMT)
Message-ID: <ad471c33eeb9e21c49ac81032dc64555a2fb816f.camel@linux.ibm.com>
Subject: Re: [PATCH 1/3] integrity: Make arch_ima_get_secureboot
 integrity-wide
From: Mimi Zohar <zohar@linux.ibm.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Coiby Xu <coxu@redhat.com>, Dave Hansen <dave.hansen@intel.com>,
        linux-integrity@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
        Roberto Sassu <roberto.sassu@huaweicloud.com>,
        Catalin Marinas
 <catalin.marinas@arm.com>,
        Will Deacon	 <will@kernel.org>,
        Madhavan
 Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman	 <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)"
 <chleroy@kernel.org>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev	
 <agordeev@linux.ibm.com>,
        Christian Borntraeger
 <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Thomas
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav
 Petkov	 <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)"	 <x86@kernel.org>,
        "H.
 Peter Anvin" <hpa@zytor.com>,
        Roberto Sassu	 <roberto.sassu@huawei.com>,
        Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
        Eric Snowberg
 <eric.snowberg@oracle.com>,
        Paul Moore <paul@paul-moore.com>, James Morris
 <jmorris@namei.org>,
        "Serge E. Hallyn"	 <serge@hallyn.com>,
        Jarkko
 Sakkinen <jarkko@kernel.org>,
        "moderated list:ARM64 PORT (AARCH64
 ARCHITECTURE)"	 <linux-arm-kernel@lists.infradead.org>,
        open list
 <linux-kernel@vger.kernel.org>,
        "open list:LINUX FOR POWERPC (32-BIT AND
 64-BIT)"	 <linuxppc-dev@lists.ozlabs.org>,
        "open list:S390 ARCHITECTURE"	
 <linux-s390@vger.kernel.org>,
        "open list:EXTENSIBLE FIRMWARE INTERFACE
 (EFI)"	 <linux-efi@vger.kernel.org>,
        "open list:SECURITY SUBSYSTEM"	
 <linux-security-module@vger.kernel.org>,
        "open
 list:KEYS/KEYRINGS_INTEGRITY"	 <keyrings@vger.kernel.org>
In-Reply-To: <CAMj1kXFBMSEdRL8FotASbQO3dcfNG0bpp9Vnm5JPn-yjyDr=GA@mail.gmail.com>
References: <20260115004328.194142-1-coxu@redhat.com>
	 <20260115004328.194142-2-coxu@redhat.com>
	 <CAMj1kXFXNo1-pMbo-VZrjQ3TYe1tufebrLr_avL12A0nHMSGnA@mail.gmail.com>
	 <8bfa859ed3a4f1cf0db0ab64d8c1c3b24684582a.camel@linux.ibm.com>
	 <CAMj1kXHsJNZoUEnbD1y=v4Ftuv9d2c08VckRV7ru4k4P83vZbQ@mail.gmail.com>
	 <97b69bc79a5d9246f7a399510908c7b95b2e95e7.camel@linux.ibm.com>
	 <CAMj1kXGx4ebaK87W7k0SNUNQnO9+=z1nmYxXC7retmp3OqRRFg@mail.gmail.com>
	 <ac5e5e45c12e9b0bda19807e60b06057d74be0b3.camel@linux.ibm.com>
	 <aW2i3yacr5TvWU-m@Rk>
	 <1a0b6e5601a673a81f8823de0815f92b7afbeb60.camel@linux.ibm.com>
	 <CAMj1kXFBMSEdRL8FotASbQO3dcfNG0bpp9Vnm5JPn-yjyDr=GA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Feb 2026 19:03:10 -0500
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
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: KmeUE4GQkjFCEA-onCkjAzUZBg2oc_Jk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDIwOSBTYWx0ZWRfX2xjh5sVgzhOS
 dnNMnaiYXxvEopWHavbqXkdT3qDid/FcKrZW6PmQdfwrcST/ZX7r1DIOCK79NPeBkmvn5ZHnYe9
 iQCAUuGXNwIfntSmXBmb3sUwGlIdjaEKqZi1yYK+izhn6dUmiu/Nzuts6JG8Ag64IbvlsCzY9HR
 y1IRHwNmX0lY22905adj132keU3lKlbxSTaMIzXpdbD2idW7uvTZCuaRnWcSmyCenN1pvMDPDtz
 Ojr2imkhf9l9gWYtYrhl9C6I4J8BD8+fWsWgo8o8r/qtjNfpI8oxVuSL/ZlJTwW4+zm6hRkbkoN
 4lqBW+WzVRY5+AOS30Msdg/NZ8hJlFIKGLqUHVrs0oDlu2icF3c2sOI3QWj0LDoJJ5HzB/Elg74
 cnpm/637Zl1QbABBe956sXpIE+1HpOurd+ceDGYdkaBpuRjH9KncE0ga2Ag7Qpm+1XRIU3zjk+0
 9ddSy/sJJwN86SA5NEA==
X-Authority-Analysis: v=2.4 cv=R7wO2NRX c=1 sm=1 tr=0 ts=699e3c44 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=20KFwNOVAAAA:8 a=VnNF1IyMAAAA:8 a=qGODes0vNXlHMsmaWvgA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 2x_WgBn-lXEWRE-KKGAySI2MMRU7Qajr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602240209
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17136-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER(0.00)[zohar@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[redhat.com,intel.com,vger.kernel.org,linux.ibm.com,huaweicloud.com,arm.com,kernel.org,ellerman.id.au,gmail.com,linutronix.de,alien8.de,linux.intel.com,zytor.com,huawei.com,oracle.com,paul-moore.com,namei.org,hallyn.com,lists.infradead.org,lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[36];
	FORGED_RECIPIENTS(0.00)[m:ardb@kernel.org,m:coxu@redhat.com,m:dave.hansen@intel.com,m:linux-integrity@vger.kernel.org,m:hca@linux.ibm.com,m:roberto.sassu@huaweicloud.com,m:catalin.marinas@arm.com,m:will@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:tglx@linutronix.de,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:roberto.sassu@huawei.com,m:dmitry.kasatkin@gmail.com,m:eric.snowberg@oracle.com,m:paul@paul-moore.com,m:jmorris@namei.org,m:serge@hallyn.com,m:jarkko@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-s390@vger.kernel.org,m:linux-efi@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:keyrings@vger.kernel.org,m:dmitrykasatkin@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[zohar@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	NEURAL_HAM(-0.00)[-0.963];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 22AB818E434
X-Rspamd-Action: no action

On Wed, 2026-01-21 at 17:25 +0100, Ard Biesheuvel wrote:
> On Wed, 21 Jan 2026 at 16:41, Mimi Zohar <zohar@linux.ibm.com> wrote:
> >=20
> > On Mon, 2026-01-19 at 12:04 +0800, Coiby Xu wrote:
> >=20
> > > diff --git a/security/integrity/ima/Kconfig b/security/integrity/ima/=
Kconfig
> > > index 976e75f9b9ba..5dce572192d6 100644
> > > --- a/security/integrity/ima/Kconfig
> > > +++ b/security/integrity/ima/Kconfig
> > > @@ -311,6 +311,7 @@ config IMA_QUEUE_EARLY_BOOT_KEYS
> > >   config IMA_SECURE_AND_OR_TRUSTED_BOOT
> > >          bool
> > >          depends on IMA_ARCH_POLICY
> > > +       depends on INTEGRITY_SECURE_BOOT
> > >=20
> > >=20
> > > Another idea is make a tree-wide arch_get_secureboot i.e. to move
> > > current arch_ima_get_secureboot code to arch-specific secure boot
> > > implementation. By this way, there will no need for a new Kconfig opt=
ion
> > > INTEGRITY_SECURE_BOOT. But I'm not sure if there is any unforeseen
> > > concern.
> >=20
> > Originally basing IMA policy on the secure boot mode was an exception. =
 As long
> > as making it public isn't an issue any longer, this sounds to me.  Ard,=
 Dave, do
> > you have any issues with replacing arch_ima_get_secureboot() with
> > arch_get_secureboot()?
>=20
> I don't see an issue with that. If there is a legitimate need to
> determine this even if IMA is not enabled, then this makes sense.

Ard, Dave -

FYI, Coiby posted v3 of this patch set[1], which is queued in the next-
integrity-testing branch[2].

[1]
https://lore.kernel.org/linux-integrity/20260213012851.2532722-1-coxu@redha=
t.com/

[2] https://git.kernel.org/pub/scm/linux/kernel/git/zohar/linux-integrity.g=
it/

Mimi

