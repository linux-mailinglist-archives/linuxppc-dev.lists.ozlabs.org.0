Return-Path: <linuxppc-dev+bounces-4024-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB269EDDC3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2024 03:55:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y7xtK6mC2z2yjJ;
	Thu, 12 Dec 2024 13:55:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733972153;
	cv=none; b=gDRIV6+FNfJuj9fDvwb3r2zRXP0I3IaZ1nzAuyS7Zf83VS/BFOCXpHuvjiwnP9I5P1upE6D0HwD1p5Gj1IsVPbkHikqRAVCs9T522zewItycO+prE4mlW2F9Mb6wByiAE8Mb9rXDZ73Te21Pd4ZnZ+5ae5xIBFD8lZIWc0hnnqX24ByjjTnYsDeQNUfC0AFzbcYlFIQ22GFwJI4KbVRNipUs4teOQWWHsVYSpYxEXKTA7HbdMXTlZWb8WWIPjICWVU6j9gywaHP1oKI0/xFsKzpBGEZ4JrfeClnujyRcRqKlgz+FefVmc0eGc5qe+mG1AuGbsUzYlx4Vh4CRxnzedA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733972153; c=relaxed/relaxed;
	bh=h3bt3yLVk+LpBNVwqRgtTrNcwDAGMzslAPv9EpoWDR8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Imsq7nxJEE/OjB0qU6g7QJ+554aEM8Y4pFs73QcrOErX2I3FAYhmjwThCahpzOsnCFaVrHUPh0N4++zY/CGUZNk++os3paOknwiSHhba1+/GjksHeTWmQvV4+3/tsfAk8KbE7yn0D/ZYdflM/gprfhOH68l2HuoTqFgsw+puy4vjdT91GzgBVQgaeXvLaYwvnJEj2ZRaeUdZT3zg1niGlzAY3BEOP5QhCfCN6AXdwcocVSAxlF3CQ3iQNpALq2nLOdymmR9rlqrOWGvjsKR3BzGEdBBmzlSV/az+E2EXHru313ilztkGpNaPBGqiXeY6QSwYNriUM7MeZ23RmCA7Zw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UHhGUcge; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UHhGUcge; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UHhGUcge;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UHhGUcge;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y7xtJ4YKvz2xQC
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2024 13:55:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733972145;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=h3bt3yLVk+LpBNVwqRgtTrNcwDAGMzslAPv9EpoWDR8=;
	b=UHhGUcge80min/0+XE32ag3RUatIW3z+mGcjkwUNtAUI5huI+TPw1DYqLfdQMMsx1+zf5G
	29hLpW/xWZ8GX4hW9rz/YN94leaMvnmVUAU/wTrtIUj6xtAzgQDAJAUgnu2K8YRE3CJcQn
	rmMmmHNx6D9ZQyFkAWpgdT8ft+6WpWE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733972145;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=h3bt3yLVk+LpBNVwqRgtTrNcwDAGMzslAPv9EpoWDR8=;
	b=UHhGUcge80min/0+XE32ag3RUatIW3z+mGcjkwUNtAUI5huI+TPw1DYqLfdQMMsx1+zf5G
	29hLpW/xWZ8GX4hW9rz/YN94leaMvnmVUAU/wTrtIUj6xtAzgQDAJAUgnu2K8YRE3CJcQn
	rmMmmHNx6D9ZQyFkAWpgdT8ft+6WpWE=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-615-G1VQ4YhcN7Wjpbb7TucKnA-1; Wed,
 11 Dec 2024 21:55:39 -0500
X-MC-Unique: G1VQ4YhcN7Wjpbb7TucKnA-1
X-Mimecast-MFC-AGG-ID: G1VQ4YhcN7Wjpbb7TucKnA
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9B389195608C;
	Thu, 12 Dec 2024 02:55:37 +0000 (UTC)
Received: from localhost (unknown [10.72.112.3])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 17A191956048;
	Thu, 12 Dec 2024 02:55:34 +0000 (UTC)
Date: Thu, 12 Dec 2024 10:55:30 +0800
From: Baoquan he <bhe@redhat.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: ebiederm@xmission.com, Hari Bathini <hbathini@linux.ibm.com>,
	akpm@linux-foundation.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>, kexec@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kexec: Initialize ELF lowest address to ULONG_MAX
Message-ID: <Z1pQoh7IwtERIWe5@MiWiFi-R3L-srv>
References: <20241210091314.185785-1-sourabhjain@linux.ibm.com>
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
In-Reply-To: <20241210091314.185785-1-sourabhjain@linux.ibm.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 12/10/24 at 02:43pm, Sourabh Jain wrote:
> kexec_elf_load() loads an ELF executable and sets the address of the
> lowest PT_LOAD section to the address held by the lowest_load_addr
> function argument.
> 
> To determine the lowest PT_LOAD address, a local variable lowest_addr
> (type unsigned long) is initialized to UINT_MAX. After loading each
> PT_LOAD, its address is compared to lowest_addr. If a loaded PT_LOAD
> address is lower, lowest_addr is updated. However, setting lowest_addr
> to UINT_MAX won't work when the kernel image is loaded above 4G, as the
> returned lowest PT_LOAD address would be invalid. This is resolved by
> initializing lowest_addr to ULONG_MAX instead.
> 
> This issue was discovered while implementing crashkernel high/low
> reservation on the PowerPC architecture.
> 
> Fixes: a0458284f062 ("powerpc: Add support code for kexec_file_load()")
> Cc: Baoquan he <bhe@redhat.com>
> Cc: Hari Bathini <hbathini@linux.ibm.com>
> CC: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: kexec@lists.infradead.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> ---
>  kernel/kexec_elf.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/kexec_elf.c b/kernel/kexec_elf.c
> index d3689632e8b9..3a5c25b2adc9 100644
> --- a/kernel/kexec_elf.c
> +++ b/kernel/kexec_elf.c
> @@ -390,7 +390,7 @@ int kexec_elf_load(struct kimage *image, struct elfhdr *ehdr,
>  			 struct kexec_buf *kbuf,
>  			 unsigned long *lowest_load_addr)
>  {
> -	unsigned long lowest_addr = UINT_MAX;
> +	unsigned long lowest_addr = ULONG_MAX;

Great catch.

Acked-by: Baoquan He <bhe@redhat.com>

>  	int ret;
>  	size_t i;
>  
> -- 
> 2.47.1
> 


