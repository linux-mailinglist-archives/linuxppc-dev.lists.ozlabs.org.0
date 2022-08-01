Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA7458641C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Aug 2022 08:36:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lx7gq5c3lz3c3B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Aug 2022 16:36:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=K0yfJNKM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lx7gD5K6Pz2xHN
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Aug 2022 16:36:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=K0yfJNKM;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Lx7gB7047z4x1L;
	Mon,  1 Aug 2022 16:36:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1659335767;
	bh=KlQQmnUVuaEUxMMjUhKl86RMR9H7Qw3GkPi6RTcciHE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=K0yfJNKMDtGlkyfwvBU+udgax/uri2aoU+kEXhNAHZ42CoOwXoMMmmcxpM3wdTC2u
	 OCICfqNBi2CJdP1vgtzvuc5z2BAkpyjInb8fXfcvhTxoJcDYcQI6YmZI4bfX4F+CLt
	 S+/UYnC+BwGL/EwJfCU+wqzqMW8lSmqfbi11HkotBeLZlVKmOBpGKbsO8iaqdHeY2r
	 HRuk9d9CVX9oZxih7icVm+Zwo+eer2UF83vEmxCuuUs6oZXhZSjUSWGAqVEBH7dUhb
	 bWUS0G/YEeJFsqOFlNqt5Fj+9dgOzgcpW9YkRnOVqnXIpteL9cXP2h/+Zl3eeuTJOC
	 cMp5leerQUymQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: cgel.zte@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH linux-next] macintosh:adb:recordmcount:use !E in
 conditional statements
In-Reply-To: <20220801022521.1594464-1-ye.xingchen@zte.com.cn>
References: <20220801022521.1594464-1-ye.xingchen@zte.com.cn>
Date: Mon, 01 Aug 2022 16:36:06 +1000
Message-ID: <87edy0bhd5.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: ye xingchen <ye.xingchen@zte.com.cn>, Zeal Robot <zealci@zte.com.cn>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

cgel.zte@gmail.com writes:
> From: ye xingchen <ye.xingchen@zte.com.cn>
>
> Use !E to replace the type of x == 0. This change is just to 
> simplify the code, no actual functional changes.
>
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
> ---
>  drivers/macintosh/adb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

The subject is wrong, why does it mention recordmcount?

But in general this is very old code which is best left alone unless
there's an actual bug, it doesn't need these sort of style refactorings
done to it IMO.

cheers

> diff --git a/drivers/macintosh/adb.c b/drivers/macintosh/adb.c
> index 1bbb9ca08d40..368ab25db234 100644
> --- a/drivers/macintosh/adb.c
> +++ b/drivers/macintosh/adb.c
> @@ -673,7 +673,7 @@ static int adb_open(struct inode *inode, struct file *file)
>  		goto out;
>  	}
>  	state = kmalloc(sizeof(struct adbdev_state), GFP_KERNEL);
> -	if (state == 0) {
> +	if (!state) {
>  		ret = -ENOMEM;
>  		goto out;
>  	}
> -- 
> 2.25.1
