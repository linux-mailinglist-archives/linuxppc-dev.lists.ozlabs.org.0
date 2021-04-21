Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 891D8366524
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 08:03:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQ93S46RQz300P
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 16:03:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQ9374S3Pz2xfT
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Apr 2021 16:03:28 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FQ9300068z9v00X;
 Wed, 21 Apr 2021 08:03:23 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id rDYrE5nnxFhK; Wed, 21 Apr 2021 08:03:23 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FQ92z666lz9v008;
 Wed, 21 Apr 2021 08:03:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id ACBC58B815;
 Wed, 21 Apr 2021 08:03:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id DeVc2UN9mFB6; Wed, 21 Apr 2021 08:03:24 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 596C88B814;
 Wed, 21 Apr 2021 08:03:24 +0200 (CEST)
Subject: Re: powerpc{32,64} randconfigs
To: Randy Dunlap <rdunlap@infradead.org>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>
References: <45afab41-cc5f-dffa-712a-d5fb1a9d0a23@infradead.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <a56093f8-9672-d815-81cc-ff0fd7743696@csgroup.eu>
Date: Wed, 21 Apr 2021 08:03:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <45afab41-cc5f-dffa-712a-d5fb1a9d0a23@infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
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
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi

Le 21/04/2021 à 01:31, Randy Dunlap a écrit :
> [time passes]
> 
> OK, I have a patch that seems for work as far as setting
> PPC32=y or PPC64=y... but it has a problem during linking
> of vmlinux:
> 
> crosstool/gcc-9.3.0-nolibc/powerpc-linux/bin/powerpc-linux-ld:./arch/powerpc/kernel/vmlinux.lds:6: syntax error
> 
> and the (bad) generated vmlinux.lds file says (at line 6):
> 
> OUTPUT_ARCH(1:common)
> 
> while it should say:
> 
> OUTPUT_ARCH(powerpc:common)
> 
> Does anyone have any ideas about this problem?

The following change fixes the problem, allthough I guess that's not what you want to do at the end.

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 1b6094a13034..00f72699c518 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -358,7 +358,7 @@ targets += $(lib-y) $(always-y) $(MAKECMDGOALS)
  # Linker scripts preprocessor (.lds.S -> .lds)
  # ---------------------------------------------------------------------------
  quiet_cmd_cpp_lds_S = LDS     $@
-      cmd_cpp_lds_S = $(CPP) $(cpp_flags) -P -U$(ARCH) \
+      cmd_cpp_lds_S = $(CPP) $(cpp_flags) -P -U$(SRCARCH) \
  	                     -D__ASSEMBLY__ -DLINKER_SCRIPT -o $@ $<

  $(obj)/%.lds: $(src)/%.lds.S FORCE


> 
> The ARCH=ppc32 / ARCH=ppc64 patch is below FYI.
> It is missing an update to Documentation/kbuild/kbuild.rst (aliases).
> 
> 
> thanks.
> 
