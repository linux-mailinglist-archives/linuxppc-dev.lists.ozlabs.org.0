Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A09A89B6D8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Apr 2024 06:25:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Sp3Bdtn6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VCbcT1SsQz3dTn
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Apr 2024 14:25:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Sp3Bdtn6;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VCbbm0flbz3bX3
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Apr 2024 14:25:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1712550306;
	bh=9IeDw0jg/iSTJmzT7tMO0PqrDYTpMdttta7G5B8J0DU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Sp3Bdtn6OeC5sT0aJW+ARoTMwpGJXNh2PfiiwcMeknb0msWMDsNBeMvK3/N1panIm
	 w1id8AW0E/7VWJijXUeioUu4O03AoJN71R9c+Mj4GgYFLa8juXRm9/XFNs9LAHEL/r
	 8bo7i0xsE94Rek0Df80966YGFSRr+/i6DoZYiqSeXuRUG1TFp7ul+lwC5a8m+CT2Ic
	 MjUbVGviYLiGRRfAwzbfEYzPj4TGVXz9UDnit9OmSPSz5JueW/6Z0/k/MI9qTtkT+o
	 ko4XWCodSXIjmZZUjht05XmXt7EYbebVf3yjnF7+Hl2RdQNB7ab1bI/8I+5n05znZC
	 XorIO5MG1GpyQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VCbbh6SRFz4wxt;
	Mon,  8 Apr 2024 14:25:04 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Yang Li <yang.lee@linux.alibaba.com>, arnd@arndb.de, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, aneesh.kumar@kernel.org,
 naveen.n.rao@linux.ibm.com
Subject: Re: [PATCH -next 1/3] powerpc: boot: Fix a typo in
 partial_decompress() comment
In-Reply-To: <20240407063952.36270-1-yang.lee@linux.alibaba.com>
References: <20240407063952.36270-1-yang.lee@linux.alibaba.com>
Date: Mon, 08 Apr 2024 14:25:04 +1000
Message-ID: <874jcccwgv.fsf@mail.lhotse>
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
Cc: Yang Li <yang.lee@linux.alibaba.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Yang Li <yang.lee@linux.alibaba.com> writes:
> This commit adds kernel-doc style comments with complete parameter
> descriptions for the function partial_decompress().

This change log doesn't match the subject or the patch.

cheers

> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
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
> -- 
> 2.20.1.7.g153144c
