Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CD3357893
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Apr 2021 01:33:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FG11R51wbz2xg5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Apr 2021 09:33:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=nffNf62G;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=geoff@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=nffNf62G; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FG11144YVz2xb5
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Apr 2021 09:33:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=MpRbqVH11WDrjLdwbclElTPVzrqxrO57EVIBD5YvChw=; b=nffNf62G6/CX8WGvEysy5Kk7AO
 MwShDBcnxiZ3H4csUaoGs3vFs74SpF+UU6I7wuj7WqiWBbtZijYHLi2nsbzxZkkV2OCUTbgLt+dwk
 7ua/4n1won2dLpQC9m0YW2vV0rl0pdZ2gWMBpjmCa4G3xuB98P6kJDZVE3J3fSGda9qUKboV1PcK1
 zEz8JHeKTV8Hol8DtpDeQjZYLXrqoet3if8ViF2yCyQQjBHt51NZAvHDdaRgJGpkIsSSLVeXugFhs
 7NZWIZFW/FCNpDZg5DzvCvGw98IvA2qgUgNo8u4WIgNQ6+Emcn39kCKraBmlgNmK8N96T226+mB4o
 /NQDxgaA==;
Received: from [2602:306:c5a2:a380:9e7b:efff:fe40:2b26]
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lUHeW-00FGPa-8Q; Wed, 07 Apr 2021 23:32:10 +0000
Subject: Re: [PATCH] sound:ppc: fix spelling typo of values
To: caizhichao <tomstomsczc@163.com>, perex@perex.cz, tiwai@suse.com
References: <20210323085543.741-1-tomstomsczc@163.com>
From: Geoff Levand <geoff@infradead.org>
Message-ID: <89c4f3e6-437c-6562-1ab8-5b253c9038fa@infradead.org>
Date: Wed, 7 Apr 2021 16:32:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210323085543.741-1-tomstomsczc@163.com>
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
Cc: alsa-devel@alsa-project.org, caizhichao <caizhichao@yulong.com>,
 linux-kernel@vger.kernel.org, paulus@samba.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/23/21 1:55 AM, caizhichao wrote:
> From: caizhichao <caizhichao@yulong.com>
> 
> vaules -> values
> 
> Signed-off-by: caizhichao <caizhichao@yulong.com>
> ---
>  sound/ppc/snd_ps3_reg.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Seems fine. Thanks for your contribution.

Acked-by: Geoff Levand <geoff@infradead.org>

