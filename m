Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFFB30A0C8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Feb 2021 05:13:03 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DTZL42HYqzDrTN
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Feb 2021 15:13:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DTZJB5sLnzDrQn
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Feb 2021 15:11:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=merlin.20170209 header.b=rwVJ9zF6; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by ozlabs.org (Postfix) with ESMTP id 4DTZJB48mPz9t55
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Feb 2021 15:11:22 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 4DTZJB3Y5vz9t2g; Mon,  1 Feb 2021 15:11:22 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1231::1; helo=merlin.infradead.org;
 envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4DTZJ52h9pz9t2G;
 Mon,  1 Feb 2021 15:11:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=Xk0MSvPqcMaMTMq6ymnZL+7QSNHvSX3oOzs1ievIfeA=; b=rwVJ9zF60kN09d1EzT0bobxfWw
 kB2dU0A5ZP5uj7oU3J4W0btXSiT8cNiedK5t3wgf/bjT07vRzYrliN5JyXwGy9ZXh4tpQs/MQEb89
 Im/ohfYD2ZsWXEXocJFE2xYrmuN4axTDjVfXtSFCpT6qn1znalWL48MUGU5TZPkULkQnv8lHJ0CLx
 OVousCR0yuKpOzO4W1/ws+siJDGCsBInZMgEezLgNzWfCsT455OehIpEBBcyGnLVrTNdrsku5m43P
 9SX64SGivSNEjOLuImxo+rk2781/hJOTRuCKxbEkrRiNP5xXs2rXfHDvehmPFm1O+E3f2BvPG4YLl
 jU+Egqdg==;
Received: from [2601:1c0:6280:3f0::9abc]
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6QYO-0008Mc-KD; Mon, 01 Feb 2021 04:11:08 +0000
Subject: Re: [PATCH] powerpc/akebono: Fix unmet dependency errors
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
References: <20210201012503.940145-1-mpe@ellerman.id.au>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <c3437890-bd63-55b0-8eed-e851639ee75f@infradead.org>
Date: Sun, 31 Jan 2021 20:11:02 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210201012503.940145-1-mpe@ellerman.id.au>
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
Cc: f.fainelli@gmail.com, yury.norov@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 1/31/21 5:25 PM, Michael Ellerman wrote:
> The AKEBONO config has various selects under it, including some with
> user-selectable dependencies, which means those dependencies can be
> disabled. This leads to warnings from Kconfig.
> 
> 
> The problem is that AKEBONO is using select to enable things that are
> not true dependencies, but rather things you probably want enabled in
> an AKEBONO kernel. That is what a defconfig is for.
> 
> So drop those selects and instead move those symbols into the
> defconfig. This fixes all the kconfig warnings, and the result of make
> 44x/akebono_defconfig is the same before and after the patch.
> 
> Reported-by: Yury Norov <yury.norov@gmail.com>
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: Florian Fainelli <f.fainelli@gmail.com>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>  arch/powerpc/configs/44x/akebono_defconfig | 5 +++++
>  arch/powerpc/platforms/44x/Kconfig         | 7 -------
>  2 files changed, 5 insertions(+), 7 deletions(-)

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

-- 
~Randy
