Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9BB815DB0
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Dec 2023 06:47:53 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=VHOywECW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4StBnK5vmSz3bqB
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Dec 2023 16:47:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=VHOywECW;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4StBmT539Xz307V
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Dec 2023 16:47:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1702792019;
	bh=sjJYJPAysPoKxYJ9ye7fdK3cz4HvUz9eSpSgI6DOv34=;
	h=From:To:Cc:Subject:Date:From;
	b=VHOywECWeAG1Q6vdSFt/hRVdkleytUo3PbfJ3u4GjFjpQGmnPICUC3B5HJic6qi4n
	 n+x6ax/FE6DZBSkbSakTiWGbEkZZsAkSNrmRuWLUBPsTU2G9H6S9BmvtV3GB3cAW9Q
	 4koLI5d+1azY1ofxpTpcbp4c630vZ3401UX7Zp/aJbWpDV4pVVSi5XI4UaEh+0KRIO
	 v8XE7DpIUofIa4XFDqjF4Ceu/30aRwKP0/MvGxksN8gH4GI2xR3ReemSc4SjZ5m9Bp
	 5TqvmYCLOzRiBCo2ACeHhOxONcc02HdfRBnNLPMlMi10gnAbkveR42B08tNc0DHCDH
	 NjqaI8iXtwung==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4StBmL2Tkhz4wx5;
	Sun, 17 Dec 2023 16:46:58 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-6.7-5 tag
Date: Sun, 17 Dec 2023 16:46:57 +1100
Message-ID: <875y0xmlda.fsf@mail.lhotse>
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
Cc: aneesh.kumar@kernel.org, linuxppc-dev@lists.ozlabs.org, haren@linux.ibm.com, linux-kernel@vger.kernel.org, naveen.n.rao@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull some more powerpc fixes for 6.7:

The following changes since commit 4b3338aaa74d7d4ec5b6734dc298f0db94ec83d2:

  powerpc/ftrace: Fix stack teardown in ftrace_no_trace (2023-12-05 14:14:12 +1100)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.7-5

for you to fetch changes up to d2441d3e8c0c076d0a2e705fa235c76869a85140:

  MAINTAINERS: powerpc: Add Aneesh & Naveen (2023-12-13 22:35:57 +1100)

- ------------------------------------------------------------------
powerpc fixes for 6.7 #5

 - Fix a bug where heavy VAS (accelerator) usage could race with partition
   migration and prevent the migration from completing.

 - Update MAINTAINERS to add Aneesh & Naveen.

Thanks to: Haren Myneni

- ------------------------------------------------------------------
Haren Myneni (1):
      powerpc/pseries/vas: Migration suspend waits for no in-progress open windows

Michael Ellerman (1):
      MAINTAINERS: powerpc: Add Aneesh & Naveen


 MAINTAINERS                          |  2 +
 arch/powerpc/platforms/pseries/vas.c | 51 +++++++++++++++++---
 arch/powerpc/platforms/pseries/vas.h |  2 +
 3 files changed, 48 insertions(+), 7 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAmV+hd0ACgkQUevqPMjh
pYBXUxAAtTAlULmrNviBMDi27WZ4nSagRytDch3u+BcmoKLLSYJtHJLKW0qqujnQ
GSJJ9bnV9dOHYu6I6VUom4SDyU3ExaxggJ4+UTlPigXM6++FZhFuhrXgXlcAh+6h
nkL71XkPMzFitUWEUa5nboiMpcHWNn81gLWTek8rieDtggspyPi3d+TQzMFiNddd
LOCAXU4hxxlcqbSL5v5v6UU9a+j0vGJYPU2sc/nY0mEzQHyTaC+KZcPVtloH2zzK
/9BAeHPUkj6zIG9ioBehFgCfnocJI3hsUQgU/8v2Kqwc6om8gpUgkO/yn3Adajln
DrYKKKiAEOBWh7qdj98G+i77nCx9HPko3cfVM6SyfH9+qZEaKz6mOVt2idXJUqsK
+pSUXir/F3z+eZ591YmUc/Vn2LFXnNvpcih7EDKx9Tyqz4yULMpVqEKdr6onyXWf
48/rNu4KxlqzbsZkilJKjGeCtwcrrZiYbOQNaj0D9i4pVDFgUYSTxhJ3r3oA0fIy
U7NPSzfkbob/w0KROXNvpGJlE/IyDzb47MAw7muO009o2AiAswDiGfzgdQ4l/9z7
4F1gvx/sEuZAcL0NgkCpZWdsy5cv+OkAZeKlGIc6C6jcoVIik2g3mSR9qxp4JE31
yBBo5e8s4Ai7AgCnIf57rouBrhEgLuHL8WrBhjecmt2uXao5/v4=
=duiu
-----END PGP SIGNATURE-----
