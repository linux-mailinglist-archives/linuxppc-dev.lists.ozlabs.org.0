Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 217BF446ED6
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Nov 2021 16:57:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hmhp75y4Dz2yYx
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Nov 2021 02:57:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.52; helo=mail-ot1-f52.google.com;
 envelope-from=philippe.mathieu.daude@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
 [209.85.210.52])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hmhnj2Nqqz2xsH
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  7 Nov 2021 02:56:39 +1100 (AEDT)
Received: by mail-ot1-f52.google.com with SMTP id
 g91-20020a9d12e4000000b0055ae68cfc3dso15200284otg.9
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 06 Nov 2021 08:56:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=eBDSUIjOttiaXGIBqHqfJQJUcKgBFvtaHFb5EhflaV4=;
 b=VWdqzNt8eAKKMJYMQE5PGSoDKjENjxL9ll/hw5uMCB7vbFDrPn+cxytT035jbh4Ml/
 nlioU4yiUOC+XHSjpKXOot1dZoVtV+Y3JyO2uLnX34qroNAuC3AwHqUyQXNswWSD3vpt
 GcS9N8hyYiq6boqWAX8HoXLJfGYpJurm0fcKaJxxUBgluBZUqOwGX5nS9lPURcmh00yA
 UzEuYC0B494uEdc3PsZfT/LJawDyzljgQSrBCDAHGxaTw48ILrLZe4LNetvOtoUmT9kz
 zIzQPJcbkh9Nlr+dvYCxOhKjBuFsNjbVnHo+d/zjn7zruUAL1WBvClqWWUB78+KVXa6v
 w9vw==
X-Gm-Message-State: AOAM53060J/zsVZ/eEmHfebse42ckkVy+XrZR82MeDyDTe1MMLPMjz5G
 0kGArfj+WiPQN279HlZSy4SD+pGf3G5njAyPCwk=
X-Google-Smtp-Source: ABdhPJxwhCJyC+uhck/vVYoIRwMhWus9uJyoYA8q1C4DG6hFBkzj6XG5LHI4onqLHXxXLvHpBvFJjhBzstBp2T8d+3A=
X-Received: by 2002:a9d:4e97:: with SMTP id v23mr20053935otk.190.1636214193915; 
 Sat, 06 Nov 2021 08:56:33 -0700 (PDT)
MIME-Version: 1.0
References: <20211105192101.3862492-1-maz@kernel.org>
 <20211105192101.3862492-3-maz@kernel.org>
In-Reply-To: <20211105192101.3862492-3-maz@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Sat, 6 Nov 2021 16:56:22 +0100
Message-ID: <CAAdtpL4UKw2s7ekxKjKy8XxPR5acq0u1qLR5ontL3T9MWJ5VPQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] KVM: mips: Use kvm_get_vcpu() instead of open-coded
 access
To: Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: kvm <kvm@vger.kernel.org>, David Hildenbrand <david@redhat.com>,
 Atish Patra <atish.patra@wdc.com>, Paul Mackerras <paulus@samba.org>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>, kvmarm@lists.cs.columbia.edu,
 Janosch Frank <frankja@linux.ibm.com>, Huacai Chen <chenhuacai@kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, kernel-team@android.com,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Nicholas Piggin <npiggin@gmail.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>, Juergen Gross <jgross@suse.com>,
 Sean Christopherson <seanjc@google.com>, Anup Patel <anup.patel@wdc.com>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 James Morse <james.morse@arm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Nov 5, 2021 at 9:14 PM Marc Zyngier <maz@kernel.org> wrote:
>
> As we are about to change the way vcpus are allocated, mandate
> the use of kvm_get_vcpu() instead of open-coding the access.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/mips/kvm/loongson_ipi.c | 4 ++--
>  arch/mips/kvm/mips.c         | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
