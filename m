Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 855B235AEF5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Apr 2021 17:56:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FHfjy3Pzzz3bsv
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Apr 2021 01:56:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.a=rsa-sha256 header.s=pandora-2019 header.b=c5UKjvS8;
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
 header.s=pandora-2019 header.b=c5UKjvS8; 
 dkim-atps=neutral
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FHfjR2HbDz3bSq
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Apr 2021 01:55:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CzOBLJLIpMaSm2apRythmsTcqiiwrKSDjrbInU9e0SA=; b=c5UKjvS8rNqagvElEmnq5mWQ2
 sOG6gW99tI6xwZXqcrM0Omsn7OTm2fu3665e5SLzAUZcWgmuvpx4LsuO8/sfRyv5AHrB1VxlWAb+2
 zb8sbnGIvkTUbOVv1OeaDlPYJRbaBVxn9aQ7OEXrvQXVMJ89mFmJItp1FPI6+1z4kCSLRgjYKV6Eq
 1ehY/+L/+7Sd24BuLZQuq1uqmViCX215IU2khq8hUKbTdXz6jbowwCm1+k1w9WhYpo20Mm1p3GXMQ
 lWvTKWoggbyjkpAqlg4ihTHh2CWrkU497gIFI6Q5aTR6qrgU8es4zjrms5ywWgA05k/kw4Fv0Ni50
 rysPj65UQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:52272)
 by pandora.armlinux.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <linux@armlinux.org.uk>)
 id 1lVFwk-0003Cf-AS; Sat, 10 Apr 2021 16:54:54 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1lVFwf-0005Xb-GK; Sat, 10 Apr 2021 16:54:49 +0100
Date: Sat, 10 Apr 2021 16:54:49 +0100
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: Bogus struct page layout on 32-bit
Message-ID: <20210410155449.GI1463@shell.armlinux.org.uk>
References: <20210409185105.188284-3-willy@infradead.org>
 <202104100656.N7EVvkNZ-lkp@intel.com>
 <20210410024313.GX2531743@casper.infradead.org>
 <20210410082158.79ad09a6@carbon>
 <CAC_iWjLXZ6-hhvmvee6r4R_N64u-hrnLqE_CSS1nQk+YaMQQnA@mail.gmail.com>
 <20210410140652.GY2531743@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210410140652.GY2531743@casper.infradead.org>
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
Cc: Grygorii Strashko <grygorii.strashko@ti.com>, kbuild-all@lists.01.org,
 kernel test robot <lkp@intel.com>,
 Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>,
 clang-built-linux@googlegroups.com,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 open list <linux-kernel@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Jesper Dangaard Brouer <brouer@redhat.com>, linux-fsdevel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Matteo Croce <mcroce@linux.microsoft.com>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Apr 10, 2021 at 03:06:52PM +0100, Matthew Wilcox wrote:
> How about moving the flags into the union?  A bit messy, but we don't
> have to play games with __packed__.

Yes, that is probably the better solution, avoiding the games to try
and get the union appropriately placed on 32-bit systems.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
