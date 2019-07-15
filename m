Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9333F68222
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2019 04:04:05 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45n6Jx6XNdzDqTZ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2019 12:04:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::641; helo=mail-pl1-x641.google.com;
 envelope-from=sjitindarsingh@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ErKvuoE9"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45n6Gb2SjvzDq9Q
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jul 2019 12:01:59 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id k8so7487894plt.3
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Jul 2019 19:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lA/ZbfEc02zbLPfMDvSjpx/eUQq1QypxqafA6N7NhN8=;
 b=ErKvuoE9bXRPuW359j9IxktUzXwJuaK19B/rNbenI/pLBptRf1hSLSN8CDDOeDTnUT
 /uYQUBy4JqyfuqLFlHtEeui51tYAsiTakLpyXDwO7M6KqcMoe+Mw21VufqyO6ELKO9l4
 gm0n8FLOOE6nt0X0ucK71ZeafFx9k2r10kd/qNkGtjzbaIDUWX6sP48XUjioEOJ1klCJ
 OZgVdhZU+5m91pAaeYAqu/ChEPAT7bhHQ9cwQ/iSlDavQNxqAIj6r8gCe+HRG+vpBgdC
 85LyVwQI72Z0n/kEqNBtRZDNsMZKCQogAXsnDNuYgnvOEmsBnGWY/5WNyGSxNPY9AAYD
 jtEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lA/ZbfEc02zbLPfMDvSjpx/eUQq1QypxqafA6N7NhN8=;
 b=RkFzxyP1M6zpWW6qOG+/V77YTtAcdaIgfTzmTa0tp9IEmFWO6OISJSCvK5DXp2Sxg/
 8SZS5E0G6nzYsG3wgnqIdjqd5mJFcbIMO5VkCslsS3YPKyclN5MjRaRjuQ60MjfCyXkL
 UbzqobTVpJtvV/HuFl2suZ4mWnrbxLLlrL1gMmkeSWAg0KtfjOjYQ0mEZ2qJutQ6YnXu
 1mehZFqmzmeiE/BrbSw82WwwBs38nj5HTWDH0sSld3pDOPowCPtVmgqq0cifOOTg6D/r
 lWAqPljOvehy+LXfw/KPakeDs6IU11tqLO79aRIpNCA3m2Mk/kQC0m2U2CQZZftxoGdD
 nkSQ==
X-Gm-Message-State: APjAAAU8L0NNy2y5r/aPZa8C3cOq4j1DOKtM4EsNu0pW7q2nrNDyuXqO
 kAIct2Qj2WX8wV3eVN3PNFE=
X-Google-Smtp-Source: APXvYqzRcXp0CcRxSqr/P86P+xh+lUDyxmYewjv9BUKmEORpeLvaOYg5X4BtjT421yLiUIt2c/vj7A==
X-Received: by 2002:a17:902:a417:: with SMTP id
 p23mr25194413plq.136.1563156116083; 
 Sun, 14 Jul 2019 19:01:56 -0700 (PDT)
Received: from surajjs2.ozlabs.ibm.com ([122.99.82.10])
 by smtp.googlemail.com with ESMTPSA id o32sm14954211pje.9.2019.07.14.19.01.53
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 14 Jul 2019 19:01:55 -0700 (PDT)
Message-ID: <1563156110.2145.5.camel@gmail.com>
Subject: Re: [PATCH 1/3] KVM: PPC: Book3S HV: Always save guest pmu for
 guest capable of nesting
From: Suraj Jitindar Singh <sjitindarsingh@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Date: Mon, 15 Jul 2019 12:01:50 +1000
In-Reply-To: <87lfx2egt4.fsf@concordia.ellerman.id.au>
References: <20190703012022.15644-1-sjitindarsingh@gmail.com>
 <87lfx2egt4.fsf@concordia.ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.24.6 (3.24.6-1.fc26) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 2019-07-13 at 13:47 +1000, Michael Ellerman wrote:
> Suraj Jitindar Singh <sjitindarsingh@gmail.com> writes:
> > The performance monitoring unit (PMU) registers are saved on guest
> > exit
> > when the guest has set the pmcregs_in_use flag in its lppaca, if it
> > exists, or unconditionally if it doesn't. If a nested guest is
> > being
> > run then the hypervisor doesn't, and in most cases can't, know if
> > the
> > pmu registers are in use since it doesn't know the location of the
> > lppaca
> > for the nested guest, although it may have one for its immediate
> > guest.
> > This results in the values of these registers being lost across
> > nested
> > guest entry and exit in the case where the nested guest was making
> > use
> > of the performance monitoring facility while it's nested guest
> > hypervisor
> > wasn't.
> > 
> > Further more the hypervisor could interrupt a guest hypervisor
> > between
> > when it has loaded up the pmu registers and it calling
> > H_ENTER_NESTED or
> > between returning from the nested guest to the guest hypervisor and
> > the
> > guest hypervisor reading the pmu registers, in
> > kvmhv_p9_guest_entry().
> > This means that it isn't sufficient to just save the pmu registers
> > when
> > entering or exiting a nested guest, but that it is necessary to
> > always
> > save the pmu registers whenever a guest is capable of running
> > nested guests
> > to ensure the register values aren't lost in the context switch.
> > 
> > Ensure the pmu register values are preserved by always saving their
> > value into the vcpu struct when a guest is capable of running
> > nested
> > guests.
> > 
> > This should have minimal performance impact however any impact can
> > be
> > avoided by booting a guest with "-machine pseries,cap-nested-
> > hv=false"
> > on the qemu commandline.
> > 
> > Fixes: 95a6432ce903 "KVM: PPC: Book3S HV: Streamlined guest
> > entry/exit path on P9 for radix guests"
> 
> I'm not clear why this and the next commit are marked as fixing the
> above commit. Wasn't it broken prior to that commit as well?

That was the commit which introduced the entry path which we use for a
nested guest, the path on which we need to be saving and restoring the
pmu registers and so where the new code was introduced.

It wasn't technically broken prior to that commit since you couldn't
run nested prior to that commit, and in fact it's a few commits after
that one where we actually enabled the ability to run nested guests.

However since that's the code which introduced the nested entry path it
seemed like the best fit for the fixes tag for people who will be
looking for fixes in that area. Also all the other nested entry path
fixes used that fixes tag so it ties them together nicely.

Thanks,
Suraj

> 
> cheers
> 
> > Signed-off-by: Suraj Jitindar Singh <sjitindarsingh@gmail.com>
> > ---
> >  arch/powerpc/kvm/book3s_hv.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/arch/powerpc/kvm/book3s_hv.c
> > b/arch/powerpc/kvm/book3s_hv.c
> > index ec1804f822af..b682a429f3ef 100644
> > --- a/arch/powerpc/kvm/book3s_hv.c
> > +++ b/arch/powerpc/kvm/book3s_hv.c
> > @@ -3654,6 +3654,8 @@ int kvmhv_p9_guest_entry(struct kvm_vcpu
> > *vcpu, u64 time_limit,
> >  		vcpu->arch.vpa.dirty = 1;
> >  		save_pmu = lp->pmcregs_in_use;
> >  	}
> > +	/* Must save pmu if this guest is capable of running
> > nested guests */
> > +	save_pmu |= nesting_enabled(vcpu->kvm);
> >  
> >  	kvmhv_save_guest_pmu(vcpu, save_pmu);
> >  
> > -- 
> > 2.13.6
