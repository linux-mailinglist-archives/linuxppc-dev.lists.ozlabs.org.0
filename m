Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E569946014
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2024 17:17:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ayq4LRjU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wb8b56wWZz3dWS
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Aug 2024 01:17:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ayq4LRjU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wb8ZQ2bTpz3cjX
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Aug 2024 01:17:02 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 51AF7CE1B14;
	Fri,  2 Aug 2024 15:17:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A399C4AF0D;
	Fri,  2 Aug 2024 15:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722611819;
	bh=3N+B04uKCIlAgIPePxYWuNHTEndJgm1x2so5SryKEkA=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=ayq4LRjUyUulg1JYg2dw4nkA058tvN4M830+/fLyWIuH6LttNr95b0LI35AELwaSV
	 evoOMlVLCJe9WcWS40IgvMj32e8Z4vFvsyYFus2Psgc+2p+ngCgNGMIVPQNt9GX8tR
	 Cvqp3nQs5VCq9bnC5xW9UTBfXeh4CEIgWDj/lizXAmOxiPMRzuJPH7HqsBoH/w8mXn
	 SrcRX9XLSE2MPSqhpyrEzIxu+NUzJv4o0PLq+gpMnVK7OmE+20EQ9erZkbxlGdsdny
	 3vFkcRyJ3ISRWSXgbAUCVNJh7EYGSyqLQPHfl0L6x6aW7e75etarkzhqvjWcS204Fg
	 MCCve1jn/8M0g==
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfauth.nyi.internal (Postfix) with ESMTP id 20EFC120006E;
	Fri,  2 Aug 2024 11:16:58 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute4.internal (MEProxy); Fri, 02 Aug 2024 11:16:58 -0400
X-ME-Sender: <xms:avisZpI4XYancRwgkHIu75asiQmV8SojGgE6Q3xxP13AA5ZRxpZrWQ>
    <xme:avisZlJeEgF7EqFxGIrJKjVCwZ5ez9lqP5DspnG7_0DqVZ1_mrPi7TbclUjQDgBkH
    b0doeemUnn46KgqoWQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrkedtgdekiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugeskhgvrhhnvghlrdhorhhgqeenucggtffrrg
    htthgvrhhnpeejjeffteetfeetkeeijedugeeuvdfgfeefiedtudeikeeggeefkefhudfh
    lefhveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidquddvkeehudejtddv
    gedqvdekjedttddvieegqdgrrhhnugeppehkvghrnhgvlhdrohhrghesrghrnhgusgdrug
    gvpdhnsggprhgtphhtthhopedt
X-ME-Proxy: <xmx:avisZhstiPww3TOhCD55MvuV78pLx_BmboXq5oSacv3F-d-FqtRPXA>
    <xmx:avisZqbiSCLL_liys-FP4zEymB9zcyp4uDN8qzcEuAv0DbNRn3gp9Q>
    <xmx:avisZgZp9TV-JY4KG8KsWcIAZU09d2egsdNaPmN50NMTuSwAnkoGqA>
    <xmx:avisZuC3R_w6smQ0Jsq1Xb3uO8p7FXWhYuZeSRlMgf9oQ17tq25VCA>
    <xmx:avisZuYb2g7_JOQvh_YodFH1VtkQJzwQyAdPe4laCgh1CHJ1kUq615q_>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id E99D2B6008D; Fri,  2 Aug 2024 11:16:57 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Fri, 02 Aug 2024 17:16:37 +0200
From: "Arnd Bergmann" <arnd@kernel.org>
To: "Jeff Johnson" <quic_jjohnson@quicinc.com>,
 "Herbert Xu" <herbert@gondor.apana.org.au>
Message-Id: <6fdd8f30-4df1-447d-9156-5d2314239e99@app.fastmail.com>
In-Reply-To: <75a526e3-3101-4319-b42f-4482ba188abc@quicinc.com>
References:  <20240718-md-powerpc-arch-powerpc-crypto-v1-1-b23a1989248e@quicinc.com>
 <ZqzcApbJomFTnc30@gondor.apana.org.au>
 <75a526e3-3101-4319-b42f-4482ba188abc@quicinc.com>
Subject: Re: [PATCH] crypto: ppc/curve25519 - add missing MODULE_DESCRIPTION() macro
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Danny Tsen <dtsen@linux.ibm.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Nicholas Piggin <npiggin@gmail.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Aug 2, 2024, at 16:27, Jeff Johnson wrote:
> On 8/2/2024 6:15 AM, Herbert Xu wrote:
>> On Thu, Jul 18, 2024 at 06:14:18PM -0700, Jeff Johnson wrote:
>>> Since commit 1fffe7a34c89 ("script: modpost: emit a warning when the
>>> description is missing"), a module without a MODULE_DESCRIPTION() will
>>> result in a warning with make W=1. The following warning is being
>>> observed when building ppc64le with CRYPTO_CURVE25519_PPC64=m:
>>>
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in arch/powerpc/crypto/curve25519-ppc64le.o
>>>
>>> Add the missing invocation of the MODULE_DESCRIPTION() macro.
>>>
>>> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
>>> ---
>>>  arch/powerpc/crypto/curve25519-ppc64le-core.c | 1 +
>>>  1 file changed, 1 insertion(+)
>> 
>> Patch applied.  Thanks.
>
> Great, that was the last of my MODULE_DESCRIPTION patches!!!
>
> There are a few more instances of the warning that Arnd has patches for,
> covering issues that appear in randconfigs that I didn't test.

Are all of your patches in linux-next now, or is there a another
git tree that has them all?

I can send the ones I have left, but I want to avoid duplication.

    Arnd
