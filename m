Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C89F4754593
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jul 2023 02:06:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xALtXC8/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R2pXs4zPPz3cLQ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jul 2023 10:06:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xALtXC8/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:1004:224b::e; helo=out-14.mta0.migadu.com; envelope-from=sui.jingfeng@linux.dev; receiver=lists.ozlabs.org)
X-Greylist: delayed 549 seconds by postgrey-1.37 at boromir; Fri, 14 Jul 2023 20:27:36 AEST
Received: from out-14.mta0.migadu.com (out-14.mta0.migadu.com [IPv6:2001:41d0:1004:224b::e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R2SN86gZVz3bP2
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jul 2023 20:27:36 +1000 (AEST)
Message-ID: <809f8391-c9e2-4432-12ec-9921360e3c8e@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1689329891;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vDi5jHcc6JX2dM3REdw3Ft0fz55Drq20U6og3UsNXvQ=;
	b=xALtXC8/ROHasKXZMaOLj0zsiUq3d6orGjz1eoTZ1jYoIfLxy+er+4aCKpcbd9XxK/72Fv
	KRVRN8cp4ei0ETtfaMci8s/7BCxay4Kgtrw1eY/mHz/QrTn8JRVj36+RIQUzGxVU6fdQ+Q
	u1T/iNhdJHA2X2uvCVp0eGoYlglhYfM=
Date: Fri, 14 Jul 2023 18:17:59 +0800
MIME-Version: 1.0
Subject: Re: [v3,18/18] fbdev: Document that framebuffer_alloc() returns
 zero'ed data
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de, javierm@redhat.com
References: <20230714075155.5686-19-tzimmermann@suse.de>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sui JIngfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20230714075155.5686-19-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Sat, 15 Jul 2023 10:04:45 +1000
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
Cc: linux-fbdev@vger.kernel.org, kvm@vger.kernel.org, linux-hyperv@vger.kernel.org, linux-sh@vger.kernel.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, linux-geode@lists.infradead.org, dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, linux-nvidia@lists.surfsouth.com, linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 2023/7/14 15:49, Thomas Zimmermann wrote:
> Most fbdev drivers depend on framebuffer_alloc() to initialize the
> allocated memory to 0. Document this guarantee.
>
> v3:
> 	* slightly reword the sentence (Miguel)
>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Sui Jingfeng <suijingfeng@loongson.cn>

> Cc: Helge Deller <deller@gmx.de>
> ---
>   drivers/video/fbdev/core/fb_info.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/video/fbdev/core/fb_info.c b/drivers/video/fbdev/core/fb_info.c
> index 8bdbefdd4b70..4847ebe50d7d 100644
> --- a/drivers/video/fbdev/core/fb_info.c
> +++ b/drivers/video/fbdev/core/fb_info.c
> @@ -13,7 +13,8 @@
>    *
>    * Creates a new frame buffer info structure. Also reserves @size bytes
>    * for driver private data (info->par). info->par (if any) will be
> - * aligned to sizeof(long).
> + * aligned to sizeof(long). The new instances of struct fb_info and
> + * the driver private data are both cleared to zero.
>    *
>    * Returns the new structure, or NULL if an error occurred.
>    *
