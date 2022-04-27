Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C4FFB5124E2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Apr 2022 23:58:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KpXgD5HTZz3bqd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Apr 2022 07:58:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=cPgytBH9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org;
 envelope-from=geoff@infradead.org; receiver=<UNKNOWN>)
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KpXfT3T5Qz2xlF
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Apr 2022 07:57:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=eCju4//7j32RLgojrAV7AzFnehTLEosjViFNjaYFxJA=; b=cPgytBH93sOtCvDS65FEwRabXb
 YRCUB5+xPwYsnIFrKUcZxNHdKOnIp96JMLalu58M2rDhumq5ZJdsIRemIAlPGejUDhq2P6CFHwyNh
 YW3G4iEgwfK/SqgjU0ByPaVl7rwSerqsChFLlaB0ILGMMK3jJt9ZtpZoto7tJrVztgerUPqaHnaur
 91Tzbf5BX6zDwHajm2qMuYIu5F79+IVLde7+EPb3NxifJjh67RDnI3BGiKn6TTWVPGhFju4araZ2B
 kqTy4AFNeNaz0MzlvBWWpJSjR63lOYebgSZev81eXtD1xZ2frmzZKgnDT9ruSgfr7WTWgkchU6+m0
 rLkso31A==;
Received: from [2602:306:c5a2:a380:b27b:25ff:fe2c:51a8]
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njpeX-009AoX-E8; Wed, 27 Apr 2022 21:56:53 +0000
Message-ID: <5892767a-bbab-097b-2776-e4cd35abf289@infradead.org>
Date: Wed, 27 Apr 2022 14:56:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH net-next 13/14] eth: spider: remove a copy of the
 NAPI_POLL_WEIGHT define
Content-Language: en-US
To: Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net, pabeni@redhat.com
References: <20220427154111.529975-1-kuba@kernel.org>
 <20220427154111.529975-14-kuba@kernel.org>
From: Geoff Levand <geoff@infradead.org>
In-Reply-To: <20220427154111.529975-14-kuba@kernel.org>
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Jakub,

On 4/27/22 08:41, Jakub Kicinski wrote:
> Defining local versions of NAPI_POLL_WEIGHT with the same
> values in the drivers just makes refactoring harder.

> --- a/drivers/net/ethernet/toshiba/spider_net.c
> +++ b/drivers/net/ethernet/toshiba/spider_net.c
>  
>  	netif_napi_add(netdev, &card->napi,
> -		       spider_net_poll, SPIDER_NET_NAPI_WEIGHT);
> +		       spider_net_poll, NAPI_POLL_WEIGHT);

This seems fine. Both SPIDER_NET_NAPI_WEIGHT and NAPI_POLL_WEIGHT
are defined as 64.  Thanks for your contribution.

Acked-by: Geoff Levand <geoff@infradead.org>
