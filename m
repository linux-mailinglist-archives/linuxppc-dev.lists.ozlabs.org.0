Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A86D631221
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Nov 2022 02:35:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NFCkd2z1zz3cS4
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Nov 2022 12:35:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=mdn0PJKW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NFCjl2Cwdz3bjf
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Nov 2022 12:34:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=mdn0PJKW;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NFCjl0WWYz4xN1;
	Sun, 20 Nov 2022 12:34:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1668908059;
	bh=WAz5b+h6sdKrd/5RvPUJW4FPrLv5O7UhrXq2xZq92yg=;
	h=From:To:Cc:Subject:Date:From;
	b=mdn0PJKWNZn7vk5UY5iPNEOB4lsX28R+OmfHSA01MQW/71/IS/xlHttt3TopSGsX3
	 nr7XgYUTtgv0G9t0j27W5CQJHjUEwd2DNShJuxSlOMFWwCA8rsFSpWDnpDErB94Gdj
	 G8sBeXOykdd1EupLxPMtprDfbb+O/+EkSnzmZsFqpQR3RfReOSsJ5MZZ9Km6pUcG/Q
	 MLsS+5ZOjKMJ3yPVkLaKZSTFtSWB5J32/lb3waCyyxfEBY0cPmy0zDIr/maVUgJ1+N
	 1M/0ZDzfy7q86o3BptUcqeQbNnmPxm/M7QTq10D36uveQTIa1eS9vyZTlCk7VAj/nW
	 PHV+eQpX2wAmg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-6.1-5 tag
Date: Sun, 20 Nov 2022 12:34:18 +1100
Message-ID: <87tu2ucsth.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull another powerpc fix for 6.1:

The following changes since commit 02a771c9a68a9f08cce4ec5e324fb1bc4dce7202:

  powerpc/32: Select ARCH_SPLIT_ARG64 (2022-11-01 15:27:12 +1100)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.1-5

for you to fetch changes up to eb761a1760bf30cf64e98ee8d914866e62ec9e8a:

  powerpc: Fix writable sections being moved into the rodata region (2022-11-16 21:37:14 +1100)

- ------------------------------------------------------------------
powerpc fixes for 6.1 #5

 - Fix writable sections being moved into the rodata region.

Thanks to: Nicholas Piggin, Christophe Leroy.

- ------------------------------------------------------------------
Nicholas Piggin (1):
      powerpc: Fix writable sections being moved into the rodata region


 arch/powerpc/kernel/vmlinux.lds.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAmN5g9sACgkQUevqPMjh
pYAUKQ/+II2IDXsGIAf7Nh6Bu7+VbvKj7RPKABPfGWwyW1TQ2AMe0MSjRBc8CMgk
NWUlZNUkXfonS0WCNET/tgfzYU4qYP0JJDLlxvh790LuaAJ7VVw0a9phPYm4YptM
3mlGo6jj9dU3Xmb/TuJCyxHhaBIpdcaEzLYRUFT8vlMl++U65tJN+q7YMBlJ0Q9e
4HIL1yxeek6Bd6wxqgsS/L8J8s52A3iQBTAUHNQaSqZTQKjLxWS9u3oY18S/1+u2
8zLkyTHFWM8EClDmU8IEHPNonVBjWbTUmZji9Akp/2osh2uQlYtpE7eCR5VNsYtn
Tkuv0lQLFNOWraOl97DdKEfJJxX2sZPt+0I1UhywN6wabHY0UiZjHm/3nUdYMtAa
tEsKoj4m+gydD9aM1q+UkFGd7gsXWf8GqQ22TEd73HoE0nL2Prr18bNGyX0KYzH4
BPHYaoOe2pQpaix83Cod6VkrKdShBpUCw9hIF+Tj0nWXNgBNJP+UnBj5157DOIqO
WNFUkQKNYuebhO453zhBQA7EEO5GNjpbXrxsuLKz8A4m9Wlu3MxX1gHxp5nJbkif
D86ifPZaaOMixPDAHygzihsXpTKQ0fnhRp8tguRBwwoN5MTOZp0HNsAhzEBrKTta
hPar+QyWwSXjcH2SC7BoH0sIPDwdBCkwthh4kvgATr+fn2EuKi0=
=mxZu
-----END PGP SIGNATURE-----
