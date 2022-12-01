Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9FE63F526
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 17:22:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NNLv62NQVz3bct
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Dec 2022 03:22:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=benboeckel.net header.i=@benboeckel.net header.a=rsa-sha256 header.s=fm1 header.b=SQKOgA4j;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=tutfjdV2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=benboeckel.net (client-ip=64.147.123.24; helo=wout1-smtp.messagingengine.com; envelope-from=me@benboeckel.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=benboeckel.net header.i=@benboeckel.net header.a=rsa-sha256 header.s=fm1 header.b=SQKOgA4j;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=tutfjdV2;
	dkim-atps=neutral
X-Greylist: delayed 470 seconds by postgrey-1.36 at boromir; Fri, 02 Dec 2022 03:20:58 AEDT
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NNLsk5jR1z3bdr
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Dec 2022 03:20:58 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 0DE55320092E;
	Thu,  1 Dec 2022 11:13:01 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Thu, 01 Dec 2022 11:13:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=benboeckel.net;
	 h=cc:cc:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1669911181; x=1669997581; bh=6v
	WBmCicNUpqFiwGEvCj2T5kO+IGX5hkCfNsBIQgI/Y=; b=SQKOgA4jCw2br75keg
	5nM25Ni3AazbVgIu9kO/GFjV1GB+mxDVtNS3EgRwHiLst+FuAgqrCvbPy1yXQ96J
	MVqGkb0qOKo1WJU/Z28k/nemEolAPiD+Td3YlnzFINRxN6qB9X2KpF/L06Sm3B54
	nfA8VPFb2iLVmKIDpvikU8yhdiwdAxhwW7eSJGCas6AG6DyN2iVCCKg2NVn78iGO
	IqmbzbWTmbZP5Zv3MZ9h+ywzSS4Lde3rYMAs7MXemeAGh5gWvNsk0ufMEekaIDUU
	xQ3ZukJoPzuPHzNRLRfV4k73IDp5i26gRy+8mosGx5qWK1JWb7oWP2sHWdAYVqkk
	gSMg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1669911181; x=1669997581; bh=6vWBmCicNUpqFiwGEvCj2T5kO+IG
	X5hkCfNsBIQgI/Y=; b=tutfjdV228slV4DB1ouLQaOkA3QksQHTgae4JoI5dvzE
	CyVOxLAmykS23EhjNR1AVUJH71dR2/5g+QhwCimj9h4a11u6zXeiEtoynHnly2zJ
	PZirfTzThPfC+c7Rn6QYdzmuD9ScQH5ejHY/sFRNazIO/WlW0X3s3J1yyDhRHQsO
	qkA/ZhRdQBqlBhm4H1HkEzk3XEHuwNxBerIBA0YC2AG90r579LIHUZ6TNzrMqY4g
	DSimavHWsWQZyUMNuMHB+UJPpHW+hxPzE8lElUWT9awbfIMoAtRcQBaH7CwdSH/I
	ulX2IlSjKvSKyKCLluHA+us7l74aBzgH29D2VTIp5g==
X-ME-Sender: <xms:jNKIY5I9iz2oqKqTm3X5W1WY_FqxbtunWpiADiDbguKkw8Fp4lzNfQ>
    <xme:jNKIY1J_KPTt6qlT9V9kdaop9OhZt0TyhVkfHKxlvnLFidLfq2jK3CS0wVARp7-Zc
    CzmjA1hLllEcaUfT9w>
X-ME-Received: <xmr:jNKIYxs6msp1s68Tv3I0KS5bPwB-ivPovyNxbVpXysy3dTwy0J52ZBW5gGrSkZjkjxp0OVOzuHqI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrtdehgdekiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjfgesthdtredttderjeenucfhrhhomhepuegvnhcu
    uehovggtkhgvlhcuoehmvgessggvnhgsohgvtghkvghlrdhnvghtqeenucggtffrrghtth
    gvrhhnpeffleegffevleekffekheeigfdtleeuvddtgffhtddvfefgjeehffduueevkedv
    vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmvg
    essggvnhgsohgvtghkvghlrdhnvght
X-ME-Proxy: <xmx:jNKIY6ZrphNoxj4hpamPyt2_exnHKsKwRkkpJDHITR4zSfLAZMHNqw>
    <xmx:jNKIYwa-3k_8Wnf-SWbMs-ck8qo5e8rs4AaHpaXQIbPChwhsbcwD4Q>
    <xmx:jNKIY-Do_gLsXFcj61oqGTooGttW_RKd2q1TWMaGROr7G4XxQ7FzAA>
    <xmx:jdKIY9TdKPCzY01US0fiMYnLLjNUcFIp8ljYbHhIePiqduNTw0RNlA>
Feedback-ID: iffc1478b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 1 Dec 2022 11:13:00 -0500 (EST)
Date: Thu, 1 Dec 2022 11:12:59 -0500
From: Ben Boeckel <me@benboeckel.net>
To: Greg Joyce <gjoyce@linux.vnet.ibm.com>
Subject: Re: [PATCH v3 3/3] block: sed-opal: keyring support for SED keys
Message-ID: <Y4jSi+pd8D069w4D@megas.dev.benboeckel.internal>
References: <20221129232506.3735672-1-gjoyce@linux.vnet.ibm.com>
 <20221129232506.3735672-4-gjoyce@linux.vnet.ibm.com>
 <c78edd60-b6ae-6ec0-9ce4-73b9a92b9b32@suse.de>
 <2133c00e5e7c53c458dbb709204c955bac8bee88.camel@linux.vnet.ibm.com>
 <Y4gjgf2xHOYTVnSc@farprobe>
 <044c90dc7feb3959b5740154addc230ba9a57216.camel@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <044c90dc7feb3959b5740154addc230ba9a57216.camel@linux.vnet.ibm.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
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
Cc: axboe@kernel.dk, nayna@linux.ibm.com, linux-block@vger.kernel.org, keyrings@vger.kernel.org, Hannes Reinecke <hare@suse.de>, jonathan.derrick@linux.dev, brking@linux.vnet.ibm.com, akpm@linux-foundation.org, msuchanek@suse.de, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Dec 01, 2022 at 09:29:36 -0600, Greg Joyce wrote:
> On Wed, 2022-11-30 at 22:46 -0500, Ben Boeckel wrote:
> > Perhaps naming it `OPAL_MAX_KEY_LEN` would help clarify this?
> 
> I'm not averse to changing it because it would be clearer. My concern
> is that it's been OPAL_KEY_MAX for 5+ years (the original SED Opal
> commit). Unless there is strong consensus to change it, I'm going to
> leave it as the original name.

I don't care about the name (very much in the peanut gallery), just it
not being a magic number :) .

--Ben
