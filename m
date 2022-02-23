Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FA94C0DFC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 09:03:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K3T7q1BCvz3bdF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 19:03:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=O5gqTCYh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=O5gqTCYh; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K3T732Shhz2xtp
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Feb 2022 19:03:10 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21N4kYqb030975; 
 Wed, 23 Feb 2022 08:03:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=FdUO3d5XzfON2nHxaXetURyo5R4BhryMnhgL7ZKYB3w=;
 b=O5gqTCYhRfLJ9JmzLAlFdH5CvtsFHUpdi9MwF1og/8W3es/GklOXuCOPa8jrv8G630MS
 VPDJ6OE5qyrklakTc7KZHnph8pypwoPzYSGhFsjSP51JfG2bwjxrpZ8LFvO5D3wGsccr
 aTqrcgreOCSoUUKbdGEok6Zx6wpQh7EgVRXJTN6Y0pcw/r06sfmYMpD9tHLIDNhYyj2h
 OGJCjOLs9sYjPhMboNwAqVTnOma3jSjDOJtAdjeGIHSINSIZm/xhp9cly9Cmy9qMzmor
 DbjCIOm3TCGlPt+v2/AQKrjJz51kfOLbldWWPCc+l6lnencIXCO4nCfsDy9WRVj3AH23 fA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ede6sk53s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Feb 2022 08:03:06 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21N63N0L024149;
 Wed, 23 Feb 2022 08:03:05 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ede6sk53m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Feb 2022 08:03:05 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21N81TKF030617;
 Wed, 23 Feb 2022 08:03:05 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma02dal.us.ibm.com with ESMTP id 3ear6av7rj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Feb 2022 08:03:04 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21N832Ed18809330
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Feb 2022 08:03:02 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 196FF6E050;
 Wed, 23 Feb 2022 08:03:02 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F28456E05B;
 Wed, 23 Feb 2022 08:03:00 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.92.72])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 23 Feb 2022 08:03:00 +0000 (GMT)
Message-ID: <bac25516bef6c2e7426133d1c87779b23bf50f31.camel@linux.ibm.com>
Subject: Re: [PATCH v4 5/9] powerpc/vas: Map paste address only if window is
 active
From: Haren Myneni <haren@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au, nathanl@linux.ibm.com
Date: Wed, 23 Feb 2022 00:02:58 -0800
In-Reply-To: <1645600074.ct2ke47u09.astroid@bobo.none>
References: <94434bf320affdde36090c72eeb1372f1d9978ae.camel@linux.ibm.com>
 <2a2cac9d210f5a79b3db0adfb92a92525c6287b6.camel@linux.ibm.com>
 <1645600074.ct2ke47u09.astroid@bobo.none>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: reyS_Kpc7C7sNSq1_1fpbNfPti1k6lR8
X-Proofpoint-ORIG-GUID: r7hblvycFJdPqTo6nzFpBEkkV_7qP6cM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-23_02,2022-02-21_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 phishscore=0 impostorscore=0 mlxlogscore=999
 clxscore=1015 mlxscore=0 malwarescore=0 adultscore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2202230042
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

On Wed, 2022-02-23 at 17:11 +1000, Nicholas Piggin wrote:
> Excerpts from Haren Myneni's message of February 20, 2022 5:59 am:
> > The paste address mapping is done with mmap() after the window is
> > opened with ioctl. If the window is closed by OS in the hypervisor
> > due to DLPAR after this mmap(), the paste instruction returns
> 
> I don't think the changelog was improved here.
> 
> The window is closed by the OS in response to a DLPAR operation
> by the hypervisor? The OS can't be in the hypervisor.

From the user space point of view, this window is inactive. But from
the hypervisor point of view, this window is closed. So my point is the
window is closed by the OS in the hypervisor for the DLPAR event.

> 
> 
> > failure until the OS reopens this window again. But before mmap(),
> > DLPAR core removal can happen which causes the corresponding
> > window in-active. So if the window is not active, return mmap()
> > failure with -EACCES and expects the user space reissue mmap()
> > when the window is active or open a new window when the credit
> > is available.
> > 
> > Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> > ---
> >  arch/powerpc/platforms/book3s/vas-api.c | 20 +++++++++++++++++++-
> >  1 file changed, 19 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/powerpc/platforms/book3s/vas-api.c
> > b/arch/powerpc/platforms/book3s/vas-api.c
> > index f3e421511ea6..eb4489b2b46b 100644
> > --- a/arch/powerpc/platforms/book3s/vas-api.c
> > +++ b/arch/powerpc/platforms/book3s/vas-api.c
> > @@ -496,10 +496,26 @@ static int coproc_mmap(struct file *fp,
> > struct vm_area_struct *vma)
> >  		return -EACCES;
> >  	}
> >  
> > +	/*
> > +	 * The initial mmap is done after the window is opened
> > +	 * with ioctl. But before mmap(), this window can be closed in
> > +	 * the hypervisor due to lost credit (core removal on pseries).
> > +	 * So if the window is not active, return mmap() failure with
> > +	 * -EACCES and expects the user space reissue mmap() when it
> > +	 * is active again or open new window when the credit is
> > available.
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
> > @@ -519,6 +535,8 @@ static int coproc_mmap(struct file *fp, struct
> > vm_area_struct *vma)
> >  	txwin->task_ref.vma = vma;
> >  	vma->vm_ops = &vas_vm_ops;
> >  
> > +out:
> > +	mutex_unlock(&txwin->task_ref.mmap_mutex);
> 
> Did we have an explanation or what mmap_mutex is protecting? Sorry
> if 
> you explained it and I forgot -- would be good to have a small
> comment
> (what is it protecting against).

The comment should be in the struct definition. I will add some comment
in this patch.

Thanks
Haren
> 
> Thanks,
> Nick

