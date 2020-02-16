Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA541602FF
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Feb 2020 09:44:24 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48L0z86pfdzDr8r
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Feb 2020 19:44:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=armlinux.org.uk
 (client-ip=2001:4d48:ad52:3201:214:fdff:fe10:1be6;
 helo=pandora.armlinux.org.uk;
 envelope-from=linux+linuxppc-dev=lists.ozlabs.org@armlinux.org.uk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=armlinux.org.uk
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=armlinux.org.uk header.i=@armlinux.org.uk
 header.a=rsa-sha256 header.s=pandora-2019 header.b=eZ+pxZ5Q; 
 dkim-atps=neutral
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48L0X12LLszDqht
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 Feb 2020 19:24:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+8Uhu2wgUq8Ulq+yn7pGlyiEpl5L2cWMg1W6oSitXX8=; b=eZ+pxZ5QnjK4dWUII5qW9jbf8
 eHQaXZHQb+St/fNO4odIF1+oXNFmG9JyWOQyfNVp/YnjMm8+v9aiI+5lsbrKHrZZMx/nek8Kqd5TP
 2W8OtU17ICPE2UgLtdc9R5GSAIEv8D7oLBooYFlzt/1m+U1xt3Lrzg8xA2WrwUIRgXUZkmT5OSjiz
 v4iLBDbN3Jl9AzWwjfvTWiezYEvzjfDwRTq0N3FjcotV54dXrt1kPyxekt0I2b9RcgIp0XHoHzce1
 5fM/0Ipqg2sO442zcz74Ifmz05LfxOSewibl5FPqzdimV68xwJR331lGU1QToFVHsC5S11UIPKhv/
 xpuaPP69A==;
Received: from shell.armlinux.org.uk
 ([2001:4d48:ad52:3201:5054:ff:fe00:4ec]:41020)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1j3FCS-0001uE-Q8; Sun, 16 Feb 2020 08:22:49 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1j3FCA-0005C0-Sx; Sun, 16 Feb 2020 08:22:30 +0000
Date: Sun, 16 Feb 2020 08:22:30 +0000
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v2 00/13] mm: remove __ARCH_HAS_5LEVEL_HACK
Message-ID: <20200216082230.GV25745@shell.armlinux.org.uk>
References: <20200216081843.28670-1-rppt@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200216081843.28670-1-rppt@kernel.org>
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-sh@vger.kernel.org,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 linux-hexagon@vger.kernel.org, Will Deacon <will@kernel.org>,
 kvmarm@lists.cs.columbia.edu, Jonas Bonn <jonas@southpole.se>,
 linux-arch@vger.kernel.org, Brian Cain <bcain@codeaurora.org>,
 Marc Zyngier <maz@kernel.org>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Julien Thierry <julien.thierry.kdev@gmail.com>,
 uclinux-h8-devel@lists.sourceforge.jp, Fenghua Yu <fenghua.yu@intel.com>,
 Arnd Bergmann <arnd@arndb.de>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 kvm-ppc@vger.kernel.org,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 openrisc@lists.librecores.org, Stafford Horne <shorne@gmail.com>,
 Guan Xuetao <gxt@pku.edu.cn>, linux-arm-kernel@lists.infradead.org,
 Tony Luck <tony.luck@intel.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>,
 nios2-dev@lists.rocketboards.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Feb 16, 2020 at 10:18:30AM +0200, Mike Rapoport wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> Hi,
> 
> These patches convert several architectures to use page table folding and
> remove __ARCH_HAS_5LEVEL_HACK along with include/asm-generic/5level-fixup.h.
> 
> The changes are mostly about mechanical replacement of pgd accessors with p4d
> ones and the addition of higher levels to page table traversals.
> 
> All the patches were sent separately to the respective arch lists and
> maintainers hence the "v2" prefix.

You fail to explain why this change which adds 488 additional lines of
code is desirable.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
