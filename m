Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 260583639F0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 06:05:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FNtWR0KFhz3d27
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 14:05:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FNtVL59yrz3bT7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Apr 2021 14:04:10 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4FNtVK6yHjz9vGS; Mon, 19 Apr 2021 14:04:09 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <cover.1617209141.git.christophe.leroy@csgroup.eu>
References: <cover.1617209141.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH RESEND v1 0/4] powerpc/vdso: Add support for time
 namespaces
Message-Id: <161880480562.1398509.1936824498391180839.b4-ty@ellerman.id.au>
Date: Mon, 19 Apr 2021 14:00:05 +1000
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
Cc: linux-arch@vger.kernel.org, arnd@arndb.de, dima@arista.com,
 linux-kernel@vger.kernel.org, avagin@gmail.com, luto@kernel.org,
 tglx@linutronix.de, vincenzo.frascino@arm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 31 Mar 2021 16:48:43 +0000 (UTC), Christophe Leroy wrote:
> [Sorry, resending with complete destination list, I used the wrong script on the first delivery]
> 
> This series adds support for time namespaces on powerpc.
> 
> All timens selftests are successfull.
> 
> Christophe Leroy (3):
>   lib/vdso: Mark do_hres_timens() and do_coarse_timens()
>     __always_inline()
>   lib/vdso: Add vdso_data pointer as input to
>     __arch_get_timens_vdso_data()
>   powerpc/vdso: Add support for time namespaces
> 
> [...]

Applied to powerpc/next.

[1/4] lib/vdso: Mark do_hres_timens() and do_coarse_timens() __always_inline()
      https://git.kernel.org/powerpc/c/58efe9f696cf908f40d6672aeca81cb2ad2bc762
[2/4] lib/vdso: Add vdso_data pointer as input to __arch_get_timens_vdso_data()
      https://git.kernel.org/powerpc/c/808094fcbf4196be0feb17afbbdc182ec95c8cec
[3/4] powerpc/vdso: Separate vvar vma from vdso
      https://git.kernel.org/powerpc/c/1c4bce6753857dc409a0197342d18764e7f4b741
[4/4] powerpc/vdso: Add support for time namespaces
      https://git.kernel.org/powerpc/c/74205b3fc2effde821b219d955c70e727dc43cc6

cheers
