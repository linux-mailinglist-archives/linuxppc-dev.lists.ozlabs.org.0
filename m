Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 60ED269839A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 19:42:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PH6Pn2HHhz3cfg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 05:42:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PDt6O2zX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=nathan@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PDt6O2zX;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PH6Nn631Kz3bVP
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Feb 2023 05:41:29 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9D3C261D20;
	Wed, 15 Feb 2023 18:41:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 687FEC433EF;
	Wed, 15 Feb 2023 18:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676486486;
	bh=jdvkUbDeD0+NjKmqBpzFb3SJxoDKFX9S+eNEcnraNH4=;
	h=From:Subject:Date:To:Cc:From;
	b=PDt6O2zX0ayjES6ktMzzKb5kguyA1gM3lcFdMyIAKSrpr753+jnhbXBD035CjrB+d
	 dZpYWfnFBbXKdyKFZd2BzlRgI8UyjfyU/7epoHMBblzNdNS/382sV1CEOg6h1hq2pS
	 ckEWIEm9XoBW72njizL2GTHFhL7ofcx7t7SWsMAlAn6Uhb2yskSV6am4gAhGSB1y7f
	 BaV7lU+A646s3/btf83QsZ0fIzt4Wm8mwwtHJseJJNzIKCAMRJla2/6c2BFd0amEdW
	 7V0PYMPEjBNdRSg6n7W+lDZs7hrMTsoBt5kSFO/tW+CnmcJcaCHpPCIfmxVyxKRwob
	 pfn1toSYhmE1w==
From: Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH 0/3] Allow CONFIG_PPC64_BIG_ENDIAN_ELF_ABI_V2 with ld.lld
 15+
Date: Wed, 15 Feb 2023 11:41:14 -0700
Message-Id: <20230118-ppc64-elfv2-llvm-v1-0-b9e2ec9da11d@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEon7WMC/x2NywrDIBAAfyXsuQtqSvr4ldLDatZGMFZ2ixRC/
 r2mx2EYZgNlSaxwHzYQbknTu3SwpwHCQuXFmObO4IwbjbVXrDVMZ+Qcm8Oc24rjjWcK08VHQ9A
 zT8rohUpYjnAl/bAcogrH9P2/Hs99/wG6U831ewAAAA==
To: mpe@ellerman.id.au
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1319; i=nathan@kernel.org;
 h=from:subject:message-id; bh=jdvkUbDeD0+NjKmqBpzFb3SJxoDKFX9S+eNEcnraNH4=;
 b=owGbwMvMwCEmm602sfCA1DTG02pJDMlv1UPOxtVaN/z3qfsy05LNTCRq2ycBTRbuiE729ZnVz
 Ck9/R0dpSwMYhwMsmKKLNWPVY8bGs45y3jj1CSYOaxMIEMYuDgFYCKxRxgZJrgdiSo786p/9oc3
 O8X/rOv+Kf0gyefDienPg7cy2e1cZMPI0LJ57/R2oc8n/VivJmyZEp43LWBun5W4cIXZ9DrvjHd
 ezAA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
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
Cc: erhard_f@mailbox.org, trix@redhat.com, llvm@lists.linux.dev, ndesaulniers@google.com, linux-kernel@vger.kernel.org, patches@lists.linux.dev, nathan@kernel.org, npiggin@gmail.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently, CONFIG_PPC64_BIG_ENDIAN_ELF_ABI_V2 is not selectable with
ld.lld because of an explicit dependency on GNU ld, due to lack of
testing with LLVM.

Erhard was kind enough to test this option on his hardware with LLVM 15,
which ran without any issues. This should not be too surprising, as
ld.lld does not have support for the ELFv1 ABI, only ELFv2, so it should
have decent support. With this series, big endian kernels can be built
with LLVM=1.

This has seen our basic set of powerpc configurations with clang-15,
clang-16, and clang-17 but I will never be opposed to more testing :)

The first two patches fix a couple of issues I noticed while build
testing and the final patch actually allows the option to be selected.

---
Nathan Chancellor (3):
      powerpc/boot: Only use '-mabi=elfv2' with CONFIG_PPC64_BOOT_WRAPPER
      powerpc: Fix use of '-mabi=elfv2' with clang
      powerpc: Allow CONFIG_PPC64_BIG_ENDIAN_ELF_ABI_V2 with ld.lld 15+

 arch/powerpc/Kconfig       | 3 +--
 arch/powerpc/Makefile      | 4 +---
 arch/powerpc/boot/Makefile | 6 +++---
 3 files changed, 5 insertions(+), 8 deletions(-)
---
base-commit: 5dc4c995db9eb45f6373a956eb1f69460e69e6d4
change-id: 20230118-ppc64-elfv2-llvm-39edac67bf0a

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>

