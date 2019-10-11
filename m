Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A02D4D3681
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2019 02:48:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46q8Sh2J2kzDqHZ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2019 11:48:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=chromium.org
 (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com;
 envelope-from=keescook@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="QKMy1WMI";
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46q7h83qVBzDqMM
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2019 11:12:56 +1100 (AEDT)
Received: by mail-pf1-x442.google.com with SMTP id b128so4969859pfa.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2019 17:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=aXC4EKkSKWAzbgJ5UkNW5ASNd77O0uNGfoVDwB8PV7o=;
 b=QKMy1WMIao8eo2h9Q1TmJ+NvwxmYIJS5BiRFvnKXyWnyHt2NVU1sSJRyaYkSK0bnTI
 3g26hGi2M+7oPqpQxxO8mfA0+ckl3W/NOZq89OJYBy8zqpl256YQ/kRKmZl3wcK/Al8o
 WR97u6SnuI6udJBDDM4eXoslNY2BMQS6h8HHA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=aXC4EKkSKWAzbgJ5UkNW5ASNd77O0uNGfoVDwB8PV7o=;
 b=L9BKaVLs9zsGBLwBlXOs3FftjcfNnkM/5lVNpthSLPUkGcrpbXSHZK5OATybxL9LHH
 TkTqQfeKp+B6llRWkQ/P20oOk+5Z2pDLqEwn47yZjs8qdBkjM041jHszV9p6eO1VZJxN
 ZTjuoP+9wGrJJR9xbpyyWE9fk2/aly5C+/bBCdI3/aJYXrp0shQV27gSjnj9fGqJdVyf
 Z6ad9CZJy76yeQfkhu+DiNgoeIBa95Ta6h7SUux7N/p4uD1GiIF7YVsMULaAv9lHg4Pq
 OUowtxd/9srHEUMODL9nMrue0LjyaCYN31R6PPWiBvnFDTbBuwllnAyzUrMlndLjhwvq
 yiYQ==
X-Gm-Message-State: APjAAAWmMqtAODiy8sAmAYVh7y9S+/V4vjFO1kSo1CzhMw/qq1F/T/1w
 7SJJK0Ed1TWLaGABpxNVdLkZaw==
X-Google-Smtp-Source: APXvYqwyN8mvkbsH6LAVRfjY92v44FJMaCqPYldcWqY2MvbBlNQ7Douul4dniL7y8RNurjH2A60mLg==
X-Received: by 2002:a17:90a:1617:: with SMTP id
 n23mr14581628pja.75.1570752773811; 
 Thu, 10 Oct 2019 17:12:53 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id w10sm5837436pjq.3.2019.10.10.17.12.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2019 17:12:52 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Borislav Petkov <bp@alien8.de>
Subject: [PATCH v2 25/29] xtensa: Move EXCEPTION_TABLE to RO_DATA segment
Date: Thu, 10 Oct 2019 17:06:05 -0700
Message-Id: <20191011000609.29728-26-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011000609.29728-1-keescook@chromium.org>
References: <20191011000609.29728-1-keescook@chromium.org>
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
 Michal Simek <monstr@monstr.eu>, x86@kernel.org, linux-ia64@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-xtensa@linux-xtensa.org, Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-parisc@vger.kernel.org,
 Andy Lutomirski <luto@kernel.org>, linux-alpha@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-c6x-dev@linux-c6x.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since the EXCEPTION_TABLE is read-only, collapse it into RO_DATA.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/xtensa/kernel/vmlinux.lds.S | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/xtensa/kernel/vmlinux.lds.S b/arch/xtensa/kernel/vmlinux.lds.S
index bdbd7c4056c1..0043d5858f14 100644
--- a/arch/xtensa/kernel/vmlinux.lds.S
+++ b/arch/xtensa/kernel/vmlinux.lds.S
@@ -14,6 +14,8 @@
  * Joe Taylor <joe@tensilica.com, joetylr@yahoo.com>
  */
 
+#define RO_EXCEPTION_TABLE_ALIGN	16
+
 #include <asm-generic/vmlinux.lds.h>
 #include <asm/page.h>
 #include <asm/thread_info.h>
@@ -130,7 +132,6 @@ SECTIONS
 
   .fixup   : { *(.fixup) }
 
-  EXCEPTION_TABLE(16)
   /* Data section */
 
   _sdata = .;
-- 
2.17.1

