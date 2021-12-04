Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D41468605
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Dec 2021 16:48:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J5vHg5zpnz2xrN
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Dec 2021 02:48:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=gdprMrDX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=geoff@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=gdprMrDX; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J5vGt37kgz2y7W
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 Dec 2021 02:48:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=WRnKEg35GZRxlFBDZ8nAe1ThfeNpialM6JAsEXyKYhE=; b=gdprMrDXo5A4+arqeARYGRAihR
 UdIvyB7kSxMOpV82l7r42HGn+k8Pel//Fd6868kXaKf4Qr+b9Qmq6EKRqYQEJP7V5gnrk+QrxrXAD
 mykg2ZBbnLSU6pLhGOGjvdPXSFn5PdcVQVQ9y7mRCl03rsCS9WSRpFFd3WWVfrZGAL7WqvmY5Eqgr
 0IQQ9BPScEkxQ1hUsiP/91ERtF1rnqdHsBH2Qc/q+pHEVObYFcujp3SA55Eh0QMNk1UweLqMOJnsU
 Bl8HBm62h7KPbvgA/o1BOnvvMVg9adm005X8DLTmPuv9odQyGr4vTsszpxNeD6jYhFO05AbOy6lCF
 fhVkisiA==;
Received: from [2602:306:c5a2:a380:b27b:25ff:fe2c:51a8]
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mtXGK-00DcGI-Uq; Sat, 04 Dec 2021 15:47:45 +0000
Subject: Re: [PATCH] net: spider_net: Use non-atomic bitmap API when applicable
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 kou.ishizaki@toshiba.co.jp, davem@davemloft.net, kuba@kernel.org
References: <3de0792f5088f00d135c835df6c19e63ae95f5d2.1638026251.git.christophe.jaillet@wanadoo.fr>
From: Geoff Levand <geoff@infradead.org>
Message-ID: <450ecfe8-94ce-46cb-0216-9fff22682426@infradead.org>
Date: Sat, 4 Dec 2021 07:47:41 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <3de0792f5088f00d135c835df6c19e63ae95f5d2.1638026251.git.christophe.jaillet@wanadoo.fr>
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

On 11/27/21 7:18 AM, Christophe JAILLET wrote:
> No concurrent access is possible when a bitmap is local to a function.
> So prefer the non-atomic functions to save a few cycles.
>    - replace a 'for' loop by an equivalent non-atomic 'bitmap_fill()' call
>    - use '__set_bit()'
> 
> While at it, clear the 'bitmask' bitmap only when needed.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> This patch is *not* compile tested. I don't have the needed cross compiling
> tool chain.
> ---
>  drivers/net/ethernet/toshiba/spider_net.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

As I mentioned, my tdd-builder Docker image has a
gcc-powerpc-linux-gnu cross compiler that can be used to build
a ppc64 kernel:

  https://hub.docker.com/r/glevand/tdd-builder

I also have a few helper scripts to run the container and cross
compile a kernel:

  https://github.com/glevand/tdd--docker/blob/master/builder/run-builder.sh
  https://github.com/glevand/tdd-project/blob/master/scripts/build-linux-kernel.sh


I applied your patch to v5.16-rc3 and no spider_net warnings
or errors were seen when building with ppc64_defconfig. Thanks
for your contribution.

Acked-by: Geoff Levand <geoff@infradead.org>
