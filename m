Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BA466519D91
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 May 2022 13:03:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KtYqC5Q9Gz3c7f
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 May 2022 21:03:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=oSdsWchJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KtYpZ6fVBz3bbG
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 May 2022 21:03:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=oSdsWchJ; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KtYpR36kMz4x7V;
 Wed,  4 May 2022 21:03:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1651662194;
 bh=LCpTjFnDEwsYkNeVhJ/7ZfUx41S6pzSAGCwTzE+zXeE=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=oSdsWchJ7c6LaWBbTkrN4HY/gAMdpQJZcaKFI7EDhV0JeJSI6Ilrh5JXSrxrO+uBi
 fz7astncBphLXFWCOHhi/UuBJgXcyFzZqYPiGHlIi6X45BigzITOjmK1rMnK6xaTol
 wK+Fl001hFDLFxA3kebNvk3NpO9blGLOH5shsbSldk7k/YPS8CY+2HU/0urlMYnQPi
 3f3A20Ra29iiAIuItwlZHJn/lAKzlgp6ft6XtuAwcXeHVWlSH3tlipFUOHXN4lOi74
 kINmxaDpdRmWpd8ejwQmQIqRTqnHtMk+0OO2DYANcnQC+pIYh1SpDofrsXa2SehLI+
 bhi5wSivAPsvA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Ilpo =?utf-8?Q?J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Greg KH
 <gregkh@linuxfoundation.org>, linux-serial <linux-serial@vger.kernel.org>
Subject: Re: [PATCH 1/1] termbits: Convert octal defines to hex
In-Reply-To: <2c8c96f-a12f-aadc-18ac-34c1d371929c@linux.intel.com>
References: <2c8c96f-a12f-aadc-18ac-34c1d371929c@linux.intel.com>
Date: Wed, 04 May 2022 21:03:09 +1000
Message-ID: <87bkwdv9ua.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-arch@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Arnd Bergmann <arnd@arndb.de>, linux-parisc@vger.kernel.org,
 linux-api@vger.kernel.org, Helge Deller <deller@gmx.de>,
 linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, "James E.J.
 Bottomley" <James.Bottomley@hansenpartnership.com>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-alpha@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Matt Turner <mattst88@gmail.com>,
 Jiri Slaby <jirislaby@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com> writes:
> Many archs have termbits.h as octal numbers. It makes hard for humans
> to parse the magnitude of large numbers correctly and to compare with
> hex ones of the same define.
>
> Convert octal values to hex.
>
> First step is an automated conversion with:
>
> for i in $(git ls-files | grep 'termbits\.h'); do
> 	awk --non-decimal-data '/^#define\s+[A-Z][A-Z0-9]*\s+0[0-9]/ {
> 		l=3Dint(((length($3) - 1) * 3 + 3) / 4);
> 		repl =3D sprintf("0x%0" l "x", $3);
> 		print gensub(/[^[:blank:]]+/, repl, 3);
> 		next} {print}' $i > $i~;
> 	mv $i~ $i;
> done
>
> On top of that, some manual processing on alignment and number of zeros.
> In addition, small tweaks to formatting of a few comments on the same=20
> lines.
>
> Signed-off-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> ---
>
> I prefer this to go in though Greg's tty tree.
>
>  arch/alpha/include/uapi/asm/termbits.h   | 202 ++++++++++-----------
>  arch/mips/include/uapi/asm/termbits.h    | 222 +++++++++++------------
>  arch/parisc/include/uapi/asm/termbits.h  | 220 +++++++++++-----------
>  arch/powerpc/include/uapi/asm/termbits.h | 202 ++++++++++-----------

I ran some horrible awk/sed/python mess over the before and after and
they seem to be numerically identical, so LGTM.

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers
