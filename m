Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E3B6F9EA5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 May 2023 06:25:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QF7Vr39NKz3cBK
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 May 2023 14:25:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm1 header.b=jJ6UTB/w;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=aUtX96ob;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=russell.cc (client-ip=64.147.123.21; helo=wout5-smtp.messagingengine.com; envelope-from=ruscur@russell.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm1 header.b=jJ6UTB/w;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=aUtX96ob;
	dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QF7V11F1Vz305g
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 May 2023 14:24:23 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 2E5763200910;
	Mon,  8 May 2023 00:24:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Mon, 08 May 2023 00:24:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1683519860; x=1683606260; bh=w1Tzbhb+7jqHUt9vhYbnrjGHXu2FGvq8uBV
	NBYFWEgE=; b=jJ6UTB/wIdqRyaanpHQuhcb2vhv9SyL93mM167jXZf28i6K6qxP
	vyMfZU3no8zITk2wzRSnSjmK+dZIK43UHRiBcyBgqkyVE0LJMm8EMjCrUUTTQ+wx
	jz77Ptk7uxT4IieKSbNQzZGgLKifj7zMuuwO8ujKAyFV/+O64fjOI4c8b+gzUxbT
	xYvi8CmwPPDBH1DcKphesAPpjrJ97BSwRZOdQGZF7+Pk+QTGxbotUZYsNrdcgx/0
	HpjlBaLpZvEJRXmF86FWx7hKK6+LsiY0WuAGbA5S48e1Udrb1WCi47QYGzLZvcmy
	84geW8cKhyAF0Kw4NSK0qDBwJE6q7gygVUw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1683519860; x=1683606260; bh=w1Tzbhb+7jqHUt9vhYbnrjGHXu2FGvq8uBV
	NBYFWEgE=; b=aUtX96obFZWNcS5ptjx2qS+SlWG8Uy+BXTiKU3X7juaZ6tg0GpU
	SN0tWhF2ulBaDDJDJe+3KRnAQxXZA6RZ++K8v+ZVQ1cNoMQaIG50+3WxmRKh5c1a
	eJQW4BrEDgSEOtZ/tTf40DXvekrtIWJyM6fH2clQdu9viugxI62aaE5j2aX9mKzg
	sjc/2/5PEjLVA4lCNnnr0rHXejTWVM3KCN/vvgAe/1kNurDpTj+oJI88dm4Onq6t
	taRztSQ53II2PkfWTEk9Jcqq85b2VX21958RFqD5w1Bp5EpLJ0Pyr00anjm7X9kY
	0Jpux2QTI8vtFA9AmhKhFYHTIhrfUk+9BXw==
X-ME-Sender: <xms:c3lYZBoCyMv-Ov5VEw6mkm9Q2X7XU12qBFYXOnGlKQLOR8iFnM_x4g>
    <xme:c3lYZDpd-jnuD6GJahfa3Op4bEWAGq2AScwJg-LAC-3QNI4bcs-auNCWOnsgLv8xp
    pz0bbcrMINFHBuLrw>
X-ME-Received: <xmr:c3lYZOMlNNQnsWsVp5Wxmjq6XLimTbWzxtVgA76bCOP2O5J54oy9Vdc09FLgl5TSaLRoKSTtt94RqR-eWVnvLNU-GQqoGaE8jaX4aEbQR1rbLA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefjedgkeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdludehmdenucfjughrpefkuffhvfevffgjfhgtgfgfggesthhqredt
    tderjeenucfhrhhomheptfhushhsvghllhcuvehurhhrvgihuceorhhushgtuhhrsehruh
    hsshgvlhhlrdgttgeqnecuggftrfgrthhtvghrnheptefgieelhfeufeevvdekheeifeej
    gfefgeehtedukeeigfduuddtueekteevleelnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomheprhhushgtuhhrsehruhhsshgvlhhlrdgttg
X-ME-Proxy: <xmx:dHlYZM5_ZUC3rKTe4P542O2r6x38xxn9j-L2A2nTZsgqHKpvOKyjTQ>
    <xmx:dHlYZA5DNk4Z5QBcUxfDQxjZY4jDg8INtn8sAtnBK6wbShtblgVROA>
    <xmx:dHlYZEi9J4NO732RVa1ETv-ouZPaELJq2JLB5pVDoH1pRA96KKVCsQ>
    <xmx:dHlYZOR2k92_NFlya6asmNyqNQc5VIWOSwaipAefFXETRLRZlbVT_g>
Feedback-ID: i4421424f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 8 May 2023 00:24:18 -0400 (EDT)
Message-ID: <295e7c5e9f38d6ea21baa876f9365fa65dc2d39a.camel@russell.cc>
Subject: Re: [PATCH v2 06/12] powerpc/dexcr: Support custom default DEXCR
 value
From: Russell Currey <ruscur@russell.cc>
To: Benjamin Gray <bgray@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Date: Mon, 08 May 2023 14:24:16 +1000
In-Reply-To: <20230330055040.434133-7-bgray@linux.ibm.com>
References: <20230330055040.434133-1-bgray@linux.ibm.com>
	 <20230330055040.434133-7-bgray@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1 (3.48.1-1.fc38) 
MIME-Version: 1.0
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
Cc: npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2023-03-30 at 16:50 +1100, Benjamin Gray wrote:
> Make the DEXCR value configurable at config time. Intentionally don't
> limit possible values to support future aspects without needing
> kernel
> updates.
>=20
> The default config value enables hashst/hashchk in problem state.
> This should be safe, as generally software needs to request these
> instructions be included in the first place.
>=20
> Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
>=20

Reviewed-by: Russell Currey <ruscur@russell.cc>

> ---
> New in v1
>=20
> Preface with: I'm note sure on the best place to put the config.

Me neither.

>=20
> I also don't think there's any need to zero out unknown/unsupported
> bits. Reserved implies they are ignored by the hardware (from my
> understanding of the ISA). Current P10s boot with all bits set;
> lsdexcr
> (later patch) reports
>=20
> =C2=A0=C2=A0 uDEXCR: ff000000 (SBHE, IBRTPD, SRAPD, NPHIE, PHIE, unknown)
>=20
> when you try to read it back. Leaving them be also makes it easier to
> support newer aspects without a kernel update.
>=20
> If arbitrary value support isn't important, it's probably a nicer
> interface to make each aspect an entry in a menu.
>=20
> Future work may include dynamic DEXCR controls via prctl() and sysfs.
> The dynamic controls would be able to override this default DEXCR on
> a
> per-process basis. A stronger "PPC_ENFORCE_USER_ROP_PROCTETION"
> config
> may be required at such a time to prevent dynamically disabling the
> hash checks.
> ---
> =C2=A0arch/powerpc/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 14 ++++++++++++=
++
> =C2=A0arch/powerpc/kernel/cpu_setup_power.c |=C2=A0 3 ++-
> =C2=A02 files changed, 16 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 47017975fc2b..809ae576e19f 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -1035,6 +1035,20 @@ config PPC_MEM_KEYS
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 If unsure, say y.
> =C2=A0
> +config PPC_DEXCR_DEFAULT

Calling it "default" could be slightly misleading since there's no
other way to modify the DEXCR right now.  It'll make more sense once
it's user configurable though.


> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0hex "Default DEXCR value"
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0default 0x0000000004000000
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0depends on PPC_BOOK3S_64
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0help
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Power10 introduces the =
Dynamic Execution Control Register
> (DEXCR)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 to provide fine grained=
 control over various speculation
> and
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 security capabilities. =
This is used as the default DEXCR
> value.
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 It is a 64 bit value th=
at splits into 32 bits for
> supervisor mode
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 and 32 bits for problem=
 state. The default config value
> enables
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 the hashst/hashck instr=
uctions in userspace. See the ISA
> for

hashchk*

May also be useful to reference the ISA version here.

> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 specifics of what each =
bit controls.
> +
> =C2=A0config PPC_SECURE_BOOT
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0prompt "Enable secure boo=
t support"
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bool
> diff --git a/arch/powerpc/kernel/cpu_setup_power.c
> b/arch/powerpc/kernel/cpu_setup_power.c
> index c00721801a1b..814c825a0661 100644
> --- a/arch/powerpc/kernel/cpu_setup_power.c
> +++ b/arch/powerpc/kernel/cpu_setup_power.c
> @@ -10,6 +10,7 @@
> =C2=A0#include <asm/reg.h>
> =C2=A0#include <asm/synch.h>
> =C2=A0#include <linux/bitops.h>
> +#include <linux/kconfig.h>
> =C2=A0#include <asm/cputable.h>
> =C2=A0#include <asm/cpu_setup.h>
> =C2=A0
> @@ -128,7 +129,7 @@ static void init_PMU_ISA31(void)
> =C2=A0
> =C2=A0static void init_DEXCR(void)
> =C2=A0{
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mtspr(SPRN_DEXCR, 0);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mtspr(SPRN_DEXCR, CONFIG_PPC_D=
EXCR_DEFAULT);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mtspr(SPRN_HASHKEYR, 0);
> =C2=A0}
> =C2=A0

