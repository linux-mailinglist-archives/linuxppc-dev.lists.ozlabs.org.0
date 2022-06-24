Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8215596C4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 11:38:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LTsVm1jyWz3cgX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 19:38:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CGjsvzJo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+825a24a2c69d0abd218e+6879+infradead.org+hch@bombadil.srs.infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CGjsvzJo;
	dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LTsV8017Fz2xKq
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jun 2022 19:37:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Atd5LJgXzo1vZyeUf+/KGPTNYBq0h/PGUpmKMol4gKA=; b=CGjsvzJofFcrSPSXw0tb9JZiNv
	bAjIyAK0C8xhrporVTwUtjJ5S9Bhet9G683UECw5n0B3opQx6T6ZHqFCNqMKnGBAleljYNhSuSJ1k
	FkxD2OAGmBd8YmAkhX2R9OfQeeKFFw4fWJTbMcazC1ve4FxYYkJuxS0WL50NXpgrAQy67XeHl5Hcn
	TQOhio3h4WBwWNXowMO9xq8t3pYSeXD71b2O1EniUpw95+sXhct3/LUCWeeejxkQtsV/AMHua4Xwl
	QFoQddXjiHw8HAUg8s6PFY++qFbISJ7bK62hKaVa2Jd7wbObdueD+4y+fJu58hc31VC2hwWxBbmwM
	Fm/H6pnA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4fkh-001SaQ-OI; Fri, 24 Jun 2022 09:37:23 +0000
Date: Fri, 24 Jun 2022 02:37:23 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Laurent Dufour <ldufour@linux.ibm.com>
Subject: Re: [PATCH v2 2/4] watchdog: export watchdog_mutex and
 lockup_detector_reconfigure
Message-ID: <YrWF0w3mpYA//BX6@infradead.org>
References: <20220614135414.37746-1-ldufour@linux.ibm.com>
 <20220614135414.37746-3-ldufour@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220614135414.37746-3-ldufour@linux.ibm.com>
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
Cc: nathanl@linux.ibm.com, linux-kernel@vger.kernel.org, npiggin@gmail.com, paulus@samba.org, linuxppc-dev@lists.ozlabs.org, haren@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 14, 2022 at 03:54:12PM +0200, Laurent Dufour wrote:
> The watchdog_mutex is exported to allow some variable to be changed under
> its protection and prevent any conflict.
> The lockup_detector_reconfigure() function is exported and is expected to
> be called under the protection of watchdog_mutex.

Please provide an actual function accessor instead of directly touching
a global lock.
