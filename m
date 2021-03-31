Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA0834F7CC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 06:21:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9CnL07Z5z3cGl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 15:21:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=lU/T7acf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=paulus@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=lU/T7acf; dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9CmS5ZyHz30B9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Mar 2021 15:20:56 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1003)
 id 4F9CmR4SpFz9sCD; Wed, 31 Mar 2021 15:20:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1617164455; bh=R5yeQfItJMYJlpFnCudzTg5QYDa/YjngEkHJnRuWw24=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lU/T7acfin8IYqJfb+++vclSDcW2I1lHSIk9+QvAaBa9rNeVKr1ABIYu7rxRp4pQC
 fG8R74l2lH3y3WozkdFqc/OUGAAdThLrsAm7wEc3oEoHkjOb4UKmGYEMUNQZdXTVWC
 Q+qiRMCZinlFkrjI9ZBdPiFJeGeUKLnhOGsGNzHgxZ25ps+YKWSPV1YsBzhX/EStjh
 jqwOQ/5R+dCp+Hgf1atBhkF7UXvfQOLxnrM19bZC5ur0WxLTIPOmskRVZYNeji03p7
 Kpc+vU4eckCAaRJL5fXDKdhtNcBEKFF2si0+vfA5fYWeeWUnPMAnntL8oL3F+Ls9IH
 Sft1LhM8EqtmQ==
Date: Wed, 31 Mar 2021 15:08:25 +1100
From: Paul Mackerras <paulus@ozlabs.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 02/46] KVM: PPC: Book3S HV: Add a function to filter
 guest LPCR bits
Message-ID: <YGP1uXH5q72auwP7@thinks.paulus.ozlabs.org>
References: <20210323010305.1045293-1-npiggin@gmail.com>
 <20210323010305.1045293-3-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210323010305.1045293-3-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 23, 2021 at 11:02:21AM +1000, Nicholas Piggin wrote:
> Guest LPCR depends on hardware type, and future changes will add
> restrictions based on errata and guest MMU mode. Move this logic
> to a common function and use it for the cases where the guest
> wants to update its LPCR (or the LPCR of a nested guest).

[snip]

> @@ -4641,8 +4662,9 @@ void kvmppc_update_lpcr(struct kvm *kvm, unsigned long lpcr, unsigned long mask)
>  		struct kvmppc_vcore *vc = kvm->arch.vcores[i];
>  		if (!vc)
>  			continue;
> +
>  		spin_lock(&vc->lock);
> -		vc->lpcr = (vc->lpcr & ~mask) | lpcr;
> +		vc->lpcr = kvmppc_filter_lpcr_hv(vc, (vc->lpcr & ~mask) | lpcr);

This change seems unnecessary, since kvmppc_update_lpcr is called only
to update MMU configuration bits, not as a result of any action by
userspace or a nested hypervisor.  It's also beyond the scope of what
was mentioned in the commit message.

Paul.
