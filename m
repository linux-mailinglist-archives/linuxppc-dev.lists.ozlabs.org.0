Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0A424F0BA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Aug 2020 02:33:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BZY4X0clxzDqLs
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Aug 2020 10:33:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BZY2h5MFzzDqPm
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Aug 2020 10:31:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Date:Message-ID:Subject:From:To:Sender:Reply-To:Cc:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=iM0SYJEwCSfM/KX5jOc8DR6fgqQxcRAOf/ZjYNYJiLg=; b=uvA44k96e2xJrd+e1flZL8Yw8F
 Bv6IOBb6LU0hfu4SDw3Quxz6eddj8qf2YVsGrV4WxnE3cvxXWh5Tc6u8DCAB7sj+NQyYrfMxyRKYN
 pnkQIRkhxiQIzNLbou0rvV4RG8jpjdefb3a9iDfY0quCuZDelXA5B+4t0/DFE72LTeZwSZgOadZ0q
 u1FkTLW9FiLgfbSeA8Deb1VlcdMxXsP/mucUw9kVwPk9ZZaqJpcIbu+3sF3hdMOJJmpO65bfNQIgn
 oJP8bIWd20jzznmBh3XWU10IsOOzT17KVn5CMpJqmk7KD7OFABKVpjHDH+qtjb5nMJUd2S7DEnMSl
 LMpmhnag==;
Received: from [2601:1c0:6280:3f0::19c2]
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kA0OM-0003lt-Dd; Mon, 24 Aug 2020 00:31:18 +0000
To: LKML <linux-kernel@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>
From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] Documentation/powerpc: fix malformed table in syscall64-abi
Message-ID: <e06de4d3-a36f-2745-9775-467e125436cc@infradead.org>
Date: Sun, 23 Aug 2020 17:31:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Randy Dunlap <rdunlap@infradead.org>

Fix malformed table warning in powerpc/syscall64-abi.rst by making
two tables and moving the headings.

Documentation/powerpc/syscall64-abi.rst:53: WARNING: Malformed table.
Text in column margin in table line 2.

=========== ============= ========================================
--- For the sc instruction, differences with the ELF ABI ---
r0          Volatile      (System call number.)
r3          Volatile      (Parameter 1, and return value.)
r4-r8       Volatile      (Parameters 2-6.)
cr0         Volatile      (cr0.SO is the return error condition.)
cr1, cr5-7  Nonvolatile
lr          Nonvolatile

--- For the scv 0 instruction, differences with the ELF ABI ---
r0          Volatile      (System call number.)
r3          Volatile      (Parameter 1, and return value.)
r4-r8       Volatile      (Parameters 2-6.)
=========== ============= ========================================

Fixes: 7fa95f9adaee ("powerpc/64s: system call support for scv/rfscv instructions")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
---
 Documentation/powerpc/syscall64-abi.rst |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

--- lnx-59-rc2.orig/Documentation/powerpc/syscall64-abi.rst
+++ lnx-59-rc2/Documentation/powerpc/syscall64-abi.rst
@@ -49,16 +49,18 @@ Register preservation rules
 Register preservation rules match the ELF ABI calling sequence with the
 following differences:
 
-=========== ============= ========================================
 --- For the sc instruction, differences with the ELF ABI ---
+=========== ============= ========================================
 r0          Volatile      (System call number.)
 r3          Volatile      (Parameter 1, and return value.)
 r4-r8       Volatile      (Parameters 2-6.)
 cr0         Volatile      (cr0.SO is the return error condition.)
 cr1, cr5-7  Nonvolatile
 lr          Nonvolatile
+=========== ============= ========================================
 
 --- For the scv 0 instruction, differences with the ELF ABI ---
+=========== ============= ========================================
 r0          Volatile      (System call number.)
 r3          Volatile      (Parameter 1, and return value.)
 r4-r8       Volatile      (Parameters 2-6.)


