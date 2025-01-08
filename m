Return-Path: <linuxppc-dev+bounces-4842-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C94FA05993
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2025 12:25:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSlvz0L15z30P3;
	Wed,  8 Jan 2025 22:25:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736335534;
	cv=none; b=M4dvOGiZlOhVrZoX1nU3lUJzg9vFAUbpztdLOVXNQvLePH8t9IAmd2Z7tQ86OPpwqAR0i7SOeewy8Ur0hdQb8COejr4tkM5ebw3/hS6iNFw1rZzWx1oTEa2DeyHuY6By5mwZ3xWlJIY5QUML5DNXCukNpHuFJaSAMVKOtjCw1xLBv5Q3Z0dq5n3ePnUUJfiM3KqaZRvR6Cs4U5umnOUs2KIF+NEeG+sDw4H1GdppWT+uTAzJHv4yx+RDran2YnVXbjy4IdvXGW7ZguYepvFxwL/v9Ryx/Qe3En7VMBlPneEz000GiG0Degz3g67M2dz6nWUnMmAxE5C2lSc24oCFrw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736335534; c=relaxed/relaxed;
	bh=3oLpbTsd6NEyHY2cucU9ZqZfMt3d6F1y8ObsntY47Ys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XpOAAMm2XSafCdolUB1vu7z+e6IjR+ILG2aVk3Cg0Knv4PQgccVZW2ASISCksgxSEBZnKR2AcSW/6EWFvqhCGG+So/VoKi9RuW2LxYokc2yvd/I8PGzw8CqGnqkqys8K41wanqegTUyk87JyL76GMSDKxBTi5VBu+zgbRw9KWlkccsgK0R8OJHkINO5lp8iN2qJobLX/chOJ9zzsUy57A6EtBuryPEbflZ291h0XW3d6Se0ZdU4lSyd/Oeuu4jwskyxFkQnOgCiNj/nKRDBBYqk1FxFyuCinDWDKe7pXmF7aAjKOwv8tHj9brdI3iI7V2dUElOod4QC6afTmTZ2GOQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=S5LvOwHS; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=S5LvOwHS; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=S5LvOwHS;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=S5LvOwHS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YSlvx3VCzz305v
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jan 2025 22:25:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736335529;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3oLpbTsd6NEyHY2cucU9ZqZfMt3d6F1y8ObsntY47Ys=;
	b=S5LvOwHSqM0kUvrRHqUr6543taGCVZ633QevaYhmVgBGb+7pa0hBz/Iv5ms4kJ4epB3xqS
	hqx9HVqcbcOn4S9loTPENyej2ehog4a63/XBVgamjQVbPLC4mKEE4nH4vJMTzZ0gBMAK8W
	y64fuCiZ/b07uoH6pyYIp+/ETYxlfF0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736335529;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3oLpbTsd6NEyHY2cucU9ZqZfMt3d6F1y8ObsntY47Ys=;
	b=S5LvOwHSqM0kUvrRHqUr6543taGCVZ633QevaYhmVgBGb+7pa0hBz/Iv5ms4kJ4epB3xqS
	hqx9HVqcbcOn4S9loTPENyej2ehog4a63/XBVgamjQVbPLC4mKEE4nH4vJMTzZ0gBMAK8W
	y64fuCiZ/b07uoH6pyYIp+/ETYxlfF0=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-91-DaA2zA7kN2O5kv6i9Gj8QA-1; Wed,
 08 Jan 2025 06:25:24 -0500
X-MC-Unique: DaA2zA7kN2O5kv6i9Gj8QA-1
X-Mimecast-MFC-AGG-ID: DaA2zA7kN2O5kv6i9Gj8QA
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6C71F19560BD;
	Wed,  8 Jan 2025 11:25:22 +0000 (UTC)
Received: from localhost (unknown [10.72.112.99])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B1A53300018D;
	Wed,  8 Jan 2025 11:25:20 +0000 (UTC)
Date: Wed, 8 Jan 2025 19:25:16 +0800
From: Baoquan he <bhe@redhat.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Hari Bathini <hbathini@linux.ibm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>, kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v1 2/5] crash: let arch decide crash memory export
 to iomem_resource
Message-ID: <Z35gnO2N/LFt1E7E@MiWiFi-R3L-srv>
References: <20250108101458.406806-1-sourabhjain@linux.ibm.com>
 <20250108101458.406806-3-sourabhjain@linux.ibm.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108101458.406806-3-sourabhjain@linux.ibm.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi,

On 01/08/25 at 03:44pm, Sourabh Jain wrote:
> insert_crashkernel_resources() adds crash memory to iomem_resource if
> generic crashkernel reservation is enabled on an architecture.
> 
> On PowerPC, system RAM is added to iomem_resource. See commit
> c40dd2f766440 ("powerpc: Add System RAM to /proc/iomem").
> 
> Enabling generic crashkernel reservation on PowerPC leads to a conflict
> when system RAM is added to iomem_resource because a part of the system
> RAM, the crashkernel memory, has already been added to iomem_resource.
> 
> The next commit in the series "powerpc/crash: use generic crashkernel
> reservation" enables generic crashkernel reservation on PowerPC. If the
> crashkernel is added to iomem_resource, the kernel fails to add
> system RAM to /proc/iomem and prints the following traces:
> 
> CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.13.0-rc2+
> snip...
> NIP [c000000002016b3c] add_system_ram_resources+0xf0/0x15c
> LR [c000000002016b34] add_system_ram_resources+0xe8/0x15c
> Call Trace:
> [c00000000484bbc0] [c000000002016b34] add_system_ram_resources+0xe8/0x15c
> [c00000000484bc20] [c000000000010a4c] do_one_initcall+0x7c/0x39c
> [c00000000484bd00] [c000000002005418] do_initcalls+0x144/0x18c
> [c00000000484bd90] [c000000002005714] kernel_init_freeable+0x21c/0x290
> [c00000000484bdf0] [c0000000000110f4] kernel_init+0x2c/0x1b8
> [c00000000484be50] [c00000000000dd3c] ret_from_kernel_user_thread+0x14/0x1c
> 
> To avoid this, an architecture hook is added in
> insert_crashkernel_resources(), allowing the architecture to decide
> whether crashkernel memory should be added to iomem_resource.

Have you tried defining HAVE_ARCH_ADD_CRASH_RES_TO_IOMEM_EARLY in ppc to
add crashkernel region to iomem early? Now there are two branches in the
existing code, adding a hook will make three ways.


