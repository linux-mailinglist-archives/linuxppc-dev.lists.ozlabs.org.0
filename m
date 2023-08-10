Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F4C776FF6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Aug 2023 08:06:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RLxJQ0KD7z3dnG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Aug 2023 16:06:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RLxFK3DGSz309D
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Aug 2023 16:03:49 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RLxFK1f4Dz4wyD;
	Thu, 10 Aug 2023 16:03:49 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Omar Sandoval <osandov@osandov.com>
In-Reply-To: <c55ad70799e027a3d2756b85ccadc0af52ae8915.1689007370.git.osandov@osandov.com>
References: <c55ad70799e027a3d2756b85ccadc0af52ae8915.1689007370.git.osandov@osandov.com>
Subject: Re: [PATCH 1/2] powerpc/crypto: fix missing skcipher dependency for aes-gcm-p10
Message-Id: <169164734544.180689.6461792397004042201.b4-ty@ellerman.id.au>
Date: Thu, 10 Aug 2023 16:02:25 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: Danny Tsen <dtsen@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 10 Jul 2023 09:46:46 -0700, Omar Sandoval wrote:
> My stripped down configuration fails to build with:
> 
>   ERROR: modpost: "skcipher_walk_aead_encrypt" [arch/powerpc/crypto/aes-gcm-p10-crypto.ko] undefined!
>   ERROR: modpost: "skcipher_walk_done" [arch/powerpc/crypto/aes-gcm-p10-crypto.ko] undefined!
>   ERROR: modpost: "skcipher_walk_aead_decrypt" [arch/powerpc/crypto/aes-gcm-p10-crypto.ko] undefined!
> 
> Fix it by selecting CRYPTO_SKCIPHER.
> 
> [...]

Applied to powerpc/next.

[1/2] powerpc/crypto: fix missing skcipher dependency for aes-gcm-p10
      https://git.kernel.org/powerpc/c/9d6e1c21e1be4643628ee343e0b8d79828485ba2
[2/2] powerpc/crypto: don't build aes-gcm-p10 by default
      https://git.kernel.org/powerpc/c/026fa6c52da5fc559d896a62cb6f8e208c22738d

cheers
