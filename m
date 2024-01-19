Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AEAB28328E7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jan 2024 12:36:45 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=A/DtQdWd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TGcyg4cX6z3cTw
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jan 2024 22:36:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=A/DtQdWd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ventanamicro.com (client-ip=2607:f8b0:4864:20::136; helo=mail-il1-x136.google.com; envelope-from=apatel@ventanamicro.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com [IPv6:2607:f8b0:4864:20::136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TGcwt69f8z2xTP
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jan 2024 22:35:10 +1100 (AEDT)
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-3608e206f27so3476655ab.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jan 2024 03:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1705664107; x=1706268907; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k38gzzXnRwc1LG01yYkdNKX2/4JudjETsypjyCoA1oc=;
        b=A/DtQdWdnAL2U4zhwHmeclrh8M89wF3jUGVL7/OGmE4+bV/ZC3Hu4ODdks8Xs3FHyZ
         XhEgjbhsy2AHysekoW0zSzEEZhQuIiJzm/lvh02+Bs5zITyPSDQaflfzNRwAhdEd/SVO
         vuGCaXDeG5hZgoNnGjMzy17IfaZ/tq/xa16ABPOAmlKuymFMB4Kj/LLlrcxYPdR7MWV4
         BQkMuxvPhZ8cO2JKZZl9TJBA1+XiPj8MKFXf3LtyWA4N3CEXHt6mbrU1cUz9pvq6N3Rb
         aJXSubPYO5bRyU0TtZQNJiIoCxTKcZeFZTLd6bhU6TuTtOhSV3RFDJ6qtzjo0L+nfJFE
         nEZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705664107; x=1706268907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k38gzzXnRwc1LG01yYkdNKX2/4JudjETsypjyCoA1oc=;
        b=omVBanStGGZMbwazi672uFgmv79JTc4B6rs5PyR/TZWI3wX+pzyHfbTr10nSLWXVbe
         GEH3v+lk7pxvWkuvpsD81MZ0cVeIh1DkjkIvvWkIVCzqrdBxPUvCInoAIWnwMwjnjkVW
         GmiAqooYSkJoRg7+k1FhMUdtrkY/fcidThCa59K/isgfTYzsexJqhUUe6Os1pjakLh8w
         jipxlB3RWV0XeMKOoMS+SR1Iwclcw17tsDIigpcmflDHADCnWMA3zsy+t54nfCPwsXk1
         CSmrdYxDGbUHwaEECAICoUmOgkU3hy1LLQMBQmj9NZVcGWC7tQwHfh0qFzETjgovDkrW
         Z/Nw==
X-Gm-Message-State: AOJu0YzIUhGq6YD4JDQPHZxFzGI8nQ2rCveJ9bW6DjPxCQ+1qgKH1Ek6
	xkXF+bGOfiTqqLV7oitOBObww5TfW0puObZwKbsmqR5H0FjeDTj9vl+v998pe0A=
X-Google-Smtp-Source: AGHT+IEFgxqp4c4BSC1SH5cF+VnXZrlQYZRwfL7NLGJ+2lwsht4p33YhmsPE8cnHExWItmf7lq/Yhg==
X-Received: by 2002:a05:6e02:80a:b0:361:981f:5b32 with SMTP id u10-20020a056e02080a00b00361981f5b32mr2364278ilm.123.1705664107212;
        Fri, 19 Jan 2024 03:35:07 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id a5-20020a92a305000000b0036062f40c51sm5347302ili.71.2024.01.19.03.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 03:35:06 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Subject: [PATCH v6 1/5] RISC-V: Add stubs for sbi_console_putchar/getchar()
Date: Fri, 19 Jan 2024 17:04:45 +0530
Message-Id: <20240119113449.492152-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240119113449.492152-1-apatel@ventanamicro.com>
References: <20240119113449.492152-1-apatel@ventanamicro.com>
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
Cc: Anup Patel <apatel@ventanamicro.com>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, linux-serial@vger.kernel.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Andrew Jones <ajones@ventanamicro.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The functions sbi_console_putchar() and sbi_console_getchar() are
not defined when CONFIG_RISCV_SBI_V01 is disabled so let us add
stub of these functions to avoid "#ifdef" on user side.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/sbi.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index b6f898c56940..e0a8eca32ba5 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -288,8 +288,13 @@ struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
 			unsigned long arg3, unsigned long arg4,
 			unsigned long arg5);
 
+#ifdef CONFIG_RISCV_SBI_V01
 void sbi_console_putchar(int ch);
 int sbi_console_getchar(void);
+#else
+static inline void sbi_console_putchar(int ch) { }
+static inline int sbi_console_getchar(void) { return -ENOENT; }
+#endif
 long sbi_get_mvendorid(void);
 long sbi_get_marchid(void);
 long sbi_get_mimpid(void);
-- 
2.34.1

