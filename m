Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD978354B1
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 Jan 2024 07:02:11 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=r7EBNXJG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4THjRh1hWrz3bmy
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 Jan 2024 17:02:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=r7EBNXJG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=aneesh.kumar@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4THjQq2DFHz2ytJ
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Jan 2024 17:01:23 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8EA49CE11E6;
	Sun, 21 Jan 2024 06:01:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67F70C433F1;
	Sun, 21 Jan 2024 06:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705816878;
	bh=NhuWvOK0Ww7kWbZZ5RP94AqOzv5GR82HM8u8uXEYXoE=;
	h=From:To:Cc:Subject:Date:From;
	b=r7EBNXJGZQpC+3aNfH8hPNKK8Moi2IktJH5QBxGfFERpiGuhdBOFsQSw3s4unNLpt
	 6EM21rgFFfUK62e/vhWco8G3L+IgfgrSddS3JRsqOOKX5guIvElzZRgGdeppIlkc40
	 x5HKTLHufrkg1m4W+CfX4XmtGYdCkeO2XNfQg5eUc27p3kmzZpFm6xcIBSYRUvGO+Z
	 mhK6YWKC0AJd4emRusaBFychz/IS2eBeBDiNpAaJc6kP/yUYgIu1MIA4RqS4BTff3Q
	 zpRtLafeqx7li8Lzfb7jraLfKaf0edOONBICP1LoUbnTNs42gUel74cNNNuvZxJud/
	 PMWjeyblrmrZg==
X-Mailer: emacs 29.1 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-6.8-2 tag
Date: Sun, 21 Jan 2024 11:31:11 +0530
Message-ID: <875xznql7c.fsf@kernel.org>
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
Cc: aneesh.kumar@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Hi Linus,

Please pull powerpc fixes for 6.8:

The following changes since commit d2441d3e8c0c076d0a2e705fa235c76869a85140:

  MAINTAINERS: powerpc: Add Aneesh & Naveen (2023-12-13 22:35:57 +1100)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.8-2

for you to fetch changes up to 18f14afe281648e31ed35c9ad2fcb724c4838ad9:

  powerpc/64s: Increase default stack size to 32KB (2024-01-19 00:10:14 +0530)

- ------------------------------------------------------------------
powerpc fixes for 6.8 #2

 - 18f14afe2816 powerpc/64s: Increase default stack size to 32KB BY: Michael Ellerman

Thanks to:
Michael Ellerman

- ------------------------------------------------------------------
Michael Ellerman (1):
      powerpc/64s: Increase default stack size to 32KB


 arch/powerpc/Kconfig | 1 +
 1 file changed, 1 insertion(+)
-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQTYs9CDOrDQRwKRmtrJvCLnGrjHVgUCZayyTgAKCRDJvCLnGrjH
VlgzAQDkYdg1/DjYNR4Ie/i4MdlYj2cA4s4kTR1x25QHHb6t7AD/URA8U20cMSla
etAHTJ3/Y/B/C/nL4GsC2uC5nYZ+bgo=
=WIHK
-----END PGP SIGNATURE-----
