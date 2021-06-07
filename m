Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9266139D8F4
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Jun 2021 11:38:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fz7bc4Nwcz3bsF
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Jun 2021 19:38:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.a=rsa-sha256 header.s=pandora-2019 header.b=cetr6/k8;
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
 header.s=pandora-2019 header.b=cetr6/k8; 
 dkim-atps=neutral
X-Greylist: delayed 372 seconds by postgrey-1.36 at boromir;
 Mon, 07 Jun 2021 19:38:08 AEST
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fz7b45rsTz2xZm
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Jun 2021 19:38:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MlvkgxFcyawWgLbaD1anFAhejhA4mPswAd0WEOPLbd0=; b=cetr6/k8ZHIlURSNkBDEkxOd3
 puNo+HwooQUeJn9AaPBl4regJ9NkcXwohGBb5OPUoX7XTTODh5d6IsuhC8Hnw3taLmVn0F8+4hF1o
 ArioCmyKCJRUZ5c5W9Ct8Cw0Zpb4xNWdK87xHBWnc3daFNyrTg9aLL7A/E6TbbFPNgdTXMtoLpPh1
 VNTboFgYQtPgYxGziLgboqSm+C9rc0zETM+h5ZE5kg+2kGPOkoZAIe8MZfd5JZNTDNazJFXr/S6Gm
 YDi+dqX3d1L4b71QKMOqk7jvcXPp8QSgQdX3C28GtCjdiTWKtuBWWAYuFwAi7GnVSCXRZB8Zx7iVW
 ALDutps2w==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:44784)
 by pandora.armlinux.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <linux@armlinux.org.uk>)
 id 1lqBbS-0000Eu-Fv; Mon, 07 Jun 2021 10:31:26 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1lqBbN-0005oE-UB; Mon, 07 Jun 2021 10:31:21 +0100
Date: Mon, 7 Jun 2021 10:31:21 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2 00/15] init_mm: cleanup ARCH's text/data/brk setup code
Message-ID: <20210607093121.GC22278@shell.armlinux.org.uk>
References: <20210604070633.32363-1-wangkefeng.wang@huawei.com>
 <YL0+Jargm+y9aqx1@kernel.org>
 <481056ab-686e-9f42-3b8a-b31941f58af6@huawei.com>
 <006eb573-5a20-1ac7-6234-338d11346a08@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <006eb573-5a20-1ac7-6234-338d11346a08@csgroup.eu>
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
Cc: uclinux-h8-devel@lists.sourceforge.jp, linux-s390@vger.kernel.org,
 Kefeng Wang <wangkefeng.wang@huawei.com>, linux-sh@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org, linux-mm@kvack.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 linux-arm-kernel@lists.infradead.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-snps-arc@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 07, 2021 at 07:48:54AM +0200, Christophe Leroy wrote:
> Hi Kefeng,
> 
> What you could do is to define a __weak function that architectures can
> override and call that function from mm_init() as suggested by Mike,

The problem with weak functions is that they bloat the kernel. Each
time a weak function is overriden, it becomes dead unreachable code
within the kernel image.

At some point we're probabily going to have to enable -ffunction-sections
to (hopefully) allow the dead code to be discarded.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
