Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C28245603C8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 17:03:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LY4Tn1QtYz3cg3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jun 2022 01:03:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Bxwxfdki;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Bxwxfdki;
	dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LY4T41DwHz3bw4
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jun 2022 01:02:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=Yj19dHn+0JPxtmJoU7+beQ32yhgR5L1tVwNWJFwVA+k=; b=BxwxfdkiTSsmAbf43BF+dePH/x
	xWOxxBLrYRgVSUvSmy9/AMgOP+9jcWTbXAkv9tKtxNsKPQhwjhAPlbuNa9YxR/Pl6DSafRhJBKv4L
	SzBCCzjlqsnguL1roqjsm5C2dJoZG7ShGhTqNW5JpfLsT9kcUgHEqyJhgde8+cacCojLycA7rlzM5
	N9BA627gjB/z+/jSAqNoFrNZ+HEuPWtnDkUpO76+cMn0XLhd0GCQdCybNF0b0K5B6mTnbnFRSB5pI
	UmzuX+Zn/EysKRf4tGngaONOMnhQnPM8oanQWkn8P6NwU/mtwmVpsrj3I78ufye5AEqt99Ivofl0n
	abyiZ/kw==;
Received: from [2601:1c0:6280:3f0::aa0b]
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6ZDC-00Ccys-4v; Wed, 29 Jun 2022 15:02:38 +0000
Message-ID: <b42c5d4f-5e9c-8f35-798e-b5ac2ad730a6@infradead.org>
Date: Wed, 29 Jun 2022 08:02:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] UAPI: fix a spelling mistake
Content-Language: en-US
To: Zhang Jiaming <jiaming@nfschina.com>, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org
References: <20220629062717.23027-1-jiaming@nfschina.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20220629062717.23027-1-jiaming@nfschina.com>
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
Cc: liqiong@nfschina.com, renyu@nfschina.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi--

On 6/28/22 23:27, Zhang Jiaming wrote:
> Change 'informations' to 'information'.
> 
> Signed-off-by: Zhang Jiaming <jiaming@nfschina.com>
> ---
>  arch/powerpc/include/uapi/asm/bootx.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/include/uapi/asm/bootx.h b/arch/powerpc/include/uapi/asm/bootx.h
> index 6728c7e24e58..eb0769e50e93 100644
> --- a/arch/powerpc/include/uapi/asm/bootx.h
> +++ b/arch/powerpc/include/uapi/asm/bootx.h
> @@ -60,7 +60,7 @@ typedef struct boot_info_map_entry
>  } boot_info_map_entry_t;
>  
>  
> -/* Here are the boot informations that are passed to the bootstrap
> +/* Here are the boot information that are passed to the bootstrap

I would say:

/* Here is the boot information that is passed to the bootstrap.

I.e., use "is" instead of "are" and add a period at the end.

>   * Note that the kernel arguments and the device tree are appended
>   * at the end of this structure. */
>  typedef struct boot_infos

-- 
~Randy
