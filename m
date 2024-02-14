Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B372854CFA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Feb 2024 16:36:46 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=WEcYgP+/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TZj3c3Zq3z3dWn
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Feb 2024 02:36:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=WEcYgP+/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=palmer@rivosinc.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TZj2q3QKcz3bmy
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Feb 2024 02:36:01 +1100 (AEDT)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6e0a4c6c2adso2226671b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Feb 2024 07:36:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1707924959; x=1708529759; darn=lists.ozlabs.org;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=rsMZabPqQdOyGUzvRmcq12qy26eK1NK8IC3lX9TP0EM=;
        b=WEcYgP+/Pt3KuNbZjtCNfGJxemgiXi0CNzeIgGaHJJAk08LAV8Cw0CF9DfYweYe0Zg
         ikDSIPfQ8AM4zm4mKRChn82eTqEZWZ+LR72ts6v0r3LrTak/0q+IOF64MbC80eL339iV
         8EUGh/t4ycev0WGxArLAmNCL46vsdeEZDEJs1pF3mA2pmT7SssfHUprX25ewPegDu6zW
         pphzecuq0a6Eapd6IVdMK2NcUHm0S9tcoMdFWyvhW55EHigYG+m6VPDiOTwT4TXezJHd
         CU11fQU6Md6eY2DHlrnWp18zYTYb4G8DY4kRhBnkBVeSRbXJrVgBWDSY3BPMCwW2QDqe
         gSlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707924959; x=1708529759;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rsMZabPqQdOyGUzvRmcq12qy26eK1NK8IC3lX9TP0EM=;
        b=I81BSnXlZjPkDljc0QN6tEa3N9fcjDro1OLD5It+50/Qj4ELzb0IOgWBtEi30ynLGP
         lbR//cTZh5HO91pKzpSfXX6poCjHzgOmWFVbVWDvE4cvBPaxRTQr8yQoraIRxwoPYKI6
         /6sMInQwFCsQJHnexJwH3mz+S9VF9iq9lRM2tLZzunHLETUm6DZagURhrOog7qSuK8sr
         98+PJifvCUsFyRYl4vq9nxo8mbTu1Z+UuRb61hWEaB6jSjCzodpIWZHysl77kQkxjzCf
         m6FGiokBBeYfLaHmXj847VxQ7DO3YYaTZl4Cf6anH1hAjF2praZi9M/yIGtiwRq2nNb0
         mYvw==
X-Forwarded-Encrypted: i=1; AJvYcCWK/vsAvBb22IfCmHxzsFJgESmzEmxxyjv9+xYXFBjtlEjUAH8r7YQM03ForyIqNs748x4wzyp4XzSXHwrXtHKVGHnZB3OwDO/9dQckkQ==
X-Gm-Message-State: AOJu0Yz1qYda1CMOf8qg3Q49Ox6ltPZWrmUh6UHLoiRMRQ23P1M10leB
	a7xUbjzLll6xC8RQE+zIOM1hKn4CztjPjpmo+ZBzK/D99YWcNOW7t5FgNWZJc98=
X-Google-Smtp-Source: AGHT+IGCj5QYYGRsrk8Q2pygd+6XJjwy1KOMVBJGfPsVyi6BD67Qztrw9Lzw2Qr0q8IX8o3HWd0//A==
X-Received: by 2002:aa7:8b8e:0:b0:6e0:5281:e0d1 with SMTP id r14-20020aa78b8e000000b006e05281e0d1mr2385582pfd.1.1707924958554;
        Wed, 14 Feb 2024 07:35:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVi2q1qLmAsiIATfz24ig+iFdorSpWUIiVssALGUs9LyD/SA8Svg+RLskFF9Q3UBkfSIXUaqNAHSMROGt6rGhEjBIg8i400pd+JHT7D7ZPZig5ML1gXfZtiDwZSLuOr2IkB5OzqIQu5QHPMiC38TLbMz70t7m9sw126jWAF0Pi8QHsfIZT0cwIeMyzRoPB2O2IuROzwxS/cNdZ4lsd+3Snpc4Q2rdGzDCIMbRaCrt/hh6J393hnZIhkBWLUHHl8xpwy/bHH5iorENgQzCDaVoJKIAmtPkCrSkGDdd2JoKia20r/7sCfPQDtw3KMONjAkn80c8+y8aeq+1rCcVgx+jld/U14DkTxaAae39nF
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id h28-20020a056a00001c00b006dbe4452741sm9508749pfk.72.2024.02.14.07.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 07:35:57 -0800 (PST)
Subject: [PATCH] tty: hvc: Don't enable the RISC-V SBI console by default
Date: Wed, 14 Feb 2024 07:34:30 -0800
Message-ID: <20240214153429.16484-2-palmer@rivosinc.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org
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
Cc: apatel@ventanamicro.com, Emil Renner Berthing <kernel@esmil.dk>, Greg KH <gregkh@linuxfoundation.org>, Atish Patra <atishp@rivosinc.com>, linuxppc-dev@lists.ozlabs.org, Palmer Dabbelt <palmer@rivosinc.com>, linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, jirislaby@kernel.org, ajones@ventanamicro.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Palmer Dabbelt <palmer@rivosinc.com>

The new SBI console has the same problem as the old one: there's only
one shared backing hardware and no synchronization, so the two drivers
end up stepping on each other.  This was the same issue the old SBI-0.1
console drivers had, but that was disabled by default when SBI-0.1 was.

So just mark the new driver as nonportable.

Reported-by: Emil Renner Berthing <kernel@esmil.dk>
Fixes: 88ead68e764c ("tty: Add SBI debug console support to HVC SBI driver")
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 drivers/tty/hvc/Kconfig | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/hvc/Kconfig b/drivers/tty/hvc/Kconfig
index 6e05c5c7bca1..c2a4e88b328f 100644
--- a/drivers/tty/hvc/Kconfig
+++ b/drivers/tty/hvc/Kconfig
@@ -108,13 +108,15 @@ config HVC_DCC_SERIALIZE_SMP
 
 config HVC_RISCV_SBI
 	bool "RISC-V SBI console support"
-	depends on RISCV_SBI
+	depends on RISCV_SBI && NONPORTABLE
 	select HVC_DRIVER
 	help
 	  This enables support for console output via RISC-V SBI calls, which
-	  is normally used only during boot to output printk.
+	  is normally used only during boot to output printk.  This driver
+	  conflicts with real console drivers and should not be enabled on
+	  systems that directly access the console.
 
-	  If you don't know what do to here, say Y.
+	  If you don't know what do to here, say N.
 
 config HVCS
 	tristate "IBM Hypervisor Virtual Console Server support"
-- 
2.43.0

