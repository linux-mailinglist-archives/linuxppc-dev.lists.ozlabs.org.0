Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AAB96CA9F6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 18:06:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pld3P1sqzz3fQn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Mar 2023 03:06:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LPLf/jCv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=mcgrof@infradead.org; receiver=<UNKNOWN>)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pld2M0tRqz3chq
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Mar 2023 03:05:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=RGwHI36+26alMOPcJARCf4i+u/nuff7mObHUT3LcJRU=; b=LPLf/jCvgk6BbAdu2sWsjs0oNX
	30l+yYDMt7lIPUZlX1xLPKvd+VVVQITd3MBjp55UXnh0lC27yas9PjZ1X8/Ke/FN2w5Z7mgrMqRNS
	NMe2iIKVClT29RE+YYzmxZbB3MjqVTlPCvQNedD6+P2DTM3qoHKrTsXd9k/l+Z6LWIlrLqO0i0LPP
	WcUrCoUENmgBRd1TwHHhU6kKgkRvL9EW+Kwg4gKazSQbHimCznogGlrnIrlhrYbEsmEYHmZgBhRO2
	txegvcMIwswcdkNGLcJijBEGxeQVIVJr1oRDPP6IWPp68b1YWWkcPAIa7dwiPZZpdkAy2Plhs+eAH
	tVStJIQg==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1pgpLM-00Beeh-0e;
	Mon, 27 Mar 2023 16:05:12 +0000
Date: Mon, 27 Mar 2023 09:05:12 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] driver core: class: mark the struct class for sysfs
 callbacks as constant
Message-ID: <ZCG+uH4Dh16Gwonj@bombadil.infradead.org>
References: <20230325084537.3622280-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230325084537.3622280-1-gregkh@linuxfoundation.org>
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Eric Dumazet <edumazet@google.com>, linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>, linux-cifs@vger.kernel.org, Sergey Senozhatsky <senozhatsky@chromium.org>, linux-rdma@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Namjae Jeon <linkinjeon@kernel.org>, Russ Weight <russell.h.weight@intel.com>, linux-s390@vger.kernel.org, linux-gpio@vger.kernel.org, Jens Axboe <axboe@kernel.dk>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Steve French <sfrench@samba.org>, Minchan Kim <minchan@kernel.org>, Johannes Berg <johannes@sipsolutions.net>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Mar 25, 2023 at 09:45:37AM +0100, Greg Kroah-Hartman wrote:
> struct class should never be modified in a sysfs callback as there is
> nothing in the structure to modify, and frankly, the structure is almost
> never used in a sysfs callback, so mark it as constant to allow struct
> class to be moved to read-only memory.
> 
> While we are touching all class sysfs callbacks also mark the attribute
> as constant as it can not be modified.  The bonding code still uses this
> structure so it can not be removed from the function callbacks.
> 
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>

  Luis
