Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D0C7F5B8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 13:06:52 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 460PVw4h4jzDqbx
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 21:06:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="K/aGyN4b"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 460PLr2NfJzDqxM
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2019 20:59:48 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id 19so35855780pfa.4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Aug 2019 03:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SWxZgTPpAfK2LmHEoRsPnyYwovFqeT2VAGB188HAJTs=;
 b=K/aGyN4bPm/hpZrxVxSQrn/9gV9Vm5WCOEgCw4tSsY5QMNPwsQO2MRYc8uxFJRxw8l
 feF6BFP8cgbYAVcSSRW68OUPJ5q75yKe6zerEbh3MkXUyY/M/OPNatxcRUplS9a5UTTm
 Ti+yRvfhW626yBXPFfKq6V7L0Z14kZdxZ+b7qu1nN5FnrzHROWRn17MvC+S4gbhxtsm9
 QoWP8vd5kT8NE7Id4Wiu03upr0olYw3mBZadBKMj2id48azQZZjlP0CwiSbpvoK1bJSj
 bVYqaTecJIh1Lg2ThAkm+mLItPpO82DhQmwaQ4CX/X23b4p2y5r/OcgTSNS0xzORqwbC
 Fdlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SWxZgTPpAfK2LmHEoRsPnyYwovFqeT2VAGB188HAJTs=;
 b=AClA5wIPOYOJvy9ALcpSv+4QayUdD8v3s0ygAEGWEYcQazhyzX7z+9fLnNZWE0wEVy
 zCnU1muyEozWbnUrqLVmuhIhXRuO0lrJENQa5wVH1b7ZLBQHbiW3tOkdP/BjJ+lDxVsE
 G4QJDn11/pugSjKhid5tf2y/LFhkDSqkMm2xHZuPP6Xk5ykdLetmmCQH9m3jmHJQAj5d
 e8nfQLt7UlWPl5ihTwYY/IvZCxTXX4kWoAIfnqQNnVnaC4lWmgliuXactn3BHRGlVDoz
 xemVxs60HoeD46R0zcz2bBZVDItx1K4mZI1NoxHa12Lnps6deMkJnb8jn+3ProWTxtDm
 XNXA==
X-Gm-Message-State: APjAAAU/rG/WjkDvOxAuiVQrWJEW6aGttkqfNS7xP9ruU59K+JZ7oVx8
 ef4mwRrlP5cbB0sVwamgqhISPbcBmmQ=
X-Google-Smtp-Source: APXvYqwGwewv/3/In/LAZ5CHDB0mfJBzKWzRD1l5udBMi4I/MxAcpY3xDQCJ/XioVvOxHD5L7pnRAg==
X-Received: by 2002:a65:528d:: with SMTP id y13mr35588978pgp.120.1564743586070; 
 Fri, 02 Aug 2019 03:59:46 -0700 (PDT)
Received: from bobo.local0.net (193-116-68-11.tpgi.com.au. [193.116.68.11])
 by smtp.gmail.com with ESMTPSA id t96sm7377118pjb.1.2019.08.02.03.59.44
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 02 Aug 2019 03:59:45 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 02/44] powerpc/64s/exception: machine check remove
 bitrotted comment
Date: Fri,  2 Aug 2019 20:56:27 +1000
Message-Id: <20190802105709.27696-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190802105709.27696-1-npiggin@gmail.com>
References: <20190802105709.27696-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index f30eb1df7443..6d8d21fa935f 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -933,10 +933,6 @@ EXC_COMMON_BEGIN(system_reset_common)
 
 
 EXC_REAL_BEGIN(machine_check, 0x200, 0x100)
-	/* This is moved out of line as it can be patched by FW, but
-	 * some code path might still want to branch into the original
-	 * vector
-	 */
 	EXCEPTION_PROLOG_0 PACA_EXMC
 BEGIN_FTR_SECTION
 	b	machine_check_common_early
-- 
2.22.0

