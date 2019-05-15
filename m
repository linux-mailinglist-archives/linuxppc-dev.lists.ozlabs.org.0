Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4DE1E866
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 08:44:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 453lQK5wYjzDqS7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 16:44:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (mailfrom)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+738fd1ce08e215645d94+5743+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="OeC9kYAU"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 453lM13djPzDqQG
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2019 16:41:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Jm+WmbEMj7RgVegAtjm1MfYNTFMfixWy8QDjLSj4BHk=; b=OeC9kYAUNLiaUDHQM/SHwmOXY
 o42CVJgIGwct0BR1oDqetWdF5+nxenh2ji+7D6n/ybbOgkFYd1Lk3pB4a1K7Fg8iQJet8tj06QVcT
 w+Fd2KDZWAwwmP0KmAeu0xKv3sna8BEZP4xyrgbwDCfUPOE7niiHZurqaA1tqj8u4aTblOd71LqLG
 9Gdqre1yxrkbZjd166QlWwu+04M/ltoKK6vPqRLBIIWLQtJmkUgqVtNk2jmQYxwxLEia7KH420Djv
 gUot7IGL7MjAyYAfNYBFTIHpCbMTSkD9sYpYaJSCgYTk+tgalaHI5+T8jsavPjsR2VWlK9bJm4qm1
 AQFgQOGyQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1hQnbE-0005LX-1l; Wed, 15 May 2019 06:41:12 +0000
Date: Tue, 14 May 2019 23:41:11 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Russell Currey <ruscur@russell.cc>
Subject: Re: [PATCH] powerpc/mm/book3s64: Implement STRICT_MODULE_RWX
Message-ID: <20190515064111.GA15778@infradead.org>
References: <20190515013000.16085-1-ruscur@russell.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190515013000.16085-1-ruscur@russell.cc>
User-Agent: Mutt/1.9.2 (2017-12-15)
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms of the GNU General Public License as published by the
> + * Free Software Foundation; either version 2 of the License, or (at your
> + * option) any later version.

This license boilerplate should not be added together with an SPDX tag.

> +// we need this to have a single pointer to pass into apply_to_page_range()

Please use normal /* - */ style comments.
