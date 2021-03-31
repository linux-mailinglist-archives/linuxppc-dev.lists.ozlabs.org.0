Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3037634F5E2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 03:11:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F97Yk1R16z3c6s
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 12:11:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F97XK0qFZz3brJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Mar 2021 12:10:09 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4F97XJ5Y7Cz9sWd; Wed, 31 Mar 2021 12:10:08 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>,
 Chen Huang <chenhuang5@huawei.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
In-Reply-To: <4b8f8335-0a29-93fc-7943-b4dc16efb908@huawei.com>
References: <20210327094900.938555-1-chenhuang5@huawei.com>
 <dd6b25d3-006b-be1e-9c4f-89e66aefb519@csgroup.eu>
 <e8eddfd4-ca07-f2ba-42de-19e636dc2ce9@huawei.com>
 <4b8f8335-0a29-93fc-7943-b4dc16efb908@huawei.com>
Subject: Re: [PATCH v2] powerpc: Fix HAVE_HARDLOCKUP_DETECTOR_ARCH build
 configuration
Message-Id: <161715298165.226945.12702425269351759002.b4-ty@ellerman.id.au>
Date: Wed, 31 Mar 2021 12:09:41 +1100
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
Cc: Don Zickus <dzickus@redhat.com>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, Hulk Robot <hulkci@huawei.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 29 Mar 2021 10:27:00 +0800, Chen Huang wrote:
> When compiling the powerpc with the SMP disabled, it shows the issue:
> 
> arch/powerpc/kernel/watchdog.c: In function ‘watchdog_smp_panic’:
> arch/powerpc/kernel/watchdog.c:177:4: error: implicit declaration of function ‘smp_send_nmi_ipi’; did you mean ‘smp_send_stop’? [-Werror=implicit-function-declaration]
>   177 |    smp_send_nmi_ipi(c, wd_lockup_ipi, 1000000);
>       |    ^~~~~~~~~~~~~~~~
>       |    smp_send_stop
> cc1: all warnings being treated as errors
> make[2]: *** [scripts/Makefile.build:273: arch/powerpc/kernel/watchdog.o] Error 1
> make[1]: *** [scripts/Makefile.build:534: arch/powerpc/kernel] Error 2
> make: *** [Makefile:1980: arch/powerpc] Error 2
> make: *** Waiting for unfinished jobs....
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc: Fix HAVE_HARDLOCKUP_DETECTOR_ARCH build configuration
      https://git.kernel.org/powerpc/c/4fe529449d85e78972fa327999961ecc83a0b6db

cheers
