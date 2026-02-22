Return-Path: <linuxppc-dev+bounces-17007-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id NYPIKcv9mmkOpQMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17007-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Feb 2026 13:59:55 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 800EA16F172
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Feb 2026 13:59:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fJkbW4mtMz30T8;
	Sun, 22 Feb 2026 23:59:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771765191;
	cv=none; b=LA4S3I+aQBVdTkOZkwAzgL1ICOBeXQgSd46z0njHCdQqRqy0QsaOWcyPXJAMrca/CrrKdcDbQcjbatr8yKbRPQ8GvVqJdQGUZ8lY86hUP/A84m9RReV/YowzrLs/Xk+AoB4fH0i6hcBEsciSSP7Slw2m9R5ovDK68T8KBeVgyjedFs7SkH65ULO6q7vhADTkDpkbyw4Np0/R40GPI8mxttC0TElXCzWaWQYjhEt8bg9tFwaoKuZ1Azy8sVoiguuR+UA3dNRcWryFduSS+P8gE2P8S19TB4J7AKxaV/6sCEVjyweEZwdcIA177jh/oaNd5Kpqhw65GnglZN6ih4NU8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771765191; c=relaxed/relaxed;
	bh=aaOuQQBLUtp5r4Ygsdkzhk2jnJr/Mu40ua360qQlztk=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=XvYJgIbPyDFfIWd+5P8AdsjlpSgH85eZzfzT5WI/rXW8YII70pVD+lVbIMb9aRaHULBpVYc7fGYmEgvAoAPwk7qv27E27hbWuPpPPc3Lhw2V80U6JkB/OmE+HSkkjGb7RaygTrr0UR6nb7oZF4Kqo3S+MZ6mlZ8qnoT2eQBNZSrj9yjbJJmAoyVjtF+qFcahPVD6CduC3SKFTkdpDBZ2iTZjNWXiG4CdaZXUzBiovSMzriL2FPfjVxnDwamdizOzl78XOlBzNEbzdkAyEgS1GumUqJw6IybSFaTapHYFI4mrzEW9dOPEpJWk86XRMVXekaTWFxt9WlhizcdMdQzZNw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YjIwrMke; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YjIwrMke;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fJkbV313Hz2xm5
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Feb 2026 23:59:49 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61M5P3pE762357;
	Sun, 22 Feb 2026 12:59:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=aaOuQQ
	BLUtp5r4Ygsdkzhk2jnJr/Mu40ua360qQlztk=; b=YjIwrMkeSFXNbzVXrNo3nf
	9sV1tSpcnNtN/IlvX9aAmrXZYEhi+vJXBedZ+l28RUbvhg58AY5TZBIRN6ECw4cP
	/v2psqli0zpUCG93igexLDKNx0MCgdOX1vKT8qUCsItL/L0EIR805WfKdo0wHx+s
	Y5hbaaKdd9hK0VR7k+sYaBtpl1ZoEb4ltiatXYcVf2vAPzSs6QPmCZdfXDLQul1J
	AFw6nnTVcuVUK9PpM53w2Zd9csfma5tGikTdBPC7iZkaT0XT70bOECN2tD9U3gJy
	LDy9XOP7rXyH3YJV1zk5S8Ep4vghrC6DlCgwyiBndnXjyd5cnl/bwpTuE8rYb7Ww
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cf4e33yjr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 22 Feb 2026 12:59:45 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61MA6IiS003397;
	Sun, 22 Feb 2026 12:59:44 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4cfs8jh7kh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 22 Feb 2026 12:59:44 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61MCxhU320644462
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 22 Feb 2026 12:59:43 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6C49858056;
	Sun, 22 Feb 2026 12:59:43 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CB90458052;
	Sun, 22 Feb 2026 12:59:40 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.255.192])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTPS;
	Sun, 22 Feb 2026 12:59:40 +0000 (GMT)
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
Subject: Re: [PATCH 1/2] powerpc: fix KUAP warning in VMX usercopy path
From: Venkat <venkat88@linux.ibm.com>
In-Reply-To: <20260217124457.89219-1-sayalip@linux.ibm.com>
Date: Sun, 22 Feb 2026 18:29:27 +0530
Cc: linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, aboorvad@linux.ibm.com,
        sshegde@linux.ibm.com, chleroy@kernel.org, riteshh@linux.ibm.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <C598FE0E-3C65-48D8-9785-64FEC2D3BC79@linux.ibm.com>
References: <20260217124457.89219-1-sayalip@linux.ibm.com>
To: Sayali Patil <sayalip@linux.ibm.com>
X-Mailer: Apple Mail (2.3864.300.41.1.7)
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=XMs9iAhE c=1 sm=1 tr=0 ts=699afdc1 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=6XaZVPkLeUlOjJse_H0A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: m7uOCo5oCITpCLs7BLBQGokzACIAX_Kx
X-Proofpoint-ORIG-GUID: m7uOCo5oCITpCLs7BLBQGokzACIAX_Kx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIyMDEyMiBTYWx0ZWRfX9+aX+mh8ADi5
 2KOhkjuL6IM02f9uuDNnLjGXXO3UVgbK65v7M+2sBjnRzXmXumXnA7acJGwLWkvVZIJrE7jfcdG
 xulgaQnfjyKqQhIHkvNyuRuEjz6lJZib/ly7cI1PO3SZ237jn9JYVuAdnReKXH/TMCvQR3ETJnf
 LDnD1O23qz1lpdEDpFMmmU/DcA0PEKLfQyjrKLJAVjkRArohRlcVcxFAkDVQ6Kuc+nCOK17hT7Z
 6x8g7093ia0B3c+NEa7kYUSVso3ytqJofz0rkA35hzOqM7qJ9MvyozA1Pp9tk/B4v3ueOl1xNer
 iUK/bNZd8PYxvCISSWNz959DqPWG1ulaATfq8+0zYioB8DH+xIEk2J5er/RkLrSRMPITLta3Qhf
 igBapKjPeVQ9cXSOCpGKbhmHKdWQQ3OnQe0hNJX7yatfUkIpuOX0dTmzB42JchDLQSqY9ireg8u
 t9bwqh2071g2hzNjPHg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-22_02,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602220122
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	TAGGED_FROM(0.00)[bounces-17007-lists,linuxppc-dev=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[venkat88@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 800EA16F172
X-Rspamd-Action: no action



> On 17 Feb 2026, at 6:14=E2=80=AFPM, Sayali Patil =
<sayalip@linux.ibm.com> wrote:
>=20
> On powerpc with PREEMPT_FULL or PREEMPT_LAZY and function tracing =
enabled,
> KUAP warnings can be triggered from the VMX usercopy path under memory
> stress workloads.
>=20
> KUAP requires that no subfunctions are called once userspace access =
has
> been enabled. The existing VMX copy implementation violates this
> requirement by invoking enter_vmx_usercopy() from the assembly path =
after
> userspace access has already been enabled. If preemption occurs
> in this window, the AMR state may not be preserved correctly,
> leading to unexpected userspace access state and resulting in
> KUAP warnings.
>=20
> Fix this by moving VMX selection and enter_vmx_usercopy()/
> exit_vmx_usercopy() handling into the raw_copy_{to,from,in}_user()
> wrappers in uaccess.h. The new flow is:
>=20
>  - Decide whether to use the VMX path based on size and CPU capability
>  - Call enter_vmx_usercopy() before enabling userspace access
>  - Enable userspace access and perform the VMX copy
>  - Disable userspace access
>  - Call exit_vmx_usercopy()
>  - Fall back to the base copy routine if the VMX copy faults
>=20
> With this change, the VMX assembly routines no longer perform VMX =
state
> management or call helper functions; they only implement the
> copy operations.
> The previous feature-section based VMX selection inside
> __copy_tofrom_user_power7() is removed, and a dedicated
> __copy_tofrom_user_power7_vmx() entry point is introduced.
>=20
> This ensures correct KUAP ordering, avoids subfunction calls
> while KUAP is unlocked, and eliminates the warnings while preserving
> the VMX fast path.
>=20
> Fixes: de78a9c42a79 ("powerpc: Add a framework for Kernel Userspace =
Access Protection")
> Reported-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> Closes: =
https://lore.kernel.org/all/20260109064917.777587-2-sshegde@linux.ibm.com/=

> Suggested-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
> Co-developed-by: Aboorva Devarajan <aboorvad@linux.ibm.com>
> Signed-off-by: Aboorva Devarajan <aboorvad@linux.ibm.com>
> Signed-off-by: Sayali Patil <sayalip@linux.ibm.com>
> ---
> arch/powerpc/include/asm/uaccess.h | 67 ++++++++++++++++++++++++++++++
> arch/powerpc/lib/copyuser_64.S     |  1 +
> arch/powerpc/lib/copyuser_power7.S | 45 +++++++-------------
> arch/powerpc/lib/vmx-helper.c      |  2 +
> 4 files changed, 85 insertions(+), 30 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/uaccess.h =
b/arch/powerpc/include/asm/uaccess.h
> index 784a00e681fa..52e4a784d148 100644
> --- a/arch/powerpc/include/asm/uaccess.h
> +++ b/arch/powerpc/include/asm/uaccess.h
> @@ -13,6 +13,11 @@
> #define TASK_SIZE_MAX TASK_SIZE_USER64
> #endif
>=20
> +#ifdef CONFIG_ALTIVEC
> +/* Threshold above which VMX copy path is used */
> +#define VMX_COPY_THRESHOLD 3328
> +#endif
> +
> #include <asm-generic/access_ok.h>
>=20
> /*
> @@ -323,12 +328,42 @@ do { \
> extern unsigned long __copy_tofrom_user(void __user *to,
> const void __user *from, unsigned long size);
>=20
> +extern unsigned long __copy_tofrom_user_base(void __user *to,
> + const void __user *from, unsigned long size);
> +
> +#ifdef CONFIG_ALTIVEC
> +extern unsigned long __copy_tofrom_user_power7_vmx(void __user *to,
> + const void __user *from, unsigned long size);
> +
> +static inline bool will_use_vmx(unsigned long n)
> +{
> + return cpu_has_feature(CPU_FTR_VMX_COPY) &&
> + n > VMX_COPY_THRESHOLD;
> +}
> +#endif
> +
> #ifdef __powerpc64__
> static inline unsigned long
> raw_copy_in_user(void __user *to, const void __user *from, unsigned =
long n)
> {
> unsigned long ret;
>=20
> +#ifdef CONFIG_ALTIVEC
> + if (will_use_vmx(n) && enter_vmx_usercopy()) {
> + allow_read_write_user(to, from, n);
> + ret =3D __copy_tofrom_user_power7_vmx(to, from, n);
> + prevent_read_write_user(to, from, n);
> + exit_vmx_usercopy();
> + if (unlikely(ret)) {
> + allow_read_write_user(to, from, n);
> + ret =3D __copy_tofrom_user_base(to, from, n);
> + prevent_read_write_user(to, from, n);
> + }
> +
> + return ret;
> + }
> +#endif
> +
> allow_read_write_user(to, from, n);
> ret =3D __copy_tofrom_user(to, from, n);
> prevent_read_write_user(to, from, n);
> @@ -341,6 +376,22 @@ static inline unsigned long =
raw_copy_from_user(void *to,
> {
> unsigned long ret;
>=20
> +#ifdef CONFIG_ALTIVEC
> + if (will_use_vmx(n) && enter_vmx_usercopy()) {
> + allow_read_from_user(from, n);
> + ret =3D __copy_tofrom_user_power7_vmx((__force void __user *)to, =
from, n);
> + prevent_read_from_user(from, n);
> + exit_vmx_usercopy();
> + if (unlikely(ret)) {
> + allow_read_from_user(from, n);
> + ret =3D __copy_tofrom_user_base((__force void __user *)to, from, n);
> + prevent_read_from_user(from, n);
> + }
> +
> + return ret;
> + }
> +#endif
> +
> allow_read_from_user(from, n);
> ret =3D __copy_tofrom_user((__force void __user *)to, from, n);
> prevent_read_from_user(from, n);
> @@ -352,6 +403,22 @@ raw_copy_to_user(void __user *to, const void =
*from, unsigned long n)
> {
> unsigned long ret;
>=20
> +#ifdef CONFIG_ALTIVEC
> + if (will_use_vmx(n) && enter_vmx_usercopy()) {
> + allow_write_to_user(to, n);
> + ret =3D __copy_tofrom_user_power7_vmx(to, (__force const void __user =
*)from, n);
> + prevent_write_to_user(to, n);
> + exit_vmx_usercopy();
> + if (unlikely(ret)) {
> + allow_write_to_user(to, n);
> + ret =3D __copy_tofrom_user_base(to, (__force const void __user =
*)from, n);
> + prevent_write_to_user(to, n);
> + }
> +
> + return ret;
> + }
> +#endif
> +
> allow_write_to_user(to, n);
> ret =3D __copy_tofrom_user(to, (__force const void __user *)from, n);
> prevent_write_to_user(to, n);
> diff --git a/arch/powerpc/lib/copyuser_64.S =
b/arch/powerpc/lib/copyuser_64.S
> index 9af969d2cc0c..25a99108caff 100644
> --- a/arch/powerpc/lib/copyuser_64.S
> +++ b/arch/powerpc/lib/copyuser_64.S
> @@ -562,3 +562,4 @@ exc; std r10,32(3)
> li r5,4096
> b .Ldst_aligned
> EXPORT_SYMBOL(__copy_tofrom_user)
> +EXPORT_SYMBOL(__copy_tofrom_user_base)
> diff --git a/arch/powerpc/lib/copyuser_power7.S =
b/arch/powerpc/lib/copyuser_power7.S
> index 8474c682a178..17dbcfbae25f 100644
> --- a/arch/powerpc/lib/copyuser_power7.S
> +++ b/arch/powerpc/lib/copyuser_power7.S
> @@ -5,13 +5,9 @@
>  *
>  * Author: Anton Blanchard <anton@au.ibm.com>
>  */
> +#include <linux/export.h>
> #include <asm/ppc_asm.h>
>=20
> -#ifndef SELFTEST_CASE
> -/* 0 =3D=3D don't use VMX, 1 =3D=3D use VMX */
> -#define SELFTEST_CASE 0
> -#endif
> -
> #ifdef __BIG_ENDIAN__
> #define LVS(VRT,RA,RB) lvsl VRT,RA,RB
> #define VPERM(VRT,VRA,VRB,VRC) vperm VRT,VRA,VRB,VRC
> @@ -47,10 +43,14 @@
> ld r15,STK_REG(R15)(r1)
> ld r14,STK_REG(R14)(r1)
> .Ldo_err3:
> - bl CFUNC(exit_vmx_usercopy)
> + ld      r6,STK_REG(R31)(r1) /* original destination pointer */
> + ld      r5,STK_REG(R29)(r1) /* original number of bytes */
> + subf    r7,r6,r3 /* #bytes copied */
> + subf    r3,r7,r5 /* #bytes not copied in r3 */
> ld r0,STACKFRAMESIZE+16(r1)
> mtlr r0
> - b .Lexit
> + addi    r1,r1,STACKFRAMESIZE
> + blr
> #endif /* CONFIG_ALTIVEC */
>=20
> .Ldo_err2:
> @@ -74,7 +74,6 @@
>=20
> _GLOBAL(__copy_tofrom_user_power7)
> cmpldi r5,16
> - cmpldi cr1,r5,3328
>=20
> std r3,-STACKFRAMESIZE+STK_REG(R31)(r1)
> std r4,-STACKFRAMESIZE+STK_REG(R30)(r1)
> @@ -82,12 +81,6 @@ _GLOBAL(__copy_tofrom_user_power7)
>=20
> blt .Lshort_copy
>=20
> -#ifdef CONFIG_ALTIVEC
> -test_feature =3D SELFTEST_CASE
> -BEGIN_FTR_SECTION
> - bgt cr1,.Lvmx_copy
> -END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
> -#endif
>=20
> .Lnonvmx_copy:
> /* Get the source 8B aligned */
> @@ -263,23 +256,14 @@ err1; stb r0,0(r3)
> 15: li r3,0
> blr
>=20
> -.Lunwind_stack_nonvmx_copy:
> - addi r1,r1,STACKFRAMESIZE
> - b .Lnonvmx_copy
> -
> -.Lvmx_copy:
> #ifdef CONFIG_ALTIVEC
> +_GLOBAL(__copy_tofrom_user_power7_vmx)
> mflr r0
> std r0,16(r1)
> stdu r1,-STACKFRAMESIZE(r1)
> - bl CFUNC(enter_vmx_usercopy)
> - cmpwi cr1,r3,0
> - ld r0,STACKFRAMESIZE+16(r1)
> - ld r3,STK_REG(R31)(r1)
> - ld r4,STK_REG(R30)(r1)
> - ld r5,STK_REG(R29)(r1)
> - mtlr r0
>=20
> + std     r3,STK_REG(R31)(r1)
> + std     r5,STK_REG(R29)(r1)
> /*
> * We prefetch both the source and destination using enhanced touch
> * instructions. We use a stream ID of 0 for the load side and
> @@ -300,8 +284,6 @@ err1; stb r0,0(r3)
>=20
> DCBT_SETUP_STREAMS(r6, r7, r9, r10, r8)
>=20
> - beq cr1,.Lunwind_stack_nonvmx_copy
> -
> /*
> * If source and destination are not relatively aligned we use a
> * slower permute loop.
> @@ -478,7 +460,8 @@ err3; lbz r0,0(r4)
> err3; stb r0,0(r3)
>=20
> 15: addi r1,r1,STACKFRAMESIZE
> - b CFUNC(exit_vmx_usercopy) /* tail call optimise */
> + li r3,0
> + blr
>=20
> .Lvmx_unaligned_copy:
> /* Get the destination 16B aligned */
> @@ -681,5 +664,7 @@ err3; lbz r0,0(r4)
> err3; stb r0,0(r3)
>=20
> 15: addi r1,r1,STACKFRAMESIZE
> - b CFUNC(exit_vmx_usercopy) /* tail call optimise */
> + li r3,0
> + blr
> +EXPORT_SYMBOL(__copy_tofrom_user_power7_vmx)
> #endif /* CONFIG_ALTIVEC */
> diff --git a/arch/powerpc/lib/vmx-helper.c =
b/arch/powerpc/lib/vmx-helper.c
> index 54340912398f..554b248002b4 100644
> --- a/arch/powerpc/lib/vmx-helper.c
> +++ b/arch/powerpc/lib/vmx-helper.c
> @@ -27,6 +27,7 @@ int enter_vmx_usercopy(void)
>=20
> return 1;
> }
> +EXPORT_SYMBOL(enter_vmx_usercopy);
>=20
> /*
>  * This function must return 0 because we tail call optimise when =
calling
> @@ -49,6 +50,7 @@ int exit_vmx_usercopy(void)
> set_dec(1);
> return 0;
> }
> +EXPORT_SYMBOL(exit_vmx_usercopy);
>=20
> int enter_vmx_ops(void)
> {
> --=20
> 2.52.0
>=20
>=20

Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>

Confirmed fix using the repro steps in the Closes: tag.


With this patch:

No Warnings seen.


WithOut this patch:

[  647.366772] Kernel attempted to write user page (3fff86135000) - =
exploit attempt? (uid: 0)
[  647.366818] ------------[ cut here ]------------
[  647.366844] Bug: Write fault blocked by KUAP!
[  647.366864] WARNING: arch/powerpc/mm/fault.c:231 at =
bad_kernel_fault.constprop.0+0x1a8/0x2c8, CPU#15: stress-ng-vm-rw/5083
[  647.366912] Modules linked in: nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 =
nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct =
nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 bonding =
tls rfkill ip_set nf_tables nfnetlink sunrpc pseries_rng vmx_crypto fuse =
ext4 crc16 mbcache jbd2 sd_mod sg ibmvscsi ibmveth scsi_transport_srp =
pseries_wdt
[  647.367436] CPU: 15 UID: 0 PID: 5083 Comm: stress-ng-vm-rw Kdump: =
loaded Tainted: G        W           6.19.0+ #2 PREEMPT(lazy)=20
[  647.367470] Tainted: [W]=3DWARN
[  647.367493] Hardware name: IBM,9080-HEX Power11 (architected) =
0x820200 0xf000007 of:IBM,FW1110.01 (NH1110_069) hv:phyp pSeries
[  647.367523] NIP:  c00000000008cf9c LR: c00000000008cf98 CTR: =
c0000000002293ac
[  647.367552] REGS: c0000000e0753160 TRAP: 0700   Tainted: G        W   =
         (6.19.0+)
[  647.367577] MSR:  8000000000029033 <SF,EE,ME,IR,DR,RI,LE>  CR: =
28024824  XER: 20040005
[  647.367732] CFAR: c000000000166418 IRQMASK: 3=20
[  647.367732] GPR00: c00000000008cf98 c0000000e0753400 c00000000189c100 =
0000000000000021=20
[  647.367732] GPR04: 0000000000000000 c0000000e0753200 c0000000e07531f8 =
0000000efa437000=20
[  647.367732] GPR08: 0000000000000027 0000000000000000 c000000078ca8000 =
0000000000004000=20
[  647.367732] GPR12: c00000000033ca90 c000000effff4300 0000000000000000 =
0000000000000000=20
[  647.367732] GPR16: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
[  647.367732] GPR20: 0000000000000000 0000000000000000 0000000000000000 =
0000000002000000=20
[  647.367732] GPR24: 0000000000000001 0000000000000001 0000000000000000 =
c000000078c9d800=20
[  647.367732] GPR28: 00003fff86135000 0000000000000300 00003fff86135000 =
c0000000e07535a0=20
[  647.368347] NIP [c00000000008cf9c] =
bad_kernel_fault.constprop.0+0x1a8/0x2c8
[  647.368375] LR [c00000000008cf98] =
bad_kernel_fault.constprop.0+0x1a4/0x2c8
[  647.368405] Call Trace:
[  647.368426] [c0000000e0753400] [c00000000008cf98] =
bad_kernel_fault.constprop.0+0x1a4/0x2c8 (unreliable)
[  647.368482] [c0000000e0753480] [c00000000008dc34] =
___do_page_fault+0x688/0xa54
[  647.368526] [c0000000e0753540] [c00000000008e2ac] =
do_page_fault+0x30/0x70
[  647.368564] [c0000000e0753570] [c000000000008be0] =
data_access_common_virt+0x210/0x220
[  647.368608] ---- interrupt: 300 at __copy_tofrom_user_base+0x9c/0x5a4
[  647.368638] NIP:  c0000000000be2a8 LR: c0000000009bcba8 CTR: =
0000000000000080
[  647.368664] REGS: c0000000e07535a0 TRAP: 0300   Tainted: G        W   =
         (6.19.0+)
[  647.368692] MSR:  800000000280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  =
CR: 24022824  XER: 20040000
[  647.368892] CFAR: c0000000000be274 DAR: 00003fff86135000 DSISR: =
0a000000 IRQMASK: 0=20
[  647.368892] GPR00: 0000000000000000 c0000000e0753840 c00000000189c100 =
00003fff86134ff0=20
[  647.368892] GPR04: c00000009fee7010 0000000000001000 0000000000000000 =
0000000000000000=20
[  647.368892] GPR08: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
[  647.368892] GPR12: c00000000033ca90 c000000effff4300 c0000001122bc9a8 =
c0000000e0753b50=20
[  647.368892] GPR16: 00000000002cb000 0000000000000000 0000000000000000 =
0000000000000400=20
[  647.368892] GPR20: 0000000000000001 0000000000000000 c000000078c9da10 =
00003fff85000000=20
[  647.368892] GPR24: 0000000000400000 c00000009fee7000 c000000002de75f0 =
c0000000e0753b50=20
[  647.368892] GPR28: c00c0000027fb9c0 c0000000e0753b50 0000000000000000 =
0000000000001000=20
[  647.369529] NIP [c0000000000be2a8] __copy_tofrom_user_base+0x9c/0x5a4
[  647.369560] LR [c0000000009bcba8] _copy_to_iter+0x128/0xaa4
[  647.369593] ---- interrupt: 300
[  647.369620] [c0000000e0753910] [c0000000009bd5fc] =
copy_page_to_iter+0xd8/0x1b8
[  647.369661] [c0000000e0753960] [c0000000005b340c] =
process_vm_rw_single_vec.constprop.0+0x1cc/0x3b0
[  647.369703] [c0000000e0753a20] [c0000000005b375c] =
process_vm_rw_core.constprop.0+0x16c/0x310
[  647.369746] [c0000000e0753b20] [c0000000005b3a28] =
process_vm_rw+0x128/0x184
[  647.369790] [c0000000e0753cb0] [c00000000003186c] =
system_call_exception+0x14c/0x340
[  647.369834] [c0000000e0753e50] [c00000000000d05c] =
system_call_vectored_common+0x15c/0x2ec
[  647.369877] ---- interrupt: 3000 at 0x3fff86d4dc1c
[  647.369906] NIP:  00003fff86d4dc1c LR: 00003fff86d4dc1c CTR: =
0000000000000000
[  647.369932] REGS: c0000000e0753e80 TRAP: 3000   Tainted: G        W   =
         (6.19.0+)
[  647.369958] MSR:  800000000280f033 =
<SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 44022402  XER: 00000000
[  647.370155] IRQMASK: 0=20
[  647.370155] GPR00: 000000000000015f 00003fffcffb0040 000000012ddd7800 =
00000000000013f2=20
[  647.370155] GPR04: 00003fffcffb00c0 0000000000000001 00003fffcffb0100 =
0000000000000001=20
[  647.370155] GPR08: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
[  647.370155] GPR12: 0000000000000000 00003fff871fb760 0000000000000000 =
0000000000000000=20
[  647.370155] GPR16: 0000000000000001 00000000ffffffff 0000000000000019 =
0000000001000000=20
[  647.370155] GPR20: 00003fffcffb00a0 00003fffcffb00b0 000000012ddd0008 =
00003fff86f39e28=20
[  647.370155] GPR24: 00003fff85800000 00003fffcffb0100 0000000040000000 =
00003fff86800000=20
[  647.370155] GPR28: 00003fff85800000 0000000000000000 00003fffcffb0248 =
00003fffcffb00c0=20
[  647.370710] NIP [00003fff86d4dc1c] 0x3fff86d4dc1c
[  647.370741] LR [00003fff86d4dc1c] 0x3fff86d4dc1c
[  647.370767] ---- interrupt: 3000
[  647.370793] Code: e87f0100 48115ebd 60000000 2c230000 4182ff34 =
40920120 3c82ffd9 38844608 3c62ffd9 386346a0 480d93c1 60000000 =
<0fe00000> e8010090 ebe10078 38210080=20
[  647.371060] ---[ end trace 0000000000000000 ]=E2=80=94


Regards,
Venkat.


