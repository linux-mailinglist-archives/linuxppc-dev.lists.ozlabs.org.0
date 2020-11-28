Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 549922C6E4F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Nov 2020 02:58:04 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CjZQK0dKtzDrqB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Nov 2020 12:58:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=kuba@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=eyGi6E7S; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CjZNt1h0gzDrRc
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Nov 2020 12:56:46 +1100 (AEDT)
Received: from kicinski-fedora-pc1c0hjn.DHCP.thefacebook.com (unknown
 [163.114.132.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4095D205CA;
 Sat, 28 Nov 2020 01:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606528603;
 bh=/AovefSgiuRd31XQmOS9AF0RmkmpI91VIqcfw8fNgrs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=eyGi6E7SuDO9386oUKVGSEG0ez4gj4XwGK1MXMIIBR10TbpbwZW/QZxXYjTWrSnVv
 InuCJ+n6w8PcTBzD19rySO9XHash+x59TTm3R/lPFnr14vItgN3okP/vw//a+w2B6P
 yTvYXOIB9+KeTZcFtW6bq59ill7Ot+GqJY0bXQvI=
Date: Fri, 27 Nov 2020 17:56:42 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] powerpc: fix the allyesconfig build
Message-ID: <20201127175642.45502b20@kicinski-fedora-pc1c0hjn.DHCP.thefacebook.com>
In-Reply-To: <20201128122819.32187696@canb.auug.org.au>
References: <20201128122819.32187696@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
 linux-renesas-soc@vger.kernel.org, Yisen Zhuang <yisen.zhuang@huawei.com>,
 Joel Stanley <joel@jms.id.au>, netdev@vger.kernel.org,
 PowerPC <linuxppc-dev@lists.ozlabs.org>, "David S.
 Miller" <davem@davemloft.net>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 28 Nov 2020 12:28:19 +1100 Stephen Rothwell wrote:
> There are 2 drivers that have arrays of packed structures that contain
> pointers that end up at unaligned offsets.  These produce warnings in
> the PowerPC allyesconfig build like this:
>=20
> WARNING: 148 bad relocations
> c00000000e56510b R_PPC64_UADDR64   .rodata+0x0000000001c72378
> c00000000e565126 R_PPC64_UADDR64   .rodata+0x0000000001c723c0
>=20
> They are not drivers that are used on PowerPC (I assume), so mark them
> to not be built on PPC64 when CONFIG_RELOCATABLE is enabled.

=F0=9F=98=B3=F0=9F=98=B3

What's the offending structure in hisilicon? I'd rather have a look
packing structs with pointers in 'em sounds questionable.

I only see these two:

$ git grep packed drivers/net/ethernet/hisilicon/
drivers/net/ethernet/hisilicon/hns/hnae.h:struct __packed hnae_desc {
drivers/net/ethernet/hisilicon/hns3/hns3_enet.h:struct __packed hns3_desc {
