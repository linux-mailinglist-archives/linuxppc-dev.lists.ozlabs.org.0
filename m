Return-Path: <linuxppc-dev+bounces-17775-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KF9ZLmB9qWkg8gAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17775-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 05 Mar 2026 13:56:00 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9B82122DA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 05 Mar 2026 13:55:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fRTzw3kvCz3c8h;
	Thu, 05 Mar 2026 23:55:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772715356;
	cv=none; b=BzJE8JE0ki2HrV0aNnKe/zclkCiPoRGKo25vMFQ+VEsDMzsQ2B9fDfvjaZpjXE8IhfdR5MuBJKF4GzI2MozoJ+0tKtXTI/gYkaIlttQHp+TTQNUCLKMsB4UIBm9F4H3v59+14Qp2PaDmtX784QANlT133flr0KopDAiZVomrcfmgxLJY28VSneDSnGjAOxvYW4Oj7VJrmiPxho6KKDnBZKRPK+X6KQorDyZYzsjaX8CCrtVAoGt2MyskSu0D285b7iwXZlKJcvkTHcDae6aF0kqqNQUdFG4udd6gpXfRzqOtcYn3Y2zwCyEwH2aBBDbaJLfNXkqtc2DgF9QzR93QQA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772715356; c=relaxed/relaxed;
	bh=vvGE6gnHSscvdSevVqCN3duQguMw4Y0vtNGaQUI/n54=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mzbp89NrvmmIaD2wobTvlqM9W4lNaXr98GH4TTzEpcLWLo5IWYT1pSH5FZWu793XH0jeDkIKGDsowFbjAYCBZM9FpD9Y2GzoX+jDWf5G+tQt0Cj5AodN4PAYWxZcjRVvM0gX5ANsSwaszQ/NRYH8kcTttTgBlzN2QZfc7KC8V4aakL6davMJ4pKlyfMC2iPhCSmMMt9iubZBQ7X5ZpEf6OKb7yWmD5rkXaVD5Fx3y2I+8Rl57yL9VrWqJCTw138JK30kV7IuhAzQ64zE3dQQslt766jALTlhS13mclYnuCkPBKrdDHgQ/dOG0AeWGu6uJRz4e0djZgcF0z2EULivlA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rU0+40/r; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gor@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rU0+40/r;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gor@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fRTzv2X9vz3c5f
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Mar 2026 23:55:54 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6250DwQk1552778;
	Thu, 5 Mar 2026 12:55:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=vvGE6g
	nHSscvdSevVqCN3duQguMw4Y0vtNGaQUI/n54=; b=rU0+40/rklJ4Syo/f8qHlA
	iULLan9ce2jSkdk1hwIYX8aJvwUhrJQaTNlDN/hyEU4a/6tUoXN5JfjkYf9ert3w
	dyra/TNvT60EaK44h1HiWViFS4diLGoBgUQUtDb3DiB6t0wB993tEuftoSg54i6f
	H6/5SGeonnwwfzvHBikf6ZZWekceEOOk34c+2W42UsVNnhgzu7hxtEhjNb7s5rLl
	S68ztLCJPhe86AkgbbuEurqF8Hg8wSzM7Bi+ETdpr9wtq1TQISqt0VnE13Gs1TYP
	NhNmT/C1v9/98MmNK3PgSXEv5UH3e0vJl8Qkqrw/fWclsLVl24JIDaOSiMJvEIBA
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cksjdkpxc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Mar 2026 12:55:13 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 625AVi0p027713;
	Thu, 5 Mar 2026 12:55:12 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4cmcwjk22v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Mar 2026 12:55:12 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 625Ct8KR42008960
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 5 Mar 2026 12:55:08 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 399BE20040;
	Thu,  5 Mar 2026 12:55:08 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4A91420043;
	Thu,  5 Mar 2026 12:55:06 +0000 (GMT)
Received: from localhost (unknown [9.111.42.248])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu,  5 Mar 2026 12:55:06 +0000 (GMT)
Date: Thu, 5 Mar 2026 13:55:04 +0100
From: Vasily Gorbik <gor@linux.ibm.com>
To: Mimi Zohar <zohar@linux.ibm.com>
Cc: linux-integrity@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
        Alexander Egorenkov <egorenar@linux.ibm.com>,
        Ard Biesheuvel <ardb@kernel.org>, Dave Hansen <dave.hansen@intel.com>,
        Coiby Xu <coxu@redhat.com>, Roberto Sassu <roberto.sassu@huawei.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
        Eric Snowberg <eric.snowberg@oracle.com>,
        Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)" <linuxppc-dev@lists.ozlabs.org>,
        "open list:S390 ARCHITECTURE" <linux-s390@vger.kernel.org>,
        "open list:EXTENSIBLE FIRMWARE INTERFACE (EFI)" <linux-efi@vger.kernel.org>,
        "open list:SECURITY SUBSYSTEM" <linux-security-module@vger.kernel.org>,
        "open list:KEYS/KEYRINGS_INTEGRITY" <keyrings@vger.kernel.org>
Subject: Re: [PATCH v3 1/3] integrity: Make arch_ima_get_secureboot
 integrity-wide
Message-ID: <c00-01.ttbfdx5@ub.hpns>
References: <20260213012851.2532722-2-coxu@redhat.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260213012851.2532722-2-coxu@redhat.com>
X-Patchwork-Bot: notify
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=M9BA6iws c=1 sm=1 tr=0 ts=69a97d31 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=U7nrCbtTmkRpXpFmAIza:22 a=VnNF1IyMAAAA:8
 a=i0EeH86SAAAA:8 a=20KFwNOVAAAA:8 a=AUlwxuCtR7j_SLPSBWAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: EPcEyA01XF8bdQhKETyO0He0srC1ORqs
X-Proofpoint-GUID: fcB-38EVrhsK1gZUaLMNQDW0DoyhHbQ2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDEwMyBTYWx0ZWRfX6AqyKde6/uqz
 060pERTYdbInWNW/0rjlV3pi+zAeTCerv+KA3vR9RMpOmATjWEBML18lzhudcK92tX66IFNcc8K
 xEKFaXlqifwFaQuw/qo22apWK/RnUUBPnuAxyYMTFQ1VPmoVFjyHcjQnuxaBFHBpfnYOdz7z0qh
 rsRT3RY0WsFBQN0/GEMSvzyhEGesCzEs1alXtqxCCJz5wJQlnDr05XQNSLo2PfInPDNryldDGtV
 dYjTQ7MejGFk5ZXRSrGnfg2SCuRUkgfhXPW7ERu7e3AMGYPAMaK9sFVIGvJPtkBLt1TM4knl4ov
 GAG6U9ydv7SJy6/PSQM/h1YBuRDA+cc3Q9L/yL7wj17/zvDxsHK8q1MfGJSIAof4YZtJcouRLuv
 61WhY0/z8/4KVy1SwpnbsucrybPa4Kvs8vZPvAmmVOULiaFrr7MQ1ehoFPR/UEPtdxEA5VQMcXC
 xam3fJ/WXRoyHGHahuw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_04,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050103
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: CE9B82122DA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-17775-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:zohar@linux.ibm.com,m:linux-integrity@vger.kernel.org,m:hca@linux.ibm.com,m:egorenar@linux.ibm.com,m:ardb@kernel.org,m:dave.hansen@intel.com,m:coxu@redhat.com,m:roberto.sassu@huawei.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:agordeev@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:dmitry.kasatkin@gmail.com,m:eric.snowberg@oracle.com,m:paul@paul-moore.com,m:jmorris@namei.org,m:serge@hallyn.com,m:jarkko@kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-s390@vger.kernel.org,m:linux-efi@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:keyrings@vger.kernel.org,m:dmitrykasatkin@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[gor@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[33];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gor@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.ibm.com,kernel.org,intel.com,redhat.com,huawei.com,ellerman.id.au,gmail.com,alien8.de,linux.intel.com,zytor.com,oracle.com,paul-moore.com,namei.org,hallyn.com,lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On Fri, Feb 13, 2026 at 09:28:46AM +0800, Coiby Xu wrote:
> EVM and other LSMs need the ability to query the secure boot status of
> the system, without directly calling the IMA arch_ima_get_secureboot
> function. Refactor the secure boot status check into a general function
> named arch_get_secureboot.
> 
> Reported-and-suggested-by: Mimi Zohar <zohar@linux.ibm.com>
> Suggested-by: Roberto Sassu <roberto.sassu@huawei.com>
> Signed-off-by: Coiby Xu <coxu@redhat.com>
> ---
>  MAINTAINERS                                   |  1 +
>  arch/powerpc/kernel/ima_arch.c                |  5 --
>  arch/powerpc/kernel/secure_boot.c             |  6 ++
>  arch/s390/kernel/ima_arch.c                   |  6 --
>  arch/s390/kernel/ipl.c                        |  5 ++
>  arch/x86/include/asm/efi.h                    |  4 +-
>  arch/x86/platform/efi/efi.c                   |  2 +-
>  include/linux/ima.h                           |  7 +--
>  include/linux/secure_boot.h                   | 19 +++++++
>  security/integrity/Makefile                   |  3 +-
>  security/integrity/efi_secureboot.c           | 56 +++++++++++++++++++
>  security/integrity/ima/ima_appraise.c         |  2 +-
>  security/integrity/ima/ima_efi.c              | 47 +---------------
>  security/integrity/ima/ima_main.c             |  3 +-
>  security/integrity/integrity.h                |  1 +
>  security/integrity/platform_certs/load_uefi.c |  2 +-
>  security/integrity/secure_boot.c              | 16 ++++++
>  17 files changed, 115 insertions(+), 70 deletions(-)
>  create mode 100644 include/linux/secure_boot.h
>  create mode 100644 security/integrity/efi_secureboot.c
>  create mode 100644 security/integrity/secure_boot.c

This triggers a warning on s390:

arch/s390/kernel/ipl.c:2507:6: warning: no previous prototype for ‘arch_get_secureboot’ [-Wmissing-prototypes]
 2507 | bool arch_get_secureboot(void)
      |      ^~~~~~~~~~~~~~~~~~~

@Mimi: could you please squash this fixup into the offending commit,
or pick it up separately?

Vasily Gorbik (1):
  s390/ipl: Fix missing arch_get_secureboot() prototype warning

 arch/s390/kernel/ipl.c | 1 +
 1 file changed, 1 insertion(+)

-- 
2.53.0

