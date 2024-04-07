Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CB74789B336
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Apr 2024 19:07:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SVm6pSkV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VCJYQ5cLlz3vZ0
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Apr 2024 03:07:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VCJXb4YxSz3bqC
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Apr 2024 03:06:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=tkE7wjg7mEGHR9RcR4gH0ugAtFUzXk4D+Was2qIvbLE=; b=SVm6pSkVlTE5UJVoUMgD2nXMo1
	BqgIZu2vUFNEv/SR44z4E5R8PEZCWNSGKX5bXDeaGm4hv1wRgPTgWGVPyBd7joZcfuzNDDweW+R4C
	NlAnHmBI9sFYLc9K9Lim67mjHuBxbF9ZzBNg+Mvca8NM0EcddTnIdlbBKrne5UBOZcimVcAvCbgmh
	klV1kcEyg/4+Lh26NQhpyn4cMSELphoHm5iw6bZSifo4dXrnRmEfBufOV0tjpLWIan9tPOJRxyk2u
	/mroZOPpSzBe9mAk1umxEq7HhrdUuHeke6dgPUjKXaW15SljM/Jj+7r/VvkLQ28mS+qhFryP/mIv2
	cG/s/VRQ==;
Received: from [50.53.2.121] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtVxw-0000000D6gH-0VGA;
	Sun, 07 Apr 2024 17:06:00 +0000
Message-ID: <70b22ecf-7d02-4b90-ada7-ccef659e115f@infradead.org>
Date: Sun, 7 Apr 2024 10:05:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next 1/3] powerpc: boot: Fix a typo in
 partial_decompress() comment
To: Yang Li <yang.lee@linux.alibaba.com>, arnd@arndb.de, mpe@ellerman.id.au,
 npiggin@gmail.com, christophe.leroy@csgroup.eu, aneesh.kumar@kernel.org,
 naveen.n.rao@linux.ibm.com
References: <20240407063952.36270-1-yang.lee@linux.alibaba.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20240407063952.36270-1-yang.lee@linux.alibaba.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 4/6/24 11:39 PM, Yang Li wrote:
> This commit adds kernel-doc style comments with complete parameter
> descriptions for the function partial_decompress().
> 
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  arch/powerpc/boot/decompress.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/boot/decompress.c b/arch/powerpc/boot/decompress.c
> index 977eb15a6d17..6835cb53f034 100644
> --- a/arch/powerpc/boot/decompress.c
> +++ b/arch/powerpc/boot/decompress.c
> @@ -101,7 +101,7 @@ static void print_err(char *s)
>   * @input_size:  length of the input buffer
>   * @outbuf:      output buffer
>   * @output_size: length of the output buffer
> - * @skip         number of output bytes to ignore
> + * @_skip:       number of output bytes to ignore
>   *
>   * This function takes compressed data from inbuf, decompresses and write it to
>   * outbuf. Once output_size bytes are written to the output buffer, or the

-- 
#Randy
