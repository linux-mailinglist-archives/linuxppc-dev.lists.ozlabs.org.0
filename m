Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BFA32346A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Feb 2021 00:53:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DlbVW3QdWz3cTl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Feb 2021 10:53:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=pvorel@suse.cz;
 receiver=<UNKNOWN>)
X-Greylist: delayed 1175 seconds by postgrey-1.36 at boromir;
 Wed, 24 Feb 2021 10:53:39 AEDT
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DlbVC0Z3Zz30NM
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Feb 2021 10:53:38 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 93768AC6E;
 Tue, 23 Feb 2021 23:34:00 +0000 (UTC)
Date: Wed, 24 Feb 2021 00:33:58 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Subject: Re: [PATCH v2 1/2] ima: Free IMA measurement buffer on error
Message-ID: <YDWQ5rBBe8t7+Bs2@pevik>
References: <20210204174951.25771-1-nramas@linux.microsoft.com>
 <YB0YdqbbdAdbEOQw@kroah.com>
 <7000d128-272e-3654-8480-e46bf7dfad74@linux.microsoft.com>
 <6a5b7a1767265122d21f185c81399692d12191f4.camel@linux.ibm.com>
 <b8573374-86d0-f679-6c9f-a61b2bc6f7ea@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b8573374-86d0-f679-6c9f-a61b2bc6f7ea@linux.microsoft.com>
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: sashal@kernel.org, Greg KH <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, Mimi Zohar <zohar@linux.ibm.com>,
 tyhicks@linux.microsoft.com, ebiederm@xmission.com, dmitry.kasatkin@gmail.com,
 linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi all,

<snip>
> > > > <formletter>

> > > > This is not the correct way to submit patches for inclusion in the
> > > > stable kernel tree.  Please read:
> > > >       https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
> > > > for how to do this properly.

> > > > </formletter>


> > > Thanks for the info Greg.

> > > I will re-submit the two patches in the proper format.

> > No need.  I'm testing these patches now.  I'm not exactly sure what the
> > problem is.  Stable wasn't Cc'ed.  Is it that you sent the patch
> > directly to Greg or added "Fixes"?

> I had not Cced stable, but had "Fixes" tag in the patch.

> Fixes: 7b8589cc29e7 ("ima: on soft reboot, save the measurement list")

> The problem is that the buffer allocated for forwarding the IMA measurement
> list is not freed - at the end of the kexec call and also in an error path.
> Please see the patch description for

> [PATCH v2 2/2] ima: Free IMA measurement buffer after kexec syscall

> IMA allocates kernel virtual memory to carry forward the measurement
> list, from the current kernel to the next kernel on kexec system call,
> in ima_add_kexec_buffer() function.  This buffer is not freed before
> completing the kexec system call resulting in memory leak.

> thanks,
>  -lakshmi

Mimi, Lakshmi, it looks like these two fixes haven't been submitted to stable kernels.
Could you please submit them?

Thanks a lot!

Kind regards,
Petr
