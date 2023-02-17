Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7037669B5A3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 23:41:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PJRcV2glGz3fQv
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Feb 2023 09:41:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=YGujZgUO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PJRbY4lPNz3c46
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Feb 2023 09:40:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=YGujZgUO;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PJRbW0Vsjz4x4n;
	Sat, 18 Feb 2023 09:40:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1676673623;
	bh=xs/wXkAOF8KGVOLSwFeJYUalyiRca72VPv45G0xVNz0=;
	h=From:To:Cc:Subject:Date:From;
	b=YGujZgUO8L0ZMey+VkfQmooepOjbfPkOthEnitIYAImrP6B1WFLZekDB+iYGM3H2I
	 hFC1C0FjWK/i4CHAHk3pZ6TqrCh/tT0VgIVqp1tsEtLTJ18kpSLFKs3OhWvh7rFVkY
	 P+6WFKgqPw0fy3SjAwxYX6Lbpk6Pe0NQUB8aBqUdOs8qpwV57Rk/y0H9NZInJPzEaz
	 ++mRGdUzhRf0l+4IzztS8N4+zDyw9ZJxDzrk7BHavscQrFvmrqSs4lm2xqzYOjuV2x
	 tplOWprRJp8BDFrw1qQe8ehJc8fX3ih/2MJmYdzE6hK2g7D0S6KWTFh8iIQnpyAKbH
	 6u3yL/7gJJCUA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-6.2-6 tag
Date: Sat, 18 Feb 2023 09:40:18 +1100
Message-ID: <87h6vjzzjh.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, bgray@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull one more powerpc fix for 6.2:

The following changes since commit 2ea31e2e62bbc4d11c411eeb36f1b02841dbcab1:

  powerpc/64s/interrupt: Fix interrupt exit race with security mitigation switch (2023-02-07 10:13:33 +1100)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.2-6

for you to fetch changes up to 4302abc628fc0dc08e5855f21bbfaed407a72bc3:

  powerpc/64s: Prevent fallthrough to hash TLB flush when using radix (2023-02-17 12:30:56 +1100)

- ------------------------------------------------------------------
powerpc fixes for 6.2 #6

 - Prevent fallthrough to hash TLB flush when using radix.

Thanks to: Benjamin Gray, "Erhard F.".

- ------------------------------------------------------------------
Benjamin Gray (1):
      powerpc/64s: Prevent fallthrough to hash TLB flush when using radix


 arch/powerpc/include/asm/book3s/64/tlbflush.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAmPwAU4ACgkQUevqPMjh
pYDPjRAAlpjdeTzrSwV63jF3q9I5H9mgdmiNa2ZfRifKI7FLvHd9Yob8gs35D//x
CLLhrQmtWL9LooFu5bx+UsLs2MuLevmUsWFWXhYPwDjEuLx12VP64i4obbugH89e
QbGr6J9HwwHQLnwFacBWAPHl4NGO2KhRt/GEZZsWvw/1szikYDJfNlhh6M5vD5PW
XNgkA5aJdyegkYWlYF+OsRVeE3GRzqU1dDagdc+9kzXzkqcMj4DsxVohviTLhhua
cIdfUlZV8BDQc0F2I4376mh4O1+b/k4eGbnyIF14jd0Z/9ZOF9nAkgU7s3Z74n38
O5gIBPMSz8bXoYKyVCO61SoDZHUGCWTn0xx14/cl0PAgGoU29xUH5/+S1miN1LdE
N9gA3hDNagfRpXTDCWmbp5BREHItLrDzKUv125Ipf5hilV0Yzp/G7JAfun8E37wx
3I0iHvH/Feq55fT9w1lggQ/Qt+9147xd5GyCbEQn7mJ/jolSFRkLzpAhsnec7Iwr
qs00/n1JrRK5Owi6Ir2ds8vGZP4dFSGxnzhDMU/PaacavBpGDPP8xb2JsrvpoR6o
rhReC7bnmYKIel7YJAaY+U3qwyCdYMBrQGpnfOb1eMXFYXK2LopP4TWfVO/LxHsp
7fllB3nBWGQX/fCwKe5QMUS9QhAYWJ1Y/hgq3Gg1o9nmfn2VWNY=
=/f1f
-----END PGP SIGNATURE-----
