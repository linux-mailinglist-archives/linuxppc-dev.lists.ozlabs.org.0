Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C639C685F5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2019 11:06:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45nHhG3n8WzDqSh
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2019 19:06:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="GPm2JlWD"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45nHSx66ZNzDqQT
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jul 2019 18:56:33 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id g15so7394508pgi.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jul 2019 01:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UXHO2NDyuDVxfFPUSLDKgRXqIpvkAdkXTkmw0S2mGGw=;
 b=GPm2JlWDjI11u2op0yT4DqcnDEcsDgk3o8XPYW/YCNpDHnCNQc23v734YZgra0tsIH
 ShI2mr9ke6eSV6vUUyPiiuDS3t6ubDYeaXMwiVbcOcS7S7YqCnhUa0ClbJ6UoGKIZ62w
 98mYfX4eJtuXfdeybgpZTzjc8mAJxM1+vv8EaYVVXrAGXQxOTKmKwUqicc0glObWGh1B
 I0jMoYZkfn2oKIZVjAWvsIzw0F7x5dhtBEVVBFU+d7WXrKljHc+3Ja0AfvfqquAu3xcB
 Zcrm7A6yiIuXU5NaepCOFTERn6utt3qghooHoU5ks7lzE6oa91Qcugjtt8uH4TcIb01c
 OXzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UXHO2NDyuDVxfFPUSLDKgRXqIpvkAdkXTkmw0S2mGGw=;
 b=uax+balFgr4dF3w3cVqXFhZzIRmTwqbJfijXkSRqVC4qpq5cke8YtEZJkYqGSRsE1L
 XBfGzj3qxchsvzZAZ4aB8XwQ6nzIDe+IXoEOHYF7dgHvddT35Ae/LVqfB0B5TZJC1jCL
 xtLxPJ6jvDjWjZvrQE5e38nyNB0LFyDEMsquAkHD5L5EMAyKbHCEG8DVOqTRG9S+kgU1
 zRjMookVeljzhXurP2td3rP0xUBbBsPRX+jki42EY7BQ6wgCoOMiVtHPKmI/cEpIuwu6
 tPv7tQyrliCQZyNoGp1QnUOyUW5H7/LjhcYMoQire6qmJO18YK4EoYy/Qb7AZFHYDISk
 93nA==
X-Gm-Message-State: APjAAAWzpFNKVC5NRjlexboUqVE0EyqhUjFPNIu/TGuqs8y7FB5J9t7f
 mZxwmHbP+KeZd7LiF/IuZp1FTn9mUaA=
X-Google-Smtp-Source: APXvYqxuZfOAbZy7NHMNHkIVpjvJUHAyiQbDN0gjq7LShqWOjUq9hlQC8jkJGXQgkM8R37nXhGNVtw==
X-Received: by 2002:a17:90a:22c6:: with SMTP id
 s64mr28455442pjc.5.1563180991692; 
 Mon, 15 Jul 2019 01:56:31 -0700 (PDT)
Received: from wafer.ozlabs.ibm.com.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id d14sm22514815pfo.154.2019.07.15.01.56.29
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 01:56:31 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 4/5] powerpc/eeh_sysfs: Remove double pci_dn lookup.
Date: Mon, 15 Jul 2019 18:56:11 +1000
Message-Id: <20190715085612.8802-5-oohall@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190715085612.8802-1-oohall@gmail.com>
References: <20190715085612.8802-1-oohall@gmail.com>
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
Cc: sbobroff@linux.ibm.com, Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In eeh_notify_resume_show() the pci_dn for the device is looked up once in
the declaration block and then once after checking for a NULL eeh_dev.
Remove the second lookup since it's pointless.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/kernel/eeh_sysfs.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/kernel/eeh_sysfs.c b/arch/powerpc/kernel/eeh_sysfs.c
index 3adf8cd..c4cc8fc 100644
--- a/arch/powerpc/kernel/eeh_sysfs.c
+++ b/arch/powerpc/kernel/eeh_sysfs.c
@@ -102,7 +102,6 @@ static ssize_t eeh_notify_resume_show(struct device *dev,
 	if (!edev || !edev->pe)
 		return -ENODEV;
 
-	pdn = pci_get_pdn(pdev);
 	return sprintf(buf, "%d\n", pdn->last_allow_rc);
 }
 
-- 
2.9.5

