Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4E05AADAD
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 13:32:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJwkL63H3z3c2N
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 21:32:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJwj45BRFz2yZ4
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Sep 2022 21:31:20 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MJwj11jcpz4xG9;
	Fri,  2 Sep 2022 21:31:17 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nathan Chancellor <nathan@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20220830151256.1473169-1-nathan@kernel.org>
References: <20220830151256.1473169-1-nathan@kernel.org>
Subject: Re: [PATCH] powerpc/papr_scm: Ensure rc is always initialized in papr_scm_pmu_register()
Message-Id: <166211825227.554590.4969553793169461587.b4-ty@ellerman.id.au>
Date: Fri, 02 Sep 2022 21:30:52 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: Tom Rix <trix@redhat.com>, llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>, patches@lists.linux.dev, Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org, Kajol Jain <kjain@linux.ibm.com>, Vaibhav Jain <vaibhav@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 30 Aug 2022 08:12:56 -0700, Nathan Chancellor wrote:
> Clang warns:
> 
>   arch/powerpc/platforms/pseries/papr_scm.c:492:6: warning: variable 'rc' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
>           if (!p->stat_buffer_len)
>               ^~~~~~~~~~~~~~~~~~~
>   arch/powerpc/platforms/pseries/papr_scm.c:523:64: note: uninitialized use occurs here
>           dev_info(&p->pdev->dev, "nvdimm pmu didn't register rc=%d\n", rc);
>                                                                         ^~
>   include/linux/dev_printk.h:150:67: note: expanded from macro 'dev_info'
>           dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
>                                                                           ^~~~~~~~~~~
>   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
>                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
>                                       ^~~~~~~~~~~
>   arch/powerpc/platforms/pseries/papr_scm.c:492:2: note: remove the 'if' if its condition is always false
>           if (!p->stat_buffer_len)
>           ^~~~~~~~~~~~~~~~~~~~~~~~
>   arch/powerpc/platforms/pseries/papr_scm.c:484:8: note: initialize the variable 'rc' to silence this warning
>           int rc, nodeid;
>                 ^
>                 = 0
>   1 warning generated.
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/papr_scm: Ensure rc is always initialized in papr_scm_pmu_register()
      https://git.kernel.org/powerpc/c/6cf07810e9ef8535d60160d13bf0fd05f2af38e7

cheers
