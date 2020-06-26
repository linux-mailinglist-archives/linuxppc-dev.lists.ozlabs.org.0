Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 14FD620BBB2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jun 2020 23:38:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49tqxY2XB0zDqnk
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jun 2020 07:38:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--brendanhiggins.bounces.google.com
 (client-ip=2607:f8b0:4864:20::249; helo=mail-oi1-x249.google.com;
 envelope-from=3ggt2xg4kalcyobkaxkefddfkpdlldib.zlj@flex--brendanhiggins.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=hXaHccps; dkim-atps=neutral
Received: from mail-oi1-x249.google.com (mail-oi1-x249.google.com
 [IPv6:2607:f8b0:4864:20::249])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49tqVH4TZbzDqMC
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jun 2020 07:17:59 +1000 (AEST)
Received: by mail-oi1-x249.google.com with SMTP id a17so7015830oid.19
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jun 2020 14:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=ZQcLA3WWQzWhDh7XNic/G9qqCkpVYvgILX+rlRl11MM=;
 b=hXaHccpsp6kZobMdGnxlDV/X7Kry+BeRbEJjo6PSv+TzhSxzNCAbiEQxcpvIu0jQ8L
 aIB48XrQDZ+QiNiXbv0Tr0hmWU0EQYlwTua6pAg7QhnNvNSxDK0ocJXkRunQ2sD015bM
 oWId+r5Af1n9pl4fkKr5IibcQmAmR4apAJ4uZIU8WR1sYqDviwkes3rwyCeWthb9zehf
 XV/5kHzyY6hTubQkZzHttS+P5N1PNpPDj/TZK4Qtvt0SowvIJbhPF2AgJuVdUA0ZlY6e
 4wzcP9dl+iDa2j5rL0VHxTcew55IqQf2LoFk8FR/CBkw5YHjzH7caV82jF3Q9TVQuEgb
 +SDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=ZQcLA3WWQzWhDh7XNic/G9qqCkpVYvgILX+rlRl11MM=;
 b=KzoLOr8sJFd3/LQjU8pLkjtPbVKOLJQ8ZqApR7iC/kF+Wl/aUUtdwB/Kiah4SRUK0n
 OGxDlId9qjp5+xZCcfSHnqmsdM9jTmRe1orEj1wKOiUIyUnlVSKVKA6W6MrVVyYWhHIF
 M9qUSQTIpoIMLY9aumWB9WoRdc++v/ZaAFlqXebvxko6KMHKc0kkFA2SQgIJZt7LgTL3
 627Up2lUCdYWo74jOid2Gjulet+IFjNE7PGUSg1b8oKHZWiS5hMApWUzi8//822b7XWp
 iJE7lQ1liarfDVq9J3tXpaIFGteSTvxHCxJHN7L0I9vKdF9kZHgtz0KxDM7OrmR1XmWq
 yxqg==
X-Gm-Message-State: AOAM53058xH3I+0wIkfVJpXsWfwf3wNraD3+M8CZY/cGSjbBAORWaXHS
 8Ub/seq2wvNvqG6yFHx6gR8eI2EEHMlXYRpvqKOzXQ==
X-Google-Smtp-Source: ABdhPJzEx7RjdPZqzXf9CzhVsQsR591I98jh+msGVdJdnK9Tt6s9k9B5//bn8b4L1M37+n0TvUsc2u0v5Nr7S59GV+16hQ==
X-Received: by 2002:a25:c5c3:: with SMTP id v186mr7751497ybe.233.1593205784533; 
 Fri, 26 Jun 2020 14:09:44 -0700 (PDT)
Date: Fri, 26 Jun 2020 14:09:16 -0700
In-Reply-To: <20200626210917.358969-1-brendanhiggins@google.com>
Message-Id: <20200626210917.358969-12-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20200626210917.358969-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
Subject: [PATCH v5 11/12] Documentation: Add kunit_shutdown to
 kernel-parameters.txt
From: Brendan Higgins <brendanhiggins@google.com>
To: jdike@addtoit.com, richard@nod.at, anton.ivanov@cambridgegreys.com, 
 arnd@arndb.de, keescook@chromium.org, skhan@linuxfoundation.org, 
 alan.maguire@oracle.com, yzaikin@google.com, davidgow@google.com, 
 akpm@linux-foundation.org, rppt@linux.ibm.com, frowand.list@gmail.com, 
 catalin.marinas@arm.com, will@kernel.org, monstr@monstr.eu, 
 mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org, 
 chris@zankel.net, jcmvbkbc@gmail.com
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-arch@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 linux-doc@vger.kernel.org, sboyd@kernel.org, gregkh@linuxfoundation.org,
 linuxppc-dev@lists.ozlabs.org, linux-um@lists.infradead.org,
 linux-kernel@vger.kernel.org, Brendan Higgins <brendanhiggins@google.com>,
 mcgrof@kernel.org, linux-kselftest@vger.kernel.org, logang@deltatee.com,
 linux-arm-kernel@lists.infradead.org, kunit-dev@googlegroups.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add kunit_shutdown, an option to specify that the kernel shutsdown after
running KUnit tests, to the kernel-parameters.txt documentation.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
Reviewed-by: Stephen Boyd <sboyd@kernel.org>
---
 Documentation/admin-guide/kernel-parameters.txt | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index fb95fad81c79a..e7d5eb7249e7f 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -2183,6 +2183,14 @@
 			0: force disabled
 			1: force enabled
 
+	kunit_shutdown=[KERNEL UNIT TESTING FRAMEWORK] Shutdown kernel after
+			running built-in tests. Tests configured as modules will
+			not be run.
+			Default:	(flag not present) don't shutdown
+			poweroff:	poweroff the kernel after running tests
+			halt:		halt the kernel after running tests
+			reboot:		reboot the kernel after running tests
+
 	kvm.ignore_msrs=[KVM] Ignore guest accesses to unhandled MSRs.
 			Default is 0 (don't ignore, but inject #GP)
 
-- 
2.27.0.212.ge8ba1cc988-goog

