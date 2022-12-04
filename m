Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CAE3641D30
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 Dec 2022 14:20:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NQ6kM2WjXz3bjv
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Dec 2022 00:20:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=jeb2GVqo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NQ6jQ5ZHGz3bT8
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Dec 2022 00:19:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=jeb2GVqo;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NQ6jL2GR1z4wgr;
	Mon,  5 Dec 2022 00:19:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1670159990;
	bh=O6WIIUv4HAQEWxuJH3CwIfKqhsQR7d/ljcXdPZYuOVE=;
	h=From:To:Cc:Subject:Date:From;
	b=jeb2GVqo//4HfOkaxp4/iSYycoFPN2jVnxhOLq0IM9tMWEOQrpu6SSoSqLmCy7P9v
	 UlyLLxy22Q9/aLLFeIGsGoKH/twMufWsinXLm3YALRYEL/1jNGpR6NIKGq8M2/WyN0
	 7YAbXzjXuPZ+hWOIEJJtbiY08vrC8FxDSGHSpjTCSovLzySBIAqURj0dSwWtM9kbuH
	 ecGkmeA7nQB/oPfFkkxuH9ObUKxQygk2Bbcd7jiBjzz3Cw/LyJWVa9VYsQx0oYXwG/
	 sh43eJzIeadF56bDu/K4dD5QtQRK8WnZKJrGlZHsVu3eCwganuCw9BRRFSFlsh4or3
	 pWx/w3heERBGQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-6.1-6 tag
Date: Mon, 05 Dec 2022 00:19:45 +1100
Message-ID: <87sfhvs3v2.fsf@mpe.ellerman.id.au>
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

Please pull some more powerpc fixes for 6.1:

The following changes since commit eb761a1760bf30cf64e98ee8d914866e62ec9e8a:

  powerpc: Fix writable sections being moved into the rodata region (2022-11-16 21:37:14 +1100)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.1-6

for you to fetch changes up to 2e7ec190a0e38aaa8a6d87fd5f804ec07947febc:

  powerpc/64s: Add missing declaration for machine_check_early_boot() (2022-11-26 00:25:32 +1100)

- ------------------------------------------------------------------
powerpc fixes for 6.1 #6

 - Fix oops in 32-bit BPF tail call tests
 - Add missing declaration for machine_check_early_boot()

Thanks to: Christophe Leroy, Naveen N. Rao.

- ------------------------------------------------------------------
Christophe Leroy (1):
      powerpc/bpf/32: Fix Oops on tail call tests

Michael Ellerman (1):
      powerpc/64s: Add missing declaration for machine_check_early_boot()


 arch/powerpc/include/asm/interrupt.h |  1 +
 arch/powerpc/net/bpf_jit_comp32.c    | 52 ++++++++------------
 2 files changed, 22 insertions(+), 31 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAmOMnkwACgkQUevqPMjh
pYC6iA//cPx4MT/SddmFB4bC9Vxp0lBUxu9zcepbWdsvVK/X1+eSHtPVFdfXdxYq
DhfHuEHizo6pKGYZnSYXjAG8/0pUQrKvnopgX0dNHtPvXSyRdeMyW10oiaweUa5v
WSRhKf6Uy+9cw1ZS9wwAAtssiLXt2rmV/xEGb9hs7o8NAW27067LKfntCkd8++9M
bs5V74c4X1WY1iJ86lxH3CYvOasZ/R7f46FeAu8KXX2n7+rlt1SOEnA2zaYtPYZ0
00dOCQpN5RuwCEjixJ9mFUZIJ+gL9AgjoOVF3lAGE6Ro2fyy/XRrh4BDnUCpfLhY
vylKDdy6BACz9vxQiY/phvWn//66GaLb2wbf5vhbH7Wc91ouMJlwh9g0JvD6ViRb
tAt4OOvRuOgenmpeigWUpJGpvX71Ib+sfPxpnmEwZDgTvt+aIxb0bgbEewgU/9Fz
BD89DxjS3lsj+B9vUYhXOSdkKbJg3B4MLcQP//0E2QWiHMTvCSuB8xoWNK68J6/D
3DnMVJkbvb0IrF0Q0rTXBzj1aMosc3dbwM/ezu5Zs3DK7/GWcRw4noKyWUXI6/NF
XB/R2xhxDnOyT/oZF0ssQzbA4rh1E4m9zj/RTrgn12SprT67p1sKQ5ppWPTTyd65
x3pCgocIzZvJc9S1ExmpZ9Seo9LQZxqXEsIzTqVU+5UjzFYC6tk=
=3xA+
-----END PGP SIGNATURE-----
