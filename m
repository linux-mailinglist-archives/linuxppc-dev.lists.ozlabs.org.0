Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 07780160995
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Feb 2020 05:16:01 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48LVz20nXYzDqfk
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Feb 2020 15:15:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=vAKEzuwt; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48LVws3zdtzDqLB
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2020 15:14:05 +1100 (AEDT)
Received: by mail-pg1-x544.google.com with SMTP id w21so8347164pgl.9
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 Feb 2020 20:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D7J2GNzF+ibiicm/VTeLjijc9/86ZoQMcXnuf3vYA54=;
 b=vAKEzuwt3zr43mqmB3zQErn9wd01fXyMyj6oqnMgKklaky5GYqpJ/7LO2O0Z8BSqHo
 BGM+f+xAkKnVixApa30oyiXpu5/xmozuv1NiO3ufPlUYXsOX2LF9xpg7sZrO8yN46sBO
 uNbdQczUrojQ55UZcK297VL0T6mIxZweFmjMdDd2+OKPULhTLXLnJl6rMQ7F7cXWHYQp
 JXMPWqUqcHRAFHh8CX/u61IXu85DIzJCL9NMRr4WyPRo1a881rRNllOojPvikpUP25cL
 TCTFJ0k5ZYE+AA4MRJ34DBtJy3RBI1FaKLePJuq0ekeeV+UNz106VlXtIijXx8/e5hSe
 dg+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D7J2GNzF+ibiicm/VTeLjijc9/86ZoQMcXnuf3vYA54=;
 b=EyA8mo988q+iOPCW86kk9dH/1ogJLHy327FBFF7pzqiRICs4s9pQPta0AgQ0zgKAyh
 iYOdEWjjn9axQRNQKbsQNd0vtlpxcYjIedXEzhGWG1iBFLKQWI7flbl4dbTCOKriEVMW
 8B2/Hce5FwtJjWVf9MljB2Vy6r1mgfqbW+o5GPNDKaKfuqxhvy2Ev1udxm4qdyeq6o8+
 NH+20QImAO3yw1soRN1Gf7OV7T3Bn/+6K5vFsznmP9aa3ldTI1t1N5MnFk5rc3sBEwL/
 lywNcAmh3JjGyeAYavNMJcpCdU5bZozLgXjJ/2Y+thduW8PbHJfxrUVL7xBqkrdF/fTx
 40Bg==
X-Gm-Message-State: APjAAAU8yBN9S5JAu8r3aQoZGD1QY8k/Iwsy7a697UJ57qFH9PornUpL
 0P+s/FhhrZfLstDBns4b+XDclerD
X-Google-Smtp-Source: APXvYqzVcE4ETiCya2QUvo7vB8V59hbiBeBlSpa6Rp+DqHpyYk5OXom9cQxgic7xx/Kxre4FH4ur0A==
X-Received: by 2002:a63:fe4d:: with SMTP id x13mr15556170pgj.147.1581912842850; 
 Sun, 16 Feb 2020 20:14:02 -0800 (PST)
Received: from wafer.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id a17sm13972665pfo.146.2020.02.16.20.14.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Feb 2020 20:14:02 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/xmon: Fix whitespace handling in getstring()
Date: Mon, 17 Feb 2020 15:13:43 +1100
Message-Id: <20200217041343.2454-1-oohall@gmail.com>
X-Mailer: git-send-email 2.21.1
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
Cc: Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The ls (lookup symbol) and zr (reboot) commands use xmon's getstring()
helper to read a string argument from the xmon prompt. This function skips
over leading whitespace, but doesn't check if the first "non-whitespace"
character is a newline which causes some odd behaviour (<enter> indicates
a the enter key was pressed):

	0:mon> ls printk<enter>
	printk: c0000000001680c4

	0:mon> ls<enter>
	printk<enter>
	Symbol '
	printk' not found.
	0:mon>

With commit 2d9b332d99b ("powerpc/xmon: Allow passing an argument
to ppc_md.restart()") we have a similar problem with the zr command.
Previously zr took no arguments so "zr<enter> would trigger a reboot.
With that patch applied a second newline needs to be sent in order for
the reboot to occur. Fix this by checking if the leading whitespace
ended on a newline:

	0:mon> ls<enter>
	Symbol '' not found.

Fixes: 2d9b332d99b ("powerpc/xmon: Allow passing an argument to ppc_md.restart()")
Reported-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/xmon/xmon.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index e8c84d26..0ec9640 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -3435,6 +3435,11 @@ getstring(char *s, int size)
 	int c;
 
 	c = skipbl();
+	if (c == '\n') {
+		*s = 0;
+		return;
+	}
+
 	do {
 		if( size > 1 ){
 			*s++ = c;
-- 
2.9.5

