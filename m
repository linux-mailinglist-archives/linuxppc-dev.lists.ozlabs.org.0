Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD3F55B2B5
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Jun 2022 17:49:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LWFdz0y7Lz3cg1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jun 2022 01:49:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=a1+0w5V9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=zohar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=a1+0w5V9;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LWFdB4F8Rz3bhm
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jun 2022 01:48:30 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25QEC3hk026475;
	Sun, 26 Jun 2022 15:48:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=Vx8qhw9gsD0GT+n5MLIi+2BfObnIPd+FACJyCWPp8I8=;
 b=a1+0w5V9zR4fLwolFFcdgiYDd9Z0TtUsQm43h6ECifBvltnDtebBIT74AiGh/hV8cI9s
 xmAQQRRJvkrnXzWr9BmuRdKgmf6quhX+c4Xwtxy2PNLTw9yHax1iwKVJYlJDB0hV7D+z
 U77yZiNCQKeCLF6jkr1Rn0wQLWbVR6IpO3SPGolpog30oQfs14cGd0RpJv8mcE7jrHsD
 gaqjXphF1jwO4d4OzrefKH2MDlvtb075DKJZ6ZI3elO8wW1eGkSZQg9IUzEYDNLu0Y0O
 YdEVAsWKg9ahk/obUuQ5nnz8yCXrIMcL+tHfVVsRRfQVMkthfR6LI1X9vHrvbuvJxjSj Yg== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gxs0hs6vy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 26 Jun 2022 15:48:17 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25QFlSel001778;
	Sun, 26 Jun 2022 15:48:14 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma06ams.nl.ibm.com with ESMTP id 3gwsmj1qn0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 26 Jun 2022 15:48:14 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25QFmBZt14221784
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 26 Jun 2022 15:48:11 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8A40C11C050;
	Sun, 26 Jun 2022 15:48:11 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DDA1811C04A;
	Sun, 26 Jun 2022 15:48:07 +0000 (GMT)
Received: from li-f45666cc-3089-11b2-a85c-c57d1a57929f.ibm.com (unknown [9.211.95.64])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Sun, 26 Jun 2022 15:48:07 +0000 (GMT)
Message-ID: <54af4a92356090d88639531413ea8cb46837bd18.camel@linux.ibm.com>
Subject: Re: [RFC PATCH v2 2/3] fs: define a firmware security filesystem
 named fwsecurityfs
From: Mimi Zohar <zohar@linux.ibm.com>
To: James Bottomley <James.Bottomley@HansenPartnership.com>,
        Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>,
        Nayna Jain <nayna@linux.ibm.com>
Date: Sun, 26 Jun 2022 11:48:06 -0400
In-Reply-To: <41ca51e8db9907d9060cc38adb59a66dcae4c59b.camel@HansenPartnership.com>
References: <20220622215648.96723-1-nayna@linux.ibm.com>
	 <20220622215648.96723-3-nayna@linux.ibm.com> <YrQqPhi4+jHZ1WJc@kroah.com>
	 <41ca51e8db9907d9060cc38adb59a66dcae4c59b.camel@HansenPartnership.com>
Content-Type: text/plain; charset="ISO-8859-15"
X-Mailer: Evolution 3.28.5 (3.28.5-18.el8) 
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 9AuopBc9nCHv2PWc6MREZAyjLibJAqd-
X-Proofpoint-ORIG-GUID: 9AuopBc9nCHv2PWc6MREZAyjLibJAqd-
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-26_03,2022-06-24_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 malwarescore=0
 mlxscore=0 mlxlogscore=999 spamscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206260064
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
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org, Dov Murik <dovmurik@linux.ibm.com>, Dave Hansen <dave.hansen@intel.com>, linux-security-module <linux-security-module@vger.kernel.org>, Paul Mackerras <paulus@samba.org>, linux-fsdevel@vger.kernel.org, George Wilson <gcwilson@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, gjoyce@ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2022-06-23 at 09:23 -0400, James Bottomley wrote:
> On Thu, 2022-06-23 at 10:54 +0200, Greg Kroah-Hartman wrote:
> [...]
> > > diff --git a/fs/fwsecurityfs/inode.c b/fs/fwsecurityfs/inode.c
> > > new file mode 100644
> > > index 000000000000..5d06dc0de059
> > > --- /dev/null
> > > +++ b/fs/fwsecurityfs/inode.c
> > > @@ -0,0 +1,159 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +/*
> > > + * Copyright (C) 2022 IBM Corporation
> > > + * Author: Nayna Jain <nayna@linux.ibm.com>
> > > + */
> > > +
> > > +#include <linux/sysfs.h>
> > > +#include <linux/kobject.h>
> > > +#include <linux/fs.h>
> > > +#include <linux/fs_context.h>
> > > +#include <linux/mount.h>
> > > +#include <linux/pagemap.h>
> > > +#include <linux/init.h>
> > > +#include <linux/namei.h>
> > > +#include <linux/security.h>
> > > +#include <linux/lsm_hooks.h>
> > > +#include <linux/magic.h>
> > > +#include <linux/ctype.h>
> > > +#include <linux/fwsecurityfs.h>
> > > +
> > > +#include "internal.h"
> > > +
> > > +int fwsecurityfs_remove_file(struct dentry *dentry)
> > > +{
> > > +	drop_nlink(d_inode(dentry));
> > > +	dput(dentry);
> > > +	return 0;
> > > +};
> > > +EXPORT_SYMBOL_GPL(fwsecurityfs_remove_file);
> > > +
> > > +int fwsecurityfs_create_file(const char *name, umode_t mode,
> > > +					u16 filesize, struct dentry
> > > *parent,
> > > +					struct dentry *dentry,
> > > +					const struct file_operations
> > > *fops)
> > > +{
> > > +	struct inode *inode;
> > > +	int error;
> > > +	struct inode *dir;
> > > +
> > > +	if (!parent)
> > > +		return -EINVAL;
> > > +
> > > +	dir = d_inode(parent);
> > > +	pr_debug("securityfs: creating file '%s'\n", name);
> > 
> > Did you forget to call simple_pin_fs() here or anywhere else?
> > 
> > And this can be just one function with the directory creation file,
> > just check the mode and you will be fine.  Look at securityfs as an
> > example of how to make this simpler.
> 
> Actually, before you go down this route can you consider the namespace
> ramifications.  In fact we're just having to rework securityfs to pull
> out all the simple_pin_... calls because simple_pin_... is completely
> inimical to namespaces.
> 
> The first thing to consider is if you simply use securityfs you'll
> inherit all the simple_pin_... removal work and be namespace ready.  It
> could be that creating a new filesystem that can't be namespaced is the
> right thing to do here, but at least ask the question: would we ever
> want any of these files to be presented selectively inside containers? 
> If the answer is "yes" then simple_pin_... is the wrong interface.

Greg, the securityfs changes James is referring to are part of the IMA
namespacing patch set:
https://lore.kernel.org/linux-integrity/20220420140633.753772-1-stefanb@linux.ibm.com/

I'd really appreciate your reviewing the first two patches:
[PATCH v12 01/26] securityfs: rework dentry creation
[PATCH v12 02/26] securityfs: Extend securityfs with namespacing
support

thanks,

Mimi



