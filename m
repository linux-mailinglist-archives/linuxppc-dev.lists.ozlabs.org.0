Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0711521632E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 02:54:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B13qL2GVlzDqTv
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 10:54:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f44;
 helo=mail-qv1-xf44.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=aiktmtNj; dkim-atps=neutral
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com
 [IPv6:2607:f8b0:4864:20::f44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B13jS4cnRzDqdg
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jul 2020 10:49:15 +1000 (AEST)
Received: by mail-qv1-xf44.google.com with SMTP id di5so13188886qvb.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Jul 2020 17:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nupjNinoHUh+uunJaY1+lviIz5/yMs8Gt+iI8FGKf1E=;
 b=aiktmtNj5ZAoNyPO1vLNFxBZIg4wlgHK6Lj3LTR6TuvRNwIUv7FlYq7hz36B/C9zYu
 JQxB8ajz6Wqk4BEOOWRLZDtOgTwRvJ3enGHwNIPJzN0MlvRp5i4zdcsgT5KVGLkhWMWx
 Ze/izcWhua9ygTYA0VHp9wTGxaBtuxstHphkPkNzxWTyO2FNRAPW83yZSTzICoi9w7j6
 JHxnWX2NjjQ5ryqTQpVaOvI42+H20BPKcrIzezzNDzujgticoI78gSt6M6ZPY95sv8uN
 poI9ocj5Y6sM8hhmljMdl9WFWCnFoFLjjRKN1ia4Ig+DmbrkMXP3Z+R5cJJuKm0u8Zvw
 LEIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nupjNinoHUh+uunJaY1+lviIz5/yMs8Gt+iI8FGKf1E=;
 b=uajBoy5epTFPo01T3F8/MoFnO66eQUHwVYNzVSIVT2zl4qLDvuxYnfWhl/78JKU9Yb
 QagSAFT+w+61X8CLg28ihbCDOcvgF4vEEbxR8TBpNHN872Px4Nv52NI+Kx8Nov2K+Ry3
 YLNdEdUktDIDgSdvUvXdfjjuzFpzjIfA6VupvYHrLA+hXS5YKXF7EklShV3ubik5IyGy
 wX+AjSepjcWOP52UpO3x+nbcaYVey/P43khm4b3NIbc5nyz7u/nlut40TM72R9X8nh7b
 gJSSYB7/X13FyeSPoK3lV/oqsAgpeGPL89tOPpiucSrFwAu0vYDxL9GFZ/zyTtM7mStW
 n2Mw==
X-Gm-Message-State: AOAM533EFTF43UphOh8jVhJApo4AX+HO6fSSEOpApZmMIRlGZ6P8oH+6
 9o6H2QiDVmHWGfMk+O1meg4=
X-Google-Smtp-Source: ABdhPJztRm0dtfm0yUaV6CFQuiSny4WpTBoh+ADVnQgav5R2Q07nHdng/u3kPPaGv8DoqtC4hoHQ0Q==
X-Received: by 2002:a05:6214:289:: with SMTP id
 l9mr41967514qvv.238.1594082950616; 
 Mon, 06 Jul 2020 17:49:10 -0700 (PDT)
Received: from localhost.localdomain (179-125-148-98.dynamic.desktop.com.br.
 [179.125.148.98])
 by smtp.gmail.com with ESMTPSA id d23sm24413636qtk.97.2020.07.06.17.49.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2020 17:49:09 -0700 (PDT)
From: Leonardo Bras <leobras.c@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
 Bharata B Rao <bharata@linux.ibm.com>, Leonardo Bras <leobras.c@gmail.com>,
 Vaibhav Jain <vaibhav@linux.ibm.com>,
 Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
Subject: [PATCH 1/1] KVM/PPC: Fix typo on H_DISABLE_AND_GET hcall
Date: Mon,  6 Jul 2020 21:48:12 -0300
Message-Id: <20200707004812.190765-1-leobras.c@gmail.com>
X-Mailer: git-send-email 2.25.4
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On PAPR+ the hcall() on 0x1B0 is called H_DISABLE_AND_GET, but got
defined as H_DISABLE_AND_GETC instead.

This define was introduced with a typo in commit <b13a96cfb055>
("[PATCH] powerpc: Extends HCALL interface for InfiniBand usage"), and was
later used without having the typo noticed.

Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
---
 arch/powerpc/include/asm/hvcall.h            | 2 +-
 arch/powerpc/kvm/trace_hv.h                  | 2 +-
 tools/perf/arch/powerpc/util/book3s_hcalls.h | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/hvcall.h b/arch/powerpc/include/asm/hvcall.h
index e90c073e437e..d8ada9c7ec78 100644
--- a/arch/powerpc/include/asm/hvcall.h
+++ b/arch/powerpc/include/asm/hvcall.h
@@ -237,7 +237,7 @@
 #define H_CREATE_RPT            0x1A4
 #define H_REMOVE_RPT            0x1A8
 #define H_REGISTER_RPAGES       0x1AC
-#define H_DISABLE_AND_GETC      0x1B0
+#define H_DISABLE_AND_GET       0x1B0
 #define H_ERROR_DATA            0x1B4
 #define H_GET_HCA_INFO          0x1B8
 #define H_GET_PERF_COUNT        0x1BC
diff --git a/arch/powerpc/kvm/trace_hv.h b/arch/powerpc/kvm/trace_hv.h
index 4a61a971c34e..830a126e095d 100644
--- a/arch/powerpc/kvm/trace_hv.h
+++ b/arch/powerpc/kvm/trace_hv.h
@@ -89,7 +89,7 @@
 	{H_CREATE_RPT,			"H_CREATE_RPT"}, \
 	{H_REMOVE_RPT,			"H_REMOVE_RPT"}, \
 	{H_REGISTER_RPAGES,		"H_REGISTER_RPAGES"}, \
-	{H_DISABLE_AND_GETC,		"H_DISABLE_AND_GETC"}, \
+	{H_DISABLE_AND_GET,		"H_DISABLE_AND_GET"}, \
 	{H_ERROR_DATA,			"H_ERROR_DATA"}, \
 	{H_GET_HCA_INFO,		"H_GET_HCA_INFO"}, \
 	{H_GET_PERF_COUNT,		"H_GET_PERF_COUNT"}, \
diff --git a/tools/perf/arch/powerpc/util/book3s_hcalls.h b/tools/perf/arch/powerpc/util/book3s_hcalls.h
index 54cfa0530e86..488f4339b83c 100644
--- a/tools/perf/arch/powerpc/util/book3s_hcalls.h
+++ b/tools/perf/arch/powerpc/util/book3s_hcalls.h
@@ -84,7 +84,7 @@
 	{0x1a4, "H_CREATE_RPT"},				\
 	{0x1a8, "H_REMOVE_RPT"},				\
 	{0x1ac, "H_REGISTER_RPAGES"},				\
-	{0x1b0, "H_DISABLE_AND_GETC"},				\
+	{0x1b0, "H_DISABLE_AND_GET"},				\
 	{0x1b4, "H_ERROR_DATA"},				\
 	{0x1b8, "H_GET_HCA_INFO"},				\
 	{0x1bc, "H_GET_PERF_COUNT"},				\
-- 
2.25.4

