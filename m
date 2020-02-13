Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E50415BDF1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Feb 2020 12:45:58 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48JF824VsKzDqVH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Feb 2020 22:45:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::244;
 helo=mail-lj1-x244.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.a=rsa-sha256 header.s=google header.b=DS3zpTry; 
 dkim-atps=neutral
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48JF5k4tLPzDqRd
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Feb 2020 22:43:54 +1100 (AEDT)
Received: by mail-lj1-x244.google.com with SMTP id e18so6175924ljn.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Feb 2020 03:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=i6T8aX1QwpqyjQv/4hfG4t4Fh7mCih0byLL8inV4cnE=;
 b=DS3zpTryUgnzBtAdqVV7n63dtHxdb6Au6w9LFVVa1fjwRigYHtRhKD4An3wUxMW5+b
 gpv2S14ouzj7WK0Qh+ae0v0Y4ADDEjpvu6vSyGDwTy9y3o+Xo2Wnm79I5SW4WGtzmyTm
 a5a7AcPPNP2avTOI9njhZ4ikyfRy4p+V6V7Ws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=i6T8aX1QwpqyjQv/4hfG4t4Fh7mCih0byLL8inV4cnE=;
 b=B67j5g4XxDK4OOROknX+I3l7voCb9+BSmed0cw7fN/KmmI6l1gWaFgg7FDEN2SD8HT
 OMeSpmUb7tfVDNFHxWQTNRgs8+cF9cB+ohhw1YxeKlxvn8Z2jTieK5jUT1zRRLtztoMs
 6NdYT5MnmO6x13cyRR3lwmbijVwGN8j9mTOcCrPhluDWEVMOSRWjg9nLhSUXeQbLbzJy
 uwZaFf0I97FfNs29wOQINuvfp/29Z5sPlY4HhZ6iFqBsk9SWjAg2ZDUvCl6K9t26f3o+
 DCHtnrjF/JyUkhZKymiqbzV1YBopsOJ0RFRM6CQWSaPdYxkMd3Xo+Wpo1WiNimwGTSUx
 G6/g==
X-Gm-Message-State: APjAAAVgcOIAPITpVGgESlp7arUtSSpJVahxaoHoQzvoPuaMYIBKduud
 /P+qjVCNxVN4iIFLRGXLM5Ic0A==
X-Google-Smtp-Source: APXvYqzihrRuQYzokfC8tH0BWwAQtZxAEN1Rf+GsEvokD8opRwS5tRNLeqUyWw/2APcjeVRtq7ZRiw==
X-Received: by 2002:a2e:9052:: with SMTP id n18mr10774826ljg.251.1581594229111; 
 Thu, 13 Feb 2020 03:43:49 -0800 (PST)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id q13sm1603535ljj.63.2020.02.13.03.43.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2020 03:43:48 -0800 (PST)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jslaby@suse.com>, Timur Tabi <timur@kernel.org>,
 Li Yang <leoyang.li@nxp.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: [PATCH] serial: cpm_uart: call cpm_muram_init before registering
 console
Date: Thu, 13 Feb 2020 12:43:42 +0100
Message-Id: <20200213114342.21712-1-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.23.0
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
Cc: linux-kernel@vger.kernel.org, Scott Wood <oss@buserror.net>,
 linux-serial@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe reports that powerpc 8xx silently fails to 5.6-rc1. It turns
out I was wrong about nobody relying on the lazy initialization of the
cpm/qe muram in commit b6231ea2b3c6 (soc: fsl: qe: drop broken lazy
call of cpm_muram_init()).

Rather than reinstating the somewhat dubious lazy call (initializing a
currently held spinlock, and implicitly doing a GFP_KERNEL under that
spinlock), make sure that cpm_muram_init() is called early enough - I
thought the calls from the subsys_initcalls were good enough, but when
used by console drivers, that's obviously not the
case. cpm_muram_init() is safe to call twice (there's an early return
if it is already initialized), so keep the call from cpm_init() - in
case SERIAL_CPM_CONSOLE=n.

Reported-by: Christophe Leroy <christophe.leroy@c-s.fr>
Fixes: b6231ea2b3c6 (soc: fsl: qe: drop broken lazy call of cpm_muram_init())
Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---

Christophe, can I get you to add a formal Tested-by?

I'm not sure which tree this should go through.

 drivers/tty/serial/cpm_uart/cpm_uart_core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/tty/serial/cpm_uart/cpm_uart_core.c b/drivers/tty/serial/cpm_uart/cpm_uart_core.c
index 19d5a4cf29a6..d4b81b06e0cb 100644
--- a/drivers/tty/serial/cpm_uart/cpm_uart_core.c
+++ b/drivers/tty/serial/cpm_uart/cpm_uart_core.c
@@ -1373,6 +1373,7 @@ static struct console cpm_scc_uart_console = {
 
 static int __init cpm_uart_console_init(void)
 {
+	cpm_muram_init();
 	register_console(&cpm_scc_uart_console);
 	return 0;
 }
-- 
2.23.0

