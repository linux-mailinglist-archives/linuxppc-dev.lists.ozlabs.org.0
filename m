Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A50361572
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 00:23:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FLv4G6PDzz3bsN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 08:23:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=G7souXSd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=willy@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=G7souXSd; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FLv3p639Yz2yy3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 08:22:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=yCQQJkhIcMUmiG+jHzQ5AkwvKN7ARCVTOi/VwlhPfFg=; b=G7souXSd1HEpHpbqWUh5lxEnqG
 72yPOet6m6dISSd7axpLwF1GuIay1RV/45F6tKEj6BDbJeHO2gR22kOlntma0FZZPbcvmmD/MXrGS
 ZotJA+5b3Jkfa2AaHAwGam44BVigQtO2OUUWx5K1MxtG1pZ5CiucXxAz7iHzXIdBtZHCcO6t1Akn0
 Jf6e7BP75Cnv6p6VHUjizlw9iKFlwP1TXfBnuT7H8BBwGli/+jYj8lop4Y87z4ime9iPQZllplUcx
 wCGblTZ9lVpuPqcW+hkdOWg1I0lN04CeqlSLB7/d6d7euI/yXPCIGsLBBIFSox+o2XhR8MFrZidLv
 V60jL89w==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lXANH-0099VJ-Ux; Thu, 15 Apr 2021 22:22:19 +0000
Date: Thu, 15 Apr 2021 23:22:11 +0100
From: Matthew Wilcox <willy@infradead.org>
To: David Laight <David.Laight@aculab.com>
Subject: Re: [PATCH 1/1] mm: Fix struct page layout on 32-bit systems
Message-ID: <20210415222211.GG2531743@casper.infradead.org>
References: <20210411103318.GC2531743@casper.infradead.org>
 <20210412011532.GG2531743@casper.infradead.org>
 <20210414101044.19da09df@carbon>
 <20210414115052.GS2531743@casper.infradead.org>
 <20210414211322.3799afd4@carbon>
 <20210414213556.GY2531743@casper.infradead.org>
 <a50c3156fe8943ef964db4345344862f@AcuMS.aculab.com>
 <20210415200832.32796445@carbon>
 <20210415182155.GD2531743@casper.infradead.org>
 <5179a01a462f43d6951a65de2a299070@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5179a01a462f43d6951a65de2a299070@AcuMS.aculab.com>
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
Cc: Arnd Bergmann <arnd@kernel.org>,
 Grygorii Strashko <grygorii.strashko@ti.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Jesper Dangaard Brouer <brouer@redhat.com>,
 Matteo Croce <mcroce@linux.microsoft.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Christoph Hellwig <hch@lst.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 15, 2021 at 09:11:56PM +0000, David Laight wrote:
> Isn't it possible to move the field down one long?
> This might require an explicit zero - but this is not a common
> code path - the extra write will be noise.

Then it overlaps page->mapping.  See emails passim.
