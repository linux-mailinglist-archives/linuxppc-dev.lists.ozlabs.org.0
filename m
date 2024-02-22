Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CEC85F19E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Feb 2024 07:48:09 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=VBZDJuzs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TgNxz1Vb9z3ccC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Feb 2024 17:48:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=geoff@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TgNx430B4z2xdg
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Feb 2024 17:47:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=rZbhMbCG8na1XzrA8SgUnorhUdAmwCpVkilueFdja2A=; b=VBZDJuzsukWHN+QHTUI6uCR5Ay
	HXvBsyRp7TGoJnVIZ3SYim5+1gDT5WK9l001H20rVeYTKU21Fn4HpiQdV/lr6IODiBC0fotwwgxwA
	JNEdN4wvNQ2AoFXofV3nPCB+eM01Nmm2yepcxFKe55OIEHvPiMqLjgfOFSULzM+C+mRTiR9J2IVO8
	/Wl7xa3heRxDir30+T4xzAgOxl8am2QrZZkxPy8qDxquORzXB1sdnh0PQfFsa2SgYMzGrk5qCQEPL
	L6CUIHQUgd3qFS9qtXZs2TA94pvPKSIWeCJufh3XOGf9tfJfvEjDBn+UO9DXaFdxD3EwQZXSztr8C
	k8PgLfOw==;
Received: from 124x35x135x198.ap124.ftth.ucom.ne.jp ([124.35.135.198] helo=[192.168.2.109])
	by casper.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd2qy-00000002ppU-0Tu0;
	Thu, 22 Feb 2024 06:46:44 +0000
Message-ID: <25d3b356-f44e-4b20-a6d8-9c2a3f839182@infradead.org>
Date: Thu, 22 Feb 2024 15:46:34 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC net] ps3/gelic: Fix possible NULL pointer dereference
To: Dan Carpenter <dan.carpenter@linaro.org>, Simon Horman <horms@kernel.org>
References: <20240221-ps3-gelic-null-deref-v1-1-f4fe159c7cb0@kernel.org>
 <d8cfc517-f597-420b-a164-1d33f3117b93@moroto.mountain>
Content-Language: en-US
From: Geoff Levand <geoff@infradead.org>
In-Reply-To: <d8cfc517-f597-420b-a164-1d33f3117b93@moroto.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Jeff Garzik <jeff@garzik.org>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2/22/24 03:32, Dan Carpenter wrote:
> This driver is PPC so I have never looked at the code before.  I noticed
> another issue that was introduced last December in commit 3ce4f9c3fbb3
> ("net/ps3_gelic_net: Add gelic_descr structures").
> 
> net/ethernet/toshiba/ps3_gelic_net.c
...
>    375  static int gelic_descr_prepare_rx(struct gelic_card *card,
>    376                                    struct gelic_descr *descr)
>    398          descr->skb = NULL;
>                 ^^^^^^^^^^^^^^^^^^
> NULL
> 
>    399  
>    400          offset = ((unsigned long)descr->skb->data) &
>                                          ^^^^^^^^^^^^
> Dereferenced here.

There is a fix, see '[PATCH v6 net] ps3/gelic: Fix SKB allocation':

  https://lore.kernel.org/netdev/20240221172824.GD722610@kernel.org/T/

-Geoff
