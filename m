Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD3A1F8396
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Jun 2020 15:56:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49kfJz6rjWzDqss
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Jun 2020 23:56:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49kfDz4RbmzDq7k
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Jun 2020 23:53:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=gYb65oh8; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49kfDx5FxGz9sRN;
 Sat, 13 Jun 2020 23:53:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1592056386;
 bh=x3HnQ5tespni0cpMcs1z9+u3bDF7bHti1qIwlnwuaU0=;
 h=From:To:Cc:Subject:Date:From;
 b=gYb65oh8NUxarz2dOb5I5ewxZuOpqC6PmKm2ac+KnvOQWzPDsDm8ZPDC//wcE7O4N
 ahKBVYJEM25u3v6kD7nShYO8S35iaqpwgnaAVRsIiGV/ts/1G1ob2OtP8Xevpjx90B
 DRXSI7j4ZSsNE87qZgR8rkyMYPiUecnsh2fFIEXIq+McfQJ+2v0/Ksosa79VbqTvMG
 NOq5mTFhexLSYTfru3ecyCiBqbxPiwi/o0OVRi6UmdJ26LVJsk/kAXRaJNgtrkSu62
 2yAasHTSW9xIJlDOwl7r8fjQSjAgzx10rpIzBAJpWMhW64pjHij8epClHY4HlUy7Kn
 LB/Z8AlFr0jUA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-5.8-2 tag
Date: Sat, 13 Jun 2020 23:53:29 +1000
Message-ID: <87y2ordqcm.fsf@mpe.ellerman.id.au>
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
Cc: aik@ozlabs.ru, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull a powerpc fix for 5.8:

The following changes since commit 7ae77150d94d3b535c7b85e6b3647113095e79bf:

  Merge tag 'powerpc-5.8-1' of git://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux (2020-06-05 12:39:30 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.8-2

for you to fetch changes up to e881bfaf5a5f409390973e076333281465f2b0d9:

  KVM: PPC: Fix nested guest RC bits update (2020-06-12 16:19:53 +1000)

- ------------------------------------------------------------------
powerpc fixes for 5.8 #2

One fix for a recent change which broke nested KVM guests on Power9.

Thanks to:
  Alexey Kardashevskiy.

- ------------------------------------------------------------------
Alexey Kardashevskiy (1):
      KVM: PPC: Fix nested guest RC bits update


 arch/powerpc/kvm/book3s_hv_nested.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAl7k2b0ACgkQUevqPMjh
pYDmPQ/9Ffq4hgIdiJdzusd9tYEynumET8/cfRLYCmUVEkYQdpgpLgp/XnNFq/fg
CqqDN173ioTg5xN1QEZkcPKFwOqmlG2oYJI4s93nMAINmuCE7h4bsrGLOZNPIx1G
FD2v0piGkxmxRud1Qt7+cpIfbbw3wKnFqOQ1yzRop/weufp42PSUD00cY6DUa9Ip
LKWxBcje6yl56U+z31iWvDjNxP2cwZUz79ioKQG7YDigQh+aSVFaZ1NboA5fjde0
CSm0DrHfhPjlZTw2y3IvTbETCi7wU1dIrElf6e8RMsIOCg1UeUeiOsHP80fHnMFA
NP1JlsIEPjIxUb9cJ7Uc03wwUMioQcx7ZwISTWP6aQZx20nEdcFErqleCLr8e/KC
beWRz7TMfCG3v6GQv5yJKx+/AB8XWYcBe+X/8+7AAZS51DFHU4xvxIy9B43a3cCe
UozRzo/OTVvRvRPsM4TaIIZNPBV/WWm/+CwEZgGEOBqXK+ZQpwkDh5kP5P/nWv0g
HoK82XTGdMDokKuH+oStuo9kpMbj7ktJhOVFply8axXdQ9Jn2y/4t1mH4jsodza5
OWqpDDnRXzOlTasWBPIcdgmriYeJfEQ5rDmxRXfoqBTEoSVt2TC3e1ooN0IkCVcy
pPROKGvRHdfqMvXqwoDpLL3wF43u439bl8ROBC89nsxdpcBixoM=
=VRzv
-----END PGP SIGNATURE-----
