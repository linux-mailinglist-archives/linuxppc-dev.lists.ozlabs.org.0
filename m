Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5A41098AD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2019 06:30:00 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47MXXh65cqzDqfk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2019 16:29:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="eK6DH8VD"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47MXNC5VrKzDqBW
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Nov 2019 16:22:35 +1100 (AEDT)
Received: by mail-pl1-x642.google.com with SMTP id h13so7593301plr.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Nov 2019 21:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pWFeTtMcTFI1OdUK3rY1EEJE+O1rMdkrJwCtqB+8Whg=;
 b=eK6DH8VDdKXtt8w+wPS7NGMb8IWVVgQ/wWjHhxmKLP3BEaAFiKVhAFaKrF28AQvvxF
 vTqb0gsFcRq/NxUksJ39QetDuZfZRyKbwSGcq9/WQeq+82YfJaUX8Hb7HiW2AlDfRu/G
 1S5nCunuasvhmDWUSTR1j8RXRBCe3JGpipyEhNUVasV6K8Pwf68UJSfQyN+N3X0P5rYT
 ddYFMif/5ZL2brvhHQazG7YrpN69m+3uOLCxLQRUNmr4fw+rBx+bph0jPWspQUC97FY9
 RU5Qh/NjdGe0LiQpI4UYOxk5q17exLPZQewFk8fxPZrfQR1lxFAEEzBIgjS6DLs2FwbJ
 KxuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pWFeTtMcTFI1OdUK3rY1EEJE+O1rMdkrJwCtqB+8Whg=;
 b=J/Tv2iiwmFzKi1p7DKW43KYfgU+MN48/j3VFjPKiLwBXQZhxbk6Wl50eSy8yVmhQrv
 8aFeK3wuoX+BocCuRVVm6JUD9HKX52OqclXFuSAYfGEyWMQgu+Jkane1TGGZ4fytfoDh
 45wtKLH+7iMoucRdNTKnewuXNALSwJX7MeELw83mb/425ewkKPlNYRdXBjpO7aoemUtQ
 uF69R6qcv86H28KSysqAe3aM1kDdGwYFlK0hgyhBL7Fw9amwxyLuXkdNhF4u4XHZLl1j
 hGphatO50alhoJ2V7Nk5mJpXVd46CAvfKhEC80b/KtMDkG6vjJJwpqfEW5FGJh+kh/SN
 EG2Q==
X-Gm-Message-State: APjAAAVbN0DZ3NnsoNVswmmDk88edA8Rs2JW4m93M3T8Oh7UEZJ/mjQr
 ygsFs+lezEIlAkM9Jsa88nJy46/i
X-Google-Smtp-Source: APXvYqxLflubTy9LUpq2SxqpK5ldPJPCnVNUlAEnqNopeU7Q82W32oslVZxB9cUjb8IGLoz39gjB3A==
X-Received: by 2002:a17:902:44d:: with SMTP id
 71mr33002154ple.320.1574745753125; 
 Mon, 25 Nov 2019 21:22:33 -0800 (PST)
Received: from sol.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id t27sm10657920pfq.169.2019.11.25.21.22.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Nov 2019 21:22:32 -0800 (PST)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 03/18] powerpc: Add PREFIXED SRR1 bit for future ISA version
Date: Tue, 26 Nov 2019 16:21:26 +1100
Message-Id: <20191126052141.28009-4-jniethe5@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191126052141.28009-1-jniethe5@gmail.com>
References: <20191126052141.28009-1-jniethe5@gmail.com>
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
Cc: alistair@popple.id.au, Jordan Niethe <jniethe5@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add the bit definition for exceptions caused by prefixed instructions.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
 arch/powerpc/include/asm/reg.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
index 6f9fcc3d4c82..0a6d39fb4769 100644
--- a/arch/powerpc/include/asm/reg.h
+++ b/arch/powerpc/include/asm/reg.h
@@ -778,6 +778,7 @@
 
 #define   SRR1_MCE_MCP		0x00080000 /* Machine check signal caused interrupt */
 #define   SRR1_BOUNDARY		0x10000000 /* Prefixed instruction crosses 64-byte boundary */
+#define   SRR1_PREFIXED		0x20000000 /* Exception caused by prefixed instruction */
 
 #define SPRN_HSRR0	0x13A	/* Save/Restore Register 0 */
 #define SPRN_HSRR1	0x13B	/* Save/Restore Register 1 */
-- 
2.20.1

