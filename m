Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C9634AA38
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Mar 2021 15:40:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F6PlG6NFrz3c9v
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Mar 2021 01:40:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nG0Tk1zj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+31783f3a8021f30233dc+6424+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=bombadil.20210309 header.b=nG0Tk1zj; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F6PkJ3bbpz3bpS
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Mar 2021 01:39:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=ik1ZxFDTbN543xAdjkIaY+LrhRyZTgPPWblbYOdt+Ho=; b=nG0Tk1zj75N7RMl5ukKyw29ZN3
 b+NOjFYQo+wu7oBBfqqtji5laQisXQUxuPMbt4PIZGaF5UD040L3w0xZQgANcLCj4xlzSLv5c2bi0
 lg9LbshcQpAREZtrDf18Q/SG8yTj+moIlWxcm5A0jZuwX9nyD35AhobYsHKdA5fX54UC0vHu8806g
 gsQQ4ddMqtHcBjByEmM6PFfM8jGudMsMvUmqfrPkPqsQZUPyECPVNPi/pHwO/6wQl9g9tp+eSJhLo
 ky70B67w9ulsBx+95/RE/FpcWOmqKKR/GxCJeqMv1ybsBv6RXTwNNLaTgHmzPqWkAYUa8nGsQP8tS
 c4NX3KcA==;
Received: from [213.208.157.35] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lPnbr-005U6S-Bx; Fri, 26 Mar 2021 14:38:47 +0000
From: Christoph Hellwig <hch@lst.de>
To: "Eric W. Biederman" <ebiederm@xmission.com>,
 Al Viro <viro@zeniv.linux.org.uk>
Subject: [PATCH 1/4] exec: remove do_execve
Date: Fri, 26 Mar 2021 15:38:28 +0100
Message-Id: <20210326143831.1550030-2-hch@lst.de>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210326143831.1550030-1-hch@lst.de>
References: <20210326143831.1550030-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-parisc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Brian Gerst <brgerst@gmail.com>, x86@kernel.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Luis Chamberlain <mcgrof@kernel.org>, sparclinux@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Just call do_execveat instead.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/exec.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/fs/exec.c b/fs/exec.c
index 18594f11c31fe1..b63fb020909075 100644
--- a/fs/exec.c
+++ b/fs/exec.c
@@ -1978,15 +1978,6 @@ int kernel_execve(const char *kernel_filename,
 	return retval;
 }
 
-static int do_execve(struct filename *filename,
-	const char __user *const __user *__argv,
-	const char __user *const __user *__envp)
-{
-	struct user_arg_ptr argv = { .ptr.native = __argv };
-	struct user_arg_ptr envp = { .ptr.native = __envp };
-	return do_execveat_common(AT_FDCWD, filename, argv, envp, 0);
-}
-
 static int do_execveat(int fd, struct filename *filename,
 		const char __user *const __user *__argv,
 		const char __user *const __user *__envp,
@@ -2060,7 +2051,7 @@ SYSCALL_DEFINE3(execve,
 		const char __user *const __user *, argv,
 		const char __user *const __user *, envp)
 {
-	return do_execve(getname(filename), argv, envp);
+	return do_execveat(AT_FDCWD, getname(filename), argv, envp, 0);
 }
 
 SYSCALL_DEFINE5(execveat,
-- 
2.30.1

