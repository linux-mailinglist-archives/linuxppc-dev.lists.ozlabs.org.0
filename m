Return-Path: <linuxppc-dev+bounces-1731-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A3698D3FC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Oct 2024 15:06:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XJZnP4jXbz2xjY;
	Wed,  2 Oct 2024 23:06:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4190:8020::34"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727874376;
	cv=none; b=Gylt+vWDKCrEFLKQLpxHFbP+WTYNcxZKEjMVwaoIWn0GUkcmyUZB5ACLCQC1g3jlJpXvYz/LfIx/UoxWkRQSXAtBQMy3M8iQ3nso0esfrXMJgz0QM6fm2OtCf5CKYN7cCHb55ehMfQVnYpWYP0D5ImwASDXLSjQlR1w1AfEU6X63xPWmB5IbiRLSlhokOpW4qoc17DAcu3HWt4/Yr1EBK8GwUAAaLwOjOF+lwX3W27LTkvU504MOFMSwJAUuStyNvoQEDPmmIS1mf4FkxEWo3C6FvsyyOfskvqZcaSuE1kvA38itnUseuOraEWwNduDFSDGZYT15RIO3aC2EmxINzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727874376; c=relaxed/relaxed;
	bh=VMgZZjpqlweueoTskiiNASMtWbDOXevJ3YnVLQGOIM8=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=JZBhkPDBzPYJfgyWauPDCu3sOgrPWTMzvLJGogRijsprRFhoI3wdcYeI6cx1TkTSiv6ogbbn2tb7V5T6ilhS34j+Xrz/EytOJaaCoP1FruQVme5xWiHFAm+bJ9j+LIW3Xu0HZdHh+LawajJKZYnu1cYxeaWDFUfCUUl4LswUZd9Fzucaj2INXEWKqeUuWKAYwknLtN5BxNidWGn1N6TfAnAg4/VDnh6vu/SBRkAm1nsqwQxgl241usIhh29Kb7F9P4w8v2gGqEP6rh38O/CO/1RVrYudxX3sMyKXKR7RgtrqQGxzcGWU5oucjkuU0Om1mn8lBx6OCY955zbOI49Ygw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none (client-ip=2001:4190:8020::34; helo=angie.orcam.me.uk; envelope-from=macro@orcam.me.uk; receiver=lists.ozlabs.org) smtp.mailfrom=orcam.me.uk
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=orcam.me.uk (client-ip=2001:4190:8020::34; helo=angie.orcam.me.uk; envelope-from=macro@orcam.me.uk; receiver=lists.ozlabs.org)
X-Greylist: delayed 466 seconds by postgrey-1.37 at boromir; Wed, 02 Oct 2024 23:06:15 AEST
Received: from angie.orcam.me.uk (angie.orcam.me.uk [IPv6:2001:4190:8020::34])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XJZnM654fz2xHt
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Oct 2024 23:06:15 +1000 (AEST)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 85BA792009C; Wed,  2 Oct 2024 14:58:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 80B1792009B;
	Wed,  2 Oct 2024 13:58:15 +0100 (BST)
Date: Wed, 2 Oct 2024 13:58:15 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Matthew W Carlis <mattc@purestorage.com>
cc: alex.williamson@redhat.com, Bjorn Helgaas <bhelgaas@google.com>, 
    "David S. Miller" <davem@davemloft.net>, david.abdurachmanov@gmail.com, 
    edumazet@google.com, helgaas@kernel.org, kuba@kernel.org, leon@kernel.org, 
    linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
    linux-rdma@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, lukas@wunner.de, 
    mahesh@linux.ibm.com, mika.westerberg@linux.intel.com, 
    netdev@vger.kernel.org, npiggin@gmail.com, oohall@gmail.com, 
    pabeni@redhat.com, pali@kernel.org, saeedm@nvidia.com, sr@denx.de, 
    Jim Wilson <wilson@tuliptree.org>
Subject: Re: PCI: Work around PCIe link training failures
In-Reply-To: <20241001210446.14547-1-mattc@purestorage.com>
Message-ID: <alpine.DEB.2.21.2410021355540.45128@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2408160312180.59022@angie.orcam.me.uk> <20241001210446.14547-1-mattc@purestorage.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=0.0 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	SPF_HELO_NONE,SPF_NONE autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, 1 Oct 2024, Matthew W Carlis wrote:

> I just wanted to follow up with our testing results for the mentioned
> patches. It took me a while to get them running in our test pool, but
> we just got it going yesterday and the initial results look really good.
> We will continue running them in our testing from now on & if any issues
> come up I'll try to report them, but otherwise I wanted to say thank you
> for entertaining the discussion & reacting so quickly with new patches.

 My pleasure.  I'm glad that the solution works for you.  Let me know if 
you need anything else.

  Maciej

