Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7E41BB045
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Apr 2020 23:19:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 499yMH2mbYzDqVK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 07:19:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=hjl.tools@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=gbEiC9A+; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 499yJP6wtYzDqXg
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Apr 2020 07:16:34 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id o185so9265442pgo.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Apr 2020 14:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VjlmInaD+CunQni2gwfodUVCdw5wBkcVV++SAKGDNm8=;
 b=gbEiC9A+JIMCqUDTp3fQ8kV6QvUKLQsC82g692TcX9BzZJRf4B+XUpO8XJTH0bkhBr
 eDNs9WMm5ffWqg3KYfV6RaRhPeLAL9yZk7Vk74e907Vn/PE7L1t4O/DITeTY5a3fLaH+
 /fN6gDpQ1EGktQcR/GVqOC4QrXfC8s03Oyl7m87a9hlhEw0uikH19BoqFPRSuXA7aqCj
 GKJnnpX+TQ/RcEwpVfB4g3QxAdyY4sbD2btDFu6A40AZUriEbUke83mxGrD7Bmye7ScK
 RbVYzeRlOZmxMJEL+MSZa2+/+Er55hu2o0LZMtNxAsBHnT3o5AAi0Ny72aKR6tnTtOWg
 3lvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VjlmInaD+CunQni2gwfodUVCdw5wBkcVV++SAKGDNm8=;
 b=okwB3PhdXrUe69SU3xfyKkyr3A+VBao6my/CdB7fCbedaHW0LKIkExpaZ6X5Xh9l+3
 827+m/SoAF56Gxkx0BfQt+t6hoiq9kf03N1aCFHJXlJGhn+SAONuktelolBXyRVb9kjg
 gVsmyAvJxN3vubjMdhGiL2hQFG1VX8fqe8kUdAnb3N7ZdpjEQnSYrBVuYrKxV9xnHEkU
 saLRa9LOQy7cQSx++cZNNWihZmKT35DQkfDZe4Dq00VIE/iZw/l0JzEpJT+KwVPpU+vW
 fTyrSrt3jPB723YJ6YinHPfa8GG3XmTYfJA+BkUSjIYVHmCL8/jgVF3oNKV//v9AEj3X
 VMOw==
X-Gm-Message-State: AGi0PuY01hUHLWup5N0DZu4IA3WfHp1SbgsIk8cpAvegnn8+2u+zsm8v
 05L5Zg4VKvUgn4baw7SkGNs=
X-Google-Smtp-Source: APiQypIbLlcCEwoQTDklkjMMFsmBQihap2gJlKmUb1pvK2Lid6vvJ2UbKZCrUYtpb7acXXN61KEUOg==
X-Received: by 2002:aa7:8ad6:: with SMTP id b22mr451831pfd.251.1588022191150; 
 Mon, 27 Apr 2020 14:16:31 -0700 (PDT)
Received: from gnu-cfl-2.localdomain (c-69-181-90-243.hsd1.ca.comcast.net.
 [69.181.90.243])
 by smtp.gmail.com with ESMTPSA id w12sm13000910pfq.133.2020.04.27.14.16.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 14:16:30 -0700 (PDT)
Received: from gnu-cfl-2.localdomain (localhost [IPv6:::1])
 by gnu-cfl-2.localdomain (Postfix) with ESMTP id 9C7CCC0117;
 Mon, 27 Apr 2020 14:16:28 -0700 (PDT)
From: "H.J. Lu" <hjl.tools@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc: Discard .rela* sections if CONFIG_RELOCATABLE is
 undefined
Date: Mon, 27 Apr 2020 14:16:28 -0700
Message-Id: <20200427211628.4244-1-hjl.tools@gmail.com>
X-Mailer: git-send-email 2.25.4
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
Cc: Kees Cook <keescook@chromium.org>, Paul Mackerras <paulus@samba.org>,
 "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Borislav Petkov <bp@suse.de>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

arch/powerpc/kernel/vmlinux.lds.S has

        DISCARDS
        /DISCARD/ : {
                *(*.EMB.apuinfo)
                *(.glink .iplt .plt .rela* .comment)
                *(.gnu.version*)
                *(.gnu.attributes)
                *(.eh_frame)
        }

Since .rela* sections are needed when CONFIG_RELOCATABLE is defined,
change to discard .rela* sections if CONFIG_RELOCATABLE is undefined.

Signed-off-by: H.J. Lu <hjl.tools@gmail.com>
Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
---
 arch/powerpc/kernel/vmlinux.lds.S | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
index 31a0f201fb6f..4ba07734a210 100644
--- a/arch/powerpc/kernel/vmlinux.lds.S
+++ b/arch/powerpc/kernel/vmlinux.lds.S
@@ -366,9 +366,12 @@ SECTIONS
 	DISCARDS
 	/DISCARD/ : {
 		*(*.EMB.apuinfo)
-		*(.glink .iplt .plt .rela* .comment)
+		*(.glink .iplt .plt .comment)
 		*(.gnu.version*)
 		*(.gnu.attributes)
 		*(.eh_frame)
+#ifndef CONFIG_RELOCATABLE
+		*(.rela*)
+#endif
 	}
 }
-- 
2.25.4

