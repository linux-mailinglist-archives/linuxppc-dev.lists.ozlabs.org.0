Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9924A108E44
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Nov 2019 13:53:40 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47M6R45FtdzDqNj
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Nov 2019 23:53:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="ONC6lkQj"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47M6M42836zDqbv
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Nov 2019 23:50:06 +1100 (AEDT)
Received: by mail-pl1-x643.google.com with SMTP id j12so6468021plt.9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Nov 2019 04:50:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=4Dyj3TFAf2a0awBxIC0/58dYWGnIo6wfhRywN+QDFMQ=;
 b=ONC6lkQj3zxvkiT8BAl0ZtYPE2RQWpupKsSqjfd0JT/qhrTqFTrCvq3oko/FbJYxRg
 KHy20N2dQM5C8Pm1VfafoBnw0NqjuX7y6rbporwQnSWUHrA0UE31Md3/CpAzhsyHT6km
 qkcqXt0L5/7o7kfyM84gWC5LPmIjVBtl1xM4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=4Dyj3TFAf2a0awBxIC0/58dYWGnIo6wfhRywN+QDFMQ=;
 b=He7FTLQe38NGXHsXh1Nj/Ep7QivZczp+1iaimObf+3ISJUXnRo0amGUMD3n8N6gMEz
 YSt4w0a/NKfS3yHUHtFYtRtltYmlmJCKG1bLc7DDQVVNbpFXmICE+ha+LXLAmwXHjojx
 hQ2/cPueePXgme6MvdSqAHOSlCl4qukvwY0BIAYe0deoUcoIXo3kilYxSuksMPPXC69i
 DwKpwa3GAqOnLdRjTDj96pxgCnef41oGsLL/rzKd7r54uQA4XDyndXIxr0/NUNQxM3ms
 87btvPBnoyQQfRpDly6LGUrKJ3qSnW1nxUFDkwpIEA91bJYYCn3Hv7IsFGUdBgz5GYOC
 r36g==
X-Gm-Message-State: APjAAAXrjjiBR+5RwsT1YlBo21ZV7A9aLAiFtiMj7OEJcEM3tiUPkHwg
 m7JYWZuWLUZmPMxQ5pEd4uBSnQ==
X-Google-Smtp-Source: APXvYqx+hG30RzYfSJHZPM5tJ9YTXat/yYcK7hJJWoGFjjL2MnTwx3SjA/GCJdbj/Z0fnE/MlFImcw==
X-Received: by 2002:a17:90a:c385:: with SMTP id
 h5mr39051342pjt.95.1574686203240; 
 Mon, 25 Nov 2019 04:50:03 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-f00e-a399-4df8-3035.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:f00e:a399:4df8:3035])
 by smtp.gmail.com with ESMTPSA id q41sm8433576pja.20.2019.11.25.04.50.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Nov 2019 04:50:02 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: Michael Ellerman <michael@ellerman.id.au>,
 Michael Ellerman <mpe@ellerman.id.au>, Bart Van Assche <bvanassche@acm.org>,
 Qian Cai <cai@lca.pw>
Subject: Re: lockdep warning while booting POWER9 PowerNV
In-Reply-To: <EA225D34-2394-4C77-B989-38C275818590@ellerman.id.au>
References: <1567199630.5576.39.camel@lca.pw>
 <9b8b287a-4ae1-ca9b-cff1-6d93672b6893@acm.org>
 <87ef0vpfbc.fsf@mpe.ellerman.id.au> <87v9r8g3oe.fsf@dja-thinkpad.axtens.net>
 <EA225D34-2394-4C77-B989-38C275818590@ellerman.id.au>
Date: Mon, 25 Nov 2019 23:49:57 +1100
Message-ID: <87lfs4f7d6.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Peter Zijlstra <peterz@infradead.org>, linuxppc-dev@lists.ozlabs.org,
 Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

powerpc: define arch_is_kernel_initmem_freed() for lockdep

Under certain circumstances, we hit a warning in lockdep_register_key:

        if (WARN_ON_ONCE(static_obj(key)))
                return;

This occurs when the key falls into initmem that has since been freed
and can now be reused. This has been observed on boot, and under memory
pressure.

Define arch_is_kernel_initmem_freed(), which allows lockdep to correctly
identify this memory as dynamic.

This fixes a bug picked up by the powerpc64 syzkaller instance where we
hit the WARN via alloc_netdev_mqs.

Link: https://github.com/linuxppc/issues/issues/284
Link: https://lore.kernel.org/linuxppc-dev/87ef0vpfbc.fsf@mpe.ellerman.id.au/
Reported-by: Qian Cai <cai@lca.pw>
Reported-by: ppc syzbot c/o Andrew Donnellan <ajd@linux.ibm.com>
Commit-message-by: Daniel Axtens <dja@axtens.net>
<mpe signoff here>

---

The ppc64 syzkaller link is probably not stable enough to go into
the git history forever, but fwiw:
https://syzkaller-ppc64.appspot.com/bug?id=cfdf75cd985012d0124cd41e6fa095d33e7d0f6b

---
 arch/powerpc/include/asm/sections.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/powerpc/include/asm/sections.h b/arch/powerpc/include/asm/sections.h
index 5a9b6eb651b6..d19871763ed4 100644
--- a/arch/powerpc/include/asm/sections.h
+++ b/arch/powerpc/include/asm/sections.h
@@ -5,8 +5,22 @@
 
 #include <linux/elf.h>
 #include <linux/uaccess.h>
+
+#define arch_is_kernel_initmem_freed arch_is_kernel_initmem_freed
+
 #include <asm-generic/sections.h>
 
+extern bool init_mem_is_free;
+
+static inline int arch_is_kernel_initmem_freed(unsigned long addr)
+{
+	if (!init_mem_is_free)
+		return 0;
+
+	return addr >= (unsigned long)__init_begin &&
+		addr < (unsigned long)__init_end;
+}
+
 extern char __head_end[];
 
 #ifdef __powerpc64__

