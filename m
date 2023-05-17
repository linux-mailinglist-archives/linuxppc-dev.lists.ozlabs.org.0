Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CAD4707587
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 May 2023 00:38:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QM7LQ0PDPz3fJD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 May 2023 08:38:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=iki.fi header.i=@iki.fi header.a=rsa-sha256 header.s=lahtoruutu header.b=LC6P+9+K;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=iki.fi header.i=@iki.fi header.a=rsa-sha256 header.s=meesny header.b=KI5xLqxA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=iki.fi (client-ip=185.185.170.37; helo=lahtoruutu.iki.fi; envelope-from=sakari.ailus@iki.fi; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=iki.fi header.i=@iki.fi header.a=rsa-sha256 header.s=lahtoruutu header.b=LC6P+9+K;
	dkim=pass (1024-bit key; secure) header.d=iki.fi header.i=@iki.fi header.a=rsa-sha256 header.s=meesny header.b=KI5xLqxA;
	dkim-atps=neutral
X-Greylist: delayed 351 seconds by postgrey-1.36 at boromir; Wed, 17 May 2023 23:10:32 AEST
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QLtkw3l8Lz3c4w
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 May 2023 23:10:32 +1000 (AEST)
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lahtoruutu.iki.fi (Postfix) with ESMTPS id 4QLtbx5blZz49Q7F
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 May 2023 16:04:29 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1684328669;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qroAO/01zVC5BeUS1oPJjvMgFXQbPQ5wLZQknG7YiBc=;
	b=LC6P+9+K9g9wZ6DExJ0p4ka32e7cxlR97HASaHp8+k3dGfBJyINx99L4LnoootPrEZNqX6
	wErvIAvmpNoVC2GCBGlqyksXnwlgK4Ta2l9toJloVwhXUzddxAgZQj/n5j0jZxRQp475Ml
	/xpJuk+U841dlXdVNwGIYFnXADO6BtlCBI4edoICxJOgR9QpDumcDQgZ479suPu/ZogEC1
	epEIWvyxrMbiWsoe9kKI2ygrJIHDL3nV5TG7FPMqNwXl/jawpEF7nJtgG9UBNirkDdN647
	/1TzYqlJZboC9jdQwe+k32jZAKz6mBKuhseNsQEHLu9OkLvPljWVKhrrItqoWg==
Received: from hillosipuli.retiisi.eu (82-181-192-243.bb.dnainternet.fi [82.181.192.243])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4QLtbV1QG8zyVk;
	Wed, 17 May 2023 16:04:05 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1684328652;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qroAO/01zVC5BeUS1oPJjvMgFXQbPQ5wLZQknG7YiBc=;
	b=KI5xLqxAreFfTVONtxIvWUWwB6MTDQj7RtmKmQdExNpcu0TTzvVSri6CgDzfn/Cvel5yIF
	peJPQn6GiZwvSCe1d9YgeARR10JKXstw9T0rA85J5gW4iNziKdRCMcnWXYP0+H6llDqTu+
	dlJg7YsYYMHPUazplrk3fr+MLlrvNQ8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1684328652;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qroAO/01zVC5BeUS1oPJjvMgFXQbPQ5wLZQknG7YiBc=;
	b=tq4IDVw8v8U/8GsVfhSpzk5/qRBC75wFpFFUJgfBv9u3M7Nh/LDCouHEa/Yf2TAbdyN9RL
	s9DHY+YDHwdk5UhlkrhBxeP2H2uUN2GWxD/ThDKmfJpRrOdCf8iI3cZweO5gCffPclWh3T
	72d3B2jMq4cIupzPEIlKtqOR6tjzSWQ=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1684328652; a=rsa-sha256; cv=none;
	b=NhylTHQjTF5WnCPKZ7JS9gpIQVkp7jw/Go3W19TSMVVJzM3XuHh1EGsfnax0pohXqM0PST
	9D9wqdiwjRp9aDijZ5JN+bmSBC6eMjAtZznB5usfmHDH3gVQKs7r3mGmGqix5OK1JPosO8
	b8VJFUZikNPWWHwmwu7R15M7dw0pr0I=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 4BC90634C94;
	Wed, 17 May 2023 16:04:05 +0300 (EEST)
Date: Wed, 17 May 2023 16:04:05 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Lorenzo Stoakes <lstoakes@gmail.com>
Subject: Re: [PATCH v5 5/6] mm/gup: remove vmas parameter from
 pin_user_pages()
Message-ID: <ZGTQxbiFnTADjLgv@valkosipuli.retiisi.eu>
References: <cover.1684097001.git.lstoakes@gmail.com>
 <acd4a8c735c9bc1c736e1a52a9a036db5cc7d462.1684097002.git.lstoakes@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acd4a8c735c9bc1c736e1a52a9a036db5cc7d462.1684097002.git.lstoakes@gmail.com>
X-Mailman-Approved-At: Thu, 18 May 2023 08:37:55 +1000
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
Cc: Nelson Escobar <neescoba@cisco.com>, kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>, Alexei Starovoitov <ast@kernel.org>, virtualization@lists.linux-foundation.org, linux-mm@kvack.org, Eric Dumazet <edumazet@google.com>, Leon Romanovsky <leon@kernel.org>, Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, linux-rdma@vger.kernel.org, "Michael S . Tsirkin" <mst@redhat.com>, John Fastabend <john.fastabend@gmail.com>, Matthew Wilcox <willy@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, Bernard Metzler <bmt@zurich.ibm.com>, Paolo Abeni <pabeni@redhat.com>, bpf@vger.kernel.org, linux-media@vger.kernel.org, Maciej Fijalkowski <maciej.fijalkowski@intel.com>, Jesper Dangaard Brouer <hawk@kernel.org>, John Hubbard <jhubbard@nvidia.com>, Nicholas Piggin <npiggin@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, io-uring@vger.kernel.org, Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <ax
 boe@kernel.dk>, Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, Bjorn Topel <bjorn@kernel.org>, Jonathan Lemon <jonathan.lemon@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Pavel Begunkov <asml.silence@gmail.com>, Christian Benvenuti <benve@cisco.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, May 14, 2023 at 10:26:58PM +0100, Lorenzo Stoakes wrote:
> We are now in a position where no caller of pin_user_pages() requires the
> vmas parameter at all, so eliminate this parameter from the function and
> all callers.
> 
> This clears the way to removing the vmas parameter from GUP altogether.
> 
> Acked-by: David Hildenbrand <david@redhat.com>
> Acked-by: Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com> (for qib)
> Signed-off-by: Lorenzo Stoakes <lstoakes@gmail.com>

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com> # drivers/media

-- 
Sakari Ailus
