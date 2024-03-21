Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C1B881A4F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Mar 2024 01:05:03 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=HyiVzWJU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V0Qgw5h8Dz3fQH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Mar 2024 11:05:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=HyiVzWJU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=geoff@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V0Qg34HRJz2xFt
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Mar 2024 11:04:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=AuTy0DBYYdG/QKWrIh0uagTUXUFOgXWy8+vXQ7SNEJg=; b=HyiVzWJUKN7zEobwCSfi5HSpo8
	+qncGtgXNEe8ND8EP7iESrJwebcnFQ7UO1NaP1y9w+ggyVBvnSTRIs00CKQaYz1qUrjQavuym+Q59
	ErKVvwWvs9RGnWA16WZEpMfAWrbH/A9I99bRvzob1FvUmd7/y9seJi9FkoS+diObsYDI4molelB8i
	TVJ/4N3YosCxpq6guZAnN8IxTbdoI5qRiegSVQuOsoo0hOukfbPQm2eiJYwu2iin6IoLpdeTOPVh4
	7fK+ahU5aAULDrKaXfML1vgGvgSLoXAmCs2hti2cszJa8BcR8lywPlSJV/dxjq1QlJ2CYf5slz5xS
	4Sf0bblw==;
Received: from fpd2fa7e2a.ap.nuro.jp ([210.250.126.42] helo=[192.168.1.8])
	by casper.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rn5uG-00000005TT9-33Nm;
	Thu, 21 Mar 2024 00:03:41 +0000
Message-ID: <5a40e58c-b38d-4bbd-8376-ebdc0c2cc47b@infradead.org>
Date: Thu, 21 Mar 2024 09:03:29 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc: ps3: mark ps3_notification_device static for
 stack usage
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Nathan Chancellor <nathan@kernel.org>, Paul Mackerras <paulus@ozlabs.org>,
 Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
References: <20240320180333.151043-1-arnd@kernel.org>
From: Geoff Levand <geoff@infradead.org>
In-Reply-To: <20240320180333.151043-1-arnd@kernel.org>
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
Cc: Kevin Hao <haokexin@gmail.com>, Arnd Bergmann <arnd@arndb.de>, llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Justin Stitt <justinstitt@google.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Bill Wendling <morbo@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/21/24 03:03, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The device is way too large to be on the stack, causing a warning for
> an allmodconfig build with clang:
> 
> arch/powerpc/platforms/ps3/device-init.c:771:12: error: stack frame size (2064) exceeds limit (2048) in 'ps3_probe_thread' [-Werror,-Wframe-larger-than]
>   771 | static int ps3_probe_thread(void *data)
> 
> There is only a single thread that ever accesses this, so it's fine to
> make it static, which avoids the warning.
> 
> Fixes: b4cb2941f855 ("[POWERPC] PS3: Use the HVs storage device notification mechanism properly")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/powerpc/platforms/ps3/device-init.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/platforms/ps3/device-init.c b/arch/powerpc/platforms/ps3/device-init.c
> index 878bc160246e..ce99f06698a9 100644
> --- a/arch/powerpc/platforms/ps3/device-init.c
> +++ b/arch/powerpc/platforms/ps3/device-init.c
> @@ -770,7 +770,7 @@ static struct task_struct *probe_task;
>  
>  static int ps3_probe_thread(void *data)
>  {
> -	struct ps3_notification_device dev;
> +	static struct ps3_notification_device dev;
>  	int res;
>  	unsigned int irq;
>  	u64 lpar;

Seems fine.

Acked-by: Geoff Levand <geoff@infradead.org>

