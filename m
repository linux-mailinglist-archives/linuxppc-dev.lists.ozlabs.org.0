Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBBF244A0E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Aug 2020 14:59:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BSk6l2qj7zDqlc
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Aug 2020 22:59:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BSk2f08J6zDqkc
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Aug 2020 22:56:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=RZhdiK1W; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BSk2Z3KXkz9sTQ;
 Fri, 14 Aug 2020 22:56:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1597409767;
 bh=bogzDs0eFlK9z17SgplhUpIaznIoXiLERASJ9R6Xlzc=;
 h=From:To:Cc:Subject:Date:From;
 b=RZhdiK1WUFC6v9LI3nKxMo+BGaO9Axqm+Z+u2H/hMWvE2pbVZsResCNCziDBRUZuO
 lZGAYGgiLxgKyvV6kyLIoPfwgZ+xtlitSzN4aGJzAP8NhaMM/kOPYOQVIHHoO85mu3
 zAfhox0nvoFd76EEAvmAjjYfGCs9Hgi/JOkjPwqVm2zVkDArAhzN0XfHTQ7PuCm+SR
 BMR5etLd+GuBlYepUF+bEVqg9kyPdaKY+KDorMNJrwvMKHeMbHl6L+hoiGwE0qAV8Y
 jkUh7GKVqOQt1nzCgctCa/eh3djXnsH5joP1y/L0JHl4sspj1uMWS7AsncWwzR9kmF
 thau5OFCN0Hiw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-5.9-2 tag
Date: Fri, 14 Aug 2020 22:56:04 +1000
Message-ID: <87ft8p9yjf.fsf@mpe.ellerman.id.au>
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
Cc: aneesh.kumar@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Christian Zigotzky <chzigotzky@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull a powerpc fix for 5.9:

The following changes since commit 7b9de97711225559af213dc52b6ea883ef1ea7a8:

  powerpc/ptrace: Fix build error in pkey_get() (2020-08-07 18:27:26 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.9-2

for you to fetch changes up to 6553fb799f601497ca0703682e2aff131197dc5c:

  powerpc/pkeys: Fix boot failures with Nemo board (A-EON AmigaOne X1000) (2020-08-10 23:07:21 +1000)

- ------------------------------------------------------------------
powerpc fixes for 5.9 #2

One fix for a boot crash on some platforms introduced by the recent pkey
refactoring.

Thanks to:
  Christian Zigotzky, Aneesh Kumar K.V.

- ------------------------------------------------------------------
Aneesh Kumar K.V (1):
      powerpc/pkeys: Fix boot failures with Nemo board (A-EON AmigaOne X1000)


 arch/powerpc/mm/book3s64/hash_utils.c |  5 ++---
 arch/powerpc/mm/book3s64/pkeys.c      | 12 ++++++------
 2 files changed, 8 insertions(+), 9 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAl82iYIACgkQUevqPMjh
pYAlBQ/7BXZI6UMWb9QS4QDu3CaBEEmVtnOnHmN1OsLnyjWArf+MLkipuoEiNeBc
bZIr7Zah2tE4/ZpOEaELu4Vgr+AAk2HGzRw19eYHMewgjfdO1n1jmORrGnfECkKL
0ygQv/g7rKTpSDoK3qNT0n0BRMCzmdlzsdhE9Oj4gMSTy+ThJnakS7Js79aqHaFz
obZbytwDDE2jSoKl4T+AlokDDiXpUm9OXIxSuyzGSrljm/vwQxGI7TH7IjZUwE9v
rPtxPJyvEkmXa4cVrTrY7AxP3yMvoJTd4EMISxtrqKSghSpVjAmm0Ie2fa6+8yCB
aI7nRp4fIoTKr8o7rjBwraNNQejq8aFE/EHBKPamgZ7F+yNqenNJREjPTJpC2RKF
N33aX6hqK2vuL2KRN5KPAaSDys1TsMot0Xlghvu/hzopVGGnNkP03jBLT6uFk1aD
tEW3ZModf/SJoXb88Y5+oWvgSbzheWv+DlnfLKZ5Uvuf/dOlUWOmcElC/rD99SMz
IFEW3XarOcMBcpFLF1+ZTCRzgkmYyLyJh3mK/4ykxm8XP9bi8Yv3VqPEEUk4tPWj
BUoviQHDgJ8TUgkAqmecJQDi0iYmQwUe3CfQb8FB5k7itQawWuK+exdqZhJpbPLO
mdM8+/RyjPfYSRvrtBRcWOAkxGrzC/eT7eLAEwQFIYhLDJL2rYI=
=Rgq5
-----END PGP SIGNATURE-----
