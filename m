Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45947942169
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2024 22:15:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Wpt9ndkV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WYRLQ1kdmz3d8G
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2024 06:15:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Wpt9ndkV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com; envelope-from=3xkmpzgykddspbxkgzdlldib.zljifkrummz-absifpqp.lwixyp.lod@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WYRKk3pbDz3cZ9
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2024 06:15:05 +1000 (AEST)
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1fc4e03a885so38638075ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2024 13:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722370502; x=1722975302; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=C8yo2cbMxRjf1SYFGiWaoP3WEwWP/CuFq0W0aGvMAlc=;
        b=Wpt9ndkVqVyqQkQIAKLBAbLOf7we0Ojpdi71TH5SLW14jSCmLoTbyKamD6QIAMSRlO
         tRrnkcfki+ZISch5ge/oI3TYji7aBqKw4LOjgodn/08v05IKJhwMz+nydnB1C3WKpay0
         +kCVNKc7FFVYGZvP1OfrpChYjIqyt/VKYRPNavxYuiDx6J1c3XmRO8cyuxinKjiCN4Iu
         LpeXQyJf1pFHlpsTqDcRsFAvjR1BAooqB+aKVTf1d5AGoZFfQZ3A/QADJAOmlelije8M
         lJnxLtN1/4k6Sy20NGVQ3flpFY7efoTnnsRai2V9XTdPCl9bCwdNl/ntoU9Eq4eEkD8c
         UyDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722370502; x=1722975302;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C8yo2cbMxRjf1SYFGiWaoP3WEwWP/CuFq0W0aGvMAlc=;
        b=QsOa6C56secImSnpuC2ikZMgFbViqGjnJfXIDiJZDP8yjMKSUBD2VGQvCM2YdrJi2i
         Tu3wOV+7wYINVeNMm4ZCQNNf0lGSuziZl8NSM8xJFEVPWXaByH7c0nr5kq+rifg2w6Iz
         6HMDpmywchFPo6RFNK0pcPhODmblAdQn/Heids8Kk7+4ry0+iZxL2M1YZmgNoRQqMix1
         OZEys7ZI8hu7b/4VGpwMCISLvtLoangkcAGSBMtbPvpv/gCeGDo4HgKDD+5oykLyzJTI
         NZW9nmzTskAUtHO8D+nBjoECYNOVof3VWA3zql7P7LODfJBGp+CqiQ4LPOsXghs7WnHg
         pSQA==
X-Forwarded-Encrypted: i=1; AJvYcCVyUQQRI2rZX2Rs7e7eJUERjzo7zB3gS6K2MCOEmuQt+73PHaOePxYodvvx7dx3eq2+RZWkGgfAtquhFdH6YqzhIQOrsP0FeLH87zCBIA==
X-Gm-Message-State: AOJu0YxBA+1uLKEZH/ANUlpShQuc9X0SDNCbU7SCFeTKSi3vDu7Z4YE2
	tAcSmVmFuIVxLAa3UxN7h6y2CYAvcSvEAqIL2dS54l/BYmo+CB59VcUuUFoXWRsG03gjUgMiIQk
	hpg==
X-Google-Smtp-Source: AGHT+IH9iITYoLB/ZN9Oi4VKGOQu9lhx7HYkDR9WKhrc/jsriwfmp+7ZOuZAysZ686xisdvdjIEEvamlnSs=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:ea01:b0:1fb:54d9:ebb3 with SMTP id
 d9443c01a7336-1ff04828eb3mr5974125ad.6.1722370502109; Tue, 30 Jul 2024
 13:15:02 -0700 (PDT)
Date: Tue, 30 Jul 2024 13:15:00 -0700
In-Reply-To: <63c41e25-2523-4397-96b4-557394281443@redhat.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com> <20240726235234.228822-35-seanjc@google.com>
 <63c41e25-2523-4397-96b4-557394281443@redhat.com>
Message-ID: <ZqlJxJyOdsR206Zc@google.com>
Subject: Re: [PATCH v12 34/84] KVM: Add a helper to lookup a pfn without
 grabbing a reference
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="us-ascii"
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
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, David Matlack <dmatlack@google.com>, linux-riscv@lists.infradead.org, Claudio Imbrenda <imbrenda@linux.ibm.com>, Marc Zyngier <maz@kernel.org>, Janosch Frank <frankja@linux.ibm.com>, Huacai Chen <chenhuacai@kernel.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Bibo Mao <maobibo@loongson.cn>, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, David Stevens <stevensd@chromium.org>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 30, 2024, Paolo Bonzini wrote:
> On 7/27/24 01:51, Sean Christopherson wrote:
> > Add a kvm_follow_pfn() wrapper, kvm_lookup_pfn(), to allow looking up a
> > gfn=>pfn mapping without the caller getting a reference to any underlying
> > page.  The API will be used in flows that want to know if a gfn points at
> > a valid pfn, but don't actually need to do anything with the pfn.
> 
> Can you rename the function kvm_gfn_has_pfn(), or kvm_gfn_can_be_mapped(),
> and make it return a bool?

Heh, sure.  I initially planned on having it return a bool, but I couldn't figure
out a name, mainly because the kernel's pfn_valid() makes things like
kvm_gfn_has_valid_pfn() confusing/misleading :-(

> (As an aside, I wonder if reexecute_instruction() could just use
> kvm_is_error_hva(kvm_vcpu_gfn_to_hva(vcpu, gpa_to_gfn(gpa)) instead of going
> all the way to a pfn.  But it's ok to be more restrictive).

Heh #2, I wondered the same thing.  I think it would work?  Verifying that there's
a usable pfn also protects against retrying an access that hit -EHWPOISON, but I'm
prety sure that would require a rare race, and I don't think it could result in
the guest being put into an infinite loop.
