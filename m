Return-Path: <linuxppc-dev+bounces-13424-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E69E5C131EC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Oct 2025 07:24:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cwgM10bPhz3fq4;
	Tue, 28 Oct 2025 17:24:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761632652;
	cv=none; b=CoYe10r605Hqxky7woDV/g6MyTWIQ0+lJCMKJ415TcphINgipkV4dgWueZxBKo3lhwa9pWinRqJy0G4XhOnbNEBvy3qijVtJ31AhBQKK1XuXI3WSNqZxZwRXkuuKsWH8w0nDZ2Q6c9d0R96G08JDfY/fRUDNTcxoYFys4lFbXyIUOULqbFW3oa2zq+lsDb2e8snQhrUbs0YI+oBKv5GK/UdXOX/qDApmzUwnegJI1h2cMOp1+hTsW5VAnbPvsrLCvlJK9JaftrccgMLDZXEJka/8cbsOYPUoHCVEF/qd/wTu75YmAU/xBL5Zl2Ft3+6YkJdHVqBIn5oNe4ku+x/AnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761632652; c=relaxed/relaxed;
	bh=zuGj1hW8mWz3shIq2GZWCMOifU7nzT6tSAo/1NZESWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=dHaxiXsae9VakmVJqPWwXKP2vUmC33Sb+ESS9vbPsiO7yEM4snQ15xLzyO0iVt5TVZDM/Iu2WcrWOMZKAUYXvzFNbVldF8nmdHzqla+pZ3r9ZN3otZHqcgHGRuK5V2QgBosNR4S4GuHAoUqZe6E3WRTC7Lviy/cFMheI10YMAbsVyDHwM7xtOfFFO/dmDjOzBlrAnt74X+kFI5bZepeLwBHTKM4vJ4Gmj+aRTMpeLjBmwvwkYqDkHeeMlK/3mrRCa2yQL5al60YW8ZcWM0KagK7TBEflwIVZc6WUAUDiMTNLDWLfsqa4e6u+mz4C+J/VfBdgIn/samKy9J9LLBxkSQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Hmb/wLCG; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Hmb/wLCG; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Hmb/wLCG;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Hmb/wLCG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cwgLz5RbMz3fpM
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Oct 2025 17:24:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761632646;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zuGj1hW8mWz3shIq2GZWCMOifU7nzT6tSAo/1NZESWI=;
	b=Hmb/wLCGq57lgunDVeVTlDfJXEeNIh7muITC63uOH9YbnA4/NKrTSt7/60hnRw/ijuNQmD
	TC4v7QQumky67Z8IjR/3/BNEWesOUDkVAOQvYYVvWDLC1w/LxNRoLt7/7fkOKhGD0sicAz
	iXASY/9adMTbvgxdxIMyB+ku7oRhfK0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761632646;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zuGj1hW8mWz3shIq2GZWCMOifU7nzT6tSAo/1NZESWI=;
	b=Hmb/wLCGq57lgunDVeVTlDfJXEeNIh7muITC63uOH9YbnA4/NKrTSt7/60hnRw/ijuNQmD
	TC4v7QQumky67Z8IjR/3/BNEWesOUDkVAOQvYYVvWDLC1w/LxNRoLt7/7fkOKhGD0sicAz
	iXASY/9adMTbvgxdxIMyB+ku7oRhfK0=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-265-92njuEYVOgKUgJEjxNPoCA-1; Tue,
 28 Oct 2025 02:24:03 -0400
X-MC-Unique: 92njuEYVOgKUgJEjxNPoCA-1
X-Mimecast-MFC-AGG-ID: 92njuEYVOgKUgJEjxNPoCA_1761632641
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9EEE81956080;
	Tue, 28 Oct 2025 06:24:00 +0000 (UTC)
Received: from localhost (unknown [10.72.112.212])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6C6FA1800353;
	Tue, 28 Oct 2025 06:23:58 +0000 (UTC)
Date: Tue, 28 Oct 2025 14:23:53 +0800
From: Baoquan he <bhe@redhat.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>, kexec@lists.infradead.org
Cc: linuxppc-dev@lists.ozlabs.org, Hari Bathini <hbathini@linux.ibm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mahesh Salgaonkar <mahesh@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shivang Upadhyay <shivangu@linux.ibm.com>
Subject: Re: [PATCH 0/4] powerpc/kdump: Support high crashkernel reservation
Message-ID: <aQBheTeMycPuDHJ+@MiWiFi-R3L-srv>
References: <20251027151338.819957-1-sourabhjain@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20251027151338.819957-1-sourabhjain@linux.ibm.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Rqmbx65AD74GefaacW59rF15vAtC8IN3GwHKUufRN4Q_1761632641
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Cc kexec mailing list.

On 10/27/25 at 08:43pm, Sourabh Jain wrote:
> Add support for reserving crashkernel memory in higher address ranges
> using the crashkernel=xxM,high command-line option.
> 
> With this feature, most of the crashkernel memory for kdump will be
> reserved in high memory regions, while only a small portion (64 MB) will
> be reserved in low memory for the kdump kernel. This helps free up low
> memory for other components that require allocations in that region.
> 
> For example, if crashkernel=2G,high is specified, the kernel will reserve
> 2 GB of crashkernel memory near the end of system RAM and an additional
> 64 MB of low memory (below 1 GB) for RTAS to function properly.
> 
> Currently, this feature is supported only on PPC64 systems with 64-bit
> RTAS instantiation and Radix MMU enabled.
> 
> Two critical changes were made to support this feature:
> 
>  - CPU feature discovery is now performed before crashkernel
>    reservation. This ensures the MMU type is determined before reserving
>    crashkernel memory. (Patch 01/04)
> 
>  - RTAS instantiation has been moved to 64-bit mode. (Patch 02/04)
> 
> Apply the following patch first, and then apply this patch series:
> https://lore.kernel.org/all/20251024170118.297472-1-sourabhjain@linux.ibm.com/
> 
> Cc: Baoquan he <bhe@redhat.com>
> Cc: Hari Bathini <hbathini@linux.ibm.com>
> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> Cc: Shivang Upadhyay <shivangu@linux.ibm.com>
> 
> Sourabh Jain (4):
>   powerpc/mmu: do MMU type discovery before crashkernel reservation
>   powerpc: move to 64-bit RTAS
>   powerpc/kdump: consider high crashkernel memory if enabled
>   powerpc/kdump: add support for high crashkernel reservation
> 
>  arch/powerpc/include/asm/book3s/64/mmu.h |  1 +
>  arch/powerpc/include/asm/crash_reserve.h |  8 +++++
>  arch/powerpc/include/asm/kexec.h         |  1 +
>  arch/powerpc/include/asm/mmu.h           |  1 +
>  arch/powerpc/include/asm/rtas.h          | 11 ++++++
>  arch/powerpc/kernel/prom.c               | 28 ++++++++-------
>  arch/powerpc/kernel/prom_init.c          | 26 +++++++++++---
>  arch/powerpc/kernel/rtas.c               |  5 +++
>  arch/powerpc/kernel/rtas_entry.S         | 17 ++++++++-
>  arch/powerpc/kexec/core.c                | 45 +++++++++++++++++-------
>  arch/powerpc/kexec/elf_64.c              | 10 ++++--
>  arch/powerpc/kexec/file_load_64.c        |  5 +--
>  arch/powerpc/kexec/ranges.c              | 24 +++++++++++--
>  arch/powerpc/mm/init_64.c                | 27 ++++++++------
>  14 files changed, 161 insertions(+), 48 deletions(-)
> 
> -- 
> 2.51.0
> 


