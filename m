Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A06D8574
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Oct 2019 03:27:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46tF6241TtzDqjx
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Oct 2019 12:27:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="crdsLjPA"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46tF434lGTzDqSR
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Oct 2019 12:25:54 +1100 (AEDT)
Received: by mail-pg1-x542.google.com with SMTP id e15so5220772pgu.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2019 18:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DAtY5lduzm5qWGwI0JEuLnrEqIrxfD6nRJuR5Nf2fgA=;
 b=crdsLjPAVxvGLOTriRLTjP1jrEkwoM0rqWcPTNTziRDwPXxj5cM5hajv1QpwIHrcKc
 hMVVfI+zhoVfacU23nzBFILM+cVf0aYru9iyBKgpUbYE7uE/S8U+DWD7bSjCR1XAuVAf
 9XwhuVCU+S8XRU3ORTuCR7EnKYREyQD6bbbgyKa3HX4kYdGXoNCzjbE0Q/wRY0aZftm1
 9BU3I0FkmfQvLkP0mSgMdrAlf2m5aRcZQvOFp/gve7tzqbdBgU3Quh7bj6qI47dQFH6a
 mrroG4I6BtztibSXHYfWTL8gvQkkhy/2f94m/ZcRYy6Uf7sRB8PsS8PLBNy3tEa1QiW1
 pYUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DAtY5lduzm5qWGwI0JEuLnrEqIrxfD6nRJuR5Nf2fgA=;
 b=nwfS6e0gCih5e6EjLoyOdnUqIRGFonZ+Zx6ANcTRgbaQVtfpTs+v97V41d1641WYk2
 OEIi8jDzKou4RmEuqO0rbWjJPn04MqxAHSTc7+F4fERphujjs4Zg8YjPqx7cU9dVFrct
 WcyvnMP+5/JhstgAg3yeeXJTdcgwNZoDMN9WvqRtyniLPFBbQGwL/mKOW2FyLdWxprH4
 eQ/6381HT+5WzOaxHd/YJcPGqTElz91DKW+mARRZZxNQHoab5HtwPqY8afOVj3wIRTig
 C1/YiKktFlPQ9tH0DhHwEhiSU2nBtJpoHcGLu7+sfrGrbUH7a2l2rwHlACesY/TvoVBX
 ycDg==
X-Gm-Message-State: APjAAAXjKEp9icVMA7NJFIdCoTrIvz2jYiX/wwYSToHhrMRyyQU4XnzN
 tBRZONiHIcnibSR9C4CCgiPuYqq5
X-Google-Smtp-Source: APXvYqyepitpsluPkkkkQIS/53aWkdKQkp/LYeJCPvuXRVLLxJAf9SM/+lOwmNMVDYsSbl4WuZdHwA==
X-Received: by 2002:a63:1242:: with SMTP id 2mr2455338pgs.288.1571189151028;
 Tue, 15 Oct 2019 18:25:51 -0700 (PDT)
Received: from wafer.ozlabs.ibm.com.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id t13sm20542947pfh.12.2019.10.15.18.25.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2019 18:25:50 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/eeh: Only dump stack once if an MMIO loop is detected
Date: Wed, 16 Oct 2019 12:25:36 +1100
Message-Id: <20191016012536.22588-1-oohall@gmail.com>
X-Mailer: git-send-email 2.21.0
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
Cc: Sam Bobroff <sbobroff@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Many drivers don't check for errors when they get a 0xFFs response from an
MMIO load. As a result after an EEH event occurs a driver can get stuck in
a polling loop unless it some kind of internal timeout logic.

Currently EEH tries to detect and report stuck drivers by dumping a stack
trace after eeh_dev_check_failure() is called EEH_MAX_FAILS times on an
already frozen PE. The value of EEH_MAX_FAILS was chosen so that a dump
would occur every few seconds if the driver was spinning in a loop. This
results in a lot of spurious stack traces in the kernel log.

Fix this by limiting it to printing one stack trace for each PE freeze. If
the driver is truely stuck the kernel's hung task detector is better suited
to reporting the probelm anyway.

Cc: Sam Bobroff <sbobroff@linux.ibm.com>
Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/kernel/eeh.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
index bc8a551013be..c35069294ecf 100644
--- a/arch/powerpc/kernel/eeh.c
+++ b/arch/powerpc/kernel/eeh.c
@@ -503,7 +503,7 @@ int eeh_dev_check_failure(struct eeh_dev *edev)
 	rc = 1;
 	if (pe->state & EEH_PE_ISOLATED) {
 		pe->check_count++;
-		if (pe->check_count % EEH_MAX_FAILS == 0) {
+		if (pe->check_count == EEH_MAX_FAILS) {
 			dn = pci_device_to_OF_node(dev);
 			if (dn)
 				location = of_get_property(dn, "ibm,loc-code",
-- 
2.21.0

