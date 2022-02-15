Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FAD4B7467
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 19:34:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JyqW05tHSz3ckq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Feb 2022 05:34:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PFAt4Yag;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=PFAt4Yag; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JyqTY3h1cz3dhQ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Feb 2022 05:33:04 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21FGdU6J035155; 
 Tue, 15 Feb 2022 18:33:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=5zV51ok6POe69XkZ/WImYtpz8ENNxyxoDDSajQwMGdM=;
 b=PFAt4Yag1L0TN5IyRmjp7KTzMqDjbRJhzI8L+DKsCOekfOvB9VqSXA/gk5S9BGyvk+/C
 EpxGUvZRhZ1lE/qGdV/9RRFbGY/W+89+c//Te93Rkc27JT/RmvSQVB/xqVVkf3NRB8aK
 +xOFipUQ8MH6e6IyIEK4ifVQ5uvjQxhamGEEcmZTjuKwcGpvNVLTxtR6Spesdc20FnXI
 t9MsMlHm8cI+d1C0eLVj/OXz3HXvl1FAgQRZUkZShU7kirwji3H5+Y4hEe/0YajW4VBd
 EPxTnWuxxG5gLZvoij5wZ7614957ozlmYEjMZTYAmHQhECmHfPpUUqq6RLR3XZ07N0Ak Hw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e8e8c5ffp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 18:32:59 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21FI0hGw033859;
 Tue, 15 Feb 2022 18:32:59 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e8e8c5ff3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 18:32:59 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21FIWZm7013565;
 Tue, 15 Feb 2022 18:32:58 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma01dal.us.ibm.com with ESMTP id 3e64hc6n3q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 18:32:58 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21FIWuBP31129894
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Feb 2022 18:32:56 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CA007B2066;
 Tue, 15 Feb 2022 18:32:56 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BC723B2067;
 Tue, 15 Feb 2022 18:32:55 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.92.72])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 15 Feb 2022 18:32:55 +0000 (GMT)
Message-ID: <d22a687717e63d4fab79223eb4993cd8f3e887c2.camel@linux.ibm.com>
Subject: Re: [PATCH v3 01/10] powerpc/pseries/vas: Use common names in VAS
 capability structure
From: Haren Myneni <haren@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
Date: Tue, 15 Feb 2022 10:32:53 -0800
In-Reply-To: <1644804791.k88oankrue.astroid@bobo.none>
References: <7d175313528ea7aae20d9141f0efa2e57f44c9f4.camel@linux.ibm.com>
 <1de60767b71bcc714cf613ff8f660afc430a0720.camel@linux.ibm.com>
 <1644804791.k88oankrue.astroid@bobo.none>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: YLOvV5IssyoIq6b02eyJ5zBJgw1om9PT
X-Proofpoint-GUID: 2AIC3smYMty2JSMJUyUBefYrkauRyftY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-15_05,2022-02-14_04,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 mlxscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202150107
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

On Mon, 2022-02-14 at 12:14 +1000, Nicholas Piggin wrote:
> Excerpts from Haren Myneni's message of January 22, 2022 5:54 am:
> > target/used/avail_creds provides credits usage to user space via
> > sysfs and the same interface can be used on PowerNV in future.
> > Remove "lpar" from these names so that applicable on both PowerVM
> > and PowerNV.
> 
> But not in this series? This is just to save you having to do more
> renaming later?

Thanks for your review. 
Yes, Removing _lpar_ in struct elements to make it clear so that can
easily add in sysfs patch.  

> 
> Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
> 
> > Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> > ---
> >  arch/powerpc/platforms/pseries/vas.c | 10 +++++-----
> >  arch/powerpc/platforms/pseries/vas.h |  6 +++---
> >  2 files changed, 8 insertions(+), 8 deletions(-)
> > 
> > diff --git a/arch/powerpc/platforms/pseries/vas.c
> > b/arch/powerpc/platforms/pseries/vas.c
> > index d243ddc58827..c0737379cc7b 100644
> > --- a/arch/powerpc/platforms/pseries/vas.c
> > +++ b/arch/powerpc/platforms/pseries/vas.c
> > @@ -310,8 +310,8 @@ static struct vas_window
> > *vas_allocate_window(int vas_id, u64 flags,
> >  
> >  	cop_feat_caps = &caps->caps;
> >  
> > -	if (atomic_inc_return(&cop_feat_caps->used_lpar_creds) >
> > -			atomic_read(&cop_feat_caps->target_lpar_creds)) 
> > {
> > +	if (atomic_inc_return(&cop_feat_caps->used_creds) >
> > +			atomic_read(&cop_feat_caps->target_creds)) {
> >  		pr_err("Credits are not available to allocate
> > window\n");
> >  		rc = -EINVAL;
> >  		goto out;
> > @@ -385,7 +385,7 @@ static struct vas_window
> > *vas_allocate_window(int vas_id, u64 flags,
> >  	free_irq_setup(txwin);
> >  	h_deallocate_vas_window(txwin->vas_win.winid);
> >  out:
> > -	atomic_dec(&cop_feat_caps->used_lpar_creds);
> > +	atomic_dec(&cop_feat_caps->used_creds);
> >  	kfree(txwin);
> >  	return ERR_PTR(rc);
> >  }
> > @@ -445,7 +445,7 @@ static int vas_deallocate_window(struct
> > vas_window *vwin)
> >  	}
> >  
> >  	list_del(&win->win_list);
> > -	atomic_dec(&caps->used_lpar_creds);
> > +	atomic_dec(&caps->used_creds);
> >  	mutex_unlock(&vas_pseries_mutex);
> >  
> >  	put_vas_user_win_ref(&vwin->task_ref);
> > @@ -521,7 +521,7 @@ static int __init get_vas_capabilities(u8 feat,
> > enum vas_cop_feat_type type,
> >  	}
> >  	caps->max_lpar_creds = be16_to_cpu(hv_caps->max_lpar_creds);
> >  	caps->max_win_creds = be16_to_cpu(hv_caps->max_win_creds);
> > -	atomic_set(&caps->target_lpar_creds,
> > +	atomic_set(&caps->target_creds,
> >  		   be16_to_cpu(hv_caps->target_lpar_creds));
> >  	if (feat == VAS_GZIP_DEF_FEAT) {
> >  		caps->def_lpar_creds = be16_to_cpu(hv_caps-
> > >def_lpar_creds);
> > diff --git a/arch/powerpc/platforms/pseries/vas.h
> > b/arch/powerpc/platforms/pseries/vas.h
> > index 4ecb3fcabd10..fa7ce74f1e49 100644
> > --- a/arch/powerpc/platforms/pseries/vas.h
> > +++ b/arch/powerpc/platforms/pseries/vas.h
> > @@ -72,9 +72,9 @@ struct vas_cop_feat_caps {
> >  	};
> >  	/* Total LPAR available credits. Can be different from max LPAR
> > */
> >  	/* credits due to DLPAR operation */
> > -	atomic_t	target_lpar_creds;
> > -	atomic_t	used_lpar_creds; /* Used credits so far */
> > -	u16		avail_lpar_creds; /* Remaining available credits */
> > +	atomic_t	target_creds;
> > +	atomic_t	used_creds;	/* Used credits so far */
> > +	u16		avail_creds;	/* Remaining available credits */
> >  };
> >  
> >  /*
> > -- 
> > 2.27.0
> > 
> > 
> > 

