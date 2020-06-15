Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7271F9945
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jun 2020 15:47:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49lt1r14ZNzDqVl
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jun 2020 23:47:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+982856cf37d7c265414a+6140+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20170209 header.b=IH5rGn9P; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49lrzq68rFzDqBP
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jun 2020 23:00:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=SM2vwUzS1lS5JPIE11hnWuY4020BCObQGWMmPP5iv+U=; b=IH5rGn9PdguQ/MJmSQeWa39CS5
 xYhYsW2KOhQ7JARWxoLOcrAASLH7Mg9nT9bOWMT2QsLkXgR1PiM53SOGyGhcJ/pOT2uQ2oAoMYCea
 FMpsAX3009azgrIIbJwwa4ZNiutR+PuL4iA9/LrosE5OcMBEFLoo9a/4A5MCyCVQaW8T31HswmFa0
 E+juO8zuJ7Y80JJqixESrR+bfEJ20AqTuLGcZIjJ8Ej5wzqh4V67dC0vKsf1bGZNzGSX+tMr9bm2o
 d3vFWAelmSJD0mv1AatU2ckIMAIiODHoH1OoVQriwq0EsCjoMCtY8lbWHO55db++0T6OOrImMQcPW
 J59ZlUjA==;
Received: from 195-192-102-148.dyn.cablelink.at ([195.192.102.148]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jkojC-0007sl-3K; Mon, 15 Jun 2020 13:00:42 +0000
From: Christoph Hellwig <hch@lst.de>
To: Al Viro <viro@zeniv.linux.org.uk>
Subject: [PATCH 3/6] exec: cleanup the count() function
Date: Mon, 15 Jun 2020 15:00:29 +0200
Message-Id: <20200615130032.931285-4-hch@lst.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200615130032.931285-1-hch@lst.de>
References: <20200615130032.931285-1-hch@lst.de>
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
 Arnd Bergmann <arnd@arndb.de>, linux-parisc@vger.kernel.org, x86@kernel.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>,
 sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Remove the max argument as it is hard wired to MAX_ARG_STRINGS, and
give the function a slightly less generic name.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/exec.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/exec.c b/fs/exec.c
index 94107eceda8a67..6e4d9d1ffa35fa 100644
--- a/fs/exec.c
+++ b/fs/exec.c
@@ -411,9 +411,9 @@ get_user_arg_ptr(const char __user *const __user *argv, int nr)
 }
 
 /*
- * count() counts the number of strings in array ARGV.
+ * count_strings() counts the number of strings in array ARGV.
  */
-static int count(const char __user *const __user *argv, int max)
+static int count_strings(const char __user *const __user *argv)
 {
 	int i = 0;
 
@@ -427,7 +427,7 @@ static int count(const char __user *const __user *argv, int max)
 			if (IS_ERR(p))
 				return -EFAULT;
 
-			if (i >= max)
+			if (i >= MAX_ARG_STRINGS)
 				return -E2BIG;
 			++i;
 
@@ -445,11 +445,11 @@ static int prepare_arg_pages(struct linux_binprm *bprm,
 {
 	unsigned long limit, ptr_size;
 
-	bprm->argc = count(argv, MAX_ARG_STRINGS);
+	bprm->argc = count_strings(argv);
 	if (bprm->argc < 0)
 		return bprm->argc;
 
-	bprm->envc = count(envp, MAX_ARG_STRINGS);
+	bprm->envc = count_strings(envp);
 	if (bprm->envc < 0)
 		return bprm->envc;
 
-- 
2.26.2

