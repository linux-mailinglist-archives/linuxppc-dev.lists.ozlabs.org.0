Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE7E702BD2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 May 2023 13:52:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QKd5C6yXJz3f6L
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 May 2023 21:51:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IkBBAEfM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+d8048cf69d99de8d0741+7204+infradead.org+hch@bombadil.srs.infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IkBBAEfM;
	dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QKd4J3B56z3bg3
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 May 2023 21:51:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=PuPfI1ULNn6nKdgBOgNMBtEbGf2urZOQinv9le4S0tg=; b=IkBBAEfMBi3BnwkUH9a+d6WFrp
	IAP6BVB6s9Sl8NqTDNcoPch40oFg+Og/x7m6XkOUE72+xSzl5ZlI98459I4E/du347IDxCTnReoyr
	2oONv2hE1I3etOOnCSY2vH9ouRwvUXHVKKVE+lKyCxDJ7gkQCHtKzqlDKNWUmE1Pr4uvdovJE5O8U
	aFKw5WRtbNE+EPp9q4TeTUEoP0voDGcBEZNG9WfWZqArILRyyFm3+03au5ftDUPZXH3r+YWAxP/6I
	F2qrkp8eHjEgXrfMbulzU3v+q/5Tn/XUKFTFaEw9mWhCAMnwjbBu1x/P/5q4Wok0/BQJDjF1eLR8M
	Iv7zwhgA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1pyWis-0022I3-1r;
	Mon, 15 May 2023 11:50:38 +0000
Date: Mon, 15 May 2023 04:50:38 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Lorenzo Stoakes <lstoakes@gmail.com>
Subject: Re: [PATCH v5 5/6] mm/gup: remove vmas parameter from
 pin_user_pages()
Message-ID: <ZGIcjr2I5FDDKdCZ@infradead.org>
References: <cover.1684097001.git.lstoakes@gmail.com>
 <acd4a8c735c9bc1c736e1a52a9a036db5cc7d462.1684097002.git.lstoakes@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acd4a8c735c9bc1c736e1a52a9a036db5cc7d462.1684097002.git.lstoakes@gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
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

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>
