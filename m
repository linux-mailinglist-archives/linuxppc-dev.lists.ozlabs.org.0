Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A773D6098AB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Oct 2022 05:21:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MwgMQ21hYz3c6k
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Oct 2022 14:21:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm1 header.b=vuZrne0j;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=T36df/Y3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=russell.cc (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com; envelope-from=ruscur@russell.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm1 header.b=vuZrne0j;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=T36df/Y3;
	dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MwgLV0HYvz2xJN
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Oct 2022 14:20:17 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 013845C00B5;
	Sun, 23 Oct 2022 23:20:16 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Sun, 23 Oct 2022 23:20:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1666581615; x=
	1666668015; bh=2gJpJ7akxhZjMTe1TnBqQLyKz4hf0Ei7snaoUkc6FdY=; b=v
	uZrne0jg+2yoG3Wyke559mXi9L8HwBvXGuNsa5JX2JghGnbiA90A+60Sald6h9jr
	wBHrA3UISX/pjrOMvc0dkTHVcY8mHCpCnAKGgFI+lIzPnXlxiTJYJPpVkjWK0xS2
	nIiQPSJlAs9NhoQbRTjaLlpwg8pqYhbFhny+5oQZLnhzusxBUcxLfyA5nNPQohYC
	2XN5EbK9Ngg5fcqhhcVB7wns4ARziYnEnLeTCc8c6QIes4xllG3rGsbaffaHj6C2
	FmDflxqj7V3Sl803hMxQz6BMdua5/L9REcx/CArSIq4kthM7vmohf2W9zLSI6kLP
	FkLGwgJ+wZpBO74prYgZg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1666581615; x=
	1666668015; bh=2gJpJ7akxhZjMTe1TnBqQLyKz4hf0Ei7snaoUkc6FdY=; b=T
	36df/Y3t4mXx6e0OZUIzvG6EtBtlwZsCnvkeaUHWuGywnEqvKeemGACa825gdfnv
	cR3j4lRPNdgvN+iHchhYvk2OaS2TtgSa0Df5b1TLkkqr4rLmSxJgwtW2EfMf9cC7
	PruKs7KSbhe6SJ/Jw27kaVzg76uCTDc1tVUJSAEW/8qNvD4inwc2ZMadx+gHRCva
	KJCpebLVN+nrrVe/Eahse5OyuWyFwIf6AX64cxXuzi8rmCNwIglrWhV/besTt9zF
	lLrrJK+Sii9jWBSPdWrl9g5gkPi1sodIrpfypNxaLqFWxluKRWDWp5EyC3gylpY1
	RGlCTP/xD9tvB54ioHp4g==
X-ME-Sender: <xms:bwRWY70n1IxZ3m6bmPNApDZXLcd8crkrPnH0BTlcoCLLLwFzffhA5A>
    <xme:bwRWY6HVOmJqk-XPQY0Y6OuwJy80qQuHtjUrqSCdfKmYINA-dv-LPx73RXD0xWqpz
    MQnNFfeob1-1YlBjg>
X-ME-Received: <xmr:bwRWY77zxzQZsAztzZg92zTNh-912GYrP0IAQZ66YFKXOlKtWBfcIbFRjVifLT6Fyh1o5w8TDZgmnaMZivA8WQ-pM0JsGpiGx38NEkng2vt4lw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgedtfedgjedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdludehmdenucfjughrpefkuffhvfevffgjfhgtgfgfggesthhqredt
    tderjeenucfhrhhomheptfhushhsvghllhcuvehurhhrvgihuceorhhushgtuhhrsehruh
    hsshgvlhhlrdgttgeqnecuggftrfgrthhtvghrnheptefgieelhfeufeevvdekheeifeej
    gfefgeehtedukeeigfduuddtueekteevleelnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomheprhhushgtuhhrsehruhhsshgvlhhlrdgttg
X-ME-Proxy: <xmx:bwRWYw3oKtpWJqaVcEJiUXbEx9QQOdwkTBphiPEltLMfMg95zq18nw>
    <xmx:bwRWY-E_AN9oybGNYMHk3AWyF0EXKMr_1E73nydQsTayehEGs2nW9g>
    <xmx:bwRWYx_10a4cXGYHtqVBalTLC0WSZYWXwJixsVMkw1WoeVeodr9cVA>
    <xmx:bwRWY7NrMDM0l1CmndkQ_grH3qPUNOTJe7tb5fjt_a8YE_SLGtZh3g>
Feedback-ID: i4421424f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 23 Oct 2022 23:20:13 -0400 (EDT)
Message-ID: <d5febacfc792876848bd4ba58f43b0e24450f250.camel@russell.cc>
Subject: Re: [PATCH v8 3/6] powerpc/code-patching: Verify instruction patch
 succeeded
From: Russell Currey <ruscur@russell.cc>
To: Benjamin Gray <bgray@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Date: Mon, 24 Oct 2022 14:20:11 +1100
In-Reply-To: <20221021052238.580986-4-bgray@linux.ibm.com>
References: <20221021052238.580986-1-bgray@linux.ibm.com>
	 <20221021052238.580986-4-bgray@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
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
Cc: jniethe5@gmail.com, cmr@bluescreens.de, npiggin@gmail.com, ajd@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2022-10-21 at 16:22 +1100, Benjamin Gray wrote:
> Verifies that if the instruction patching did not return an error
> then
> the value stored at the given address to patch is now equal to the
> instruction we patched it to.
>=20
> Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
> ---
> =C2=A0arch/powerpc/lib/code-patching.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/arch/powerpc/lib/code-patching.c
> b/arch/powerpc/lib/code-patching.c
> index 34fc7ac34d91..9b9eba574d7e 100644
> --- a/arch/powerpc/lib/code-patching.c
> +++ b/arch/powerpc/lib/code-patching.c
> @@ -186,6 +186,8 @@ static int do_patch_instruction(u32 *addr,
> ppc_inst_t instr)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0err =3D __do_patch_instru=
ction(addr, instr);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0local_irq_restore(flags);
> =C2=A0
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0WARN_ON(!err && !ppc_inst_equa=
l(instr, ppc_inst_read(addr)));
> +

As a side note, I had a look at test-code-patching.c and it doesn't
look like we don't have a test for ppc_inst_equal() with prefixed
instructions.  We should fix that.

> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return err;
> =C2=A0}
> =C2=A0#else /* !CONFIG_STRICT_KERNEL_RWX */

