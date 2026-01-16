Return-Path: <linuxppc-dev+bounces-15894-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D45E0D32158
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jan 2026 14:49:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dt1RQ37V0z2xnj;
	Sat, 17 Jan 2026 00:49:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768571346;
	cv=none; b=l6BrDOBUltP8y9xBX0ZKl3sHclCcuOmj9mAuAtdvE6p/ulDb6PLhHS0qOyVLkjnUAGiP4NjoY3jW59zQdoGnzdmaiyfkc4F7vMe+i8ihHTMt1qJZN656p/xTD5h30Z8hw7lN/rhpCnmmi4K7YA6TSMWo8UCA/NogKcryksiOubCP27xTmiDVQw4NG7iMHAXYPlOOGcVqS5BXDGSdXDiZleQ5zDJogq4mldWhNKvjZt+JHVmUisIlelcurGbIRyyYycaIdzZo9jKlGMxZVULErK5i39j9ORsSqKFpVlVxo1LyLtgj3HqIhjhAHkHQqY8fw1KdpByiTOUl2GEcOKypOg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768571346; c=relaxed/relaxed;
	bh=WbwuyU9tQePUO/CMKRNoOm3c7S3e/lfcNNheLhV3Jek=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=UVv+EUVYrPz8sGxvaAUuH5JrTnd9LQESUVJX8y/giQe6bN5HBDvB7RQFciTZ+x7yK1aH+fNxnCWZXM/vivQz9e70eP7jGHa4h+5eIcbTjRjagmw983g1rZbYMPWBkk2l4GAvzGeedOfQUY2tY+JYRNo8xCymvWV9Piwwnfp27ampcrOOb93js0qaXrgym5cOYtEob48b1S6F+jbc8CsfVADacfV3mS4sbV1GvG/GJg3A917tgu7bp4Hc2gS49gjIQkFrSWVv5H8s8JojJL8w0tw2ACMCSHrAvg3BnF1JiOrM7BBfMsGOdSFDX8JKr1tSafc8CWqBqAbL/Kg0yy+x0w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tLl0nkgx; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=zohar@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tLl0nkgx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=zohar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dt1RN4N3dz2xS2
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jan 2026 00:49:04 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60GCUwxq032372;
	Fri, 16 Jan 2026 13:11:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=WbwuyU
	9tQePUO/CMKRNoOm3c7S3e/lfcNNheLhV3Jek=; b=tLl0nkgxjak7tFve2ZBcGQ
	+VHDE/VryxJxnm90DezyF4/7JH75ENlgiTRn3E8EkXh8KM3m17MObnHRG87BxqjH
	k+evfLvwl1ahkXgvytlmcUBkGmk/mos7XW4ZP9h3Rq2117CFWY2t+cyBMjhZY0wJ
	aG8/bczwhjW0Q4HUCaLHC2RnaDbZh2Ymy/ULnmCdAh/YNx6O5+QBc1iIyi7J1ohT
	VdwqPFpmrNYzhx3eQ2GUiRMVNwLcgcnnZyDVHRYy4K0fwFavechuxyDPlqLguRTY
	NNq2h8OkdnZNvf4fFOpTEqc/1G0ny01yPGQpvh7okGX2NsHgxwMFcxjAfEK/UHxQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bq9bmjwwj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Jan 2026 13:11:20 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 60GD0DSZ005091;
	Fri, 16 Jan 2026 13:11:19 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bq9bmjwwc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Jan 2026 13:11:19 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60GBkbdq025848;
	Fri, 16 Jan 2026 13:11:18 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4bm2kkxc2a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Jan 2026 13:11:18 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60GDBGtJ66191638
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 Jan 2026 13:11:16 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A8F5858052;
	Fri, 16 Jan 2026 13:11:16 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6EAA658065;
	Fri, 16 Jan 2026 13:11:14 +0000 (GMT)
Received: from li-43857255-d5e6-4659-90f1-fc5cee4750ad.ibm.com (unknown [9.61.160.11])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 16 Jan 2026 13:11:14 +0000 (GMT)
Message-ID: <8bfa859ed3a4f1cf0db0ab64d8c1c3b24684582a.camel@linux.ibm.com>
Subject: Re: [PATCH 1/3] integrity: Make arch_ima_get_secureboot
 integrity-wide
From: Mimi Zohar <zohar@linux.ibm.com>
To: Ard Biesheuvel <ardb@kernel.org>, Coiby Xu <coxu@redhat.com>
Cc: linux-integrity@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
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
In-Reply-To: <CAMj1kXFXNo1-pMbo-VZrjQ3TYe1tufebrLr_avL12A0nHMSGnA@mail.gmail.com>
References: <20260115004328.194142-1-coxu@redhat.com>
	 <20260115004328.194142-2-coxu@redhat.com>
	 <CAMj1kXFXNo1-pMbo-VZrjQ3TYe1tufebrLr_avL12A0nHMSGnA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Jan 2026 08:11:14 -0500
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
X-Proofpoint-GUID: vGdqorSMqwb3kfh44Ul4iXT26HLJtcVL
X-Proofpoint-ORIG-GUID: UaTnshlSl9OsQUsBt9h9DQB_j9bEWwZm
X-Authority-Analysis: v=2.4 cv=TrvrRTXh c=1 sm=1 tr=0 ts=696a38f8 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=20KFwNOVAAAA:8 a=VnNF1IyMAAAA:8 a=AiHppB-aAAAA:8 a=s9zCHZ8PhMmpDcaTpq8A:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA4OSBTYWx0ZWRfX8WIBwnwlCAo9
 Hx4erRu2DFykOazn7aixjrnZiK/y/mXNVaRMcKFpxf8sytT7MjrqnJuXITCSRHKaBo0NUqoqwN2
 NcwbpNvz7yE8ky8CYSr33LamfHlTuEs+vDn6BU+strZSfGddxkbHtvASz4Q0KOfRsLfKYLSqPSo
 sehjiaPCx4/Uylwg5IoNQWa4XSaIX1BeIE4wNVjD4if6jhdH6dV2i3zxguivqtDlcE6lybtMgr7
 Q3/8EAP6LFmRK+L5rXJgBcmXXCCw80YP2qfhfxfSle57agm8I8k6JA0ca6TeLHTDBjWoPK2lnR0
 6cBvhh/Y0E1FyzRnUiv5Ju+hn75fqho04+41hKgW/vSeWHV2VszlPlH7hegotzZnFlCzUnnU6h7
 GirUlCgk1R3VQz6ZEnBGJnEui1HJ90c9dZR4mV1ogE+Jp5VOPWrmqkZ9+RYVaTYQjpjkp/dFFFJ
 83ZnKksO+pMJswjZbqA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_05,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2512120000 definitions=main-2601160089
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, 2026-01-16 at 10:41 +0100, Ard Biesheuvel wrote:
> On Thu, 15 Jan 2026 at 01:43, Coiby Xu <coxu@redhat.com> wrote:
> >=20
> > EVM and other LSMs need the ability to query the secure boot status of
> > the system, without directly calling the IMA arch_ima_get_secureboot
> > function. Refactor the secure boot status check into a general,
> > integrity-wide function named arch_integrity_get_secureboot.
> >=20
> > Define a new Kconfig option CONFIG_INTEGRITY_SECURE_BOOT, which is
> > automatically configured by the supported architectures. The existing
> > IMA_SECURE_AND_OR_TRUSTED_BOOT Kconfig loads the architecture specific
> > IMA policy based on the refactored secure boot status code.
> >=20
> > Reported-and-suggested-by: Mimi Zohar <zohar@linux.ibm.com>
> > Suggested-by: Roberto Sassu <roberto.sassu@huaweicloud.com>
> > Signed-off-by: Coiby Xu <coxu@redhat.com>
> > ---
> >  arch/arm64/Kconfig                            |  1 +
> >  arch/powerpc/Kconfig                          |  1 +
> >  arch/powerpc/kernel/Makefile                  |  2 +-
> >  arch/powerpc/kernel/ima_arch.c                |  5 --
> >  arch/powerpc/kernel/integrity_sb_arch.c       | 13 +++++
> >  arch/s390/Kconfig                             |  1 +
> >  arch/s390/kernel/Makefile                     |  1 +
> >  arch/s390/kernel/ima_arch.c                   |  6 --
> >  arch/s390/kernel/integrity_sb_arch.c          |  9 +++
> >  arch/x86/Kconfig                              |  1 +
> >  arch/x86/include/asm/efi.h                    |  4 +-
> >  arch/x86/platform/efi/efi.c                   |  2 +-
> >  include/linux/ima.h                           |  7 +--
> >  include/linux/integrity.h                     |  8 +++
> >  security/integrity/Kconfig                    |  6 ++
> >  security/integrity/Makefile                   |  3 +
> >  security/integrity/efi_secureboot.c           | 56 +++++++++++++++++++
> >  security/integrity/ima/ima_appraise.c         |  2 +-
> >  security/integrity/ima/ima_efi.c              | 47 +---------------
> >  security/integrity/ima/ima_main.c             |  4 +-
> >  security/integrity/platform_certs/load_uefi.c |  2 +-
> >  21 files changed, 111 insertions(+), 70 deletions(-)
> >  create mode 100644 arch/powerpc/kernel/integrity_sb_arch.c
> >  create mode 100644 arch/s390/kernel/integrity_sb_arch.c
> >  create mode 100644 security/integrity/efi_secureboot.c
> >=20
> > diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> > index 93173f0a09c7..4c265b7386bb 100644
> > --- a/arch/arm64/Kconfig
> > +++ b/arch/arm64/Kconfig
> > @@ -2427,6 +2427,7 @@ config EFI
> >         select EFI_STUB
> >         select EFI_GENERIC_STUB
> >         imply IMA_SECURE_AND_OR_TRUSTED_BOOT
> > +       imply INTEGRITY_SECURE_BOOT
>=20
> This allows both to be en/disabled individually, which I don't think
> is what we want. It also results in more churn across the
> arch-specific Kconfigs than needed.
>=20
> Wouldn't it be better if IMA_SECURE_AND_OR_TRUSTED_BOOT 'select'ed
> INTEGRITY_SECURE_BOOT in its Kconfig definition?

As much as possible, EVM (and other LSMs) shouldn't be dependent on another=
 LSM,
in this case IMA, being configured.

