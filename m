Return-Path: <linuxppc-dev+bounces-16107-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QE42DgvxcGk+awAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16107-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jan 2026 16:30:19 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4903E59336
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jan 2026 16:30:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dx7Rp4QNxz2yFg;
	Thu, 22 Jan 2026 02:30:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769009414;
	cv=none; b=CU+J4Ax2M7BLZ8Aklmd8pz3+wxcDEnL4GYCdG3rr7fO3WuE/+6jf5TMqXgV2qWThgM3Y9XgimfVochGPdp5k/NkUj6Mb55YQFKtpK6/GbpDBvxk3iXZS5Yjikr5mY3cHOb0jWmIgUZnrlV0xqeRqWxo2Jtk5jgCRNVeGAuL65D+Sb6QVWwfKrctb/P+ELu4WQS259q86mZhdOA4Wh+dnWSJ33x/iwWnh8WSOVn2gbtLT541fwZZwGK3ROIanpvjgZ7ubvQ5uIw6QnOZDa42tomceHHiSUurYwoakQXkRaTF8WkKZ6pxdBcVuk93MgYwFDoXSwQ5c+Yqe6ADmtTGo2A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769009414; c=relaxed/relaxed;
	bh=PtmlnhrcboQC2zSz3tkdWdWIHjt+pGDAQNrjfcEM9Ao=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=g8xY2W9i//E8E5Etb+pmbs65bVkX9stJx+Dca1EdVB7DzSqBKwFx6QOSvfN09cflzWmvfacGCYs4chMJijFVP/s30ZeO3sMo2sYCdv1Sr6iHcBda+K3DAMURRa6FoB0XSRH2L2b40a2OV+9SEhZl8cckD54AD6Dxyt9oPUX+EOCnMKt7h2fNAKKmnJQVHh0huncoccoqylRAVNgzpkEBsKKwIArpR/+bam8zkGMMU3p+pWpT9n5y2MtTsR/k84qE8WQkFWRsdHRTRqR4UUkt4Qov+ZDjzY3GouaJf4rwMxlxKrKKqWt1D7y8eMSLSSJQWa+aa0qOGWXjF7vBXYAp4A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=R7MQU+ob; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=zohar@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=R7MQU+ob;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=zohar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dx7Rn0CD1z2xpk
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jan 2026 02:30:12 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60LCIPJC007922;
	Wed, 21 Jan 2026 15:29:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Ptmlnh
	rcboQC2zSz3tkdWdWIHjt+pGDAQNrjfcEM9Ao=; b=R7MQU+obN+Qps4PgiI24Ew
	/tg73MOOpAIXEaySqQu7qpuwwKYHl9637G1gGm4LpJ2PWu5Z/T4NOLNYom2+S5vr
	srhYoUIvgDBQrVjo1HYcMdOulZS0VupOQWns9ZnfPpX7Ztjv02TtRF8HlkawN/nq
	3Ak6iWcgqyrpoU1dlZvAN1KYeK2vscKs4JjcOxdKg1PC/DIh43J1W6lElnb6UDkY
	uJFCeKaU3lS2IxSIfAOHxkjKAuSYN0wWMNxQggR2q6hK1YScGRtZRQvuOekEzYvn
	ZJ10UAMFtMOVSS16pGwG0gmu/qeStWTp3sum9s3sN+OXYJhaNj+34GwvvoLYKO3g
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bqyukbxuy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Jan 2026 15:29:19 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 60LFTIC8003745;
	Wed, 21 Jan 2026 15:29:18 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bqyukbxus-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Jan 2026 15:29:18 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60LE7HHN009273;
	Wed, 21 Jan 2026 15:29:17 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4brp8kcpjs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Jan 2026 15:29:17 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60LFTGuU32834142
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Jan 2026 15:29:16 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 12AF05804E;
	Wed, 21 Jan 2026 15:29:16 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D0E225803F;
	Wed, 21 Jan 2026 15:29:12 +0000 (GMT)
Received: from li-43857255-d5e6-4659-90f1-fc5cee4750ad.ibm.com (unknown [9.61.58.59])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 21 Jan 2026 15:29:12 +0000 (GMT)
Message-ID: <90e382b630b9719bf3e0ac76da1ce8b467d7ca52.camel@linux.ibm.com>
Subject: Re: [PATCH 1/3] integrity: Make arch_ima_get_secureboot
 integrity-wide
From: Mimi Zohar <zohar@linux.ibm.com>
To: Dave Hansen <dave.hansen@intel.com>, Ard Biesheuvel <ardb@kernel.org>
Cc: Coiby Xu <coxu@redhat.com>, linux-integrity@vger.kernel.org,
        Heiko
 Carstens	 <hca@linux.ibm.com>,
        Roberto Sassu
 <roberto.sassu@huaweicloud.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Madhavan Srinivasan	 <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin	
 <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev
 <agordeev@linux.ibm.com>,
        Christian Borntraeger	
 <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Thomas
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav
 Petkov <bp@alien8.de>,
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
In-Reply-To: <79185163-bf8f-4490-9396-3fd73b7a0c73@intel.com>
References: <20260115004328.194142-1-coxu@redhat.com>
	 <20260115004328.194142-2-coxu@redhat.com>
	 <CAMj1kXFXNo1-pMbo-VZrjQ3TYe1tufebrLr_avL12A0nHMSGnA@mail.gmail.com>
	 <8bfa859ed3a4f1cf0db0ab64d8c1c3b24684582a.camel@linux.ibm.com>
	 <CAMj1kXHsJNZoUEnbD1y=v4Ftuv9d2c08VckRV7ru4k4P83vZbQ@mail.gmail.com>
	 <97b69bc79a5d9246f7a399510908c7b95b2e95e7.camel@linux.ibm.com>
	 <CAMj1kXGx4ebaK87W7k0SNUNQnO9+=z1nmYxXC7retmp3OqRRFg@mail.gmail.com>
	 <ac5e5e45c12e9b0bda19807e60b06057d74be0b3.camel@linux.ibm.com>
	 <79185163-bf8f-4490-9396-3fd73b7a0c73@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Jan 2026 10:29:12 -0500
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDEyOSBTYWx0ZWRfX2ymvuQYTy22H
 qJNFLcQqWjeaCaLFEyKT6tfE0MW/e++nB0SRaSFVtToAa9ox6oeVXILCPxuv+vctXvPHW3rsYrQ
 +ejPAxy5nQRglPnamJCq1FFiP7jMKqOLF16rjF+Bx8AKWTma7YLK67DTU6FJbmSTRKOpWP3H1pu
 Wg7FpxlASD8gzCkZwBbwfrDAPc4zwN7GUrVCGuyQgBF6vKaRnD8zXGeJIzrhGxxnJfbBMnLTfZy
 TeJRkW492qytmES3d6FRnj0Rq9JTRV2s755lB3CGKXdkShUejNQZLiiBAo73NEyFpV+H4+8d40k
 RDpXSBrIKVh11RVald9e5I9lxAfIvQOyV3D9niyM9/EkSGYC52qa1uUWX4+rAvlXsEx+0yhfROv
 2tSF8yG6PJGDjvQRkGjOgB1n2uOpvIOEJ7uicvzpXhvpauEMpRWd0+DPjwyy8aOwzDmoMRnpfiT
 sac2pUBUVyCecKsNSdg==
X-Authority-Analysis: v=2.4 cv=bsBBxUai c=1 sm=1 tr=0 ts=6970f0cf cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=m0T7RSBcDQ_YrrizhwQA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: S936aB5gmoeXC2u8rCvDZx6qTRnYBrU1
X-Proofpoint-GUID: 1nKqWJ362P7-Wshb2BQ9Ah0DM2KFKlHH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_02,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 clxscore=1011 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2601150000 definitions=main-2601210129
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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
	TAGGED_FROM(0.00)[bounces-16107-lists,linuxppc-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[zohar@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[36];
	FORGED_RECIPIENTS(0.00)[m:dave.hansen@intel.com,m:ardb@kernel.org,m:coxu@redhat.com,m:linux-integrity@vger.kernel.org,m:hca@linux.ibm.com,m:roberto.sassu@huaweicloud.com,m:catalin.marinas@arm.com,m:will@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:tglx@linutronix.de,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:roberto.sassu@huawei.com,m:dmitry.kasatkin@gmail.com,m:eric.snowberg@oracle.com,m:paul@paul-moore.com,m:jmorris@namei.org,m:serge@hallyn.com,m:jarkko@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-s390@vger.kernel.org,m:linux-efi@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:keyrings@vger.kernel.org,m:dmitrykasatkin@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[redhat.com,vger.kernel.org,linux.ibm.com,huaweicloud.com,arm.com,kernel.org,ellerman.id.au,gmail.com,linutronix.de,alien8.de,linux.intel.com,zytor.com,huawei.com,oracle.com,paul-moore.com,namei.org,hallyn.com,lists.infradead.org,lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zohar@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[ibm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid,lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Queue-Id: 4903E59336
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Dave!

On Mon, 2026-01-19 at 10:44 -0800, Dave Hansen wrote:
> On 1/18/26 10:25, Mimi Zohar wrote:
> > As not all arch's implement arch_integrity_get_secureboot, the definiti=
on in
> > include/linux/integrity.h would need to be updated.  Something like:
> >=20
> > -#ifdef CONFIG_INTEGRITY_SECURE_BOOT
> > +#if (defined(CONFIG_INTEGRITY_SECURE_BOOT) && \
> > +       (defined(CONFIG_X86) && defined(CONFIG_EFI)) || defined(CONFIG_=
S390) \
> > +        || defined(CONFIG_PPC_SECURE_BOOT))
> >=20
> > Then IMA_SECURE_AND_OR_TRUSTED_BOOT and EVM could select INTEGRITY_SECU=
RE_BOOT,
> > as suggested.
>=20
> This seems to be going a wee bit sideways. :)

Agreed, that was my point. :)   "imply" was cleaner, but Ard objected to tw=
o
imply's.

>=20
> This kind of CONFIG complexity really should be left to Kconfig. C
> macros really aren't a great place to do it.
>=20
> The other idiom we use a lot is this in generic code:
>=20
> #ifndef arch_foo
> static inline void arch_foo(void) {}
> #endif
>=20
> Then all you have to do is make sure the arch header that #defines it is
> included before the generic code. I'm not a super huge fan of these
> because it can be hard to tell (for humans at least) _if_ the
> architecture has done the #define.
>=20
> But it sure beats that #ifdef maze.

Sure.

