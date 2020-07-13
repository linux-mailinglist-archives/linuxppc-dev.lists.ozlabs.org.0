Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFF521D715
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jul 2020 15:26:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B54Dj2ChxzDqLJ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jul 2020 23:26:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::644;
 helo=mail-ej1-x644.google.com; envelope-from=refactormyself@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=FTWOqfbp; dkim-atps=neutral
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B548L2NNZzDqQh
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jul 2020 23:22:58 +1000 (AEST)
Received: by mail-ej1-x644.google.com with SMTP id ga4so17129221ejb.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jul 2020 06:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=DdekBSMp1R6DMOi8Ubgu/NKkVYPxPUhZ+i21xkvtPe8=;
 b=FTWOqfbply9IuxFuX4WbClT+NDxhwIxjM5Ro3JMMJvWUF/qmT2QqYgn9mPlI4ZQhXi
 v2c89Y7pRNNIkGHanZbWp714th0k6d/h/SqBbsn+TQXTvtHl1WfGUK+WeRAROyk9zne2
 GtYuFQG89vv7dtXuHtwkzzKJDhwHfvwWHwTbjCOUd9cUdw41wUN78Ov22kBOR8YHFYQ5
 wrBmxb1+4kdpnw2QV/j7UQp6iZ+bvCdiStFmNnTvD3pP+jCsVYww9Dxnz3+0lznY6oNv
 4kZM5mNHRH1z1WUnoN3xGqKrYKvdrXbBTYmFSue4FHdg/I3vdUFls2hkGjyHozP9urHc
 yikA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=DdekBSMp1R6DMOi8Ubgu/NKkVYPxPUhZ+i21xkvtPe8=;
 b=eq2aqcor0MTAS8rFfIIXkoMpXYAPLsgykAD7FihvNsr8kpQMD9z0Q3oepbdt5k2uKg
 jHFay/K2I/UrMnkOhR24437G5TCTQS8nGBBRHZK/SrYbnRzwGdqLlbaYvHS7C/1isThL
 kljpYPLZ9B0GSEFm+3bcX6Szp4y0O00Dd+UvgM3CJVL8Nj/k+8PKruEn+vzkBENEm0hA
 qe2eJZyhfC5bmlfyOZAyHs7W2uX5gyM8SVPApyMCOvnOdbv6tTpsKoiFCg2GeHcUmrJa
 UcyCzC2b4cNH51EuRVo7ancvyl64dnORolUdigukmgdC+DUt7I9SjIA2NKV2KC1rLdSk
 0f4Q==
X-Gm-Message-State: AOAM532JjDCRYiEi6TYYyNcVn/+7veNNVTlkjzEwQ+jQKoSfVkDhmukr
 iIMtCsrqgtXb689ZH03wJG6QDEtAKkqH3w==
X-Google-Smtp-Source: ABdhPJwlZKUK04d4vumCE1XKJSvgTpI1XxdiZZmiZ06iFJo6g09xUAqwOaAm7kBfWxZHFEZ22od4hg==
X-Received: by 2002:a17:906:6606:: with SMTP id
 b6mr77145046ejp.102.1594646575134; 
 Mon, 13 Jul 2020 06:22:55 -0700 (PDT)
Received: from net.saheed (54007186.dsl.pool.telekom.hu. [84.0.113.134])
 by smtp.gmail.com with ESMTPSA id n9sm11806540edr.46.2020.07.13.06.22.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 06:22:54 -0700 (PDT)
From: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To: helgaas@kernel.org, Frederic Barrat <fbarrat@linux.ibm.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [RFC PATCH 13/35] cxl: Change PCIBIOS_SUCCESSFUL to 0
Date: Mon, 13 Jul 2020 14:22:25 +0200
Message-Id: <20200713122247.10985-14-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20200713122247.10985-1-refactormyself@gmail.com>
References: <20200713122247.10985-1-refactormyself@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org,
 "Saheed O. Bolarinwa" <refactormyself@gmail.com>, skhan@linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, bjorn@helgaas.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In reference to the PCI spec (Chapter 2), PCIBIOS* is an x86 concept.
There scope should be limited within arch/x86.

Change all PCIBIOS_SUCCESSFUL to 0

Signed-off-by: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
---
 drivers/misc/cxl/vphb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/cxl/vphb.c b/drivers/misc/cxl/vphb.c
index 1cf320e2a415..1264253cc07b 100644
--- a/drivers/misc/cxl/vphb.c
+++ b/drivers/misc/cxl/vphb.c
@@ -150,7 +150,7 @@ static int cxl_pcie_read_config(struct pci_bus *bus, unsigned int devfn,
 
 out:
 	cxl_afu_configured_put(afu);
-	return rc ? PCIBIOS_DEVICE_NOT_FOUND : PCIBIOS_SUCCESSFUL;
+	return rc ? PCIBIOS_DEVICE_NOT_FOUND : 0;
 }
 
 static int cxl_pcie_write_config(struct pci_bus *bus, unsigned int devfn,
@@ -184,7 +184,7 @@ static int cxl_pcie_write_config(struct pci_bus *bus, unsigned int devfn,
 
 out:
 	cxl_afu_configured_put(afu);
-	return rc ? PCIBIOS_SET_FAILED : PCIBIOS_SUCCESSFUL;
+	return rc ? PCIBIOS_SET_FAILED : 0;
 }
 
 static struct pci_ops cxl_pcie_pci_ops =
-- 
2.18.2

