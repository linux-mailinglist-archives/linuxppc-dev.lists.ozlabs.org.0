Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E204881228
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Mar 2024 14:15:21 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=D/gA7OYX;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=D/gA7OYX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V08GG6Jltz3dV7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Mar 2024 00:15:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=D/gA7OYX;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=D/gA7OYX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V08FX22S8z2xQ7
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Mar 2024 00:14:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710940476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ey4AOs9r3AsCA3ihOFSnMBOT4qisnZYJ1SOYp7h6Xf8=;
	b=D/gA7OYX9pZSmiQqYS+cVZ1Ryy57f9q/3RbIIz8IIVp4PNiXHMqKNQvmyEy6eIxpenDDlT
	854mnerjmygEvJfLH9RYPUzCiDW4dG3ZZqFfH4mdyLqaTfIa/j09TtdqvVefGjfnPn44Lf
	liP1h5k8H1kFwZe19+8sBtjI0Dhg1b4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710940476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ey4AOs9r3AsCA3ihOFSnMBOT4qisnZYJ1SOYp7h6Xf8=;
	b=D/gA7OYX9pZSmiQqYS+cVZ1Ryy57f9q/3RbIIz8IIVp4PNiXHMqKNQvmyEy6eIxpenDDlT
	854mnerjmygEvJfLH9RYPUzCiDW4dG3ZZqFfH4mdyLqaTfIa/j09TtdqvVefGjfnPn44Lf
	liP1h5k8H1kFwZe19+8sBtjI0Dhg1b4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-482-BG7UvSxVMe6KR0RfzBnoGg-1; Wed, 20 Mar 2024 09:14:32 -0400
X-MC-Unique: BG7UvSxVMe6KR0RfzBnoGg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F0615868658;
	Wed, 20 Mar 2024 13:14:31 +0000 (UTC)
Received: from localhost (unknown [10.72.116.12])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E69040C6DB7;
	Wed, 20 Mar 2024 13:14:29 +0000 (UTC)
Date: Wed, 20 Mar 2024 21:14:00 +0800
From: Baoquan He <bhe@redhat.com>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH 2/6] x86: remove memblock_find_dma_reserve()
Message-ID: <ZfrhGANU2gxE5+9c@MiWiFi-R3L-srv>
References: <20240318142138.783350-1-bhe@redhat.com>
 <20240318142138.783350-3-bhe@redhat.com>
 <Zfmz_1sbbvSWMj9C@kernel.org>
 <ZfqV1IEo3+cf9f9I@MiWiFi-R3L-srv>
 <ZfquM06LOZB4vddu@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZfquM06LOZB4vddu@kernel.org>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
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
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, x86@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 03/20/24 at 11:36am, Mike Rapoport wrote:
> On Wed, Mar 20, 2024 at 03:52:52PM +0800, Baoquan He wrote:
> > On 03/19/24 at 05:49pm, Mike Rapoport wrote:
> > > Hi Baoquan,
> > > 
> > > On Mon, Mar 18, 2024 at 10:21:34PM +0800, Baoquan He wrote:
> > > > This is not needed any more.
> > > 
> > > I'd swap this and the first patch, so that the first patch would remove
> > > memblock_find_dma_reserve() and it's changelog will explain why it's not
> > > needed and then the second patch will simply drop unused set_dma_reserve()
> > 
> > Thanks, Mike.
> > 
> > My thought on the patch 1/2 splitting is:
> > patch 1 is removing all relevant codes in mm, including the usage of
> > dma_reserve in free_area_init_core() and exporting set_dma_reserve()
> > to any ARCH which want to subtract the dma_reserve from DMA zone.
> >
> > Patch 2 purely remove the code in x86 ARCH about how to get dma_reserve.
>  
> I think it's better first to remove the usage of set_dma_reserve() in x86
> and then clean up the unused code.

OK, firslty remove the only user, that sounds reasonable. Will change.
Thanks.

