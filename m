Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 377945A7797
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Aug 2022 09:36:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MHbbB4RM9z3c8h
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Aug 2022 17:36:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=nR4RDBmt;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=i56a14606.fm1 header.b=L8StyYpb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=66.111.4.230; helo=new4-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=nR4RDBmt;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=i56a14606.fm1 header.b=L8StyYpb;
	dkim-atps=neutral
X-Greylist: delayed 554 seconds by postgrey-1.36 at boromir; Wed, 31 Aug 2022 17:35:56 AEST
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com [66.111.4.230])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MHbZN5VqTz2xn5
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Aug 2022 17:35:56 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailnew.nyi.internal (Postfix) with ESMTP id 22188580551
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Aug 2022 03:26:38 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Wed, 31 Aug 2022 03:26:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1661930798; x=
	1661934398; bh=SpmvgAZmShrF0l7gD6cdrt516aXO97qP2DhvL2kbjew=; b=n
	R4RDBmtiT22kKeY4+hkrxH7/rOTmWVq+AnBcrvmzBpbwrUcGFZ1ytoAGVAyViql4
	DDSoq23/TmGWfj9hoYFxBSShGIW63I97yQ2+OyN8hInhBekNZJqiLMkxOtVbzVNM
	IuMtRGUUnug6ZEE58ML4IQmm7spwL8sFtZXKzaxsBGRuT6/9fkbdLe0S7pIGVAfo
	mbR1YV8roGjehUyigvXeOEm+yOyaNn6Rp8OhQLtwRI7y3GZxQgVxZLuABp9oPa9B
	JszTFAtg9Fsx7tqmUHQTkrv7jHCPhrH4e+LS0moBcHRaBQchh3xNftZRAd6UGSbk
	5KGOOhY7UyoTgeZvXINxA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:date:feedback-id:feedback-id:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=i56a14606.fm1; t=1661930798; x=
	1661934398; bh=SpmvgAZmShrF0l7gD6cdrt516aXO97qP2DhvL2kbjew=; b=L
	8StyYpbaCCUVBeIjtA5FOXmCPVd9bqMEzqLudd6N2f6BmsP/Kr6k2RmKd/PyXVxJ
	XtxnElNsjknRXxusN+5b2uGQv25a3UNtZ2GZRVc8kJSsrY323Hx1wabDjCfm/wib
	sbyN6nHlMLZqdzyBEK3pqiHaQJQxwd1RqSp5ENwwwe+4iLzv63IMm54rmmov3A0a
	JcbXF7dzd/F5nREz5l3+WHtVscXVCOx8OgCv6/YAjdiQ1i2LxFmLS68DCBiERTkQ
	sLbiVW7y3JV5R7Jdza/7jWUQbNO9HqCNqzyCanJTxhke99Cc09s1EQuuUQhZJyue
	/ii28FYxP++5uSsmq2v7Q==
X-ME-Sender: <xms:LQ0PY25AgkvZhdBl4UCDkM_4--caDFmS8q0UkwAoSllLmK2nr46f-A>
    <xme:LQ0PY_5etj21fLWA2qgpnWQXWPjFGsX3rNKjQu8g-RsFyeoJGyzpjoectxmxnNH8N
    J1zeRNva4cLa552HrU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdekgedguddvfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvffutgfgse
    htqhertderreejnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgu
    segrrhhnuggsrdguvgeqnecuggftrfgrthhtvghrnhepjeeghfeutdejjeehudevgeehve
    duffejkefhveefgfettdehgeeiledufeeuvdfhnecuvehluhhsthgvrhfuihiivgeptden
    ucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:LQ0PY1f-hu1PHLPlzKkYlBcpT9OD-X5Gvq4tBpaMvpGmqJjL_bg3IQ>
    <xmx:LQ0PYzLhE5rR5eozADMB_BeYEbnAzjEuZwpvpYnBppWzy5VROSFjNw>
    <xmx:LQ0PY6KSJakDkX8fhG4zWNMrVBOH33PzwJ3ElpyKzzkczMHIR6Y1TA>
    <xmx:LQ0PY_UKBdBeYHaCQVI7zrI-9XRmf9DWKWZxhhE0ZqlFIBAYxJAR5Q>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id B0878B60083; Wed, 31 Aug 2022 03:26:37 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-841-g7899e99a45-fm-20220811.002-g7899e99a
Mime-Version: 1.0
Message-Id: <a5d148c1-70c1-4e86-a50c-7dc6da45ff2f@www.fastmail.com>
In-Reply-To: <20220830230012.9429-1-pali@kernel.org>
References: <20220820102925.29476-1-pali@kernel.org>
 <20220830230012.9429-1-pali@kernel.org>
Date: Wed, 31 Aug 2022 09:26:17 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 1/3] dt-bindings: reset: syscon-reboot: Add priority property
Content-Type: text/plain;charset=utf-8
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Aug 31, 2022, at 1:00 AM, Pali Roh=C3=A1r wrote:
> a/Documentation/devicetree/bindings/power/reset/syscon-reboot.yaml=20
> b/Documentation/devicetree/bindings/power/reset/syscon-reboot.yaml
> index da2509724812..4c8b0d0a0111 100644
> --- a/Documentation/devicetree/bindings/power/reset/syscon-reboot.yaml
> +++ b/Documentation/devicetree/bindings/power/reset/syscon-reboot.yaml
> @@ -42,6 +42,11 @@ properties:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      description: The reset value written to the reboot register (32=20
> bit access).
>=20
> +  priority:
> +    $ref: /schemas/types.yaml#/definitions/int32
> +    description: Priority level of this syscon reset device.
> +    default: 192
> +

My first thought was that this is looks very Linux specific and
probably should be documented as such. However I see there is
already precedent in
Documentation/devicetree/bindings/power/reset/gpio-restart.yaml,
which defines the same thing with a more detailed description.

Since this is an optional property for both, and it has the
same meaning here, is it possible to move the description
to a common place where it either gets included from both,
or from all reboot bindings?

       Arnd
