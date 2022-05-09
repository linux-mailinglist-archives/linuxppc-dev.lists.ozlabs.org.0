Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1925D51F84F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 May 2022 11:36:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KxbfG025cz3bft
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 May 2022 19:36:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HA9dSIJT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=ilpo.jarvinen@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=HA9dSIJT; dkim-atps=neutral
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kxbdb1byKz2yMS
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 May 2022 19:36:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652088963; x=1683624963;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=D/x1ycw0QvCLLhMcVpaUSr9cP6MhaUOF3dS7CsbLTm8=;
 b=HA9dSIJTLeFPxPBHw4+Jf71ReFYZpkfxCuDJL6Qs/pwIN2uV3RiV8AX+
 cWDHBYv5RDFSta0SlVeVcvKqx8vp9D38TDOtYePgDX8tSV78Nu1q8fe1L
 xL2HGgPRwo5ZsUbKsGFWbUcGEJBtOjALhjKkHa7+9uXQDdfqZAgm/Vm+U
 DVVMEPbejtfD0XdrsYBe5HdpP1GGFXU1fNRp9nQ1/NlyfFYukgkWlCVQj
 cqoSRXrf4iN1PaJGzs7TosxqkTNvCaqI0TrDWuRd0ovkf3pOMGufvR2QN
 dL1RjO/el+XMCaN88c8lAUbX+31qHJOhJN/DbdMmTPfybmenBKwIPhJ03 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10341"; a="268924333"
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="268924333"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 02:34:59 -0700
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="564969527"
Received: from mfuent2x-mobl1.amr.corp.intel.com (HELO
 ijarvine-MOBL2.ger.corp.intel.com) ([10.251.220.67])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 02:34:53 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-serial@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Matt Turner <mattst88@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, "David S. Miller" <davem@davemloft.net>,
 Arnd Bergmann <arnd@arndb.de>, linux-alpha@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, linux-arch@vger.kernel.org
Subject: [PATCH 0/3] termbits.h: Further improvements
Date: Mon,  9 May 2022 12:34:43 +0300
Message-Id: <20220509093446.6677-1-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Again, I prefer Greg to take these through his tty tree.

Changes done by this serie:

1) Create termbits-common.h for the most obvious termbits.h intersection.
2) Reformat some lines that remain in termbits.h files.
3) Don't include posix_types.h unnecessarily.

Please do check I got the uapi include things done correctly! That is,
that including using asm-generic/termbits-common.h path is the preferred
approach for a header file that is not supposed to be overridden by the
arch specific header files and that mandatory-y is not required for
termbits-common.h.

Unfortunately I couldn't move also tcflag_t into termbits-common.h due
to the way it is being defined for sparc. However, by the looks of how
the type for tcflag_t is being chosen there, having just unsigned int
might work also for sparc?

Ilpo Järvinen (3):
  termbits.h: create termbits-common.h for identical bits
  termbits.h: Align lines & format
  termbits.h: Remove posix_types.h include

 arch/alpha/include/uapi/asm/termbits.h     | 182 ++++++-----------
 arch/mips/include/uapi/asm/termbits.h      | 209 ++++++++-----------
 arch/parisc/include/uapi/asm/termbits.h    | 131 ++++--------
 arch/powerpc/include/uapi/asm/termbits.h   | 152 +++++---------
 arch/sparc/include/uapi/asm/termbits.h     | 223 ++++++++-------------
 include/uapi/asm-generic/termbits-common.h |  65 ++++++
 include/uapi/asm-generic/termbits.h        | 129 ++++--------
 7 files changed, 418 insertions(+), 673 deletions(-)
 create mode 100644 include/uapi/asm-generic/termbits-common.h

-- 
2.30.2

