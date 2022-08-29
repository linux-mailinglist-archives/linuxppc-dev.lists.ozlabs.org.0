Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 721555A5790
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 01:28:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MGmpn2fZ4z3cBp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 09:28:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rjJ8YNno;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rjJ8YNno;
	dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MGmp83W7qz2ypD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Aug 2022 09:28:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=6xQEdG7I9afDLgCCUha+gwHY9cLRtcimEOVscS0Vf0o=; b=rjJ8YNnonvQ5RrIZ+ITQSavEFB
	kfjis5MP1EGOwqpxe39b72YWYmwfI+abk2P/VcQxLZgwADjs8dvM8HHmbf8i0v6KHmeHlJ9sjhIQG
	IPSgBqZ8Tyi8M+gHJJzTaf0YOD+nXX8icEgigutZrc8x3eJuTo11iYDfUVSlIPU9q1JjOvXSzieIF
	EytzLuBYMpgc9GjWZkyjmSmYcRrluihfBqZi3SuwNZPEwas3YUCsy+67pXkHLTp/zMHiXxAKjxf4a
	ubkDmb/WMPZXMn+o8pLIhkIGP+oQeOnGKswErH+IgyUsCyaFSYxG8GhbsuYDKfVJy0QKOUoY4O3fF
	np743/aA==;
Received: from [2601:1c0:6280:3f0::a6b3]
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSoAp-00DBzI-3i; Mon, 29 Aug 2022 23:28:07 +0000
Message-ID: <65f56cde-3df5-d912-82c6-fbac9eceffbf@infradead.org>
Date: Mon, 29 Aug 2022 16:28:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH] >>>>>>>>>>>>>>>>>>>>>>>>> BLURB <<<<<<<<<<<<<<<<<<<
Content-Language: en-US
To: linux-doc@vger.kernel.org
References: <20220829232653.25060-1-rdunlap@infradead.org>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20220829232653.25060-1-rdunlap@infradead.org>
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
Cc: linuxppc-dev@lists.ozlabs.org, Jeremy Kerr <jk@ozlabs.org>, Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Oops.
I'll correct the Subject and resend.


On 8/29/22 16:26, Randy Dunlap wrote:
> Fix a typo of "or" which should be "of".
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Jeremy Kerr <jk@ozlabs.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: Jonathan Corbet <corbet@lwn.net>
> ---
>  Documentation/filesystems/spufs/spufs.rst |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- a/Documentation/filesystems/spufs/spufs.rst
> +++ b/Documentation/filesystems/spufs/spufs.rst
> @@ -227,7 +227,7 @@ Files
>                from the data buffer, updating the value of the specified signal
>                notification register.  The signal  notification  register  will
>                either be replaced with the input data or will be updated to the
> -              bitwise OR or the old value and the input data, depending on the
> +              bitwise OR of the old value and the input data, depending on the
>                contents  of  the  signal1_type,  or  signal2_type respectively,
>                file.
>  

-- 
~Randy
