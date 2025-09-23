Return-Path: <linuxppc-dev+bounces-12530-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 565C6B93D7B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Sep 2025 03:27:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cW2R90kKJz3cYG;
	Tue, 23 Sep 2025 11:27:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758590868;
	cv=none; b=jTxgyLtzRzCkS9Jy2YeWvrCEGmgIKSCWRPtnVMlzU+aRtc4nWcAF3zhoVwGCh/ZmWzlADx0uvkWlgmRAr2Qb+mE+YIWjx9xjz/vmXtNzLZ4yc8qkGpTP22pQ8aSs+PO1RNgTVo2ap7dEqO3/JpBLXkczUtviePZOs/sDfKT5/GKjuQKNC8aoLuiEB5fB+0k6vPRrar5jpTXbO6ie9xeD+UlVIc/agWlJjtfYA7F/c9mS4qrWUpvPsB1m0+8aJLRWeym3d9i2ajWA13xafs5TX7l6d8d49FgGyPtG9O40/yB9R2Nh0WDN6HLN9kNy7iTlO0lcVyChLQLq85XFxNNDQA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758590868; c=relaxed/relaxed;
	bh=JsYBMlsphlSy0CkNZAZwATovx/7TzxIQDdnZypEuP58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ByVmMQACd1SzT0xZSOexq1AvrVz5Yjv7knV8VjarUkzHXpk/eu48qbEkLC/gtO8vm3w55544Ghsl+EvZKv0AGoLteYqS4XoG8snPRiUJayhh5sozNBD7WfcbuYVHFhZcloB/Ut18ZmyGP/wKq227eaP1qJJl51WvEdI9rUl51wjqwgYDDKjLiThOw3SCutqCGMFaB+tvQgOADphHxJO5MPxrxPMhp6KjTfLXP9fbVd7uMxbiIalxUTxcZEHUvt0HQ7JtoIWCSu2Q++5j8bZMOqwsAo7RVa5mXl5vFdfX0fTApDrQhmdX2qoqVG8+7SwTydLsuupEYcht+Tu2SqypSQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lfeNbT1T; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lfeNbT1T;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cW2R81Y0zz2yGM
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Sep 2025 11:27:48 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 925526025D;
	Tue, 23 Sep 2025 01:27:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D21BDC4CEF0;
	Tue, 23 Sep 2025 01:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758590865;
	bh=flxBSoftFjiAiP6heMicexlj4mz8YIbgAu/4NHMShZM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lfeNbT1TuoFCTHW6Jg29BWRSn57TObXGwoSgkxzcGIWOtxUTUYlzJYnAgc4ewEoiQ
	 JjX3AT1iC1k4WJwwi4/xB2zTjdHRxmkccgz3HYxWVxrfhqJJHH2UDjy82MKheoBSYM
	 7N015kyTr6rMUqIarDtTyyLcqvF+O6ifox3lVTLaSMrraNZaunKbBApn/ZqnuQyJV0
	 qv3EpkiJOS1Zfv2YbLX6h2Gz0al4U0q7DhOlnX8llNZBIy+D/MQTS2GTAMHvuilztN
	 KxhHV3Y1rWXBEqhays1O7iQVorgG+VsP8g4UTwTyWIOqeUiy8+6OYqdPtLGapQ0BPZ
	 NHymVK/kL7NaQ==
Date: Mon, 22 Sep 2025 18:27:38 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Tony Krowiak <akrowiak@linux.ibm.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Jason Herne <jjherne@linux.ibm.com>,
	Harald Freudenberger <freude@linux.ibm.com>,
	Holger Dengler <dengler@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
	linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] KVM: Export KVM-internal symbols for sub-modules
 only
Message-ID: <20250923012738.GA4102030@ax162>
References: <20250919003303.1355064-1-seanjc@google.com>
 <20250919003303.1355064-3-seanjc@google.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919003303.1355064-3-seanjc@google.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Sean,

On Thu, Sep 18, 2025 at 05:33:00PM -0700, Sean Christopherson wrote:
> diff --git a/arch/powerpc/include/asm/kvm_types.h b/arch/powerpc/include/asm/kvm_types.h
> new file mode 100644
> index 000000000000..656b498ed3b6
> --- /dev/null
> +++ b/arch/powerpc/include/asm/kvm_types.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_PPC_KVM_TYPES_H
> +#define _ASM_PPC_KVM_TYPES_H
> +
> +#if IS_MODULE(CONFIG_KVM_BOOK3S_64_PR) && IS_MODULE(CONFIG_KVM_BOOK3S_64_HV)
> +#define KVM_SUB_MODULES kvm-pr,kvm-hv
> +#elif IS_MODULE(CONFIG_KVM_BOOK3S_64_PR)
> +#define KVM_SUB_MODULES kvm-pr
> +#elif IS_MODULE(CONFIG_KVM_INTEL)

Typo :) which obviously breaks the ppc64_guest_defconfig build.
Changing that to CONFIG_KVM_BOOK3S_64_HV fixes it.

> +#define KVM_SUB_MODULES kvm-hv
> +#else
> +#undef KVM_SUB_MODULES
> +#endif
> +
> +#endif

Also, you'll want to drop kvm_types.h from generic-y to avoid

  scripts/Makefile.asm-headers:39: redundant generic-y found in arch/powerpc/include/asm/Kbuild: kvm_types.h

diff --git a/arch/powerpc/include/asm/Kbuild b/arch/powerpc/include/asm/Kbuild
index e5fdc336c9b2..2e23533b67e3 100644
--- a/arch/powerpc/include/asm/Kbuild
+++ b/arch/powerpc/include/asm/Kbuild
@@ -3,7 +3,6 @@ generated-y += syscall_table_32.h
 generated-y += syscall_table_64.h
 generated-y += syscall_table_spu.h
 generic-y += agp.h
-generic-y += kvm_types.h
 generic-y += mcs_spinlock.h
 generic-y += qrwlock.h
 generic-y += early_ioremap.h
--

Cheers,
Nathan

