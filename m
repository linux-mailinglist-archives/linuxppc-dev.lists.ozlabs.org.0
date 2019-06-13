Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCD144BBF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2019 21:09:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45PtZc0mTrzDrJP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2019 05:09:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.4.51; helo=eur03-db5-obe.outbound.protection.outlook.com;
 envelope-from=horia.geanta@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="Vn/DNRcq"; 
 dkim-atps=neutral
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40051.outbound.protection.outlook.com [40.107.4.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45PtXb5t1szDrJF
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jun 2019 05:07:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jQlKILffE6R6l/RwuZWS+iuhbF3hlK94CgPoXVLz0as=;
 b=Vn/DNRcqDiTZZN/L+dD0Zf9TNP9Z/WJbIwZylOH0eVBVGdBikAg56YGd5a7P2xgvvTg11uWTa22JYIF1nEYLM5Mi6yhL+fr0AWROAe6ZMviPnoILEcYAFrwlVYwecAuzKLgFGqwWIQD/oMyJJ2aO5DukZrCo1lp4GGu2yBdP3P4=
Received: from VI1PR0402MB3485.eurprd04.prod.outlook.com (52.134.3.153) by
 VI1PR0402MB2736.eurprd04.prod.outlook.com (10.175.21.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.10; Thu, 13 Jun 2019 19:07:16 +0000
Received: from VI1PR0402MB3485.eurprd04.prod.outlook.com
 ([fe80::ccaf:f4a1:704a:e745]) by VI1PR0402MB3485.eurprd04.prod.outlook.com
 ([fe80::ccaf:f4a1:704a:e745%4]) with mapi id 15.20.1987.012; Thu, 13 Jun 2019
 19:07:16 +0000
From: Horia Geanta <horia.geanta@nxp.com>
To: Christophe Leroy <christophe.leroy@c-s.fr>, Herbert Xu
 <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH v3 2/4] crypto: talitos - fix hash on SEC1.
Thread-Topic: [PATCH v3 2/4] crypto: talitos - fix hash on SEC1.
Thread-Index: AQHVIeZZjrISGczaNEaQ63Pip1dkoQ==
Date: Thu, 13 Jun 2019 19:07:16 +0000
Message-ID: <VI1PR0402MB348595847AD2B8975A60C1D398EF0@VI1PR0402MB3485.eurprd04.prod.outlook.com>
References: <cover.1560429844.git.christophe.leroy@c-s.fr>
 <732ca0ff440bf4cd589d844cfda71d96efd500f5.1560429844.git.christophe.leroy@c-s.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=horia.geanta@nxp.com; 
x-originating-ip: [78.96.98.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 03766999-967b-4b3b-d88a-08d6f03259ee
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR0402MB2736; 
x-ms-traffictypediagnostic: VI1PR0402MB2736:
x-microsoft-antispam-prvs: <VI1PR0402MB273668A29FB7A33C200DF8BE98EF0@VI1PR0402MB2736.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0067A8BA2A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(346002)(376002)(136003)(39860400002)(366004)(189003)(199004)(91956017)(76116006)(73956011)(64756008)(66446008)(53936002)(14454004)(186003)(25786009)(66946007)(66476007)(66556008)(476003)(2906002)(3846002)(66066001)(6116002)(446003)(44832011)(86362001)(486006)(316002)(478600001)(74316002)(7736002)(55016002)(305945005)(229853002)(9686003)(6506007)(53546011)(110136005)(256004)(14444005)(54906003)(52536014)(4326008)(102836004)(71200400001)(71190400001)(33656002)(6246003)(68736007)(5660300002)(26005)(76176011)(7696005)(99286004)(81156014)(81166006)(8936002)(8676002)(6436002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0402MB2736;
 H:VI1PR0402MB3485.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: bRgfqVLT/pzHIaaFK9qV7PzBHY3lTFSuEjZXBN0dwA4KE30bYN9W3hmdJIfXGN/w6g7i2fM5vx6rRyJksmVUN4gFBR3nOwpBU0+LRNyAdJc/F5KXhbQWBPnlp5xTqEito3iEDWVI8Z8vNL4GcjIrbm046CDpPrDDr8UQxO2y04GS1DfV53fJ/4Gm/inPI/me8IrwBUuZT5i5Fhhi5Vt+ftK+RSu14LzA+/ff8hqTpHYtlbOZKhQq7ut4Hvkm+3dwRdeOQTXTckIb6W1ivcR0zoFT7vCE8LB0G34S9hm+Kgal29pI1gUgYYNgDQt3q2Lfi9bVIwERGgY5ruZBXmzPp3TZqA1LBl9NMyc4kVRyodbE2kHnGBJx/0DPzgjHbZMka1Ptiw3DwEW7REo9haE8bm7tonOPtXtxiNtCkpihySg=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03766999-967b-4b3b-d88a-08d6f03259ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2019 19:07:16.5811 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: horia.geanta@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2736
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/13/2019 3:48 PM, Christophe Leroy wrote:=0A=
> On SEC1, hash provides wrong result when performing hashing in several=0A=
> steps with input data SG list has more than one element. This was=0A=
> detected with CONFIG_CRYPTO_MANAGER_EXTRA_TESTS:=0A=
> =0A=
> [   44.185947] alg: hash: md5-talitos test failed (wrong result) on test =
vector 6, cfg=3D"random: may_sleep use_finup src_divs=3D[<reimport>25.88%@+=
8063, <flush>24.19%@+9588, 28.63%@+16333, <reimport>4.60%@+6756, 16.70%@+16=
281] dst_divs=3D[71.61%@alignmask+16361, 14.36%@+7756, 14.3%@+"=0A=
> [   44.325122] alg: hash: sha1-talitos test failed (wrong result) on test=
 vector 3, cfg=3D"random: inplace use_final src_divs=3D[<flush,nosimd>16.56=
%@+16378, <reimport>52.0%@+16329, 21.42%@alignmask+16380, 10.2%@alignmask+1=
6380] iv_offset=3D39"=0A=
> [   44.493500] alg: hash: sha224-talitos test failed (wrong result) on te=
st vector 4, cfg=3D"random: use_final nosimd src_divs=3D[<reimport>52.27%@+=
7401, <reimport>17.34%@+16285, <flush>17.71%@+26, 12.68%@+10644] iv_offset=
=3D43"=0A=
> [   44.673262] alg: hash: sha256-talitos test failed (wrong result) on te=
st vector 4, cfg=3D"random: may_sleep use_finup src_divs=3D[<reimport>60.6%=
@+12790, 17.86%@+1329, <reimport>12.64%@alignmask+16300, 8.29%@+15, 0.40%@+=
13506, <reimport>0.51%@+16322, <reimport>0.24%@+16339] dst_divs"=0A=
> =0A=
> This is due to two issues:=0A=
> - We have an overlap between the buffer used for copying the input=0A=
> data (SEC1 doesn't do scatter/gather) and the chained descriptor.=0A=
> - Data copy is wrong when the previous hash left less than one=0A=
> blocksize of data to hash, implying a complement of the previous=0A=
> block with a few bytes from the new request.=0A=
> =0A=
I fail to spot these issues.=0A=
=0A=
IIUC in case of SEC1, the variable part of talitos_edesc structure contains=
=0A=
a 2nd "chained" descriptor (talitos_desc struct) followed by an area=0A=
dedicated to linearizing the input (in case input is scattered).=0A=
=0A=
Where is the overlap?=0A=
=0A=
> Fix it by:=0A=
> - Moving the second descriptor after the buffer, as moving the buffer=0A=
> after the descriptor would make it more complex for other cipher=0A=
> operations (AEAD, ABLKCIPHER)=0A=
> - Rebuiding a new data SG list without the bytes taken from the new=0A=
> request to complete the previous one.=0A=
> =0A=
> Preceding patch ("crypto: talitos - move struct talitos_edesc into=0A=
> talitos.h") as required for this change to build properly.=0A=
> =0A=
> Fixes: 37b5e8897eb5 ("crypto: talitos - chain in buffered data for ahash =
on SEC1")=0A=
> Cc: stable@vger.kernel.org=0A=
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>=0A=
> ---=0A=
>  drivers/crypto/talitos.c | 63 ++++++++++++++++++++++++++++++------------=
------=0A=
>  1 file changed, 40 insertions(+), 23 deletions(-)=0A=
> =0A=
> diff --git a/drivers/crypto/talitos.c b/drivers/crypto/talitos.c=0A=
> index 5b401aec6c84..4f03baef952b 100644=0A=
> --- a/drivers/crypto/talitos.c=0A=
> +++ b/drivers/crypto/talitos.c=0A=
> @@ -336,15 +336,18 @@ static void flush_channel(struct device *dev, int c=
h, int error, int reset_ch)=0A=
>  	tail =3D priv->chan[ch].tail;=0A=
>  	while (priv->chan[ch].fifo[tail].desc) {=0A=
>  		__be32 hdr;=0A=
> +		struct talitos_edesc *edesc;=0A=
>  =0A=
>  		request =3D &priv->chan[ch].fifo[tail];=0A=
> +		edesc =3D container_of(request->desc, struct talitos_edesc, desc);=0A=
>  =0A=
>  		/* descriptors with their done bits set don't get the error */=0A=
>  		rmb();=0A=
>  		if (!is_sec1)=0A=
>  			hdr =3D request->desc->hdr;=0A=
>  		else if (request->desc->next_desc)=0A=
> -			hdr =3D (request->desc + 1)->hdr1;=0A=
> +			hdr =3D ((struct talitos_desc *)=0A=
> +			       (edesc->buf + edesc->dma_len))->hdr1;=0A=
>  		else=0A=
>  			hdr =3D request->desc->hdr1;=0A=
>  =0A=
> @@ -476,8 +479,14 @@ static u32 current_desc_hdr(struct device *dev, int =
ch)=0A=
>  		}=0A=
>  	}=0A=
>  =0A=
> -	if (priv->chan[ch].fifo[iter].desc->next_desc =3D=3D cur_desc)=0A=
> -		return (priv->chan[ch].fifo[iter].desc + 1)->hdr;=0A=
> +	if (priv->chan[ch].fifo[iter].desc->next_desc =3D=3D cur_desc) {=0A=
> +		struct talitos_edesc *edesc;=0A=
> +=0A=
> +		edesc =3D container_of(priv->chan[ch].fifo[iter].desc,=0A=
> +				     struct talitos_edesc, desc);=0A=
> +		return ((struct talitos_desc *)=0A=
> +			(edesc->buf + edesc->dma_len))->hdr;=0A=
> +	}=0A=
>  =0A=
>  	return priv->chan[ch].fifo[iter].desc->hdr;=0A=
>  }=0A=
> @@ -1402,15 +1411,11 @@ static struct talitos_edesc *talitos_edesc_alloc(=
struct device *dev,=0A=
>  	edesc->dst_nents =3D dst_nents;=0A=
>  	edesc->iv_dma =3D iv_dma;=0A=
>  	edesc->dma_len =3D dma_len;=0A=
> -	if (dma_len) {=0A=
> -		void *addr =3D &edesc->link_tbl[0];=0A=
> -=0A=
> -		if (is_sec1 && !dst)=0A=
> -			addr +=3D sizeof(struct talitos_desc);=0A=
> -		edesc->dma_link_tbl =3D dma_map_single(dev, addr,=0A=
> +	if (dma_len)=0A=
> +		edesc->dma_link_tbl =3D dma_map_single(dev, &edesc->link_tbl[0],=0A=
>  						     edesc->dma_len,=0A=
>  						     DMA_BIDIRECTIONAL);=0A=
> -	}=0A=
> +=0A=
>  	return edesc;=0A=
>  }=0A=
>  =0A=
> @@ -1722,14 +1727,16 @@ static void common_nonsnoop_hash_unmap(struct dev=
ice *dev,=0A=
>  	struct talitos_private *priv =3D dev_get_drvdata(dev);=0A=
>  	bool is_sec1 =3D has_ftr_sec1(priv);=0A=
>  	struct talitos_desc *desc =3D &edesc->desc;=0A=
> -	struct talitos_desc *desc2 =3D desc + 1;=0A=
> +	struct talitos_desc *desc2 =3D (struct talitos_desc *)=0A=
> +				     (edesc->buf + edesc->dma_len);=0A=
>  =0A=
>  	unmap_single_talitos_ptr(dev, &edesc->desc.ptr[5], DMA_FROM_DEVICE);=0A=
>  	if (desc->next_desc &&=0A=
>  	    desc->ptr[5].ptr !=3D desc2->ptr[5].ptr)=0A=
>  		unmap_single_talitos_ptr(dev, &desc2->ptr[5], DMA_FROM_DEVICE);=0A=
>  =0A=
> -	talitos_sg_unmap(dev, edesc, req_ctx->psrc, NULL, 0, 0);=0A=
> +	if (req_ctx->psrc)=0A=
> +		talitos_sg_unmap(dev, edesc, req_ctx->psrc, NULL, 0, 0);=0A=
>  =0A=
>  	/* When using hashctx-in, must unmap it. */=0A=
>  	if (from_talitos_ptr_len(&edesc->desc.ptr[1], is_sec1))=0A=
> @@ -1796,7 +1803,6 @@ static void talitos_handle_buggy_hash(struct talito=
s_ctx *ctx,=0A=
>  =0A=
>  static int common_nonsnoop_hash(struct talitos_edesc *edesc,=0A=
>  				struct ahash_request *areq, unsigned int length,=0A=
> -				unsigned int offset,=0A=
>  				void (*callback) (struct device *dev,=0A=
>  						  struct talitos_desc *desc,=0A=
>  						  void *context, int error))=0A=
> @@ -1835,9 +1841,7 @@ static int common_nonsnoop_hash(struct talitos_edes=
c *edesc,=0A=
>  =0A=
>  	sg_count =3D edesc->src_nents ?: 1;=0A=
>  	if (is_sec1 && sg_count > 1)=0A=
> -		sg_pcopy_to_buffer(req_ctx->psrc, sg_count,=0A=
> -				   edesc->buf + sizeof(struct talitos_desc),=0A=
> -				   length, req_ctx->nbuf);=0A=
> +		sg_copy_to_buffer(req_ctx->psrc, sg_count, edesc->buf, length);=0A=
>  	else if (length)=0A=
>  		sg_count =3D dma_map_sg(dev, req_ctx->psrc, sg_count,=0A=
>  				      DMA_TO_DEVICE);=0A=
> @@ -1850,7 +1854,7 @@ static int common_nonsnoop_hash(struct talitos_edes=
c *edesc,=0A=
>  				       DMA_TO_DEVICE);=0A=
>  	} else {=0A=
>  		sg_count =3D talitos_sg_map(dev, req_ctx->psrc, length, edesc,=0A=
> -					  &desc->ptr[3], sg_count, offset, 0);=0A=
> +					  &desc->ptr[3], sg_count, 0, 0);=0A=
>  		if (sg_count > 1)=0A=
>  			sync_needed =3D true;=0A=
>  	}=0A=
> @@ -1874,7 +1878,8 @@ static int common_nonsnoop_hash(struct talitos_edes=
c *edesc,=0A=
>  		talitos_handle_buggy_hash(ctx, edesc, &desc->ptr[3]);=0A=
>  =0A=
>  	if (is_sec1 && req_ctx->nbuf && length) {=0A=
> -		struct talitos_desc *desc2 =3D desc + 1;=0A=
> +		struct talitos_desc *desc2 =3D (struct talitos_desc *)=0A=
> +					     (edesc->buf + edesc->dma_len);=0A=
>  		dma_addr_t next_desc;=0A=
>  =0A=
>  		memset(desc2, 0, sizeof(*desc2));=0A=
> @@ -1895,7 +1900,7 @@ static int common_nonsnoop_hash(struct talitos_edes=
c *edesc,=0A=
>  						      DMA_TO_DEVICE);=0A=
>  		copy_talitos_ptr(&desc2->ptr[2], &desc->ptr[2], is_sec1);=0A=
>  		sg_count =3D talitos_sg_map(dev, req_ctx->psrc, length, edesc,=0A=
> -					  &desc2->ptr[3], sg_count, offset, 0);=0A=
> +					  &desc2->ptr[3], sg_count, 0, 0);=0A=
>  		if (sg_count > 1)=0A=
>  			sync_needed =3D true;=0A=
>  		copy_talitos_ptr(&desc2->ptr[5], &desc->ptr[5], is_sec1);=0A=
> @@ -2006,7 +2011,6 @@ static int ahash_process_req(struct ahash_request *=
areq, unsigned int nbytes)=0A=
>  	struct device *dev =3D ctx->dev;=0A=
>  	struct talitos_private *priv =3D dev_get_drvdata(dev);=0A=
>  	bool is_sec1 =3D has_ftr_sec1(priv);=0A=
> -	int offset =3D 0;=0A=
>  	u8 *ctx_buf =3D req_ctx->buf[req_ctx->buf_idx];=0A=
>  =0A=
>  	if (!req_ctx->last && (nbytes + req_ctx->nbuf <=3D blocksize)) {=0A=
> @@ -2046,6 +2050,9 @@ static int ahash_process_req(struct ahash_request *=
areq, unsigned int nbytes)=0A=
>  			sg_chain(req_ctx->bufsl, 2, areq->src);=0A=
>  		req_ctx->psrc =3D req_ctx->bufsl;=0A=
>  	} else if (is_sec1 && req_ctx->nbuf && req_ctx->nbuf < blocksize) {=0A=
> +		int offset;=0A=
> +		struct scatterlist *sg;=0A=
> +=0A=
>  		if (nbytes_to_hash > blocksize)=0A=
>  			offset =3D blocksize - req_ctx->nbuf;=0A=
>  		else=0A=
> @@ -2058,7 +2065,18 @@ static int ahash_process_req(struct ahash_request =
*areq, unsigned int nbytes)=0A=
>  		sg_copy_to_buffer(areq->src, nents,=0A=
>  				  ctx_buf + req_ctx->nbuf, offset);=0A=
>  		req_ctx->nbuf +=3D offset;=0A=
> -		req_ctx->psrc =3D areq->src;=0A=
> +		for (sg =3D areq->src; sg && offset >=3D sg->length;=0A=
> +		     offset -=3D sg->length, sg =3D sg_next(sg))=0A=
> +			;=0A=
> +		if (offset) {=0A=
> +			sg_init_table(req_ctx->bufsl, 2);=0A=
> +			sg_set_buf(req_ctx->bufsl, sg_virt(sg) + offset,=0A=
> +				   sg->length - offset);=0A=
> +			sg_chain(req_ctx->bufsl, 2, sg_next(sg));=0A=
> +			req_ctx->psrc =3D req_ctx->bufsl;=0A=
> +		} else {=0A=
> +			req_ctx->psrc =3D sg;=0A=
> +		}=0A=
>  	} else=0A=
>  		req_ctx->psrc =3D areq->src;=0A=
>  =0A=
> @@ -2098,8 +2116,7 @@ static int ahash_process_req(struct ahash_request *=
areq, unsigned int nbytes)=0A=
>  	if (ctx->keylen && (req_ctx->first || req_ctx->last))=0A=
>  		edesc->desc.hdr |=3D DESC_HDR_MODE0_MDEU_HMAC;=0A=
>  =0A=
> -	return common_nonsnoop_hash(edesc, areq, nbytes_to_hash, offset,=0A=
> -				    ahash_done);=0A=
> +	return common_nonsnoop_hash(edesc, areq, nbytes_to_hash, ahash_done);=
=0A=
>  }=0A=
>  =0A=
>  static int ahash_update(struct ahash_request *areq)=0A=
> =0A=
