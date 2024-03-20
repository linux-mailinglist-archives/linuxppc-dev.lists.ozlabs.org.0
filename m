Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 963D7880C6D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Mar 2024 08:53:51 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=b/MUltpH;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=b/MUltpH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V017K0qPDz3cCr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Mar 2024 18:53:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=b/MUltpH;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=b/MUltpH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V016Z2kszz2xFk
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Mar 2024 18:53:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710921185;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fqiMQHqORmeDjYjtn7CCiO+1Zj4Lkm+sgSbsT1labdI=;
	b=b/MUltpHzX66BLCu+uQyEl2mJsagaMXKOJB/qihZ7ShAIpsIkbB5MXxPmZvSvi6NZ+Pkmf
	TL0Cjf3AAzZYp9+rwcE9HB0sMFcUXJwvzfMsQ7brHnO02R9Dcw9m7CWRpYDsdh0/H3/hDk
	jFckUWDCLpzFs6uG3e7G8tuW2cNLJdk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710921185;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fqiMQHqORmeDjYjtn7CCiO+1Zj4Lkm+sgSbsT1labdI=;
	b=b/MUltpHzX66BLCu+uQyEl2mJsagaMXKOJB/qihZ7ShAIpsIkbB5MXxPmZvSvi6NZ+Pkmf
	TL0Cjf3AAzZYp9+rwcE9HB0sMFcUXJwvzfMsQ7brHnO02R9Dcw9m7CWRpYDsdh0/H3/hDk
	jFckUWDCLpzFs6uG3e7G8tuW2cNLJdk=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-518-IpUFOGt-N_aQBzw5f2DQIQ-1; Wed,
 20 Mar 2024 03:53:00 -0400
X-MC-Unique: IpUFOGt-N_aQBzw5f2DQIQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7BEF5383CD69;
	Wed, 20 Mar 2024 07:53:00 +0000 (UTC)
Received: from localhost (unknown [10.72.116.12])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BC8A91C060A6;
	Wed, 20 Mar 2024 07:52:59 +0000 (UTC)
Date: Wed, 20 Mar 2024 15:52:52 +0800
From: Baoquan He <bhe@redhat.com>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH 2/6] x86: remove memblock_find_dma_reserve()
Message-ID: <ZfqV1IEo3+cf9f9I@MiWiFi-R3L-srv>
References: <20240318142138.783350-1-bhe@redhat.com>
 <20240318142138.783350-3-bhe@redhat.com>
 <Zfmz_1sbbvSWMj9C@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zfmz_1sbbvSWMj9C@kernel.org>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
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

On 03/19/24 at 05:49pm, Mike Rapoport wrote:
> Hi Baoquan,
> 
> On Mon, Mar 18, 2024 at 10:21:34PM +0800, Baoquan He wrote:
> > This is not needed any more.
> 
> I'd swap this and the first patch, so that the first patch would remove
> memblock_find_dma_reserve() and it's changelog will explain why it's not
> needed and then the second patch will simply drop unused set_dma_reserve()

Thanks, Mike.

My thought on the patch 1/2 splitting is:
patch 1 is removing all relevant codes in mm, including the usage of
dma_reserve in free_area_init_core() and exporting set_dma_reserve()
to any ARCH which want to subtract the dma_reserve from DMA zone.

Patch 2 purely remove the code in x86 ARCH about how to get dma_reserve.

Your suggestion is also good to me, I can rearrange the order and
repost.

