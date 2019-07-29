Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B5778F5D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2019 17:33:24 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45y3cK2sxvzDqRR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2019 01:33:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (mailfrom)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+767bd1556e0605a17a22+5818+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="kvEqu8lI"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45y2GK1JhKzDqBm
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2019 00:32:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1Qg4ugmQtTe6Jeu2janlNWnIvWzDuxv0JhGbvOZJApQ=; b=kvEqu8lIKNg3YVqWqPEw2/3Ef
 y1fnYT8Taww0z//ZgQ7QYqmocWNLDKRrGSQ8/M/wanZx7bA/Hle3i04bGRo2t+gfVHKpuhd8Tm4fq
 LzhbJ/fD04hxID9rhr/4uKUB9Z7nVIqnX4tWA7NbSDh0oNsJyGUg67I61bW7824DqgrXPj+SvzjSh
 2oYczPWXn7b03CdKoQFOWxRU83ICc2vboQZvCdK4PXZp2k5s59QoldBUXuEPwFJAgY1Vk9tdyeh/r
 B00n0Q5SY8OAMeA4TOMOCjPPaRWDF+kzzigGj6E+nS89LDXnpteW+2DDu0exatN7HxC4LdcD4CnYx
 fBn5Jtv7A==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1hs6hY-0008Bk-5V; Mon, 29 Jul 2019 14:32:36 +0000
Date: Mon, 29 Jul 2019 07:32:36 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Jason Yan <yanaijie@huawei.com>
Subject: Re: [RFC PATCH 03/10] powerpc: introduce kimage_vaddr to store the
 kernel base
Message-ID: <20190729143236.GB11737@infradead.org>
References: <20190717080621.40424-1-yanaijie@huawei.com>
 <20190717080621.40424-4-yanaijie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190717080621.40424-4-yanaijie@huawei.com>
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
Cc: wangkefeng.wang@huawei.com, keescook@chromium.org,
 kernel-hardening@lists.openwall.com, thunder.leizhen@huawei.com,
 linux-kernel@vger.kernel.org, npiggin@gmail.com, jingxiangfeng@huawei.com,
 diana.craciun@nxp.com, paulus@samba.org, fanchengyang@huawei.com,
 linuxppc-dev@lists.ozlabs.org, yebin10@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 17, 2019 at 04:06:14PM +0800, Jason Yan wrote:
> Now the kernel base is a fixed value - KERNELBASE. To support KASLR, we
> need a variable to store the kernel base.

This should probably merged into the patch actually using it.
