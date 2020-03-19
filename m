Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CB03318AA47
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 02:20:19 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48jTc1010rzDr6y
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 12:20:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48jTZH3NqszDr80
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Mar 2020 12:18:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=DgG2coG3; dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1003)
 id 48jTZH1vPMz9sRY; Thu, 19 Mar 2020 12:18:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1584580727; bh=VBieu84jNex4rf5tZCk5leIvZLK6i0Bff/OLnlxA9T4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DgG2coG3tgVzln8eQ/SgNhMogSqvTPY3N3uiHpcH/A+KRoVNBJ3N9mRGRpQ7NQwzA
 9pQJa0xQwoYYXXo/15vUEuZk5qC7NioVEwWD4ScSroMECAskVrw8XUoTUFCPcJJzID
 KvbGqhTb/YBK/EbQ3Gn9c2ceCL1yVgnfNz/Y85Cp64+e6vP1S8jc+McdM87pi/LVSD
 nIO6UrSemKVKVcPVGcL5JUUR+2TnzQTvXz4Ezi+DkZjCnHwA02s2SSL4pYAmRRIg7C
 ml2JyfbsM37Kh89bFaqjTv4Ib8tJ2lAOWAkIeQIg3fwv6NujhHfWuQzUBGuUmhaGI3
 KjVJE3N09CZog==
Date: Thu, 19 Mar 2020 12:18:41 +1100
From: Paul Mackerras <paulus@ozlabs.org>
To: Joe Perches <joe@perches.com>
Subject: Re: [PATCH -next 016/491] KERNEL VIRTUAL MACHINE FOR POWERPC
 (KVM/powerpc): Use fallthrough;
Message-ID: <20200319011840.GA5033@blackberry>
References: <cover.1583896344.git.joe@perches.com>
 <37a5342c67e1b68b9ad06aca8da245b0ff409692.1583896348.git.joe@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <37a5342c67e1b68b9ad06aca8da245b0ff409692.1583896348.git.joe@perches.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 10, 2020 at 09:51:30PM -0700, Joe Perches wrote:
> Convert the various uses of fallthrough comments to fallthrough;
> 
> Done via script
> Link: https://lore.kernel.org/lkml/b56602fcf79f849e733e7b521bb0e17895d390fa.1582230379.git.joe.com/
> 
> Signed-off-by: Joe Perches <joe@perches.com>

The subject line should look like "KVM: PPC: Use fallthrough".

Apart from that,

Acked-by: Paul Mackerras <paulus@ozlabs.org>

How are these patches going upstream?  Do you want me to take this via
my tree?

Paul.
