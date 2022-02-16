Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 528034B7CFD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Feb 2022 02:59:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jz1Nn5gNVz3cNB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Feb 2022 12:59:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RmJB1j4b;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=RmJB1j4b; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jz1N24Ympz30QX
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Feb 2022 12:58:58 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21G1dOxf028570; 
 Wed, 16 Feb 2022 01:58:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=GVP4XAq+DvfE7cN6k49coKwW/fcTxV6oDCgZUKkDppw=;
 b=RmJB1j4bitd9FXLcsZQ6tHug4GiisuBWengP31BGk843+md6G9cG5f0wk//vBY5qwrhE
 /lVO21Mk0+VyyxrhQPcKyGmnI1wGuC7kAeXzaIGVzaUm3OytRdqGwHtv2tuxMpvyRIMn
 csHOWF1fBWmAD4ycRqP7EYK8qBxl4Ajxe2sat6iIYQGJE9gn1paM1JkBQTEpmrP4aluu
 czKLIOc965Agzxf5DKO0+d7fw44ROdN1mwLNa6GWyGxg5Uboj8HoUTP4Gpc3h3US6gHP
 2xxZkvWacwdwMrkcTJZUtC5qZIQvwll0gmG9Wcb6lxWmPA0AaB+I3V3JgClRhAdWFSFH Uw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e8qfprdeh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 01:58:53 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21G1uNpp015602;
 Wed, 16 Feb 2022 01:58:53 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e8qfprdeb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 01:58:53 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21G1Xtjw001967;
 Wed, 16 Feb 2022 01:58:52 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma02dal.us.ibm.com with ESMTP id 3e64hby50k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 01:58:52 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21G1wptR23003452
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Feb 2022 01:58:51 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7402628066;
 Wed, 16 Feb 2022 01:58:51 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8E4C02805E;
 Wed, 16 Feb 2022 01:58:50 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.92.72])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 16 Feb 2022 01:58:50 +0000 (GMT)
Message-ID: <8e7681618955384661d9b71f83f0c2bf1c61d099.camel@linux.ibm.com>
Subject: Re: [PATCH v3 06/10] powerpc/vas: Map paste address only if window
 is active
From: Haren Myneni <haren@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
Date: Tue, 15 Feb 2022 17:58:49 -0800
In-Reply-To: <1644808630.pfiol54rgg.astroid@bobo.none>
References: <7d175313528ea7aae20d9141f0efa2e57f44c9f4.camel@linux.ibm.com>
 <4ecd08a1b92590d6220920245c23526a68dc531c.camel@linux.ibm.com>
 <1644808630.pfiol54rgg.astroid@bobo.none>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: s9p_wWHW_vSJ9clyN9JCfVjjT9B0yOkI
X-Proofpoint-ORIG-GUID: DpPIm69rHT8enipF_v1xijRPh1U5AVWg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-15_07,2022-02-14_04,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 adultscore=0 phishscore=0 priorityscore=1501 bulkscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202160007
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

On Mon, 2022-02-14 at 13:20 +1000, Nicholas Piggin wrote:
> Excerpts from Haren Myneni's message of January 22, 2022 5:58 am:
> > The paste address mapping is done with mmap() after the window is
> > opened with ioctl. But the window can be closed due to lost credit
> > due to core removal before mmap(). So if the window is not active,
> > return mmap() failure with -EACCES and expects the user space
> > reissue
> > mmap() when the window is active or open new window when the credit
> > is available.
> > 
> > Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> > ---
> >  arch/powerpc/platforms/book3s/vas-api.c | 21 ++++++++++++++++++++-
> >  1 file changed, 20 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/powerpc/platforms/book3s/vas-api.c
> > b/arch/powerpc/platforms/book3s/vas-api.c
> > index a63fd48e34a7..2d06bd1b1935 100644
> > --- a/arch/powerpc/platforms/book3s/vas-api.c
> > +++ b/arch/powerpc/platforms/book3s/vas-api.c
> > @@ -379,10 +379,27 @@ static int coproc_mmap(struct file *fp,
> > struct vm_area_struct *vma)
> >  		return -EACCES;
> >  	}
> >  
> > +	/*
> > +	 * The initial mapping is done after the window is opened
> > +	 * with ioctl. But this window might have been closed
> > +	 * due to lost credit (core removal on PowerVM) before mmap().
> 
> What does "initial mapping" mean?
> 
> mapping ~= mmap, in kernel speak.

yes, the initial mapping is done with the actual mmap() call. 
> 
> You will have to differentiate the concepts.
> 
> > +	 * So if the window is not active, return mmap() failure
> > +	 * with -EACCES and expects the user space reconfigure (mmap)
> > +	 * window when it is active again or open new window when
> > +	 * the credit is available.
> > +	 */
> > +	mutex_lock(&txwin->task_ref.mmap_mutex);
> > +	if (txwin->status != VAS_WIN_ACTIVE) {
> > +		pr_err("%s(): Window is not active\n", __func__);
> > +		rc = -EACCES;
> > +		goto out;
> > +	}
> > +
> >  	paste_addr = cp_inst->coproc->vops->paste_addr(txwin);
> >  	if (!paste_addr) {
> >  		pr_err("%s(): Window paste address failed\n",
> > __func__);
> > -		return -EINVAL;
> > +		rc = -EINVAL;
> > +		goto out;
> >  	}
> >  
> >  	pfn = paste_addr >> PAGE_SHIFT;
> > @@ -401,6 +418,8 @@ static int coproc_mmap(struct file *fp, struct
> > vm_area_struct *vma)
> >  
> >  	txwin->task_ref.vma = vma;
> >  
> > +out:
> > +	mutex_unlock(&txwin->task_ref.mmap_mutex);
> 
> If the hypervisor can revoke a window at any point with DLPAR, it's
> not 
> clear *why* this is needed. The hypervisor could cause your window
> to 
> close right after this mmap() returns, right? So an explanation for 
> exactly what this patch is needed for beyond that would help.

Yes, the window can be closed by OS due to DLPAR after the mmap()
returns successfully which is a normal case - paste instruction failure
 until the window is reopened again.

But ths patch is mainly for window open by user space and dlpar happens
before the user space issue mmap().    

I will add more description in the commit log. 

Thanks
Haren

> 
> Thanks,
> Nick

