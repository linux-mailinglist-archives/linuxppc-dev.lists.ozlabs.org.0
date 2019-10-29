Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 535DDE7F3D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2019 05:36:39 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 472Jh36qz8zF0wQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2019 15:36:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=saurav.girepunje@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="uayqepFL"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 472HRb1lgrzDsTW
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2019 14:40:37 +1100 (AEDT)
Received: by mail-pf1-x441.google.com with SMTP id c13so8512686pfp.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Oct 2019 20:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=cTJ/5ueE8SvgUdZQJcjb9C4BjM0/MnFjXu7d16hPfEE=;
 b=uayqepFLEbT17OItKInIgyzSaTQTIU3+znFT/Q6z1MZIPCyS7kpDuUrQDiwgsYXecG
 OWhMrS50AGiSKNP/pVNclWclacE0R+YH/aIeDbS3T2jompGDdJVW0wHSEQ3VMgrBFZit
 uj21rhz/iBfP7emBcKGLuoyXjimJbIbpjqt515gEowuzwqNVx1oG7sdp0kliDyaQr8Ja
 8FnZ+O3+/IGjSFRzI3cV8PxzPiCcMUvvnCZ6Wt8R2DoE2JqtD+h/4kPN5+KdhVaQVfmA
 GLMA9aVzLCuYh9pHSe5X0VMd54qRAR11Prf9uRq9gWq0MBSJPPRHoTeN3U8QJzTKFRhS
 EuGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=cTJ/5ueE8SvgUdZQJcjb9C4BjM0/MnFjXu7d16hPfEE=;
 b=nD15Wik24Xd0llU+/M/wkz+wRRTAPorwirrMrtwGxLPn0BZEOUEbBWtyqCdWAbMHKP
 U8GzTRkoKxH0miW6sbni5ylHWYu99cWC6npkkjbe9n+/TdAqvYEtdMkov4UiCzIMZPB/
 zihlgKxIPXf8x1eZcOSGgA5F/Q+bi/5m1vvfW0C1BcauQraHMsnyPim1ar8d14mTYEUa
 s1aWsH74GB2e286XA/fWF3pZQFgJA6sKn/Kxa+Ad4sNoVOu7uu0dbKG3h+KJ/c7PstGA
 OyxI2l92uVGaJOOFWj/W5UQMY1WZMzq4kJs/zEU26lj+ckEyqpXhhY/095XeNlpzQfUL
 rngA==
X-Gm-Message-State: APjAAAUo823K2KdUvGa+BFrEGLzorlt12w0UoZT3fAkUTy9FARazG0L1
 ddUK/qaaofX210QszrV3JYk=
X-Google-Smtp-Source: APXvYqwnKoU9U846A1HWXHnbxkTSiV3L1FbA3LwJy2VUUEt7swz4KjWlyX6zJbeAP06Tfd4x/oM5dQ==
X-Received: by 2002:a63:9543:: with SMTP id t3mr24798812pgn.350.1572320435280; 
 Mon, 28 Oct 2019 20:40:35 -0700 (PDT)
Received: from saurav ([27.62.167.137])
 by smtp.gmail.com with ESMTPSA id l11sm13911499pgf.73.2019.10.28.20.40.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 20:40:34 -0700 (PDT)
Date: Tue, 29 Oct 2019 09:10:27 +0530
From: Saurav Girepunje <saurav.girepunje@gmail.com>
To: benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au,
 groug@kaod.org, clg@kaod.org, christophe.jaillet@wanadoo.fr,
 tglx@linutronix.de, saurav.girepunje@gmail.com,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc: sysdev: xive: Fix use true/false for bool type
Message-ID: <20191029034027.GA7226@saurav>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Tue, 29 Oct 2019 15:32:59 +1100
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
Cc: saurav.girepunje@hotmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use true/false for bool return type in xive_spapr_cleanup_queue
function.

Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
---
 arch/powerpc/sysdev/xive/spapr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/sysdev/xive/spapr.c b/arch/powerpc/sysdev/xive/spapr.c
index 33c10749edec..74e3ffae0be6 100644
--- a/arch/powerpc/sysdev/xive/spapr.c
+++ b/arch/powerpc/sysdev/xive/spapr.c
@@ -533,7 +533,7 @@ static void xive_spapr_cleanup_queue(unsigned int cpu, struct xive_cpu *xc,
 static bool xive_spapr_match(struct device_node *node)
 {
 	/* Ignore cascaded controllers for the moment */
-	return 1;
+	return true;
 }
 
 #ifdef CONFIG_SMP
-- 
2.20.1

