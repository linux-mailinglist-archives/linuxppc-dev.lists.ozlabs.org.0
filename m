Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E2D4C0E4B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 09:33:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K3Tp05phdz3cNK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 19:33:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DkkfVI/b;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=DkkfVI/b; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K3TnC0Qpdz2yMx
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Feb 2022 19:32:46 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21N8Bqsl017891; 
 Wed, 23 Feb 2022 08:32:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=F10kMbOscz7S0Fj9CzlN9lxSX8Lc3j6/1hzKYbMQU/M=;
 b=DkkfVI/bufDm86irpErZTPn046VcWZ3LGej5A0ble1tH3Q+bBTBSHbGP5hiGrvSl+1Zs
 XUxqZ0GwPGzIx9C2qj0LWPKP0ZKtLKgHK2lyY1YiRrJ8Kil/gtDl/fEp5fUQFpZxPSI1
 1uhqp8fFdIUL2tV8+8ENUOWhdFiUv1FXeZi0anSICjShH249qQenolAbovk3YPvykrM5
 p2C71L98rhlDbkcKGBMUf1xnjONEZnDyEqLjj0niwcabngErwlyP+CCERVXTeY2hiAUX
 mBds4rCbPI3c/kB12LgENwa7bmW0e6iS3zDaryPRBHeUizkiotQFf5o011IzUD1x0pTU Qg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3edh6wgb5k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Feb 2022 08:32:42 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21N8WgYP026281;
 Wed, 23 Feb 2022 08:32:42 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3edh6wgb58-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Feb 2022 08:32:42 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21N8UTR1016128;
 Wed, 23 Feb 2022 08:32:41 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma01dal.us.ibm.com with ESMTP id 3ed22dq1u2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Feb 2022 08:32:41 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21N8WaW551970534
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Feb 2022 08:32:36 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 83143AC059;
 Wed, 23 Feb 2022 08:32:36 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D39C3AC067;
 Wed, 23 Feb 2022 08:32:35 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.92.72])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 23 Feb 2022 08:32:35 +0000 (GMT)
Message-ID: <b88a347747a328284ec2d372b26f35594f1047a9.camel@linux.ibm.com>
Subject: Re: [PATCH v4 7/9] powerpc/pseries/vas: Reopen windows with DLPAR
 core add
From: Haren Myneni <haren@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au, nathanl@linux.ibm.com
Date: Wed, 23 Feb 2022 00:32:34 -0800
In-Reply-To: <1645601119.3ay9nmf9qs.astroid@bobo.none>
References: <94434bf320affdde36090c72eeb1372f1d9978ae.camel@linux.ibm.com>
 <a54ce2973c12602a73468446076115746fe71cf3.camel@linux.ibm.com>
 <1645601119.3ay9nmf9qs.astroid@bobo.none>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: voieS6VIG3Y0NGgBwO05K7Vr1HnHJXPb
X-Proofpoint-ORIG-GUID: 1hp0r6p2Sl17ItahGhfUtdK3nQTtiWsh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-23_03,2022-02-21_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2202230045
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

On Wed, 2022-02-23 at 17:28 +1000, Nicholas Piggin wrote:
> Excerpts from Haren Myneni's message of February 20, 2022 6:01 am:
> > VAS windows can be closed in the hypervisor due to lost credits
> > when the core is removed and the kernel gets fault for NX
> > requests on these in-active windows. If these credits are
> > available later for core add, reopen these windows and set them
> > active. When the OS sees page faults on these active windows,
> > it creates mapping on the new paste address. Then the user space
> > can continue to use these windows and send HW compression
> > requests to NX successfully.
> 
> Just for my own ignorance, what happens if userspace does not get
> another page fault on that window? Presumably when it gets a page
> fault it changes to an available window and doesn't just keep
> re-trying. So in what situation does it attempt to re-access a
> faulting window?

We should except faults only when the user space issue NX request on
these inactive windows. 
Example: 
- window is closed in the hypervisor to the DLPAR core removal. Means
inactive in the OS.
- window is opened later when the previous credit is available - means
active window in the OS.
- If the user space issue copy/paste on this window and fault on paste
address:
  - gets paste failure if the window is inactive
  - map to the new paste address if the window is active and returns 

So in case if the user space does not retry, new mapping will not be
done. From the OS point of view, this window is not used by the user
space. 

Thanks
Haren

> 
> Thanks,
> Nick
> 
> > Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> > ---
> >  arch/powerpc/platforms/pseries/vas.c | 91
> > +++++++++++++++++++++++++++-
> >  1 file changed, 90 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/powerpc/platforms/pseries/vas.c
> > b/arch/powerpc/platforms/pseries/vas.c
> > index a297720bcdae..96178dd58adf 100644
> > --- a/arch/powerpc/platforms/pseries/vas.c
> > +++ b/arch/powerpc/platforms/pseries/vas.c
> > @@ -565,6 +565,88 @@ static int __init get_vas_capabilities(u8
> > feat, enum vas_cop_feat_type type,
> >  	return 0;
> >  }
> >  
> > +/*
> > + * VAS windows can be closed due to lost credits when the core is
> > + * removed. So reopen them if credits are available due to DLPAR
> > + * core add and set the window active status. When NX sees the
> > page
> > + * fault on the unmapped paste address, the kernel handles the
> > fault
> > + * by setting the remapping to new paste address if the window is
> > + * active.
> > + */
> > +static int reconfig_open_windows(struct vas_caps *vcaps, int
> > creds)
> > +{
> > +	long domain[PLPAR_HCALL9_BUFSIZE] = {VAS_DEFAULT_DOMAIN_ID};
> > +	struct vas_cop_feat_caps *caps = &vcaps->caps;
> > +	struct pseries_vas_window *win = NULL, *tmp;
> > +	int rc, mv_ents = 0;
> > +
> > +	/*
> > +	 * Nothing to do if there are no closed windows.
> > +	 */
> > +	if (!vcaps->nr_close_wins)
> > +		return 0;
> > +
> > +	/*
> > +	 * For the core removal, the hypervisor reduces the credits
> > +	 * assigned to the LPAR and the kernel closes VAS windows
> > +	 * in the hypervisor depends on reduced credits. The kernel
> > +	 * uses LIFO (the last windows that are opened will be closed
> > +	 * first) and expects to open in the same order when credits
> > +	 * are available.
> > +	 * For example, 40 windows are closed when the LPAR lost 2
> > cores
> > +	 * (dedicated). If 1 core is added, this LPAR can have 20 more
> > +	 * credits. It means the kernel can reopen 20 windows. So move
> > +	 * 20 entries in the VAS windows lost and reopen next 20
> > windows.
> > +	 */
> > +	if (vcaps->nr_close_wins > creds)
> > +		mv_ents = vcaps->nr_close_wins - creds;
> > +
> > +	list_for_each_entry_safe(win, tmp, &vcaps->list, win_list) {
> > +		if (!mv_ents)
> > +			break;
> > +
> > +		mv_ents--;
> > +	}
> > +
> > +	list_for_each_entry_safe_from(win, tmp, &vcaps->list, win_list)
> > {
> > +		/*
> > +		 * Nothing to do on this window if it is not closed
> > +		 * with VAS_WIN_NO_CRED_CLOSE
> > +		 */
> > +		if (!(win->vas_win.status & VAS_WIN_NO_CRED_CLOSE))
> > +			continue;
> > +
> > +		rc = allocate_setup_window(win, (u64 *)&domain[0],
> > +					   caps->win_type);
> > +		if (rc)
> > +			return rc;
> > +
> > +		rc = h_modify_vas_window(win);
> > +		if (rc)
> > +			goto out;
> > +
> > +		mutex_lock(&win->vas_win.task_ref.mmap_mutex);
> > +		/*
> > +		 * Set window status to active
> > +		 */
> > +		win->vas_win.status &= ~VAS_WIN_NO_CRED_CLOSE;
> > +		mutex_unlock(&win->vas_win.task_ref.mmap_mutex);
> > +		win->win_type = caps->win_type;
> > +		if (!--vcaps->nr_close_wins)
> > +			break;
> > +	}
> > +
> > +	return 0;
> > +out:
> > +	/*
> > +	 * Window modify HCALL failed. So close the window to the
> > +	 * hypervisor and return.
> > +	 */
> > +	free_irq_setup(win);
> > +	h_deallocate_vas_window(win->vas_win.winid);
> > +	return rc;
> > +}
> > +
> >  /*
> >   * The hypervisor reduces the available credits if the LPAR lost
> > core. It
> >   * means the excessive windows should not be active and the user
> > space
> > @@ -673,7 +755,14 @@ static int vas_reconfig_capabilties(u8 type)
> >  	 * closed / reopened. Hold the vas_pseries_mutex so that the
> >  	 * the user space can not open new windows.
> >  	 */
> > -	if (old_nr_creds >  new_nr_creds) {
> > +	if (old_nr_creds <  new_nr_creds) {
> > +		/*
> > +		 * If the existing target credits is less than the new
> > +		 * target, reopen windows if they are closed due to
> > +		 * the previous DLPAR (core removal).
> > +		 */
> > +		rc = reconfig_open_windows(vcaps, new_nr_creds -
> > old_nr_creds);
> > +	} else {
> >  		/*
> >  		 * # active windows is more than new LPAR available
> >  		 * credits. So close the excessive windows.
> > -- 
> > 2.27.0
> > 
> > 
> > 

