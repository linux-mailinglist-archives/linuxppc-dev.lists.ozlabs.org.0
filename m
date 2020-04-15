Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A53A31AB1DF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Apr 2020 21:36:00 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492Xdn6cfjzDrCQ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 05:35:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=buserror.net
 (client-ip=165.227.176.147; helo=baldur.buserror.net;
 envelope-from=oss@buserror.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=buserror.net
Received: from baldur.buserror.net (baldur.buserror.net [165.227.176.147])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 492XY022nXzDr9v
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Apr 2020 05:31:48 +1000 (AEST)
Received: from [2601:449:8480:af0:12bf:48ff:fe84:c9a0]
 by baldur.buserror.net with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <oss@buserror.net>)
 id 1jOnl5-0007BU-K5; Wed, 15 Apr 2020 14:31:41 -0500
Message-ID: <f91c90fde203ed87dcf206e795ee55ed67b5f641.camel@buserror.net>
From: Scott Wood <oss@buserror.net>
To: Jason Yan <yanaijie@huawei.com>, mpe@ellerman.id.au, 
 linuxppc-dev@lists.ozlabs.org, diana.craciun@nxp.com,
 christophe.leroy@c-s.fr,  benh@kernel.crashing.org, paulus@samba.org,
 npiggin@gmail.com,  keescook@chromium.org,
 kernel-hardening@lists.openwall.com
Date: Wed, 15 Apr 2020 14:31:38 -0500
In-Reply-To: <20200330022023.3691-1-yanaijie@huawei.com>
References: <20200330022023.3691-1-yanaijie@huawei.com>
Organization: Red Hat
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2601:449:8480:af0:12bf:48ff:fe84:c9a0
X-SA-Exim-Rcpt-To: yanaijie@huawei.com, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org, diana.craciun@nxp.com, christophe.leroy@c-s.fr,
 benh@kernel.crashing.org, paulus@samba.org, npiggin@gmail.com,
 keescook@chromium.org, kernel-hardening@lists.openwall.com,
 linux-kernel@vger.kernel.org, zhaohongjiang@huawei.com, dja@axtens.net
X-SA-Exim-Mail-From: oss@buserror.net
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on baldur.localdomain
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=5.0 tests=ALL_TRUSTED,BAYES_00,
 GREYLIST_ISWHITE autolearn=ham autolearn_force=no version=3.4.2
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
 *  -15 BAYES_00 BODY: Bayes spam probability is 0 to 1%
 *      [score: 0.0000]
 * -1.5 GREYLIST_ISWHITE The incoming server has been whitelisted for
 *      this recipient and sender
Subject: Re: [PATCH v5 0/6] implement KASLR for powerpc/fsl_booke/64
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on baldur.buserror.net)
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
Cc: dja@axtens.net, linux-kernel@vger.kernel.org, zhaohongjiang@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2020-03-30 at 10:20 +0800, Jason Yan wrote:
> This is a try to implement KASLR for Freescale BookE64 which is based on
> my earlier implementation for Freescale BookE32:
> 
https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=131718&state=*
> 
> The implementation for Freescale BookE64 is similar as BookE32. One
> difference is that Freescale BookE64 set up a TLB mapping of 1G during
> booting. Another difference is that ppc64 needs the kernel to be
> 64K-aligned. So we can randomize the kernel in this 1G mapping and make
> it 64K-aligned. This can save some code to creat another TLB map at
> early boot. The disadvantage is that we only have about 1G/64K = 16384
> slots to put the kernel in.
> 
>     KERNELBASE
> 
>           64K                     |--> kernel <--|
>            |                      |              |
>         +--+--+--+    +--+--+--+--+--+--+--+--+--+    +--+--+
>         |  |  |  |....|  |  |  |  |  |  |  |  |  |....|  |  |
>         +--+--+--+    +--+--+--+--+--+--+--+--+--+    +--+--+
>         |                         |                        1G
>         |----->   offset    <-----|
> 
>                               kernstart_virt_addr
> 
> I'm not sure if the slot numbers is enough or the design has any
> defects. If you have some better ideas, I would be happy to hear that.
> 
> Thank you all.
> 
> v4->v5:
>   Fix "-Werror=maybe-uninitialized" compile error.
>   Fix typo "similar as" -> "similar to".
> v3->v4:
>   Do not define __kaslr_offset as a fixed symbol. Reference __run_at_load
> and
>     __kaslr_offset by symbol instead of magic offsets.
>   Use IS_ENABLED(CONFIG_PPC32) instead of #ifdef CONFIG_PPC32.
>   Change kaslr-booke32 to kaslr-booke in index.rst
>   Switch some instructions to 64-bit.
> v2->v3:
>   Fix build error when KASLR is disabled.
> v1->v2:
>   Add __kaslr_offset for the secondary cpu boot up.
> 
> Jason Yan (6):
>   powerpc/fsl_booke/kaslr: refactor kaslr_legal_offset() and
>     kaslr_early_init()
>   powerpc/fsl_booke/64: introduce reloc_kernel_entry() helper
>   powerpc/fsl_booke/64: implement KASLR for fsl_booke64
>   powerpc/fsl_booke/64: do not clear the BSS for the second pass
>   powerpc/fsl_booke/64: clear the original kernel if randomized
>   powerpc/fsl_booke/kaslr: rename kaslr-booke32.rst to kaslr-booke.rst
>     and add 64bit part
> 
>  Documentation/powerpc/index.rst               |  2 +-
>  .../{kaslr-booke32.rst => kaslr-booke.rst}    | 35 ++++++-
>  arch/powerpc/Kconfig                          |  2 +-
>  arch/powerpc/kernel/exceptions-64e.S          | 23 +++++
>  arch/powerpc/kernel/head_64.S                 | 13 +++
>  arch/powerpc/kernel/setup_64.c                |  3 +
>  arch/powerpc/mm/mmu_decl.h                    | 23 +++--
>  arch/powerpc/mm/nohash/kaslr_booke.c          | 91 +++++++++++++------
>  8 files changed, 147 insertions(+), 45 deletions(-)
>  rename Documentation/powerpc/{kaslr-booke32.rst => kaslr-booke.rst} (59%)
> 

Acked-by: Scott Wood <oss@buserror.net>

-Scott


