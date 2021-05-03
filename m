Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A164C3716BF
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 May 2021 16:39:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FYlwW4bYPz30DB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 00:39:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FYlw54xqdz2xYg
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 May 2021 00:38:45 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1B47AB177;
 Mon,  3 May 2021 14:38:43 +0000 (UTC)
Date: Mon, 3 May 2021 16:38:41 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [PATCH v3] powerpc/64: Option to use ELFv2 ABI for big-endian
 kernels
Message-ID: <20210503143841.GN6564@kitsune.suse.cz>
References: <20210503110713.751840-1-npiggin__45037.8389026568$1620040079$gmane$org@gmail.com>
 <87eeeooxnu.fsf@igel.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87eeeooxnu.fsf@igel.home>
User-Agent: Mutt/1.11.3 (2019-02-01)
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 03, 2021 at 01:37:57PM +0200, Andreas Schwab wrote:
> Should this add a tag to the module vermagic?

Would the modues link even if the vermagic was not changed?

I suppose something like this might do it.

Thanks

Michal

diff --git a/arch/powerpc/include/asm/vermagic.h b/arch/powerpc/include/asm/vermagic.h
index b054a8576e5d..3fdaacd7a743 100644
--- a/arch/powerpc/include/asm/vermagic.h
+++ b/arch/powerpc/include/asm/vermagic.h
@@ -14,7 +14,14 @@
 #define MODULE_ARCH_VERMAGIC_RELOCATABLE	""
 #endif
 
+
+#ifdef CONFIG_PPC64_BUILD_BIG_ENDIAN_ELF_V2_ABI
+#define MODULE_ARCH_VERMAGIC_ELF_V2_ABI	"abi-elfv2 "
+#else
+#define MODULE_ARCH_VERMAGIC_ELF_V2_ABI	""
+#endif
+
 #define MODULE_ARCH_VERMAGIC \
-		MODULE_ARCH_VERMAGIC_FTRACE MODULE_ARCH_VERMAGIC_RELOCATABLE
+		MODULE_ARCH_VERMAGIC_FTRACE MODULE_ARCH_VERMAGIC_RELOCATABLE MODULE_ARCH_VERMAGIC_ELF_V2_ABI
 
 #endif /* _ASM_VERMAGIC_H */
