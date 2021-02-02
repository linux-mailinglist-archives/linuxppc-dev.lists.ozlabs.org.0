Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 752E930B64E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Feb 2021 05:16:31 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVBMb41GyzDqxZ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Feb 2021 15:16:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=geoff@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=U3KBmP9z; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVBKY2RGBzDqtY
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Feb 2021 15:14:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=JYD32y2pCYheVKqTUNSoOdE4Gv7Pp5EIyc3LAnDYu5M=; b=U3KBmP9zckJpHWtDV02WPdShFq
 jHnMI4U2XgSYedJhJP/6/MVzO8ZoC/w5ZRuzX77YTejUHTxi58CpUsq20ZR344qTB5iTol5FQlX2B
 4wfFoYrFzTl/7jDTC6GFw+54WVal9VIM/Rbb+GJ6nYL07OMKFvNpB7t/0QxTpEO7EkJ1kOKd14Pdx
 wgE43ssooMjbex4vg5Je4FHWWBs5+v0rqGfdKXX2/Gka7Wu+QRqTHnxv2yzyn2bVVGETUpm+jiH4z
 J5xP3XJH97Dc7RgcYJ/LEJ51FIi6rPTVvqrSFB/bgJpHVWBl92KUsRI3jWRb/SSWmZsd7vtnnSYeM
 X33Fp0uA==;
Received: from [2602:306:c5a2:a380:9e7b:efff:fe40:2b26]
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1l6n55-00Eglh-Au; Tue, 02 Feb 2021 04:14:26 +0000
Subject: Re: [PATCH] dma-mapping: remove unneeded semicolon
To: Yang Li <yang.lee@linux.alibaba.com>
References: <1612237276-111378-1-git-send-email-yang.lee@linux.alibaba.com>
From: Geoff Levand <geoff@infradead.org>
Message-ID: <bff00a1b-d7bd-0314-f0ee-bef292302b78@infradead.org>
Date: Mon, 1 Feb 2021 20:14:20 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1612237276-111378-1-git-send-email-yang.lee@linux.alibaba.com>
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
Cc: paulus@samba.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2/1/21 7:41 PM, Yang Li wrote:
> Eliminate the following coccicheck warning:
> ./arch/powerpc/platforms/ps3/system-bus.c:606:2-3: Unneeded semicolon
> ./arch/powerpc/platforms/ps3/system-bus.c:765:2-3: Unneeded semicolon
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  arch/powerpc/platforms/ps3/system-bus.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Thanks for your patch, it looks good.

Acked-by: Geoff Levand <geoff@infradead.org>

-Geoff
