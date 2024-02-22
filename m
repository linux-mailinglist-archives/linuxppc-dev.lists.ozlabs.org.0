Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A61185F1DB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Feb 2024 08:24:15 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=sxFGqYjM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TgPld0V07z3dSv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Feb 2024 18:24:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=sxFGqYjM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=geoff@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TgPkt6xLKz30fp
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Feb 2024 18:23:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=qK+2MaZFtcEDhEaWdoLRlOAD4pAHu2LPjRADBtfdHbU=; b=sxFGqYjMuCWZPr4RlDWt+cqv7f
	qzljRBv4zqwhAg/LgXloVt35JBpbUBM3Rtahv5G3i9+Zi+qeBeFBqwkNmhAijpZvlq5pPs82BhBWv
	RrRNvum3/SNH1UPNYEfgxLGt7TrSE/R0esLDOESLw8pA6MOjJ3nOrgaOdi0oBUfrBZ/Vi32jjPNJ1
	Fh5jcvJ5UcjyU+MlAySGzd7raq+/v6nAZseaPg65SeBL6HBAz1/XL5PrTEFcKg+EdS40UApIZARu6
	cMVhqlZgEmqRVnAYgM0kBX428ZNQ/sFXHHIvJpPDtE1It05ATljdM2tnLn2lySgRV/YG1ZYwEiKP8
	qO3cgalA==;
Received: from 124x35x135x198.ap124.ftth.ucom.ne.jp ([124.35.135.198] helo=[192.168.2.109])
	by casper.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd3QJ-00000002uXc-3NVq;
	Thu, 22 Feb 2024 07:23:16 +0000
Message-ID: <13059273-4b1c-4e8e-a929-25fcf01bb727@infradead.org>
Date: Thu, 22 Feb 2024 16:23:08 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC net] ps3/gelic: Fix possible NULL pointer dereference
Content-Language: en-US
To: Simon Horman <horms@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
References: <20240221-ps3-gelic-null-deref-v1-1-f4fe159c7cb0@kernel.org>
From: Geoff Levand <geoff@infradead.org>
In-Reply-To: <20240221-ps3-gelic-null-deref-v1-1-f4fe159c7cb0@kernel.org>
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
Cc: Jeff Garzik <jeff@garzik.org>, linux-kernel@vger.kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, netdev@vger.kernel.org, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Dan Carpenter <dan.carpenter@linaro.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Simon,

On 2/22/24 01:56, Simon Horman wrote:
> Fix possible NULL pointer dereference in gelic_card_release_tx_chain()
> 
> The cited commit introduced a netdev variable to
> gelic_card_release_tx_chain() which is set unconditionally on each
> iteration of a for loop.
> 
> It is set to the value of tx_chain->tail->skb->dev.  However, in some
> cases it is assumed that tx_chain->tail->skb may be NULL. And if that
> occurs, setting netdev will cause a NULl pointer dereference.
> 
> Given the age of this code I do wonder if this can occur in practice.
> But to be on the safe side this patch assumes that it can and aims to
> avoid the dereference in the case where tx_chain->tail->skb may be NULL.

After 17+ years I never hit this, and never heard of anyone hitting it...

> Flagged by Smatch.
> Compile tested only.

Thanks for 'fixing' this.

Acked-by: Geoff Levand <geoff@infradead.org>

