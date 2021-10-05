Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A75F422F0A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 19:20:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HP49c0b7tz3bN5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Oct 2021 04:20:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=A71fO3tG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b;
 helo=mail-pj1-x102b.google.com; envelope-from=naveennaidu479@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=A71fO3tG; dkim-atps=neutral
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HP48h0zlBz3bjW
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Oct 2021 04:20:04 +1100 (AEDT)
Received: by mail-pj1-x102b.google.com with SMTP id v19so133909pjh.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 Oct 2021 10:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FR6K5YUYcCv1FDH4y5DK0PhIoCQEDWlRf94cnPNCwds=;
 b=A71fO3tGGjwz+OnHBY6HhMFyXvWq8AS2PEZEnxn0QPthRZFnOLoiXs4GRkH44Fgdpl
 BCtSZsHnbMw+J/VBXutV0WFpyIh6lu9NnI7mlhc899K/fsgBufh5I5Oy5T+x6kEUwQT1
 P2O6Wt+F3bQOVRQayknlFt8VAXQCCJfG7jOBXgT+a9jEe+6Z251sGpvTCQajheWVGtiF
 TyqLt0U4e6fqJEcotNV7OM45+WmP0HTFw7QCuORT/mLLLLEcFm/GWJ3rej0agW1LW175
 d1Fnbb6vpOY8V/3u6Say7gT9+ej81ABLd+flMzAlKo1hUBgPyn5dtAR/zVNKWLwEmG2M
 jDFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FR6K5YUYcCv1FDH4y5DK0PhIoCQEDWlRf94cnPNCwds=;
 b=BVZTd9SlIqdrZqRSn/pdRMDVzaeXhc/sAELv5+kDz8h7YAP/0pAck76KvAGQKK85JX
 CG7uEaTyWCp+tgmDk/bOxmisALkPm59E8JkAJXoVKi+AlMCyMmWTb1+eu+Z44cxYskHK
 jsT2q4DkqXGUsMLIZD4kS9x6EoWK7K/XVkj3am9Et68ATaZgu13OGaZo6Xs+m2fe9yyu
 qP0Tb+cOKoyNzuvfINT2QxUejloclAQLUtqbwUOSre7pBs7NyIt3LVjPOGhdlg6K1quN
 S+t9AuGA0D9i1va7VmfTa4GBh7YSv9T+auWdUnXyKEQtq7AW2XehYyDtttm06Fy46V51
 sfeg==
X-Gm-Message-State: AOAM531L7VHIOvUcFNa9io3bGe7ZdT5yl/FOFyBWh0UsPCHWhkhiLjnv
 9x0SWy+/M8Az8VIeeWIwQ3Fnc7xrz/mBI4102+0=
X-Google-Smtp-Source: ABdhPJx6mC9P6YQA9us0MGZNTH690yOdvv8Qd05OPcQYLlWaJDLvVp/f+i52bWzPefweCBqHH8+YGQ==
X-Received: by 2002:a17:902:b093:b029:12c:843:b55a with SMTP id
 p19-20020a170902b093b029012c0843b55amr6271410plr.83.1633454401296; 
 Tue, 05 Oct 2021 10:20:01 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:f69:1127:b4ce:ef67:b718])
 by smtp.gmail.com with ESMTPSA id
 f25sm18476722pge.7.2021.10.05.10.19.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 10:20:00 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com,
	ruscur@russell.cc,
	oohall@gmail.com
Subject: [PATCH v4 2/8] PCI: Cleanup struct aer_err_info
Date: Tue,  5 Oct 2021 22:48:09 +0530
Message-Id: <a6f477dec0700f17933be993897114a7d7a5a282.1633453452.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1633453452.git.naveennaidu479@gmail.com>
References: <cover.1633453452.git.naveennaidu479@gmail.com>
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
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 Naveen Naidu <naveennaidu479@gmail.com>, skhan@linuxfoundation.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel-mentees@lists.linuxfoundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The id, status and the mask fields of the struct aer_err_info comes
directly from the registers, hence their sizes should be explicit.

The length of these registers are:
  - id: 16 bits - Represents the Error Source Requester ID
  - status: 32 bits - COR/UNCOR Error Status
  - mask: 32 bits - COR/UNCOR Error Mask

Since the length of the above registers are even, use u16 and u32
to represent their values.

Also remove the __pad fields.

"pahole" was run on the modified struct aer_err_info and the size
remains unchanged.

Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
---
 drivers/pci/pci.h | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 1cce56c2aea0..9be7a966fda7 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -427,18 +427,16 @@ struct aer_err_info {
 	struct pci_dev *dev[AER_MAX_MULTI_ERR_DEVICES];
 	int error_dev_num;
 
-	unsigned int id:16;
+	u16	id;
 
 	unsigned int severity:2;	/* 0:NONFATAL | 1:FATAL | 2:COR */
-	unsigned int __pad1:5;
 	unsigned int multi_error_valid:1;
 
 	unsigned int first_error:5;
-	unsigned int __pad2:2;
 	unsigned int tlp_header_valid:1;
 
-	unsigned int status;		/* COR/UNCOR Error Status */
-	unsigned int mask;		/* COR/UNCOR Error Mask */
+	u32 status;		/* COR/UNCOR Error Status */
+	u32 mask;		/* COR/UNCOR Error Mask */
 	struct aer_header_log_regs tlp;	/* TLP Header */
 };
 
-- 
2.25.1

