Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71AF789C812
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Apr 2024 17:21:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=utxb9p50;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VCt8n1Rjnz3vX7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Apr 2024 01:21:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=utxb9p50;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VCt8426Jtz3d2S
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Apr 2024 01:20:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=8edgMOXFgl2zH45wje+hWBsQnHUDbsEh0smyAXxWaBs=; b=utxb9p50qnnv2YLRt4F7EHh/75
	i0wDKd20u8FMRg1/ZL9YT39FkkmRPbggwBg4KZodzFD26daLeV1ZUH0QAN9oethDxmfOWMaSd+y+t
	Bpmr70ko1HKwIMknMwkPFOhA/LAuvYUZvuRnjIlfUJNbnu2ZBgQBLnJH3muDUKjYflaqRQmio/9mE
	DJjAUPbfmC8gxsgxrnhGjXxojOJIbLdeMv1CV8qbyf8vS3pUJG5Ldl5zQCnraLIIRqvR8OQxZod6g
	VB5va1t0bEq7FYTuKPxTel/xN1e9MGYZxdpBt0doHAvZR64ulDovKP7IH/8kl3wZdx4dG5ya/g8Jy
	uSLvLZmQ==;
Received: from [50.53.2.121] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtqnP-0000000G0cL-2QJk;
	Mon, 08 Apr 2024 15:20:32 +0000
Message-ID: <16530926-d19a-4607-a69c-b12455b818a3@infradead.org>
Date: Mon, 8 Apr 2024 08:20:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next 1/3 v2] powerpc: boot: Fix kernel-doc param for
 partial_decompress
To: Yang Li <yang.lee@linux.alibaba.com>, arnd@arndb.de, mpe@ellerman.id.au,
 npiggin@gmail.com, christophe.leroy@csgroup.eu, aneesh.kumar@kernel.org,
 naveen.n.rao@linux.ibm.com
References: <20240408083916.123369-1-yang.lee@linux.alibaba.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20240408083916.123369-1-yang.lee@linux.alibaba.com>
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



On 4/8/24 1:39 AM, Yang Li wrote:
> Fix the kernel-doc annotation for the 'skip' parameter in the
> partial_decompress() function by adding a missing underscore and colon.
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
