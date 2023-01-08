Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF6466153D
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Jan 2023 13:52:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NqcS00wWhz3c7d
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Jan 2023 23:52:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ZjOv6bY9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NqcR46hmMz2xBV
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  8 Jan 2023 23:52:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ZjOv6bY9;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NqcQy68Zjz4xwt;
	Sun,  8 Jan 2023 23:51:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1673182314;
	bh=aSyaHYyUn+SeogGEUrVY59t0mpRTg0vN/Gwl8rRcFXk=;
	h=From:To:Cc:Subject:Date:From;
	b=ZjOv6bY9QnUhtuvueHihJN0Js5TIKOxMqQhyDGZCM8iVtfu9bTst5tuZdrZTcURfs
	 gx5sIiGVUDSRTVJiSiQDLuB3gohs2nBdOa54X9BwgxMTSrDwrS9iIG6ZZAdDJfobWx
	 IzXl9YhiZCgETaKvjKmmkFFcifyWD8fyxg0pgpd9R6fkOZSplEDelfxXpA0DB1RIIY
	 3XHQ3AnKHvXWncUgNMD3WGQW5BiAlJ+496OR23Yygs3MQHgjBQaE2ygkjszPBqpmlo
	 Di6yBK5KPTVaeeCPRYZbOBcF8IzRUyGLycquaqruCR00JajF4F20uuE/PsYaR/uy7Q
	 sV5k64TxBapCg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-6.2-2 tag
Date: Sun, 08 Jan 2023 23:51:54 +1100
Message-ID: <87tu11gped.fsf@mpe.ellerman.id.au>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull powerpc fixes for 6.2:

The following changes since commit 88603b6dc419445847923fcb7fe5080067a30f98:

  Linux 6.2-rc2 (2023-01-01 13:53:16 -0800)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.2-2

for you to fetch changes up to be5f95c8779e19779dd81927c8574fec5aaba36c:

  powerpc/vmlinux.lds: Don't discard .comment (2023-01-06 00:25:12 +1100)

- ------------------------------------------------------------------
powerpc fixes for 6.2 #2

 - Three fixes for various bogosity in our linker script, revealed by the recent commit
   which changed discard behaviour with some toolchains.

- ------------------------------------------------------------------
Michael Ellerman (3):
      powerpc/vmlinux.lds: Define RUNTIME_DISCARD_EXIT
      powerpc/vmlinux.lds: Don't discard .rela* for relocatable builds
      powerpc/vmlinux.lds: Don't discard .comment


 arch/powerpc/kernel/vmlinux.lds.S | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAmO6u4IACgkQUevqPMjh
pYBhsRAAt9QD2PcS4enFnYmXG8XgL/ZY1Cuc0hS7Pt6DhVmV5bJnvGzIF+oA+P4x
GVegIN1B9mLYj/TVXLdqvKYFy3Ve6ENrd3lifD47BoISJRp0YbofFCMUepR1LdSq
B4yMqz0hDF10PqDot2b9Gt6m7vZADt2ywqIXehypiUil7w3yCd60BUSqZeNL/GBY
CylwrZ4J5WEX7j91HovmDpqFSiHnBBUvXHJH+WLwdJkMDcE2fzsrRLUEvOt7zLR1
3pLCMBoQ9HTUyMN6jO4HPaxEcg0uBKCwHQYsSrLp3hW4W2QzVbmmg5sSgALYvCWU
olcgO1kML6CeSK+JxeFlX5/CgE6VWRVOCe61cOHyh1b0ey5BkxxWtTkeyGzdVBWB
KCO70lgioxP41IQH08a+BLIT/N4H8MNF9wK4cSy6RePnkhhlG0lXU28wVtEaS5FU
zWoZXwz9c3q5tyWqWwqWmlvMrO1fTqMgUqOudXIsb+oZI/wM0NeUc6Ud0Kgm0+q4
MiVQdkNRWc6DCP2+U5bDC2L9vu2wAYeXqDJysNrKkuFiZ1XkrOk1b31EIRESEGtL
lrDwKeSzvrlvtKtEye3LO/0etYtQGy/GEwAlweQq2bo85vpnK9Luwh/SaTK53gDp
ZJJEm7AEnyqz+4Zyu9PuMQiqNvWygURhP1HXKnVoq4cMBQ5qUdA=
=7KgK
-----END PGP SIGNATURE-----
