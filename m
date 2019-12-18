Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DCF123E35
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2019 05:03:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47d1ZT3cBjzDqSm
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2019 15:03:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=arista.com (client-ip=2a00:1450:4864:20::344;
 helo=mail-wm1-x344.google.com; envelope-from=dima@arista.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=arista.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=arista.com header.i=@arista.com header.b="cfj+plni"; 
 dkim-atps=neutral
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47d1XN24sLzDqSM
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Dec 2019 15:01:21 +1100 (AEDT)
Received: by mail-wm1-x344.google.com with SMTP id 20so212877wmj.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Dec 2019 20:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arista.com; s=googlenew;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fvdPlfimj6OGtq993uBEH4HDXjgpDehuAkgs24MT6mk=;
 b=cfj+plniTQLIAyRxe47ndjyUvVeRa/IxIB8Mt5PLoJXGK7UIN41nnUaB01hoT40Hgi
 MUnbrBOHR6khmDdC4UHAZn/92St+b/mOb+uCNrOB3V/qhKcx2DP/BjxB+716LHq0wS+W
 hSDCpRef2eFLd+prsDVNKPwH55vxNXrD8pilYnLJlBqPbfG0afcRQ7tBDkgSpTv6ZZOm
 ojAJt9h+C+/Xh2k10LfXKGyGzojYJSs+7jrB6KGxIf3MpBsNiZ7ic9OEWt96tNokgyY/
 Z/VaBmkXTfwqXxhaL03fXunnnRuFxGbRahNjsrwYdezNFhdmLw1g59jY4DR3c/zIIzPC
 Qj6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fvdPlfimj6OGtq993uBEH4HDXjgpDehuAkgs24MT6mk=;
 b=KTGLVeNcfwCcvYeYApP6ixwadRtOHkRpKuYq/QtjzWPGSEXIo8NTTxaVdJDD1XVtzd
 LiDD6HdE2AxVI66aQBXSGJHSwbNxIECWy8PiEb/jCBgH12kzqNVMcOawY1ffZiwF1/2C
 OfbybMHmqkdQyNPRr4WdrsZLT6yC2NMGgMhXgDoRdv/AbLrx9JzXm61bCTa36PxojE4C
 Cis1EP9e88rHl4/q0v05x1Y6zZXFncOT6FnXMLQPSDT8tK1fwNMCBCzy6YxN4ZWqr/ad
 X0ihaSC/POgLR/VpvbwA+ebOU26Drj3yUmryw0SwnB7cl2LTOKp9a2aS/jJVoTgBTC/j
 ZoYA==
X-Gm-Message-State: APjAAAWPyhkf/B2llvr6KjUD1yShUMEPjVF+jzahsmKN3+EUqvk7sK1V
 hkFJYStwQNCJOFG121eRROnf/Q==
X-Google-Smtp-Source: APXvYqy7s4sbdhuS0pHTU7euxKWmXyOMby7qOb/d/6Sm92wXWIHdT+zGtXXtLAaJP0x1yenu4+qzPw==
X-Received: by 2002:a7b:c450:: with SMTP id l16mr415254wmi.31.1576641677626;
 Tue, 17 Dec 2019 20:01:17 -0800 (PST)
Received: from Mindolluin.ire.aristanetworks.com ([217.173.96.166])
 by smtp.gmail.com with ESMTPSA id r15sm976023wmh.21.2019.12.17.20.01.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2019 20:01:17 -0800 (PST)
From: Dmitry Safonov <dima@arista.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH-tty-testing] tty/serial/8250: Add has_sysrq to
 plat_serial8250_port
Date: Wed, 18 Dec 2019 04:01:11 +0000
Message-Id: <20191218040111.346846-1-dima@arista.com>
X-Mailer: git-send-email 2.24.1
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
Cc: kbuild test robot <lkp@intel.com>, Dmitry Safonov <dima@arista.com>,
 Dmitry Safonov <0x7f454c46@gmail.com>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In contrast to 8250/8250_of, legacy_serial on powerpc does fill
(struct plat_serial8250_port). The reason is likely that it's done on
device_initcall(), not on probe. So, 8250_core is not yet probed.

Propagate value from platform_device on 8250 probe - in case powepc
legacy driver it's initialized on initcall, in case 8250_of it will be
initialized later on of_platform_serial_setup().

Fixes: ea2683bf546c ("tty/serial: Migrate 8250_fsl to use has_sysrq").
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Dmitry Safonov <dima@arista.com>
---
 It's probably better to squash this into the 8250_fsl patch.
 I've added Fixes tag in case the branch won't be rebased.
 Tested powerpc build manually with ppc64 cross-compiler.

 drivers/tty/serial/8250/8250_core.c | 1 +
 include/linux/serial_8250.h         | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/tty/serial/8250/8250_core.c b/drivers/tty/serial/8250/8250_core.c
index e682390ce0de..0894a22fd702 100644
--- a/drivers/tty/serial/8250/8250_core.c
+++ b/drivers/tty/serial/8250/8250_core.c
@@ -816,6 +816,7 @@ static int serial8250_probe(struct platform_device *dev)
 		uart.port.flags		= p->flags;
 		uart.port.mapbase	= p->mapbase;
 		uart.port.hub6		= p->hub6;
+		uart.port.has_sysrq	= p->has_sysrq;
 		uart.port.private_data	= p->private_data;
 		uart.port.type		= p->type;
 		uart.port.serial_in	= p->serial_in;
diff --git a/include/linux/serial_8250.h b/include/linux/serial_8250.h
index bb2bc99388ca..6a8e8c48c882 100644
--- a/include/linux/serial_8250.h
+++ b/include/linux/serial_8250.h
@@ -25,6 +25,7 @@ struct plat_serial8250_port {
 	unsigned char	regshift;	/* register shift */
 	unsigned char	iotype;		/* UPIO_* */
 	unsigned char	hub6;
+	unsigned char	has_sysrq;	/* supports magic SysRq */
 	upf_t		flags;		/* UPF_* flags */
 	unsigned int	type;		/* If UPF_FIXED_TYPE */
 	unsigned int	(*serial_in)(struct uart_port *, int);
-- 
2.24.1

