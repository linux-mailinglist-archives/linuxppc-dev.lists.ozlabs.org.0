Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F2781AED7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Dec 2023 07:38:25 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=t9K43JvH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Swgjq0v5Qz3cTs
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Dec 2023 17:38:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=t9K43JvH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=geoff@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Swghv2drlz2xFt
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Dec 2023 17:37:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=JKp6ijuiLCqsg7bmaV+yFNL7PV5+H4p32HqU0L/Y3kw=; b=t9K43JvHjZhiFvcUQvdxhDmaY5
	hJGrdj03rOWHfK9lchkpcL1Jf7DMflfLu7wn22Y7apYkqAi2IThv7GXnNclsV/f0FPMdkI31QIcbD
	SVZFZ+OR9uleMgYYgY675iHKpDVYck4tRgUE+4oI7H4akCuvajSiBGTYLI6W2LwDvXRdZrxsVsGS8
	s+zPQu+FPiz0uoU1G3xFtOFwFivH7fhzotvis9Ue7KIVAstFK9bI6uPkDOV1aHjruwSGyXvhMWKxs
	x4cD10fLHrrMYyVDNSmPZvZY7mbx+M2UXkjD1A34lLY9dRDREvhlXueuzzzUDZ90ZTEc31zd1I2C+
	c/E/vs9w==;
Received: from om126161066185.8.openmobile.ne.jp ([126.161.66.185] helo=[192.168.43.165])
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1rGCg5-004k7s-M6; Thu, 21 Dec 2023 06:37:07 +0000
Message-ID: <d9ffe8a9-667b-4d73-a9f3-e06ccd627dfe@infradead.org>
Date: Thu, 21 Dec 2023 15:36:54 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] powerpc: ps3: Add missing set_freezable() for
 ps3_probe_thread()
Content-Language: en-US
To: Kevin Hao <haokexin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>
References: <20231221044510.1802429-1-haokexin@gmail.com>
 <20231221044510.1802429-4-haokexin@gmail.com>
From: Geoff Levand <geoff@infradead.org>
In-Reply-To: <20231221044510.1802429-4-haokexin@gmail.com>
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Pavel Machek <pavel@ucw.cz>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Kevin,

On 12/21/23 13:45, Kevin Hao wrote:
> The kernel thread function ps3_probe_thread() invokes the try_to_freeze()
> in its loop. But all the kernel threads are non-freezable by default.
> So if we want to make a kernel thread to be freezable, we have to invoke
> set_freezable() explicitly.
> 
> Signed-off-by: Kevin Hao <haokexin@gmail.com>
> ---
>  arch/powerpc/platforms/ps3/device-init.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/powerpc/platforms/ps3/device-init.c b/arch/powerpc/platforms/ps3/device-init.c
> index e87360a0fb40..878bc160246e 100644
> --- a/arch/powerpc/platforms/ps3/device-init.c
> +++ b/arch/powerpc/platforms/ps3/device-init.c
> @@ -827,6 +827,7 @@ static int ps3_probe_thread(void *data)
>  	if (res)
>  		goto fail_free_irq;
>  
> +	set_freezable();
>  	/* Loop here processing the requested notification events. */
>  	do {
>  		try_to_freeze();

Seems like a reasonable addition.

Signed-off-by: Geoff Levand <geoff@infradead.org>

