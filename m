Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 240301C6674
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 05:51:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49H2hd3yb9zDqsH
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 13:51:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=SmOVYIFt; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49H2Vr2dqqzDqbY
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 May 2020 13:43:16 +1000 (AEST)
Received: by mail-pj1-x1042.google.com with SMTP id t40so207428pjb.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 May 2020 20:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=pkI/PDaIpkxg4HF+F//zpF56My+Q3JHpq7zVE59E1aA=;
 b=SmOVYIFtdZmN1MnQT+le6Gc8si4Qd6Kif9xWZ+ztf+tLwExFd/pr7tfS1qUBSfhKKn
 hFt9WdC8zxNpfMhP0LYENu5bQYwD9c8Bcz7RnmlZdWM3GQN0OsUDtt9zZ8IQcdqVQrQH
 B3a08Ld7OEPgY6ocj7LRT2W1n+LulalFp1afverE6FfXi1MSfcv5ZKAVBYz4Ni3JBITv
 ZOFwQfc1C7SXsnKpr6d2NYZ14DkQzT6VeNG8UaQk+9wfBhCkCzRSTWa5xhl9UcRLQzlU
 eHPUe3jQA56HWHU+ARA3OLZO9nPatgthSzpUyIl/kYcKR53n6rtT/apyCiQThVE2vOqE
 ++RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=pkI/PDaIpkxg4HF+F//zpF56My+Q3JHpq7zVE59E1aA=;
 b=jNYbF8CN2ukHsNej6s2jmdjzvj6/qQzyrjlSojDC37PKGeSD42tBsdPA9e9qgIoxvH
 vHfc9kfIu4AC+LMPWWmPQ/Ar4sPOcLuMBfZdICFAOBvYtPIeXVB6L0QhZR+I9j+BUMSS
 ON1JLGGQDkmzV+WQzoTNMkX8ZtQQU+UDow8bHeoSWx7pcTfnMWx38jwEu6O6tKr/jPPW
 oxX8sdNSlUcwwRojEoT4KFNwMcsdN+U/KQhuVOYovdwv2lRoyOevB5XX3akegB8VoxPV
 mcex7IqVz/BUQ3VHPAHLZD/rahWOgjDgEgtZB2H95pm/ueqjjoiqdJpNa0vUJtDXwPP0
 Waug==
X-Gm-Message-State: AGi0PuaH9GnK3JRXqj0OQLdsXje/ztcoeblDnrm8rRSxgGcoswoz/uPP
 zvLhPeOSzZolCLsiVFgHFtt1JNwgutCPhA==
X-Google-Smtp-Source: APiQypKLOUYcXmMMYjxk1/zqjfY7bHGxdiMU59hTsC2sWTKoZ+j2oNnLkYL6io6lI7D77RxdzDTLZw==
X-Received: by 2002:a17:90a:384b:: with SMTP id
 l11mr6411723pjf.89.1588736593915; 
 Tue, 05 May 2020 20:43:13 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id k4sm465676pgg.88.2020.05.05.20.42.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2020 20:43:13 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v8 04/30] powerpc/xmon: Use bitwise calculations
 in_breakpoint_table()
Date: Wed,  6 May 2020 13:40:24 +1000
Message-Id: <20200506034050.24806-5-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200506034050.24806-1-jniethe5@gmail.com>
References: <20200506034050.24806-1-jniethe5@gmail.com>
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
Cc: alistair@popple.id.au, npiggin@gmail.com, bala24@linux.ibm.com,
 naveen.n.rao@linux.vnet.ibm.com, Jordan Niethe <jniethe5@gmail.com>,
 dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

A modulo operation is used for calculating the current offset from a
breakpoint within the breakpoint table. As instruction lengths are
always a power of 2, this can be replaced with a bitwise 'and'. The
current check for word alignment can be replaced with checking that the
lower 2 bits are not set.

Suggested-by: Christophe Leroy <christophe.leroy@c-s.fr>
Reviewed-by: Alistair Popple <alistair@popple.id.au>
Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v6: New to series
---
 arch/powerpc/xmon/xmon.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index 4ecb7e73b017..c52b117640f2 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -857,8 +857,8 @@ static struct bpt *in_breakpoint_table(unsigned long nip, unsigned long *offp)
 	off = nip - (unsigned long)bpt_table;
 	if (off >= sizeof(bpt_table))
 		return NULL;
-	*offp = off % BPT_SIZE;
-	if (*offp != 0 && *offp != 4)
+	*offp = off & (BPT_SIZE - 1);
+	if (off & 3)
 		return NULL;
 	return bpts + (off / BPT_SIZE);
 }
-- 
2.17.1

