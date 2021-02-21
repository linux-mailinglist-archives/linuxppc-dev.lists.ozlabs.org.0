Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A423F320C26
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 Feb 2021 18:50:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DkCX55L6Yz3cWv
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Feb 2021 04:50:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=p9QM+Q0s;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182;
 helo=linux.microsoft.com; envelope-from=nramas@linux.microsoft.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com
 header.a=rsa-sha256 header.s=default header.b=p9QM+Q0s; 
 dkim-atps=neutral
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by lists.ozlabs.org (Postfix) with ESMTP id 4DkCW85NJLz30K4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Feb 2021 04:49:39 +1100 (AEDT)
Received: from localhost.localdomain (c-73-42-176-67.hsd1.wa.comcast.net
 [73.42.176.67])
 by linux.microsoft.com (Postfix) with ESMTPSA id 7B9C1209FACB;
 Sun, 21 Feb 2021 09:49:36 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 7B9C1209FACB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1613929777;
 bh=uowamsTjjBmMe5j3A2qccc9BUbwhw6V4WJQpcy/trZg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=p9QM+Q0squHzUnX0IO4IAQVIzngh7X4sSHuEbhcajLDTRqrHQ8HYyx72Ww4t1F3su
 yLjl9R5RO1Z0NpBcV7SlqP7yvh2TkfTL4Gwr2raSuAKFpsmpXibdR5FaSiYlz9KTHN
 AKxkOHNDdsspO1JUTPoQfMJnCxIA4mU4kxgkY3l4=
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
To: zohar@linux.ibm.com, bauerman@linux.ibm.com, robh@kernel.org,
 takahiro.akashi@linaro.org, gregkh@linuxfoundation.org, will@kernel.org,
 joe@perches.com, catalin.marinas@arm.com, mpe@ellerman.id.au,
 sfr@canb.auug.org.au
Subject: [PATCH v19 01/13] kexec: Move ELF fields to struct kimage
Date: Sun, 21 Feb 2021 09:49:18 -0800
Message-Id: <20210221174930.27324-2-nramas@linux.microsoft.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210221174930.27324-1-nramas@linux.microsoft.com>
References: <20210221174930.27324-1-nramas@linux.microsoft.com>
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
Cc: mark.rutland@arm.com, tao.li@vivo.com, paulus@samba.org,
 vincenzo.frascino@arm.com, frowand.list@gmail.com, sashal@kernel.org,
 masahiroy@kernel.org, jmorris@namei.org, allison@lohutok.net, serge@hallyn.com,
 devicetree@vger.kernel.org, pasha.tatashin@soleen.com,
 prsriva@linux.microsoft.com, hsinyi@chromium.org,
 linux-arm-kernel@lists.infradead.org, christophe.leroy@c-s.fr,
 mbrugger@suse.com, balajib@linux.microsoft.com, dmitry.kasatkin@gmail.com,
 linux-kernel@vger.kernel.org, james.morse@arm.com,
 linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

ELF related fields elf_headers, elf_headers_sz, and elf_load_addr are
defined in architecture specific 'struct kimage_arch' for x86, powerpc,
and arm64.  The name of these fields are different in these
architectures that makes it hard to have a common code for setting up
the device tree for kexec system call.

Move the ELF fields to 'struct kimage' defined in include/linux/kexec.h
so common code can use it.

Signed-off-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Suggested-by: Rob Herring <robh@kernel.org>
Fixes: 33488dc4d61f ("of: Add a common kexec FDT setup function")
Reported-by: kernel test robot <lkp@intel.com>
---
 include/linux/kexec.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/kexec.h b/include/linux/kexec.h
index 5f61389f5f36..0208fe8f8e42 100644
--- a/include/linux/kexec.h
+++ b/include/linux/kexec.h
@@ -305,6 +305,11 @@ struct kimage {
 	/* Virtual address of IMA measurement buffer for kexec syscall */
 	void *ima_buffer;
 #endif
+
+	/* Core ELF header buffer */
+	void *elf_headers;
+	unsigned long elf_headers_sz;
+	unsigned long elf_load_addr;
 };
 
 /* kexec interface functions */
-- 
2.30.0

