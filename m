Return-Path: <linuxppc-dev+bounces-15806-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C56AD23ADB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jan 2026 10:46:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dsJ5L34k9z309N;
	Thu, 15 Jan 2026 20:45:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:203:375::bc"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768470358;
	cv=none; b=BrX/H8Xl1cS1RhlyHD0Yst0YaF3jE0HVOncu1l+2vMhTX+rvne84lLNKkkZpRp0szdAhtkqN2iKDYlTMw304fqqN5/LMy0rC6CnLzajDovXjd0hyYxZl4iQrj/wUfCjCOs/ULpyUg7eco4hAf/jpgCn6IEEgkig6Fl9diOCzEJkj23LdRa6K8YEQIcxoI8nT9dxtaGqJfGgCxHozBVX1vgReNZ+eK68ll+X5Oo1gh8YDFUHS3wl/aMsB7PwKbiy29DXK8p7qESVNrFxUjKQsgYVby4GANX+11qBJa4oGul6TwE2Iito+m8n/d7e0Uqsu4GLYJnmNKDGfaDLaNQe7Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768470358; c=relaxed/relaxed;
	bh=YVVqGZ3l+eUoAxt/83SPf9RM0AnIYY+mCB+ElcBndDc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KLIJIILvf5SoDZJjWqadXXPMU1C/UEbQlB5WmVpmw7FtBxm7ITlWi9toYMuhq8sVuGtPOvlO+IPYhBZzge6QSQkR1GqALblienZcEIsxy8/QIfqX6IXT+wWMg3bZyHvZ0sX5GmXuAjRPfe+TPQh1Pjya+4FQD8WFQ69FvntK1oi4Y7MKee67jIapdhb8hsMZHBpHhENx2azTOm7eFjyPyB7ztrn9bOOIQUVdVnunf1B6Oz0c+h0W6QmPpAv01yszz4Dzaf9jIq9g99wXirW4hDz2LydusDNK/iTG8dgicnMoqlvRYn2A3G2Av9vsr6xeM/E9iljSslZfP9b+ppiKJg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=cRsnSkH3; dkim-atps=neutral; spf=pass (client-ip=2001:41d0:203:375::bc; helo=out-188.mta1.migadu.com; envelope-from=lance.yang@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=cRsnSkH3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:203:375::bc; helo=out-188.mta1.migadu.com; envelope-from=lance.yang@linux.dev; receiver=lists.ozlabs.org)
X-Greylist: delayed 390 seconds by postgrey-1.37 at boromir; Thu, 15 Jan 2026 20:45:55 AEDT
Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [IPv6:2001:41d0:203:375::bc])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dsJ5H0j1dz2xNg
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 20:45:54 +1100 (AEDT)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1768469942;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YVVqGZ3l+eUoAxt/83SPf9RM0AnIYY+mCB+ElcBndDc=;
	b=cRsnSkH3HNWFooNCu45BiRhggR8i4eFVIEtaDBZS6rcUGpU4CX2VzbdCKKVVXZEpZefbox
	1JDlPRjWkLPi/F4f3TbeE+mpwORW/695MiDjigp5P+ylTc7GZzfzqC+FKH1TT+SLK3VK8I
	8wdyRK+A0I4ZOEoETVWvkMjzjg4EN0c=
From: Lance Yang <lance.yang@linux.dev>
To: david@kernel.org
Cc: Liam.Howlett@oracle.com,
	akpm@linux-foundation.org,
	arnd@arndb.de,
	bcm-kernel-feedback-list@broadcom.com,
	christophe.leroy@csgroup.eu,
	corbet@lwn.net,
	eperezma@redhat.com,
	gregkh@linuxfoundation.org,
	jasowang@redhat.com,
	jerrin.shaji-george@broadcom.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	lorenzo.stoakes@oracle.com,
	maddy@linux.ibm.com,
	mhocko@suse.com,
	mpe@ellerman.id.au,
	mst@redhat.com,
	npiggin@gmail.com,
	osalvador@suse.de,
	rppt@kernel.org,
	surenb@google.com,
	vbabka@suse.cz,
	virtualization@lists.linux.dev,
	xuanzhuo@linux.alibaba.com,
	ziy@nvidia.com,
	Lance Yang <lance.yang@linux.dev>
Subject: Re: [PATCH v2 23/23] MAINTAINERS: move memory balloon infrastructure to "MEMORY MANAGEMENT - BALLOON"
Date: Thu, 15 Jan 2026 17:38:27 +0800
Message-ID: <20260115093827.12557-1-lance.yang@linux.dev>
In-Reply-To: <20260115092015.3928975-24-david@kernel.org>
References: <20260115092015.3928975-24-david@kernel.org>
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
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On Thu, 15 Jan 2026 10:20:13 +0100, David Hildenbrand (Red Hat) wrote:
> Nowadays, there is nothing virtio-balloon specific anymore about these
> files, the basic infrastructure is used by multiple memory balloon
> drivers.
> 
> For now we'll route it through Andrew's tree, maybe in some future it
> makes sense to route this through a separate tree.
> 
> Signed-off-by: David Hildenbrand (Red Hat) <david@kernel.org>
> ---
>  MAINTAINERS | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index de8f89ca1149f..b974f8c1c2225 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16454,6 +16454,16 @@ T:	quilt git://git.kernel.org/pub/scm/linux/kernel/git/akpm/25-new
>  F:	mm/
>  F:	tools/mm/
>  
> +MEMORY MANAGEMENT - BALLOON
> +M:	Andrew Morton <akpm@linux-foundation.org>
> +M:	David Hildenbrand <david@redhat.com>

Should it be david@kernel.org instead?

> +L:	linux-mm@kvack.org
> +S:	Maintained
> +W:	http://www.linux-mm.org
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> +F:	include/linux/balloon.h
> +F:	mm/balloon.c
> +
>  MEMORY MANAGEMENT - CORE
>  M:	Andrew Morton <akpm@linux-foundation.org>
>  M:	David Hildenbrand <david@kernel.org>
> @@ -27536,9 +27546,7 @@ M:	David Hildenbrand <david@kernel.org>
>  L:	virtualization@lists.linux.dev
>  S:	Maintained
>  F:	drivers/virtio/virtio_balloon.c
> -F:	include/linux/balloon.h
>  F:	include/uapi/linux/virtio_balloon.h
> -F:	mm/balloon.c
>  
>  VIRTIO BLOCK AND SCSI DRIVERS
>  M:	"Michael S. Tsirkin" <mst@redhat.com>

