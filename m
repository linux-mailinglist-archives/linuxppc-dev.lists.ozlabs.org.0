Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D5021C412
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jul 2020 13:49:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B3p9c0n6GzDqby
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jul 2020 21:49:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B3p7x1w51zDqRW
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jul 2020 21:48:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=QgPVAto0; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4B3p7t6VJpz9sRR;
 Sat, 11 Jul 2020 21:48:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1594468092;
 bh=dKeMPZ3coLq1t8Os4YUhMXsxVwacg9mcb6Um7+nbyMM=;
 h=From:To:Cc:Subject:Date:From;
 b=QgPVAto0j6mboSpyNKkOHIg8wO9JF4IADPuieLiPwIrMP2FbdryVnD8LcLbW4qg1U
 iN/+V221zlRheQ11w1bQdv3czDd5LLJzrfgKoxkRrXYdM5bH+1eYG6uMZZ7Og5a8Ng
 Plw9PScJqaTppcY94gVfZN8fJ/etNju2ci0aych9cf8poRtj49R94tf/YX+ZRhxDJ3
 fXIb1CP5Bf4k//8kMJBi6SWD83XsP/qgVbge0pyrvIdiHduGeIi3whlYEb+L4mPXHy
 SYSW/yjHvNqkVTHaTGnThhkWUEDXflOv1Rxjetq6FYzCq/JVsEE6LCRrp6M1VeC3Kl
 FDqw2iem7rn/w==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-5.8-6 tag
Date: Sat, 11 Jul 2020 21:50:20 +1000
Message-ID: <87v9iuuv7n.fsf@mpe.ellerman.id.au>
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
Hash: SHA256

Hi Linus,

Please pull another powerpc fix for 5.8:

The following changes since commit 19ab500edb5d6020010caba48ce3b4ce4182ab63:

  powerpc/mm/pkeys: Make pkey access check work on execute_only_key (2020-06-29 16:17:02 +1000)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.8-6

for you to fetch changes up to 4557ac6b344b8cdf948ff8b007e8e1de34832f2e:

  powerpc/64s/exception: Fix 0x1500 interrupt handler crash (2020-07-08 20:41:06 +1000)

- ------------------------------------------------------------------
powerpc fixes for 5.8 #6

One fix for a crash/soft lockup on Power8, caused by the exception rework we did
in v5.7.

Thanks to:
  Paul Menzel, Nicholas Piggin.

- ------------------------------------------------------------------
Nicholas Piggin (1):
      powerpc/64s/exception: Fix 0x1500 interrupt handler crash


 arch/powerpc/kernel/exceptions-64s.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAl8JpzUACgkQUevqPMjh
pYD5Zg/+JSMK0phSPCEpBusdlwIeuP5JwQzMCPZgiz7wGsOl6OMF/pMekvQmYzsD
/9VKTWejulkn1Q1Gz3dhEEaVRJhjErPN0xb3tdrXmzyK2s67kwbkd+PhkmXyzRJ/
ByEHmg8K3kKhB3FEC/BimNzcjAhVy2bIqBR1+4gTjF/PDc9heugv9iOpnw2uvhGu
/DoYyQScWnC01PgOd8/dFDykELj98s/p4hKNx6JnteGi5cjrWClqJGJYCBc4xhs/
rPSA5ybUzuN+CbMZbvDi7sJPw+w4AYIC5kVYsZqRuJVGYGh0y4qcxSYK4BL0FDO2
UWdCLUFOkZqHtGhOUMn886YQnhPFukxVOVfLCIlkWcYeXK3HwQld8LrfzHUoMjBk
ao06xwccNyzGlRUn0lYKuRFRGyEtWXNDqLQZ9L4Klowwe9BG5HdYRzrNxLsyi7p0
yom6hevA5w2Sw9rZJrtImWevrsIp7ZexOcVBdfCGwCt9WlWHvT4C5iT0kMFGBh50
Tx/nKAaBWVN9p8OLX4qsmUlRIeAGQdV18HiAaLo5YubUSJ9Ne5ZGcTTZ42VwxvaM
1VCMUfexdr/oljy1BUP/ZTldcj8dF6saaWDb+yWWh8sUmKdsduXJP/5640au9FxS
EBofwuyiU0u8aoV9oH4km+Tqp2WtFhMtrgTNNgHtPix7C8ck2Y4=
=u9rR
-----END PGP SIGNATURE-----
