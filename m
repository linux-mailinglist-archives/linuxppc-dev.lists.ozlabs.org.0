Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5607C43F6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Oct 2023 00:27:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1PL/j3Yl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S4rB26rJBz3cCM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Oct 2023 09:27:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1PL/j3Yl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=mcgrof@infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S4r9B6zBMz2xpm
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 09:26:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Jt7zMqKrLNJ4K7VS3w7XNGV+SpqUurU0PXBkkxalgKc=; b=1PL/j3Yl0CuSo7Wvorcy1SBbas
	I+6DqkyUbYtUIZ9pkGSDQa8ByQS3UkqTwbfjdaotfSES7NdqYqgxx29fk4+tzLW3FRROafO4ZtsvZ
	l+W8U6dorpda5yasc9Kqeau3Zz3sh/qCL49nsyxtkbllVRGWd6OzS9TccFLxGNwC4uVawQz8L4W7d
	AcCH9bEiJX5jVmwx9rhI9AetmVYQ337XpotHrDcgLYa0oedh5OhdR8LhKPPVwrBxYyGTxqsN2NJUq
	t3JisqYnKbp3RUciBZn8l5IbE1O6D3K7GhlblXGtYAWbn3INUlqHRA26oYGxooXJSmeyHUHhjfGWo
	wvcm+phA==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1qqLAv-00EFvQ-2z;
	Tue, 10 Oct 2023 22:26:01 +0000
Date: Tue, 10 Oct 2023 15:26:01 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: j.granados@samsung.com
Subject: Re: [PATCH v2 00/15] sysctl: Remove sentinel elements from drivers
Message-ID: <ZSXPeVDv6FfKiTp5@bombadil.infradead.org>
References: <20231002-jag-sysctl_remove_empty_elem_drivers-v2-0-02dd0d46f71e@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231002-jag-sysctl_remove_empty_elem_drivers-v2-0-02dd0d46f71e@samsung.com>
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Steve Wahl <steve.wahl@hpe.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Clemens Ladisch <clemens@ladisch.de>, linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org, Phillip Potter <phil@philpotter.co.uk>, Song Liu <song@kernel.org>, Eric Dumazet <edumazet@google.com>, "K. Y. Srinivasan" <kys@microsoft.com>, Jiri Slaby <jirislaby@kernel.org>, Russ Weight <russell.h.weight@intel.com>, Wei Liu <wei.liu@kernel.org>, Stefano Stabellini <sstabellini@kernel.org>, Corey Minyard <minyard@acm.org>, Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org, David Airlie <airlied@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Dexuan Cui <decui@microsoft.com>, willy@infradead.org, Jason Gunthorpe <jgg@ziepe.ca>, linux-serial@vger.kernel.org, Doug Gilbert <dgilbert@interlog.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Haiyang Zhang <haiyangz@microsoft.com>, Kees Cook <keescook@chromium.org>, Arnd 
 Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, "James E.J. Bottomley" <jejb@linux.ibm.com>, intel-gfx@lists.freedesktop.org, josh@joshtriplett.org, Jani Nikula <jani.nikula@linux.intel.com>, linux-raid@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>, xen-devel@lists.xenproject.org, openipmi-developer@lists.sourceforge.net, Juergen Gross <jgross@suse.com>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Theodore Ts'o <tytso@mit.edu>, linux-scsi@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, David Ahern <dsahern@kernel.org>, Robin Holt <robinmholt@gmail.com>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Daniel Vetter <daniel@ffwll.ch>, netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Oct 02, 2023 at 10:55:17AM +0200, Joel Granados via B4 Relay wrote:
> Changes in v2:
> - Left the dangling comma in the ctl_table arrays.
> - Link to v1: https://lore.kernel.org/r/20230928-jag-sysctl_remove_empty_elem_drivers-v1-0-e59120fca9f9@samsung.com

Thanks! Pushed onto sysctl-next for wider testing.

  Luis
