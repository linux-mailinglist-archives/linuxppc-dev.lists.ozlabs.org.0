Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1D84562A5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Nov 2021 19:41:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hw7tR0Gmmz3c6V
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Nov 2021 05:41:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=DnjI9osT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::62b;
 helo=mail-pl1-x62b.google.com; envelope-from=seanjc@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=DnjI9osT; dkim-atps=neutral
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hw7sj45Thz2ymq
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Nov 2021 05:40:55 +1100 (AEDT)
Received: by mail-pl1-x62b.google.com with SMTP id z6so4830483plk.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Nov 2021 10:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=grrMnij3a2kLK2nD9/+zi8H0lxQV5j7EQVRD7AIwS2E=;
 b=DnjI9osT+moWRQdwwunhhgYe2YGuzWKrQy5JwjvEJNUqQcpvnb0WoX5Pei6uXI5OdC
 7eGLhv3YIzk62P6sC5D7JBPnUohj6O7s664U/+jqNIv857J2ijyYc9lxkutY0si+1Jso
 ztfH/9rMsVdRRal+62dCEzvALKr3rtl5XahGBeHA8m4ynGczBHkUGlN7RYWuUfQGcFke
 WSfMnan0Kg6M9yWEVCFKWFu1Oy/he0ioyfZD1myK/YDRWIUpBN/5hc73yoNPRxPOyT9C
 VLzYMyPNfdN9orn15Wn6MlOWGc4Qs8aD/O0pRMiPP4mF4KE17PRSHz5sCFRZguQ3AWZA
 KcTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=grrMnij3a2kLK2nD9/+zi8H0lxQV5j7EQVRD7AIwS2E=;
 b=4qPS4YP8/KQ3/ZvTxP1RhgyfvRHAm7i42FdqHHSqrJaPDE98rb1GbrvqjLomy0wLvU
 +BJCBkMynpjCnf09pjBa6NscOBMIOULTADi/GsKc8QWjbbyt4Vr0BTMor0bUEFmxejlV
 lqFAMBjNVFvpA8HUGknfvHl/TBqz8CH9rKVFuHjlaBfIsXK6X6Cs4M8Yk8AJNAKzQR7O
 wOXpqddF/RAZohnuhfmD841Q3aMGQ4h8h/mxNLepsu1oWch///mMy0oi9EzAOjy8jCgD
 x9+sbB+hhnazJmlztZEtKHTy99cnvp+QsPK9WaC1KdnExJsspZpscKAYTGI/JI02Y3R2
 9z2w==
X-Gm-Message-State: AOAM531uaAHDRGESB7lm2M9dNRwwZX5iJ89U2AUfoTtysNQw/5uHrtvi
 oRPYi6vqdsIXVa6LpVBd9Q1zqw==
X-Google-Smtp-Source: ABdhPJxTT+sS2hBA2CisuiyQO1bWgOM4L3odX2TF09Y4yJcQHjhUg5+FNsR41T/1dQnqfraxxzIiPQ==
X-Received: by 2002:a17:90a:af94:: with SMTP id
 w20mr12506911pjq.223.1637260851435; 
 Thu, 18 Nov 2021 10:40:51 -0800 (PST)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id a12sm8600266pjq.16.2021.11.18.10.40.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Nov 2021 10:40:50 -0800 (PST)
Date: Thu, 18 Nov 2021 18:40:47 +0000
From: Sean Christopherson <seanjc@google.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH v3 08/12] KVM: Propagate vcpu explicitly to
 mark_page_dirty_in_slot()
Message-ID: <YZaeL5YztL3p1nLM@google.com>
References: <20211117174003.297096-1-dwmw2@infradead.org>
 <20211117174003.297096-9-dwmw2@infradead.org>
 <85d9fec17f32c3eb9e100e56b91af050.squirrel@twosheds.infradead.org>
 <4c48546b-eb4a-dff7-cc38-5df54f73f5d4@redhat.com>
 <20b5952e76c54a3a5dfe5a898e3b835404ac6fb1.camel@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20b5952e76c54a3a5dfe5a898e3b835404ac6fb1.camel@infradead.org>
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
> That leaves the one in TDP MMU handle_changed_spte_dirty_log() which
> AFAICT can trigger the same crash seen by butt3rflyh4ck — can't that
> happen from a thread where kvm_get_running_vcpu() is NULL too? For that
> one I'm not sure.

I think could be trigger in the TDP MMU via kvm_mmu_notifier_release()
-> kvm_mmu_zap_all(), e.g. if the userspace VMM exits while dirty logging is
enabled.  That should be easy to (dis)prove via a selftest.

And for the record :-)

On Mon, Dec 02, 2019 at 12:10:36PM -0800, Sean Christopherson wrote:
> IMO, adding kvm_get_running_vcpu() is a hack that is just asking for future
> abuse and the vcpu/vm/as_id interactions in mark_page_dirty_in_ring()
> look extremely fragile.

On 03/12/19 20:01, Sean Christopherson wrote:
> In case it was clear, I strongly dislike adding kvm_get_running_vcpu().
> IMO, it's a unnecessary hack.  The proper change to ensure a valid vCPU is
> seen by mark_page_dirty_in_ring() when there is a current vCPU is to
> plumb the vCPU down through the various call stacks.
