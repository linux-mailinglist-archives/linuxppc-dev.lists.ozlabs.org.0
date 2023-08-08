Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE882774217
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 19:33:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=QAe4q24k;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RL0fN3ZQkz3bZr
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Aug 2023 03:33:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=QAe4q24k;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=geoff@infradead.org; receiver=lists.ozlabs.org)
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RL0dN15qNz2yhP
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Aug 2023 03:32:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=H4KnvWUgvi3LsDxgjze5WSJwUO0zv/U5QpcYXEsZsDQ=; b=QAe4q24k+cS/lG8y6UhWFdP9Of
	qZl4qF5NrnuC4VJo6b2v9pz0aTbn+msg78xSm3BXZ+06w/F+66acDXcU2t79VkT4UNW/tPAHdr+hN
	Lh+/dM2b/lL7kAEdZRh5kw5etq3qV6kf3WLzHUnqa3Tdq/oPJGx2Ze7y2bpaPk1o4J63UFGkwk9vB
	HrbXkCWcERfIsf4aFGN3bY9lGO9ay0ZStySZqCRwVvd/uiVMOJ6vfmVjoEYDtqAfQqHaKTVfQIX8u
	SISe4qWnRSUuEvvfAtlwyos1JLvkACMofuEB5cEynsyWLSmtUOituSpr0r1MBrHRYReRfcWlVcKsT
	TtT3jhZw==;
Received: from 108-90-42-56.lightspeed.sntcca.sbcglobal.net ([108.90.42.56] helo=[192.168.1.80])
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qTQZA-004wq0-36;
	Tue, 08 Aug 2023 17:32:21 +0000
Message-ID: <0a0249e9-c408-696c-1ee1-c74b053c488b@infradead.org>
Date: Tue, 8 Aug 2023 10:32:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH -next] net/ps3_gelic_net: Use ether_addr_to_u64() to
 convert ethernet address
To: Li Zetao <lizetao1@huawei.com>, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, mpe@ellerman.id.au, npiggin@gmail.com,
 christophe.leroy@csgroup.eu
References: <20230808114050.4034547-1-lizetao1@huawei.com>
Content-Language: en-US
From: Geoff Levand <geoff@infradead.org>
In-Reply-To: <20230808114050.4034547-1-lizetao1@huawei.com>
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
Cc: netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On 8/8/23 04:40, Li Zetao wrote:
> Use ether_addr_to_u64() to convert an Ethernet address into a u64 value,
> instead of directly calculating, as this is exactly what
> this function does.
> 
> Signed-off-by: Li Zetao <lizetao1@huawei.com>
> ---
>  drivers/net/ethernet/toshiba/ps3_gelic_net.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)

I tested this on PS3 and it seems to be working OK.
Thanks for your contribution.

Tested-by: Geoff Levand <geoff@infradead.org>

