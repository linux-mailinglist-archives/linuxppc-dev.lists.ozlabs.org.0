Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 73ED94B7D04
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Feb 2022 03:02:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jz1Rg0FgHz3cYB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Feb 2022 13:02:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=U22p7ipx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=U22p7ipx; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jz1R24H42z2yJR
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Feb 2022 13:01:34 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21G1kYDE028051; 
 Wed, 16 Feb 2022 02:01:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=34Ux4JD+Z/oEQA1eAo/pRKLywencwGYP0KyBPH9an20=;
 b=U22p7ipxa2rmwyA0szmqMYxKjAE/uNpc7y+KY8JpTQ4kyQ3wB6Rp9JPzIdLvYpTL2enG
 plAetOh0G/1+ZY4m8/NRJkeFkjXwiYW5v38D/zxq29kPL8klQFSIqJ0wgchBggswWRWB
 ZDxy67D+Qd7axEaRIvAW6OCEdYX9P02JMwGnE9HP0NdszB13LIpIZxOSA+rY6qkjobuS
 Cvg540ci45CpXzT59jAirPFD9ei1ZlOCoSgtUCo27+4MBoFgf2E+uoNMIF4Si/iPc83z
 OcvfGhp23SVQdNXiDzSSRR9JcD9xOtB1WQfTZdax0RJgsWiNHHUgF+1q9ggj+hJaTpfQ Jg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e8qwd86qa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 02:01:30 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21G1um7I026267;
 Wed, 16 Feb 2022 02:01:29 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e8qwd86pe-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 02:01:29 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21G1XTAC017709;
 Wed, 16 Feb 2022 01:38:08 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma01wdc.us.ibm.com with ESMTP id 3e877fmkem-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 01:38:08 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21G1c7Z936176340
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Feb 2022 01:38:07 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 78317BE051;
 Wed, 16 Feb 2022 01:38:07 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 66B91BE05A;
 Wed, 16 Feb 2022 01:38:06 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.92.72])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 16 Feb 2022 01:38:06 +0000 (GMT)
Message-ID: <378c8216dbafb57301cf665da3b410f592aafd4c.camel@linux.ibm.com>
Subject: Re: [PATCH v3 04/10] powerpc/pseries/vas: Reopen windows with DLPAR
 core add
From: Haren Myneni <haren@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
Date: Tue, 15 Feb 2022 17:38:04 -0800
In-Reply-To: <1644806607.n8posebbp0.astroid@bobo.none>
References: <7d175313528ea7aae20d9141f0efa2e57f44c9f4.camel@linux.ibm.com>
 <623ab91d97fdc6affde8de34e9b0e59ae8dd2d81.camel@linux.ibm.com>
 <1644806607.n8posebbp0.astroid@bobo.none>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: jQ9jMIPL_trt_7KvoCZmNSiZiGM_p1ex
X-Proofpoint-ORIG-GUID: 5QLab3Yam2rkcwAgmstK_8RbDxQ-_4PZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-15_07,2022-02-14_04,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 mlxscore=0 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202160008
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

On Mon, 2022-02-14 at 13:08 +1000, Nicholas Piggin wrote:
> Excerpts from Haren Myneni's message of January 22, 2022 5:56 am:
> > VAS windows can be closed in the hypervisor due to lost credits
> > when the core is removed. If these credits are available later
> > for core add, reopen these windows and set them active. When the
> > kernel sees page fault on the paste address, it creates new mapping
> > on the new paste address. Then the user space can continue to use
> > these windows and send HW compression requests to NX successfully.
> 
> Any reason to put this before the close windows patch? It would be
> more logical to put it afterwards AFAIKS.

reconfig_open_windows() is just to reopen and set the status flag when
windows are closed. I thought adding handler first before closing /
unmap helps during git bisect. 

I can change. 

> 
> > Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> > ---
> >  arch/powerpc/include/asm/vas.h          |  16 +++
> >  arch/powerpc/platforms/book3s/vas-api.c |   1 +
> >  arch/powerpc/platforms/pseries/vas.c    | 144
> > ++++++++++++++++++++++++
> >  arch/powerpc/platforms/pseries/vas.h    |   8 +-
> >  4 files changed, 163 insertions(+), 6 deletions(-)
> > 
> > diff --git a/arch/powerpc/include/asm/vas.h
> > b/arch/powerpc/include/asm/vas.h
> > index 57573d9c1e09..f1efe86563cc 100644
> > --- a/arch/powerpc/include/asm/vas.h
> > +++ b/arch/powerpc/include/asm/vas.h
> > @@ -29,6 +29,19 @@
> >  #define VAS_THRESH_FIFO_GT_QTR_FULL	2
> >  #define VAS_THRESH_FIFO_GT_EIGHTH_FULL	3
> >  
> > +/*
> > + * VAS window status
> > + */
> > +#define VAS_WIN_ACTIVE		0x0	/* Used in platform
> > independent */
> > +					/* vas mmap() */
> > +/* The hypervisor returns these values */
> > +#define VAS_WIN_CLOSED		0x00000001
> > +#define VAS_WIN_INACTIVE	0x00000002 /* Inactive due to HW
> > failure */
> > +#define VAS_WIN_MOD_IN_PROCESS	0x00000003 /* Process of being
> > modified, */
> 
> While you're moving these and adding a comment, it would be good to 
> list what hcalls they are relevant to. H_QUERY_VAS_WINDOW (which is
> not
> used anywhere yet?) These are also a 1-byte field, so '0x00', '0x01'
> etc
> would be more appropriate.

Yes, these status bits are assigned by the hypervisor and we are not
using / supporting them right now. I just list them as defined in PAPR
NX HCALLs.

For example: OS can modify the existing window with modify HCALL when
the window is used. During this time, the hypervisor return this status
with window query HCALL. 
 
> 
> > +					   /* deallocated, or quiesced
> > */
> > +/* Linux status bits */
> > +#define VAS_WIN_NO_CRED_CLOSE	0x00000004 /* Window is closed
> > due to */
> > +					   /* lost credit */
> 
> This is mixing a user defined bit field with hcall API value field.
> You
> also AFAIKS as yet don't fill in the hypervisor status anywhere.
> 
> I would make this it's own field entirely. A boolean would be nice,
> if
> possible.

Yes, HV status bits are not used here. 

In case if the window status is reported thorugh sysfs in future,
thought that it will be simpler to have one status flag. 

I can add 'hv_status' for the hypervisor status flag in pseries_vas-
window struct and 'status' for linux in vas_window struct. 

We also need one more status for migration. So boolean may not be used.

> 
> >  /*
> >   * Get/Set bit fields
> >   */
> > @@ -59,6 +72,8 @@ struct vas_user_win_ref {
> >  	struct pid *pid;	/* PID of owner */
> >  	struct pid *tgid;	/* Thread group ID of owner */
> >  	struct mm_struct *mm;	/* Linux process mm_struct */
> > +	struct mutex mmap_mutex;	/* protects paste address mmap() */
> > +					/* with DLPAR close/open
> > windows */
> >  };
> >  
> >  /*
> > @@ -67,6 +82,7 @@ struct vas_user_win_ref {
> >  struct vas_window {
> >  	u32 winid;
> >  	u32 wcreds_max;	/* Window credits */
> > +	u32 status;
> >  	enum vas_cop_type cop;
> >  	struct vas_user_win_ref task_ref;
> >  	char *dbgname;
> > diff --git a/arch/powerpc/platforms/book3s/vas-api.c
> > b/arch/powerpc/platforms/book3s/vas-api.c
> > index 4d82c92ddd52..2b0ced611f32 100644
> > --- a/arch/powerpc/platforms/book3s/vas-api.c
> > +++ b/arch/powerpc/platforms/book3s/vas-api.c
> > @@ -316,6 +316,7 @@ static int coproc_ioc_tx_win_open(struct file
> > *fp, unsigned long arg)
> >  		return PTR_ERR(txwin);
> >  	}
> >  
> > +	mutex_init(&txwin->task_ref.mmap_mutex);
> >  	cp_inst->txwin = txwin;
> >  
> >  	return 0;
> > diff --git a/arch/powerpc/platforms/pseries/vas.c
> > b/arch/powerpc/platforms/pseries/vas.c
> > index 2ef56157634f..d9ff73d7704d 100644
> > --- a/arch/powerpc/platforms/pseries/vas.c
> > +++ b/arch/powerpc/platforms/pseries/vas.c
> > @@ -501,6 +501,7 @@ static int __init get_vas_capabilities(u8 feat,
> > enum vas_cop_feat_type type,
> >  	memset(vcaps, 0, sizeof(*vcaps));
> >  	INIT_LIST_HEAD(&vcaps->list);
> >  
> > +	vcaps->feat = feat;
> >  	caps = &vcaps->caps;
> >  
> >  	rc = h_query_vas_capabilities(H_QUERY_VAS_CAPABILITIES, feat,
> > @@ -539,6 +540,145 @@ static int __init get_vas_capabilities(u8
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
> > +	if (!vcaps->close_wins)
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
> > +	if (vcaps->close_wins > creds)
> > +		mv_ents = vcaps->close_wins - creds;
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
> 
> What's the mutex protecting? If status can change, what happens if
> it 
> changed between checking it above and this point?

We need this mutex to protect status flag between
reconfig_close/open_windows() and VAS mmap handler. 
 We hold pseries_mutex() before calling recnfig_close/popen_windows(),
so not an issue here.

> 
> > +		win->win_type = caps->win_type;
> > +		if (!--vcaps->close_wins)
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
> > +/*
> > + * Get new VAS capabilities when the core add/removal
> > configuration
> > + * changes. Reconfig window configurations based on the credits
> > + * availability from this new capabilities.
> > + */
> > +static int vas_reconfig_capabilties(u8 type)
> > +{
> > +	struct hv_vas_cop_feat_caps *hv_caps;
> > +	struct vas_cop_feat_caps *caps;
> > +	int lpar_creds, new_creds;
> > +	struct vas_caps *vcaps;
> > +	int rc = 0;
> > +
> > +	if (type >= VAS_MAX_FEAT_TYPE) {
> > +		pr_err("Invalid credit type %d\n", type);
> > +		return -EINVAL;
> > +	}
> > +
> > +	vcaps = &vascaps[type];
> > +	caps = &vcaps->caps;
> > +
> > +	hv_caps = kmalloc(sizeof(*hv_caps), GFP_KERNEL);
> > +	if (!hv_caps)
> > +		return -ENOMEM;
> > +
> > +	mutex_lock(&vas_pseries_mutex);
> > +	rc = h_query_vas_capabilities(H_QUERY_VAS_CAPABILITIES, vcaps-
> > >feat,
> > +				      (u64)virt_to_phys(hv_caps));
> > +	if (rc)
> > +		goto out;
> > +
> > +	new_creds = be16_to_cpu(hv_caps->target_lpar_creds);
> > +
> > +	lpar_creds = atomic_read(&caps->target_creds);
> 
> NBD but it would be slightly clearer that new_creds is the absolute 
> value not the number of new credits if you call these two
> new_nr_creds and old_nr_creds or prev_nr_creds.

Sure will change.
> 
> > +
> > +	atomic_set(&caps->target_creds, new_creds);
> > +	/*
> > +	 * The total number of available credits may be decreased or
> > +	 * inceased with DLPAR operation. Means some windows have to be
> > +	 * closed / reopened. Hold the vas_pseries_mutex so that the
> > +	 * the user space can not open new windows.
> > +	 */
> > +	if (lpar_creds <  new_creds) {
> > +		/*
> > +		 * If the existing target credits is less than the new
> > +		 * target, reopen windows if they are closed due to
> > +		 * the previous DLPAR (core removal).
> > +		 */
> > +		rc = reconfig_open_windows(vcaps, new_creds -
> > lpar_creds);
> > +	}
> > +
> > +out:
> > +	mutex_unlock(&vas_pseries_mutex);
> > +	kfree(hv_caps);
> > +	return rc;
> > +}
> > +
> >  /*
> >   * Total number of default credits available (target_credits)
> >   * in LPAR depends on number of cores configured. It varies based
> > on
> > @@ -565,6 +705,10 @@ static int pseries_vas_notifier(struct
> > notifier_block *nb,
> >  	if (!intserv)
> >  		return NOTIFY_OK;
> >  
> > +	rc = vas_reconfig_capabilties(VAS_GZIP_DEF_FEAT_TYPE);
> > +	if (rc)
> > +		pr_err("Failed reconfig VAS capabilities with
> > DLPAR\n");
> > +
> >  	return rc;
> >  }
> >  
> > diff --git a/arch/powerpc/platforms/pseries/vas.h
> > b/arch/powerpc/platforms/pseries/vas.h
> > index 0538760d13be..45b62565955b 100644
> > --- a/arch/powerpc/platforms/pseries/vas.h
> > +++ b/arch/powerpc/platforms/pseries/vas.h
> > @@ -21,12 +21,6 @@
> >  #define VAS_MOD_WIN_FLAGS	(VAS_MOD_WIN_JOBS_KILL | VAS_MOD_WIN_DR
> > | \
> >  				VAS_MOD_WIN_PR | VAS_MOD_WIN_SF)
> >  
> > -#define VAS_WIN_ACTIVE		0x0
> > -#define VAS_WIN_CLOSED		0x1
> > -#define VAS_WIN_INACTIVE	0x2	/* Inactive due to HW failure */
> > -/* Process of being modified, deallocated, or quiesced */
> > -#define VAS_WIN_MOD_IN_PROCESS	0x3
> > -
> >  #define VAS_COPY_PASTE_USER_MODE	0x00000001
> >  #define VAS_COP_OP_USER_MODE		0x00000010
> >  
> > @@ -84,6 +78,8 @@ struct vas_cop_feat_caps {
> >  struct vas_caps {
> >  	struct vas_cop_feat_caps caps;
> >  	struct list_head list;	/* List of open windows */
> > +	int close_wins;		/* closed windows in the hypervisor
> > for DLPAR */
> 
> 'nr_closed_wins'
> 
> This does not look like a capability. Although I guess neither do
> some
> of the fields (used_creds) in vas_cop_feat_caps. Why not at least put
> this there with the rest of those credits fields?

We can add used_credits() here since it is not part of HV capability.
It was included in previous pathes, So I did not change, 

Thanks
Haren

> 
> Thanks,
> Nick
> 
> > +	u8 feat;		/* Feature type */
> >  };
> >  
> >  /*
> > -- 
> > 2.27.0
> > 
> > 
> > 

