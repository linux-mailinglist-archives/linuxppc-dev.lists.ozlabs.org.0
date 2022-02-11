Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE924B1C61
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Feb 2022 03:32:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JvyLV4cPmz3cG5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Feb 2022 13:32:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=107.174.27.60; helo=ozlabs.ru;
 envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Received: from ozlabs.ru (ozlabs.ru [107.174.27.60])
 by lists.ozlabs.org (Postfix) with ESMTP id 4JvyL62qBXz2xsY
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Feb 2022 13:31:40 +1100 (AEDT)
Received: from fstn1-p1.ozlabs.ibm.com. (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id 5C773804B3;
 Thu, 10 Feb 2022 21:31:28 -0500 (EST)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: llvm@lists.linux.dev
Subject: [PATCH kernel 0/3] powerpc/llvm/lto: Enable CONFIG_LTO_CLANG_THIN=y
Date: Fri, 11 Feb 2022 13:31:22 +1100
Message-Id: <20220211023125.1790960-1-aik@ozlabs.ru>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Fabiano Rosas <farosas@linux.ibm.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Nicholas Piggin <npiggin@gmail.com>, Nathan Chancellor <nathan@kernel.org>,
 Joel Stanley <joel@jms.id.au>,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


This is based on sha1
1b43a74f255c Michael Ellerman "Automatic merge of 'master' into merge (2022-02-01 10:41)".

Please comment. Thanks.



Alexey Kardashevskiy (3):
  powerpc/64: Allow LLVM LTO builds
  powerpc/llvm: Sample config for LLVM LTO
  powerpc/llvm/lto: Workaround conditional branches in FTR_SECTION_ELSE

 arch/powerpc/Makefile                    |   4 +
 arch/powerpc/Kconfig                     |   2 +
 arch/powerpc/configs/ppc64_lto_defconfig | 381 +++++++++++++++++++++++
 arch/powerpc/kernel/exceptions-64s.S     |   6 +-
 arch/powerpc/lib/copyuser_64.S           |   3 +-
 arch/powerpc/lib/memcpy_64.S             |   3 +-
 6 files changed, 396 insertions(+), 3 deletions(-)
 create mode 100644 arch/powerpc/configs/ppc64_lto_defconfig

-- 
2.30.2

