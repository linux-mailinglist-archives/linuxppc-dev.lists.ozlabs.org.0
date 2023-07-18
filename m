Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59ED975889D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 00:39:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WC8frNZQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R5DQG1tXfz3bhc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 08:39:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WC8frNZQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R5DPQ34pwz2xHT
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jul 2023 08:38:18 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A1710612CC;
	Tue, 18 Jul 2023 22:38:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73162C433C7;
	Tue, 18 Jul 2023 22:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689719896;
	bh=RXO+gAcZm+MhRenqy65hhkLUzlwKRVhTNDHhFXVPjjc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WC8frNZQi3mlQRwzd/1B/o58REsGjVM4bTqKYDGfIE0sdXtSivhP2CyO9GHwyZmUh
	 /fSMjJcqo48S1vnfEmmBEuLJHAJPEWExHLr/fGVg72zBItMXT5mcrGyyeTxbsSA84F
	 6LENyGcMmgizG0XyhLIpTWGmW5LNVmvAW2H++ihnyl/GFL1ab+KbX6AQgQGzKV14bB
	 C7ttE95UTAd7KsoYwEkaDtSAZr6mZGfIVkXp1QrwAzNbs+XmOJRAl2Qpf1itgUpGdz
	 7Xh0infj6g0F2qtc/JkRPt1YQH30JhSn8B77F32PIysiR197GoqrB8XClTi6/Qu1MM
	 4FL5RdcE/3Bqg==
Date: Tue, 18 Jul 2023 15:38:13 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [RFC PATCH 05/21] ubifs: Pass worst-case buffer size to
 compression routines
Message-ID: <20230718223813.GC1005@sol.localdomain>
References: <20230718125847.3869700-1-ardb@kernel.org>
 <20230718125847.3869700-6-ardb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230718125847.3869700-6-ardb@kernel.org>
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
Cc: Jens Axboe <axboe@kernel.dk>, Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Steffen Klassert <steffen.klassert@secunet.com>, Kees Cook <keescook@chromium.org>, qat-linux@intel.com, Sergey Senozhatsky <senozhatsky@chromium.org>, Richard Weinberger <richard@nod.at>, David Ahern <dsahern@kernel.org>, Eric Dumazet <edumazet@google.com>, linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, Minchan Kim <minchan@kernel.org>, Nick Terrell <terrelln@fb.com>, netdev@vger.kernel.org, linux-mtd@lists.infradead.org, Jakub Kicinski <kuba@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, Paolo Abeni <pabeni@redhat.com>, linuxppc-dev@lists.ozlabs.org, linux-crypto@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 18, 2023 at 02:58:31PM +0200, Ard Biesheuvel wrote:
> Currently, the ubifs code allocates a worst case buffer size to
> recompress a data node, but does not pass the size of that buffer to the
> compression code. This means that the compression code will never use
> the additional space, and might fail spuriously due to lack of space.
> 
> So let's multiply out_len by WORST_COMPR_FACTOR after allocating the
> buffer. Doing so is guaranteed not to overflow, given that the preceding
> kmalloc_array() call would have failed otherwise.
> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  fs/ubifs/journal.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
> index dc52ac0f4a345f30..4e5961878f336033 100644
> --- a/fs/ubifs/journal.c
> +++ b/fs/ubifs/journal.c
> @@ -1493,6 +1493,8 @@ static int truncate_data_node(const struct ubifs_info *c, const struct inode *in
>  	if (!buf)
>  		return -ENOMEM;
>  
> +	out_len *= WORST_COMPR_FACTOR;
> +
>  	dlen = le32_to_cpu(dn->ch.len) - UBIFS_DATA_NODE_SZ;
>  	data_size = dn_size - UBIFS_DATA_NODE_SZ;
>  	compr_type = le16_to_cpu(dn->compr_type);

This looks like another case where data that would be expanded by compression
should just be stored uncompressed instead.

In fact, it seems that UBIFS does that already.  ubifs_compress() has this:

        /*
         * If the data compressed only slightly, it is better to leave it
         * uncompressed to improve read speed.
         */
        if (in_len - *out_len < UBIFS_MIN_COMPRESS_DIFF)
                goto no_compr;

So it's unclear why the WORST_COMPR_FACTOR thing is needed at all.

- Eric
