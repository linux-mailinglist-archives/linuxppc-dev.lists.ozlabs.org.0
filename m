Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 060DD5AAEA
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jun 2019 14:29:37 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45bXy611DLzDqw4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jun 2019 22:29:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45bXtW2k8nzDqvW
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jun 2019 22:26:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45bXtV6c8Gz9s3C;
 Sat, 29 Jun 2019 22:26:26 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-5.2-7 tag
Date: Sat, 29 Jun 2019 22:26:26 +1000
Message-ID: <871rzck26l.fsf@concordia.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi Linus,

Please pull one more powerpc fix for 5.2:

The following changes since commit 50087112592016a3fc10b394a55f1f1a1bde6908:

  KVM: PPC: Book3S HV: Invalidate ERAT when flushing guest TLB entries (2019-06-20 22:11:25 +1000)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.2-7

for you to fetch changes up to e13e7cd4c0c1cc9984d9b6a8663e10d76b53f2aa:

  powerpc/64s/exception: Fix machine check early corrupting AMR (2019-06-25 21:04:27 +1000)

- ------------------------------------------------------------------
powerpc fixes for 5.2 #7

One fix for a regression in my commit adding KUAP (Kernel User Access
Prevention) on Radix, which incorrectly touched the AMR in the early machine
check handler.

Thanks to:
  Nicholas Piggin.

- ------------------------------------------------------------------
Nicholas Piggin (1):
      powerpc/64s/exception: Fix machine check early corrupting AMR


 arch/powerpc/kernel/exceptions-64s.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJdF1XlAAoJEFHr6jzI4aWAYGcP/0zAPEOaQjgDIn8fgHIMQxiS
A3R2Il77YJXukTkbukGE3i47x22N+dOl0Cl3LruUVVHy5sEGf1y7qxJuJY8qLY85
rMsObpkOtxq2+Cax59t7heBd3W7kJ81FgELc2d3V5/xKTUrc6A3X1Lvf2V6sejEz
qfvcW+BvH56x4an8WuZTw/QyndI28bvYWeWd/fHrIqqNUmYIViS6huKX6vgWZOvr
LsKqSgmlA/fmR658hkG1bayJdmkQfT0XzJCck9xFftY2/tm2NYXk+F06PviUqVDT
VjWAu0CUohj+rb+b1NtrIaRz645gxYQJL51H9IWvjssUqhZ9Xf9kcVogQJ4l1U3W
q3Kcs0FhZbtkJ7b72Wt829Z95awZqiZpQYeBB0QnGLzr7anQWxzCosXw1jWrnI2e
xWfUBpBzzRK92Dn9Qkg7e5iydipSfMMiEMyoKTbZu4bG7aRltodzDuhWM1yzv1RU
zrznOTZqB97Ui+DtwMAZsnLzpAAacm4JuSWKEHA+kjE8TLZlOtmHX16cCWGZU2FE
xTUn30yJJj5qesQalIZ/33sVm1vH+DjbMhFZhnjGwb1W7USiPQby5H5eEvj0l3at
cZLWQOiskZpya6+FCL9sRPd5OUyONEiyQz0pnw0/evOvJuo2nounDled0k/s5ljz
WtsfvGeQBE760byvtENF
=dP4O
-----END PGP SIGNATURE-----
