Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 71BF2153E60
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Feb 2020 06:53:08 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Cnf94fbszDqW4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Feb 2020 16:53:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::341;
 helo=mail-ot1-x341.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=xqhYbXKD; dkim-atps=neutral
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48CncZ2G4bzDqVc
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Feb 2020 16:51:40 +1100 (AEDT)
Received: by mail-ot1-x341.google.com with SMTP id r27so4387949otc.8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Feb 2020 21:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5g0ucY/9ZUFtix2XnQy2cuPMuPVQiShNOwSgn0I8OBU=;
 b=xqhYbXKDufyJWDOQlr2Ba/YbuGJTDJ2ziwxMsioPHK8lJUB4/CAxrEL+moRSD8vyrb
 P8EqSdqAMegqk31UKFdftPK5/+cmDLrCM6ly22OIyg6gsdd2R7ZLPjw9pcUJ/q5RR0G5
 fLmVfaMcawk1UE/23D6St4s/a6I9mTLo3F5jajstpw7oCE/fYrfhTRbXrLuPqW2SHJPy
 AJ5z5DEgvFpoMlwxgzPfG0OUuAZs64RZ1jdy1x38BTGcFFSZZlvzqoHwnS5WYlKlxHrT
 S4P0VJvg0zJv7zvW0pAdwx8kw9JZ9LQMIqF1abVjF4Dd0TKDl4DBYq5Lc7iYYQ8GUTiR
 SyXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5g0ucY/9ZUFtix2XnQy2cuPMuPVQiShNOwSgn0I8OBU=;
 b=DS1PvmX1t36N80aKKJ9K1jCSj4cp4mvCjAFQsIjZ/5qyQS3FEluGT4/lN0PeiavhoI
 1HI4yTxVfNSomuwrecLm05y4WDm1u+esIgeBFr956kb/Od3bWN0xaygLKtfN8JMWKwiJ
 qf/NWHV/foAJPUivK4V2C6MpAmicY7uV2MsEbEuhKpSQrX4Xomt/yt0s+SD0H+EK02j3
 z55h57aK15pTxPcyx0seADrxpJKxKdcOgALvdSKO6bpOQkCPTM6RrwjrIJiSXNGmXMcw
 wNOq4AjiGMnMPpkKH9aQQb+AjjbKl6jQm63uOfkY8yhV1LzGbaSBKylXGbtx4TunOtvy
 X9cQ==
X-Gm-Message-State: APjAAAXDVy50Wki1gGsEMNZzmpkgRk9bCPr9RVmR6qpSjkKs8v2FQvuq
 AvlNP64Atha9YJHz33rPdxUowYaUxN6pTrAWwncANw==
X-Google-Smtp-Source: APXvYqypAdFCvnslXe/NRqIbZavieNDLc3RQJ1uJD67YGnwibNCmUiqPR2pnxgssN+GhWMlzNTosjpJpU37+bWuZVfs=
X-Received: by 2002:a9d:64d8:: with SMTP id n24mr27237824otl.71.1580968298443; 
 Wed, 05 Feb 2020 21:51:38 -0800 (PST)
MIME-Version: 1.0
References: <158041475480.3889308.655103391935006598.stgit@dwillia2-desk3.amr.corp.intel.com>
 <158041476763.3889308.13149849631980018039.stgit@dwillia2-desk3.amr.corp.intel.com>
 <875zgl3fa9.fsf@mpe.ellerman.id.au>
In-Reply-To: <875zgl3fa9.fsf@mpe.ellerman.id.au>
From: Dan Williams <dan.j.williams@intel.com>
Date: Wed, 5 Feb 2020 21:51:27 -0800
Message-ID: <CAPcyv4jVHnJbPYp1gqDnuwtEgt1NNHDt72vby7hK5dP43C+s8Q@mail.gmail.com>
Subject: Re: [PATCH 2/5] mm/memremap_pages: Introduce memremap_compat_align()
To: Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-nvdimm <linux-nvdimm@lists.01.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jeff Moyer <jmoyer@redhat.com>, Paul Mackerras <paulus@samba.org>,
 Vishal L Verma <vishal.l.verma@intel.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 4, 2020 at 7:05 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Dan Williams <dan.j.williams@intel.com> writes:
> > The "sub-section memory hotplug" facility allows memremap_pages() users
> > like libnvdimm to compensate for hardware platforms like x86 that have a
> > section size larger than their hardware memory mapping granularity.  The
> > compensation that sub-section support affords is being tolerant of
> > physical memory resources shifting by units smaller (64MiB on x86) than
> > the memory-hotplug section size (128 MiB). Where the platform
> > physical-memory mapping granularity is limited by the number and
> > capability of address-decode-registers in the memory controller.
> >
> > While the sub-section support allows memremap_pages() to operate on
> > sub-section (2MiB) granularity, the Power architecture may still
> > require 16MiB alignment on "!radix_enabled()" platforms.
> >
> > In order for libnvdimm to be able to detect and manage this per-arch
> > limitation, introduce memremap_compat_align() as a common minimum
> > alignment across all driver-facing memory-mapping interfaces, and let
> > Power override it to 16MiB in the "!radix_enabled()" case.
> >
> > The assumption / requirement for 16MiB to be a viable
> > memremap_compat_align() value is that Power does not have platforms
> > where its equivalent of address-decode-registers never hardware remaps a
> > persistent memory resource on smaller than 16MiB boundaries.
> >
> > Based on an initial patch by Aneesh.
> >
> > Link: http://lore.kernel.org/r/CAPcyv4gBGNP95APYaBcsocEa50tQj9b5h__83vgngjq3ouGX_Q@mail.gmail.com
> > Reported-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> > Reported-by: Jeff Moyer <jmoyer@redhat.com>
> > Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> > Cc: Paul Mackerras <paulus@samba.org>
> > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > Signed-off-by: Dan Williams <dan.j.williams@intel.com>
> > ---
> >  arch/powerpc/include/asm/io.h |   10 ++++++++++
> >  drivers/nvdimm/pfn_devs.c     |    2 +-
> >  include/linux/io.h            |   23 +++++++++++++++++++++++
> >  include/linux/mmzone.h        |    1 +
> >  4 files changed, 35 insertions(+), 1 deletion(-)
>
> The powerpc change here looks fine to me.
>
> Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

Thanks Michael, unfortunately the kbuild robot just woke up and said
that mips does not like including mmzone.h from io.h. The
entanglements look intractable.

Is there a file I can stash a strong definition of
memremap_compat_align(), maybe arch/powerpc/mm/mem.c? Then I can put a
generic __weak definition in mm/memremap.c rather than play header
file include games.
