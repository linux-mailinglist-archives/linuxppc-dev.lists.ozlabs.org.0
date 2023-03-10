Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F876B33C9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Mar 2023 02:46:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PXpn60Jybz3cjH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Mar 2023 12:46:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=B/Af4ewn;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=B/Af4ewn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=B/Af4ewn;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=B/Af4ewn;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PXpm90GWFz3bqw
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Mar 2023 12:45:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678412740;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RtJkfRI7AXY3SogCgOFRi4FhIfSeTbcT8pIq6VJrULQ=;
	b=B/Af4ewnqokc6nwChI1Xe5A1cuFraLw70Kh4hkHWdDUzhSXkvy2x7qG8jbc9MjVGrL9FDG
	5QYZ/o8XgVm97anqDOgPU+5XBLZmZMuPR7GDjobicTAAGt+rnqFGOY8SQVKlH4/6SPVvPq
	DOXShZxth2zlGq3GaPRB+qKCxBBSoG0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678412740;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RtJkfRI7AXY3SogCgOFRi4FhIfSeTbcT8pIq6VJrULQ=;
	b=B/Af4ewnqokc6nwChI1Xe5A1cuFraLw70Kh4hkHWdDUzhSXkvy2x7qG8jbc9MjVGrL9FDG
	5QYZ/o8XgVm97anqDOgPU+5XBLZmZMuPR7GDjobicTAAGt+rnqFGOY8SQVKlH4/6SPVvPq
	DOXShZxth2zlGq3GaPRB+qKCxBBSoG0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-86-woUwnrrKNFetIWSKVrCPTA-1; Thu, 09 Mar 2023 20:45:34 -0500
X-MC-Unique: woUwnrrKNFetIWSKVrCPTA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B7D531C0518D;
	Fri, 10 Mar 2023 01:45:33 +0000 (UTC)
Received: from localhost (ovpn-12-184.pek2.redhat.com [10.72.12.184])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BDB654010E36;
	Fri, 10 Mar 2023 01:45:32 +0000 (UTC)
Date: Fri, 10 Mar 2023 09:45:28 +0800
From: Baoquan He <bhe@redhat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: [PATCH v4 3/4] arch/*/io.h: remove ioremap_uc in some
 architectures
Message-ID: <ZAqLuNrPng9i0rZV@MiWiFi-R3L-srv>
References: <20230308130710.368085-1-bhe@redhat.com>
 <20230308130710.368085-4-bhe@redhat.com>
 <20230309143621.GA12350@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230309143621.GA12350@alpha.franken.de>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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
Cc: linux-arch@vger.kernel.org, linux-parisc@vger.kernel.org, arnd@arndb.de, linux-sh@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, hch@infradead.org, linux-mm@kvack.org, mcgrof@kernel.org, geert@linux-m68k.org, linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 03/09/23 at 03:36pm, Thomas Bogendoerfer wrote:
> On Wed, Mar 08, 2023 at 09:07:09PM +0800, Baoquan He wrote:
> > ioremap_uc() is only meaningful on old x86-32 systems with the PAT
> > extension, and on ia64 with its slightly unconventional ioremap()
> > behavior. So remove the ioremap_uc() definition in architecutures
> > other than x86 and ia64. These architectures all have asm-generic/io.h
> > included and will have the default ioremap_uc() definition which
> > returns NULL.
> > 
> > This changes the existing behaviour, while no need to worry about
> > any breakage because in the only callsite of ioremap_uc(), code
> > has been adjusted to eliminate the impact. Please see
> > atyfb_setup_generic() of drivers/video/fbdev/aty/atyfb_base.c.
> > 
> > If any new invocation of ioremap_uc() need be added, please consider
> > using ioremap() intead or adding a ARCH specific version if necessary.
> > 
> > Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > Signed-off-by: Baoquan He <bhe@redhat.com>
> > Cc: linux-alpha@vger.kernel.org
> > Cc: linux-hexagon@vger.kernel.org
> > Cc: linux-m68k@lists.linux-m68k.org
> > Cc: linux-mips@vger.kernel.org
> > Cc: linux-parisc@vger.kernel.org
> > Cc: linuxppc-dev@lists.ozlabs.org
> > Cc: linux-sh@vger.kernel.org
> > Cc: sparclinux@vger.kernel.org
> > ---
> >  Documentation/driver-api/device-io.rst | 9 +++++----
> >  arch/alpha/include/asm/io.h            | 1 -
> >  arch/hexagon/include/asm/io.h          | 3 ---
> >  arch/m68k/include/asm/kmap.h           | 1 -
> >  arch/mips/include/asm/io.h             | 1 -
> >  arch/parisc/include/asm/io.h           | 2 --
> >  arch/powerpc/include/asm/io.h          | 1 -
> >  arch/sh/include/asm/io.h               | 2 --
> >  arch/sparc/include/asm/io_64.h         | 1 -
> >  9 files changed, 5 insertions(+), 16 deletions(-)
> 
> this doesn't apply to v6.3-rc1... what tree is this based on ?

Sorry, I forgot mentioning this in cover letter. This series is
followup of below patchset, so it's on top of below patchset and based
on v6.3-rc1.

https://lore.kernel.org/all/20230301034247.136007-1-bhe@redhat.com/T/#u
[PATCH v5 00/17] mm: ioremap:  Convert architectures to take GENERIC_IOREMAP way

Thanks
Baoquan

