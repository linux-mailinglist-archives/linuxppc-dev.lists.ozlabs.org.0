Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9238A809DF7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Dec 2023 09:16:24 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dlJzfGFD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SmkVt0DBHz3dLS
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Dec 2023 19:16:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dlJzfGFD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=aneesh.kumar@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SmkV15tLwz3cF1
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Dec 2023 19:15:37 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id C1C4CB82B8A;
	Fri,  8 Dec 2023 08:15:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CB4EC433C7;
	Fri,  8 Dec 2023 08:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702023333;
	bh=b2dKwJ5VRwAtWWbaaYxqyisFEjNne1OCfokDs9oJo3Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=dlJzfGFDB//CEldkopVVGPtuAJR4HTTAZwmi4ZFUaFQoybRoQyvI9sdT1wxpHzK9i
	 Ljh5a/omN/96xCFqzxtOJ6BgB62yFO7JBos6z5YVszB2TLzLB/k7B2bjyBjTbrhVGy
	 nmnDzHb7ycaHHo0eYjZTxctG7O6T1wbRrwY+Xbijtx9MtQUHFL8qWj506WzkSM6AW2
	 ZM0bFbjD+3mDuKkFrTEwYJyyurgNaIjNSuWnEjv6NmWyzQH4Zh1NTTFASR+Etjx1c2
	 p4RI1Ilh63YjhJCaBAuGj06uRR4pZyTbgWPf0S3cKnEnZI8hMPLmO75E2tkiJRmSI5
	 f3Xrw+ZTpRo7Q==
X-Mailer: emacs 29.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V (IBM) <aneesh.kumar@kernel.org>
To: Vaibhav Jain <vaibhav@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
	kvm@vger.kernel.org, kvm-ppc@vger.kernel.org
Subject: Re: [PATCH 09/12] KVM: PPC: Book3S HV nestedv2: Do not call
 H_COPY_TOFROM_GUEST
In-Reply-To: <20231201132618.555031-10-vaibhav@linux.ibm.com>
References: <20231201132618.555031-1-vaibhav@linux.ibm.com>
 <20231201132618.555031-10-vaibhav@linux.ibm.com>
Date: Fri, 08 Dec 2023 13:45:24 +0530
Message-ID: <87sf4dun37.fsf@kernel.org>
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
Cc: mikey@neuling.org, sbhat@linux.ibm.com, amachhiw@linux.vnet.ibm.com, Jordan Niethe <jniethe5@gmail.com>, gautam@linux.ibm.com, Nicholas Piggin <npiggin@gmail.com>, David.Laight@ACULAB.COM, kconsul@linux.vnet.ibm.com, Vaibhav Jain <vaibhav@linux.ibm.com>, Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Vaibhav Jain <vaibhav@linux.ibm.com> writes:

> From: Jordan Niethe <jniethe5@gmail.com>
>
> H_COPY_TOFROM_GUEST is part of the nestedv1 API and so should not be
> called by a nestedv2 host. Do not attempt to call it.
>

May be we should use
firmware_has_feature(FW_FEATURE_H_COPY_TOFROM_GUEST))?

the nestedv2 can end up using the above hcall if it is supported by the
hypervisor right? In its absence we will have to translate the guest ea
using xlate and then use kvm_guest_read to read location using the guest
real address right? That xlate will also involves multiple kvm_guest_read.


> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> ---
>  arch/powerpc/kvm/book3s_64_mmu_radix.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/powerpc/kvm/book3s_64_mmu_radix.c b/arch/powerpc/kvm/book3s_64_mmu_radix.c
> index 916af6c153a5..4a1abb9f7c05 100644
> --- a/arch/powerpc/kvm/book3s_64_mmu_radix.c
> +++ b/arch/powerpc/kvm/book3s_64_mmu_radix.c
> @@ -40,6 +40,9 @@ unsigned long __kvmhv_copy_tofrom_guest_radix(int lpid, int pid,
>  	unsigned long quadrant, ret = n;
>  	bool is_load = !!to;
>  
> +	if (kvmhv_is_nestedv2())
> +		return H_UNSUPPORTED;
> +
>  	/* Can't access quadrants 1 or 2 in non-HV mode, call the HV to do it */
>  	if (kvmhv_on_pseries())
>  		return plpar_hcall_norets(H_COPY_TOFROM_GUEST, lpid, pid, eaddr,
> -- 
> 2.42.0
