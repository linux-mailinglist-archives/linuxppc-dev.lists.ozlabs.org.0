Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 34763557D19
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jun 2022 15:34:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LTLnT12Y6z3cdn
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jun 2022 23:34:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.a=rsa-sha256 header.s=20151216 header.b=jQZxMm2q;
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.a=rsa-sha256 header.s=20151216 header.b=eBrnwNmo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=hansenpartnership.com (client-ip=96.44.175.130; helo=bedivere.hansenpartnership.com; envelope-from=james.bottomley@hansenpartnership.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.a=rsa-sha256 header.s=20151216 header.b=jQZxMm2q;
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.a=rsa-sha256 header.s=20151216 header.b=eBrnwNmo;
	dkim-atps=neutral
X-Greylist: delayed 600 seconds by postgrey-1.36 at boromir; Thu, 23 Jun 2022 23:33:29 AEST
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LTLmn38thz2xs1
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jun 2022 23:33:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1655990602;
	bh=2+RnhRSYBf9t0pLNaFxZTzdzl+ka8qJGuDaaIJ0J+SE=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=jQZxMm2qirAr+munyYWPBowvfq9hHN90Qjs6CLjfowE3BiVJ37/R2Y0y+OoSYHzov
	 2ODPECkLsMZa5jHp4mf5/RN+kal13JqodQkywQs78EY54f1wTMg44+63Yjp8wsGgs7
	 /Et2tUa+r685pKlwTloW2yk1NNkDyjconWxyZO/c=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 02B821281161;
	Thu, 23 Jun 2022 09:23:22 -0400 (EDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9zhIpAMrBkCT; Thu, 23 Jun 2022 09:23:21 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1655990601;
	bh=2+RnhRSYBf9t0pLNaFxZTzdzl+ka8qJGuDaaIJ0J+SE=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=eBrnwNmoTPKz2acfj3bSSE37qXRZymR6d57PTcwrdbVLvtNEzgwvb/jnjwQM3LZxK
	 DABRjQo8IG8dpHo8+xRe79xEm+ChL5obtdmWZsLK8l3DoFbw5T0QrjGxcarv7kfRHq
	 k+DN7QN6QiXBzDt0DlqdF03HzXqaw670zyu8Vl9A=
Received: from [IPv6:2601:5c4:4300:c551:a71:90ff:fec2:f05b] (unknown [IPv6:2601:5c4:4300:c551:a71:90ff:fec2:f05b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id A62431280DD8;
	Thu, 23 Jun 2022 09:23:20 -0400 (EDT)
Message-ID: <41ca51e8db9907d9060cc38adb59a66dcae4c59b.camel@HansenPartnership.com>
Subject: Re: [RFC PATCH v2 2/3] fs: define a firmware security filesystem
 named fwsecurityfs
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nayna Jain
	 <nayna@linux.ibm.com>
Date: Thu, 23 Jun 2022 09:23:19 -0400
In-Reply-To: <YrQqPhi4+jHZ1WJc@kroah.com>
References: <20220622215648.96723-1-nayna@linux.ibm.com>
	 <20220622215648.96723-3-nayna@linux.ibm.com> <YrQqPhi4+jHZ1WJc@kroah.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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

On Thu, 2022-06-23 at 10:54 +0200, Greg Kroah-Hartman wrote:
[...]
> > diff --git a/fs/fwsecurityfs/inode.c b/fs/fwsecurityfs/inode.c
> > new file mode 100644
> > index 000000000000..5d06dc0de059
> > --- /dev/null
> > +++ b/fs/fwsecurityfs/inode.c
> > @@ -0,0 +1,159 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (C) 2022 IBM Corporation
> > + * Author: Nayna Jain <nayna@linux.ibm.com>
> > + */
> > +
> > +#include <linux/sysfs.h>
> > +#include <linux/kobject.h>
> > +#include <linux/fs.h>
> > +#include <linux/fs_context.h>
> > +#include <linux/mount.h>
> > +#include <linux/pagemap.h>
> > +#include <linux/init.h>
> > +#include <linux/namei.h>
> > +#include <linux/security.h>
> > +#include <linux/lsm_hooks.h>
> > +#include <linux/magic.h>
> > +#include <linux/ctype.h>
> > +#include <linux/fwsecurityfs.h>
> > +
> > +#include "internal.h"
> > +
> > +int fwsecurityfs_remove_file(struct dentry *dentry)
> > +{
> > +	drop_nlink(d_inode(dentry));
> > +	dput(dentry);
> > +	return 0;
> > +};
> > +EXPORT_SYMBOL_GPL(fwsecurityfs_remove_file);
> > +
> > +int fwsecurityfs_create_file(const char *name, umode_t mode,
> > +					u16 filesize, struct dentry
> > *parent,
> > +					struct dentry *dentry,
> > +					const struct file_operations
> > *fops)
> > +{
> > +	struct inode *inode;
> > +	int error;
> > +	struct inode *dir;
> > +
> > +	if (!parent)
> > +		return -EINVAL;
> > +
> > +	dir = d_inode(parent);
> > +	pr_debug("securityfs: creating file '%s'\n", name);
> 
> Did you forget to call simple_pin_fs() here or anywhere else?
> 
> And this can be just one function with the directory creation file,
> just check the mode and you will be fine.  Look at securityfs as an
> example of how to make this simpler.

Actually, before you go down this route can you consider the namespace
ramifications.  In fact we're just having to rework securityfs to pull
out all the simple_pin_... calls because simple_pin_... is completely
inimical to namespaces.

The first thing to consider is if you simply use securityfs you'll
inherit all the simple_pin_... removal work and be namespace ready.  It
could be that creating a new filesystem that can't be namespaced is the
right thing to do here, but at least ask the question: would we ever
want any of these files to be presented selectively inside containers? 
If the answer is "yes" then simple_pin_... is the wrong interface.

James


