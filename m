Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5841C8CB72
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 07:57:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467f455RJqzDqlS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 15:57:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (mailfrom)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+147547a3be601d556dd4+5834+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="neY7O7gh"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467f2J64XFzDqX8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 15:55:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QO/ujdGHsGus5q5hW+MDp+9hUOaT+2ytDi2HUKE5LUE=; b=neY7O7ghM+TkauICr2aBIQEVT
 OhWhgeM9+QNOWnz/N3uQ9KhxyjDCFYe+nnhq/NrV7vmB7XCTwXhW4Rq8q3+CJU3WVK8q9Ad3T4Vff
 0yYRjWuZEIo4EW7MsE60RxKo3WVvghLh7L6iAjuzGTCFy6qAp09WKl9geyV6o1C+qNW0XyN1DrYXd
 VnkHvk8QMPPbrqqYkJ18Noq6Se5BmAP1grw7LHt/u3rz97P4EQFmChtBG7vs4BkoZwlK5kTYQ7taK
 KOGYcVw+Hh6pCKf8O/NXMUCpA5Zx/C+rWo8md/+1skh5CqaB192d6YCEuNgXM1p+WYq85nxI0UuCa
 NpZ5vBztg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1hxmFp-0004n3-9c; Wed, 14 Aug 2019 05:55:25 +0000
Date: Tue, 13 Aug 2019 22:55:25 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH v1 05/10] powerpc/mm: Do early ioremaps from top to
 bottom on PPC64 too.
Message-ID: <20190814055525.GA12744@infradead.org>
References: <6bc35eca507359075528bc0e55938bc1ce8ee485.1565726867.git.christophe.leroy@c-s.fr>
 <019c5d90f7027ccff00e38a3bcd633d290f6af59.1565726867.git.christophe.leroy@c-s.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <019c5d90f7027ccff00e38a3bcd633d290f6af59.1565726867.git.christophe.leroy@c-s.fr>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: linux-kernel@vger.kernel.org, npiggin@gmail.com,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Aug 13, 2019 at 08:11:38PM +0000, Christophe Leroy wrote:
> Until vmalloc system is up and running, ioremap basically
> allocates addresses at the border of the IOREMAP area.

Note that while a few other architectures have a magic hack like powerpc
to make ioremap work before vmalloc, the normal practice would be
to explicitly use early_ioremap.  I guess your change is fine for now,
but it might make sense convert powerpc to the explicit early_ioremap
scheme as well.
