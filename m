Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1C41A2015
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Apr 2020 13:44:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48y2Vt6dYfzDqfq
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Apr 2020 21:44:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=mchehab+huawei@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=lNMtsoG3; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48y2R22LpLzDqfq
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Apr 2020 21:41:02 +1000 (AEST)
Received: from coco.lan (ip5f5ad4d8.dynamic.kabel-deutschland.de
 [95.90.212.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 759AF20747;
 Wed,  8 Apr 2020 11:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586346059;
 bh=igLuiZn52qB1kj2vKxCTjSGs9/VNYNbdH6sNTlgRisY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lNMtsoG3BeTIbawLBoa0nrrwd0el6dj9ixd/wEe67LD2atI1u1lEiKmTJiKJA0hjV
 FXR8cQCs+m+ksv+uue55PKV997wAUH/UarzRCS6hVK+lXwWdeotoHeiFSlypmHOYoN
 dm4usj1My3oZ7OaxsoqH8jwAufqemuBwo1R1j8fs=
Date: Wed, 8 Apr 2020 13:40:48 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2 0/2] Don't generate thousands of new warnings when
 building docs
Message-ID: <20200408134048.5329427d@coco.lan>
In-Reply-To: <87lfn8klf4.fsf@mpe.ellerman.id.au>
References: <cover.1584716446.git.mchehab+huawei@kernel.org>
 <87lfn8klf4.fsf@mpe.ellerman.id.au>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Ricardo Ribalda Delgado <ribalda@kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 target-devel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Alex Shi <alex.shi@linux.alibaba.com>,
 linux-scsi@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, x86@kernel.org,
 Tyler Hicks <code@tyhicks.com>, Ingo Molnar <mingo@redhat.com>,
 Jakub Kicinski <kuba@kernel.org>, Jacopo Mondi <jacopo@jmondi.org>,
 Luca Ceresoli <luca@lucaceresoli.net>, Johannes Berg <johannes.berg@intel.com>,
 ecryptfs@vger.kernel.org, Matthias Maennich <maennich@google.com>,
 dmaengine@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
 Thomas Gleixner <tglx@linutronix.de>, "Martin K.
 Petersen" <martin.petersen@oracle.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Harry Wei <harryxiyou@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>,
 Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Tue, 07 Apr 2020 13:46:23 +1000
Michael Ellerman <mpe@ellerman.id.au> escreveu:

> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
> > This small series address a regression caused by a new patch at
> > docs-next (and at linux-next).
> >

...

> > This solves almost all problems we have. Still, there are a few places
> > where we have two chapters at the same document with the
> > same name. The first patch addresses this problem.  
> 
> I'm still seeing a lot of warnings. Am I doing something wrong?
> 
> cheers
> 
> /linux/Documentation/powerpc/cxl.rst:406: WARNING: duplicate label powerpc/cxl:open, other instance in /linux/Documentation/powerpc/cxl.rst
...
> /linux/Documentation/powerpc/syscall64-abi.rst:86: WARNING: duplicate label powerpc/syscall64-abi:parameters and return value, other instance in /linux/Documentation/powerpc/syscall64-abi.rst
...
> /linux/Documentation/powerpc/ultravisor.rst:339: WARNING: duplicate label powerpc/ultravisor:syntax, other instance in /linux/Documentation/powerpc/ultravisor.rst
...

I can't reproduce your issue here at linux-next (+ my pending doc patches).

So, I can only provide you some hints.

If you see the logs you posted, all of them are related to duplicated
labels inside the same file.

-

The new Sphinx module we're using (sphinx.ext.autosectionlabel) generates
references for two levels, within the same document file (after this patch).


Looking at the first document (at linux-next version), it has:

1) A first level document title:

   Coherent Accelerator Interface (CXL)

2) Several second level titles:

   Introduction
   Hardware overview
   AFU Modes
   MMIO space
   Interrupts
   Work Element Descriptor (WED)
   User API
   Sysfs Class
   Udev rules

Right now, there's no duplication, but if someone adds, for example, 
another first-level or second-level title called "Interrupts", then 
the file will produce a duplicated label and Sphinx will warn.

The same would happen if someone adds another title (either first
level or second level) called "Coherent Accelerator Interface (CXL)",
as this will conflict with the document title.

-

Now, if the title "Coherent Accelerator Interface (CXL)" got removed,
then "Introduction".."Udev rules" will become first level titles.

Then, the sections at the "User API": "open", "ioctl"... will become
second level titles and it will produce lots of warnings.

-

That's said, IMHO, this document needs section titles for the two
sections under "User API". Adding it would allow removing the document
title. See enclosed.

Thanks,
Mauro

powerpc: docs: cxl.rst: mark two section titles as such

The User API chapter contains two sub-chapters. Mark them as
such.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>


diff --git a/Documentation/powerpc/cxl.rst b/Documentation/powerpc/cxl.rst
index 920546d81326..d2d77057610e 100644
--- a/Documentation/powerpc/cxl.rst
+++ b/Documentation/powerpc/cxl.rst
@@ -133,6 +133,7 @@ User API
 ========
 
 1. AFU character devices
+^^^^^^^^^^^^^^^^^^^^^^^^
 
     For AFUs operating in AFU directed mode, two character device
     files will be created. /dev/cxl/afu0.0m will correspond to a
@@ -395,6 +396,7 @@ read
 
 
 2. Card character device (powerVM guest only)
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
     In a powerVM guest, an extra character device is created for the
     card. The device is only used to write (flash) a new image on the

