Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C3A377AED
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 May 2021 06:15:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FdnlS1GwMz3082
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 May 2021 14:15:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.218.44; helo=mail-ej1-f44.google.com;
 envelope-from=kswilczynski@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fdnkc0wJfz2yRX
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 May 2021 14:14:31 +1000 (AEST)
Received: by mail-ej1-f44.google.com with SMTP id a4so22441859ejk.1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 09 May 2021 21:14:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yG00XpORYp9fWIwYNYumtIx0DbQmOEgAaM8O8RiTCBg=;
 b=HQHTCpaAHNG1ClsXLFgrNnjBpOFqhJvCj/LynSkzd977ffZq4V34UWLpXlwxIrdebs
 I90kBPPtg0N4gxgItBHVWk+fdaxn0Dr03w7GNzmddbXy2IBNGWpVVxFLX0ahk2pBtSta
 g/LMS/N4YkkNziCMmJYC5cG/ZTIxN8QqiCW1mYv/L512PK7zOgta2O6oCPnRpgZ6UMey
 XhX/yp5g94fyvfKKtF5sYMHlVhwP06/eo5jMfE5lvFv/E2wBjfHiiTe3gibkS7z5M1+7
 4tfbr0Ma81gUhDE/AjGJgcIMSLfxUFBYu+YruNwHcGiANPTC1qNBqZfG5YWtovn7u5jx
 nsgA==
X-Gm-Message-State: AOAM531VbzBdVu0UgitAepcbSnW0TkM0lnLWLTtkACjUjj3GkurMil+h
 u5mJxUsvbt0/YXOHOapmynA=
X-Google-Smtp-Source: ABdhPJyJeQPSRJV9jJWYAjEQGkNIBh1uh1Jil7dgPsc1o2RkXPUJpNn61pvdKGmYpGTBlGGSR+C90w==
X-Received: by 2002:a17:907:7216:: with SMTP id
 dr22mr23759582ejc.185.1620620065913; 
 Sun, 09 May 2021 21:14:25 -0700 (PDT)
Received: from workstation.lan ([95.155.85.46])
 by smtp.gmail.com with ESMTPSA id e4sm8165006ejh.98.2021.05.09.21.14.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 May 2021 21:14:25 -0700 (PDT)
From: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH 01/11] PCI: Use sysfs_emit() and sysfs_emit_at() in "show"
 functions
Date: Mon, 10 May 2021 04:14:14 +0000
Message-Id: <20210510041424.233565-1-kw@linux.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, linux-pci@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Oliver O'Halloran <oohall@gmail.com>,
 Paul Mackerras <paulus@samba.org>,
 Kurt Schwemmer <kurt.schwemmer@microsemi.com>,
 Logan Gunthorpe <logang@deltatee.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The sysfs_emit() and sysfs_emit_at() functions were introduced to make
it less ambiguous which function is preferred when writing to the output
buffer in a device attribute's "show" callback [1].

Convert the PCI sysfs object "show" functions from sprintf(), snprintf()
and scnprintf() to sysfs_emit() and sysfs_emit_at() accordingly, as the
latter is aware of the PAGE_SIZE buffer and correctly returns the number
of bytes written into the buffer.

No functional change intended.

[1] Documentation/filesystems/sysfs.rst

Related to:
  commit ad025f8e46f3 ("PCI/sysfs: Use sysfs_emit() and sysfs_emit_at() in "show" functions")

Signed-off-by: Krzysztof Wilczyński <kw@linux.com>
---
 drivers/pci/pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index b717680377a9..5ed316ea5831 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -6439,7 +6439,7 @@ static ssize_t resource_alignment_show(struct bus_type *bus, char *buf)
 
 	spin_lock(&resource_alignment_lock);
 	if (resource_alignment_param)
-		count = scnprintf(buf, PAGE_SIZE, "%s", resource_alignment_param);
+		count = sysfs_emit(buf, "%s", resource_alignment_param);
 	spin_unlock(&resource_alignment_lock);
 
 	/*
-- 
2.31.1

