Return-Path: <linuxppc-dev+bounces-3248-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E429F9CDDE7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Nov 2024 12:58:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XqbCN6ZNXz30P0;
	Fri, 15 Nov 2024 22:58:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=144.6.53.87
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731671936;
	cv=none; b=G86EVGg5F9jvYlDfZcnCY/CKLzbyjsVuCKNJ2hCbcm5if3FYF4TcTmk/bDCZtg8AxBSF+L26pMqDxiWG79C98SDu86ohc38TO3oeAiThrtKMOHOObhpgruqY168ZIZ7RuPO4p6NkSgu4C1pb1d210HqyfCPZ/42n0Rou4JIZBh5gtnTDpuiPmwB335C+y+SUU3P1q8cLz1V+eT4ElUCSyOIYr5bNJbFzCmXKrh/hBCVS9fg8ffHPtimPTcfN8hsxZYckkgqB4pBwwVbd4dU5I6uC3m0bVry8gNgfirOfz0yZXAZC3ns2wq9O9GFaj6TanNW7PJxfBtm4PQP5rNDFEg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731671936; c=relaxed/relaxed;
	bh=NGU5s3opX+e5iKfvFr/JVesdrrLYW5WBHbO4M/nZ16w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ue+NzcgXntHBSVRX/igvioEYZLpdxKmjJHThsoBS4pEJzLfV82Z8OcSpyY7GP85jDwLybC5i5LucVr7NsZvgu7xVt7TE38BNbIQJ2vqcZb2AydQan+S12HtH4TrLB3jx1VyDNUe8MjXgT1FfuWYx6VZ0wzbdDsN9JIVM8YswZfOa4GGd+FVpRCz6D7JNjcEjHvpcnCfhz3RW1ihLBz3ImSkk7lFV36AIweo0N8acmZvm/6MIDBu/JL5XjUM2892ZVdimv9W9CHW0I4U+gO/tESDOwbhmpg8FezEtQbtEE2T0TQbl/6gt7GpeBe11T0Wy1Kzu138vdoU+JfW6SjYe3A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=Ktpojc2+; dkim-atps=neutral; spf=pass (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org) smtp.mailfrom=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=Ktpojc2+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gondor.apana.org.au (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org)
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XqbCN0Zpdz2yMP
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2024 22:58:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=NGU5s3opX+e5iKfvFr/JVesdrrLYW5WBHbO4M/nZ16w=; b=Ktpojc2+xjy4ljKZXiA5mDlNFW
	9hWzg4YYeIMwDtAKVIS96sJHDFrDQGr6SzD6yUeTOkm6EoiKBoC8pGBcIH5Oc5uIFhXJfZklo9BPf
	d1HAANJFsKJ7Aen0CdqxM17EFwBixCD7kiEPxRcVXJr8KRyjyzmDTlVNDt14nmgIedPEbOXsfXooJ
	KL0ReMjRVDMj/E6E4xYmej5KOuliGhb8ARksPlUDbtYoHNTEu8XoRXa1X8x1zreX7Bf1la9DE5/OS
	K+I8y96S6aw8HmXZgVEhdX7umTO6Ouut+yc0IcVN0I3OEYRTC/ifbGAIk9fBysDjhf/B/08QHWD86
	VNwhss8w==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1tBuyT-00H20Q-1u;
	Fri, 15 Nov 2024 19:58:54 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 15 Nov 2024 19:58:53 +0800
Date: Fri, 15 Nov 2024 19:58:53 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Michal Suchanek <msuchanek@suse.de>
Cc: linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Danny Tsen <dtsen@linux.ibm.com>, linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org, Nicolai Stange <nstange@suse.com>
Subject: Re: [PATCH] aes-gcm-p10: Use the correct bit to test for P10
Message-ID: <Zzc3fcx3AZd6ZF-c@gondor.apana.org.au>
References: <20240923133040.4630-3-dtsen@linux.ibm.com>
 <20241106121019.25629-1-msuchanek@suse.de>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241106121019.25629-1-msuchanek@suse.de>
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Nov 06, 2024 at 01:09:33PM +0100, Michal Suchanek wrote:
> A hwcap feature bit is passed to cpu_has_feature, resulting in testing
> for CPU_FTR_MMCRA instead of the 3.1 platform revision.
> 
> Fixes: c954b252dee9 ("crypto: powerpc/p10-aes-gcm - Register modules as SIMD")
> Reported-by: Nicolai Stange <nstange@suse.com>
> Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> ---
>  arch/powerpc/crypto/aes-gcm-p10-glue.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

