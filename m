Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 52352F582C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Nov 2019 21:37:49 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 478sXV3KMrzF7mM
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Nov 2019 07:37:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=217.72.192.75; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 478sVH5hpFzF7YW
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Nov 2019 07:35:51 +1100 (AEDT)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MK3mS-1iDApS0zHy-00LVEV; Fri, 08 Nov 2019 21:35:36 +0100
From: Arnd Bergmann <arnd@arndb.de>
To: y2038@lists.linaro.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 3/8] powerpc: fix vdso32 for ppc64le
Date: Fri,  8 Nov 2019 21:34:26 +0100
Message-Id: <20191108203435.112759-4-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20191108203435.112759-1-arnd@arndb.de>
References: <20191108203435.112759-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Dqnz/eT1SOuWZ6Nsk7jZrA5JIgvW92857XvPyhhu/MApAgKJOA1
 BSqzR9cR49iuc78Q1Wuwf0uc2LqdFCeF+GpSJDDSjMlUcug174u1+56gDh9aoAZMx1YjAwO
 T8m537fFb4GJkW3yVU2NiAIGc/zHBxrA4aQsCblV6As0b/E7RzWZwmp+Wb67zGD7CJn4a29
 jQARD8KRNeNNsdWXsPuDw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:z9DAEWseD6Q=:XDnU256Cf828kWUYInolSf
 bjsDcH8IUWm6SRtKEzuDz1LNDsxNapd9Js8NqFeXQKodJibBTVt1CWq3I+eWNf5bEWjqg6Bmo
 GMRgQQ5xAisfdxwtgul9EA23xU+fhq5Xi5w9dj+iS1+k8UVSpB3aGo7foX+IPnXesLPuIsaVS
 Tbkhx7lFVDphXU3OjDCsgfpLKWJ3FZejSwj0JU02BnVeDUFVBGgt7OKzDZILi+NMzFLP4WKiB
 /n9rYAobaDLX01SFxoDZL6gZVkj3ukciNAr/Ctm3TPX9ZBkUK2OyqDEar647XxbJUKLTFu1Hb
 dO+rUeLw1GvDTkjCMJqWKCGY69Tun2ST/EpCSR4ZhHiyb3oFeYH2w4C6G4arYssqHhT/OB2kh
 P0J3cFD5fIwNZ4iqcXrcEI0ytM5HXkkzzrSI+/uzTVmBXuvetwPDzPXUWQ3BhgwYiFavMfkuT
 z+b46AtrRDtvbj0RDFRlkc3DFuutWONgCFmzxY9K5YJenzjYZ0u7LTxWE/xre4O6OLdkEaFFi
 laUvtad1/MwgCwkwsPih8PEvQMcfW3kZw3hISsye7koVjIxZ1wVKPJyaES1yt+yntwlE3qEJ6
 r7AhhCO4cz4rDSDMnjefhHmeFJ9pU0Pb3l4VCVqRtBuUY4PbDibshG30vvhugGw3etkVvG3jI
 OovmDiBnYdLO9/0oE6Y3LFJGHdURs9hFRqdmaDbGDd/FqRCqY9CsuzUpoZpnb8lJEsSk2l3FU
 kDlE+IIQ1Y+GcegVCucCsFjPbmwGw7QN7AxkUc3csQoJue134oShcFM9CUmeUVJeQYKxm9Xcs
 UazpL9KIPfxjFxgJiJFG737jeYRHzVkMr+auvjQQ9FGwwPU0njhI40fbbvHhXLsryweDTofgV
 T+mGT+LC/mQ5+VZnB5kg==
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
 Arnd Bergmann <arnd@arndb.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On little-endian 32-bit application running on 64-bit kernels,
the current vdso would read the wrong half of the xtime seconds
field. Change it to return the lower half like it does on
big-endian.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/powerpc/kernel/vdso32/gettimeofday.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/vdso32/gettimeofday.S b/arch/powerpc/kernel/vdso32/gettimeofday.S
index becd9f8767ed..4327665ad86f 100644
--- a/arch/powerpc/kernel/vdso32/gettimeofday.S
+++ b/arch/powerpc/kernel/vdso32/gettimeofday.S
@@ -13,7 +13,7 @@
 #include <asm/unistd.h>
 
 /* Offset for the low 32-bit part of a field of long type */
-#ifdef CONFIG_PPC64
+#if defined(CONFIG_PPC64) && defined(CONFIG_CPU_BIG_ENDIAN)
 #define LOPART	4
 #define TSPEC_TV_SEC	TSPC64_TV_SEC+LOPART
 #else
-- 
2.20.0

