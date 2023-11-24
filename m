Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 597F67F6CAD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Nov 2023 08:15:28 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=dOhgPsu8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sc5q21vDWz3vvn
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Nov 2023 18:15:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=dOhgPsu8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ventanamicro.com (client-ip=2607:f8b0:4864:20::329; helo=mail-ot1-x329.google.com; envelope-from=apatel@ventanamicro.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sc5jg5NMlz3dK8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Nov 2023 18:10:47 +1100 (AEDT)
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-6ce322b62aeso833761a34.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Nov 2023 23:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1700809845; x=1701414645; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9bsP20n9g/LbbgzyTFqfc2H9X3ZVkLkHm6HS5kmWZpw=;
        b=dOhgPsu885GZTFxvA4rUOUBPyWecEV0+GOqSncDcFea0Kpg0UUzUeTT1a8jborlypZ
         BcCVNTgae2UvoM1nFPXHa9pUSbZI2eY7/JRy7XoYFSzWZuYP4i/T8jsOEZ7d3LJblHeM
         VCVby+TYTSacRcLUIcCzN/DEG1pmDSb34XSlW4HUzJElRDpbsgVGNoXIgP6bbDshTdRa
         eB8Y+TyOv0fUtptsbZdIo2ZiTuSaw4VDrRGzGtb5qcQPMhLbgqaYbbXJ3Gm2ZMrwpDNq
         MJydR5QBIIvgGBOKSipnXh+5XR16NbJwc1HQJuws1BbpOK8Qb3Xb+y8VOhefmgo3UzLs
         d3Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700809845; x=1701414645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9bsP20n9g/LbbgzyTFqfc2H9X3ZVkLkHm6HS5kmWZpw=;
        b=U0nUeTIw3ekdfTQ2YdfBBOvXVYCwt09mb1T0uUpS0XiMDHy1IWpFuNhCmIiclQ1cWS
         QKQLQqg+M9yZyufH4zh8B9zNCYlUtPe8eNedVMDqVIdGSR1navUZ/Y4qTdkrprQQgS9P
         lLv2A7+YvHS2rnYclhPgwc+0uoJV5nsH59FG9kopeRqKD1h61QAKhPH6+E8dmMnu4Iq9
         CzJDXzwohudMzdys+OmmUeegsRvl9RzKOCIpfhF1E4Ix9pHatpwPqtI6EmtLcYAo6lpb
         CUl0WiQoBO4LbxWKddO7l8sIqi2N1W9VfjGpyhIvyjOAS3YLFvV1+Y50CDOaSk1x1lnL
         UbOQ==
X-Gm-Message-State: AOJu0Yw4hH6Tveu1um/PB+woTHSFl2Up0dGQD8ygTQfzost8HFTZys/l
	NXiHHvMxQ1tnR30w3mTmAFdxYw==
X-Google-Smtp-Source: AGHT+IGGDyExhQ3zRmOy5VYh2TdS7wOyXrHh9UCot+XT8qVfR5TFj+v/PJ24bsMRy6r+bIsB3Xrfng==
X-Received: by 2002:a05:6830:18f1:b0:6ce:4035:b801 with SMTP id d17-20020a05683018f100b006ce4035b801mr2096169otf.13.1700809844751;
        Thu, 23 Nov 2023 23:10:44 -0800 (PST)
Received: from localhost.localdomain ([106.51.83.242])
        by smtp.gmail.com with ESMTPSA id e5-20020a9d7305000000b006c61c098d38sm435532otk.21.2023.11.23.23.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 23:10:44 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Subject: [PATCH v5 5/5] RISC-V: Enable SBI based earlycon support
Date: Fri, 24 Nov 2023 12:39:05 +0530
Message-Id: <20231124070905.1043092-6-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231124070905.1043092-1-apatel@ventanamicro.com>
References: <20231124070905.1043092-1-apatel@ventanamicro.com>
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
Cc: Anup Patel <apatel@ventanamicro.com>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, linux-serial@vger.kernel.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Andrew Jones <ajones@ventanamicro.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Let us enable SBI based earlycon support in defconfig for both RV32
and RV64 so that "earlycon=sbi" can be used again.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 905881282a7c..eaf34e871e30 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -149,6 +149,7 @@ CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SERIAL_8250_DW=y
 CONFIG_SERIAL_OF_PLATFORM=y
 CONFIG_SERIAL_SH_SCI=y
+CONFIG_SERIAL_EARLYCON_RISCV_SBI=y
 CONFIG_VIRTIO_CONSOLE=y
 CONFIG_HW_RANDOM=y
 CONFIG_HW_RANDOM_VIRTIO=y
-- 
2.34.1

