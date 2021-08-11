Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D33E73E9716
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Aug 2021 19:54:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GlHWm5GLQz3bnf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Aug 2021 03:54:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FrNHqJM7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=cmr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=FrNHqJM7; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GlHW17511z2xb7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Aug 2021 03:53:49 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17BHWoKJ123858; Wed, 11 Aug 2021 13:53:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=mime-version :
 content-transfer-encoding : content-type : date : message-id : subject :
 from : to : cc : references : in-reply-to; s=pp1;
 bh=d1kiYLkXVUFagZlhxr8dQXxfGyDJAVNlj4A70Bw7ExI=;
 b=FrNHqJM7atmD5w2cLO8LjUZxvdv+D/FebT6YvycQKvXfWYx+ns+7Mjzv3SIwJByuN8lx
 WKlHV8AzV046IsSigrUUEL2nqPVvnr45KcBjwbcJA7EFrK4/vpAXQpwf0s+NHWQMHd2g
 dz4QHUTGOI85g20cNvz7i7EuabcI4sX1ZXwSk2OWC/frr47C5jQzmSI81QwRbP+XUuAD
 VoPbviFVZQOD3LofTvcR3nFk9YE6dOn6/+KXmJpAQnKxGXZxlDb8PHmv2cjwS6LIa0+z
 qXfB+tdUXodPiSEgFAtZ6Riw6/VCN49WuybGVGrcyt4pppNwwYUqlC8baaDO1cib7o70 6A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ab8kmhpt8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Aug 2021 13:53:27 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17BHXTXG126288;
 Wed, 11 Aug 2021 13:53:27 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ab8kmhps7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Aug 2021 13:53:27 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17BHqsa9013111;
 Wed, 11 Aug 2021 17:53:26 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma02dal.us.ibm.com with ESMTP id 3a9htf4srv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Aug 2021 17:53:26 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17BHrO0351118516
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Aug 2021 17:53:25 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D583478068;
 Wed, 11 Aug 2021 17:53:24 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2E20678063;
 Wed, 11 Aug 2021 17:53:24 +0000 (GMT)
Received: from oc8246131445.ibm.com (unknown [9.211.57.193])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with SMTP;
 Wed, 11 Aug 2021 17:53:24 +0000 (GMT)
Received: from localhost (localhost6 [IPv6:::1])
 by oc8246131445.ibm.com (Postfix) with ESMTP id AE3B2BC0CFB;
 Wed, 11 Aug 2021 12:53:21 -0500 (CDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Aug 2021 12:53:21 -0500
Message-Id: <CDGVIWVYADTN.3IFXVUNYR99BF@oc8246131445.ibm.com>
Subject: Re: [PATCH v5 4/8] lkdtm/x86_64: Add test to hijack a patch mapping
From: "Christopher M. Riedl" <cmr@linux.ibm.com>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 <linuxppc-dev@lists.ozlabs.org>
References: <20210713053113.4632-1-cmr@linux.ibm.com>
 <20210713053113.4632-5-cmr@linux.ibm.com>
 <95de5ec5-8d48-c969-3c9f-966561f9f58e@csgroup.eu>
In-Reply-To: <95de5ec5-8d48-c969-3c9f-966561f9f58e@csgroup.eu>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: EzF43UIIo40oDc_ZNAsmaY9yCKQHTdq9
X-Proofpoint-ORIG-GUID: p0G08HV_q4WyI4UdMOme0AgOYk63S__A
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-11_06:2021-08-11,
 2021-08-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0
 mlxscore=0 priorityscore=1501 mlxlogscore=999 adultscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108110120
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
Cc: keescook@chromium.org, peterz@infradead.org, x86@kernel.org,
 npiggin@gmail.com, linux-hardening@vger.kernel.org, tglx@linutronix.de,
 dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu Aug 5, 2021 at 4:09 AM CDT, Christophe Leroy wrote:
>
>
> Le 13/07/2021 =C3=A0 07:31, Christopher M. Riedl a =C3=A9crit :
> > A previous commit implemented an LKDTM test on powerpc to exploit the
> > temporary mapping established when patching code with STRICT_KERNEL_RWX
> > enabled. Extend the test to work on x86_64 as well.
> >=20
> > Signed-off-by: Christopher M. Riedl <cmr@linux.ibm.com>
> > ---
> >   drivers/misc/lkdtm/perms.c | 26 ++++++++++++++++++++++----
> >   1 file changed, 22 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/drivers/misc/lkdtm/perms.c b/drivers/misc/lkdtm/perms.c
> > index 39e7456852229..41e87e5f9cc86 100644
> > --- a/drivers/misc/lkdtm/perms.c
> > +++ b/drivers/misc/lkdtm/perms.c
> > @@ -224,7 +224,7 @@ void lkdtm_ACCESS_NULL(void)
> >   }
> >  =20
> >   #if (IS_BUILTIN(CONFIG_LKDTM) && defined(CONFIG_STRICT_KERNEL_RWX) &&=
 \
> > -	defined(CONFIG_PPC))
> > +	(defined(CONFIG_PPC) || defined(CONFIG_X86_64)))
> >   /*
> >    * This is just a dummy location to patch-over.
> >    */
> > @@ -233,12 +233,25 @@ static void patching_target(void)
> >   	return;
> >   }
> >  =20
> > -#include <asm/code-patching.h>
> >   const u32 *patch_site =3D (const u32 *)&patching_target;
> >  =20
> > +#ifdef CONFIG_PPC
> > +#include <asm/code-patching.h>
> > +#endif
> > +
> > +#ifdef CONFIG_X86_64
> > +#include <asm/text-patching.h>
> > +#endif
> > +
> >   static inline int lkdtm_do_patch(u32 data)
> >   {
> > +#ifdef CONFIG_PPC
> >   	return patch_instruction((u32 *)patch_site, ppc_inst(data));
> > +#endif
> > +#ifdef CONFIG_X86_64
> > +	text_poke((void *)patch_site, &data, sizeof(u32));
> > +	return 0;
> > +#endif
> >   }
> >  =20
> >   static inline u32 lkdtm_read_patch_site(void)
> > @@ -249,11 +262,16 @@ static inline u32 lkdtm_read_patch_site(void)
> >   /* Returns True if the write succeeds */
> >   static inline bool lkdtm_try_write(u32 data, u32 *addr)
> >   {
> > +#ifdef CONFIG_PPC
> >   	__put_kernel_nofault(addr, &data, u32, err);
> >   	return true;
> >  =20
> >   err:
> >   	return false;
> > +#endif
> > +#ifdef CONFIG_X86_64
> > +	return !__put_user(data, addr);
> > +#endif
> >   }
> >  =20
> >   static int lkdtm_patching_cpu(void *data)
> > @@ -346,8 +364,8 @@ void lkdtm_HIJACK_PATCH(void)
> >  =20
> >   void lkdtm_HIJACK_PATCH(void)
> >   {
> > -	if (!IS_ENABLED(CONFIG_PPC))
> > -		pr_err("XFAIL: this test only runs on powerpc\n");
> > +	if (!IS_ENABLED(CONFIG_PPC) && !IS_ENABLED(CONFIG_X86_64))
> > +		pr_err("XFAIL: this test only runs on powerpc and x86_64\n");
> >   	if (!IS_ENABLED(CONFIG_STRICT_KERNEL_RWX))
> >   		pr_err("XFAIL: this test requires CONFIG_STRICT_KERNEL_RWX\n");
> >   	if (!IS_BUILTIN(CONFIG_LKDTM))
> >=20
>
> Instead of spreading arch specific stuff into LKDTM, wouldn't it make
> sence to define common a
> common API ? Because the day another arch like arm64 implements it own
> approach, do we add specific
> functions again and again into LKDTM ?

Hmm a common patch/poke kernel API is probably out of scope for this
series? I do agree though - since you suggested splitting the series
maybe that's something I can add along with the LKDTM patches.

>
> Also, I find it odd to define tests only when they can succeed. For
> other tests like
> ACCESS_USERSPACE, they are there all the time, regardless of whether we
> have selected
> CONFIG_PPC_KUAP or not. I think it should be the same here, have it all
> there time, if
> CONFIG_STRICT_KERNEL_RWX is selected the test succeeds otherwise it
> fails, but it is always there.

I followed the approach in lkdtm_DOUBLE_FAULT and others in
drivers/misc/lkdtm/bugs.c. I suppose it doesn't hurt to always build the
test irrespective of CONFIG_STRICT_KERNEL_RWX.

>
> Christophe

