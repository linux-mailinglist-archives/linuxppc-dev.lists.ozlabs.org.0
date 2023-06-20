Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5F2736BC0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 14:19:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=nAwkvwSO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qlm0Q4dWxz30h1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 22:19:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=nAwkvwSO;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QllzX06swz2xwG
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jun 2023 22:18:48 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QllzV5cb6z4wgq;
	Tue, 20 Jun 2023 22:18:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1687263527;
	bh=PbLHIaiJwWOuc0fVdNIxbCOnVmMY9JR8H0lS3tr/vmI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=nAwkvwSO8o15o+i3GtsKc00hLs52HSnEoaQbcFsFkF565HlED4gbVyyJXdHysvEje
	 URXuU70oSpORlG6Ce2eddBR9XMCNHphJphpVBB8NaydckPGzEPaLEJlTPlg6MdnToE
	 CsQlA7l3gz2fvU2T9jmoPU1DYhiZeyfkaam4EUBLqifKIm2Yx8eF8xhtaSFrctw3SM
	 fvyfN/t+hHCOMy29purWJiadWsthGc2sP1SoaV0NRf0ybGpJe86v4HzULyUCftgafr
	 IPdBARIRDtq9P1m8rengrVYETO8o8ma6RHxj4u8CtZVVfVumpewQoUZLkuWg8hUHA2
	 kYK/Tz3Z54CRQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: zhumao001@208suo.com, fbarrat@linux.ibm.com, ajd@linux.ibm.com,
 arnd@arndb.de, gregkh@linuxfoundation.org
Subject: Re: [PATCH] cxl/ocxl: Possible repeated word
In-Reply-To: <787f5a712a0459bc21d83bb388770b58@208suo.com>
References: <20230618150648.1123-1-dengshaomin@cdjrlc.com>
 <787f5a712a0459bc21d83bb388770b58@208suo.com>
Date: Tue, 20 Jun 2023 22:18:41 +1000
Message-ID: <87r0q6pbry.fsf@mail.lhotse>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

zhumao001@208suo.com writes:
> Delete repeated word in comment.
>
> Signed-off-by: Zhu Mao <zhumao001@208suo.com>
> ---
>   drivers/misc/cxl/native.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/misc/cxl/native.c b/drivers/misc/cxl/native.c
> index 50b0c44bb8d7..6957946a6463 100644
> --- a/drivers/misc/cxl/native.c
> +++ b/drivers/misc/cxl/native.c
> @@ -920,7 +920,7 @@ int cxl_attach_dedicated_process_psl9(struct 
> cxl_context *ctx, u64 wed, u64 amr)
>        * Ideally we should do a wmb() here to make sure the changes to 
> the
>        * PE are visible to the card before we call afu_enable.
>        * On ppc64 though all mmios are preceded by a 'sync' instruction 
> hence
> -     * we dont dont need one here.
> +     * we dont need one here.

I know the rule is to only do one change per patch, but if you're fixing
the wording of a comment you can absolutely fix the spelling at the same
time.

So please send a v2 with "dont" spelt correctly.

cheers
