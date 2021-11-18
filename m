Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 724154563B3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Nov 2021 20:47:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hw9Ln2Z3dz3bhx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Nov 2021 06:47:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=TJltHTqm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::102e;
 helo=mail-pj1-x102e.google.com; envelope-from=seanjc@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=TJltHTqm; dkim-atps=neutral
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hw9L25sp5z2yPs
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Nov 2021 06:47:04 +1100 (AEDT)
Received: by mail-pj1-x102e.google.com with SMTP id
 np6-20020a17090b4c4600b001a90b011e06so6665270pjb.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Nov 2021 11:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=etzXRtUGTr8lCEC3N+zBz9sC9KLaK/1vTaoNub+XSrA=;
 b=TJltHTqmUDTIgL1P24a20gD79MoRsYyT+oWNI7Zk1KCB0kxMW9nay123E+ZoFctpYI
 aiNnMLJVER0OaOWjGQFAAodEb7XssAPkbTv3HZ/7Xvc56U/KwoqRQGvrj5PKP0bcKR4k
 2vvhP28esD9If7TAFeNjBviDlcYadmbYqHQK4EKbmvqKoyyDe2mAxq3N83OoFp8cHZvs
 tW/44+HbAaU7BnQeov5HYKclsNsjLoArhh5d8PMaS08emGsC4hW0iBqIihQVo007XCgE
 f+/05PLBrEHbV7h1EwSp8E42irdKiOdyzv/mpEc9ne+Zn3+nJLJHbZQwUjsMNM99uGwK
 D+nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=etzXRtUGTr8lCEC3N+zBz9sC9KLaK/1vTaoNub+XSrA=;
 b=278LAycss92ZlaA1H2kECAp7ckK9ulO2yW89hftz+302cynN6CHu+L5UfZIosB7mvq
 8cpoQXAOpMssoultsqDNBym134qiH2M3cHn8Uhs2qkJohnr/LYdaZhKdTklXFq1TAeTo
 JebdzNDIVmnuMubEtzPqU8IfhyDJyqBa2XQqIkaSBK/IUad7lrcmSg7JNQGHXyQAThH3
 VSWiyePlDEAFp62/R822Cc/i4y4H8QjY6uh5zd4JimwRVfTQ1VSuYZhAvTRDzK/NdTU1
 AwSrcacIGetJeuWHnQaJZ+2Px7c0tLMA6hVyhgNQyoN15/Jrp3C4M2SJ+wGzR5uirxlP
 XTVg==
X-Gm-Message-State: AOAM530UZGorHZ74oNVWN7g/rmbOC4sbad6cju5rPuoyH+eUuRw3gDLI
 QcTKdIA4fBWUGV8fAvjknVxwrA==
X-Google-Smtp-Source: ABdhPJw2jmwgTmZEgqtXJQ8BT+0frIfcOwv6QQsFYGUkgZtQBdhdiIC61pVtTpnGW9Ux3cY+6emP4Q==
X-Received: by 2002:a17:90b:4d09:: with SMTP id
 mw9mr13604040pjb.238.1637264821320; 
 Thu, 18 Nov 2021 11:47:01 -0800 (PST)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id t40sm435895pfg.107.2021.11.18.11.46.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Nov 2021 11:46:59 -0800 (PST)
Date: Thu, 18 Nov 2021 19:46:56 +0000
From: Sean Christopherson <seanjc@google.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH v3 08/12] KVM: Propagate vcpu explicitly to
 mark_page_dirty_in_slot()
Message-ID: <YZatsB3oadj6dgb8@google.com>
References: <20211117174003.297096-1-dwmw2@infradead.org>
 <20211117174003.297096-9-dwmw2@infradead.org>
 <85d9fec17f32c3eb9e100e56b91af050.squirrel@twosheds.infradead.org>
 <4c48546b-eb4a-dff7-cc38-5df54f73f5d4@redhat.com>
 <20b5952e76c54a3a5dfe5a898e3b835404ac6fb1.camel@infradead.org>
 <YZaeL5YztL3p1nLM@google.com> <YZagjzYUsixbFre9@google.com>
 <35AEC3FD-B46A-451D-B7D5-4B1BDD5407BD@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <35AEC3FD-B46A-451D-B7D5-4B1BDD5407BD@infradead.org>
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
Cc: Anup Patel <anup.patel@wdc.com>,
 "wanpengli @ tencent . com" <wanpengli@tencent.com>, kvm <kvm@vger.kernel.org>,
 Joao Martins <joao.m.martins@oracle.com>, Will Deacon <will@kernel.org>,
 kvmarm@lists.cs.columbia.edu, linux-s390@vger.kernel.org,
 "joro @ 8bytes . org" <joro@8bytes.org>, Huacai Chen <chenhuacai@kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, karahmed@amazon.com,
 Catalin Marinas <catalin.marinas@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 "jmattson @ google . com" <jmattson@google.com>,
 "mtosatti @ redhat . com" <mtosatti@redhat.com>, linux-mips@vger.kernel.org,
 James Morse <james.morse@arm.com>, kvm-riscv@lists.infradead.org,
 Marc Zyngier <maz@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 "vkuznets @ redhat . com" <vkuznets@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Nov 18, 2021, David Woodhouse wrote:
> 
> 
> On 18 November 2021 18:50:55 GMT, Sean Christopherson <seanjc@google.com> wrote:
> >On Thu, Nov 18, 2021, Sean Christopherson wrote:
> >> On Thu, Nov 18, 2021, David Woodhouse wrote:
> >> > That leaves the one in TDP MMU handle_changed_spte_dirty_log() which
> >> > AFAICT can trigger the same crash seen by butt3rflyh4ck — can't that
> >> > happen from a thread where kvm_get_running_vcpu() is NULL too? For that
> >> > one I'm not sure.
> >> 
> >> I think could be trigger in the TDP MMU via kvm_mmu_notifier_release()
> >> -> kvm_mmu_zap_all(), e.g. if the userspace VMM exits while dirty logging is
> >> enabled.  That should be easy to (dis)prove via a selftest.
> >
> >Scratch that, the dirty log update is guarded by the new_spte being present, so
> >zapping of any kind won't trigger it.
> >
> >Currently, I believe the only path that would create a present SPTE without an
> >active vCPU is mmu_notifer.change_pte, but that squeaks by because its required
> >to be wrapped with invalidate_range_{start,end}(MMU_NOTIFY_CLEAR), and KVM zaps
> >in that situation.
> 
> Is it sufficient to have *an* active vCPU?  What if a VMM has threads for
> active vCPUs but is doing mmap/munmap on a *different* thread? Does that not
> suffer the same crash?

It is sufficient for the current physical CPU to have an active vCPU, which is
generally guaranteed in the MMU code because, with a few exceptions, populating
SPTEs is done in vCPU context.

mmap() will never directly trigger SPTE creation, KVM first requires a vCPU to
fault on the new address.  munmap() is a pure zap flow, i.e. won't create a
present SPTE and trigger the writeback of the dirty bit.

That's also why I dislike using kvm_get_running_vcpu(); when it's needed, there's
a valid vCPU from the caller, but it deliberately gets dropped and indirectly
picked back up.
