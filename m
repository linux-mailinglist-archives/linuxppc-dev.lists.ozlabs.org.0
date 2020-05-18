Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B2A1D8A90
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 May 2020 00:16:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49QtdW4lkSzDqkW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 May 2020 08:16:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=gustavoars@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=ZRWpi2Sm; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49QtbJ1ns4zDqPg
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 May 2020 08:14:19 +1000 (AEST)
Received: from embeddedor (unknown [189.207.59.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DC2062081A;
 Mon, 18 May 2020 22:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589840057;
 bh=onfFTV2EHN95M3D7dQOFHRH3PPQXSDCcX3o8p3KOPZ0=;
 h=Date:From:To:Cc:Subject:From;
 b=ZRWpi2SmYbpuYdb5oz+hDLU8XiiN4QEZj2hJutTRJftiKi1WLPyBj7tPr9UzuoBwS
 VO6qxp10IIaWhM85ElMDSGVMilvYdd2XmeQ/Nyl4U63CWKMUpry0y9pg+dy2yC7PEX
 3C5oLaFwGgIUbzZeStStjKDxlFAWo+VT8ykoUIq4=
Date: Mon, 18 May 2020 17:19:04 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>
Subject: [PATCH] soc: fsl: qe: Replace one-element array and use
 struct_size() helper
Message-ID: <20200518221904.GA22274@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Kees Cook <keescook@chromium.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The current codebase makes use of one-element arrays in the following
form:

struct something {
    int length;
    u8 data[1];
};

struct something *instance;

instance = kmalloc(sizeof(*instance) + size, GFP_KERNEL);
instance->length = size;
memcpy(instance->data, source, size);

but the preferred mechanism to declare variable-length types such as
these ones is a flexible array member[1][2], introduced in C99:

struct foo {
        int stuff;
        struct boo array[];
};

By making use of the mechanism above, we will get a compiler warning
in case the flexible array does not occur last in the structure, which
will help us prevent some kind of undefined behavior bugs from being
inadvertently introduced[3] to the codebase from now on. So, replace
the one-element array with a flexible-array member.

Also, make use of the new struct_size() helper to properly calculate the
size of struct qe_firmware.

This issue was found with the help of Coccinelle and, audited and fixed
_manually_.

[1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
[2] https://github.com/KSPP/linux/issues/21
[3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/soc/fsl/qe/qe.c | 4 ++--
 include/soc/fsl/qe/qe.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/fsl/qe/qe.c b/drivers/soc/fsl/qe/qe.c
index 447146861c2c1..2df20d6f85fa4 100644
--- a/drivers/soc/fsl/qe/qe.c
+++ b/drivers/soc/fsl/qe/qe.c
@@ -448,7 +448,7 @@ int qe_upload_firmware(const struct qe_firmware *firmware)
 	unsigned int i;
 	unsigned int j;
 	u32 crc;
-	size_t calc_size = sizeof(struct qe_firmware);
+	size_t calc_size;
 	size_t length;
 	const struct qe_header *hdr;
 
@@ -480,7 +480,7 @@ int qe_upload_firmware(const struct qe_firmware *firmware)
 	}
 
 	/* Validate the length and check if there's a CRC */
-	calc_size += (firmware->count - 1) * sizeof(struct qe_microcode);
+	calc_size = struct_size(firmware, microcode, firmware->count);
 
 	for (i = 0; i < firmware->count; i++)
 		/*
diff --git a/include/soc/fsl/qe/qe.h b/include/soc/fsl/qe/qe.h
index e282ac01ec081..3feddfec9f87d 100644
--- a/include/soc/fsl/qe/qe.h
+++ b/include/soc/fsl/qe/qe.h
@@ -307,7 +307,7 @@ struct qe_firmware {
 		u8 revision;		/* The microcode version revision */
 		u8 padding;		/* Reserved, for alignment */
 		u8 reserved[4];		/* Reserved, for future expansion */
-	} __attribute__ ((packed)) microcode[1];
+	} __packed microcode[];
 	/* All microcode binaries should be located here */
 	/* CRC32 should be located here, after the microcode binaries */
 } __attribute__ ((packed));
-- 
2.26.2

