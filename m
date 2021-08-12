Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 985643EA4D0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Aug 2021 14:43:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GlmZD3cb5z3bWT
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Aug 2021 22:43:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.a=rsa-sha256 header.s=pandora-2019 header.b=BIIYYrXJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=armlinux.org.uk
 (client-ip=2001:4d48:ad52:32c8:5054:ff:fe00:142; helo=pandora.armlinux.org.uk;
 envelope-from=linux+linuxppc-dev=lists.ozlabs.org@armlinux.org.uk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.a=rsa-sha256
 header.s=pandora-2019 header.b=BIIYYrXJ; 
 dkim-atps=neutral
Received: from pandora.armlinux.org.uk (unknown
 [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GlmYQ6Bfjz2yYJ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Aug 2021 22:42:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xC/TZD3ZIXMs1cMiTUUAC6x6j656qE6poOPOz0bbgp4=; b=BIIYYrXJ3Ew+Z1Zm5diqSi/De
 z9wV3zfjmSLaZp7CLzV+GZVzZq7gHn4aYTS+otHAxBF57P3sG+08JwSPBCdCFZWJ+W/a7Uq2nG6dR
 Ha2YFBjZclMZJYIiXKlQ1gLB8ZCdS8B9uEW3WbpCbGK0H/IdQLdkF8gVEx0au/w4sNkwsnJxOlaJN
 3F0T/x1fYsMd3E4PDbHDx53iR0C3e0RKKbXsP6YegqA39Ad4vclW52rD2Iu/mHbjVJqRpkjlhVtux
 jBq7gk1O4Rj655JZe+cFH0MNa946zYFR94AnA24dA5R1E6RDmcUCiw2sBMgZdt0NLZen6d2vGXuXM
 pATOPCJUw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:47224)
 by pandora.armlinux.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <linux@armlinux.org.uk>)
 id 1mEA24-0002Bw-KA; Thu, 12 Aug 2021 13:42:00 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1mEA1l-00049N-O0; Thu, 12 Aug 2021 13:41:41 +0100
Date: Thu, 12 Aug 2021 13:41:41 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: Re: [PATCH -next] trap: Cleanup trap_init()
Message-ID: <20210812124141.GY22278@shell.armlinux.org.uk>
References: <20210812123602.76356-1-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210812123602.76356-1-wangkefeng.wang@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Paul Walmsley <palmerdabbelt@google.com>,
 "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 linux-riscv@lists.infradead.org,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Jonas Bonn <jonas@southpole.se>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-hexagon@vger.kernel.org, Helge Deller <deller@gmx.de>,
 Ley Foon Tan <ley.foon.tan@intel.com>, Vineet Gupta <vgupta@kernel.org>,
 linux-snps-arc@lists.infradead.org, uclinux-h8-devel@lists.sourceforge.jp,
 Jeff Dike <jdike@addtoit.com>, linux-um@lists.infradead.org,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Richard Weinberger <richard@nod.at>, openrisc@lists.librecores.org,
 Stafford Horne <shorne@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 12, 2021 at 08:36:02PM +0800, Kefeng Wang wrote:
> There are some empty trap_init() in different ARCHs, introduce
> a new weak trap_init() function to cleanup them.
> 
> Cc: Vineet Gupta <vgupta@kernel.org>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> Cc: Ley Foon Tan <ley.foon.tan@intel.com>
> Cc: Jonas Bonn <jonas@southpole.se>
> Cc: Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
> Cc: Stafford Horne <shorne@gmail.com>
> Cc: James E.J. Bottomley <James.Bottomley@HansenPartnership.com>
> Cc: Helge Deller <deller@gmx.de>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Paul Walmsley <palmerdabbelt@google.com>
> Cc: Jeff Dike <jdike@addtoit.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Anton Ivanov <anton.ivanov@cambridgegreys.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>

For 32-bit arm:

Acked-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
