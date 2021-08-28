Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 878823FA2F1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Aug 2021 03:36:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GxK1w16bTz3bht
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Aug 2021 11:36:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=JzMfwkMo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=geoff@infradead.org; receiver=<UNKNOWN>)
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GxK163kJ6z2ynM
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Aug 2021 11:36:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=AxcZIHM6WRdQHLVjEv6VID2r686OxIA9JRn4iceNx/k=; b=JzMfwkMosdaUNdn/1Yel4T4CIK
 nWisCh3pB4LKYN9lmwe3kcW3y3RMi10xxn6rv9ZKQHMOEzo7YeR6slfz9vwI6zdJaT9QpwTkMDLG0
 FVlxc+oMw9bT3aYZHXCILsRugcuKgDA/pNOPr3WKN/CR/4TZWLX8LOvM8JIY8Tw7/RAXbZ5+EvLLl
 ELs2nfKhbOuHAJWozZXROlf+LlMshSqceKQyZsvz2IaQ/0W++3UqEREICbu9Lr6NKfgCs3fCgy/t0
 lY3tapkuG51RveCTItRCp2mSHKi2NHvMx/tFOfQn5IG43PTS4CpRFFlnS1B9TvB8gRsXu+E89GAV5
 n/4ThJsQ==;
Received: from [2602:306:c5a2:a380:51a9:8dca:e324:214f]
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJnFP-00FBZe-Bc; Sat, 28 Aug 2021 01:35:14 +0000
Subject: Re: [PATCH] net: spider_net: switch from 'pci_' to 'dma_' API
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 kou.ishizaki@toshiba.co.jp, davem@davemloft.net, kuba@kernel.org
References: <60abc3d0c8b4ef8368a4d63326a25a5cb3cd218c.1630094078.git.christophe.jaillet@wanadoo.fr>
From: Geoff Levand <geoff@infradead.org>
Message-ID: <4f3113d1-b76e-a085-df2d-fd97d4b45faf@infradead.org>
Date: Fri, 27 Aug 2021 18:34:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <60abc3d0c8b4ef8368a4d63326a25a5cb3cd218c.1630094078.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe,

On 8/27/21 12:56 PM, Christophe JAILLET wrote:
> It has *not* been compile tested because I don't have the needed
> configuration or cross-compiler.

The powerpc ppc64_defconfig has CONFIG_SPIDER_NET set. My
tdd-builder Docker image has the needed gcc-powerpc-linux-gnu
cross compiler to build ppc64_defconfig:

  https://hub.docker.com/r/glevand/tdd-builder

-Geoff
 
