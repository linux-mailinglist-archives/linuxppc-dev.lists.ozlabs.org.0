Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 519A24D5B31
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Mar 2022 07:03:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KFFk062G4z30Jm
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Mar 2022 17:03:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=TlXNk45Z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KFFjM5NXjz2xXy
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Mar 2022 17:03:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=TlXNk45Z; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KFFjH53D7z4xMW;
 Fri, 11 Mar 2022 17:03:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1646978595;
 bh=l8rfE/4he409H4tnIdMHNxvTLyIXMhcrObPfkOpkI5A=;
 h=From:To:Cc:Subject:Date:From;
 b=TlXNk45ZElB+oSHUVOD+1i3ACy5nIrj73xl4zWQlm2mcBAu5Pai+jgXRATSLnfQH+
 MRKFwsm6GT4rXJX+sAcQS0gYHOAbPoBgmL41u9SFyHJx1YeBFM6Q/D1GgGMU4KqZaD
 JvlHifjm8CqtjzHnZA65ivoHsRCT8Ajw6MQv6Ip2N9io5X/ENpm+zXrIfQlu6g8naa
 3w8OUaQiub766YK7FYi2slEMhk/of9n6lKupbNDv+N5rDmBxyHLfPRrqUWk12ZhV6V
 NGWhaGRmyGzdZmizvytrvtqcMFpkEByALffVKVQ/2QKJzxljdPDtclUJfp0S9a/zjS
 Xx6+oXlHtrAEg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-5.17-6 tag
Date: Fri, 11 Mar 2022 17:03:15 +1100
Message-ID: <874k45m3fg.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull one more powerpc fix for 5.17:

The following changes since commit 58dbe9b373df2828d873b1c0e5afc77485b2f376:

  powerpc/64s: Fix build failure when CONFIG_PPC_64S_HASH_MMU is not set (2022-03-05 20:42:21 +1100)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.17-6

for you to fetch changes up to 48015b632f770c401f3816f144499a39f2884677:

  powerpc: Fix STACKTRACE=n build (2022-03-07 10:26:20 +1100)

- ------------------------------------------------------------------
powerpc fixes for 5.17 #6

Fix STACKTRACE=n build, in particular for skiroot_defconfig.

- ------------------------------------------------------------------
Michael Ellerman (1):
      powerpc: Fix STACKTRACE=n build


 arch/powerpc/include/asm/nmi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAmIq5cAACgkQUevqPMjh
pYAJhw//WqcG+Qv+W5YD9KMiH78CTDm9bsLejRJOy3x/Rbn5Fs2/KKdcYPcpe5gE
nJ87W2w2li2YpEBe3ClbAXFQCNswH8cnj3++HLaGFp4bmM3F96JCEuh1GghlvQ4v
e6EUD0qYEmlFRAvey7bfu5MsNLGadpXob4f+xMoffRHr9rhzsShV4b7pAblUggIi
/ajO+GEvIk7kSB7DCGEq8swfoT0mWb0bD2wAhNoz4nbOENaGp7O26Va6vt/l+qHn
aXFESbaYKKBxYTicuLywQWKqL5j/XaHDz19KkKOljYElsLTZ78i4y1mvIHLRJtHA
NxSAPXBZgOyw7/mQJEYP+ABr0ki+QIpykTLeDxL+XSOtOVYEJW8eQiBHbzxrqSCs
7UEyunNG9Y2WfLPpE+lo4QEEeOp+QiJsla3iJjQAMJjI2M8x6QtWkDJlZ+LSfUa0
mNPnHDt8mlAj1R7zpXLNt0gokgPub4lSBb1V2tEu816gEUVJVgqq63GGynB+ET9K
O/3UlU7jFaQzASw4TUgq1HBE8Zs3NC09GbkUzDoo2cqeZDOPDbb0ieJcy+VzDNiq
bAcRwjXB7LKir59G38Mdo2lMALJUXr+jtz10a+zTnA48KAVbf5ZgEwXHejR0Y/nv
af8B1MyWLjeUWAY2CDSSoOres2qE1phjBVZ4eBSk9VLqd+KtXf8=
=KPHf
-----END PGP SIGNATURE-----
