Return-Path: <linuxppc-dev+bounces-3043-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 25BC89C1A70
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Nov 2024 11:30:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XlFZB5965z3btP;
	Fri,  8 Nov 2024 21:30:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731061810;
	cv=none; b=e9j8yAtblKdHi6+R5ftr0VF1O5njVpt43nWMj02WWNjsPBrL6jys0/Uu6FpR+HepIJb4H7z1CLVZdNqzgKxKjOkWlz7FfAxu5Kr7TDjpL2AtVFEpGjHLXGoSQRmMEIY62VE1joMN3szSXo6qKOOlCjhF1arJBtLKMNE0r44x2k5OdySjfL0FcdKlWquxOKbUKeKEBHcuLpO7oVE3sXn0jjN01Ha9ETV2GpJmt+M125S9LPdhMQQXNcxmTzMedwTNXPp2CKfM+Tt2yPBZ8XrUZhPPXXYk63hqoQxxx0wg6dqhKKMWbGU55H8iNvVQVwjHKBFjvQzFmH0iQ/0Uh/HAiA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731061810; c=relaxed/relaxed;
	bh=Jd3Tzh4DhNuNlp8FHczsMLB0F+lGlS+M9oMpTJZ41zY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f7ljtawayV/wYMf0BbkyrG/a3Gwi+UOkwRfjvgdQ/YtWEPVZ2gbk8GxzfX5Jnin3BYsFOZJSPGXVHtaA8NFARZqEEj2PE/d1TfVCfsPiBPsW9Md1A6p5CJJsnvcXrp1ebKBRbBooYCXYsiy4kxDemOMhl/h5UdEaaRAt2Up3w5t6D4JX3qyi+HKrM9uqYmK36n8CDm4SPl4Gx18hrShrMorlh4Q22ER1FzfE/htMUYIznmpOOh6tu8ol3c3Mi/ekZKRm8iToWKqlp1JS9ne0MZwGbcn+LTj0IwtYvqpFRHKmj2vjch3hzRFC7kQTJXtDGqtZ95CpjT8FY9tWVXJhXQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XlFZ842kNz3bcW
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Nov 2024 21:30:07 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4XlFZ20sT5z9sSR;
	Fri,  8 Nov 2024 11:30:02 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v0IgesT6yvwB; Fri,  8 Nov 2024 11:30:02 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4XlFZ14LVSz9rvV;
	Fri,  8 Nov 2024 11:30:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 5B07E8B781;
	Fri,  8 Nov 2024 11:30:01 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id ff_n68pslpCE; Fri,  8 Nov 2024 11:30:01 +0100 (CET)
Received: from [192.168.232.253] (unknown [192.168.232.253])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D7FE48B77A;
	Fri,  8 Nov 2024 11:30:00 +0100 (CET)
Message-ID: <2010cc7a-7f49-4c5b-b684-8e08ff8d17ed@csgroup.eu>
Date: Fri, 8 Nov 2024 11:30:00 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: drivers/net/ethernet/freescale/ucc_geth.c:2454:64: sparse:
 sparse: incorrect type in argument 1 (different address spaces)
To: Linus Walleij <linus.walleij@linaro.org>,
 kernel test robot <lkp@intel.com>,
 "linuxppc-dev@lists.ozlabs.org list" <linuxppc-dev@lists.ozlabs.org>,
 netdev <netdev@vger.kernel.org>
Cc: Stanislav Kinsburskii <stanislav.kinsburskii@gmail.com>,
 oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>
References: <202410301531.7Vr9UkCn-lkp@intel.com>
 <CACRpkdbW5kheaWPzKip9ucEwK2uv+Cmf5SwT1necfa3Ynct6Ag@mail.gmail.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <CACRpkdbW5kheaWPzKip9ucEwK2uv+Cmf5SwT1necfa3Ynct6Ag@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 08/11/2024 à 09:18, Linus Walleij a écrit :
> On Wed, Oct 30, 2024 at 8:05 AM kernel test robot <lkp@intel.com> wrote:
> 
>> tree:   https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git&data=05%7C02%7Cchristophe.leroy2%40cs-soprasteria.com%7C5a1ff6cef1f642fba00a08dcffce0903%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638666507603442752%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=2dgpku3%2BPjovwZxpedYowAAB%2BR%2FeyxOc0Ys3kE0KK6E%3D&reserved=0 master
>> head:   c1e939a21eb111a6d6067b38e8e04b8809b64c4e
>> commit: b28d1ccf921a4333be14017d82066386d419e638 powerpc/io: Expect immutable pointer in virt_to_phys() prototype
> 
> Ugh Stanislav do you have ideas around this one?
> 
>>     drivers/net/ethernet/freescale/ucc_geth.c:244:21: sparse:     got restricted __be32 [noderef] __iomem *
>>     drivers/net/ethernet/freescale/ucc_geth.c:405:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short volatile [noderef] [usertype] __iomem *addr @@     got restricted __be16 [noderef] [usertype] __iomem * @@
> 
> They all look the same, it's from this:
> 
> static void set_mac_addr(__be16 __iomem *reg, u8 *mac)
> {
>      out_be16(&reg[0], ((u16)mac[5] << 8) | mac[4]);
>      out_be16(&reg[1], ((u16)mac[3] << 8) | mac[2]);
>      out_be16(&reg[2], ((u16)mac[1] << 8) | mac[0]);
> }
> 
> Is it simply that we need a paranthesis extra around the thing casted
> to (u16) else it becomes u32?

Not at all. The one you point here are:

drivers/net/ethernet/freescale/ucc_geth.c:405:22: warning: incorrect 
type in argument 1 (different base types)
drivers/net/ethernet/freescale/ucc_geth.c:405:22:    expected unsigned 
short volatile [noderef] [usertype] __iomem *addr
drivers/net/ethernet/freescale/ucc_geth.c:405:22:    got restricted 
__be16 [noderef] [usertype] __iomem *
drivers/net/ethernet/freescale/ucc_geth.c:406:22: warning: incorrect 
type in argument 1 (different base types)
drivers/net/ethernet/freescale/ucc_geth.c:406:22:    expected unsigned 
short volatile [noderef] [usertype] __iomem *addr
drivers/net/ethernet/freescale/ucc_geth.c:406:22:    got restricted 
__be16 [noderef] [usertype] __iomem *
drivers/net/ethernet/freescale/ucc_geth.c:407:22: warning: incorrect 
type in argument 1 (different base types)
drivers/net/ethernet/freescale/ucc_geth.c:407:22:    expected unsigned 
short volatile [noderef] [usertype] __iomem *addr
drivers/net/ethernet/freescale/ucc_geth.c:407:22:    got restricted 
__be16 [noderef] [usertype] __iomem *
drivers/net/ethernet/freescale/ucc_geth.c:449:23: warning: incorrect 
type in argument 1 (different base types)
drivers/net/ethernet/freescale/ucc_geth.c:449:23:    expected restricted 
__be16 [noderef] [usertype] __iomem *reg
drivers/net/ethernet/freescale/ucc_geth.c:449:23:    got unsigned short 
[noderef] __iomem *

The problem is the __be16 in the function prototype.

	set_mac_addr(&p_82xx_addr_filt->taddr.h, p_enet_addr);

p_82xx_addr_filt->taddr.h is a u16
and out_be16() expects a u16*

So the following fixes the above warnings:

diff --git a/drivers/net/ethernet/freescale/ucc_geth.c 
b/drivers/net/ethernet/freescale/ucc_geth.c
index ab421243a419..bbfc289dd73c 100644
--- a/drivers/net/ethernet/freescale/ucc_geth.c
+++ b/drivers/net/ethernet/freescale/ucc_geth.c
@@ -400,7 +400,7 @@ static void put_enet_addr_container(struct 
enet_addr_container *enet_addr_cont)
  	kfree(enet_addr_cont);
  }

-static void set_mac_addr(__be16 __iomem *reg, u8 *mac)
+static void set_mac_addr(u16 __iomem *reg, u8 *mac)
  {
  	out_be16(&reg[0], ((u16)mac[5] << 8) | mac[4]);
  	out_be16(&reg[1], ((u16)mac[3] << 8) | mac[2]);



For the other ones, most of them are because out_beXX() expects uXX* not 
__beXX *.

It looks like the warnings go away if you replace out_be32() by 
iowrite32be(), which has been possible since commit 894fa235eb4c 
("powerpc: inline iomap accessors") (out_beXX/in_beXX should anyway not 
be used outside arch/powerpc/):

diff --git a/drivers/net/ethernet/freescale/ucc_geth.c 
b/drivers/net/ethernet/freescale/ucc_geth.c
index ab421243a419..625b58b3efc8 100644
--- a/drivers/net/ethernet/freescale/ucc_geth.c
+++ b/drivers/net/ethernet/freescale/ucc_geth.c
@@ -241,12 +241,12 @@ static struct sk_buff *get_new_skb(struct 
ucc_geth_private *ugeth,
  		    (((unsigned)skb->data) & (UCC_GETH_RX_DATA_BUF_ALIGNMENT -
  					      1)));

-	out_be32(&((struct qe_bd __iomem *)bd)->buf,
+	iowrite32be(
  		      dma_map_single(ugeth->dev,
  				     skb->data,
  				     ugeth->ug_info->uf_info.max_rx_buf_length +
  				     UCC_GETH_RX_DATA_BUF_ALIGNMENT,
-				     DMA_FROM_DEVICE));
+				     DMA_FROM_DEVICE), &((struct qe_bd __iomem *)bd)->buf);

  	out_be32((u32 __iomem *)bd,
  			(R_E | R_I | (in_be32((u32 __iomem*)bd) & R_W)));


Christophe

