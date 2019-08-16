Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A3F9077E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 20:09:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 469BCq3pgJzDr84
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Aug 2019 04:09:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org; envelope-from=will@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="yclaVWCY"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 469B7Z5ZV8zDr4C
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Aug 2019 04:05:30 +1000 (AEST)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7830C20665;
 Fri, 16 Aug 2019 18:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565978727;
 bh=ATa8fe0CxhAbQASCjl6IYhzQjKdSYeQNhdmBcA2ZRlU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=yclaVWCYpQyvh9OaGQPrYfiMYsvcW/o5PkOIV7eQUmhstIzpx2ZZ0sSjiKcxqnMgv
 7z+Jikxzq4/ZIHpHnEO2nuFXbcvpn1v46HdwXjYNwayNZxp8x1aicBOflxg1CSeLTk
 vayH5O/ix+LVeWKI9G785+H8RXwq5z7rEAqzMsfo=
Date: Fri, 16 Aug 2019 19:05:22 +0100
From: Will Deacon <will@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 6/6] arm64: document the choice of page attributes for
 pgprot_dmacoherent
Message-ID: <20190816180522.gocqeayajlbu4gzp@willie-the-truck>
References: <20190816070754.15653-1-hch@lst.de>
 <20190816070754.15653-7-hch@lst.de>
 <20190816173118.4rbbzuogfamfa554@willie-the-truck>
 <20190816175942.GA4879@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190816175942.GA4879@lst.de>
User-Agent: NeoMutt/20170113 (1.7.2)
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
Cc: Shawn Anastasio <shawn@anastas.io>, linux-m68k@lists.linux-m68k.org,
 Guan Xuetao <gxt@pku.edu.cn>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 linux-mips@vger.kernel.org, iommu@lists.linux-foundation.org,
 Geert Uytterhoeven <geert@linux-m68k.org>, Paul Burton <paul.burton@mips.com>,
 Catalin Marinas <catalin.marinas@arm.com>, James Hogan <jhogan@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Aug 16, 2019 at 07:59:42PM +0200, Christoph Hellwig wrote:
> On Fri, Aug 16, 2019 at 06:31:18PM +0100, Will Deacon wrote:
> > Mind if I tweak the second sentence to be:
> > 
> >   This is different from "Device-nGnR[nE]" memory which is intended for MMIO
> >   and thus forbids speculation, preserves access size, requires strict
> >   alignment and can also force write responses to come from the endpoint.
> > 
> > ? It's a small change, but it better fits with the arm64 terminology
> > ("strongly ordered" is no longer used in the architecture).
> > 
> > If you're happy with that, I can make the change and queue this patch
> > for 5.4.
> 
> I'm fine with the change, but you really need this series as base,
> as there is no pgprot_dmacoherent before the series.  So I think I'll
> have to queue it up if we want it for 5.4, and I'll need a few more
> reviews for the other patches in this series first.

Ah, I didn't think about the contextual stuff. In which case, with my
change in wording:

Acked-by: Will Deacon <will@kernel.org>

and feel free to route it with the rest.

Thanks,

Will
