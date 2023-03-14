Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B9B6B907F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Mar 2023 11:48:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PbVby1jFjz3cMb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Mar 2023 21:47:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=KYpQ1r/V;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PbVb259LDz3cB8
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Mar 2023 21:47:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=KYpQ1r/V;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PbVZz3nmNz4xDp;
	Tue, 14 Mar 2023 21:47:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1678790830;
	bh=KuhEXXxO7odt2tOpWdOwGGmaEO+SI1OzAWU0pdYuXyM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=KYpQ1r/VsI7SXBkdi3YF/jmnXzkdwp14eg8EVmX3q/h4KHucdJ2nQcsThQRpJPihe
	 kl09uvNkoNLFBYZZySb4r2h0CteEAnpZHx5oOEQVJyVxV9+xmRK6FbffYqz+u86lN4
	 fMc2OaHtQjohJl5q1wNzV5gsJm3crL4njd+NycJ5pzLSwcoPIjQIk2Cj5GU8XZHvPg
	 rgGGnO284Mgwan/te1WtC7IKLqBp1lTIR8dgaOPBSIZFSEcto5MiaTZHfiS2np8FjN
	 ARndGSA1WzzvNOMeNZum5lKGGHd0UDYy9EHSdpMywxdLy0uSXZAflzgZ2kqW1FuSLP
	 QJuY6jplWW8tw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Herbert Xu <herbert@gondor.apana.org.au>, Christophe Leroy
 <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] crypto: p10-aes-gcm - remove duplicate include header
In-Reply-To: <ZBA1EVdy1DvfxgRO@gondor.apana.org.au>
References: <202303141631511535639@zte.com.cn>
 <dbbd6ff3-5e17-9b63-9027-359e37ace668@csgroup.eu>
 <ZBA1EVdy1DvfxgRO@gondor.apana.org.au>
Date: Tue, 14 Mar 2023 21:44:52 +1100
Message-ID: <87mt4fobmj.fsf@mpe.ellerman.id.au>
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
Cc: "ye.xingchen@zte.com.cn" <ye.xingchen@zte.com.cn>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "npiggin@gmail.com" <npiggin@gmail.com>, "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "davem@davemloft.net" <davem@davemloft.net>, dtsen@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Herbert Xu <herbert@gondor.apana.org.au> writes:
> On Tue, Mar 14, 2023 at 08:47:30AM +0000, Christophe Leroy wrote:
>>
>> Any reason for resending ?
>
> The p10 patches were reverted, and have only just been re-instated.

Hmm. Seems none of them were ever Cc'ed to linuxppc-dev. So this is the
first I've seen of them.

We seem to have two almost identical copies of ppc-xlate.pl now :/

  $ find . -name ppc-xlate.pl
  ./arch/powerpc/crypto/ppc-xlate.pl
  ./drivers/crypto/vmx/ppc-xlate.pl

And notably the new one doesn't have the changes from commit
505ea33089dc ("powerpc/64: Add big-endian ELFv2 flavour to crypto VMX
asm generation"), so that probably breaks the build for some configs.

There's also now two new .pl files with identical names, but different
content to the copies in drivers/crypto/vmx:

  $ find . -name "*-ppc.pl" | xargs wc -l
     370 ./arch/powerpc/crypto/ghashp8-ppc.pl
     585 ./arch/powerpc/crypto/aesp8-ppc.pl
     243 ./drivers/crypto/vmx/ghashp8-ppc.pl
    3846 ./drivers/crypto/vmx/aesp8-ppc.pl
    5044 total


Also PPC_MODULE_FEATURE_P10 should be in arch/powerpc/include/asm/cpufeature.h.

And CRYPTO_AES_GCM_P10 should not depend on POWER10_CPU, that restricts
it to being built when the kernel is built to run *only* on Power10,
which basically no one does, certainly no distro.

The code needs to detect at runtime if it's on Power10, and only
register itself if so.

cheers
