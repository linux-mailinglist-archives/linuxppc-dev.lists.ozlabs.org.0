Return-Path: <linuxppc-dev+bounces-16687-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4NKPMDH+hWnUIwQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16687-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Feb 2026 15:44:01 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5D7FF22C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Feb 2026 15:44:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f6xg10GBXz309y;
	Sat, 07 Feb 2026 01:43:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770389036;
	cv=none; b=IBmjdo9GhGmUXC/kbUwav73wxJ9s/zrXRfop1hjTvdXOHlg3nujlhxWz/5yq/WjQoOz0cALiM/TuXLdTI3MtIPncg+wCqZAiflnk8M+g/7xHsOq+hOfcVC1gdloUCrpb3dJNu6ogMZyEPjB8Kc16zseCyFvweqwV9M7VeNROVh0O569uf8JHNTWxiPgPuLkfhTktdUiN+cAfdfndDIvU0gB4i2ymaKiCz0ax/D0QKpai5qe9tXsLgLM7MWuT2Mdwn6WYRvIoThONfpM4N/kN1pQX8TJxPYTmraJmJHpr9l4vD+HoF7UskL7wC7W+Y0zavE0v1AWuCX5NXz133wP4nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770389036; c=relaxed/relaxed;
	bh=Hz9qVNVZGZdp+UduZihqww8A8NBtXsW/XiHSVqdWBog=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=ZQCRrkBs6i0C8r92z90oMDn59txhaY0rTiVXAw/JoPOPFlMccxbX8nokdBd+w4m0ga1+r2PhIVfy+7sEqRvnpYAbJuSbVGHYNzB2USeTgZUJVdmKRGFfNaUCdVyVReEoonz76xK6vV9PD0CHjvLW3qjHjtlGdD1jppslgOE/biWLRSPlRGHbJiO0uZE9K7jprJoR6ZwC07mSH9I40/mxqQGpe4bTM4FKcytnJrLOfaWgI9eLaWAq05VWT1/ke9aDl67ed5BagfIUyEbijiwHXcgdYqvbEaBdWBZbgCwA534njul3A7u1P85zyzDwKti/edVrKw1ekGUouPz7TyVrkg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DqdPNaTk; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DqdPNaTk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f6xfz4VLZz2xpg
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 07 Feb 2026 01:43:55 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 616DJsTf029959;
	Fri, 6 Feb 2026 14:43:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Hz9qVN
	VZGZdp+UduZihqww8A8NBtXsW/XiHSVqdWBog=; b=DqdPNaTk42nOrU+W+I7054
	ANQXPIZ8zlTnquZKY/hmVqbRWx4jw4XWAPyHj+VxbswTnIB8+JF84tWX0LMV/rlC
	jQHPlgeIusuqBsVBJumwScAFw63vSDSdc0C870ZM198HYcMshcjpzglDtvQy5o8V
	m+hsdya+/OND2oTJdcBHmw06JzBW88DlNAbBifiXBMczjgTcVYNHJdZcM1j9Oze+
	o3oGehLoM2qGV2vNx7OMYk/pJILALuliejo2tvS6KrFF8ftvPjWJL99sLTu7L512
	8QJhLbzTu/N00UhVJhj7Nh8YhM8vDc5WANpacetrVzdvcXK4RC9WfWr0rNOYBdng
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4c175n8yp9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Feb 2026 14:43:41 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 616EhfFI021889;
	Fri, 6 Feb 2026 14:43:41 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4c175n8yp7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Feb 2026 14:43:41 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 616C33Gn025735;
	Fri, 6 Feb 2026 14:43:40 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4c1w2n6fw4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Feb 2026 14:43:40 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 616Ehd6B49414566
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 6 Feb 2026 14:43:39 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0933D58056;
	Fri,  6 Feb 2026 14:43:39 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E148358065;
	Fri,  6 Feb 2026 14:43:35 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.249.149])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTPS;
	Fri,  6 Feb 2026 14:43:35 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
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
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [PATCH] powerpc/pseries: plpks: export
 plpks_wrapping_is_supported
From: Venkat <venkat88@linux.ibm.com>
In-Reply-To: <20260201165344.950870-1-ssrish@linux.ibm.com>
Date: Fri, 6 Feb 2026 20:13:22 +0530
Cc: linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mpe@ellerman.id.au,
        npiggin@gmail.com, christophe.leroy@csgroup.eu, nayna@linux.ibm.com,
        zohar@linux.ibm.com, rnsastry@linux.ibm.com,
        linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <8798DBE0-4A30-44E8-9DAA-39F5BB896286@linux.ibm.com>
References: <20260201165344.950870-1-ssrish@linux.ibm.com>
To: Srish Srinivasan <ssrish@linux.ibm.com>
X-Mailer: Apple Mail (2.3864.300.41.1.7)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: DQQ8FoPb_52wGv0rjeoY64PT6l88kqSL
X-Authority-Analysis: v=2.4 cv=VcX6/Vp9 c=1 sm=1 tr=0 ts=6985fe1e cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=QyXUC8HyAAAA:8 a=UCwz8Agq20yTxG7mFaMA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: xcw7fAzu84bjuCAra8NVY15vtFMhwJTS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDEwMyBTYWx0ZWRfXwr1ycHhTtYV/
 WxU+pRaZLA17yLICVjpvsPSGBdDEkIc51Ng0W8dGiEm2SPSIxvOL0KPWY7FEbw5ALBvAvbbwHHn
 SSUOeCQe3EVNrzpdjIsFHNUj7iE6lso62+zD2Xt6uMVzjJKOo892YHt7wuPiNFjEhrbdx6AWzi0
 eAYj1Xb4+99ShyyiHO1Xz25fTU+eUnzhSuwJTX6y0Z4qK7/EfJLjFa/KDpl2lsIHCx5KDaDV1wO
 C66pUdLNBzjJKdmGOT/Yow2ZV6f+awIpDwiEhbc+J+t11iz2Bq+iHmMRGUkASdscwEnM2Y9jF9Z
 DCP0JeVPQiVJUNXKMh2RAVgjbWgVPyfsQeDnul4whnH1RmNkUcAenvWWBMnfgRRGjcnGQP3z8HE
 I27mr2812AATrMPYIq6yqcJaWuB+3X1buuxGVUEjSTRSchpFOlPnlTBffyJM3w6REAAp7BckBZV
 7BKIkihPjngDJgOqsww==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_04,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2601150000 definitions=main-2602060103
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.ozlabs.org,linux.ibm.com,ellerman.id.au,gmail.com,csgroup.eu,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-16687-lists,linuxppc-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	FROM_NEQ_ENVFROM(0.00)[venkat88@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: 9A5D7FF22C
X-Rspamd-Action: no action



> On 1 Feb 2026, at 10:23=E2=80=AFPM, Srish Srinivasan =
<ssrish@linux.ibm.com> wrote:
>=20
> Building trusted-keys as a module fails modpost with:
>=20
> ERROR: modpost: "plpks_wrapping_is_supported" =
[security/keys/trusted-keys/
> trusted.ko] undefined!
>=20
> Export plpks_wrapping_is_supported() so trusted-keys links cleanly
>=20
> This patch is intended to be applied on top of the earlier "Extend =
"trusted
> " keys to support a new trust source named the PowerVM Key Wrapping =
Module
> (PKWM)" series (v5).
> Link: =
https://lore.kernel.org/all/20260127145228.48320-1-ssrish@linux.ibm.com/
>=20
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: =
https://lore.kernel.org/oe-kbuild-all/202602010724.1g9hbLKv-lkp@intel.com/=

> Signed-off-by: Srish Srinivasan <ssrish@linux.ibm.com>
> ---
> arch/powerpc/platforms/pseries/plpks.c | 1 +
> 1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/powerpc/platforms/pseries/plpks.c =
b/arch/powerpc/platforms/pseries/plpks.c
> index 038ecf8f6d6b..23e4e2a922fc 100644
> --- a/arch/powerpc/platforms/pseries/plpks.c
> +++ b/arch/powerpc/platforms/pseries/plpks.c
> @@ -896,6 +896,7 @@ bool plpks_wrapping_is_supported(void)
> {
> return wrapsupport;
> }
> +EXPORT_SYMBOL_GPL(plpks_wrapping_is_supported);
>=20
> /**
>  * plpks_gen_wrapping_key() - Generate a new random key with the =
'wrapping key'
> --=20
> 2.47.3
>=20

Tested this patch, and with this, build is successful.

With out this patch:

ERROR: modpost: "plpks_wrapping_is_supported" =
[security/keys/trusted-keys/trusted.ko] undefined!
make[2]: *** [scripts/Makefile.modpost:147: Module.symvers] Error 1
make[1]: *** [/root/linux/Makefile:2004: modpost] Error 2
make: *** [Makefile:248: __sub-make] Error 2

With this build is successful.

Please add below tag.

Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>

Regards,
Venkat.


