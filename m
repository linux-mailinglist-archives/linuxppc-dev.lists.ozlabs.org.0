Return-Path: <linuxppc-dev+bounces-459-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D81395CE31
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2024 15:42:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wr1TV5wxJz2ytT;
	Fri, 23 Aug 2024 23:42:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724420542;
	cv=none; b=LSRkUTmD0OaG8h5q69+nfTUL+EcwSQCJ0gC/+NHwFRKeokElxRIh6x5+oFylJB4rxuCCePlcNggCZZLSbHFiyxk2vd1qbZvOcuzeUIyynAzIKsaItZv8AUGOtxxGApq02iTl9h/1bx0kVI4pyaNnwWpvahv5lDes8EqXnxRr/iiRgihKV9bDA/kiQDgcMJUnLoUfWTOoE0KsnPK3V1zFxOc04zhDM/gWYsUOSguP0T0OhhdkWc8iTz15Y24xaWjj9m8t4rE0WgM02/a/8+lfALHIpBI+Hdi34p2VuQJNHICLoUmQ+5XCzn0RaVR4J8DHiF1/8+W0HLdbO5eO5TCUXg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724420542; c=relaxed/relaxed;
	bh=u3GeGGhXiV3KCU8ZkHlXhZAwaxW+4u7XF67wakKYoRs=;
	h=Received:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:User-Agent; b=WHibmFEHY4B7kmD8uvt3VgmXLEqc9nEFSBpyFU/km+xwVrBHwEf/Zmj8mUjcevkJQJJBxsi8ElN7nYXswGuh21na7Ncn6vCT7YmdBRyeSXmeCucQvLOqQQ3QOKR4QFjZonM+6mfZg6hlNTI1qdaFertlwSXXx6mL1kP8giYiOyR25lbeprIurgFF+kjXm8oXATj4sUWUZQ44seWw1pJWOqPdV5vqo5p4zKQnZLsdZGjMxDVjEbDHPwjfOO/ZM208p0q6adWKjDkVMV4tWfeZyfIU9XZw6eeGbiA2S+a5eg6AHju+Jf0HNW5GCSJgY08Kfm2Zm3wewG9JTYUfaC9lNA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=diJF9KTv; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=will@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=diJF9KTv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=will@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wr1TV4MJYz2ypP
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 23:42:22 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 77010602E2;
	Fri, 23 Aug 2024 13:42:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56E33C32786;
	Fri, 23 Aug 2024 13:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724420540;
	bh=p7ZIANVfDlXfoD29LXtd0evBx7y2j+mvpMRvoiijjDI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=diJF9KTvNtOkFxSbJXKbytkFAtignBqhPmYEolOHprLDUViiVjuKDHUVvblLiJoQK
	 cYAq2OFQ1lC4Ob4pfq5sgJpfMW0nC0GYloyNujsF8966uVxZOtpAfbh+JXp4NFAXi6
	 zGYX9PXuywc/Nn2EaTGKd9Kg3OUZAfcHhEG+bSe3hFweisJRBzWLqXIhMjTnOFsE0k
	 BYfyDcsS8zmIES3CMBMtscVY670iajmo99zrDiLGTOeSpVKhmRvfeA06Kvp3uAINuA
	 cgeKenNlP7lid7lc7d1aVOD3AdNXVJOFk/vBTQVF0s7Q5L+YUfHHd/MdBxMETD+T+T
	 +SkkSJYuyEi6A==
Date: Fri, 23 Aug 2024 14:42:12 +0100
From: Will Deacon <will@kernel.org>
To: Joey Gouly <joey.gouly@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, nd@arm.com,
	akpm@linux-foundation.org, aneesh.kumar@kernel.org,
	aneesh.kumar@linux.ibm.com, anshuman.khandual@arm.com, bp@alien8.de,
	broonie@kernel.org, catalin.marinas@arm.com,
	christophe.leroy@csgroup.eu, dave.hansen@linux.intel.com,
	hpa@zytor.com, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org, maz@kernel.org, mingo@redhat.com,
	mpe@ellerman.id.au, naveen.n.rao@linux.ibm.com, npiggin@gmail.com,
	oliver.upton@linux.dev, shuah@kernel.org, skhan@linuxfoundation.org,
	szabolcs.nagy@arm.com, tglx@linutronix.de, x86@kernel.org,
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 04/30] arm64: disable trapping of POR_EL0 to EL2
Message-ID: <20240823134211.GF32156@willie-the-truck>
References: <20240822151113.1479789-1-joey.gouly@arm.com>
 <20240822151113.1479789-5-joey.gouly@arm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240822151113.1479789-5-joey.gouly@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Thu, Aug 22, 2024 at 04:10:47PM +0100, Joey Gouly wrote:
> Allow EL0 or EL1 to access POR_EL0 without being trapped to EL2.
> 
> Signed-off-by: Joey Gouly <joey.gouly@arm.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Acked-by: Catalin Marinas <catalin.marinas@arm.com>
> Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
>  arch/arm64/include/asm/el2_setup.h | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git arch/arm64/include/asm/el2_setup.h arch/arm64/include/asm/el2_setup.h
> index fd87c4b8f984..212191ecad40 100644
> --- arch/arm64/include/asm/el2_setup.h
> +++ arch/arm64/include/asm/el2_setup.h
> @@ -185,12 +185,20 @@
>  .Lset_pie_fgt_\@:
>  	mrs_s	x1, SYS_ID_AA64MMFR3_EL1
>  	ubfx	x1, x1, #ID_AA64MMFR3_EL1_S1PIE_SHIFT, #4
> -	cbz	x1, .Lset_fgt_\@
> +	cbz	x1, .Lset_poe_fgt_\@
>  
>  	/* Disable trapping of PIR_EL1 / PIRE0_EL1 */
>  	orr	x0, x0, #HFGxTR_EL2_nPIR_EL1
>  	orr	x0, x0, #HFGxTR_EL2_nPIRE0_EL1
>  
> +.Lset_poe_fgt_\@:
> +	mrs_s	x1, SYS_ID_AA64MMFR3_EL1
> +	ubfx	x1, x1, #ID_AA64MMFR3_EL1_S1POE_SHIFT, #4
> +	cbz	x1, .Lset_fgt_\@
> +
> +	/* Disable trapping of POR_EL0 */
> +	orr	x0, x0, #HFGxTR_EL2_nPOR_EL0

Dave's reworking the labels here on for-next/misc:

https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git/commit/?h=for-next/misc&id=5b39db6037e7cba1659f2149aef76934370aa6d5

Please can you follow that new style for the new label so that we don't
end up with an immediate inconsistency? Leave the '.Lset_fgt' label
as-is and I'll fix it when we merge the branches.

Cheers,

Will

