Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3C521AFAE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jul 2020 08:47:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B33WF0QWlzDrMf
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jul 2020 16:47:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=casper.srs.infradead.org (client-ip=2001:8b0:10b:1236::1;
 helo=casper.infradead.org;
 envelope-from=batv+9f3021a47afaa262729b+6165+infradead.org+hch@casper.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=eEdo/Wlz; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B33TS1rphzDrHm
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jul 2020 16:45:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=+SmqHy8CMc3iuhAwtq/TSsrsRiGcdEkFZjK7CnvrgAE=; b=eEdo/Wlzp9/NMwwjgF/2faPJo5
 +sTG0Jui3RcDB0iFzSeku+tWGzALbabBaOyANtd2TBjQnOAeTFWk0UZdy21fI739vrhFN2LatLUc9
 iVxohDeteTya4EBA3M+zfpIflZmfzVltT2dJSKf7ugDRNzyW7Yyt7jo4J4YDvCmr/J/0V8BgXcowY
 6UIwBmgCAw5nA5Rx9Reyj3LweQ+DxTOGgS87jYPgr+eVpgjYbNHIL1WHgDN6DcAnVposdGRSfIwR7
 3xe85NVuDG31m8WRklA1n0KCEH5jxZ7eXIXUEOiMFmkgiCilC/3CZXQx52Ytp3Z4I2AYpHEs/SUky
 W/KInjjA==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1jtmmt-0002Sr-KP; Fri, 10 Jul 2020 06:45:35 +0000
Date: Fri, 10 Jul 2020 07:45:35 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Oliver O'Halloran <oohall@gmail.com>
Subject: Re: PowerNV PCI & SR-IOV cleanups
Message-ID: <20200710064535.GA8354@infradead.org>
References: <20200710052340.737567-1-oohall@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200710052340.737567-1-oohall@gmail.com>
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
Cc: linux-pci@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 10, 2020 at 03:23:25PM +1000, Oliver O'Halloran wrote:
> This is largely prep work for supporting VFs in the 32bit MMIO window.
> This is an unfortunate necessity due to how the Linux BAR allocator
> handles BARs marked as non-prefetchable. The distinction
> between prefetch and non-prefetchable BARs was made largely irrelevant
> with the introduction of PCIe, but the BAR allocator is overly
> conservative. It will always place non-pref bars in the prefetchable
> window, which is 32bit only. This results in us being unable to use VFs
> from NVMe drives and a few different RAID cards.

How about fixing that in the core PCI code?

(nothing against this series through, as it seems like a massive
cleanup)
