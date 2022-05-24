Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D1C5320E6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 04:23:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6dKW3rg7z3byF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 12:23:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Vz/0zOkh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6dJr6zWxz2ypj
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 May 2022 12:22:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=Vz/0zOkh; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4L6dJq1p1dz4xYY;
 Tue, 24 May 2022 12:22:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1653358972;
 bh=23gpOQQJ/fv8/qwDF68c85b3c418u/QJJTgIjBTIEYY=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Vz/0zOkh11h32x1S+vJ0dfgu+9jJgWUJNHb0CchW47kngs0PqZLMKT7noGRBVFEwE
 39XRrPncQJjqRDMGqzleHq0xMSJOoyAeGnmsgCeOWcevvawiwHUQL05alQKkjBDNr2
 DB/mKxEjKdt3VtW72OKus9OFCAh+QQr5LPwIYflgraXq1NiXjFZ4CDkql2MlO6JRvj
 hRiWh8rPsSysHWoFNTliHIKLSaeZpQQyAa2uyOJAUJBlY2tJzgh6rRoTXwIKdFnXI1
 IecCU3YpTi4TzIfXCuaGB4wpSGR4qMCnuiZT7O9cFV448cQc4aSLfUe5qPMy/fUyrP
 GpTB+KpFeXJlw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, Stephen Rothwell
 <sfr@canb.auug.org.au>
Subject: Re: linux-next: changed messages in qemu boot
In-Reply-To: <1653069342.3xtfot6wli.naveen@linux.ibm.com>
References: <20220520233602.2738d87c@canb.auug.org.au>
 <1653069342.3xtfot6wli.naveen@linux.ibm.com>
Date: Tue, 24 May 2022 12:22:45 +1000
Message-ID: <87czg3mzyi.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> writes:
> Stephen Rothwell wrote:
>> Hi all,
>> 
>> Today's linux-next bboot of the powerpc pseries_le_defconfig build
>> produced these different kernel messages (diff from yesterday's tree):
>> 
>> - ftrace: allocating 33658 entries in 13 pages
>> - ftrace: allocated 13 pages with 3 groups
>> + ftrace-powerpc: Address of ftrace_regs_caller out of range of kernel_toc.
>
> Thanks for the report. I think that is due to:
> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/bb6626e884acffe87b58736291df57db3deaa9b9.1652074503.git.christophe.leroy@csgroup.eu/

Yep, I bisected it there.

I should really read my email before bisecting :)

> The below diff fixes it for me:
>
> diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
> index 46c002a8388804..7418da705d43ac 100644
> --- a/arch/powerpc/kernel/trace/ftrace.c
> +++ b/arch/powerpc/kernel/trace/ftrace.c
> @@ -746,7 +746,7 @@ int __init ftrace_dyn_arch_init(void)
>  
>         reladdr = addr - kernel_toc_addr();
>  
> -       if (reladdr >= SZ_2G || reladdr < -SZ_2G) {
> +       if (reladdr >= SZ_2G || reladdr < -_UL(SZ_2G)) {
>                 pr_err("Address of %ps out of range of kernel_toc.\n",
>                                 (void *)addr);
>                 return -1;

I did:

	if (reladdr >= SZ_2G || reladdr < -(long)SZ_2G) {


Which more closely matches what the old code did, and I think is more
obvious? ie. we don't want to negate the unsigned value, we want a
signed value, and then the negative of that.

cheers
