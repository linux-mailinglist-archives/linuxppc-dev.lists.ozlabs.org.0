Return-Path: <linuxppc-dev+bounces-16753-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OMMiMgxHimmAJAAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16753-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Feb 2026 21:43:56 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 112C61147E3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Feb 2026 21:43:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f8xVw3mrBz2yGx;
	Tue, 10 Feb 2026 07:43:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770669832;
	cv=none; b=ITv0bbb+uhIhQfnMHvRPXUHEWxiiu55cM4xXps6bltiGF9uU8iXPyfkUDyN4QEHXS4NgE+4StyOpjEzwXcFfY8Q5TO8BtA4jKfLV3OdbZT/T3KJI/kWFNe5zckV0xx0VxYmkxf0usNEIi+e4oRSRyHqWBo4Gdu03VIsu/Z72DjMgoUI21CoRJh09hW5WflyNI3kliANJLaDGAjuNdXmY7gFdip5aqo6pX6lJL51nVaWGfeORsAqJRtFOEw6WaXU9dsIWonwHrx38j9IiTUS4UlxyN5Q38f4QspSkTDLmK9EU9pPt/zerCraGw6h7S7m4aAe0ajM7pvcjdC9SXTDXEA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770669832; c=relaxed/relaxed;
	bh=dop6p6rsLZKac/t5TeQjfJbjHcYGRmra2zjnHrlmz0E=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=TjBPn8t1M1k1l5Pr3Pbz2k3yZV3o5klkXAEntl95Etkyz1aAAsGPndL+9GSqcq5CH0dWNgu09/CniJCpjwqY8wSnty7/oLew8kT83k7ZRQ3SsAREDb1m7Iuo9HA2nfq62UjsbTaMl9YuHef1i4CTOhNxcEEpGIOOz351j8oCgRq8AEcguKOEeNSGM0xqkI7QGKKDe7P0szNtbOocR+ErpNwh02VFfXxJMJsoJL+wdDb61C7SaJBi9nVCYPEn7E6pMZnIeBM72Vo3DoMaWfZ24lhErD+1wpBGGIFkNhnSFzOeG2cNdFko1mO1dB/DoOHeHY/WVD0W01wNDTpqQQIYHg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tXt5ZzuV; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=zohar@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tXt5ZzuV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=zohar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f8xVt73bHz2xBV
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Feb 2026 07:43:50 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 619HKqDO883546;
	Mon, 9 Feb 2026 20:43:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=dop6p6
	rsLZKac/t5TeQjfJbjHcYGRmra2zjnHrlmz0E=; b=tXt5ZzuV3+5JXRaWSz9tDa
	QC6QZNurjqjxngLuSU7Td7b+kuQPXdq6I7ydsO/3slOeWxP8EtRrCgf/mCgbaDAk
	067Q3pJ49VfR9ZQM7irZ4CVDCttaeuF9BFiJSFaG5w519Xf4lXFWpNQfuVoA+Ozm
	/6BB98tjaF6b5tqr8bLO5jTtB+HoUjxDOkIXHsyAvH6z2Sh11xlNBCv3UeE2NNA0
	Ukn8mlzjnuKF5MKWbbp19/J/ULp1D7aUWhRgi87P3pNsspl1FjNGgDTw1JC+cqXo
	6LyJBUjHdo+8aA/F8NvJh0HH10WQfUf4jxImct3BSSow0YfbDQVUVgzyq5FSjYQQ
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4c696u96fr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Feb 2026 20:43:13 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 619ISMot012616;
	Mon, 9 Feb 2026 20:43:12 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4c6h7k6ja8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Feb 2026 20:43:12 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 619KhBL265012132
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 9 Feb 2026 20:43:11 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D41F25805D;
	Mon,  9 Feb 2026 20:43:10 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 16A9558055;
	Mon,  9 Feb 2026 20:43:09 +0000 (GMT)
Received: from li-43857255-d5e6-4659-90f1-fc5cee4750ad.ibm.com (unknown [9.61.108.92])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  9 Feb 2026 20:43:09 +0000 (GMT)
Message-ID: <66f9d13875e81a965984e2a661e992a3fe43c516.camel@linux.ibm.com>
Subject: Re: [PATCH v2 1/3] integrity: Make arch_ima_get_secureboot
 integrity-wide
From: Mimi Zohar <zohar@linux.ibm.com>
To: Coiby Xu <coxu@redhat.com>, linux-integrity@vger.kernel.org
Cc: Heiko Carstens <hca@linux.ibm.com>,
        Alexander Egorenkov	
 <egorenar@linux.ibm.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Dave Hansen	
 <dave.hansen@intel.com>,
        Roberto Sassu <roberto.sassu@huawei.com>,
        Madhavan
 Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin	 <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)"
 <chleroy@kernel.org>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev
 <agordeev@linux.ibm.com>,
        Christian Borntraeger	
 <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Thomas
 Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov
 <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "maintainer:X86
 ARCHITECTURE (32-BIT AND 64-BIT)"	 <x86@kernel.org>,
        "H. Peter Anvin"
 <hpa@zytor.com>,
        Dmitry Kasatkin	 <dmitry.kasatkin@gmail.com>,
        Eric
 Snowberg <eric.snowberg@oracle.com>,
        Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
        "Serge E. Hallyn"	 <serge@hallyn.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        open list	
 <linux-kernel@vger.kernel.org>,
        "open list:LINUX FOR POWERPC (32-BIT AND
 64-BIT)" <linuxppc-dev@lists.ozlabs.org>,
        "open list:S390 ARCHITECTURE"
 <linux-s390@vger.kernel.org>,
        "open list:EXTENSIBLE FIRMWARE INTERFACE
 (EFI)"	 <linux-efi@vger.kernel.org>,
        "open list:SECURITY SUBSYSTEM"	
 <linux-security-module@vger.kernel.org>,
        "open
 list:KEYS/KEYRINGS_INTEGRITY"	 <keyrings@vger.kernel.org>
In-Reply-To: <20260203041434.872784-2-coxu@redhat.com>
References: <20260203041434.872784-1-coxu@redhat.com>
	 <20260203041434.872784-2-coxu@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Feb 2026 15:43:08 -0500
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
X-Authority-Analysis: v=2.4 cv=KZnfcAYD c=1 sm=1 tr=0 ts=698a46e2 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VnNF1IyMAAAA:8
 a=i0EeH86SAAAA:8 a=20KFwNOVAAAA:8 a=4cj3x1ySzUcWov3_WBgA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDE2NyBTYWx0ZWRfX8NzdX8SjuD/z
 Jr6LoY8ySh8S2uljRfOdx3N6Y3IZkgvwOvV3vQ+MBs1IeAtCvNusu0RQligiYQ+OBLf92h6a+Q4
 s+tteIdVwupKFPapl7+ybHOa9dYBmVixKW368DUjb0UhC1/QlNRB/dvb2eWG9mO6lOGDZJWVS/e
 CyyEZdfMTE3fRMYSYNDXsQzAj5T/r210A4ZJvVuMAm1t5sQd+VW+hq7E3oON/pcJ1qk9NRTDI0z
 k4iWPmA3gQxZZ1osSzKF/0WmU7RmDRwXLUNGyzUy5DvxwDLO+YRDz9IkdBSznR9qvF8kPGQpuJI
 P5arwaGKksQkJc+uoOWXO7ZNb6MEz6BPUrTosOsTr3oYuKLkrkOC1PTEQ6yck6aFZfXH/OOdg+n
 BKRyuo7qOvIOIMda8QPQEK+WfsvptoSJQxaxeBTGRgYSzO7sO7SbQRhSneTExGmyXbIH0nQh+Y1
 vYmYuM5hpCdClYTI1yg==
X-Proofpoint-ORIG-GUID: qFeWjB0THaoEJqNN4oNEEH-uukJg8mvI
X-Proofpoint-GUID: EW8OSGEJoKAL3MfAfS-L_UR2r-2UpTiB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 clxscore=1011 suspectscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602090167
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
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
	TAGGED_FROM(0.00)[bounces-16753-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[huawei.com:email];
	FORGED_SENDER(0.00)[zohar@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[33];
	FORGED_RECIPIENTS(0.00)[m:coxu@redhat.com,m:linux-integrity@vger.kernel.org,m:hca@linux.ibm.com,m:egorenar@linux.ibm.com,m:ardb@kernel.org,m:dave.hansen@intel.com,m:roberto.sassu@huawei.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:dmitry.kasatkin@gmail.com,m:eric.snowberg@oracle.com,m:paul@paul-moore.com,m:jmorris@namei.org,m:serge@hallyn.com,m:jarkko@kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-s390@vger.kernel.org,m:linux-efi@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:keyrings@vger.kernel.org,m:dmitrykasatkin@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[linux.ibm.com,kernel.org,intel.com,huawei.com,ellerman.id.au,gmail.com,redhat.com,alien8.de,linux.intel.com,zytor.com,oracle.com,paul-moore.com,namei.org,hallyn.com,vger.kernel.org,lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zohar@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 112C61147E3
X-Rspamd-Action: no action

On Tue, 2026-02-03 at 12:14 +0800, Coiby Xu wrote:
> EVM and other LSMs need the ability to query the secure boot status of
> the system, without directly calling the IMA arch_ima_get_secureboot
> function. Refactor the secure boot status check into a general function
> named arch_get_secureboot.
>=20
> Reported-and-suggested-by: Mimi Zohar <zohar@linux.ibm.com>
> Suggested-by: Roberto Sassu <roberto.sassu@huawei.com>
> Signed-off-by: Coiby Xu <coxu@redhat.com>

Thanks, Coiby.  Other than unnecessarily splitting a line, the patch set lo=
oks
good.  As soon as the open window closes, I'll queue these patches for linu=
x-
next.

> diff --git a/security/integrity/ima/ima_efi.c b/security/integrity/ima/im=
a_efi.c
> index 138029bfcce1..27521d665d33 100644
> --- a/security/integrity/ima/ima_efi.c
> +++ b/security/integrity/ima/ima_efi.c
> @@ -2,52 +2,9 @@
>  /*
>   * Copyright (C) 2018 IBM Corporation
>   */
> -#include <linux/efi.h>
>  #include <linux/module.h>
>  #include <linux/ima.h>
> -#include <asm/efi.h>
> -
> -#ifndef arch_ima_efi_boot_mode
> -#define arch_ima_efi_boot_mode efi_secureboot_mode_unset
> -#endif
> -
> -static enum efi_secureboot_mode get_sb_mode(void)
> -{
> -	enum efi_secureboot_mode mode;
> -
> -	if (!efi_rt_services_supported(EFI_RT_SUPPORTED_GET_VARIABLE)) {
> -		pr_info("ima: secureboot mode unknown, no efi\n");
> -		return efi_secureboot_mode_unknown;
> -	}
> -
> -	mode =3D efi_get_secureboot_mode(efi.get_variable);
> -	if (mode =3D=3D efi_secureboot_mode_disabled)
> -		pr_info("ima: secureboot mode disabled\n");
> -	else if (mode =3D=3D efi_secureboot_mode_unknown)
> -		pr_info("ima: secureboot mode unknown\n");
> -	else
> -		pr_info("ima: secureboot mode enabled\n");
> -	return mode;
> -}
> -
> -bool arch_ima_get_secureboot(void)
> -{
> -	static enum efi_secureboot_mode sb_mode;
> -	static bool initialized;
> -
> -	if (!initialized && efi_enabled(EFI_BOOT)) {
> -		sb_mode =3D arch_ima_efi_boot_mode;
> -
> -		if (sb_mode =3D=3D efi_secureboot_mode_unset)
> -			sb_mode =3D get_sb_mode();
> -		initialized =3D true;
> -	}
> -
> -	if (sb_mode =3D=3D efi_secureboot_mode_enabled)
> -		return true;
> -	else
> -		return false;
> -}
> +#include <linux/secure_boot.h>
> =20
>  /* secureboot arch rules */
>  static const char * const sb_arch_rules[] =3D {
> @@ -67,7 +24,8 @@ static const char * const sb_arch_rules[] =3D {
> =20
>  const char * const *arch_get_ima_policy(void)
>  {
> -	if (IS_ENABLED(CONFIG_IMA_ARCH_POLICY) && arch_ima_get_secureboot()) {
> +	if (IS_ENABLED(CONFIG_IMA_ARCH_POLICY) &&
> +	    arch_get_secureboot()) {

No need to split the line here or below.


>  		if (IS_ENABLED(CONFIG_MODULE_SIG))
>  			set_module_sig_enforced();
>  		if (IS_ENABLED(CONFIG_KEXEC_SIG))
> diff --git a/security/integrity/ima/ima_main.c b/security/integrity/ima/i=
ma_main.c
> index 5770cf691912..6d093ac82a45 100644
> --- a/security/integrity/ima/ima_main.c
> +++ b/security/integrity/ima/ima_main.c
> @@ -949,8 +949,8 @@ static int ima_load_data(enum kernel_load_data_id id,=
 bool contents)
> =20
>  	switch (id) {
>  	case LOADING_KEXEC_IMAGE:
> -		if (IS_ENABLED(CONFIG_KEXEC_SIG)
> -		    && arch_ima_get_secureboot()) {
> +		if (IS_ENABLED(CONFIG_KEXEC_SIG) &&
> +		    arch_get_secureboot()) {

=3D=3D=3D>

Mimi

>  			pr_err("impossible to appraise a kernel image without a file descript=
or; try using kexec_file_load syscall.\n");
>  			return -EACCES;
>  		}

