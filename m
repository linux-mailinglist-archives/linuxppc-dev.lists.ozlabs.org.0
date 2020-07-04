Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4100D214627
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Jul 2020 15:34:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49zXqr3HhMzDr8t
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Jul 2020 23:34:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49zXld4CfRzDr7q
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Jul 2020 23:30:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=YYtFOD02; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49zXlZ64Rcz9sQt;
 Sat,  4 Jul 2020 23:30:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1593869451;
 bh=kl3Szk98khoM6Tava7Ark0liKf7Bf/9XtdkjUx8UehE=;
 h=From:To:Cc:Subject:Date:From;
 b=YYtFOD02SJ+Z95vV0SU0mcnzuEcEXFtst9RCGHimsC2xBczbeQEGppOxEc2vo5/Cg
 qWKV11xIQD1fPXyjr0RAFNrri0LyoK3evnjAI21c6hfG7CTEP3ZtwNR76mN59xqppo
 y/y4oznH/CTmardWUfbWCa0VuZxtfkMISeoPmXcwC2iTbmgOJuT4wZ+zGP7vL9mcvC
 p+kIXmoN3e75YjhaPE20GOJMDtK5CLFencgoSAbu+14/lOr61bMgrxwnAc0Y8mdQCL
 PekNEixvhO7L6O/DTA411VM75pAMzxToyg2bF52YsAm924wzMwyeuaamyUQlQUmm7X
 +/fb8zUUwl/VQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-5.8-5 tag
Date: Sat, 04 Jul 2020 23:33:05 +1000
Message-ID: <87366776cu.fsf@mpe.ellerman.id.au>
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
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull some more powerpc fixes for 5.8:

The following changes since commit 896066aa0685af3434637998b76218c2045142a8:

  selftests/powerpc: Fix build failure in ebb tests (2020-06-26 12:53:09 +1000)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.8-5

for you to fetch changes up to 19ab500edb5d6020010caba48ce3b4ce4182ab63:

  powerpc/mm/pkeys: Make pkey access check work on execute_only_key (2020-06-29 16:17:02 +1000)

- ------------------------------------------------------------------
powerpc fixes for 5.8 #5

One fix for a regression in our pkey handling, which exhibits as PROT_EXEC
mappings taking continuous page faults.

Thanks to:
  Jan Stancek, Aneesh Kumar K.V.

- ------------------------------------------------------------------
Aneesh Kumar K.V (1):
      powerpc/mm/pkeys: Make pkey access check work on execute_only_key


 arch/powerpc/mm/book3s64/pkeys.c | 3 ---
 1 file changed, 3 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAl8AhNcACgkQUevqPMjh
pYCpbw//Zuq2ibM2b4lIEYCxCeI1gh1owthd6fHAmRKLV190CTy5LlXjc/Qr1uNg
gnW5H4+/8LC9wlN+ypzm2/ZGr4GfFEZTbodXm40uF8iT06pb3arULB1Tu3YcScpE
8mwLSE4oz8rqq7f/jGc6u3Ozwr47KkiSfCRKNMIVOCGQMg6nwPLO+sbWjfwSv0W6
pi+GE+GVWe5sEyftWoO+s2FMELX1O6vOvaQId0H8JqKI/FXCGYZzHJ/SWjMx7rJ9
VJYqLOuuHp8diw4PYsfUoxKQc/uDT0EswloaDcYwi1bQu9XzgbSP1QHA15bwVBCh
uqT/+CpZN8adjWk+vHeEeJurqCYf4gkAwaT4NJFA3oQIMvV7eVEoGgUj0ssjTSAd
8qudKtBkQauXMaPXD9arN389mW45Zfzg0O313lvXr5HEWAg3vrMtLTaBTxFuMwnt
+REfBTJTS9S2hPcn2w2vK9SNOL5PAt/cTg/z7ekuw9gvDdX10ahyF1X2AQbtKN5U
tSBH74b1eR8dlg3jcvmWtRbFCvWtZRZVVQN5RzNgVz0J5cLuyLuDIlr6eVhxGzwo
OwjO/wmTmwbyJwpvg/zNhs4leKUlp3s0JYmKswYUx/rWdnqzpOmPseb1YkGujN7Z
iSIO0CPhAkQGXrdh6USuQ+ed5QhDp72NoKZUY+F4XQz+j7mH3iU=
=PJ8Y
-----END PGP SIGNATURE-----
