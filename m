Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F83E46BE8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2019 23:32:16 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45QYj86xn4zDrgr
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jun 2019 07:32:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="D/zHigl6"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45QYgK4rf2zDr4D
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Jun 2019 07:30:37 +1000 (AEST)
Received: from localhost (unknown [69.71.4.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7E908206BB;
 Fri, 14 Jun 2019 21:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560547834;
 bh=ZxDW8K6J+radmhN5Vs7dffyGWwY56OXzv8PYXR/lauo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=D/zHigl6AEHgfKDfYaQUw48nJ0lJIJi63bv2MJ+d8wmz+4j43FfzZUkMaIGPzY7VV
 n+W7xyxXoFe8ifSY15/YHLd5tqvHKjYOYq243asXrG4VkaF+IKjYq4SNTJiVqGGVD3
 isDi+ABOK/k1Q25bBsPQ+LT1tqvlis8g776GBz60=
Date: Fri, 14 Jun 2019 16:30:33 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v4 19/28] docs: powerpc: convert docs to ReST and rename
 to *.rst
Message-ID: <20190614213033.GV13533@google.com>
References: <cover.1560361364.git.mchehab+samsung@kernel.org>
 <63560c1ee7174952e148a353840a17969fe0be2d.1560361364.git.mchehab+samsung@kernel.org>
 <20190614143635.3aff154d@lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190614143635.3aff154d@lwn.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-pci@vger.kernel.org, Oliver O'Halloran <oohall@gmail.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Qiang Zhao <qiang.zhao@nxp.com>, linux-scsi@vger.kernel.org,
 Jiri Slaby <jslaby@suse.com>, Linas Vepstas <linasvepstas@gmail.com>,
 Andrew Donnellan <ajd@linux.ibm.com>,
 Mauro Carvalho Chehab <mchehab@infradead.org>,
 "Manoj N. Kumar" <manoj@linux.ibm.com>, linux-arm-kernel@lists.infradead.org,
 "Matthew R. Ochs" <mrochs@linux.ibm.com>, Uma Krishnan <ukrishn@linux.ibm.com>,
 Sam Bobroff <sbobroff@linux.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Li Yang <leoyang.li@nxp.com>, Andrew Donnellan <andrew.donnellan@au1.ibm.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 14, 2019 at 02:36:35PM -0600, Jonathan Corbet wrote:
> On Wed, 12 Jun 2019 14:52:55 -0300
> Mauro Carvalho Chehab <mchehab+samsung@kernel.org> wrote:
> 
> > Convert docs to ReST and add them to the arch-specific
> > book.
> > 
> > The conversion here was trivial, as almost every file there
> > was already using an elegant format close to ReST standard.
> > 
> > The changes were mostly to mark literal blocks and add a few
> > missing section title identifiers.
> > 
> > One note with regards to "--": on Sphinx, this can't be used
> > to identify a list, as it will format it badly. This can be
> > used, however, to identify a long hyphen - and "---" is an
> > even longer one.
> > 
> > At its new index.rst, let's add a :orphan: while this is not linked to
> > the main index.rst file, in order to avoid build warnings.
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> > Acked-by: Andrew Donnellan <andrew.donnellan@au1.ibm.com> # cxl
> 
> This one fails to apply because ...
> 
> [...]
> 
> > diff --git a/Documentation/PCI/pci-error-recovery.rst b/Documentation/PCI/pci-error-recovery.rst
> > index 83db42092935..acc21ecca322 100644
> > --- a/Documentation/PCI/pci-error-recovery.rst
> > +++ b/Documentation/PCI/pci-error-recovery.rst
> > @@ -403,7 +403,7 @@ That is, the recovery API only requires that:
> >  .. note::
> >  
> >     Implementation details for the powerpc platform are discussed in
> > -   the file Documentation/powerpc/eeh-pci-error-recovery.txt
> > +   the file Documentation/powerpc/eeh-pci-error-recovery.rst
> >  
> >     As of this writing, there is a growing list of device drivers with
> >     patches implementing error recovery. Not all of these patches are in
> > @@ -422,3 +422,24 @@ That is, the recovery API only requires that:
> >     - drivers/net/cxgb3
> >     - drivers/net/s2io.c
> >     - drivers/net/qlge
> > +
> > +>>> As of this writing, there is a growing list of device drivers with
> > +>>> patches implementing error recovery. Not all of these patches are in
> > +>>> mainline yet. These may be used as "examples":
> > +>>>
> > +>>> drivers/scsi/ipr
> > +>>> drivers/scsi/sym53c8xx_2
> > +>>> drivers/scsi/qla2xxx
> > +>>> drivers/scsi/lpfc
> > +>>> drivers/next/bnx2.c
> > +>>> drivers/next/e100.c
> > +>>> drivers/net/e1000
> > +>>> drivers/net/e1000e
> > +>>> drivers/net/ixgb
> > +>>> drivers/net/ixgbe
> > +>>> drivers/net/cxgb3
> > +>>> drivers/net/s2io.c
> > +>>> drivers/net/qlge  
> 
> ...of this, which has the look of a set of conflict markers that managed
> to get committed...?

I don't see these conflict markers in my local branch or in
linux-next (next-20190614).

Let me know if I need to do something.

Bjorn
