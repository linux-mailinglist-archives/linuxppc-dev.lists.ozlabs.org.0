Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 665396B441
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jul 2019 04:02:37 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45pLBL34MbzDqLL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jul 2019 12:02:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=sifive.com
 (client-ip=2607:f8b0:4864:20::541; helo=mail-pg1-x541.google.com;
 envelope-from=palmer@sifive.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=sifive.com header.i=@sifive.com header.b="lx7DMwJw"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45pKRy1FlWzDqYt
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Jul 2019 11:29:14 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id i18so10296774pgl.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2019 18:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=/JCMTovNsMOTb4V8NbJUn4gtZFBomdigf57eMm4vvwA=;
 b=lx7DMwJwb44W7Tsx+wtQGpeBhtEGmLrTQeHhVfpNHKCPvBD3EZccrC+x1nOiZ399Ox
 Ce7qyy+Rjzuxnpqy8yeYrgqjTmrF1e4jLl6TgE3ixOT/U87rKHP/GwhBwHUCMYYMBtSX
 XTxaPmwymA5BLTwz52iRqFqvtSq/Vds0zwWqSBqBhCoTjEmDNRyJXxv1Z31bPto7petN
 4K4DlHQcEWAQRcfUEdZhqZdNL8Hu1gE5jSIKmzD34yWc3h67AlA1Bsy7Mb4SoM0dQh/o
 8yYfnpbjmU1EbMOju/emLtWoEWPcrjXBQNL7vtCS5P7kJATFe6R2UYNx/eNwEOEaDppF
 HG5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=/JCMTovNsMOTb4V8NbJUn4gtZFBomdigf57eMm4vvwA=;
 b=Kb6dVMopPFz3hGhrbQHVpY09HfKUHMVUleD1/EW8SXoTB0/OB7tSWKeBgAYDr+3GXG
 hztN7gcVJsMg8uHJPOuU5WRJWxpwm3owIxWcjBB7OJMPk/JqjTaLRzTZzZbkXLtVEZpL
 iwISrqAlgXiCORligZkncVYfVSXeyg6I8cWA0xQXCYyu2Lf0wBvg7L9F1EKaJFaCuT/R
 47XKasRcbaq3HyosI8+3Y9C5AmZspQpl9epPEIDaA56dx83U5wQzwHGZnGTlI8AZ+zhO
 7/Vo8O9uk5/dVDWZm3fnJSbFaoGDgPu4wHyRz09IQUvKYyeA7icrRuWnOmztdzstb99L
 Te+w==
X-Gm-Message-State: APjAAAUs9NJfbs/ISHaafeYZ2oYWklVj8rmCVKHHuO70QwWbfGnNQT6z
 Op0D4zVknkq6mogGIuiNn18ynQ==
X-Google-Smtp-Source: APXvYqyg4YmraVYF5BPtOY0Mh+Db31ThY69mi6xzsSYevYAi9Xz9ds0qvpgX9gVnM7rPKcCcJUwZJg==
X-Received: by 2002:a17:90a:fa07:: with SMTP id
 cm7mr5653774pjb.115.1563326953172; 
 Tue, 16 Jul 2019 18:29:13 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id x67sm24955724pfb.21.2019.07.16.18.29.11
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 16 Jul 2019 18:29:12 -0700 (PDT)
Subject: [PATCH v2 1/4] Non-functional cleanup of a "__user * filename"
Date: Tue, 16 Jul 2019 18:27:16 -0700
Message-Id: <20190717012719.5524-2-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190717012719.5524-1-palmer@sifive.com>
References: <20190717012719.5524-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Palmer Dabbelt <palmer@sifive.com>
To: viro@zeniv.linux.org.uk, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>
X-Mailman-Approved-At: Wed, 17 Jul 2019 11:58:47 +1000
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
Cc: dalias@libc.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 peterz@infradead.org, Palmer Dabbelt <palmer@sifive.com>,
 heiko.carstens@de.ibm.com, stefan@agner.ch,
 James.Bottomley@HansenPartnership.com, namhyung@kernel.org,
 kim.phillips@arm.com, paulus@samba.org, deepa.kernel@gmail.com, hpa@zytor.com,
 sparclinux@vger.kernel.org, will@kernel.org, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, hare@suse.com, Arnd Bergmann <arnd@arndb.de>,
 ysato@users.sourceforge.jp, deller@gmx.de, x86@kernel.org,
 linux@armlinux.org.uk, borntraeger@de.ibm.com, mingo@redhat.com,
 geert@linux-m68k.org, linux-arm-kernel@lists.infradead.org,
 catalin.marinas@arm.com, jhogan@kernel.org, firoz.khan@linaro.org,
 mattst88@gmail.com, fenghua.yu@intel.com, gor@linux.ibm.com, jolsa@redhat.com,
 tycho@tycho.ws, acme@kernel.org, linux-m68k@lists.linux-m68k.org,
 ink@jurassic.park.msu.ru, luto@kernel.org, alexander.shishkin@linux.intel.com,
 tglx@linutronix.de, christian@brauner.io, rth@twiddle.net, axboe@kernel.dk,
 dhowells@redhat.com, monstr@monstr.eu, tony.luck@intel.com,
 linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org, ralf@linux-mips.org,
 paul.burton@mips.com, linux-alpha@vger.kernel.org, schwidefsky@de.ibm.com,
 bp@alien8.de, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The next patch defines a very similar interface, which I copied from
this definition.  Since I'm touching it anyway I don't see any reason
not to just go fix this one up.

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 include/linux/syscalls.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/syscalls.h b/include/linux/syscalls.h
index 2bcef4c70183..e1c20f1d0525 100644
--- a/include/linux/syscalls.h
+++ b/include/linux/syscalls.h
@@ -431,7 +431,7 @@ asmlinkage long sys_chdir(const char __user *filename);
 asmlinkage long sys_fchdir(unsigned int fd);
 asmlinkage long sys_chroot(const char __user *filename);
 asmlinkage long sys_fchmod(unsigned int fd, umode_t mode);
-asmlinkage long sys_fchmodat(int dfd, const char __user * filename,
+asmlinkage long sys_fchmodat(int dfd, const char __user *filename,
 			     umode_t mode);
 asmlinkage long sys_fchownat(int dfd, const char __user *filename, uid_t user,
 			     gid_t group, int flag);
-- 
2.21.0

