Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E47686AFA0B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Mar 2023 00:04:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PWWHY67lFz3f4M
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Mar 2023 10:04:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=jd8aTUGQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=jd8aTUGQ;
	dkim-atps=neutral
Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PWWGg2Jw7z3bYw
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Mar 2023 10:04:11 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 44D1037E2EEB25;
	Tue,  7 Mar 2023 17:04:09 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id IlPjxeNIrp4J; Tue,  7 Mar 2023 17:04:08 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 915FC37E2EEB22;
	Tue,  7 Mar 2023 17:04:08 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 915FC37E2EEB22
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1678230248; bh=iMYGSf2afoxLHQ3zrDyYQkr9xwmllgL4UkjuYFF5aHE=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=jd8aTUGQGabGJlDJwbDhloBY950yxY0mwlqcYOcVw/JMLWTI3pTINfQVLdA8Hl3qa
	 Rdp8BktaIlAjX19jrvVA1QzJt3V6nY5HOWwBb+4/m3tNWjxwcIyoq9TGIUGhWdTNvH
	 Oj/U6BKUEJWdTPKSF9OvW3l282FRDwoFSoIc6yZM=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id qWk48AVCWoEv; Tue,  7 Mar 2023 17:04:08 -0600 (CST)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 71EBD37E2EEB1F;
	Tue,  7 Mar 2023 17:04:08 -0600 (CST)
Date: Tue, 7 Mar 2023 17:04:08 -0600 (CST)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Alex Williamson <alex.williamson@redhat.com>
Message-ID: <2041059418.17313605.1678230248429.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <20230306175941.1b69bb14.alex.williamson@redhat.com>
References: <8398361.16996856.1678123793664.JavaMail.zimbra@raptorengineeringinc.com> <20230306164607.1455ee81.alex.williamson@redhat.com> <1817332573.17073558.1678149322645.JavaMail.zimbra@raptorengineeringinc.com> <20230306175941.1b69bb14.alex.williamson@redhat.com>
Subject: Re: [PATCH v2 0/4] Reenable VFIO support on POWER systems
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC111 (Linux)/8.5.0_GA_3042)
Thread-Topic: Reenable VFIO support on POWER systems
Thread-Index: AqxVp3QA/h1l1cNNA2UA4xRRSqM9KQ==
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, kvm <kvm@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



----- Original Message -----
> From: "Alex Williamson" <alex.williamson@redhat.com>
> To: "Timothy Pearson" <tpearson@raptorengineering.com>
> Cc: "kvm" <kvm@vger.kernel.org>, "linuxppc-dev" <linuxppc-dev@lists.ozlabs.org>
> Sent: Monday, March 6, 2023 6:59:41 PM
> Subject: Re: [PATCH v2 0/4] Reenable VFIO support on POWER systems

> On Mon, 6 Mar 2023 18:35:22 -0600 (CST)
> Timothy Pearson <tpearson@raptorengineering.com> wrote:
> 
>> ----- Original Message -----
>> > From: "Alex Williamson" <alex.williamson@redhat.com>
>> > To: "Timothy Pearson" <tpearson@raptorengineering.com>
>> > Cc: "kvm" <kvm@vger.kernel.org>, "linuxppc-dev" <linuxppc-dev@lists.ozlabs.org>
>> > Sent: Monday, March 6, 2023 5:46:07 PM
>> > Subject: Re: [PATCH v2 0/4] Reenable VFIO support on POWER systems
>> 
>> > On Mon, 6 Mar 2023 11:29:53 -0600 (CST)
>> > Timothy Pearson <tpearson@raptorengineering.com> wrote:
>> >   
>> >> This patch series reenables VFIO support on POWER systems.  It
>> >> is based on Alexey Kardashevskiys's patch series, rebased and
>> >> successfully tested under QEMU with a Marvell PCIe SATA controller
>> >> on a POWER9 Blackbird host.
>> >> 
>> >> Alexey Kardashevskiy (3):
>> >>   powerpc/iommu: Add "borrowing" iommu_table_group_ops
>> >>   powerpc/pci_64: Init pcibios subsys a bit later
>> >>   powerpc/iommu: Add iommu_ops to report capabilities and allow blocking
>> >>     domains
>> >> 
>> >> Timothy Pearson (1):
>> >>   Add myself to MAINTAINERS for Power VFIO support
>> >> 
>> >>  MAINTAINERS                               |   5 +
>> >>  arch/powerpc/include/asm/iommu.h          |   6 +-
>> >>  arch/powerpc/include/asm/pci-bridge.h     |   7 +
>> >>  arch/powerpc/kernel/iommu.c               | 246 +++++++++++++++++++++-
>> >>  arch/powerpc/kernel/pci_64.c              |   2 +-
>> >>  arch/powerpc/platforms/powernv/pci-ioda.c |  36 +++-
>> >>  arch/powerpc/platforms/pseries/iommu.c    |  27 +++
>> >>  arch/powerpc/platforms/pseries/pseries.h  |   4 +
>> >>  arch/powerpc/platforms/pseries/setup.c    |   3 +
>> >>  drivers/vfio/vfio_iommu_spapr_tce.c       |  96 ++-------
>> >>  10 files changed, 338 insertions(+), 94 deletions(-)
>> >>   
>> > 
>> > For vfio and MAINTAINERS portions,
>> > 
>> > Acked-by: Alex Williamson <alex.williamson@redhat.com>
>> > 
>> > I'll note though that spapr_tce_take_ownership() looks like it copied a
>> > bug from the old tce_iommu_take_ownership() where tbl and tbl->it_map
>> > are tested before calling iommu_take_ownership() but not in the unwind
>> > loop, ie. tables we might have skipped on setup are unconditionally
>> > released on unwind.  Thanks,
>> > 
>> > Alex
>> 
>> Thanks for that.  I'll put together a patch to get rid of that
>> potential bug that can be applied after this series is merged, unless
>> you'd rather I resubmit a v3 with the issue fixed?
> 
> Follow-up fix is fine by me.  Thanks,
> 
> Alex

Just sent that patch in.  Thanks!
