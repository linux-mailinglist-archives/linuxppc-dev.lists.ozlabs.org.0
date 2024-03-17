Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9372987E065
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Mar 2024 22:35:20 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=owTPXcR9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TyWVW68JKz3vYR
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Mar 2024 08:35:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=owTPXcR9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TyWTn6cRvz3bX3
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Mar 2024 08:34:37 +1100 (AEDT)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 42HLU9gq013146;
	Sun, 17 Mar 2024 21:34:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=XPv3otDcwzHlXLFObdG26I2uaEfIGiIB3Bzbfzf5WTY=;
 b=owTPXcR9N/M992v5mU4Dl+DtYpy/TwLaBJAr8/HYk9ca43JASEKYKlro8cfF7RIWKyd0
 sXFLi+kzfQjcwg8y0xeLv9CIlpKVPPWL/qvb/apqbc+74cJH/yI4RWcEMy9l1s5zUHH4
 AEQeXAVGhz7GpcWCcktw/Kwj2qBNlszJ1t7yFikE3utKmLFxJKGRrrxry/0MSBJnebDo
 He8rsCt1jB/zDyhuKu7Avy5vk42N+iXJvhCcEKBJZMrbJjpXNJh8nDpCX0tC5rV8BNKa
 ppatR7XfDQaJUKcGzyBg2O7LfLh8+QfMku+/3qh5eGXjWdiFV//wff33/rjWeL3JhJg7 9g== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ww5pndc5y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 17 Mar 2024 21:34:27 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 42HJ1ncv015759;
	Sun, 17 Mar 2024 21:34:25 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3wwp4ymysa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 17 Mar 2024 21:34:25 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 42HLYLOK15139302
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 17 Mar 2024 21:34:23 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 55C9320040;
	Sun, 17 Mar 2024 21:34:21 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 679CE2004B;
	Sun, 17 Mar 2024 21:34:20 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 17 Mar 2024 21:34:20 +0000 (GMT)
Received: from [10.61.2.107] (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id D1499600F0;
	Mon, 18 Mar 2024 08:34:17 +1100 (AEDT)
Message-ID: <175080fd47ff7e016a73a553c1b93d2bc8bdae39.camel@linux.ibm.com>
Subject: Re: [PATCH v1 2/2] powerpc/code-patching: Convert to
 open_patch_window()/close_patch_window()
From: Benjamin Gray <bgray@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        "linuxppc-dev@lists.ozlabs.org"
	 <linuxppc-dev@lists.ozlabs.org>,
        "mpe@ellerman.id.au" <mpe@ellerman.id.au>
Date: Mon, 18 Mar 2024 08:34:17 +1100
In-Reply-To: <77fdcdeb-4af5-4ad0-a4c6-57bf0762dc65@csgroup.eu>
References: <20240315025937.407590-1-bgray@linux.ibm.com>
	 <20240315025937.407590-2-bgray@linux.ibm.com>
	 <510d986a-ce2b-47dc-bf5e-7ba2e72ecf5a@csgroup.eu>
	 <77fdcdeb-4af5-4ad0-a4c6-57bf0762dc65@csgroup.eu>
Autocrypt: addr=bgray@linux.ibm.com; prefer-encrypt=mutual;
 keydata=mDMEYzuwexYJKwYBBAHaRw8BAQdAsgBYEqW6nNaL7i0B3z1RqyMl8ADupDef+5Sfe+JbzeC0I0JlbmphbWluIEdyYXkgPGJncmF5QGxpbnV4LmlibS5jb20+iJMEExYKADsWIQQ9K5v9I+L06Hi4yOJ5xrdpFsvehAUCYzuwewIbAwULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgAAKCRB5xrdpFsvehCiCAP4g7CDkmsakpwv9QxU2D8dophyCIS8meDOQX4/83/sjHgEA5HWbUsbRCpVmeIgu0iNwhw3cmqhkv7ZkBGe3HhHaXg65Ay4EYzuwkREIAJjQ1EDAmLbOENucLy7VUzyNNCHkBirK/+FbjwOW7VIphc8zgsbZ26ZjIu5vC1NY7U7DpOvLAfR0g4+2QeKiQ8EEcuxLhif5X+jsekq0oSTVLcyNYXArJ3mhmV7jRhz8wBueMoXY/k+P3HCVLi4vzroJzN06Hrnmeu5ELlC4MbuvGRTvW751Y/o7gTa6hyyLb2P4pQ+sj/PuIn2Ly1RJPF839HVcOOERkjZ2QZNJnXEhlpfDD7LyRsy9Xm6MxGKRE5VsfjaO+Q8B6ByhXIy5/QK41AF1uSIPBfkZ8+AsBFw8Z87VGQ61tDdzi0U77IdYr98KsgRJ30vHInfKKdSj4csBALzNKjOFmp7dS8mefp3viouy4vWPla8+XZU6ZrRNtD8hB/9FsE7KVTdIBp4xqf6oN1ieTD7PNsQsBQWdDA/rg2bP7IJQkf4Pvn0yoATOFgqhQwadkwT7fwWAfk0YPEE+DPom1V3JwNM6wPaEJeNaMjleqTfAfauLaB9Sc+zJvN5cORrEjSL/0jfJBBdjW5j5BmdUDM1mGuBNVQhGlWHc/Rf7qokMoZAfYiPi/z44rB9zvNfb8t6sVNqHbC2fKRBn/0k8cZ9+qBEIj6vbkqUuih8xNDA+TU+FxPqJxyahqFv+LL9cfZelC0v3D
	mjW5LaBPOdGiiDE1w95Ri9HRK27S2dRZpyib9L4mkfYWPAF41mTudjKmVpgtBLO//rO+zmF04OMB/4sWJhLfvhq1CXULDqw5dcuIAIYwf2ughOtyAPFK1ViDcMO5X1bVpNAFO5m4VBpZvFDQ0j0JfqfVBdL68uH05W1/8dMj76RaWj5m0rLM5slY1FQUPddSU+ic9vaZhlDepjU3ZyI8fmioofNGHaxJq6uNTytKdj87kwDV6PQ4hmuGtY56C7JCgjp053sRJ6sXqgKBWfe4ZOJH17mQm+fws93byLoZvvz4Z3im0Rb0MlFo/WirNyhu+TmTNLpnzFUZfenoKrqAkZLY8u1iCFquhgqA321P+sfYew66DtwQmaoi2GKmF89y2enXXzjLNKfLDKkuVoKxFSPeizYqrLi22R9iO8EGBYKACAWIQQ9K5v9I+L06Hi4yOJ5xrdpFsvehAUCYzuwkQIbAgCBCRB5xrdpFsvehHYgBBkRCAAdFiEESFUlaLYscsf4Dt5gaavCcpI6D/8FAmM7sJEACgkQaavCcpI6D/95UgEAqfSj0QhCrYfazQiLDKJstrz3oIKFjhB6+FYMZqt+K1MA/2ioFtHbypeeWbsqYYRhRyTjAKcvE1NZGtH/YWLgkViUidoBAN6gFX/P+VWB77/w8S/BnPmnJx45wmphlkCL8ckOyopFAQCj9eWamHCl2DSaASMSuoZed6C6Gm0OFtuZh/r8K485BQ==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: iqJW86t3ug8XiojsJrOFJk26-1dMmlKC
X-Proofpoint-GUID: iqJW86t3ug8XiojsJrOFJk26-1dMmlKC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-17_12,2024-03-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 adultscore=0 impostorscore=0 mlxlogscore=999 phishscore=0
 mlxscore=0 bulkscore=0 suspectscore=0 clxscore=1011 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2403140000 definitions=main-2403170167
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 2024-03-16 at 10:10 +0000, Christophe Leroy wrote:
>=20
>=20
> Le 15/03/2024 =C3=A0 09:38, Christophe Leroy a =C3=A9crit=C2=A0:
> >=20
> >=20
> > Le 15/03/2024 =C3=A0 03:59, Benjamin Gray a =C3=A9crit=C2=A0:
> > > The existing patching alias page setup and teardown sections can
> > > be
> > > simplified to make use of the new open_patch_window()
> > > abstraction.
> > >=20
> > > This eliminates the _mm variants of the helpers, consumers no
> > > longer
> > > need to check mm_patch_enabled(), and consumers no longer need to
> > > worry
> > > about synchronization and flushing beyond the changes they make
> > > in the
> > > patching window.
> >=20
> > With this patch, the time needed to activate or de-activate
> > function=20
> > tracer is approx 10% longer on powerpc 8xx.
>=20
> With the following changes, the performance is restored:
>=20
> diff --git a/arch/powerpc/lib/code-patching.c=20
> b/arch/powerpc/lib/code-patching.c
> index fd6f8576033a..bc92b85913d8 100644
> --- a/arch/powerpc/lib/code-patching.c
> +++ b/arch/powerpc/lib/code-patching.c
> @@ -282,13 +282,13 @@ struct patch_window {
> =C2=A0=C2=A0 * Interrupts must be disabled for the entire duration of the=
=20
> patching. The PIDR
> =C2=A0=C2=A0 * is potentially changed during this time.
> =C2=A0=C2=A0 */
> -static int open_patch_window(void *addr, struct patch_window *ctx)
> +static __always_inline int open_patch_window(void *addr, struct=20
> patch_window *ctx)
> =C2=A0 {
> =C2=A0=C2=A0	unsigned long pfn =3D get_patch_pfn(addr);
>=20
> =C2=A0=C2=A0	lockdep_assert_irqs_disabled();
>=20
> -	ctx->text_poke_addr =3D (unsigned=20
> long)__this_cpu_read(cpu_patching_context.addr);
> +	ctx->text_poke_addr =3D (unsigned=20
> long)__this_cpu_read(cpu_patching_context.addr) & PAGE_MASK;
>=20
> =C2=A0=C2=A0	if (!mm_patch_enabled()) {
> =C2=A0=C2=A0		ctx->ptep =3D
> __this_cpu_read(cpu_patching_context.pte);
> @@ -331,7 +331,7 @@ static int open_patch_window(void *addr, struct=20
> patch_window *ctx)
> =C2=A0=C2=A0	return 0;
> =C2=A0 }
>=20
> -static void close_patch_window(struct patch_window *ctx)
> +static __always_inline void close_patch_window(struct patch_window
> *ctx)
> =C2=A0 {
> =C2=A0=C2=A0	lockdep_assert_irqs_disabled();
>=20
>=20

Thanks for checking that. I did restore the page mask optimisation in a
later patch while still developing, but the 64-bit assembly looked
slightly worse for it. I didn't check the 32-bit; no way to benchmark
it anyway.
