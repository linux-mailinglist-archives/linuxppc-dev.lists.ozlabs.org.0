Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC1D851D65
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Feb 2024 19:55:13 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hNPlL6zg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TYYYW59d1z3dWY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 05:55:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hNPlL6zg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TYYXk3RdTz3cGD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Feb 2024 05:54:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=JfVFUY2jxXKEyGIce+qaR/PTZVUtr7SBgbrlEw95Xtw=; b=hNPlL6zg2NqlAIJzHEHKeIhgWw
	fEb6n/Nlp+z/bMWK1NpeC6egVKyiUJ4y6BusyvQDmG0hRzPfjvZ6Su+p2j/eKrZJ+RWfjR29jRB0B
	ow29us7r4UYCI+wSlG1EkxLu2wcggJ19TDmExPoW12pIPFKR4maZjkLqskSDCW7uplQp9UHuXRvOQ
	N3gKSE6vdD7cfZYqxdfjeMaF3MAAkPV4qsLQ1oiNjag5SWWleICJFyZyfzJ4jqVzQpJg4aYoPcaJG
	kIiRXKjxAwEg5o7GeIRfFWEczQo5VkWClMBTxkRUjlOGrL4zFbSwL4JmFSkAXevWyzz6IjdGxD8jO
	liCrJa9g==;
Received: from [50.53.50.0] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZbRf-00000006hIN-1jOK;
	Mon, 12 Feb 2024 18:54:23 +0000
Message-ID: <eee7652f-939c-4ab7-a400-4591e7de6fc2@infradead.org>
Date: Mon, 12 Feb 2024 10:54:22 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Powerpc: ps3av.c:(.text+0x19e8): undefined reference to
 `video_get_options'
Content-Language: en-US
To: Naresh Kamboju <naresh.kamboju@linaro.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 Linux Regressions <regressions@lists.linux.dev>,
 clang-built-linux <llvm@lists.linux.dev>
References: <CA+G9fYuRwO6FLZ4do1wR0RdiZh9NGpRLKckQcKN2aAkqBH7k0g@mail.gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <CA+G9fYuRwO6FLZ4do1wR0RdiZh9NGpRLKckQcKN2aAkqBH7k0g@mail.gmail.com>
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
Cc: Geoff Levand <geoff@infradead.org>, Dan Carpenter <dan.carpenter@linaro.org>, Javier Martinez Canillas <javierm@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 2/12/24 10:36, Naresh Kamboju wrote:
> I encountered the following build warnings/errors while compiling the powerpc
> kernel on Linux next-20240208 .. next-20240212 tag with clang toolchain.
> 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> 
> powerpc64le-linux-gnu-ld: drivers/ps3/ps3av.o: in function `ps3av_probe':
> ps3av.c:(.text+0x19e8): undefined reference to `video_get_options'
> make[3]: *** [/builds/linux/scripts/Makefile.vmlinux:37: vmlinux] Error 1
> make[3]: Target '__default' not remade because of errors.
> 
> Links:
>  - https://storage.tuxsuite.com/public/linaro/lkft/builds/2cFkli5H02fikrpga6PluAWLAMa/
> 
> 
> --
> Linaro LKFT
> https://lkft.linaro.org
> 

Hi,
I posted a patch for this and Thomas Zimmermanm says:
  The patch is now in drm-misc-next. 

https://lore.kernel.org/lkml/20240207161322.8073-1-rdunlap@infradead.org/

thanks.
-- 
#Randy
