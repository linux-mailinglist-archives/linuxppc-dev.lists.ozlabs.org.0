Return-Path: <linuxppc-dev+bounces-11606-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA30B3F687
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Sep 2025 09:22:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cGHHh1ZJ0z30Pl;
	Tue,  2 Sep 2025 17:22:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::432"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756797728;
	cv=none; b=i6Xg5OT2NGM5dulD5xkWxIXG0NxXoj+OlGMCESNoBtnL8euzt461ibpka71REeXjSA7GPRKMf3d5vaGQSwyNR+PLBfb3Phy5AEz9zCj80+T6bnI1NnRAmsRRdxkxsleikhAEOQrKwZzVdN1Resw+jLBbSTJ7FgjuBx4c7cC4tKq1/tXYrd7AVXboXYzEKoBMrPL28arjGFuE0QB5PrWyqBx3VIA6YkQOyhtX6F7gLQX5Lr9j6filOl1kwMSvN+wlgwM9AnsLsBUWbOO2DhRH/GTfp8otp+IUXqCtD9cwwL7ol2/VojSbDlW2bBK+K0dZbd2FeVov1LH7HjD1HLj60w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756797728; c=relaxed/relaxed;
	bh=yw3ri99gw13iWXBHvxxwi8geR8Fc/9352q/ntmyST8w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HLb0RXBF6wQEfcfUmwewZ0U3eLzv9SIj4IQiFRep0X/1h2W+JJLb5xP92BStQUoJpDcK5hn5MgF7hpZSFgKYsAe+Gzg7v4MivdWVyMdcWK25Gtt5xyywkD+QyaOJog3yg6Pm8MmUfNuzQxhMLEvewvA2k74P2FuDBO6kzcLFkSv+Z9xbBIvKvSzUI+uuEQ3nxjEV4l1GIqidWUSbMi0I+wwa7vOjljFxJDPh0BUbBHfb6dfSXcYRca6v/f7rGT6Xncb2EJcalIcFToL91A0PB412nZrVyED1zsqH6Dl791ppeRMa3rsbyDqfKMpY61Liwpg0fRN1CPQzpPQ1OxBxmQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GihNaPgL; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=linmq006@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GihNaPgL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=linmq006@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cGHHg2YXGz30PF
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Sep 2025 17:22:06 +1000 (AEST)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-772301f8ae2so2709812b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 02 Sep 2025 00:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756797724; x=1757402524; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yw3ri99gw13iWXBHvxxwi8geR8Fc/9352q/ntmyST8w=;
        b=GihNaPgLqkEzP6ucvr134wGErfUqrI1SUTyqkBXl4AAruhj6HXhAD/kIDChE3jsXph
         mLSawd1oXECXB/0j/5N82o6cf7Eua0LhAcJSCIPaVK3V5a03Xoj8qeJYN1eqX8/8CUl/
         iPMvr4SsDTrM6cZPAUeZydc6WFgr6PXi8SasyMqvgAUE8kpb22PSCW5M6I68qd1N47f0
         rrU5JYUKgL903tJfGywhSz1qYefHPXMCJEvxDEVdFqiKjbo1KcmypdpFy9XGHY6TllKL
         3kvpWeCvb+2gwYFJ7OiwS2KQ7jX5T7WRccWQ+R0vssUV5maY5oRp9A2+PlF3SLR7NinY
         GYuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756797724; x=1757402524;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yw3ri99gw13iWXBHvxxwi8geR8Fc/9352q/ntmyST8w=;
        b=dlVlXZmpkZpUJFVvQxEJICCG/XKS5GJ2vv9p2JTqpnTViePjieYLG4CbuiboL/Ghu3
         oyDEwMzaSAQNAb5WiSi3lnCIRbz6LoER5OvLtwG2m/oTdoWpSPZRU44vVKQ0bPmOnDTX
         f0ffCHF0j7svvt0+kP+Mz7Q3/sG1KwbV6yJ3KSVA59U86EMpVDCLvvN4f+PTLAN2hwrh
         E6QXACnX2Xaxp+uN0Oeh+E6L93V7GY/+NKgAc2StLIBDki6NCxKp1k5a8WW/uS5PPY5n
         hQPHBWDfE+tBWDnD7pVzADJ1pPlWcr2C44kUgLWacll2MGMe7xC/1oXePyekNk8C245K
         Hqsg==
X-Forwarded-Encrypted: i=1; AJvYcCWxaBCf0vmfLJLlkKpHS4zQg5UC6vXwuPEnAw2e4Wjd9mz8Aqm3g9xdm2LQagFmTW0bY6MBhzG958gr4as=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxBAH01xCl0WSu1iCRO/QDMw2PfRg6U0wvIs99qU+koltITfWIg
	kRLirao04mCSi4JvPY7TJtMbIhuVe2C8GuDHDhi2tJuS2Jq7M5w/DlcC
X-Gm-Gg: ASbGncvIga0sOYEib9jf8uZVD9eVhGFCt4WFzVbiEMStAbYmSqE+UzzZA9RZes2itVn
	42yZJJxXIiL6uvEvuATu7URuozwOtZT87JJcMmkndVr+szUemrrdMCU8cQQPiSGe/KA6EdN/Olq
	YwevKiiGc0XseAO7VbOs9gNgmGo84o1fC+A3C3vPa3khATsEuwfwcA0MbjnQijAgar6Hba+4PyZ
	W5l/Wmninu9JgysLH1CGP6HUhRzdlHebDQI+jJAMmK2dwFlr6XUsr/VjKZtpsQuPll0LjIH9qGe
	NwdoAD0w0AjQn+Ol0g6zE2mfaBVnxgR843izZp1Q478C4+qPEytrRx0M7Wd75Lek7OQpbJBIL2N
	cDXGyk6fx3MoRqGXzfVUpvelafFmCF8BXHBJUjHPiXuWAt1sJ8t6EEQC8CVNqMLLeLpUwi4i7xI
	LR5AhTzoH/93JVLdOpp71YAULgGr4+dh2KIXtoPb10ki7+vcIyZFoOx70=
X-Google-Smtp-Source: AGHT+IFIaIH+HxoYGYo/EjS/CtIV0f/Ka2pgKDvXIF0gxHvnrn1RBnv+9myDrkVeBAH/CAPmc+gggQ==
X-Received: by 2002:a05:6a00:1a87:b0:772:114c:bcbb with SMTP id d2e1a72fcca58-7723e1f1804mr15229229b3a.4.1756797723879;
        Tue, 02 Sep 2025 00:22:03 -0700 (PDT)
Received: from vickymqlin-1vvu545oca.codev-2.svc.cluster.local ([14.22.11.165])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7722a4e1d4fsm12399630b3a.73.2025.09.02.00.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 00:22:03 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Miaoqian Lin <linmq006@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Mackerras <paulus@ozlabs.org>,
	Olof Johansson <olof@lixom.net>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH] pasemi: fix PCI device reference leaks in pas_setup_mce_regs
Date: Tue,  2 Sep 2025 15:21:54 +0800
Message-Id: <20250902072156.2389727-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.35.1
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Fix reference leaks where PCI device references
obtained via pci_get_device() were not being released:

1. The while loop that iterates through 0xa00a devices was not
   releasing the final device reference when the loop terminates.

2. Single device lookups for 0xa001 and 0xa009 devices were not
   releasing their references after use.

Add missing pci_dev_put() calls to ensure all device references
are properly released.

Fixes: cd7834167ffb ("[POWERPC] pasemi: Print more information at machine check")
Cc: stable@vger.kernel.org
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 arch/powerpc/platforms/pasemi/setup.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/powerpc/platforms/pasemi/setup.c b/arch/powerpc/platforms/pasemi/setup.c
index d03b41336901..dafbee3afd86 100644
--- a/arch/powerpc/platforms/pasemi/setup.c
+++ b/arch/powerpc/platforms/pasemi/setup.c
@@ -169,6 +169,8 @@ static int __init pas_setup_mce_regs(void)
 		dev = pci_get_device(PCI_VENDOR_ID_PASEMI, 0xa00a, dev);
 		reg++;
 	}
+	/* Release the last device reference from the while loop */
+	pci_dev_put(dev);
 
 	dev = pci_get_device(PCI_VENDOR_ID_PASEMI, 0xa001, NULL);
 	if (dev && reg+4 < MAX_MCE_REGS) {
@@ -185,6 +187,7 @@ static int __init pas_setup_mce_regs(void)
 		mce_regs[reg].addr = pasemi_pci_getcfgaddr(dev, 0xc1c);
 		reg++;
 	}
+	pci_dev_put(dev);
 
 	dev = pci_get_device(PCI_VENDOR_ID_PASEMI, 0xa009, NULL);
 	if (dev && reg+2 < MAX_MCE_REGS) {
@@ -195,6 +198,7 @@ static int __init pas_setup_mce_regs(void)
 		mce_regs[reg].addr = pasemi_pci_getcfgaddr(dev, 0x214);
 		reg++;
 	}
+	pci_dev_put(dev);
 
 	num_mce_regs = reg;
 
-- 
2.35.1


