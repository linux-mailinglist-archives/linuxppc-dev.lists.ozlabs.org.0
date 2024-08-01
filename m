Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0DB944140
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Aug 2024 04:34:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=FVItAq7M;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZCjS5pvxz3cXH
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Aug 2024 12:34:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=FVItAq7M;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WZChk3nxrz30VY
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Aug 2024 12:34:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1722479650;
	bh=Gu2oyGDEAOsWLaCjYmOjBBoAxVuypoP0T7mtfNUrOe0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=FVItAq7My3D+6l6w5F3oHYc0k/3sDN59MWvfcvkBTPwR3I7RuQEHaarKI6eeQi6BU
	 VNgqhNcym8wNRNd+j+ELofxI5vnpmW2pKeizWjBFbsfeUP+BnA3tFNV3eV2O50QgJb
	 sJCABPs3XXemxvf13dvkurBg7v+bRc2Rsl5cbEAVbOKSnlf3E0N26IoLkcJJLyuTsR
	 le81sMw7Boden5CLaQwdCc/Z0zbRoArk69fLqP5YH420VQyngkAi6BgoTHE6Io31/g
	 iTE6qiEV+almyOg7vxWGzOudUSS1u33Kt+KlLnlz3YU9V9qNAi6VmiQaee+bNcowiG
	 ym2XE9POb+QIg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WZChf4Bkyz4x6r;
	Thu,  1 Aug 2024 12:34:10 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Sourabh Jain <sourabhjain@linux.ibm.com>, bhe@redhat.com
Subject: Re: [PATCH] kexec/crash: no crash update when kexec in progress
In-Reply-To: <20240731152738.194893-1-sourabhjain@linux.ibm.com>
References: <20240731152738.194893-1-sourabhjain@linux.ibm.com>
Date: Thu, 01 Aug 2024 12:34:10 +1000
Message-ID: <87v80lnf8d.fsf@mail.lhotse>
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
Cc: x86@kernel.org, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, Sourabh Jain <sourabhjain@linux.ibm.com>, Sachin P Bappalige <sachinpb@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org, Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sourabh Jain <sourabhjain@linux.ibm.com> writes:
> The following errors are observed when kexec is done with SMT=off on
> powerpc.
>
> [  358.458385] Removing IBM Power 842 compression device
> [  374.795734] kexec_core: Starting new kernel
> [  374.795748] kexec: Waking offline cpu 1.
> [  374.875695] crash hp: kexec_trylock() failed, elfcorehdr may be inaccurate
> [  374.935833] kexec: Waking offline cpu 2.
> [  375.015664] crash hp: kexec_trylock() failed, elfcorehdr may be inaccurate
> snip..
> [  375.515823] kexec: Waking offline cpu 6.
> [  375.635667] crash hp: kexec_trylock() failed, elfcorehdr may be inaccurate
> [  375.695836] kexec: Waking offline cpu 7.

Are they actually errors though? Do they block the actual kexec from
happening? Or are they just warnings in dmesg?

Because the fix looks like it could be racy.

cheers

> During kexec, the offline CPUs are brought online, which triggers the
> crash hotplug handler `crash_handle_hotplug_event()` to update the kdump
> image. Given that the system is on the kexec path and the kexec lock is
> taken, the `crash_handle_hotplug_event()` function fails to take the
> same lock to update the kdump image, resulting in the above error
> messages.
>
> To fix this, let's return from `crash_handle_hotplug_event()` if kexec
> is in progress.
>
> The same applies to the `crash_check_hotplug_support()` function.
> Return 0 if kexec is in progress.
>
> Cc: Hari Bathini <hbathini@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: kexec@lists.infradead.org
> Cc: linuxppc-dev@ozlabs.org
> Cc: linux-kernel@vger.kernel.org
> Cc: x86@kernel.org
> Reported-by: Sachin P Bappalige <sachinpb@linux.vnet.ibm.com>
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> ---
>  kernel/crash_core.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/kernel/crash_core.c b/kernel/crash_core.c
> index 63cf89393c6e..d37a16d5c3a1 100644
> --- a/kernel/crash_core.c
> +++ b/kernel/crash_core.c
> @@ -502,6 +502,9 @@ int crash_check_hotplug_support(void)
>  {
>  	int rc = 0;
>  
> +	if (kexec_in_progress)
> +		return 0;
> +
>  	crash_hotplug_lock();
>  	/* Obtain lock while reading crash information */
>  	if (!kexec_trylock()) {
> @@ -537,6 +540,9 @@ static void crash_handle_hotplug_event(unsigned int hp_action, unsigned int cpu,
>  {
>  	struct kimage *image;
>  
> +	if (kexec_in_progress)
> +		return;
> +
>  	crash_hotplug_lock();
>  	/* Obtain lock while changing crash information */
>  	if (!kexec_trylock()) {
> -- 
> 2.45.2
>
>
> _______________________________________________
> kexec mailing list
> kexec@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kexec
