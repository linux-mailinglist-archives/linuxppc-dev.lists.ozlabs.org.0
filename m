Return-Path: <linuxppc-dev+bounces-17407-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OD05JO/goWlcwgQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17407-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Feb 2026 19:22:39 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E951BBF12
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Feb 2026 19:22:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fMxWZ08YNz2xYw;
	Sat, 28 Feb 2026 05:22:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772216553;
	cv=none; b=nHSjV9ppJ5yyXgsvE4F2oolP9MspDwwnSkfUozxXOhBWkB43TSyVsQLUg/aIjtiL8gk81xc3CcZdUI3k5z9yjG1xJmi9bfJxAXbkTN5NNPaxfUu4HD7nCt2OAl2oyXcN03zTpPi+f2sJMpC18TTxAz6tmZPe4VIWlQXj9C+DVYVqNHLOxO+uiG/XGlQPUz7cujmjKm3p4NQPgsrxNpGxIiZRUpdBp3qoWsHQT8gu8PMHsFoTCiTklL8cgjR6fusdipC+dLensqGw7O+TDcL/LCKEki0c8YtP+CorDm4Ux2hsTlddMk2O71HFXdJZGd4vPQDtdTvrTSqNrt0uFrl1HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772216553; c=relaxed/relaxed;
	bh=NDkVbvXOLq/UuXTo/484ujl50Ey1letRdpgIS+1Py0k=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=fYX7gtrF09Do4RzKa/Q3HXQKcLXyotbAwydrWrWc5HZJrb9EBg26ruZhCHAedtfGWzfsCAe8EBWqqPOCwNQvhzh+2dHT+zk0mgvkRzb6pSrGL5CGEiIcjWojKatJ5PTlAI2Lm5xGbe+j0GaOpBKxqIjaWOHMDDg4unk25CTtd37G8ak717TXY4ymRSo9dUqqE5+g3ZtDsBdYp33UOL7sYEsrSsmQzug3bz2TSWSloZSFBGiUP0WCS50vTd8+G1HQLSA3VY/5A88qMBPDbJr3HgM71W7edIkRoWw5azKZ7zLsmvRZ46PYtMrOPm5NFUFBuwJJQ7s4oS52hMXBmCdcuw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=W/J9uZLp; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=zohar@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=W/J9uZLp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=zohar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fMxWX2XD6z2xKh
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Feb 2026 05:22:31 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R9UfYW3273855;
	Fri, 27 Feb 2026 18:22:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=NDkVbv
	XOLq/UuXTo/484ujl50Ey1letRdpgIS+1Py0k=; b=W/J9uZLp0P1qVk4fPMFeB6
	L+ICq3PWRlcgvAIUbaFqw8XfQzHz+JDEo+AC0tQm/1Dr2T5XJvsF1TDeNUAHYfbV
	Fq5lfAWj1XKLb6PrZJukyIeya5czSxqZv3jhjAszjYMbbb9XwrV7R3dKHoBq/OGE
	NYUzqTiDDfCInd8jovuwQoSfpKoTOONhf/FwW5HG4/DuUK2sJEfoTUIJ4bHtdVhs
	keNjoRA8rTpSczOFl7boZMbvQnp/Mov3E+ritGQ2QtpXturhY5qmZZXBs6rljq2C
	NLGURupu8utN+qZvBVKGTNBCxRRicdaF/LOU2crfSBgXmPCWgDQTM29YmmwEV2hw
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cf472e6e3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Feb 2026 18:22:01 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61RHt9Ov013478;
	Fri, 27 Feb 2026 18:22:00 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4cfqdykn14-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Feb 2026 18:21:59 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61RILxAq15532556
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Feb 2026 18:21:59 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 87CF35805C;
	Fri, 27 Feb 2026 18:21:59 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C110758058;
	Fri, 27 Feb 2026 18:21:57 +0000 (GMT)
Received: from li-43857255-d5e6-4659-90f1-fc5cee4750ad.ibm.com (unknown [9.61.86.1])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 27 Feb 2026 18:21:57 +0000 (GMT)
Message-ID: <180f9f992ce862837058e7db943b117f2cc8a4ca.camel@linux.ibm.com>
Subject: Re: [PATCH 1/2] ima: efi: Drop unnecessary check for
 CONFIG_MODULE_SIG/CONFIG_KEXEC_SIG
From: Mimi Zohar <zohar@linux.ibm.com>
To: Thomas =?ISO-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
        Roberto
 Sassu	 <roberto.sassu@huawei.com>,
        Dmitry Kasatkin
 <dmitry.kasatkin@gmail.com>,
        Eric Snowberg <eric.snowberg@oracle.com>,
        Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
        "Serge
 E. Hallyn"	 <serge@hallyn.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman	 <mpe@ellerman.id.au>,
        Nicholas Piggin
 <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        Aaron Tomlin	
 <atomlin@atomlin.com>, Nicolas Schier <nsc@kernel.org>
In-Reply-To: <20260226-ima-ifdef-v1-1-8b9613edbbdb@weissschuh.net>
References: <20260226-ima-ifdef-v1-0-8b9613edbbdb@weissschuh.net>
	 <20260226-ima-ifdef-v1-1-8b9613edbbdb@weissschuh.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Feb 2026 13:21:57 -0500
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
X-Proofpoint-ORIG-GUID: pFfTqbmMglxjGmMQbh6ifL8AVyznQOeB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDE2MSBTYWx0ZWRfX8RjHmLPn9Sxy
 4I/RxNiX35lk4eFc4bbJm6PQRDE2mq09dc/szklGe7CNHj7sSszun3qWY/PejlkQP1FggxmTdQF
 lLySu8Ak1NxB+3CibRjTB7jcyjVTQ/eAIyc//4whOuL8MV1NQ5Ghi0h60XXKjbcCfmIIMEEZ2IZ
 bfqFivQmZEwpz/ubKgsGaeoMP3eInNSJiGZOK3+n6Pxv5J34YhV24OW651C9fR+uYfVv1bZBqYP
 H7BjOEAINMojziHR/mThcTI4rgdEupNd7j232CUV+aNO6G3MJWBnKHxwTU9NRsDMyORPBFrgImb
 yWGIxGJa9A8ryAN8y7N7jCfukFmRJCT7YtP3mxd3ETLbDyJx409GEGGB1a3ZxI6QKAt8crtDq/C
 oafpedlpfPWHrQeP7xpiuXRrzknOz83IxYYYtPCe/2G7LhUTWWbYVYqiXsDQLi1Wy3IFi4e6Z8C
 wexYaoSXHDNdvnCzRiQ==
X-Authority-Analysis: v=2.4 cv=R7wO2NRX c=1 sm=1 tr=0 ts=69a1e0c9 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VTue-mJiAAAA:8
 a=VnNF1IyMAAAA:8 a=j-LfP5YGAAAA:8 a=VwQbUJbxAAAA:8 a=Kxd9cklhb0fStvzIxPUA:9
 a=QEXdDO2ut3YA:10 a=S9YjYK_EKPFYWS37g-LV:22 a=pci6KG57UX3UzFLC8IW4:22
X-Proofpoint-GUID: eRNUudb7ia1erSVYZK7al1Uq3mtQQXYL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1011 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602270161
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
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-17407-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux@weissschuh.net,m:roberto.sassu@huawei.com,m:dmitry.kasatkin@gmail.com,m:eric.snowberg@oracle.com,m:paul@paul-moore.com,m:jmorris@namei.org,m:serge@hallyn.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:linux-integrity@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:atomlin@atomlin.com,m:nsc@kernel.org,m:dmitrykasatkin@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[zohar@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_TO(0.00)[weissschuh.net,huawei.com,gmail.com,oracle.com,paul-moore.com,namei.org,hallyn.com,linux.ibm.com,ellerman.id.au,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[weissschuh.net:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns,linux.ibm.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[zohar@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 01E951BBF12
X-Rspamd-Action: no action

On Thu, 2026-02-26 at 08:20 +0100, Thomas Wei=C3=9Fschuh wrote:
> When configuration settings are disabled the guarded functions are
> defined as empty stubs, so the check is unnecessary.
>=20
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>
> Reviewed-by: Aaron Tomlin <atomlin@atomlin.com>
> Reviewed-by: Nicolas Schier <nsc@kernel.org>
> ---
>  security/integrity/ima/ima_efi.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/security/integrity/ima/ima_efi.c b/security/integrity/ima/im=
a_efi.c
> index 138029bfcce1..a35dd166ad47 100644
> --- a/security/integrity/ima/ima_efi.c
> +++ b/security/integrity/ima/ima_efi.c
> @@ -68,10 +68,8 @@ static const char * const sb_arch_rules[] =3D {
>  const char * const *arch_get_ima_policy(void)
>  {
>  	if (IS_ENABLED(CONFIG_IMA_ARCH_POLICY) && arch_ima_get_secureboot()) {
> -		if (IS_ENABLED(CONFIG_MODULE_SIG))
> -			set_module_sig_enforced();
> -		if (IS_ENABLED(CONFIG_KEXEC_SIG))
> -			set_kexec_sig_enforced();
> +		set_module_sig_enforced();
> +		set_kexec_sig_enforced();
>  		return sb_arch_rules;
>  	}
>  	return NULL;

Thanks, Thomas.

With commit 63e8a44395a4 ("integrity: Make arch_ima_get_secureboot integrit=
y-
wide"), there was a merge conflict.  After fixing the merge conflict, your
patches are now queued in next-integrity.

Mimi

