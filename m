Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED4F26FE11
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Sep 2020 15:18:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BtDtP3WhCzDqP1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Sep 2020 23:18:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=willy@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=Twr3txXo; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BtDNm1dn1zDqVx
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Sep 2020 22:56:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=zoOf0E5vEVvypLQZvTu3Qa4P//IZej+JhDzkQ4SZUbU=; b=Twr3txXoOUgAutBdzGyZB+lY1J
 jlGkbNw57ycQeyDICn1qQL9BIF49y+wvEY79YsJqm+klFYXfm0D4wJQy3SSrZuX4oN/X8scImOz1x
 iAvwhjjALzGEztMeZqVmVcGLW9G+To4auxoqyNMS/2NkqC80s33Ta7xmNuQV1rY8qKanIvXoGLe8B
 6fal0Zox8xpamGqpfYQasr4KUlD6H2FixgEIiyw2pdQ2ZDQlOzArXaJmv2bnI8JP8Jm2wf1+J0rcP
 pG1NLuH/an00oo9pw7YDidPu4WRCYUnv3lQPu2dFwfhtiUQ2ogaw+KlPq/67Y5JGwwImp7XdmncP5
 jHtexrUQ==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1kJFvv-0001A7-Pu; Fri, 18 Sep 2020 12:56:11 +0000
Date: Fri, 18 Sep 2020 13:56:11 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 3/9] fs: explicitly check for CHECK_IOVEC_ONLY in
 rw_copy_check_uvector
Message-ID: <20200918125611.GE32101@casper.infradead.org>
References: <20200918124533.3487701-1-hch@lst.de>
 <20200918124533.3487701-4-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200918124533.3487701-4-hch@lst.de>
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
Cc: linux-aio@kvack.org, linux-mips@vger.kernel.org,
 David Howells <dhowells@redhat.com>, linux-mm@kvack.org,
 keyrings@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, x86@kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-block@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 io-uring@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Jens Axboe <axboe@kernel.dk>, linux-parisc@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 18, 2020 at 02:45:27PM +0200, Christoph Hellwig wrote:
>  		}
> -		if (type >= 0
> -		    && unlikely(!access_ok(buf, len))) {
> +		if (type != CHECK_IOVEC_ONLY && unlikely(!access_ok(buf, len))) {

drop the unlikely() at the same time?  if it's really advantageous,
that should be embedded in the access_ok macro.

