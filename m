Return-Path: <linuxppc-dev+bounces-6349-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFE9A3BD77
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Feb 2025 12:52:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YyZWH015Tz2yRM;
	Wed, 19 Feb 2025 22:52:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739965930;
	cv=none; b=ZPw2uGqcwi3LP7XCA8NFMqmgcibJYieVJoqrrn1H6iHWDV7EV5sJd98c2/dBcAGWL7dSA+OfZhEKKW5XvuAqhAa3Me4+7RMn38thhkEqgbz71uzoNE4zGcNQGDDzw47WPbNbmEOH79GfydETu3UAA26NqIJhZKXKpUjdLfdcyoq0ZoVqWLkcIqMUTZ3X/X+/4qnUcd/3F6MU0rqpcyOIbVU6qTw4d6IPjX5zYNHoZNEgVfJAy0Cg+ULJVjxYHKLvwtFOQ/fHNEjMnayoi5xgBFSMy4KtPKUIqwrkYZPE/It0/FIFI6BGC33uZY9DvuNRrjLGnZC7aXhD5LNLWsyPdg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739965930; c=relaxed/relaxed;
	bh=teFEEY27X3Zb4o9qYoLcaC3DWikKd25qT1PCi5W3oTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FC1Ejpvf1Tq/4LkRgp4iL61ABa+yI6UpLEkoQ1yxb7Kbo73on3ZcyYKEq75q2dUp/9m2O2RkF/OpRVxP1aeasLYTZIA4b20T5sium53SA+40rBdq2/AvAgwzMBc+EUr1b3BFgobplVC4AALWw2JORvyXu4DnKrabgW7pVSA0toOO4aDF0v6WNh1NArRNePAVnFQLVehXbKhSvjJ6dkk7Qv/wbDFODa+Tg3omhp7pjd4PwSsqdZ75bT//QGgNvHTmTAr96RRYR88qP2Ak+x04ANfX/WtvqyfQrI+lkh8sTzoLzmqAklc4XOWAXW6E61F0aKhtcj8KwzkdCmqVcRRcnw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=cmarinas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=cmarinas@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YyZWF5Dblz2xFm
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Feb 2025 22:52:09 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3E51DA41E00;
	Wed, 19 Feb 2025 11:50:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C01EC4CED1;
	Wed, 19 Feb 2025 11:52:03 +0000 (UTC)
Date: Wed, 19 Feb 2025 11:52:01 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-mm@kvack.org, Ryan Roberts <ryan.roberts@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-snps-arc@lists.infradead.org, linux-riscv@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-parisc@vger.kernel.org,
	linux-csky@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-s390@vger.kernel.org, linux-arch@vger.kernel.org,
	loongarch@lists.linux.dev, linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/ioremap: Pass pgprot_t to ioremap_prot() instead of
 unsigned long
Message-ID: <Z7XF4Y3FIbSrSP9u@arm.com>
References: <20250218101954.415331-1-anshuman.khandual@arm.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218101954.415331-1-anshuman.khandual@arm.com>
X-Spam-Status: No, score=1.9 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,SUSPICIOUS_RECIPS
	autolearn=disabled version=4.0.0
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Feb 18, 2025 at 03:49:54PM +0530, Anshuman Khandual wrote:
> From: Ryan Roberts <ryan.roberts@arm.com>
> 
> ioremap_prot() currently accepts pgprot_val parameter as an unsigned long,
> thus implicitly assuming that pgprot_val and pgprot_t could never be bigger
> than unsigned long. But this assumption soon will not be true on arm64 when
> using D128 pgtables. In 128 bit page table configuration, unsigned long is
> 64 bit, but pgprot_t is 128 bit.
> 
> Passing platform abstracted pgprot_t argument is better as compared to size
> based data types. Let's change the parameter to directly pass pgprot_t like
> another similar helper generic_ioremap_prot().
> 
> Without this change in place, D128 configuration does not work on arm64 as
> the top 64 bits gets silently stripped when passing the protection value to
> this function.
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-snps-arc@lists.infradead.org
> Cc: linux-riscv@lists.infradead.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-parisc@vger.kernel.org
> Cc: linux-csky@vger.kernel.org
> Cc: linux-mips@vger.kernel.org
> Cc: linux-s390@vger.kernel.org
> Cc: linux-arch@vger.kernel.org
> Cc: loongarch@lists.linux.dev
> Cc: linux-sh@vger.kernel.org
> Cc: linux-mm@kvack.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> Co-developed-by: Anshuman Khandual <anshuman.khandual@arm.com>
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>

For arm64:

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

