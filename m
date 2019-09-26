Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C103BF991
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Sep 2019 20:48:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46fP8j5d3fzDqyv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Sep 2019 04:48:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=chromium.org
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=keescook@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="CyY/fdEz";
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46fN0Q4tYczDqqW
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Sep 2019 03:56:38 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id c17so1970180pgg.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Sep 2019 10:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=7AxBS2UV+sou48Vy6Kv2h9T7DXggZ06m6xu8Azn3KL4=;
 b=CyY/fdEzQgm0TyKUDxy3G75sTcbk4Yw8tvueMHwbpgUZtbJ0Xvon+CXNyKvyrH1BQL
 u5o6uFwm+e/OcHUC7jySe7aCPARo15vlMXuk5vFXe2FB4K6jNA/Eh3EruiLhkgWYgaHg
 gq6pWp7Ua54wgWact2q/huVGG+j/PtSDlqWQg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=7AxBS2UV+sou48Vy6Kv2h9T7DXggZ06m6xu8Azn3KL4=;
 b=XoY+SMEc+tUyEjMNLH+2nrtyZb76NQOzBu4TyvK3mwD7AS0odA8Ve70XA45KCR4UV/
 qajG87u+MV9mfiyAsKBtmPt9stuPNyREzyCKk/ISD04mY1/tbrMvPh1pvj6mVFj/PR9s
 vs4VCSUsQwlCXauG+NeCMwWrR4oZxj60RuYCPYdwhou5YHgIKiuDA/opcbdGxC05LQqY
 aCtC+kHwEVH5sfnatQZU8NQD7KKrODsD8Q+sfmtdgbOV+RW8Qf1aHbay9KL3RiRD8wcC
 4ZqRim79KVT3nNa8vRU7ObadoAk3sZq+PqicGwDu+YHkLEde8CNKofYETI10uCpDxDCj
 gLUg==
X-Gm-Message-State: APjAAAXqxWpjM2NTD1km3+wB8emCeY7k6a2HImuoI87r304Jo0WeRJp5
 BwBnGczTGLDZzHAyK/8L0xc6yQ==
X-Google-Smtp-Source: APXvYqxknkDJzH/r0j7lYxibttZvFSpKr+f+b+F+1vun52i5pglb7KvJVrIclOAHVzYu0ZWp0UtBWA==
X-Received: by 2002:a63:5050:: with SMTP id q16mr4553788pgl.451.1569520594732; 
 Thu, 26 Sep 2019 10:56:34 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id i126sm3220459pfc.29.2019.09.26.10.56.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2019 10:56:30 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 28/29] x86/mm: Report actual image regions in /proc/iomem
Date: Thu, 26 Sep 2019 10:56:01 -0700
Message-Id: <20190926175602.33098-29-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190926175602.33098-1-keescook@chromium.org>
References: <20190926175602.33098-1-keescook@chromium.org>
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Michal Simek <monstr@monstr.eu>, linux-alpha@vger.kernel.org,
 linux-ia64@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-xtensa@linux-xtensa.org,
 linux-kernel@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 linux-parisc@vger.kernel.org, Andy Lutomirski <luto@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>,
 linuxppc-dev@lists.ozlabs.org, linux-c6x-dev@linux-c6x.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The resource reservations in made for the kernel image did not reflect
the gaps between text, rodata, and data. This adds the rodata resource
and updates the start/end calculations to match the respective calls to
free_kernel_image_pages().

Before (booted with "nokaslr" for easier comparison):

00100000-bffd9fff : System RAM
  01000000-01e011d0 : Kernel code
  01e011d1-025619bf : Kernel data
  02a95000-035fffff : Kernel bss

After:

00100000-bffd9fff : System RAM
  01000000-01e011d0 : Kernel code
  02000000-023d4fff : Kernel rodata
  02400000-025619ff : Kernel data
  02a95000-035fffff : Kernel bss

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/x86/kernel/setup.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index bbe35bf879f5..0bc71ee3a9c3 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -143,6 +143,13 @@ struct boot_params boot_params;
 /*
  * Machine setup..
  */
+static struct resource rodata_resource = {
+	.name	= "Kernel rodata",
+	.start	= 0,
+	.end	= 0,
+	.flags	= IORESOURCE_BUSY | IORESOURCE_SYSTEM_RAM
+};
+
 static struct resource data_resource = {
 	.name	= "Kernel data",
 	.start	= 0,
@@ -951,7 +958,9 @@ void __init setup_arch(char **cmdline_p)
 
 	code_resource.start = __pa_symbol(_text);
 	code_resource.end = __pa_symbol(_etext)-1;
-	data_resource.start = __pa_symbol(_etext);
+	rodata_resource.start = __pa_symbol(__start_rodata);
+	rodata_resource.end = __pa_symbol(__end_rodata)-1;
+	data_resource.start = __pa_symbol(_sdata);
 	data_resource.end = __pa_symbol(_edata)-1;
 	bss_resource.start = __pa_symbol(__bss_start);
 	bss_resource.end = __pa_symbol(__bss_stop)-1;
@@ -1040,6 +1049,7 @@ void __init setup_arch(char **cmdline_p)
 
 	/* after parse_early_param, so could debug it */
 	insert_resource(&iomem_resource, &code_resource);
+	insert_resource(&iomem_resource, &rodata_resource);
 	insert_resource(&iomem_resource, &data_resource);
 	insert_resource(&iomem_resource, &bss_resource);
 
-- 
2.17.1

