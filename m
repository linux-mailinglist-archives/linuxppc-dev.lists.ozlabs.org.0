Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 656123794CF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 May 2021 19:00:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ff6kG3KCjz300Q
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 May 2021 03:00:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jBN5eKxk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=jBN5eKxk; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ff6jc6xLMz2yRX
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 May 2021 02:59:48 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14AGWua4136907; Mon, 10 May 2021 12:59:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=1J3o0ph0nYvWYFdBL4TxTPBj+S4EYoDcGQlVU4GLd7A=;
 b=jBN5eKxkrqIVhq82CuRgk/9SDG2o/8k+Ff1wBr02gt4Eqw3p2f2U+nyVG2SD2265+2GI
 705jVAVz7/LZvkal8Wwzwqq3fDtGR6saZ9HJodnZ6nimSCGf0gET3t6Sa93SLnD4eitk
 cG7ADCLDEBCYfAm+HLlYlraMzrd9nE5JLhQhsZPIJPfaPs4DrAlh0xiJMEvuxBXrfZNb
 Lac5BiwRc+6mTBlj4XWJzX17VZ+YSlwv1QPJOikilUgB6jNOrT1wflTfTj3qhIPTHGev
 g+JSeulWDOwZ47lIVTYkhBWSglUAmY/YWuJ8ESE9FhMducCGvrJoz9vWdcuRRV1cYMTB Nw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38f8curqch-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 May 2021 12:59:39 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14AGXJxK138256;
 Mon, 10 May 2021 12:59:39 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38f8curqc8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 May 2021 12:59:39 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14AGrtPI013775;
 Mon, 10 May 2021 16:59:37 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma02wdc.us.ibm.com with ESMTP id 38dj997s1r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 May 2021 16:59:37 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14AGxbXs14156142
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 May 2021 16:59:37 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 03C9BBE056;
 Mon, 10 May 2021 16:59:37 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 99D4DBE051;
 Mon, 10 May 2021 16:59:35 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.80.194.217])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 10 May 2021 16:59:35 +0000 (GMT)
Message-ID: <4c49eeee852256ef5bdd264d5e99a41c9bd03b07.camel@linux.ibm.com>
Subject: Re: [V3 PATCH 01/16] powerpc/powernv/vas: Rename
 register/unregister functions
From: Haren Myneni <haren@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, herbert@gondor.apana.org.au,
 linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
Date: Mon, 10 May 2021 09:59:33 -0700
In-Reply-To: <1620622742.tr9lqg4vzz.astroid@bobo.none>
References: <a910e5bd3f3398b4bd430b25a856500735b993c3.camel@linux.ibm.com>
 <86bae80a92b8465d663f72e7fadc1fa3671e8a4f.camel@linux.ibm.com>
 <1620622742.tr9lqg4vzz.astroid@bobo.none>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Lg76D9DRngSat3MfdMyipnvLhrvsr7bb
X-Proofpoint-ORIG-GUID: dvVaq8dbkmIc2J17kIBxtrgEzcPaquDL
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-10_09:2021-05-10,
 2021-05-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015
 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105100113
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2021-05-10 at 15:10 +1000, Nicholas Piggin wrote:
> Excerpts from Haren Myneni's message of April 18, 2021 7:00 am:
> > powerNV and pseries drivers register / unregister to the
> > corresponding
> > VAS code separately. So rename powerNV VAS API register/unregister
> > functions.
> 
> The pseries VAS driver will have different calls for registering a
> coprocessor driver, you mean?
> 
> It certainly looks the same 
> 
> (from patch 13)
> 	ret = vas_register_api_pseries(THIS_MODULE, VAS_COP_TYPE_GZIP,
> 				       "nx-gzip");
> 
> So I guess it's just a matter of the driver being different enough
> that 
> there is no benefit to making this call common (and branching to
> pseries
> or powernv dynamically).

Thanks for your review and comments on all patches. 

Yes, we have separate drivers nx-common-powernv/nx-common-pseries for
powerNV and pseries. 
API registeration patch is:
- driver calls platform specific API
   vas_register_api_powernv/pseries
- Platform specific code calls common API with its vas_user_win_ops
   vas_register_coproc_api()

> 
> Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
> 
> > Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> > ---
> >  arch/powerpc/include/asm/vas.h           |  6 +++---
> >  arch/powerpc/platforms/powernv/vas-api.c | 10 +++++-----
> >  drivers/crypto/nx/nx-common-powernv.c    |  6 +++---
> >  3 files changed, 11 insertions(+), 11 deletions(-)
> > 
> > diff --git a/arch/powerpc/include/asm/vas.h
> > b/arch/powerpc/include/asm/vas.h
> > index e33f80b0ea81..41f73fae7ab8 100644
> > --- a/arch/powerpc/include/asm/vas.h
> > +++ b/arch/powerpc/include/asm/vas.h
> > @@ -170,8 +170,8 @@ int vas_paste_crb(struct vas_window *win, int
> > offset, bool re);
> >   * Only NX GZIP coprocessor type is supported now, but this API
> > can be
> >   * used for others in future.
> >   */
> > -int vas_register_coproc_api(struct module *mod, enum vas_cop_type
> > cop_type,
> > -				const char *name);
> > -void vas_unregister_coproc_api(void);
> > +int vas_register_api_powernv(struct module *mod, enum vas_cop_type
> > cop_type,
> > +			     const char *name);
> > +void vas_unregister_api_powernv(void);
> >  
> >  #endif /* __ASM_POWERPC_VAS_H */
> > diff --git a/arch/powerpc/platforms/powernv/vas-api.c
> > b/arch/powerpc/platforms/powernv/vas-api.c
> > index 98ed5d8c5441..72d8ce39e56c 100644
> > --- a/arch/powerpc/platforms/powernv/vas-api.c
> > +++ b/arch/powerpc/platforms/powernv/vas-api.c
> > @@ -207,8 +207,8 @@ static struct file_operations coproc_fops = {
> >   * Supporting only nx-gzip coprocessor type now, but this API code
> >   * extended to other coprocessor types later.
> >   */
> > -int vas_register_coproc_api(struct module *mod, enum vas_cop_type
> > cop_type,
> > -				const char *name)
> > +int vas_register_api_powernv(struct module *mod, enum vas_cop_type
> > cop_type,
> > +			     const char *name)
> >  {
> >  	int rc = -EINVAL;
> >  	dev_t devno;
> > @@ -262,9 +262,9 @@ int vas_register_coproc_api(struct module *mod,
> > enum vas_cop_type cop_type,
> >  	unregister_chrdev_region(coproc_device.devt, 1);
> >  	return rc;
> >  }
> > -EXPORT_SYMBOL_GPL(vas_register_coproc_api);
> > +EXPORT_SYMBOL_GPL(vas_register_api_powernv);
> >  
> > -void vas_unregister_coproc_api(void)
> > +void vas_unregister_api_powernv(void)
> >  {
> >  	dev_t devno;
> >  
> > @@ -275,4 +275,4 @@ void vas_unregister_coproc_api(void)
> >  	class_destroy(coproc_device.class);
> >  	unregister_chrdev_region(coproc_device.devt, 1);
> >  }
> > -EXPORT_SYMBOL_GPL(vas_unregister_coproc_api);
> > +EXPORT_SYMBOL_GPL(vas_unregister_api_powernv);
> > diff --git a/drivers/crypto/nx/nx-common-powernv.c
> > b/drivers/crypto/nx/nx-common-powernv.c
> > index 13c65deda8e9..88d728415bb2 100644
> > --- a/drivers/crypto/nx/nx-common-powernv.c
> > +++ b/drivers/crypto/nx/nx-common-powernv.c
> > @@ -1090,8 +1090,8 @@ static __init int
> > nx_compress_powernv_init(void)
> >  		 * normal FIFO priority is assigned for userspace.
> >  		 * 842 compression is supported only in kernel.
> >  		 */
> > -		ret = vas_register_coproc_api(THIS_MODULE,
> > VAS_COP_TYPE_GZIP,
> > -						"nx-gzip");
> > +		ret = vas_register_api_powernv(THIS_MODULE,
> > VAS_COP_TYPE_GZIP,
> > +					       "nx-gzip");
> >  
> >  		/*
> >  		 * GZIP is not supported in kernel right now.
> > @@ -1127,7 +1127,7 @@ static void __exit
> > nx_compress_powernv_exit(void)
> >  	 * use. So delete this API use for GZIP engine.
> >  	 */
> >  	if (!nx842_ct)
> > -		vas_unregister_coproc_api();
> > +		vas_unregister_api_powernv();
> >  
> >  	crypto_unregister_alg(&nx842_powernv_alg);
> >  
> > -- 
> > 2.18.2
> > 
> > 
> > 

