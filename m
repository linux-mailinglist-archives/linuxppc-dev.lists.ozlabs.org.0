Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E3463A074
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 05:17:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NLByL2pYvz3f3S
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 15:17:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=l/iLDT8f;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=l/iLDT8f;
	dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NLBwY4Vmzz3cC5
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Nov 2022 15:15:57 +1100 (AEDT)
Received: by mail-pj1-x1034.google.com with SMTP id t11-20020a17090a024b00b0021932afece4so1835950pje.5
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Nov 2022 20:15:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vWgWrGLeB+xoOH8mvK1ujoMXEg/wPFZ3hsl6zxq8pJw=;
        b=l/iLDT8fdITMMgPTM1OEBl2VpkbMGHTdHD68WEayeoPTUc9kMCCdaPwDayAsHoWy8P
         KLAmiOe2+7hxSqpRgiqO0qBXrzBIdRXOKV3lMATbgCjJWMj00R7QgfgeAcMjUcn4Ng0+
         FHyD/G2JHnEz76WGN3AWg6pdTwBXepFUAGDE25DoZ5Qf5g5tNOUGqDeDW5LOUhHcn2aM
         EKrd1YyUgI6AlFpklti+e7p3o7HYoK7YKOzq+5aIPmSo3IrqJYwcubYOteI4Yi68J8D4
         rMLppqGqewLXNHTDklSYb3Q+HB9goDMCmYR7qll5YiOYXsmDpd4RofId9QKCcqdEQqvM
         B00g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vWgWrGLeB+xoOH8mvK1ujoMXEg/wPFZ3hsl6zxq8pJw=;
        b=nw8tPLtm+UMuOD6o4+OZsU2SbfF7OLDF5kNURZc+poQpOVMgFOhLzhHOjj3JOFZpTP
         iewQCFE/s/h+kMW0hJtk+07mJp1Uz4zUWX+xgc7CYUKApPNE94H6rQt7/+mp0upAi7+r
         AfFponR6KhqeJjnw540b3EsRfKY0tFWRDqvKdH5iB9Doo94+8e0qVPlVeL+HJD354nI7
         iQqwy2Wm7gL2Nna3+N/967wYdjWvqAvzKSwE5SYRUq8IYIOENMNdUjoPfE1POtfYoc4+
         OJg4khwaSZA7QY/q7gANn7gtXChbnWRkhEmGtdsrR6o4G7+KCcPpC8L4FGWnWGx5NVck
         ktfA==
X-Gm-Message-State: ANoB5plQAi3eD4LGGki0AbIubgZNQBUrCDCa8c4+P1FRNwOACYkINYkC
	K0rTwAJEZQptohwQeJFSWRxG0iOOORY=
X-Google-Smtp-Source: AA0mqf5j+1Lr/RaqQvmrrufa8o64AA1/RlnUbPLuebbHNCs23UhLdo97GkvIz6MX/F5zcroxHdio5g==
X-Received: by 2002:a17:902:ccce:b0:185:4880:91cd with SMTP id z14-20020a170902ccce00b00185488091cdmr30167065ple.130.1669608955319;
        Sun, 27 Nov 2022 20:15:55 -0800 (PST)
Received: from bobo.ozlabs.ibm.com ([220.240.231.60])
        by smtp.gmail.com with ESMTPSA id y28-20020aa79afc000000b0057489a78979sm6905670pfp.21.2022.11.27.20.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Nov 2022 20:15:54 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 2/4] powerpc/64: Add module check for ELF ABI version
Date: Mon, 28 Nov 2022 14:15:37 +1000
Message-Id: <20221128041539.1742489-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221128041539.1742489-1-npiggin@gmail.com>
References: <20221128041539.1742489-1-npiggin@gmail.com>
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
Cc: Luis Chamberlain <mcgrof@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Jessica Yu <jeyu@kernel.org>, =?UTF-8?q?Michal=20Such=C3=A1nek?= <msuchanek@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Override the generic module ELF check to provide a check for the ELF ABI
version. This becomes important if we allow big-endian ELF ABI V2 builds
but it doesn't hurt to check now.

Cc: Jessica Yu <jeyu@kernel.org>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
[np: split patch, added changelog, adjust to Jessica's proposal]
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/module_64.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/powerpc/kernel/module_64.c b/arch/powerpc/kernel/module_64.c
index 7e45dc98df8a..ff045644f13f 100644
--- a/arch/powerpc/kernel/module_64.c
+++ b/arch/powerpc/kernel/module_64.c
@@ -31,6 +31,16 @@
    this, and makes other things simpler.  Anton?
    --RR.  */
 
+bool module_elf_check_arch(Elf_Ehdr *hdr)
+{
+	unsigned long abi_level = hdr->e_flags & 0x3;
+
+	if (IS_ENABLED(CONFIG_PPC64_ELF_ABI_V2))
+		return abi_level == 2;
+	else
+		return abi_level < 2;
+}
+
 #ifdef CONFIG_PPC64_ELF_ABI_V2
 
 static func_desc_t func_desc(unsigned long addr)
-- 
2.37.2

