Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3624219F3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 00:24:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNZyx1cHMz3cXj
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 09:24:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=E+TFvkLS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52b;
 helo=mail-pg1-x52b.google.com; envelope-from=naveennaidu479@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=E+TFvkLS; dkim-atps=neutral
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNMyG1MgWz2yJx
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Oct 2021 01:08:38 +1100 (AEDT)
Received: by mail-pg1-x52b.google.com with SMTP id h3so6001705pgb.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Oct 2021 07:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FR6K5YUYcCv1FDH4y5DK0PhIoCQEDWlRf94cnPNCwds=;
 b=E+TFvkLSQJvOplJzbRd6c4bA6eLdXlCzyriCZA5Wqc5TF+e74RZsBLXqc+tXDXAo/q
 UT8xkQl/rR1/w3AnnhPL/CbF0ZIkA/LvQ6x6fuWClo9NoC4MJwQXx0YQhvAs5AaXZf/I
 qkoxe/YLVKpRnpMmU1vZUjYBdXK5GaAJn1g0qNajQ0H5Dom4MkRP2/ffU1Y2vqx6hmhs
 EJcNuEt7Rfc6ie3j7rn6pJHwM8SeyKzzZPY87cBOiVYdWOY3FAeNnddsOtEJc5Cwm7rm
 fJQVevf8GK/Lm14YRbw5ihnNv7QdHEn1R2+B/FhHolky0LEd05k0bvAmqWrQZ/0+rwjS
 rSRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FR6K5YUYcCv1FDH4y5DK0PhIoCQEDWlRf94cnPNCwds=;
 b=nzvsEbQzbfYgaZbiFYJAYFv1GpVLfexcU686MpkbF9GlDCU3r9l11aGg6u6hOzPlAm
 gbK2PT5tDXF6WZoSOPVuguz8Ingw3mbQFOH5S+rmy5DygwumFKfWEDctAAQVxg/awHd/
 DaF6nuHOPFCBPiq+p5CkUdcRFJL/TLHQq07F5vLGu+kkzXvYLmcntpRFx9J4vB/WlpGW
 cZ9I3pOhIvtvE8XsX4rKkUXRG1EMyubDTiehM5KtfPUvJ7KN2iGIBDhw7u2va4PPS3f1
 LUGRbL04S6QSr0oNNBrRHdGwWIonRz6Op8GhhxFuI5W/MzvnztaFukOKvDpWZc2Lf3sB
 Qugg==
X-Gm-Message-State: AOAM53386/NIFzexJD3DHoK4hvHZWeiz0FdbElNiwnDwxRH2crh97xuM
 5X9QaMHHTcNoTLGCCG91am4=
X-Google-Smtp-Source: ABdhPJyck3KTFEhO5ILC3yxxjpAI2DOPtg7DvJQM0OSyr64tht7atYOar8FVU3irGbi8qaG1HdUo1A==
X-Received: by 2002:a63:7543:: with SMTP id f3mr11075085pgn.449.1633356515744; 
 Mon, 04 Oct 2021 07:08:35 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:e8f0:c2a7:3579:5fe8:31d9])
 by smtp.gmail.com with ESMTPSA id
 p2sm15274135pgd.84.2021.10.04.07.08.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 07:08:35 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com,
	ruscur@russell.cc,
	oohall@gmail.com
Subject: [PATCH v2 2/8] PCI: Cleanup struct aer_err_info
Date: Mon,  4 Oct 2021 19:36:28 +0530
Message-Id: <247efb0e4168393f4aee5e267a9aa8b3a8adff0f.1633353468.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1633353468.git.naveennaidu479@gmail.com>
References: <cover.1633353468.git.naveennaidu479@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 05 Oct 2021 09:16:56 +1100
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

