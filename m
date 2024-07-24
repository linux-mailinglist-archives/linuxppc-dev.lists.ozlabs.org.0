Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C0C93B105
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2024 14:45:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=j7+6wc+o;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WTYd843Dsz3cp1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2024 22:45:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=j7+6wc+o;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WTYcQ4nZ8z3bnL
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jul 2024 22:44:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1721825054;
	bh=axqxpBEodghaFEC84iaFxG1Fg6FcJm7D5vj0S1d76bc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=j7+6wc+o2TsweX3Z5PfOS6gaprPUl8dm68CUZZ0KGwcd+w/QGQAZeI8cUJnIHFFD5
	 ZMd6ju08+StXclLUSRcxlRhZ12+3dbPUmopVG4qtt6J3JczC3zhCp/+38NAgSGoTt2
	 CApJVdT29LtWidDz2DDJNbg41Gn4UZgA0fomm5OJrVzn0Ex4t4PsZr1mlgxYVsshxe
	 y6jYvqfWTiKhdullHOD/x/H/ZLOoUrrWUTzKbhdxW4hHdFeVVtbPwllNVIz5Rvdv+F
	 lxEeRdXsJ3N/9oQvjaDOSdcTEPas3kShC9LIDyDAnKsHovrnaHTwjJzKX5TY7ieyM+
	 k5vQbagJjdRIg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WTYcC2QHnz4wc2;
	Wed, 24 Jul 2024 22:44:11 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Lasse Collin <lasse.collin@tukaani.org>, Andrew Morton
 <akpm@linux-foundation.org>
Subject: Re: [PATCH v2 17/16] xz: Remove XZ_EXTERN and extern from functions
In-Reply-To: <20240724110544.16430-1-lasse.collin@tukaani.org>
References: <20240721133633.47721-1-lasse.collin@tukaani.org>
 <20240724110544.16430-1-lasse.collin@tukaani.org>
Date: Wed, 24 Jul 2024 22:44:10 +1000
Message-ID: <8734nzvu1x.fsf@mail.lhotse>
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
Cc: Lasse Collin <lasse.collin@tukaani.org>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, Sam James <sam@gentoo.org>, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Lasse Collin <lasse.collin@tukaani.org> writes:
> XZ_EXTERN was used to make internal functions static in the preboot code.
> However, in other decompressors this hasn't been done. On x86-64, this
> makes no difference to the kernel image size.
>
> Omit XZ_EXTERN and let some of the internal functions be extern in the
> preboot code. Omitting XZ_EXTERN from include/linux/xz.h fixes warnings
> in "make htmldocs" and makes the intradocument links to xz_dec functions
> work in Documentation/staging/xz.rst. The alternative would have been to
> add "XZ_EXTERN" to c_id_attributes in Documentation/conf.py but omitting
> XZ_EXTERN seemed cleaner.
>
> Link: https://lore.kernel.org/lkml/20240723205437.3c0664b0@kaneli/
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-doc@vger.kernel.org
> Signed-off-by: Lasse Collin <lasse.collin@tukaani.org>
> ---
>
> Notes:
>     This touches xz_config.h in PowerPC boot code. I haven't tested it but
>     zlib's functions are extern in the same context, thus this should be
>     a safe change on PowerPC.
     
I gave it a quick build and boot, seems fine.

Tested-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers
