Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E90B3C6772
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jul 2021 02:25:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GP1dG4h0pz30BH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jul 2021 10:25:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.221.43; helo=mail-wr1-f43.google.com;
 envelope-from=kswilczynski@gmail.com; receiver=<UNKNOWN>)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GP1cs5ZbQz2yMq
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jul 2021 10:25:32 +1000 (AEST)
Received: by mail-wr1-f43.google.com with SMTP id d12so27390376wre.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jul 2021 17:25:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bui7AgdPIiwwrYwMh79xgVS7mq+OX7ceu5SE/Hq8sVc=;
 b=tCacwCiukxmqaIRuLL9DDtRL3ICyw6KQ2r71lm8cZcP13GkScueuCg+cva+0dGFnal
 0XeXOq7DpWQj2qOFM0f4EOHHDa9WxiJkRmiNPpdu0jCfIh2r17o97KBcxURxRh6qdupD
 DzpWsT01nRh3K1vhGm8KdxbFXUzGASIfF8Vyxk7Hb39gcf368fGAD7xLEAiRpoDCCuCH
 N8Gv9zyk9ToPfyUBD1mn9BTy7MhE6MKcsax7AaQIXaYF/18qUPTE/vt39K2bmUylqetd
 jTXoXnyWR0nRT2exRY6/UmVaLKlHtx3YxUvdlOvBBFlzmbZyy9bDyj/tAC9ot2CjM8AZ
 MDYQ==
X-Gm-Message-State: AOAM530V6jdwokJuKGf2UYGMSFKLGw3Md3HwJqxWRfMuKtBAnEkHmgMF
 4goiBJQgJWQ5BJXhzTH4T2U=
X-Google-Smtp-Source: ABdhPJwBMvQ6lKonrvm8WyUjCvo327ju2Dz8Wj7wvkaN1fP7TiUWp6kySHD0TLvAM1NwWrQHjogLyA==
X-Received: by 2002:a5d:6ac4:: with SMTP id u4mr1997170wrw.166.1626135928773; 
 Mon, 12 Jul 2021 17:25:28 -0700 (PDT)
Received: from workstation.lan ([95.155.85.46])
 by smtp.gmail.com with ESMTPSA id p5sm38895wme.2.2021.07.12.17.25.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 17:25:28 -0700 (PDT)
From: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH 2/2] powerpc/eeh: Use pcie_reset_state_t type in function
 arguments
Date: Tue, 13 Jul 2021 00:25:25 +0000
Message-Id: <20210713002525.203840-2-kw@linux.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210713002525.203840-1-kw@linux.com>
References: <20210713002525.203840-1-kw@linux.com>
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
Cc: linux-pci@vger.kernel.org, Oliver O'Halloran <oohall@gmail.com>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pcie_reset_state_t type has been introduced in the commit
f7bdd12d234d ("pci: New PCI-E reset API") along with the enum
pcie_reset_state, but it has never been used for anything else
other than to define the members of the enumeration set in the
enum pcie_reset_state.

Thus, replace the direct use of enum pcie_reset_state in function
arguments and replace it with pcie_reset_state_t type so that the
argument type matches the type used in enum pcie_reset_state.

Signed-off-by: Krzysztof Wilczyński <kw@linux.com>
---
 arch/powerpc/kernel/eeh.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
index 3bbdcc86d01b..15485abb89ff 100644
--- a/arch/powerpc/kernel/eeh.c
+++ b/arch/powerpc/kernel/eeh.c
@@ -714,7 +714,7 @@ static void eeh_restore_dev_state(struct eeh_dev *edev, void *userdata)
  * Return value:
  * 	0 if success
  */
-int pcibios_set_pcie_reset_state(struct pci_dev *dev, enum pcie_reset_state state)
+int pcibios_set_pcie_reset_state(struct pci_dev *dev, pcie_reset_state_t state)
 {
 	struct eeh_dev *edev = pci_dev_to_eeh_dev(dev);
 	struct eeh_pe *pe = eeh_dev_to_pe(edev);
-- 
2.32.0

