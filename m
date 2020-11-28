Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E3B2C70A6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Nov 2020 20:39:01 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ck1yT1RHwzDrRC
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Nov 2020 06:38:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=kuba@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=GRfGr7Rs; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ck1wB45hSzF0mR
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Nov 2020 06:36:58 +1100 (AEDT)
Received: from kicinski-fedora-pc1c0hjn.DHCP.thefacebook.com
 (c-67-180-217-166.hsd1.ca.comcast.net [67.180.217.166])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0E23021527;
 Sat, 28 Nov 2020 19:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606592215;
 bh=c1x2VcILF4zR3MrshwEk2bDeOnWYpbs+y6qDeQ6KUus=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GRfGr7Rsp5EHCuDMUjcuQXQrQzvJqpRDGPnYhTHYbAOwRTCvNbJzBPXJu5bIEY6hK
 7O2kalbqiakzUmGjJE1vGxR5DkAUykD8ZOHG/s6+soZOg/4dEPffwYFvjInnOmbRbQ
 J0Rk5Q6Dxsw+KJ9No3/jUm7AD25/v7CDQ9bxAVv4=
Date: Sat, 28 Nov 2020 11:36:54 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] powerpc: fix the allyesconfig build
Message-ID: <20201128113654.4f2dcabe@kicinski-fedora-pc1c0hjn.DHCP.thefacebook.com>
In-Reply-To: <20201128162054.575aea29@canb.auug.org.au>
References: <20201128122819.32187696@canb.auug.org.au>
 <20201127175642.45502b20@kicinski-fedora-pc1c0hjn.DHCP.thefacebook.com>
 <20201128162054.575aea29@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Salil Mehta <salil.mehta@huawei.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, linux-clk@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Huazhong Tan <tanhuazhong@huawei.com>,
 Yunsheng Lin <linyunsheng@huawei.com>, Yisen Zhuang <yisen.zhuang@huawei.com>,
 Joel Stanley <joel@jms.id.au>, netdev@vger.kernel.org,
 PowerPC <linuxppc-dev@lists.ozlabs.org>, "David S.
 Miller" <davem@davemloft.net>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 28 Nov 2020 16:20:54 +1100 Stephen Rothwell wrote:
> On Fri, 27 Nov 2020 17:56:42 -0800 Jakub Kicinski <kuba@kernel.org> wrote:
> >
> > What's the offending structure in hisilicon? I'd rather have a look
> > packing structs with pointers in 'em sounds questionable.
> > 
> > I only see these two:
> > 
> > $ git grep packed drivers/net/ethernet/hisilicon/
> > drivers/net/ethernet/hisilicon/hns/hnae.h:struct __packed hnae_desc {
> > drivers/net/ethernet/hisilicon/hns3/hns3_enet.h:struct __packed hns3_desc {  
> 
> struct hclge_dbg_reg_type_info which is 28 bytes long due to the
> included struct struct hclge_dbg_reg_common_msg (which is 12 bytes
> long).  They are surrounded by #pragma pack(1)/pack().
> 
> This forces the 2 pointers in each second array element of
> hclge_dbg_reg_info[] to be 4 byte aligned (where pointers are 8 bytes
> long on PPC64).

Ah! Thanks, I don't see a reason for these to be packed. 
Looks  like an accident, there is no reason to pack anything 
past struct hclge_dbg_reg_common_msg AFAICT.

Huawei folks, would you mind sending a fix if the analysis is correct?
