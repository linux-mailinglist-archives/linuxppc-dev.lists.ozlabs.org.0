Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D1B639646
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Nov 2022 15:08:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NKD914Qqrz3f4J
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Nov 2022 01:08:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=PAzqgy9n;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=PAzqgy9n;
	dkim-atps=neutral
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NKD8364wJz3bgC
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Nov 2022 01:07:31 +1100 (AEDT)
Date: Sat, 26 Nov 2022 15:07:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
	s=mail; t=1669471647;
	bh=yXORdDaM5IB4Oq8We4CxZr/JSohcHmOU7RYUv4Jkuwo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PAzqgy9nLteY56ElyaMCWe7M0VeqKwuE4Yd4UaIwW6TDirWAo8dfzmY8MSsg3O3cx
	 DU2AUxUNbUv9HSqWmJxYPWtfy2PlP86FYrC4VHOI9bjZNPBt82jYV5u2OuiBaWJPGt
	 H37qirgRdVgY8R2HN5aKq7uJgGFZhs0EsN4VoNLU=
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 2/3] powerpc/book3e: remove #include
 <generated/utsrelease.h>
Message-ID: <8f8b12fd-2e25-49e4-a1fa-247f08f56454@t-8ch.de>
References: <20221126051002.123199-1-linux@weissschuh.net>
 <20221126051002.123199-2-linux@weissschuh.net>
 <03859890-bf90-4ad0-1926-4b8cb8dbfa57@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <03859890-bf90-4ad0-1926-4b8cb8dbfa57@csgroup.eu>
Jabber-ID: thomas@t-8ch.de
X-Accept: text/plain, text/html;q=0.2, text/*;q=0.1
X-Accept-Language: en-us, en;q=0.8, de-de;q=0.7, de;q=0.6
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Russ Weight <russell.h.weight@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Masahiro Yamada <masahiroy@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Luis Chamberlain <mcgrof@kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2022-11-26 07:36+0000, Christophe Leroy wrote:
> Le 26/11/2022 à 06:10, Thomas Weißschuh a écrit :
>> Commit 7ad4bd887d27 ("powerpc/book3e: get rid of #include <generated/compile.h>")
>> removed the usage of the define UTS_VERSION but forgot to drop the
>> include.
> 
> What about:
> arch/powerpc/platforms/52xx/efika.c
> arch/powerpc/platforms/amigaone/setup.c
> arch/powerpc/platforms/chrp/setup.c
> arch/powerpc/platforms/powermac/bootx_init.c
> 
> I believe you can do a lot more than what you did in your series.

The commit messages are wrong.
They should have said UTS_RELEASE instead of UTS_VERSION.

Could the maintainers fix this up when applying?
I also changed it locally so it will be fixed for v2.

> List of files using UTS_VERSION :
> 
> $ git grep -l UTS_VERSION
> [..]

Thomas
