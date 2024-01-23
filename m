Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3B38387A9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jan 2024 07:43:59 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=1y32bqmU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TJyH14YWFz3c9l
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jan 2024 17:43:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=1y32bqmU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3_v-vzqykdk4gifsbpuccuzs.qcazwbilddq-rsjzwghg.cnzopg.cfu@flex--surenb.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TJyGC21fcz3bNs
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jan 2024 17:43:13 +1100 (AEDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-5ff93902762so61557467b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jan 2024 22:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1705992189; x=1706596989; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2FZwZ+rXghzrwMAzRL81BGjWf4dIgKukf4yDKbJi/Es=;
        b=1y32bqmUTeYJzpqrvna5coBQy4CqNeOHWzVFhXVVm1AUDndQHCvlCLQhXJmWwpSNNb
         NI/kPYhgjcI+1ng4jgH4HvPI2zI2Q6saZTH+czLG6aZYs0de1+bH0ReKbFjnbMiQwNhh
         pCdebiwa4EsG9Wo/Wv47IF/o/7FlDVVNps87Nb/dktJfbSprEGwxlJx2VkD3WU/FOoea
         B5SDAS8Hzdw8H8h9rSLB2NHlicbxK+RAZppvIYYULS+KbDFGx3B+OlPDoBFkQdtaICIf
         0WZX8Uh4QeOD8N2CRVfZ0+y55L6KguIOBjsQaI5RMzygAHSAHfCovACeHpt1VnDbtxyA
         alYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705992189; x=1706596989;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2FZwZ+rXghzrwMAzRL81BGjWf4dIgKukf4yDKbJi/Es=;
        b=w5qRZksD+8VYQsAYMYcl5yoORg7aF5SJNcncAbWYDM/bQDw+yNryxWnNn1U5D7M1jk
         8eK7+76gnHEbZ16dyHl6AniIJ19e1WVvIyZoc+dDNXV4UTlyQipd4nnnePk/DZ9e7dMa
         xBgn3dxjKlpMcT5VK+03ARH9FGj6RgY1kNxbpTvGCcGXLiu7/6qzGzds1CEsfjkMk34X
         7I4l0i7BMJSCq//U3N4c6hHQ8tCaqO/lqIFpDFCCCFPeIrA7aKy/sIQWEjLwS9TuvMek
         kuKttIuMqMVOFUqkB7JMBtPhiriVKDM88DRO/rGfSkbhbk/eEPRlfLc974lNy1M5hj2/
         FQNw==
X-Gm-Message-State: AOJu0YzK5gdFoet0aJ8fIexh08ZbmWWS0d+lnF1XysQQxCN5nE9Avyyn
	UawW9dEKufPnbnfGRpUqMwijMNikwvnmU7pCrGfbeS5LBMWT1Gv0scadDjdnYUbpKa+voeV/1SO
	mwA==
X-Google-Smtp-Source: AGHT+IEO6A9zRBfOAVXliXkQQKxCV0qhRt+egkKWA991dYf7yzqjSRjLplw2MTnE92/ZhwSFnAUoRNjPv64=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:201:6bca:2511:6f80:6efe])
 (user=surenb job=sendgmr) by 2002:a0d:d68f:0:b0:5f9:990d:78c0 with SMTP id
 y137-20020a0dd68f000000b005f9990d78c0mr2517316ywd.4.1705992189291; Mon, 22
 Jan 2024 22:43:09 -0800 (PST)
Date: Mon, 22 Jan 2024 22:43:05 -0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
Message-ID: <20240123064305.2829244-1-surenb@google.com>
Subject: [PATCH 1/1] arch/arm/mm: fix major fault accounting when retrying
 under per-VMA lock
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
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
Cc: linux-s390@vger.kernel.org, x86@kernel.org, peterz@infradead.org, catalin.marinas@arm.com, dave.hansen@linux.intel.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, surenb@google.com, Russell King <rmk+kernel@armlinux.org.uk>, linux-riscv@lists.infradead.org, palmer@dabbelt.com, willy@infradead.org, luto@kernel.org, agordeev@linux.ibm.com, will@kernel.org, gerald.schaefer@linux.ibm.com, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The change [1] missed ARM architecture when fixing major fault accounting
for page fault retry under per-VMA lock. Add missing code to fix ARM
architecture fault accounting.

[1] 46e714c729c8 ("arch/mm/fault: fix major fault accounting when retrying under per-VMA lock")

Fixes: 12214eba1992 ("mm: handle read faults under the VMA lock")

Reported-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 arch/arm/mm/fault.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/mm/fault.c b/arch/arm/mm/fault.c
index e96fb40b9cc3..07565b593ed6 100644
--- a/arch/arm/mm/fault.c
+++ b/arch/arm/mm/fault.c
@@ -298,6 +298,8 @@ do_page_fault(unsigned long addr, unsigned int fsr, struct pt_regs *regs)
 		goto done;
 	}
 	count_vm_vma_lock_event(VMA_LOCK_RETRY);
+	if (fault & VM_FAULT_MAJOR)
+		flags |= FAULT_FLAG_TRIED;
 
 	/* Quick path to respond to signals */
 	if (fault_signal_pending(fault, regs)) {
-- 
2.43.0.429.g432eaa2c6b-goog

