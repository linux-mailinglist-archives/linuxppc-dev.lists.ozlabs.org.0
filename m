Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 537BF2E8869
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Jan 2021 21:14:36 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D7Y5M4wfVzDqtr
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Jan 2021 07:14:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32d;
 helo=mail-wm1-x32d.google.com; envelope-from=arielmarcovitch@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=OqTDsRn4; dkim-atps=neutral
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D7Y331xdtzDqss
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  3 Jan 2021 07:12:29 +1100 (AEDT)
Received: by mail-wm1-x32d.google.com with SMTP id v14so13582637wml.1
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 02 Jan 2021 12:12:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=QUB4+4d1LDuvfodpASBj+IEX3GafEWaRMquf7qx7cRs=;
 b=OqTDsRn4oML0wLkk1QCLGIRyCp4OOlaZzpkr28FjjsuARS1LNhgAufItGJP/3AfynU
 5KQJoIsIMXNYsk3FgMHtSz8odKgz0wxAcbd1naGdDS7p3A+9uBxeMbf2kqxKX9pH7PEf
 NarlxHv6F9gE8bpCWidZJ/Ffwxjc2FYc28xMSMKVQD/lasEwWC0tb/SMKJh9sAZUO372
 RCu8uocVyeaEM7jR+3oL7E8v7uPYgsrkHstpy9aH+RC9q8tofULPk0QnDRnk+HH+kZjd
 UwDF/LWmi69M+j3eY1VSWRCDxi7Ms4xInlEKeAoB0KeTcidyqC7smvNpxsC7nWE6AALI
 Cx6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=QUB4+4d1LDuvfodpASBj+IEX3GafEWaRMquf7qx7cRs=;
 b=guqm5JwpkINyG1M51cTZWtBzySPTW6zsHHeKOjOEK7KTqni9IjS6GtnjmVJP9PZMeQ
 qTRZM2XSxLcTS8vuv5SPz+nbtPUXuMNMqTRu8KCX+93t/CZsPu03Ac70xrw9zj/FHIcu
 wwdRQPBEJgu3/jC+yiGIConv6DnyuFb+FHDX3ZUcouOM9UiyLdTdyWWJQrMVYZIEPnKf
 K6QVL+vIJEeXH2q7a5i/d0nvhabd37EQttYL3a1xn81lfBnT2dxAVQcoGjkJnumEVtMg
 jdNLV5FvObdiNljPWoAKTspqvNgHoquo6aVL9PKBcw7f8Zwj2TlNryeMVlU3pAX0zpFp
 sJVA==
X-Gm-Message-State: AOAM531gc38vlmyR5yS9GZS/IEeSm5Lndy2myIM+hnPbTqIDWn14h5Bi
 cIv9wWRK1z4iRynUU/0y8P4=
X-Google-Smtp-Source: ABdhPJwgK6UuqAY6qoQQUSAP+SFTqQPtExweuUv2K2cP05/4Km2aJ9YB2hQvBPPO0xTrg8NgKXSIKQ==
X-Received: by 2002:a7b:c4c7:: with SMTP id g7mr20838226wmk.29.1609618344134; 
 Sat, 02 Jan 2021 12:12:24 -0800 (PST)
Received: from localhost.localdomain (bzq-109-64-2-78.red.bezeqint.net.
 [109.64.2.78])
 by smtp.gmail.com with ESMTPSA id x18sm95692603wrg.55.2021.01.02.12.12.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Jan 2021 12:12:23 -0800 (PST)
From: Ariel Marcovitch <arielmarcovitch@gmail.com>
X-Google-Original-From: Ariel Marcovitch <ariel.marcovitch@gmail.com>
To: mpe@ellerman.id.au
Subject: [PATCH v2] powerpc: fix alignment bug whithin the init sections
Date: Sat,  2 Jan 2021 22:11:56 +0200
Message-Id: <20210102201156.10805-1-ariel.marcovitch@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: keescook@chromium.org, maskray@google.com, linux-kernel@vger.kernel.org,
 npiggin@gmail.com, oss@buserror.net, paulus@samba.org,
 ariel.marcovitch@gmail.com, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a bug that causes early crashes in builds with a
.exit.text section smaller than a page and a .init.text section that
ends in the beginning of a physical page (this is kinda random, which
might explain why this wasn't really encountered before).

The init sections are ordered like this:
	.init.text
	.exit.text
	.init.data

Currently, these sections aren't page aligned.

Because the init code might become read-only at runtime and because the
.init.text section can potentially reside on the same physical page as
.init.data, the beginning of .init.data might be mapped read-only along
with .init.text.

Then when the kernel tries to modify a variable in .init.data (like
kthreadd_done, used in kernel_init()) the kernel panics.

To avoid this, make _einittext page aligned and also align .exit.text
to make sure .init.data is always seperated from the text segments.

Fixes: 060ef9d89d18 ("powerpc32: PAGE_EXEC required for inittext")
Signed-off-by: Ariel Marcovitch <ariel.marcovitch@gmail.com>
---
 arch/powerpc/kernel/vmlinux.lds.S | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
index 6db90cdf11da..b6c765d8e7ee 100644
--- a/arch/powerpc/kernel/vmlinux.lds.S
+++ b/arch/powerpc/kernel/vmlinux.lds.S
@@ -187,6 +187,11 @@ SECTIONS
 	.init.text : AT(ADDR(.init.text) - LOAD_OFFSET) {
 		_sinittext = .;
 		INIT_TEXT
+
+		/* .init.text might be RO so we must
+		* ensure this section ends in a page boundary.
+		*/
+		. = ALIGN(PAGE_SIZE);
 		_einittext = .;
 #ifdef CONFIG_PPC64
 		*(.tramp.ftrace.init);
@@ -200,6 +205,8 @@ SECTIONS
 		EXIT_TEXT
 	}
 
+	. = ALIGN(PAGE_SIZE);
+
 	.init.data : AT(ADDR(.init.data) - LOAD_OFFSET) {
 		INIT_DATA
 	}

base-commit: 2c85ebc57b3e1817b6ce1a6b703928e113a90442
-- 
2.17.1

