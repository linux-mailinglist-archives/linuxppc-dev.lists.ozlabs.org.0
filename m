Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6514D4562F0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Nov 2021 19:51:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hw8661tRHz3bj0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Nov 2021 05:51:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=rbZpSNPB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::52d;
 helo=mail-pg1-x52d.google.com; envelope-from=seanjc@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=rbZpSNPB; dkim-atps=neutral
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hw85P0BRhz2ynQ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Nov 2021 05:51:02 +1100 (AEDT)
Received: by mail-pg1-x52d.google.com with SMTP id 28so6207184pgq.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Nov 2021 10:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=zAr8G8m6HwrPqqoGdIArvc5MN7TTOd03aeCBtzrDy6c=;
 b=rbZpSNPBshLLEgA/oYmPUPBbBkHwOg37klgFkMWXqRk+AzrmyZ/M8ccKC2y8hmj5XX
 PLpPwnUPPnPUTd02kdHoVA+HzFD/83CjjC3Xbl8iUzGpDaC5IgVnhNZp/tysG3KqErGy
 5NHK+nazoYp2JBbWoBCcZ90G56QCBVHGDC2bRvtFDuQptjhoIwkzkNewqtOfKXf5uclO
 DhLKIN93hjB32b8vl6mql00pPTkF1CnjBXdgyjfBHRSJU7IHYoN8ZQlZWFAH1r/9oUd0
 jnvQBNIOdWFfAc3UrHP8NU5X0ygb/qQXibVUtpmNCElsCb3HlLNAGjLYo0jNbS4Fc47o
 oIdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=zAr8G8m6HwrPqqoGdIArvc5MN7TTOd03aeCBtzrDy6c=;
 b=voFAcSZWpmQ1wyHtQjYozzHV6MWQbiwtPE2/dsl4sEHfsvA4+srUoPCluppjhj/6Uh
 B5fDksRl7TziIOhUfeoMZW5vxqLF5RcZiE7XTH3jmp1kZXswDSNFnh9PhMtZ045RlSkD
 AArYuSz+c4Jv2j238tC1bnZB8i0nJG0kcP1fmeBy3b1I7EOisEIq/SEi9X8OoGQXXcMg
 pFll+UABVPA17zxgq4ZihtqB49UI4Xoq2eqNugBdpF0bHkIYh2tsmCdtXj0DrTkbYRTj
 cmCt/IcY7k9NXVtA+vL7eDnSgWB01o1APcBsibEuZ8Mm6iGAzq9OdVKOT+zrZi3WDFg3
 NHwQ==
X-Gm-Message-State: AOAM530vx2vERKLrPaHNCLUDr7YYnBqD21QDIPkd4dcgebsd+Sl54pE7
 lOADzs1XKKMIVuW9DUoCdk5Qvg==
X-Google-Smtp-Source: ABdhPJwrEgdsIYmbNbF+vA4sWC6GNXtBMPWh0SewfV4Te7mVM91SE0D0KPe2RQ2SZU3Fb1o23V6Nkg==
X-Received: by 2002:a05:6a00:b49:b0:49f:bad2:bd7c with SMTP id
 p9-20020a056a000b4900b0049fbad2bd7cmr58136547pfo.64.1637261459650; 
 Thu, 18 Nov 2021 10:50:59 -0800 (PST)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id y18sm306696pgh.18.2021.11.18.10.50.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Nov 2021 10:50:59 -0800 (PST)
Date: Thu, 18 Nov 2021 18:50:55 +0000
From: Sean Christopherson <seanjc@google.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH v3 08/12] KVM: Propagate vcpu explicitly to
 mark_page_dirty_in_slot()
Message-ID: <YZagjzYUsixbFre9@google.com>
References: <20211117174003.297096-1-dwmw2@infradead.org>
 <20211117174003.297096-9-dwmw2@infradead.org>
 <85d9fec17f32c3eb9e100e56b91af050.squirrel@twosheds.infradead.org>
 <4c48546b-eb4a-dff7-cc38-5df54f73f5d4@redhat.com>
 <20b5952e76c54a3a5dfe5a898e3b835404ac6fb1.camel@infradead.org>
 <YZaeL5YztL3p1nLM@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YZaeL5YztL3p1nLM@google.com>
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

On Thu, Nov 18, 2021, Sean Christopherson wrote:
> On Thu, Nov 18, 2021, David Woodhouse wrote:
> > That leaves the one in TDP MMU handle_changed_spte_dirty_log() which
> > AFAICT can trigger the same crash seen by butt3rflyh4ck — can't that
> > happen from a thread where kvm_get_running_vcpu() is NULL too? For that
> > one I'm not sure.
> 
> I think could be trigger in the TDP MMU via kvm_mmu_notifier_release()
> -> kvm_mmu_zap_all(), e.g. if the userspace VMM exits while dirty logging is
> enabled.  That should be easy to (dis)prove via a selftest.

Scratch that, the dirty log update is guarded by the new_spte being present, so
zapping of any kind won't trigger it.

Currently, I believe the only path that would create a present SPTE without an
active vCPU is mmu_notifer.change_pte, but that squeaks by because its required
to be wrapped with invalidate_range_{start,end}(MMU_NOTIFY_CLEAR), and KVM zaps
in that situation.

Ben's series to promote pages on disabling of dirty logging will also sqeuak by
because dirty logging is obviously disabled.
