Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CF520382ABD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 13:17:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FkGnd6RzNz3086
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 21:17:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=N+V8hRpE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=N+V8hRpE; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FkGnD71Xsz2xtk
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 May 2021 21:17:20 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FkGn600Vgz9sWQ;
 Mon, 17 May 2021 21:17:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1621250235;
 bh=nJjXqApLsijq4iamHZjICarpBzR+JQck/GF+uqkszS8=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=N+V8hRpEakOARG2G2zsylDtnrtm26/IFpj+b8IdhWtSPtzR0ev66qahUuCSAGoHAN
 hfsdx08YzYKbX54mNSOnzz6lXmiGemNxw+pbeu3VKi+wYKXseahPwGzJ23NTSANaUh
 xHwGCewelibArv6jzWXb3uBBpegWOMQL0FvHcxreOmoGXvQsHdREig+Mco8inN2fLW
 yUCyLkDIrpCUOTET0vsu942jlCOOgjCNMjTU/+inmTUqbkqhsEP3lnUVJbw3ykYlBK
 fkn1/1hWfVKZzV1UNQKhWHj8U36M4+EXfZM47XlKtCbcJeoysuFvgGbUFAYs889gPp
 msLJxeIat6hdA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Guenter Roeck <linux@roeck-us.net>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH] watchdog: Remove MV64x60 watchdog driver
In-Reply-To: <31d702e5-22d1-1766-76dd-e24860e5b1a4@roeck-us.net>
References: <9c2952bcfaec3b1789909eaa36bbce2afbfab7ab.1616085654.git.christophe.leroy@csgroup.eu>
 <31d702e5-22d1-1766-76dd-e24860e5b1a4@roeck-us.net>
Date: Mon, 17 May 2021 21:17:13 +1000
Message-ID: <87im3hk3t2.fsf@mpe.ellerman.id.au>
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
Cc: netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Guenter Roeck <linux@roeck-us.net> writes:
> On 3/18/21 10:25 AM, Christophe Leroy wrote:
>> Commit 92c8c16f3457 ("powerpc/embedded6xx: Remove C2K board support")
>> removed the last selector of CONFIG_MV64X60.
>> 
>> Therefore CONFIG_MV64X60_WDT cannot be selected anymore and
>> can be removed.
>> 
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
>
>> ---
>>  drivers/watchdog/Kconfig       |   4 -
>>  drivers/watchdog/Makefile      |   1 -
>>  drivers/watchdog/mv64x60_wdt.c | 324 ---------------------------------
>>  include/linux/mv643xx.h        |   8 -
>>  4 files changed, 337 deletions(-)
>>  delete mode 100644 drivers/watchdog/mv64x60_wdt.c

I assumed this would go via the watchdog tree, but seems like I
misinterpreted.

Should I take this via the powerpc tree for v5.14 ?

cheers
