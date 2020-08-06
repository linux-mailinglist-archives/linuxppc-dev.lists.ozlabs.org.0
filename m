Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9535C23D876
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Aug 2020 11:20:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BMjd46WXJzDq9B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Aug 2020 19:20:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=casper.srs.infradead.org (client-ip=2001:8b0:10b:1236::1;
 helo=casper.infradead.org;
 envelope-from=batv+51efaf08c314c7af39ff+6192+infradead.org+hch@casper.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=Ns3KKIZD; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BMjb50WgxzDqlh
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Aug 2020 19:18:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=LGsolx+q4+pRQwaFegj0pZt825v+uaehpXLibfoN7qg=; b=Ns3KKIZDE6iGgMooNVVQ63I1br
 CvPi4fQkVVaIqdaadNEcdq5e/qP0sFb+t7e7CxNw088wxUDhKLm0p07hCuJGdrAGGqArmBx3z+bcJ
 XAvI8FNyeJOKqNSXUOHdyXSYxUg6XuIVnKb6IMunukKE/jeTy9iKElJdtoyUUk6W3Kaj1ukYnZE9M
 UMqYPPJHj4IxUeNE6DnokltXo2FBVwg0LhQRzaOHrAkSzlN8ICB9ytGWeBT56i8nx35AsTjrmPfCe
 eN2klwLsvDa2jdXush1PsPISlab9rjivhBUdiBnclY6XsfOdaYiIMuAamMjrQkst0K9boxWwrfnlm
 a57pVYTg==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1k3c2A-0000FS-J5; Thu, 06 Aug 2020 09:17:58 +0000
Date: Thu, 6 Aug 2020 10:17:58 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v3 3/3] powerpc/uaccess: simplify the get_fs() set_fs()
 logic
Message-ID: <20200806091758.GA653@infradead.org>
References: <a6e62627d25fb7ae9b91d8bf553e707689e37498.1596702117.git.christophe.leroy@csgroup.eu>
 <cf39cb8e42cffe323393b8cecdc59a7230298eab.1596702117.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cf39cb8e42cffe323393b8cecdc59a7230298eab.1596702117.git.christophe.leroy@csgroup.eu>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Do you urgently need this?  My plan for 5.10 is to rebased and submit
the remaining bits of this branch:

    http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/set_fs-removal

which will kill off set_fs/get_fs entirely.
