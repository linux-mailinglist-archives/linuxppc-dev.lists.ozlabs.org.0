Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B882D344F0D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Mar 2021 19:50:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F43VD5L4sz30Lq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 05:50:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=S0PWFuWS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=S0PWFuWS; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F43Tr27rvz2xfj
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 05:50:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
 Reply-To:Cc:Content-ID:Content-Description;
 bh=rgKmg8TVdXghRnkApE4fkAGJ5moLys2JCYUJGG86PPE=; b=S0PWFuWSJl4JWUThotvNH6XHVq
 r/PnF/gH9jmD13WuxPFZqAB2t9y6LWL5VyRY3e2MxOcJo9GaSIn8mtDmLjRCEODhI8ebDR7bPrmVz
 lxq7DcxHTm7Z9gi4+SLXIg5/CT9q99Msga+QjoKWgQah03n8Qzcj9NMsPEFvLFwbazwzs8g6CBkOF
 RipbrS592/JAlVNTSQC5YU8dhOvUAkgKZ595ksOjBLOcfI+lo+f3lnn9a0qKmg2gC81SOyH0h9snS
 2Ebq0b7d2bVcYxEdqOb8agjanQV+dhlrc75/kwNeNNvJgRkZa0R8qg1VKKoNji/PxtkbwqpBvCebv
 ++fjIxMQ==;
Received: from [2601:1c0:6280:3f0::3ba4]
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lOPcT-008w9v-VB; Mon, 22 Mar 2021 18:49:59 +0000
Subject: Re: [PATCH] docs: powerpc: Fix a typo
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org, corbet@lwn.net,
 linuxppc-dev@lists.ozlabs.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20210322062237.2971314-1-unixbhaskar@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <61e323a3-0934-708a-99cc-a4cd632ca6b0@infradead.org>
Date: Mon, 22 Mar 2021 11:49:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210322062237.2971314-1-unixbhaskar@gmail.com>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/21/21 11:22 PM, Bhaskar Chowdhury wrote:
> 
> s/struture/structure/
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

> ---
>  Documentation/powerpc/firmware-assisted-dump.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/powerpc/firmware-assisted-dump.rst b/Documentation/powerpc/firmware-assisted-dump.rst
> index 20ea8cdee0aa..6c0ae070ba67 100644
> --- a/Documentation/powerpc/firmware-assisted-dump.rst
> +++ b/Documentation/powerpc/firmware-assisted-dump.rst
> @@ -171,7 +171,7 @@ that were present in CMA region::
>                                             (meta area)    |
>                                                            |
>                                                            |
> -                      Metadata: This area holds a metadata struture whose
> +                      Metadata: This area holds a metadata structure whose
>                        address is registered with f/w and retrieved in the
>                        second kernel after crash, on platforms that support
>                        tags (OPAL). Having such structure with info needed
> --
> 2.31.0
> 


-- 
~Randy

