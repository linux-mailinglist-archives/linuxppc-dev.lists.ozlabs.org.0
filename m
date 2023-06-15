Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EACCD730DDC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jun 2023 06:03:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=V3ABeDfP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QhTDR5yWyz3bXM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jun 2023 14:03:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QhTCS6KcQz2ykB
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jun 2023 14:02:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=TFa/2y42vPdnrt5HKTbpePexHTJHRVp+0npwJc2abgM=; b=V3ABeDfPH+xIUy8xoXoap/cPT7
	39qjo8k3/nXZy8C9KuvWU8pltoi2TOU/WAp7PMql1RSCH2rDwkFvMdj68cLpPOEOkzgPE0wPJs1T8
	mwtLjG3GePSfjIj830q4WSPTDOyNr5WOruxgm7Kb6Gzn5AHfzbl1vLVGdUdGR3RDYUGnexKson1Zw
	y9OLJ+DwKqZW98f3SAA5BS3elYXLJEgU9aEY1EgKD5Z9UDwtHbK35AEsKlf6KsJgICgVUEUsDFFFO
	bODSotqrbCE6j+qG8okVPsCtZHVqi2aS49LwcbYUSCBwYwMxtTjXnDtSSvxV50qzqwYslP1r4iCEZ
	NURNtPog==;
Received: from [2601:1c2:980:9ec0::2764]
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1q9eBv-00DXVD-34;
	Thu, 15 Jun 2023 04:02:35 +0000
Message-ID: <4ebd2741-1788-dc05-2d04-448f3fea17ab@infradead.org>
Date: Wed, 14 Jun 2023 21:02:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH net-next] eth: fs_enet: fix print format for resource size
Content-Language: en-US
To: Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net
References: <20230615035231.2184880-1-kuba@kernel.org>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230615035231.2184880-1-kuba@kernel.org>
Content-Type: text/plain; charset=UTF-8
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
Cc: netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 6/14/23 20:52, Jakub Kicinski wrote:
> Randy forwarded report from Stephen that on PowerPC:

Stephen forwarded report from Randy?

netdev & pantelis were cc-ed...

> drivers/net/ethernet/freescale/fs_enet/mii-fec.c: In function 'fs_enet_mdio_probe':
> drivers/net/ethernet/freescale/fs_enet/mii-fec.c:130:50: warning: format '%x' expects argument of type 'unsigned int', but argument 4 has type 'resource_size_t' {aka 'long long unsigned int'} [-Wformat=]
>   130 |         snprintf(new_bus->id, MII_BUS_ID_SIZE, "%x", res.start);
>       |                                                 ~^   ~~~~~~~~~
>       |                                                  |      |
>       |                                                  |      resource_size_t {aka long long unsigned int}
>       |                                                  unsigned int
>       |                                                 %llx
> 
> Use the right print format.
> 
> Untested, I can't repro this warning myself. With or without
> the patch mpc512x_defconfig builds just fine.
> 
> Link: https://lore.kernel.org/all/8f9f8d38-d9c7-9f1b-feb0-103d76902d14@infradead.org/
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
> CC: Randy Dunlap <rdunlap@infradead.org>
> CC: pantelis.antoniou@gmail.com
> CC: linuxppc-dev@lists.ozlabs.org

I'm using gcc-12.2.0.

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

Thanks.

> 
> Targeting net-next as I can't repro this, and I don't
> see recent changes which could cause this problem.
> So maybe it's something in linux-next... ?
> In any case res is a struct resource so patch shouldn't hurt.
> ---
>  drivers/net/ethernet/freescale/fs_enet/mii-fec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/freescale/fs_enet/mii-fec.c b/drivers/net/ethernet/freescale/fs_enet/mii-fec.c
> index d37d7a19a759..59a8f0bd0f5c 100644
> --- a/drivers/net/ethernet/freescale/fs_enet/mii-fec.c
> +++ b/drivers/net/ethernet/freescale/fs_enet/mii-fec.c
> @@ -127,7 +127,7 @@ static int fs_enet_mdio_probe(struct platform_device *ofdev)
>  	if (ret)
>  		goto out_res;
>  
> -	snprintf(new_bus->id, MII_BUS_ID_SIZE, "%x", res.start);
> +	snprintf(new_bus->id, MII_BUS_ID_SIZE, "%pap", &res.start);
>  
>  	fec->fecp = ioremap(res.start, resource_size(&res));
>  	if (!fec->fecp) {

-- 
~Randy
