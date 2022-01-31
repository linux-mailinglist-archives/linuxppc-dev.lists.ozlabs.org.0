Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7598F4A46CB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Jan 2022 13:20:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JnRw42Rnvz3cHN
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Jan 2022 23:20:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YFDDe5oi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+c8a487c16eeb054acd37+6735+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=bombadil.20210309 header.b=YFDDe5oi; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JnRvL3kVvz2xsY
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Jan 2022 23:19:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=l2WBiCb5duYJRA9nKpihqrJOH1Qjg6utSrFiu8qAdtc=; b=YFDDe5oib/xF9rn91S4g43Rqhm
 G5RyYVlxzee62HumiUjUwRN5/WZwivUW+Do4klh4KThptaCn3Ire78uK3IfcDa3xjV2APYs0Fnt+H
 49djOCYkLbporPC+wJGvyhKobjjvOakfIUHuB+jH6mUs8mQzIFxHEGL8U1k8iaqzakEHIup6XqFId
 0rZoERJzMVUf/pGMhuqnQucX3J6B9e0dmQh+LeQqWbRqvKgupMzTu7PgbzqPhaN6J5zS++ikTBiJA
 gsfLY0Xq9lG/UqCLoDBs4RJPlj/YMDt4O+NLOVNXlX+TSKxA2UloYw8OgqsByonZ/1pyKnm+TDqtJ
 82mb9G1g==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nEVe8-009INd-1R; Mon, 31 Jan 2022 12:19:00 +0000
Date: Mon, 31 Jan 2022 04:19:00 -0800
From: Christoph Hellwig <hch@infradead.org>
To: guoren@kernel.org
Subject: Re: [PATCH V4 01/17] kconfig: Add SYSVIPC_COMPAT for all architectures
Message-ID: <YffTtHYdvZA9kGLY@infradead.org>
References: <20220129121728.1079364-1-guoren@kernel.org>
 <20220129121728.1079364-2-guoren@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220129121728.1079364-2-guoren@kernel.org>
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Guo Ren <guoren@linux.alibaba.com>, linux-parisc@vger.kernel.org,
 arnd@arndb.de, gregkh@linuxfoundation.org, drew@beagleboard.org,
 anup@brainfault.org, wangjunqiang@iscas.ac.cn, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-mips@vger.kernel.org, palmer@dabbelt.com, liush@allwinnertech.com,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 wefu@redhat.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>
