Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F8A2D4CF8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Dec 2020 22:36:54 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Crr3R3H9JzDqvL
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 08:36:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=UhR87/9/; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Crr19689ZzDqp7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Dec 2020 08:34:53 +1100 (AEDT)
Date: Wed, 9 Dec 2020 15:34:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607549691;
 bh=Ijxjlj4lL8UE+hp25kexw4TgoGCcQA02I64k1WeFKrw=;
 h=From:To:Cc:Subject:In-Reply-To:From;
 b=UhR87/9/SGHGsxnhTZM+hwkTVKtTVWVCfjhLkZ4gVTJ0V/BucF92vAzxs3XYqaVUh
 9LnRCv7JNdM4tA5qqQt5+u3OEOJjxPxpNP0YUJs5gzX3zYEhOhii1vio+F9KwapVAT
 x95HYpilhT8X0umpXgc4tt1wIUwKq9+HcOrgwDk6Jh5sVGvPFmZiYgEvKXwzSzKZ0a
 /e+jlGom0maC7iFIY10cPdyyaq11fmQrsoDwGNR8cyvh+AibQ1nyGYfWmY48r0aD7X
 kjxCKedr/NRi11USZD0vCSzi5lGK/fizZ7Nlk/cvxSfRbpUqrJAFj9YdJxeAtLvHZ8
 Qs3rcDwNBgc5Q==
From: Bjorn Helgaas <helgaas@kernel.org>
To: Vladimir Oltean <olteanv@gmail.com>
Subject: Re: [PATCH v6 0/5] PCI: Unify ECAM constants in native PCI Express
 drivers
Message-ID: <20201209213449.GA2546712@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201209212017.vx7dps3jasjcwg6j@skbuf>
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
Cc: kw@linux.com, heiko@sntech.de, shawn.lin@rock-chips.com,
 Alexandru Marginean <alexm.osslist@gmail.com>, paulus@samba.org,
 thomas.petazzoni@bootlin.com, jonnyc@amazon.com, toan@os.amperecomputing.com,
 will@kernel.org, robh@kernel.org, lorenzo.pieralisi@arm.com,
 michal.simek@xilinx.com, linux-rockchip@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org,
 linux-pci@vger.kernel.org, rjui@broadcom.com, f.fainelli@gmail.com,
 linux-rpi-kernel@lists.infradead.org, Jonathan.Cameron@huawei.com,
 bhelgaas@google.com, jonathan.derrick@intel.com, sbranden@broadcom.com,
 wangzhou1@hisilicon.com, Michael Walle <michael@walle.cc>,
 rrichter@marvell.com, linuxppc-dev@lists.ozlabs.org, nsaenzjulienne@suse.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Dec 09, 2020 at 11:20:17PM +0200, Vladimir Oltean wrote:
> On Wed, Dec 09, 2020 at 02:59:13PM -0600, Bjorn Helgaas wrote:
> > Yep, that's the theory.  Thanks for testing it!
> 
> Testing what? I'm not following.

You posted a patch that you said fixed the bug for you.  The fix is
exactly the theory we've been discussing, so you have already verified
that the theory is correct.

I'm sure Krzysztof will update his patch, and we'll get this tidied up
in -next again.

Bjorn
