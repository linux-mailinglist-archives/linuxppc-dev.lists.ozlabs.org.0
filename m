Return-Path: <linuxppc-dev+bounces-8578-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4F7AB6EFE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 May 2025 17:10:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZyGwm5WRKz2yrt;
	Thu, 15 May 2025 01:10:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747235400;
	cv=none; b=DC8Qewyy8UFySebuTqe40qfchNreTb8AiqfyGXW2MEK1IhR+zDbtJ0Vc1b1tFBFvwV36nHSYHgF/txMuPKKSUXjumuE667H6CHBPyoyxJlLXNDL2iuVuDScvQ6dgHMeXuP4889CCKefXCbWyFH3WCSW5juw7iWxRW9pzPDQqf0Ov6krbi6UK0EIFHUU/fcejLdMAFdoKO7F6eqan8QBgbleznH5ffF50SjulVedPSRCcX+2lIPMUDqY+jQJLOIJ1U3mXQ5Y/Ewgrorw6zsWYrwgxwwMhuLeB2lYX/z6JeyrzcHkYwiCkNeJ+oEDJaEyuoe9D+q8dcAtyrXYBquvnbA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747235400; c=relaxed/relaxed;
	bh=SGLS4mX8Cr6nBhXohVGb4hxEdStSi2AhSRa+lOkd6Rc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gj1vK7uFeQ9M0IJnUn3u9nw/EUH8URHWW22uUpb50ahzWVJxH23/7Y6SHuGjju8HsN+NYVjXY6oR6KNxAdGup5E/EdA43uwF3WBvTcUkODAARNEXmbGCflRUc0Tpb2gwUJ5wync+KORCJXW1TjovmBO1dfubwkbtNCVfTbMbz9E9JQyuRNtctoenAUAfcNdXwurbT+JpALGBMBcY1hK0dsZxVHGpXA9KuO3AnWchIP2Zowwl2zfA0roYc91IUcGInm1leM0xn1qksYxm0VOYneR0+xQ2cQgJukaoUwHIzWgJb/qJqjTNtC+BIbHSK8dEK3MtNsGkAftNqcuol3ah+w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EDeEF4IO; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=zohar@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EDeEF4IO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=zohar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZyGwl4v7sz2yr6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 May 2025 01:09:59 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EEn9jI025341;
	Wed, 14 May 2025 15:09:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=SGLS4m
	X8Cr6nBhXohVGb4hxEdStSi2AhSRa+lOkd6Rc=; b=EDeEF4IOYx2AE+f7lPQiyF
	IRyvtU0UyyfLRz/m/EGB2YPnrJj9LgYYnyKusAffnlttd89Nis4X+sz92EjzQjpd
	jwWTsThw+Y5GLOMoGOaVRMfV0OIZuKKtHGSOKF/3U3aCRx6MlSPpa8KnmJhef1VP
	aN0cNxncPfkE7KPekD8F3idZQdgoQUBsveGNHXvz7wwQbEnYCE8lqtt4iwtDXWi4
	CRAafK2tdRSH6gutURszp7nStU4k4ZayI86IjkNBuD7e4q5LDAL/8q+NRhvdodVD
	z0xzgPw0UIRz+jrbwxRGYTycmQN76r39KZq4wMWTuDGk5HgF+HaIttAexs8pYn9Q
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46mbs6mygm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 15:09:21 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54EF3ppg015552;
	Wed, 14 May 2025 15:09:20 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46mbs6mygh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 15:09:20 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54EDIrZ4026656;
	Wed, 14 May 2025 15:09:19 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 46mbfpcun1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 15:09:19 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54EF9JUY61669786
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 May 2025 15:09:19 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F3F885805D;
	Wed, 14 May 2025 15:09:18 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F2A225805C;
	Wed, 14 May 2025 15:09:15 +0000 (GMT)
Received: from li-43857255-d5e6-4659-90f1-fc5cee4750ad.ibm.com (unknown [9.61.139.222])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 14 May 2025 15:09:15 +0000 (GMT)
Message-ID: <10ca077d6d51fac10e56c94db4205a482946d15f.camel@linux.ibm.com>
Subject: Re: [PATCH v3 2/9] ima: efi: Drop unnecessary check for
 CONFIG_MODULE_SIG/CONFIG_KEXEC_SIG
From: Mimi Zohar <zohar@linux.ibm.com>
To: Thomas =?ISO-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
        Masahiro
 Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>, Arnd
 Bergmann <arnd@arndb.de>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Petr Pavlu
 <petr.pavlu@suse.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Daniel
 Gomez <da.gomez@samsung.com>, Paul Moore <paul@paul-moore.com>,
        James
 Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        Jonathan
 Corbet <corbet@lwn.net>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael
 Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao
 <naveen@kernel.org>,
        Roberto Sassu <roberto.sassu@huawei.com>,
        Dmitry
 Kasatkin <dmitry.kasatkin@gmail.com>,
        Eric Snowberg
 <eric.snowberg@oracle.com>,
        Nicolas Schier <nicolas.schier@linux.dev>
Cc: Fabian =?ISO-8859-1?Q?Gr=FCnbichler?= <f.gruenbichler@proxmox.com>,
        Arnout Engelen <arnout@bzzt.net>, Mattia Rizzolo <mattia@mapreri.org>,
        kpcyrd <kpcyrd@archlinux.org>, Christian Heusel <christian@heusel.eu>,
        =?ISO-8859-1?Q?C=E2ju?= Mihai-Drosi <mcaju95@gmail.com>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arch@vger.kernel.org, linux-modules@vger.kernel.org,
        linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-integrity@vger.kernel.org
Date: Wed, 14 May 2025 11:09:15 -0400
In-Reply-To: <20250429-module-hashes-v3-2-00e9258def9e@weissschuh.net>
References: <20250429-module-hashes-v3-0-00e9258def9e@weissschuh.net>
	 <20250429-module-hashes-v3-2-00e9258def9e@weissschuh.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDEzNSBTYWx0ZWRfXxHBh49BiMB+Z MOVdYBkj3WfGeCvyIQdcjIWtbvhdgBJDYmtH6aIKRjRnMJBKYgzpPmkHWOOqemh7EtoawfXuMN4 eKKgq7Ry6EeCtJw7jp7/S2fYItn19YaPW+hBVQRi+4t3a5UAZNQ5UPInke8w30g5b8se68ZT7Ax
 uyX1Mp5KfZEBF1+6kD3JyFEbD6Ba5ORKHBGX2UYN+mA+u9b5PNgiZ4CrEnefA6hvAWwSLzSGVz5 lfZsKkS3N4Z5aAyu4/uL9doUnd4OJRE2qSwiQt6qWZvzc77oDfFAmcU2G+ATyRKgE9IvpviTCgs UWQHCPNHhWFnBgTjcLgT6zGCCSV8LvhiQkuSOBWZC40lmYxl/++p50z0pqMJ3qtG/nPGT+SAqw5
 AgDBYLW1PLqYSYudLSRYQO3vcficUjVtjVwE+OfIpvmnKwF2qJ8sxjnazQ4TXbapLUyVp0K4
X-Proofpoint-ORIG-GUID: j22mpxTFY4WP2OwphhpcY-gxyz0D7Xyv
X-Authority-Analysis: v=2.4 cv=d5f1yQjE c=1 sm=1 tr=0 ts=6824b221 cx=c_pps a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VTue-mJiAAAA:8 a=GYJFTEJjVrNzjNUGXfAA:9 a=QEXdDO2ut3YA:10
 a=S9YjYK_EKPFYWS37g-LV:22
X-Proofpoint-GUID: DQ7JcpUJJQk_GINm-Q0_GETzDy7ehAm2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 spamscore=0 clxscore=1011 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 mlxlogscore=999 impostorscore=0 adultscore=0 phishscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140135
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, 2025-04-29 at 15:04 +0200, Thomas Wei=C3=9Fschuh wrote:
> When configuration settings are disabled the guarded functions are
> defined as empty stubs, so the check is unnecessary.
> The specific configuration option for set_module_sig_enforced() is
> about to change and removing the checks avoids some later churn.
>=20
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
>=20
> ---
> This patch is not strictly necessary right now, but makes looking for
> usages of CONFIG_MODULE_SIG easier.
> ---
> =C2=A0security/integrity/ima/ima_efi.c | 6 ++----
> =C2=A01 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/security/integrity/ima/ima_efi.c b/security/integrity/ima/im=
a_efi.c
> index
> 138029bfcce1e40ef37700c15e30909f6e9b4f2d..a35dd166ad47beb4a7d46cc3e8fc604=
f57e03ecb
> 100644
> --- a/security/integrity/ima/ima_efi.c
> +++ b/security/integrity/ima/ima_efi.c
> @@ -68,10 +68,8 @@ static const char * const sb_arch_rules[] =3D {
> =C2=A0const char * const *arch_get_ima_policy(void)
> =C2=A0{
> =C2=A0	if (IS_ENABLED(CONFIG_IMA_ARCH_POLICY) && arch_ima_get_secureboot(=
)) {
> -		if (IS_ENABLED(CONFIG_MODULE_SIG))
> -			set_module_sig_enforced();
> -		if (IS_ENABLED(CONFIG_KEXEC_SIG))
> -			set_kexec_sig_enforced();
> +		set_module_sig_enforced();
> +		set_kexec_sig_enforced();
> =C2=A0		return sb_arch_rules;

Hi Thomas,

I'm just getting to looking at this patch set.  Sorry for the delay.

Testing whether CONFIG_MODULE_SIG and CONFIG_KEXEC_SIG are configured gives=
 priority
to them, rather than to the IMA support.  Without any other changes, both s=
ignature
verifications would be enforced.  Is that the intention?

Mimi

> =C2=A0	}
> =C2=A0	return NULL;
>=20


