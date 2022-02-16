Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C474B7C2D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Feb 2022 02:10:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jz0Hg16BPz3cV2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Feb 2022 12:10:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=px7ZCA9M;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=px7ZCA9M; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jz0Gx2w2xz2xDY
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Feb 2022 12:09:29 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21FNg4lF021473; 
 Wed, 16 Feb 2022 01:09:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=2X9rmzSfviMtUW6KP5k11Hr9vDd4cpYq0tfXMcdXR8c=;
 b=px7ZCA9M8NhcMpaNLYz9EwO+Mt0kavnrqv4qkXVwA8eUUQMntGe79fzXT6k7FV7JNj+P
 kwjTvRKJcNRvrthm1eIgnEwDO+PzYG2s1IrGd8x8S1bqW/CZenenBfjAQh0PPQGmKlBH
 sBbGHHcE4w5dFXPFqm3/Ki5tPSt/3DGYH0q9meYGNW3H+GW+FoZL7H2y/6Gy1LYzM4Y1
 VMfEEl74YLOnyXVqNL+0LNbXrGxm7FHr5xyvyVyWBVRFIKte1tufAA1i5w5pefFsX3E4
 hToaBeNnxjXIx2vMhYMRab+TZ8fzCCNSy1+kTzUoDHviKXFi/XEStf0FdLkLqP4Vg/iK dw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e8p2s9k31-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 01:09:20 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21G19J9F009867;
 Wed, 16 Feb 2022 01:09:19 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e8p2s9k1a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 01:09:19 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21G18BRp006132;
 Wed, 16 Feb 2022 01:09:15 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma04wdc.us.ibm.com with ESMTP id 3e64hb5mvr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 01:09:15 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21G19E6W35127644
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Feb 2022 01:09:14 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B7B8F124055;
 Wed, 16 Feb 2022 01:09:14 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0D402124069;
 Wed, 16 Feb 2022 01:09:14 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.92.72])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 16 Feb 2022 01:09:13 +0000 (GMT)
Message-ID: <ae9c6a42fb9e19e9a1dfc6beb84bddc72ad6c637.camel@linux.ibm.com>
Subject: Re: [PATCH v3 03/10] powerpc/pseries/vas: Save LPID in
 pseries_vas_window struct
From: Haren Myneni <haren@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
Date: Tue, 15 Feb 2022 17:09:12 -0800
In-Reply-To: <1644805860.xhvkad4duc.astroid@bobo.none>
References: <7d175313528ea7aae20d9141f0efa2e57f44c9f4.camel@linux.ibm.com>
 <df3c8452ec619744bdd5a0fde901645537c1b7b4.camel@linux.ibm.com>
 <1644805860.xhvkad4duc.astroid@bobo.none>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Ot95zgq6StMFGa2JX3b64Lu05epk9xWG
X-Proofpoint-ORIG-GUID: 4T_nmNAJogUqcmqDw12U9b0QignxsElv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-15_07,2022-02-14_04,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 bulkscore=0 phishscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202160005
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

On Mon, 2022-02-14 at 12:41 +1000, Nicholas Piggin wrote:
> Excerpts from Haren Myneni's message of January 22, 2022 5:55 am:
> > The kernel sets the VAS window with partition PID when is opened in
> > the hypervisor. During DLPAR operation, windows can be closed and
> > reopened in the hypervisor when the credit is available. So saves
> > this PID in pseries_vas_window struct when the window is opened
> > initially and reuse it later during DLPAR operation.
> 
> This probably shouldn't be called lpid, while you're changing it.
> "partition PID" and "LPAR PID" is also confusing. I know the name
> somewhat comes from the specifiction, but pid/PID would be fine,
> it's clear we are talking about "this LPAR" when in pseries code.
> 
> > Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> > ---
> >  arch/powerpc/platforms/pseries/vas.c | 7 ++++---
> >  arch/powerpc/platforms/pseries/vas.h | 1 +
> >  2 files changed, 5 insertions(+), 3 deletions(-)
> > 
> > diff --git a/arch/powerpc/platforms/pseries/vas.c
> > b/arch/powerpc/platforms/pseries/vas.c
> > index d2c8292bfb33..2ef56157634f 100644
> > --- a/arch/powerpc/platforms/pseries/vas.c
> > +++ b/arch/powerpc/platforms/pseries/vas.c
> > @@ -107,7 +107,6 @@ static int h_deallocate_vas_window(u64 winid)
> >  static int h_modify_vas_window(struct pseries_vas_window *win)
> >  {
> >  	long rc;
> > -	u32 lpid = mfspr(SPRN_PID);
> >  
> >  	/*
> >  	 * AMR value is not supported in Linux VAS implementation.
> > @@ -115,7 +114,7 @@ static int h_modify_vas_window(struct
> > pseries_vas_window *win)
> >  	 */
> >  	do {
> >  		rc = plpar_hcall_norets(H_MODIFY_VAS_WINDOW,
> > -					win->vas_win.winid, lpid, 0,
> > +					win->vas_win.winid, win->lpid,
> > 0,
> >  					VAS_MOD_WIN_FLAGS, 0);
> >  
> >  		rc = hcall_return_busy_check(rc);
> > @@ -125,7 +124,7 @@ static int h_modify_vas_window(struct
> > pseries_vas_window *win)
> >  		return 0;
> >  
> >  	pr_err("H_MODIFY_VAS_WINDOW error: %ld, winid %u lpid %u\n",
> > -			rc, win->vas_win.winid, lpid);
> > +			rc, win->vas_win.winid, win->lpid);
> >  	return -EIO;
> >  }
> >  
> > @@ -338,6 +337,8 @@ static struct vas_window
> > *vas_allocate_window(int
> > vas_id, u64 flags,
> >  		}
> >  	}
> >  
> > +	txwin->lpid = mfspr(SPRN_PID);
> > +
> >  	/*
> >  	 * Allocate / Deallocate window hcalls and setup / free IRQs
> >  	 * have to be protected with mutex.
> > diff --git a/arch/powerpc/platforms/pseries/vas.h
> > b/arch/powerpc/platforms/pseries/vas.h
> > index fa7ce74f1e49..0538760d13be 100644
> > --- a/arch/powerpc/platforms/pseries/vas.h
> > +++ b/arch/powerpc/platforms/pseries/vas.h
> > @@ -115,6 +115,7 @@ struct pseries_vas_window {
> >  	u64 domain[6];		/* Associativity domain Ids */
> >  				/* this window is allocated */
> >  	u64 util;
> > +	u32 lpid;
> 
> Comment could be "PID associated with this window".   

yes, will add this comment.

> 
> BTW, is the TID parameter deprecated? Doesn't seem that we use that.

Right, tpid is deprecated on p10 and we are not using it.

Thanks
Haren

> 
> Thanks,
> Nick

