Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D383EAD60
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Aug 2021 00:48:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gm2140TTYz3bnQ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Aug 2021 08:48:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VwLU2IBE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=vgupta@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=VwLU2IBE; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GlwtV6BLcz30Gt
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Aug 2021 04:57:54 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 362056103A;
 Thu, 12 Aug 2021 18:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628794671;
 bh=9lyFwGGuyLf5GdDUz/aKvERlOFF1uWuGiPBbUIAEKfE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=VwLU2IBE7pm2CpqhWrWcs09zHfDgGQQ+XwYJ0x4NJ+OYptETg8cUHpeJuXviSEb8m
 hZwv3aN1LfVIwHZVS+UQ7mB1srMgVxwRZcSfRTFv67A2WL07AvZbrPj/Jz8MICDjiz
 tSsLyZBkRPIi4PEfw72QWFlCzfTyNhyHc6hoJdLtBX/ALr48Ij7oskYZxfFb8gVUAz
 MdoO56PMOMA1qSMNTQQWl/YJOfRCSFiinLi5nd/tFripDrfTPOSzz5IN+8rkyBTJL5
 ClZ1UH9RZQQUjhvz/MyHpPFG2IOOryYDriDcsJsaN4YgRfyjgsTyLvyz3NzaOYphUa
 cYgcKsD4gQWUw==
Subject: Re: [PATCH -next] trap: Cleanup trap_init()
To: Kefeng Wang <wangkefeng.wang@huawei.com>,
 linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, uclinux-h8-devel@lists.sourceforge.jp,
 linux-hexagon@vger.kernel.org, openrisc@lists.librecores.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-um@lists.infradead.org,
 linux-mm@kvack.org
References: <20210812123602.76356-1-wangkefeng.wang@huawei.com>
From: Vineet Gupta <vgupta@kernel.org>
Message-ID: <b49eed44-0837-906c-8779-4fffb5609653@kernel.org>
Date: Thu, 12 Aug 2021 11:57:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210812123602.76356-1-wangkefeng.wang@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Mailman-Approved-At: Fri, 13 Aug 2021 08:48:22 +1000
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
Cc: Jonas Bonn <jonas@southpole.se>, Andrew Morton <akpm@linux-foundation.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Helge Deller <deller@gmx.de>,
 Paul Walmsley <palmerdabbelt@google.com>, Russell King <linux@armlinux.org.uk>,
 Ley Foon Tan <ley.foon.tan@intel.com>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
 Richard Weinberger <richard@nod.at>, Paul Mackerras <paulus@samba.org>,
 Vineet Gupta <vgupta@kernel.org>, Stafford Horne <shorne@gmail.com>,
 Jeff Dike <jdike@addtoit.com>, Anton Ivanov <anton.ivanov@cambridgegreys.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 8/12/21 5:36 AM, Kefeng Wang wrote:
> There are some empty trap_init() in different ARCHs, introduce
> a new weak trap_init() function to cleanup them.
>
> Cc: Vineet Gupta<vgupta@kernel.org>
> Cc: Russell King<linux@armlinux.org.uk>
> Cc: Yoshinori Sato<ysato@users.sourceforge.jp>
> Cc: Ley Foon Tan<ley.foon.tan@intel.com>
> Cc: Jonas Bonn<jonas@southpole.se>
> Cc: Stefan Kristiansson<stefan.kristiansson@saunalahti.fi>
> Cc: Stafford Horne<shorne@gmail.com>
> Cc: James E.J. Bottomley<James.Bottomley@HansenPartnership.com>
> Cc: Helge Deller<deller@gmx.de>
> Cc: Michael Ellerman<mpe@ellerman.id.au>
> Cc: Benjamin Herrenschmidt<benh@kernel.crashing.org>
> Cc: Paul Mackerras<paulus@samba.org>
> Cc: Paul Walmsley<palmerdabbelt@google.com>
> Cc: Jeff Dike<jdike@addtoit.com>
> Cc: Richard Weinberger<richard@nod.at>
> Cc: Anton Ivanov<anton.ivanov@cambridgegreys.com>
> Cc: Andrew Morton<akpm@linux-foundation.org>
> Signed-off-by: Kefeng Wang<wangkefeng.wang@huawei.com>
> ---
>   arch/arc/kernel/traps.c      | 5 -----

Acked-by: Vineet Gupta <vgupt@kernel.org>  #arch/arc
