Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7DB4C2699
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 09:53:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K46B74QWKz3cBH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 19:53:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KO0izK1R;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=KO0izK1R; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K46926Vp4z30Pf
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 19:52:06 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21O5a9R0027195; 
 Thu, 24 Feb 2022 08:52:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=2t8ecI3yy8Il2zdL41/YOmI9kpF4rXGLf2zGhAVANNI=;
 b=KO0izK1R0iXXPEFaqhgPJ4yGezvQXd2LjTjp9vLotw0il5ImjWq/iQr/3EEKCA3udaDS
 rJUVsKO+GyZ8nPV8JxEhyUdEzmLgn8ZYCvxnyl9dOrMZwrqXejFyXk5U6Ylt3CdBNs4V
 RoNkT/ILFmL0rTpfCUG5zJ5Dd5MtRjjM0KWJO2FPN3/Zxe2uHdfGS20uFQ65rl8NsGGR
 VjzpGDQfbPo8Z4UDO+cKeagwqVg9bXjD+GAdr9oYpE6QOVV66JDDLEtfeRYhUnPeSWl+
 ZxYADxAvYBYTmElc2cBtZ3S7DexKxEG9wFAfbLrRXugZiGYl94DGTSKHogaDvFP5HGnE Og== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3edwkeak1m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Feb 2022 08:52:01 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21O8n2o6022650;
 Thu, 24 Feb 2022 08:52:00 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3edwkeak1c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Feb 2022 08:52:00 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21O8iQbH014003;
 Thu, 24 Feb 2022 08:51:59 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma03dal.us.ibm.com with ESMTP id 3ear6casu3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Feb 2022 08:51:59 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21O8puIY13370008
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Feb 2022 08:51:56 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 42514124069;
 Thu, 24 Feb 2022 08:51:56 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1358F12405B;
 Thu, 24 Feb 2022 08:51:55 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.92.72])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 24 Feb 2022 08:51:54 +0000 (GMT)
Message-ID: <52bd10b05bd45d620ed16d09e7e74d628f9f2555.camel@linux.ibm.com>
Subject: Re: [PATCH v3 2/4] powerpc/pseries/vas: Modify reconfig open/close
 functions for migration
From: Haren Myneni <haren@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au, nathanl@linux.ibm.com
Date: Thu, 24 Feb 2022 00:51:53 -0800
In-Reply-To: <1645609170.yvpqkmicgp.astroid@bobo.none>
References: <4a23d5ec655fd00da97b0b0b46174a3a3894bfb0.camel@linux.ibm.com>
 <fb9f17bd5ee7a4df453138769b709c60cdc42641.camel@linux.ibm.com>
 <1645609170.yvpqkmicgp.astroid@bobo.none>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: hAmzQfhegb0Cs_OAfgrYjWeQKWg8MkVQ
X-Proofpoint-ORIG-GUID: 8Th41QxQnknOEpzscmcBg3HvoQXnGxzj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-23_09,2022-02-23_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015
 mlxscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 suspectscore=0
 bulkscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202240050
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

On Wed, 2022-02-23 at 19:54 +1000, Nicholas Piggin wrote:
> Excerpts from Haren Myneni's message of February 20, 2022 6:05 am:
> > VAS is a hardware engine stays on the chip. So when the partition
> > migrates, all VAS windows on the source system have to be closed
> > and reopen them on the destination after migration.
> > 
> > This patch make changes to the current reconfig_open/close_windows
> > functions to support migration:
> > - Set VAS_WIN_MIGRATE_CLOSE to the window status when closes and
> >   reopen windows with the same status during resume.
> > - Continue to close all windows even if deallocate HCALL failed
> >   (should not happen) since no way to stop migration with the
> >   current LPM implementation.
> 
> Hmm.  pseries_migrate_partition *can* fail?

Yes, it can fail. If pseries_suspend() fails, all VAS windows will be
reopened again without migration. vas_migration_handler(VAS_RESUME) is
called whether pseries_suspend() returns 0 or not.

> 
> > - If the DLPAR CPU event happens while migration is in progress,
> >   set VAS_WIN_NO_CRED_CLOSE to the window status. Close window
> >   happens with the first event (migration or DLPAR) and Reopen
> >   window happens only with the last event (migration or DLPAR).
> 
> Can DLPAR happen while migration is in progress? Couldn't
> this cause your source and destination credits to go out of
> whack?

Should not be, If the DLPAR event happens while migration is in
progress, windows will be closed in the hypervisor (and mark inactive
with migration status bit in OS) for migration. For DLPAR event, mark
the DLPAR_CLOSED status bits for the necessary windows. Then after the
migration, we open windows in the hypervisor and set them active in OS
that have only migration status. Open the other remaining windows only
after the other DLPAR core add event. 

Regarding the traget credits on the destination, we get the new
capabilities after migration and use the new value for reopen. 

Ex: Used the following test case -
- Configuted 2 dedicated cores (40 credits) and exeuted the test case
which opened 35 credits / windows
- Removed 1 core, means available 20 credits. So closed 15 windows and
set them with DLPAR closed status
- Migration start: Closed the remaining 20 windows and set all windows
(means 35) migration status
- After migration, opened windows that have only migration status - 20
windows, and also clear migration stats for the remaining 15 widnows
- Add core which gives the system 20 more credits, So opened the
remaining 15 windows and these have only DLPAR closed status. 

> 
> Why do you need two close window types, what if you finish
> LPM and just open as many as possible regardless how they
> are closed?

Adding 2 different status bits to support DLPAR and LPM closed staus.
As I mentioned above, windows will be active only after both bits are
cleared.

Thanks
Haren

> 
> Thanks,
> Nick
> 
> > Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> > ---
> >  arch/powerpc/include/asm/vas.h       |  2 +
> >  arch/powerpc/platforms/pseries/vas.c | 88 ++++++++++++++++++++++
> > ------
> >  2 files changed, 73 insertions(+), 17 deletions(-)
> > 
> > diff --git a/arch/powerpc/include/asm/vas.h
> > b/arch/powerpc/include/asm/vas.h
> > index 6baf7b9ffed4..83afcb6c194b 100644
> > --- a/arch/powerpc/include/asm/vas.h
> > +++ b/arch/powerpc/include/asm/vas.h
> > @@ -36,6 +36,8 @@
> >  					/* vas mmap() */
> >  /* Window is closed in the hypervisor due to lost credit */
> >  #define VAS_WIN_NO_CRED_CLOSE	0x00000001
> > +/* Window is closed due to migration */
> > +#define VAS_WIN_MIGRATE_CLOSE	0x00000002
> >  
> >  /*
> >   * Get/Set bit fields
> > diff --git a/arch/powerpc/platforms/pseries/vas.c
> > b/arch/powerpc/platforms/pseries/vas.c
> > index 3bb219f54806..fbcf311da0ec 100644
> > --- a/arch/powerpc/platforms/pseries/vas.c
> > +++ b/arch/powerpc/platforms/pseries/vas.c
> > @@ -457,11 +457,12 @@ static int vas_deallocate_window(struct
> > vas_window *vwin)
> >  	mutex_lock(&vas_pseries_mutex);
> >  	/*
> >  	 * VAS window is already closed in the hypervisor when
> > -	 * lost the credit. So just remove the entry from
> > -	 * the list, remove task references and free vas_window
> > +	 * lost the credit or with migration. So just remove the entry
> > +	 * from the list, remove task references and free vas_window
> >  	 * struct.
> >  	 */
> > -	if (win->vas_win.status & VAS_WIN_NO_CRED_CLOSE) {
> > +	if (!(win->vas_win.status & VAS_WIN_NO_CRED_CLOSE) &&
> > +		!(win->vas_win.status & VAS_WIN_MIGRATE_CLOSE)) {
> >  		rc = deallocate_free_window(win);
> >  		if (rc) {
> >  			mutex_unlock(&vas_pseries_mutex);
> > @@ -578,12 +579,14 @@ static int __init get_vas_capabilities(u8
> > feat, enum vas_cop_feat_type type,
> >   * by setting the remapping to new paste address if the window is
> >   * active.
> >   */
> > -static int reconfig_open_windows(struct vas_caps *vcaps, int
> > creds)
> > +static int reconfig_open_windows(struct vas_caps *vcaps, int
> > creds,
> > +				 bool migrate)
> >  {
> >  	long domain[PLPAR_HCALL9_BUFSIZE] = {VAS_DEFAULT_DOMAIN_ID};
> >  	struct vas_cop_feat_caps *caps = &vcaps->caps;
> >  	struct pseries_vas_window *win = NULL, *tmp;
> >  	int rc, mv_ents = 0;
> > +	int flag;
> >  
> >  	/*
> >  	 * Nothing to do if there are no closed windows.
> > @@ -602,8 +605,10 @@ static int reconfig_open_windows(struct
> > vas_caps *vcaps, int creds)
> >  	 * (dedicated). If 1 core is added, this LPAR can have 20 more
> >  	 * credits. It means the kernel can reopen 20 windows. So move
> >  	 * 20 entries in the VAS windows lost and reopen next 20
> > windows.
> > +	 * For partition migration, reopen all windows that are closed
> > +	 * during resume.
> >  	 */
> > -	if (vcaps->nr_close_wins > creds)
> > +	if ((vcaps->nr_close_wins > creds) && !migrate)
> >  		mv_ents = vcaps->nr_close_wins - creds;
> >  
> >  	list_for_each_entry_safe(win, tmp, &vcaps->list, win_list) {
> > @@ -613,12 +618,35 @@ static int reconfig_open_windows(struct
> > vas_caps *vcaps, int creds)
> >  		mv_ents--;
> >  	}
> >  
> > +	/*
> > +	 * Open windows if they are closed only with migration or
> > +	 * DLPAR (lost credit) before.
> > +	 */
> > +	if (migrate)
> > +		flag = VAS_WIN_MIGRATE_CLOSE;
> > +	else
> > +		flag = VAS_WIN_NO_CRED_CLOSE;
> > +
> >  	list_for_each_entry_safe_from(win, tmp, &vcaps->list, win_list)
> > {
> > +		/*
> > +		 * This window is closed with DLPAR and migration
> > events.
> > +		 * So reopen the window with the last event.
> > +		 * The user space is not suspended with the current
> > +		 * migration notifier. So the user space can issue
> > DLPAR
> > +		 * CPU hotplug while migration in progress. In this
> > case
> > +		 * this window will be opened with the last event.
> > +		 */
> > +		if ((win->vas_win.status & VAS_WIN_NO_CRED_CLOSE) &&
> > +			(win->vas_win.status & VAS_WIN_MIGRATE_CLOSE))
> > {
> > +			win->vas_win.status &= ~flag;
> > +			continue;
> > +		}
> > +
> >  		/*
> >  		 * Nothing to do on this window if it is not closed
> > -		 * with VAS_WIN_NO_CRED_CLOSE
> > +		 * with this flag
> >  		 */
> > -		if (!(win->vas_win.status & VAS_WIN_NO_CRED_CLOSE))
> > +		if (!(win->vas_win.status & flag))
> >  			continue;
> >  
> >  		rc = allocate_setup_window(win, (u64 *)&domain[0],
> > @@ -634,7 +662,7 @@ static int reconfig_open_windows(struct
> > vas_caps *vcaps, int creds)
> >  		/*
> >  		 * Set window status to active
> >  		 */
> > -		win->vas_win.status &= ~VAS_WIN_NO_CRED_CLOSE;
> > +		win->vas_win.status &= ~flag;
> >  		mutex_unlock(&win->vas_win.task_ref.mmap_mutex);
> >  		win->win_type = caps->win_type;
> >  		if (!--vcaps->nr_close_wins)
> > @@ -661,20 +689,32 @@ static int reconfig_open_windows(struct
> > vas_caps *vcaps, int creds)
> >   * the user space to fall back to SW compression and manage with
> > the
> >   * existing windows.
> >   */
> > -static int reconfig_close_windows(struct vas_caps *vcap, int
> > excess_creds)
> > +static int reconfig_close_windows(struct vas_caps *vcap, int
> > excess_creds,
> > +									
> > bool migrate)
> >  {
> >  	struct pseries_vas_window *win, *tmp;
> >  	struct vas_user_win_ref *task_ref;
> >  	struct vm_area_struct *vma;
> > -	int rc = 0;
> > +	int rc = 0, flag;
> > +
> > +	if (migrate)
> > +		flag = VAS_WIN_MIGRATE_CLOSE;
> > +	else
> > +		flag = VAS_WIN_NO_CRED_CLOSE;
> >  
> >  	list_for_each_entry_safe(win, tmp, &vcap->list, win_list) {
> >  		/*
> >  		 * This window is already closed due to lost credit
> > -		 * before. Go for next window.
> > +		 * or for migration before. Go for next window.
> > +		 * For migration, nothing to do since this window
> > +		 * closed for DLPAR and will be reopened even on
> > +		 * the destination system with other DLPAR operation.
> >  		 */
> > -		if (win->vas_win.status & VAS_WIN_NO_CRED_CLOSE)
> > +		if ((win->vas_win.status & VAS_WIN_MIGRATE_CLOSE) ||
> > +			(win->vas_win.status & VAS_WIN_NO_CRED_CLOSE))
> > {
> > +			win->vas_win.status |= flag;
> >  			continue;
> > +		}
> >  
> >  		task_ref = &win->vas_win.task_ref;
> >  		mutex_lock(&task_ref->mmap_mutex);
> > @@ -683,7 +723,7 @@ static int reconfig_close_windows(struct
> > vas_caps *vcap, int excess_creds)
> >  		 * Number of available credits are reduced, So select
> >  		 * and close windows.
> >  		 */
> > -		win->vas_win.status |= VAS_WIN_NO_CRED_CLOSE;
> > +		win->vas_win.status |= flag;
> >  
> >  		mmap_write_lock(task_ref->mm);
> >  		/*
> > @@ -706,12 +746,24 @@ static int reconfig_close_windows(struct
> > vas_caps *vcap, int excess_creds)
> >  		 * later when the process issued with close(FD).
> >  		 */
> >  		rc = deallocate_free_window(win);
> > -		if (rc)
> > +		/*
> > +		 * This failure is from the hypervisor.
> > +		 * No way to stop migration for these failures.
> > +		 * So ignore error and continue closing other windows.
> > +		 */
> > +		if (rc && !migrate)
> >  			return rc;
> >  
> >  		vcap->nr_close_wins++;
> >  
> > -		if (!--excess_creds)
> > +		/*
> > +		 * For migration, do not depend on lpar_creds in case
> > if
> > +		 * mismatch with the hypervisor value (should not
> > happen).
> > +		 * So close all active windows in the list and will be
> > +		 * reopened windows based on the new lpar_creds on the
> > +		 * destination system during resume.
> > +		 */
> > +		if (!migrate && !--excess_creds)
> >  			break;
> >  	}
> >  
> > @@ -761,7 +813,8 @@ int vas_reconfig_capabilties(u8 type)
> >  		 * target, reopen windows if they are closed due to
> >  		 * the previous DLPAR (core removal).
> >  		 */
> > -		rc = reconfig_open_windows(vcaps, new_nr_creds -
> > old_nr_creds);
> > +		rc = reconfig_open_windows(vcaps, new_nr_creds -
> > old_nr_creds,
> > +					   false);
> >  	} else {
> >  		/*
> >  		 * # active windows is more than new LPAR available
> > @@ -771,7 +824,8 @@ int vas_reconfig_capabilties(u8 type)
> >  		nr_active_wins = vcaps->nr_open_windows - vcaps-
> > >nr_close_wins;
> >  		if (nr_active_wins > new_nr_creds)
> >  			rc = reconfig_close_windows(vcaps,
> > -					nr_active_wins - new_nr_creds);
> > +					nr_active_wins - new_nr_creds,
> > +					false);
> >  	}
> >  
> >  out:
> > -- 
> > 2.27.0
> > 
> > 
> > 

