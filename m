Return-Path: <linuxppc-dev+bounces-12062-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3353B543A3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Sep 2025 09:16:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNQhQ4GxDz3cjX;
	Fri, 12 Sep 2025 17:16:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:7c80:54:3::133"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757661382;
	cv=none; b=NNMF5GNgv0+NdA4fyjFCwSmctuNQthvT86Kxkw601ltXfGQwb7Ab7+xGhcDJ+zVaNn7Cqs3MinjInw5sN9eR9R9Rpz+KVRo7p7DvZPJQNcs2pM3adior8oIzKgUT6/STQaPKJ2Sna622U9U0jVe/dWbXauRJoik8vPnnGhw6DjVsOPo12bnslwNJf4t77FbVWvvwG6O41E+PEwEUe0SSZswuNUz6lV8n3uhvffYBIDlNsERlBWFh4sVTbPw3b5+T26VITatYuSbmydMmhwBuREkeuJc+mCMtd4jn28OYVesRndZu11V2lwxch6V/VvbExbWvSekB44kIZ2+S6e0T8w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757661382; c=relaxed/relaxed;
	bh=3/n9SGc6OsjPKesM5H3ouqWipf+GF/dcMnurs7h8nT0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q8LMsvKRxS3NvII6dTHTPSCfJxOIhSiW8DI+/r35E9/sk9LHl9oxe86BxKhaePmiragXWhZXVBCP6x4Wa0WSx0JWHeee+pcXGdrgmPAWkQRu/OQS2rxoCcbDzWTJnN4upwgi5zjHBD7+q/u0Dqo9MbGRRisGl+xe5dLaKD2OGHVzvcGrGCAlYFUW9hkGIf/8sNsDz/LW5yweDNtW1vAnaWcu0aYcPl5Vr6RgdfCYpvGtPRayIXXshV91Ef3Di234ZTMwhPAkr4QvNpb3rIlgLtHMfI8+ijTVgCBkfKb9ujtB8RqYNug/cs+08bEBX7fuPqLqpFFF17GTsS5d0b0M8Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WSZ3Ukb7; dkim-atps=neutral; spf=none (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+d02feecc4ea9d134cd76+8055+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WSZ3Ukb7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+d02feecc4ea9d134cd76+8055+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cNQhM26cmz3chy
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Sep 2025 17:16:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=3/n9SGc6OsjPKesM5H3ouqWipf+GF/dcMnurs7h8nT0=; b=WSZ3Ukb7JOM/0gb6iMeOJRkdr/
	IkuTP5lHusFQtNtQ0tluCnGQZJguY8M7zMgHH93eJjZ7EFn3R2M2z50roAbrXvk57e/nHr3EvBNIF
	PKIMZvCEPJlkwi9pgJUEvuhQa9cgbjOxZYAY0EAyq0TSUfUhCIvFKQ7Oc3ENOFpc+Y4+3jUarbCGl
	+Iz9s65qDwsrqylXpY6tMryEDyAJruobQVZMDP1BJoidL+vIXXeQ6tKZbPVqiVYqcoe8MboMPYc/g
	6GlrIFhTokNZjCWMvdfv9yxdFh0bDayDRyZKIO4fP4NJj/HMWEwu39YdRQlSHfqLPxbff8wF+Uj/i
	NamH8QxQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwy13-00000007b2z-0fAC;
	Fri, 12 Sep 2025 07:16:17 +0000
Date: Fri, 12 Sep 2025 00:16:17 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Cc: linux-fsdevel@vger.kernel.org, riteshh@linux.ibm.com,
	ojaswin@linux.ibm.com, linux-xfs@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: [linux-next20250911]Kernel OOPs while running generic/256 on
 Pmem device
Message-ID: <aMPIwdleUCUMFPh2@infradead.org>
References: <8957c526-d05c-4c0d-bfed-0eb6e6d2476c@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8957c526-d05c-4c0d-bfed-0eb6e6d2476c@linux.ibm.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Sep 12, 2025 at 10:51:18AM +0530, Venkat Rao Bagalkote wrote:
> Greetings!!!
> 
> 
> IBM CI has reported a kernel crash, while running generic/256 test case on
> pmem device from xfstests suite on linux-next20250911 kernel.

Given that this in memcg code you probably want to send this to linux-mm
and the cgroups list.

