Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A69A63E9730
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Aug 2021 19:58:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GlHch3KlVz3cVG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Aug 2021 03:58:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LDqEaeEC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=cmr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=LDqEaeEC; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GlHbq0vghz3cGx
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Aug 2021 03:57:58 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17BHZW5M009168; Wed, 11 Aug 2021 13:57:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=mime-version :
 content-transfer-encoding : content-type : date : message-id : cc :
 subject : from : to : references : in-reply-to; s=pp1;
 bh=nbqLroe+qnyWCI7f/PdH/Oz+n+WWkxmtVCCaizPcaJ0=;
 b=LDqEaeECQPOE5SgsUoF/1+dBiPj84dMctm8RulS3UoS/uQwtEIcMdHcv1W70wYaTkv4H
 dwvaPFII1Lo2Q8X3fpAv8KCUKGqy0gSA3LC7a9QtyUNK61VZoxoo2uCOvorjAhXqxTvV
 lpwSilhqmBKUNM3Y95kZ+RItFVC1Qo5MVEDiWZNyoc+JMgxd5BDF56iDeOeZwZeFKrN4
 Kij7lZmaCSGMBBBJ/pWLzW/Kky3euD6CMGhiB4Hg0NuCNUzFoFjy6yW8ieDxRrmmWq2Z
 a75Qz6rUAv6O6DzUWO8mAx7m6I5dI2likCT/3g0MzT8JbtbR87+2qFXzT8Wf9jk8LO18 PA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3abk4r2grm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Aug 2021 13:57:45 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17BHZZQW009356;
 Wed, 11 Aug 2021 13:57:45 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3abk4r2gr3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Aug 2021 13:57:44 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17BHv5qu008548;
 Wed, 11 Aug 2021 17:57:44 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma04wdc.us.ibm.com with ESMTP id 3a9htdjus8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Aug 2021 17:57:44 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17BHvhqE46399894
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Aug 2021 17:57:43 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1F176C6057;
 Wed, 11 Aug 2021 17:57:43 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BB787C605B;
 Wed, 11 Aug 2021 17:57:42 +0000 (GMT)
Received: from oc8246131445.ibm.com (unknown [9.211.57.193])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with SMTP;
 Wed, 11 Aug 2021 17:57:42 +0000 (GMT)
Received: from localhost (localhost6 [IPv6:::1])
 by oc8246131445.ibm.com (Postfix) with ESMTP id 86091BC0CFB;
 Wed, 11 Aug 2021 12:57:40 -0500 (CDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Aug 2021 12:57:40 -0500
Message-Id: <CDGVM7T0W0T1.3E0IJ78ONUZ0R@oc8246131445.ibm.com>
Subject: Re: [PATCH v5 8/8] lkdtm/powerpc: Fix code patching hijack test
From: "Christopher M. Riedl" <cmr@linux.ibm.com>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 <linuxppc-dev@lists.ozlabs.org>
References: <20210713053113.4632-1-cmr@linux.ibm.com>
 <20210713053113.4632-9-cmr@linux.ibm.com>
 <7a6c97ed-815b-49fc-5568-ab4420f53122@csgroup.eu>
In-Reply-To: <7a6c97ed-815b-49fc-5568-ab4420f53122@csgroup.eu>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: IVctp8x3WZTpKFRRQBPX8mvTb6sl4IBZ
X-Proofpoint-GUID: RCBK4ng9R-KLoIYK-WtBC3Qvr1gVixy8
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-11_06:2021-08-11,
 2021-08-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 clxscore=1015 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 adultscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108110120
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

On Thu Aug 5, 2021 at 4:18 AM CDT, Christophe Leroy wrote:
>
>
> Le 13/07/2021 =C3=A0 07:31, Christopher M. Riedl a =C3=A9crit :
> > Code patching on powerpc with a STRICT_KERNEL_RWX uses a userspace
> > address in a temporary mm on Radix now. Use __put_user() to avoid write
> > failures due to KUAP when attempting a "hijack" on the patching address=
.
> > __put_user() also works with the non-userspace, vmalloc-based patching
> > address on non-Radix MMUs.
>
> It is not really clean to use __put_user() on non user address,
> allthought it works by change.
>
> I think it would be better to do something like
>
> if (is_kernel_addr(addr))
> copy_to_kernel_nofault(...);
> else
> copy_to_user_nofault(...);
>

Yes that looks much better. I'll pick this up and try it for the next
spin. Thanks!

>
>
> >=20
> > Signed-off-by: Christopher M. Riedl <cmr@linux.ibm.com>
> > ---
> >   drivers/misc/lkdtm/perms.c | 9 ---------
> >   1 file changed, 9 deletions(-)
> >=20
> > diff --git a/drivers/misc/lkdtm/perms.c b/drivers/misc/lkdtm/perms.c
> > index 41e87e5f9cc86..da6a34a0a49fb 100644
> > --- a/drivers/misc/lkdtm/perms.c
> > +++ b/drivers/misc/lkdtm/perms.c
> > @@ -262,16 +262,7 @@ static inline u32 lkdtm_read_patch_site(void)
> >   /* Returns True if the write succeeds */
> >   static inline bool lkdtm_try_write(u32 data, u32 *addr)
> >   {
> > -#ifdef CONFIG_PPC
> > -	__put_kernel_nofault(addr, &data, u32, err);
> > -	return true;
> > -
> > -err:
> > -	return false;
> > -#endif
> > -#ifdef CONFIG_X86_64
> >   	return !__put_user(data, addr);
> > -#endif
> >   }
> >  =20
> >   static int lkdtm_patching_cpu(void *data)
> >=20

