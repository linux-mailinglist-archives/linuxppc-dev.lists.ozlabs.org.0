Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A4880E4AA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Dec 2023 08:12:02 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=loj03fvm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sq8tl4RLCz3c8h
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Dec 2023 18:11:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=loj03fvm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+6f90c2f2ff3264e7ff81+7415+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sq8sv2fggz2xb2
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Dec 2023 18:11:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=3ses/ZsQ18kkMwgX82j0GHRHgEu7yezobRPEQDwOeVE=; b=loj03fvm+MJwW7UkZI87OSv2dM
	qeINzFTWACJoUVBnZlcSrmQkrWLr5xuEsDdRgvb5xBuN1aE/bWKNEgWHFUlBi/ZV9SF22qyvnJGUA
	DZ68pilvL8lEA0iIGTlXV2zGf7lHqaMbEX21rfTXZE6tuqmlioNpEuuuLEimLtiwvnN/Y7QaN0miK
	8Pw/X9MRFAr9i/CbFXHP2hssmAw31NucyJ04pGVjNFulPJR0JNcg2RsF/iul5D+xi4/72npQbSeXG
	AMPg9usdCOgER055N5knKYZHyWtjFPb5xvlUOXsPtI+/8n7GRnUxeWFCsRjRL0cG2Zs0GDs92YoTC
	1eySzcnA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1rCwv4-00AuEj-0x;
	Tue, 12 Dec 2023 07:11:06 +0000
Date: Mon, 11 Dec 2023 23:11:06 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [RFC PATCH 05/12] lib/raid6: Use CC_FLAGS_FPU for NEON CFLAGS
Message-ID: <ZXgHisDUsJMw7z3N@infradead.org>
References: <20231208055501.2916202-1-samuel.holland@sifive.com>
 <20231208055501.2916202-6-samuel.holland@sifive.com>
 <ZXczty+Y6dTDL4Xi@infradead.org>
 <7c40dfe8-f245-413f-a424-bde52ce21b6a@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7c40dfe8-f245-413f-a424-bde52ce21b6a@sifive.com>
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
Cc: linux-arch@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>, loongarch@lists.linux.dev, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Dec 11, 2023 at 10:12:27AM -0600, Samuel Holland wrote:
> On 2023-12-11 10:07 AM, Christoph Hellwig wrote:
> 
> Unfortunately, not all of the relevant options can be no-prefixed:

Ok.  That is another good argument for having the obj-fpu += syntax
I proposed.  You might need help from the kbuild maintainers from that
as trying to understand the kbuild magic isn't something I'd expect
from a normal contributor (including myself..).

