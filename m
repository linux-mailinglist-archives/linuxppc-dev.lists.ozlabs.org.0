Return-Path: <linuxppc-dev+bounces-1402-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C005979C03
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Sep 2024 09:28:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X6c2X55m1z2yLV;
	Mon, 16 Sep 2024 17:28:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:7c80:54:3::133"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726471684;
	cv=none; b=MH3P50xG9W3VVfAjtRUsAlwaxQLFUlQkx5Y9IoxgbolU+METwxfLK1N2i96EWiKbxdYrLFeusyfIhzBnw0Dq1ApZ3dlo+dRyHylvGw1g9mY1YrMcB98lFJyHA0eN1US8A09f8mYw/+2BJ4+o+bNtvfLguI56FQQpAiXrrWsIKnaOtKhD2VqY1Vd7wLyGgy4gBCcDdN32KQLrJRF3Rzyk1i0k9fA5WCGMJrvHeRsETKlTqIcAcQ//BLqWAu7jwG0KFvl+rHMAHq7VjIiiOIAy+OBtq1lfXYReT7bQahANezzt2+SzqGyrX5+NK2BIbIO6nPfl48JbbmpUQMcYijEi5A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726471684; c=relaxed/relaxed;
	bh=D0J8bq1hRTOBXFb5iovbIYDlPoQwSOXHlrwNR6EunrM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IMfbYaf5wlF5VDZpekV7HD35BvXO9EEx37ZOnNar3X9wVmjExXOJNjIWm3O9EFMV0JMx27+AzPHgmI92EJzl4Sit6mPQ0efF3zqcODTA2bYhq1gDnNT9h9C4xFTsQdQUYJOljfwHtILogujrVJWR7nfmwkIz1HTiCfSZorLStK1hspxWHvztMB+LScH4dovjGCtePuPBZS1W56iJZRdl/WNqiyrfR6wsif7s8ASVUw7Sw8t3WgYLB5+4HLBVt5x577/DYGHbGdPkxbqKSJlc2ZInADdec/6Wd8nPhkcOeqylNzDRSU4IaALNyRohGckpGYrw3Kr3jZYtFZbo2QbXOw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VGDvtlm0; dkim-atps=neutral; spf=none (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+500305f64adcbfb43b9e+7694+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VGDvtlm0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+500305f64adcbfb43b9e+7694+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X6c2V5tvvz2xk1
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Sep 2024 17:28:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=D0J8bq1hRTOBXFb5iovbIYDlPoQwSOXHlrwNR6EunrM=; b=VGDvtlm0oNGCXGmTyAJdP1L+ef
	P2O/G5PxBNyNUBgO1BYpCk1Htk8NNf/GSTaRn2wP2lFs7JJxCCctGmE8qj7WWxjP7tmX6krA/l9JA
	F5MAfTq5LXE293xygHzdQ7ogIizEcAG2SdWv4orlUnpXx4bqfr/U4vtyHPaxaCohLqMM2RKGm/9nx
	c2FHH0/AiIsGCVxnqHnoRBF3qQfTWeJ//RePFlTm7Uq6x42oo0QVIpYWPP1FZLe3WVI72mgU6yGHC
	wL9uEP/9dAepBPi3dXXdFFH44jCWLUoGeBKwsbXSiRIJ5KHz+VdpjIjgn4I6MkTy7krDQTp+q1luK
	//LQrMAw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1sq69D-00000003JTe-1CkF;
	Mon, 16 Sep 2024 07:27:47 +0000
Date: Mon, 16 Sep 2024 00:27:47 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Yosry Ahmed <yosryahmed@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Vitaly Wool <vitaly.wool@konsulko.com>,
	Miaohe Lin <linmiaohe@huawei.com>,
	Johannes Weiner <hannes@cmpxchg.org>, Nhat Pham <nphamcs@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Christoph Hellwig <hch@infradead.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Chris Down <chris@chrisdown.name>, loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mm: z3fold: deprecate CONFIG_Z3FOLD
Message-ID: <Zufd8wD1xBBJI3MN@infradead.org>
References: <20240904233343.933462-1-yosryahmed@google.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240904233343.933462-1-yosryahmed@google.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

I'd still prefer to just kill it right away, but as the second best
option I'm ok with this:

Acked-by: Christoph Hellwig <hch@lst.de>


