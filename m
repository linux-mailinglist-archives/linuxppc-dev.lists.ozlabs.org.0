Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 219CA421A0F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 00:30:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNb5X6gpKz3fH7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 09:30:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=qv8zIopX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c;
 helo=mail-pj1-x102c.google.com; envelope-from=naveennaidu479@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=qv8zIopX; dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNNSv1snmz2yPW
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Oct 2021 01:31:43 +1100 (AEDT)
Received: by mail-pj1-x102c.google.com with SMTP id
 cs11-20020a17090af50b00b0019fe3df3dddso105190pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Oct 2021 07:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FR6K5YUYcCv1FDH4y5DK0PhIoCQEDWlRf94cnPNCwds=;
 b=qv8zIopXqjv7B/cSRZ3wFwRISLoio93IP+EmFxrBZNfRmhYbTplZEVW9dbeqkXSexO
 xC3ATUpxmJRydYGgHKT3jX9RRk2qOU7MqZ9BmxZ6Y3BlGHKqMrtbglNX/7S3JP+vJVNU
 U3qE9ecrnlJ5AaPehV0/Eud3IiTAY7+4moUA9fpjiLZjPLT92K24ftq6+UvV2j5Lovtd
 tqH2P7rgEp32UWbjhvU8aMXRoDyzlxgoq4DkDk/g6hBpL/LgNHnzh7D4kCZjvD9R7RYq
 yHs67pCK6OfFDCdXNQDTate3xFUKIr+gHHSHRPSOFAa4I1B0hh4WRKbU4PFzYDYT26Fl
 LsAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FR6K5YUYcCv1FDH4y5DK0PhIoCQEDWlRf94cnPNCwds=;
 b=dZW+eH9XfBn/Og4bvF44D3HHhRaluCRYLYLF36pHCrc380tLf6f2Akk7r5RtFD9/Za
 kiEbr7hdLne6nzNKibtv+b8RPvw8P+IR/COngUUCWKKIQ9Bn1YK0ZroD+5mrmCAsRw5Y
 kBVIO2FU9Ux95O5Amc2mAqb94Sq8Qzev8BweyPLkF/mMlczYMaosMvk2FpSx1nuei50c
 aur3i+b7WoOdsGWYmkQp/lda7GIJ00tZ6ygT1rfSmB8tAefM0u9RrQBVsYKyEAdTKQd4
 0gpjSw85V+4ukVUqjdYlzJDQwQmGk8fd3GUk+Pn1MEob5p0WoVblHIhP56/dzpu91mpK
 sTAw==
X-Gm-Message-State: AOAM531l3OpvAMmt0LNbB5TaVg8d/Rp9Zh1RDwDaAi44WLY93rFh2504
 5a8L7HCC1AXX4PximdL6NKcQMf801keojRxc
X-Google-Smtp-Source: ABdhPJzR4Ghi3JFA5L9/8cvKQIXgFoRIAEnS77Xg6YAAEkbaN1BHaaNb+r1kBF2MKHApzqX5Ds9q0g==
X-Received: by 2002:a17:90a:f287:: with SMTP id
 fs7mr9466092pjb.98.1633357901102; 
 Mon, 04 Oct 2021 07:31:41 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:e8f0:c2a7:3579:5fe8:31d9])
 by smtp.gmail.com with ESMTPSA id
 q3sm14489146pgf.18.2021.10.04.07.31.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 07:31:39 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com,
	ruscur@russell.cc,
	oohall@gmail.com
Subject: [PATCH v3 2/8] PCI: Cleanup struct aer_err_info
Date: Mon,  4 Oct 2021 19:59:58 +0530
Message-Id: <247efb0e4168393f4aee5e267a9aa8b3a8adff0f.1633357368.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1633357368.git.naveennaidu479@gmail.com>
References: <cover.1633357368.git.naveennaidu479@gmail.com>
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

