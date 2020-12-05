Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0E62CFA02
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Dec 2020 07:25:51 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cp0243DHSzDqjg
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Dec 2020 17:25:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sboyd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=T4bFnift; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cp00B5yYzzDqgN
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Dec 2020 17:24:10 +1100 (AEDT)
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607149448;
 bh=r8vnqMmsHnbgwMXfSQZu84loY6DvrmHia8Sx1hc/RJQ=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=T4bFniftvCd2jeC6yESokQyOHoTMxC9vK6miqN2mi2XZsBNpieVpWrZWJ4/ROoVau
 zIweZB3ouv+2OYfFYhW50zG34k1z/GoAAlXVdYhFfPpHAER9uNSy+ACWR4QnDhGuRN
 uF3ewwCPsC0jNHoOsylZXbRo6pbi2K8WY92Dbcw+L49AQqk8J0jnR3fXB3D8pc9QKD
 HkId29E+OBrSUtnds5+Pr4+rygtaP4uF6TpHP1UUg/g/s/MIu62pjr25Y6h887D3mo
 0ABFaab5sm2/qsL/H6aOQgE5NCXBPsqOngGLlOeALbEVA6UTuZ/AUtHNc8K05eNVem
 BV/WPUFP1yU7w==
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201130085743.1656317-1-geert+renesas@glider.be>
References: <20201130085743.1656317-1-geert+renesas@glider.be>
Subject: Re: [PATCH v2] clk: renesas: r9a06g032: Drop __packed for portability
From: Stephen Boyd <sboyd@kernel.org>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Michael Turquette <mturquette@baylibre.com>, Paul Mackerras <paulus@samba.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 04 Dec 2020 22:24:06 -0800
Message-ID: <160714944657.1580929.4595234852977229885@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 Gareth Williams <gareth.williams.jx@renesas.com>,
 linux-renesas-soc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-clk@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Quoting Geert Uytterhoeven (2020-11-30 00:57:43)
> The R9A06G032 clock driver uses an array of packed structures to reduce
> kernel size.  However, this array contains pointers, which are no longer
> aligned naturally, and cannot be relocated on PPC64.  Hence when
> compile-testing this driver on PPC64 with CONFIG_RELOCATABLE=3Dy (e.g.
> PowerPC allyesconfig), the following warnings are produced:
>=20
>     WARNING: 136 bad relocations
>     c000000000616be3 R_PPC64_UADDR64   .rodata+0x00000000000cf338
>     c000000000616bfe R_PPC64_UADDR64   .rodata+0x00000000000cf370
>     ...
>=20
> Fix this by dropping the __packed attribute from the r9a06g032_clkdesc
> definition, trading a small size increase for portability.
>=20
> This increases the 156-entry clock table by 1 byte per entry, but due to
> the compiler generating more efficient code for unpacked accesses, the
> net size increase is only 76 bytes (gcc 9.3.0 on arm32).
>=20
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Fixes: 4c3d88526eba2143 ("clk: renesas: Renesas R9A06G032 clock driver")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

Unless you want me to pick this up for clk-fixes?
