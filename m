Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F694234614
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jul 2020 14:46:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BJ6VK3Cd2zDqS3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jul 2020 22:46:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::643;
 helo=mail-ej1-x643.google.com; envelope-from=refactormyself@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=la4y7H95; dkim-atps=neutral
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BJ6QG0CZDzDqVv
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jul 2020 22:43:15 +1000 (AEST)
Received: by mail-ej1-x643.google.com with SMTP id d6so17454284ejr.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jul 2020 05:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=/Ag7HqTEQtYdyspkqndjVsChgoDS9cn0cuUanYprdzE=;
 b=la4y7H95zYX+4CoEy2KWgnwHd0vnmrS28bchsmakne3qS/Vr/Sky6Ev/YjdhUqhr2M
 XV6t+xXPeSq67btafNbmmSQyX6H9Yjj6rqvQ4qQ10ZNZfft55b6Mu1XvNLySCyeIhlo+
 FYjF95d8mEvYs/i4achpXV9/bc03XFcBlPd3IgZ1pmjARJ4NohyI4Ci0XDdgUmxZR6fL
 FiKXofe+k246mlqbVeBqo6MOCPJ9krPxzZ63zpFAoCbdXgJzl4i9pTg+xBnSFRcz8Css
 jdo5DKuyFa+YL0IdzZjS76IB3PCVBEPaTgDrC7DSGknO1gOfOpC1534vpFnEVCQUWdy4
 6Hjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=/Ag7HqTEQtYdyspkqndjVsChgoDS9cn0cuUanYprdzE=;
 b=LNkqLXdYVn1OzuxyQB+CjZnESSwBuDd3PViN7NYohi2WuwzwncJ66GB43LzrquZa/8
 zHTMAU3y91gua51FGpxpZd2uNHKMSvd9DkHBTfmxue/IV8ZF8U1Sj0/a3KqDMAcQpJOB
 AQsgVWyABStq6MteisibqdH9fgI0Qf/u/Y3g73k88zFDS6fyQadA8JyrcZ2d3Ad4qkuW
 l2qKZ35HxgL9C4IJFgB7B+trld9XhN2Os66OMfublHKKhoEf9xZAOy1S6GESHN6A0jpe
 VMIG8czEDw1/cu5a7duVQ4cFN8BAj3HDHGV2Hp79ycG+7btpmFnGGUpFADz38kcdlz5r
 tKeA==
X-Gm-Message-State: AOAM532AJBZM4z5tTUjMBHqGivR46m7shIp6AkaO50WlmxJrKaOr6wQg
 0wij7vyj9WsGpVMTXT0DlwY=
X-Google-Smtp-Source: ABdhPJxazhT1zvPbkIt354Q4EdFJPin4xMuEu5PAgWug8jOv4Gl1YG1P2lHcWL7ADSCeylA9M/RQ7Q==
X-Received: by 2002:a17:906:7855:: with SMTP id
 p21mr3869401ejm.492.1596199391572; 
 Fri, 31 Jul 2020 05:43:11 -0700 (PDT)
Received: from net.saheed (95C84E0A.dsl.pool.telekom.hu. [149.200.78.10])
 by smtp.gmail.com with ESMTPSA id g23sm8668514ejb.24.2020.07.31.05.43.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2020 05:43:11 -0700 (PDT)
From: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To: helgaas@kernel.org, Russell Currey <ruscur@russell.cc>,
 Sam Bobroff <sbobroff@linux.ibm.com>,
 "Oliver O'Halloran" <oohall@gmail.com>
Subject: [PATCH v4 10/12] PCI/AER: Check if pcie_capability_read_*() reads ~0
Date: Fri, 31 Jul 2020 13:43:27 +0200
Message-Id: <20200731114329.100848-3-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20200731114329.100848-1-refactormyself@gmail.com>
References: <20200731114329.100848-1-refactormyself@gmail.com>
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
Cc: "Saheed O. Bolarinwa" <refactormyself@gmail.com>, skhan@linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, bjorn@helgaas.com,
 linuxppc-dev@lists.ozlabs.org, linux-kernel-mentees@lists.linuxfoundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On failure pcie_capability_read_*() sets it's last parameter, val
to 0. However, with Patch 12/12, it is possible that val is set
to ~0 on failure. This would introduce a bug because
(x & x) == (~0 & x).

Since ~0 is an invalid value in here,

Add extra check for ~0 to the if condition to confirm failure.

Suggested-by: Bjorn Helgaas <bjorn@helgaas.com>
Signed-off-by: Saheed O. Bolarinwa <refactormyself@gmail.com>
---
 drivers/pci/pcie/aer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index 3acf56683915..dbeabc370efc 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -829,7 +829,7 @@ static bool is_error_source(struct pci_dev *dev, struct aer_err_info *e_info)
 
 	/* Check if AER is enabled */
 	pcie_capability_read_word(dev, PCI_EXP_DEVCTL, &reg16);
-	if (!(reg16 & PCI_EXP_AER_FLAGS))
+	if ((reg16 == (u16)~0) || !(reg16 & PCI_EXP_AER_FLAGS))
 		return false;
 
 	if (!aer)
-- 
2.18.4

