Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 080E86341AD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Nov 2022 17:40:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NGqk36SG5z3ccv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Nov 2022 03:40:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=lMpGWyMN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=geoff@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=lMpGWyMN;
	dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NGqj6031zz3c5w
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Nov 2022 03:39:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=zlnWwWyuJzePEoAKK8voPt9LaS882cfk1wH3b90GorY=; b=lMpGWyMNffvl68KHZ0puQRpaTo
	vAsjEW0TXHXnk2/KFpAOaRxvfq7pSMAg6wZl5Ynnl8ThZANvWKlIWkvFP55yQNrjpbPqrlHZfuisS
	aCRLO4mIHnFuoaNTTzTMvzJUtQwP/xmzQl+tUOGr/pGcz3SP1qdCEXW0SIGaHd0rZUZI60sxppMcB
	MiM6/4F5V86IcHW7s0b81JoFOmvQbmzwNSq1FI4o/FkScjVQKQexDOEtiW751PnOs+T7sg4jqg2V8
	6ifiQCfpTUGSTl0f66cmIzrL6EeBB13CxU9rS64+U61uqHTGVFY3DpHsT/hdqtDlB3/rkxpGkERVx
	hLpBwyJA==;
Received: from 108-90-42-56.lightspeed.sntcca.sbcglobal.net ([108.90.42.56] helo=[192.168.1.80])
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxWIg-006YGS-Gt; Tue, 22 Nov 2022 16:39:10 +0000
Message-ID: <5ed29ecb-1ab9-061b-664b-fd380ba77005@infradead.org>
Date: Tue, 22 Nov 2022 08:39:00 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] powerpc/ps3: mark ps3_system_bus_type static
To: Christoph Hellwig <hch@lst.de>, mpe@ellerman.id.au, npiggin@gmail.com
References: <20221122072225.423432-1-hch@lst.de>
Content-Language: en-US
From: Geoff Levand <geoff@infradead.org>
In-Reply-To: <20221122072225.423432-1-hch@lst.de>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christoph,

On 11/21/22 23:22, Christoph Hellwig wrote:
> ps3_system_bus_type is only used inside of system-bus.c, so remove
> the external declaration and the very outdated comment next to it.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/powerpc/include/asm/ps3.h          | 4 ----
>  arch/powerpc/platforms/ps3/system-bus.c | 2 +-
>  2 files changed, 1 insertion(+), 5 deletions(-)

I tested this applied to v6.1-rc6 and it seems to be OK.  Thanks
for submitting.

Acked-by: Geoff Levand <geoff@infradead.org>



