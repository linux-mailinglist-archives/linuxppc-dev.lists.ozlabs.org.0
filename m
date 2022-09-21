Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DAF5E5467
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 22:17:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXqTr5wvGz3c7S
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Sep 2022 06:17:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=L5aeFcga;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lwn.net (client-ip=2600:3c01:e000:3a1::42; helo=ms.lwn.net; envelope-from=corbet@lwn.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=L5aeFcga;
	dkim-atps=neutral
X-Greylist: delayed 399 seconds by postgrey-1.36 at boromir; Thu, 22 Sep 2022 06:17:21 AEST
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXqTF5WWMz3bjX
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Sep 2022 06:17:21 +1000 (AEST)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 97199735;
	Wed, 21 Sep 2022 20:10:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 97199735
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1663791036; bh=rQl+CymfSQQypN8moZ074ZUL1pvye2cOujrnDu9whYo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=L5aeFcga4dqANUzXyNiZboNQdCPf8Bwbi96o3dWSLcjHerKVJyz4d7pp4TdnxW16F
	 fMNucBfvP6zcXTraAuMpZA04KH6e1U4AN9tooGES30w19savDWqrkYh7iZD0Cgy3Pd
	 ebNZtolrLtCIZDJT+Pg+7fY/4Sv8IUmTrz9BcjxKrNbw9VBI0xBRFT+nZPkGCBEO22
	 ieXqTSGmss4/gOi6SGq+LjJG0D+QSssyPOWDbg/3GBROOGFG/0wCx7nYJKuM75ula8
	 8kqUoshDWsfWtLef+SBuDXpxLvlgzIj7oOhrtiu9YtdbVnBqpSd2HxDaeRAFTbjXBC
	 uWoZ6nXGbcyEQ==
From: Jonathan Corbet <corbet@lwn.net>
To: Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation: spufs: correct a duplicate word typo
In-Reply-To: <20220829232908.32437-1-rdunlap@infradead.org>
References: <20220829232908.32437-1-rdunlap@infradead.org>
Date: Wed, 21 Sep 2022 14:10:35 -0600
Message-ID: <878rmcv684.fsf@meer.lwn.net>
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
Cc: Randy Dunlap <rdunlap@infradead.org>, linuxppc-dev@lists.ozlabs.org, Jeremy Kerr <jk@ozlabs.org>, Arnd Bergmann <arnd@arndb.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Randy Dunlap <rdunlap@infradead.org> writes:

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

Applied, thanks.

jon
