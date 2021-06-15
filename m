Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7561D3A772E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 08:38:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G3zCW0Fbnz3bv3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 16:37:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aciG92Sj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=aciG92Sj; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G3zBz5qqtz302W
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 16:37:31 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15F6XUQ5027197; Tue, 15 Jun 2021 02:37:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=02GwyeUK1Ad616n3iPIjje3OLiJe7KMwztSOPf/IMe8=;
 b=aciG92SjXjzkgy8kSq5hyWjmOQGHW6FSbDSh8QndlM47ZUHFewQOlx6qGQCAjZ5a2q8M
 Pw4Mhrs8MacOdxi8voYzKyh4IVk4lqSvBv/jhRMT0Pqs8AoF24RDsDPiDrGOUvgs4FhH
 3OSjFwdf07POE430kz4E3wR2F13krVP1Ng+zysIa/V5ogNuC74dBKN41e8CY+ry2n4f+
 hTbiUz/dJ9hFth42QVnD2boq1N3K7gBDL/yU8djq0Wk1VfFWWAdXZBke3x0bFe5xZ3Or
 74LWefyMqzDwwmx63P6lgskLBGBcwteu98ahXxcTw3zCzPK3KpnsccNsf6z1GgMehNtX lw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 396n0ftu8c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Jun 2021 02:37:21 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15F6XUcb027179;
 Tue, 15 Jun 2021 02:37:20 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 396n0ftu82-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Jun 2021 02:37:20 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15F6W7FE025036;
 Tue, 15 Jun 2021 06:37:20 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma02wdc.us.ibm.com with ESMTP id 394mj9nfw0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Jun 2021 06:37:20 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15F6bJvn16777590
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Jun 2021 06:37:19 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0CA15BE065;
 Tue, 15 Jun 2021 06:37:19 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 51294BE05B;
 Tue, 15 Jun 2021 06:37:17 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.180.39])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 15 Jun 2021 06:37:17 +0000 (GMT)
Message-ID: <e409750a3bd5f8410d7a8a290c69375486420b93.camel@linux.ibm.com>
Subject: Re: [PATCH v5 04/17] powerpc/vas: Add platform specific user window
 operations
From: Haren Myneni <haren@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, herbert@gondor.apana.org.au,
 linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
Date: Mon, 14 Jun 2021 23:37:15 -0700
In-Reply-To: <1623636838.8tsdy9nisc.astroid@bobo.none>
References: <ed7a09822cf3a2e463f942e5a37309a2365c9d79.camel@linux.ibm.com>
 <c64fda6e9b684c175cedb3ec448cce7aaf0f4615.camel@linux.ibm.com>
 <1623636838.8tsdy9nisc.astroid@bobo.none>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ARJQs9xIiTuKBCu0TUgENN226-h1QDb_
X-Proofpoint-GUID: KFEP1vqnlt5NvFP9jCgVJpQtZh6Bh6Ea
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-15_03:2021-06-14,
 2021-06-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 mlxlogscore=999 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0
 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106150038
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

On Mon, 2021-06-14 at 12:24 +1000, Nicholas Piggin wrote:
> Excerpts from Haren Myneni's message of June 13, 2021 8:57 pm:
> > PowerNV uses registers to open/close VAS windows, and getting the
> > paste address. Whereas the hypervisor calls are used on PowerVM.
> > 
> > This patch adds the platform specific user space window operations
> > and register with the common VAS user space interface.
> > 
> > Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> > ---
> >  arch/powerpc/include/asm/vas.h              | 14 +++++-
> >  arch/powerpc/platforms/book3s/vas-api.c     | 53 +++++++++++++--
> > ------
> >  arch/powerpc/platforms/powernv/vas-window.c | 45 ++++++++++++++++-
> >  3 files changed, 89 insertions(+), 23 deletions(-)
> > 
> > diff --git a/arch/powerpc/include/asm/vas.h
> > b/arch/powerpc/include/asm/vas.h
> > index bab7891d43f5..85318d7446c7 100644
> > --- a/arch/powerpc/include/asm/vas.h
> > +++ b/arch/powerpc/include/asm/vas.h
> > @@ -5,6 +5,7 @@
> >  
> >  #ifndef _ASM_POWERPC_VAS_H
> >  #define _ASM_POWERPC_VAS_H
> > +#include <uapi/asm/vas-api.h>
> >  
> >  struct vas_window;
> >  
> > @@ -48,6 +49,16 @@ enum vas_cop_type {
> >  	VAS_COP_TYPE_MAX,
> >  };
> >  
> > +/*
> > + * User space window operations used for powernv and powerVM
> > + */
> > +struct vas_user_win_ops {
> > +	struct vas_window * (*open_win)(struct vas_tx_win_open_attr *,
> > +				enum vas_cop_type);
> > +	u64 (*paste_addr)(struct vas_window *);
> > +	int (*close_win)(struct vas_window *);
> > +};
> 
> This looks better, but rather than pull in uapi and the user API 
> structure here, could you just pass in vas_id and flags after the
> common 
> code does the user copy and verifies the version and other details?
> 
> I think it's generally good practice to limit the data that the usre
> can influence as much as possible. Sorry for not picking up on that
> earlier.

The user space pass vas_tx_win_open_attr struct - use only vas_id and
flags right now but it can be extended in future with reserve elements.
So passing the same struct to platform specific API.

do you prefer "struct vas_window * (*open_win)(vas_id, flags, cop)" and
extend later when more elments are used?

Thanks
Haren 

> 
> If that's changed, then
> 
> Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
> 
> Thanks,
> Nick
> 
> > +
> >  /*
> >   * Receive window attributes specified by the (in-kernel) owner of
> > window.
> >   */
> > @@ -175,7 +186,8 @@ void vas_unregister_api_powernv(void);
> >   * used for others in future.
> >   */
> >  int vas_register_coproc_api(struct module *mod, enum vas_cop_type
> > cop_type,
> > -				const char *name);
> > +			    const char *name,
> > +			    const struct vas_user_win_ops *vops);
> >  void vas_unregister_coproc_api(void);
> >  
> >  #endif /* __ASM_POWERPC_VAS_H */
> > diff --git a/arch/powerpc/platforms/book3s/vas-api.c
> > b/arch/powerpc/platforms/book3s/vas-api.c
> > index 72c126d87216..7cfc4b435ae8 100644
> > --- a/arch/powerpc/platforms/book3s/vas-api.c
> > +++ b/arch/powerpc/platforms/book3s/vas-api.c
> > @@ -42,6 +42,7 @@ static struct coproc_dev {
> >  	dev_t devt;
> >  	struct class *class;
> >  	enum vas_cop_type cop_type;
> > +	const struct vas_user_win_ops *vops;
> >  } coproc_device;
> >  
> >  struct coproc_instance {
> > @@ -72,11 +73,10 @@ static int coproc_open(struct inode *inode,
> > struct file *fp)
> >  static int coproc_ioc_tx_win_open(struct file *fp, unsigned long
> > arg)
> >  {
> >  	void __user *uptr = (void __user *)arg;
> > -	struct vas_tx_win_attr txattr = {};
> >  	struct vas_tx_win_open_attr uattr;
> >  	struct coproc_instance *cp_inst;
> >  	struct vas_window *txwin;
> > -	int rc, vasid;
> > +	int rc;
> >  
> >  	cp_inst = fp->private_data;
> >  
> > @@ -93,27 +93,20 @@ static int coproc_ioc_tx_win_open(struct file
> > *fp, unsigned long arg)
> >  	}
> >  
> >  	if (uattr.version != 1) {
> > -		pr_err("Invalid version\n");
> > +		pr_err("Invalid window open API version\n");
> >  		return -EINVAL;
> >  	}
> >  
> > -	vasid = uattr.vas_id;
> > -
> > -	vas_init_tx_win_attr(&txattr, cp_inst->coproc->cop_type);
> > -
> > -	txattr.lpid = mfspr(SPRN_LPID);
> > -	txattr.pidr = mfspr(SPRN_PID);
> > -	txattr.user_win = true;
> > -	txattr.rsvd_txbuf_count = false;
> > -	txattr.pswid = false;
> > -
> > -	pr_devel("Pid %d: Opening txwin, PIDR %ld\n", txattr.pidr,
> > -				mfspr(SPRN_PID));
> > +	if (!cp_inst->coproc->vops && !cp_inst->coproc->vops->open_win) 
> > {
> > +		pr_err("VAS API is not registered\n");
> > +		return -EACCES;
> > +	}
> >  
> > -	txwin = vas_tx_win_open(vasid, cp_inst->coproc->cop_type,
> > &txattr);
> > +	txwin = cp_inst->coproc->vops->open_win(&uattr,
> > +						cp_inst->coproc-
> > >cop_type);
> >  	if (IS_ERR(txwin)) {
> > -		pr_err("%s() vas_tx_win_open() failed, %ld\n",
> > __func__,
> > -					PTR_ERR(txwin));
> > +		pr_err("%s() VAS window open failed, %ld\n", __func__,
> > +				PTR_ERR(txwin));
> >  		return PTR_ERR(txwin);
> >  	}
> >  
> > @@ -125,9 +118,15 @@ static int coproc_ioc_tx_win_open(struct file
> > *fp, unsigned long arg)
> >  static int coproc_release(struct inode *inode, struct file *fp)
> >  {
> >  	struct coproc_instance *cp_inst = fp->private_data;
> > +	int rc;
> >  
> >  	if (cp_inst->txwin) {
> > -		vas_win_close(cp_inst->txwin);
> > +		if (cp_inst->coproc->vops &&
> > +			cp_inst->coproc->vops->close_win) {
> > +			rc = cp_inst->coproc->vops->close_win(cp_inst-
> > >txwin);
> > +			if (rc)
> > +				return rc;
> > +		}
> >  		cp_inst->txwin = NULL;
> >  	}
> >  
> > @@ -168,7 +167,17 @@ static int coproc_mmap(struct file *fp, struct
> > vm_area_struct *vma)
> >  		return -EINVAL;
> >  	}
> >  
> > -	vas_win_paste_addr(txwin, &paste_addr, NULL);
> > +	if (!cp_inst->coproc->vops && !cp_inst->coproc->vops-
> > >paste_addr) {
> > +		pr_err("%s(): VAS API is not registered\n", __func__);
> > +		return -EACCES;
> > +	}
> > +
> > +	paste_addr = cp_inst->coproc->vops->paste_addr(txwin);
> > +	if (!paste_addr) {
> > +		pr_err("%s(): Window paste address failed\n",
> > __func__);
> > +		return -EINVAL;
> > +	}
> > +
> >  	pfn = paste_addr >> PAGE_SHIFT;
> >  
> >  	/* flags, page_prot from cxl_mmap(), except we want cachable */
> > @@ -208,7 +217,8 @@ static struct file_operations coproc_fops = {
> >   * extended to other coprocessor types later.
> >   */
> >  int vas_register_coproc_api(struct module *mod, enum vas_cop_type
> > cop_type,
> > -				const char *name)
> > +			    const char *name,
> > +			    const struct vas_user_win_ops *vops)
> >  {
> >  	int rc = -EINVAL;
> >  	dev_t devno;
> > @@ -230,6 +240,7 @@ int vas_register_coproc_api(struct module *mod,
> > enum vas_cop_type cop_type,
> >  	}
> >  	coproc_device.class->devnode = coproc_devnode;
> >  	coproc_device.cop_type = cop_type;
> > +	coproc_device.vops = vops;
> >  
> >  	coproc_fops.owner = mod;
> >  	cdev_init(&coproc_device.cdev, &coproc_fops);
> > diff --git a/arch/powerpc/platforms/powernv/vas-window.c
> > b/arch/powerpc/platforms/powernv/vas-window.c
> > index 41712b4b268e..5162e95c4090 100644
> > --- a/arch/powerpc/platforms/powernv/vas-window.c
> > +++ b/arch/powerpc/platforms/powernv/vas-window.c
> > @@ -16,6 +16,7 @@
> >  #include <linux/mmu_context.h>
> >  #include <asm/switch_to.h>
> >  #include <asm/ppc-opcode.h>
> > +#include <asm/vas.h>
> >  #include "vas.h"
> >  #include "copy-paste.h"
> >  
> > @@ -1443,6 +1444,48 @@ struct vas_window
> > *vas_pswid_to_window(struct vas_instance *vinst,
> >  	return window;
> >  }
> >  
> > +static struct vas_window *vas_user_win_open(struct
> > vas_tx_win_open_attr *uattr,
> > +				enum vas_cop_type cop_type)
> > +{
> > +	struct vas_tx_win_attr txattr = {};
> > +
> > +	vas_init_tx_win_attr(&txattr, cop_type);
> > +
> > +	txattr.lpid = mfspr(SPRN_LPID);
> > +	txattr.pidr = mfspr(SPRN_PID);
> > +	txattr.user_win = true;
> > +	txattr.rsvd_txbuf_count = false;
> > +	txattr.pswid = false;
> > +
> > +	pr_devel("Pid %d: Opening txwin, PIDR %ld\n", txattr.pidr,
> > +				mfspr(SPRN_PID));
> > +
> > +	return vas_tx_win_open(uattr->vas_id, cop_type, &txattr);
> > +}
> > +
> > +static u64 vas_user_win_paste_addr(struct vas_window *win)
> > +{
> > +	u64 paste_addr;
> > +
> > +	vas_win_paste_addr(win, &paste_addr, NULL);
> > +
> > +	return paste_addr;
> > +}
> > +
> > +static int vas_user_win_close(struct vas_window *txwin)
> > +{
> > +
> > +	vas_win_close(txwin);
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct vas_user_win_ops vops =  {
> > +	.open_win	=	vas_user_win_open,
> > +	.paste_addr	=	vas_user_win_paste_addr,
> > +	.close_win	=	vas_user_win_close,
> > +};
> > +
> >  /*
> >   * Supporting only nx-gzip coprocessor type now, but this API code
> >   * extended to other coprocessor types later.
> > @@ -1451,7 +1494,7 @@ int vas_register_api_powernv(struct module
> > *mod, enum vas_cop_type cop_type,
> >  			     const char *name)
> >  {
> >  
> > -	return vas_register_coproc_api(mod, cop_type, name);
> > +	return vas_register_coproc_api(mod, cop_type, name, &vops);
> >  }
> >  EXPORT_SYMBOL_GPL(vas_register_api_powernv);
> >  
> > -- 
> > 2.18.2
> > 
> > 
> > 

