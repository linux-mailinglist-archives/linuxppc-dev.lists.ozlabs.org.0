Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E64F39B86A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Jun 2021 13:53:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FxLkZ3hqxz3bty
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Jun 2021 21:53:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ZSvv70jf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=ZSvv70jf; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FxLjb5Yw0z2yyK
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Jun 2021 21:52:35 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FxLjZ4qgxz9s1l;
 Fri,  4 Jun 2021 21:52:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1622807554;
 bh=/0zs9yjyVrXuKTbOmZgVvmnJG2BGaaRVaDrm9pNaGEM=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=ZSvv70jf65+gdTxUnzc0rWPHOxE0RicyfFArUfM6Aztgej5xYVap88lUpa0eG9MsI
 56VVF39METhXi0/lCVGK6Gld2q49mPvvn4HulXlwvGfvv+23e7ds4JRwK4Qn/oWL/1
 YTLYD68ukGCkZSIf1pyg+ZHLzb3Y+CfJGeMUXo588IcB5bYoDv0ls6aWP1UlQF+1SJ
 Uz2Ahn9xin9HHOV/K9yjHmtxEbA4DdM+9xjUR5m7Fpw4kXBm+TRONiGVmMYwtfNntM
 GFGDDN1fZy+rlyvFO5SmOw8QN+0i3iGlfvddWNuKqXwcctdDV32LPp90REeK61k+6Y
 pTbgn/Gq3rSkQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Haren Myneni <haren@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
 herbert@gondor.apana.org.au, linux-crypto@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v4 16/16] crypto/nx: Add sysfs interface to export NX
 capabilities
In-Reply-To: <340144138c53ae83588edcf0b4a5ae1880a01cd0.camel@linux.ibm.com>
References: <8d219c0816133a8643d650709066cf04c9c77322.camel@linux.ibm.com>
 <35bca44c5a8af7bdffbe03b22fd82713bced8d0e.camel@linux.ibm.com>
 <1622696109.949hlg4tnq.astroid@bobo.none>
 <340144138c53ae83588edcf0b4a5ae1880a01cd0.camel@linux.ibm.com>
Date: Fri, 04 Jun 2021 21:52:33 +1000
Message-ID: <87pmx1g83i.fsf@mpe.ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Haren Myneni <haren@linux.ibm.com> writes:
> On Thu, 2021-06-03 at 14:57 +1000, Nicholas Piggin wrote:
>> Excerpts from Haren Myneni's message of May 21, 2021 7:42 pm:
>> > Changes to export the following NXGZIP capabilities through sysfs:
>> >=20
>> > /sys/devices/vio/ibm,compression-v1/NxGzCaps:
>>=20
>> Where's the horrible camel case name coming from? PowerVM?
>
> Yes, pHyp provides the capabalities string.
>
> Capability Description Descriptor Value Descriptor ascii Value
> Overall NX Capabilities 0x4E78204361707320 =E2=80=9CNx Caps =E2=80=9D
> NX GZIP Capabilities 0x4E78477A43617073 =E2=80=9CNxGzCaps=E2=80=9D

That doesn't mean we have to use that name in sysfs though. In fact we
couldn't use the "Nx Caps " name, because it contains spaces.

And we don't have to squeeze our name into 8 bytes, so it can be less
ugly.

Like "nx_gzip_capabilities"?

cheers
