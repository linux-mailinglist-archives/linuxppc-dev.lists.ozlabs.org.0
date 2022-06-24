Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F76555908E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 07:12:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LTlbt2nGKz3fLm
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 15:12:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2GQmE4wp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+825a24a2c69d0abd218e+6879+infradead.org+hch@bombadil.srs.infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2GQmE4wp;
	dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LTlb85Xczz3f8Y
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jun 2022 15:11:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=; b=2GQmE4wpGszBczHjwvtfZyfMa6
	QogWMdymTjPg5XZOUhXij8uvDIrmHLPTalVWmgMeJy2PeomTEabCD8eIZNj8Bhzhu6VGbhWH+ghNJ
	sWSwU1GSy7ksgPL/29ADir39+i3q/Q4DXasGhFBp+UAZ/3ss24jHWpscbqhPKzoBBqB2m86CCUwt4
	r/U4PSNRJY2DRagOfbocXVwxuCa7Owx8jsWAgbqIsvfHCh2d7j2ZPKNzmnybdSuW8CVKwgGxxm4JV
	hqzEdK/brFNnhKm5V8hP87B7M1yEwoRUUTkU2GXcA4HfUVVqA8KREKrKm3hHI05sz9HDImIYrFGE+
	D9iMxPcA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4bbK-000VKF-OJ; Fri, 24 Jun 2022 05:11:26 +0000
Date: Thu, 23 Jun 2022 22:11:26 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH V4 26/26] mm/mmap: Drop ARCH_HAS_VM_GET_PAGE_PROT
Message-ID: <YrVHfuWsRCDq8yWm@infradead.org>
References: <20220624044339.1533882-1-anshuman.khandual@arm.com>
 <20220624044339.1533882-27-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220624044339.1533882-27-anshuman.khandual@arm.com>
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-csky@vger.kernel.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org, x86@kernel.org, hch@infradead.org, linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org, linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org, linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org, linux-alpha@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>
