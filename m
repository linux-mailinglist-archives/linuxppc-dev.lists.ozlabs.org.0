Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F364459F17F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Aug 2022 04:48:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MC9X56mCbz3bwr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Aug 2022 12:48:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.255; helo=szxga08-in.huawei.com; envelope-from=chenzhongjin@huawei.com; receiver=<UNKNOWN>)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MC9Wg24X9z2xHk
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Aug 2022 12:48:12 +1000 (AEST)
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.53])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4MC9RV1KKCz1N7Td;
	Wed, 24 Aug 2022 10:44:38 +0800 (CST)
Received: from dggpemm500013.china.huawei.com (7.185.36.172) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 24 Aug 2022 10:48:01 +0800
Received: from [127.0.0.1] (10.67.108.67) by dggpemm500013.china.huawei.com
 (7.185.36.172) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 24 Aug
 2022 10:48:01 +0800
Message-ID: <48ca5e9e-eb03-3fb1-96d0-4755e1d39c3f@huawei.com>
Date: Wed, 24 Aug 2022 10:48:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.0
Subject: Re: [PATCH] objtool: replace _ASM_PTR with quad in macros
Content-Language: en-US
To: <linux-kernel@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	"peterz@infradead.org" <peterz@infradead.org>
References: <20220823133124.55914-1-chenzhongjin@huawei.com>
From: Chen Zhongjin <chenzhongjin@huawei.com>
In-Reply-To: <20220823133124.55914-1-chenzhongjin@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.108.67]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500013.china.huawei.com (7.185.36.172)
X-CFilter-Loop: Reflected
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
Cc: sv@linux.ibm.com, mhiramat@kernel.org, naveen.n.rao@linux.vnet.ibm.com, bp@suse.de, jpoimboe@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2022/8/23 21:31, Chen Zhongjin wrote:
> Macros STACK_FRAME_NON_STANDARD and ANNOTATE_NOENDBR uses
> _ASM_PTR. It switch between .long and .quad based on 32bit
> or 64bit. However objtool doesn't work for 32bit, so _ASM_PTR
> makes no sense.
>
> Considering that _ASM_PTR comes from asm.h, which is x86
> specific head file, while objtool.h is generic. Replace
> _ASM_PTR with quad and remove asm.h reference.
>
> Signed-off-by: Chen Zhongjin <chenzhongjin@huawei.com>
> ---
>   include/linux/objtool.h       | 6 ++----
>   tools/include/linux/objtool.h | 6 ++----
>   2 files changed, 4 insertions(+), 8 deletions(-)
>
> diff --git a/include/linux/objtool.h b/include/linux/objtool.h
> index 62c54ffbeeaa..d2413cb78037 100644
> --- a/include/linux/objtool.h
> +++ b/include/linux/objtool.h
> @@ -45,8 +45,6 @@ struct unwind_hint {
>   
>   #ifdef CONFIG_OBJTOOL
>   
> -#include <asm/asm.h>
> -
>   #ifndef __ASSEMBLY__
>   
>   #define UNWIND_HINT(sp_reg, sp_offset, type, end)		\
> @@ -87,7 +85,7 @@ struct unwind_hint {
>   #define ANNOTATE_NOENDBR					\
>   	"986: \n\t"						\
>   	".pushsection .discard.noendbr\n\t"			\
> -	_ASM_PTR " 986b\n\t"					\
> +	".quad 986b\n\t"					\
>   	".popsection\n\t"
>   
>   #define ASM_REACHABLE							\
> @@ -144,7 +142,7 @@ struct unwind_hint {
>   
>   .macro STACK_FRAME_NON_STANDARD func:req
>   	.pushsection .discard.func_stack_frame_non_standard, "aw"
> -	_ASM_PTR \func
> +	.quad \func
>   	.popsection
>   .endm
>   
> diff --git a/tools/include/linux/objtool.h b/tools/include/linux/objtool.h
> index 62c54ffbeeaa..d2413cb78037 100644
> --- a/tools/include/linux/objtool.h
> +++ b/tools/include/linux/objtool.h
> @@ -45,8 +45,6 @@ struct unwind_hint {
>   
>   #ifdef CONFIG_OBJTOOL
>   
> -#include <asm/asm.h>
> -
>   #ifndef __ASSEMBLY__
>   
>   #define UNWIND_HINT(sp_reg, sp_offset, type, end)		\
> @@ -87,7 +85,7 @@ struct unwind_hint {
>   #define ANNOTATE_NOENDBR					\
>   	"986: \n\t"						\
>   	".pushsection .discard.noendbr\n\t"			\
> -	_ASM_PTR " 986b\n\t"					\
> +	".quad 986b\n\t"					\
>   	".popsection\n\t"
>   
>   #define ASM_REACHABLE							\
> @@ -144,7 +142,7 @@ struct unwind_hint {
>   
>   .macro STACK_FRAME_NON_STANDARD func:req
>   	.pushsection .discard.func_stack_frame_non_standard, "aw"
> -	_ASM_PTR \func
> +	.quad \func
>   	.popsection
>   .endm
>   

As ppc said they will use objtool for both 32 and 64bit, maybe we still 
need a switchable symbol type for this.

How about this one?


diff --git a/include/linux/objtool.h b/include/linux/objtool.h
index 62c54ffbeeaa..14af2bcc460b 100644
--- a/include/linux/objtool.h
+++ b/include/linux/objtool.h
@@ -45,10 +45,14 @@ struct unwind_hint {

  #ifdef CONFIG_OBJTOOL

-#include <asm/asm.h>
-
  #ifndef __ASSEMBLY__

+#ifdef CONFIG_64BIT
+#define _RELOC_PTR __stringify(.quad)
+#else
+#define _RELOC_PTR __stringify(.long)
+#endif
+
  #define UNWIND_HINT(sp_reg, sp_offset, type, end)              \
         "987: \n\t"                                             \
         ".pushsection .discard.unwind_hints\n\t"                \
@@ -87,7 +91,7 @@ struct unwind_hint {
  #define ANNOTATE_NOENDBR                                       \
         "986: \n\t"                                             \
         ".pushsection .discard.noendbr\n\t"                     \
-       _ASM_PTR " 986b\n\t"                                    \
+       _RELOC_PTR " 986b\n\t"                                  \
         ".popsection\n\t"

  #define ASM_REACHABLE                                                  \
@@ -98,6 +102,12 @@ struct unwind_hint {

  #else /* __ASSEMBLY__ */

+#ifdef CONFIG_64BIT
+#define _RELOC_PTR .quad
+#else
+#define _RELOC_PTR .long
+#endif
+
  /*
   * This macro indicates that the following intra-function call is valid.
   * Any non-annotated intra-function call will cause objtool to issue a 
warning.
@@ -144,7 +154,7 @@ struct unwind_hint {

  .macro STACK_FRAME_NON_STANDARD func:req
         .pushsection .discard.func_stack_frame_non_standard, "aw"
-       _ASM_PTR \func
+       _RELOC_PTR \func
         .popsection
  .endm



