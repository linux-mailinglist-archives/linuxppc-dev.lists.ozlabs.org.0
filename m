Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A672509E99
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Apr 2022 13:35:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kkb7636cFz3bYy
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Apr 2022 21:34:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=H4eGoIXj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kkb6V1B9Lz2yWN
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Apr 2022 21:34:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=H4eGoIXj; 
 dkim-atps=neutral
Received: by gandalf.ozlabs.org (Postfix)
 id 4Kkb6V0T77z4xLS; Thu, 21 Apr 2022 21:34:26 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Kkb6T5D30z4xXk;
 Thu, 21 Apr 2022 21:34:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1650540866;
 bh=x4emXQdaG8QS9VPGy153y4qTgSiGO5Ev4smUWzWAYt8=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=H4eGoIXj3m9pflkjwXbIP+g28ZN8rBowRbH8tNG343Aih1UKejkudIYo/L8YSMch1
 84TqaFySJgMB6gLntx1yjj9yTgOfW2WK/56JpsdZxmImBJaQ9UgBibrioHEMUSy0Ko
 xYJ0uWymIuVjEthHwM7cRBf+lIAWIcpn+dMbQKhcYi8RbCPjtorS2Wx4spV4qQTHb4
 4cBV1JN8+Lk3ByqAGuaaCHsnHi6CWsjDKA4uPCiLw4uITURYzylWg6tnIdILT3A9Wp
 68ujxVVv+aoHgSu+Kr8fRs0rcuAp0HO44btc40C8XxlT5AAT/ZilZrkdumj35/nC+F
 mWS7FFEVmisnQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@ozlabs.org
Subject: Re: [RFC v4 PATCH 2/5] powerpc/crash hp: introduce a new config
 option CRASH_HOTPLUG
In-Reply-To: <20220411084357.157308-3-sourabhjain@linux.ibm.com>
References: <20220411084357.157308-1-sourabhjain@linux.ibm.com>
 <20220411084357.157308-3-sourabhjain@linux.ibm.com>
Date: Thu, 21 Apr 2022 21:34:22 +1000
Message-ID: <874k2mfz5t.fsf@mpe.ellerman.id.au>
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
Cc: ldufour@linux.ibm.com, eric.devolder@oracle.com, kexec@lists.infradead.org,
 hbathini@linux.ibm.com, bhe@redhat.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sourabh Jain <sourabhjain@linux.ibm.com> writes:
> The option CRASH_HOTPLUG enables, in kernel update to kexec segments on
> hotplug events.
>
> All the updates needed on the capture kernel load path in the kernel for
> both kexec_load and kexec_file_load system will be kept under this config.
>
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> Reviewed-by: Eric DeVolder <eric.devolder@oracle.com>
> ---
>  arch/powerpc/Kconfig | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index b779603978e1..777db33f75b5 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -623,6 +623,17 @@ config FA_DUMP
>  	  If unsure, say "y". Only special kernels like petitboot may
>  	  need to say "N" here.
>  
> +config CRASH_HOTPLUG
> +	bool "kernel updates of crash kexec segments"
> +	depends on CRASH_DUMP && (HOTPLUG_CPU) && KEXEC_FILE
> +	help
> +	  An efficient way to keep the capture kernel up-to-date with CPU
> +	  hotplug events. On CPU hotplug event the kexec segments of capture
> +	  kernel becomes stale and need to be updated with latest CPU data.
> +	  In this method the kernel performs minimal update to only relevant
> +	  kexec segments on CPU hotplug event, instead of triggering full
> +	  capture kernel reload from userspace using udev rule.

Why would a user ever want to turn this off?

Seems to me we should just make it always behave this way, and not have
a CONFIG option at all.

cheers
