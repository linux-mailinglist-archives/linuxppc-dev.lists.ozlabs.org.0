Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 739761F344
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 14:12:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 453tjM6sfszDqV8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 22:12:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::442; helo=mail-wr1-x442.google.com;
 envelope-from=mathieu.malaterre@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="rUlu/Uzq"; 
 dkim-atps=neutral
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 453tfQ3GxHzDqSL
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2019 22:10:05 +1000 (AEST)
Received: by mail-wr1-x442.google.com with SMTP id r4so2385764wro.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2019 05:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=04vE/yZS+t9ASvM0Tt3OFkOsi4P5+QK49E2+acvjvQQ=;
 b=rUlu/UzqF/esvoHFPYwpMh1FUQbOvqo/ap9EWcHUkZXAodrJoa4A/WsClM0UxEhqPd
 89uXP2igvjKzeI4J1Hkd3WYqDFy7q33uPxc2HUONPi+7AqmIu+A4ZEBys8tyXcAiAc2U
 fgoDY1VGYNRUFKDU7TJNTJnC8UK9AifnCu8v+6RzQhrID9QsM+xFxw79b3qv01iR+u4j
 ojzpdLQ8ZQf96P2uTac/x15aah6vPsvTGMzU0T/Lzktpgz6WLN0byC4GIaoettlYuPCo
 9E3yRcMBK3+M83PdDgC1RDjydxwsPWcaYqYT04iCsYv6JIcZhmFFAMW6BKad48eiXbD7
 nqEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=04vE/yZS+t9ASvM0Tt3OFkOsi4P5+QK49E2+acvjvQQ=;
 b=D35J9pnjdVFNQWKOBUlhyvEYz9uGJS0J8L+HHfQuebUmrR7XMdXXkcJwTGtGVDOmjJ
 Xhz/e3+bqEwIs9uxVT0gj4f9HgymKolvPyqzKKSUKus9UHz9dQM8vya/22oQl5aE0jHX
 tVyluU46czl/RibxUMOuqkuLP6GdV/BMMnQfPRNUMHEQmJbk1ew4AML92TtBv4sW0+Nl
 QFgVpw1bGb3ysnz5td5hL3vkFshvM/VnoHkpxYTDDhaMPzAw/xt2E4lyZtEPk8esilKQ
 8egtZoOd1QH6+IHfCcASvDHbyT+uZomzGQ0lPRpE57PRF92wddQLSDrfYd20PIAr3dYh
 Ta+g==
X-Gm-Message-State: APjAAAXASXjp4/7gYKvaiULTpgtpiloePmSIKep2IBpHg0pdZUxCMXe7
 sQqeoV8Ydmm2CVUK+krLJF4=
X-Google-Smtp-Source: APXvYqwqRM2hZ1TYTAPN1pkRiFuk5jR7rSwKxqfJthKIZ+ilEP+0VrWCBasqLIcAE6IScwdALAL4Ug==
X-Received: by 2002:a5d:4b0b:: with SMTP id v11mr24672581wrq.317.1557922201948; 
 Wed, 15 May 2019 05:10:01 -0700 (PDT)
Received: from macbookpro.malat.net (bru31-1-78-225-224-134.fbx.proxad.net.
 [78.225.224.134])
 by smtp.gmail.com with ESMTPSA id b18sm2126219wrx.75.2019.05.15.05.10.01
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 15 May 2019 05:10:01 -0700 (PDT)
Received: by macbookpro.malat.net (Postfix, from userid 1000)
 id 15A9A1146D7B; Wed, 15 May 2019 14:09:50 +0200 (CEST)
From: Mathieu Malaterre <malat@debian.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc: silence a -Wcast-function-type warning in
 dawr_write_file_bool
Date: Wed, 15 May 2019 14:09:42 +0200
Message-Id: <20190515120942.3812-1-malat@debian.org>
X-Mailer: git-send-email 2.20.1
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
Cc: Michael Neuling <mikey@neuling.org>, Mathieu Malaterre <malat@debian.org>,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In commit c1fe190c0672 ("powerpc: Add force enable of DAWR on P9
option") the following piece of code was added:

   smp_call_function((smp_call_func_t)set_dawr, &null_brk, 0);

Since GCC 8 this trigger the following warning about incompatible
function types:

  arch/powerpc/kernel/hw_breakpoint.c:408:21: error: cast between incompatible function types from 'int (*)(struct arch_hw_breakpoint *)' to 'void (*)(void *)' [-Werror=cast-function-type]

Cast the function to an intermediate (void*) to make the compiler loose
knowledge about actual type.

Fixes: c1fe190c0672 ("powerpc: Add force enable of DAWR on P9 option")
Cc: Michael Neuling <mikey@neuling.org>
Signed-off-by: Mathieu Malaterre <malat@debian.org>
---
 arch/powerpc/kernel/hw_breakpoint.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/hw_breakpoint.c b/arch/powerpc/kernel/hw_breakpoint.c
index f70fb89dbf60..baeb4c58de3b 100644
--- a/arch/powerpc/kernel/hw_breakpoint.c
+++ b/arch/powerpc/kernel/hw_breakpoint.c
@@ -405,7 +405,8 @@ static ssize_t dawr_write_file_bool(struct file *file,
 
 	/* If we are clearing, make sure all CPUs have the DAWR cleared */
 	if (!dawr_force_enable)
-		smp_call_function((smp_call_func_t)set_dawr, &null_brk, 0);
+		smp_call_function((smp_call_func_t)(void *)set_dawr,
+				  &null_brk, 0);
 
 	return rc;
 }
-- 
2.20.1

