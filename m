Return-Path: <linuxppc-dev+bounces-9409-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E954ADAF95
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Jun 2025 14:01:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bLT8d1sRDz30LS;
	Mon, 16 Jun 2025 22:00:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.191
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750073375;
	cv=none; b=FE0qow9/3SWVae0oj3zy8TUhjvwdNjjEUpJxds5jZ7kKTChedKEUDRxzS/0+JgyAx17UKKUSf6nQIdcsXBQIpe5+DSYUeIkIT2tsLOvaCqr8Y8FqdVguZMpMcocoORSZD/rLEzYZ5LsVJlFK/y3FX/1A+GqgXXEJwzlwXy0L7NiZrdJUyVG2+Vo7pAfoZaPGw/L1I/MmrFrGG3xh3Zzfq3KwTMZjA8Ttr8278psFKOtISlbjV0fQBbZxbt52C4Kirb6P7Bgzd/NbF3fDAN37VE59WH0yXNSIb2hs57N6kfOZJ1coKH987w8rfREhbCN/8TEQ0Wsc4U5B6PLS3rRsbw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750073375; c=relaxed/relaxed;
	bh=gZItC2basXtuPKHHTklRpTxUFJMNSX2lb78hHL2M/jA=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=QaVb0bem6XRlk5Jt15vIuZ9yGVv3oM0O030iSXyMVDGOEn54r6W9s6wyMJynf/2oFLBi3FNcogdCXQ/dkiAKow86JHijD52soS/DPCFTIFjekosK5rwVG7nWdOT9fQphD2zV2z3lK6pNqsvSN1EBEaX+fuX5rMD6EMjX9ITHOtFwgy1mY5l1jsVSP1VfD+k165Eo4EOOH2aXbBEPGUnrMyNFNlbxcOqdDiYfCjk1Tnn7Z70nPC87lWRr0hrCW7CQ5YXHO1ton0P9eC+V5+69npgpompa0BVqKPIu+YZoqO+jasj+KPL9m6PicUims/3QiAbuSvCmSGj3ICM2e1ujQA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.191; helo=szxga05-in.huawei.com; envelope-from=yuzenghui@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.191; helo=szxga05-in.huawei.com; envelope-from=yuzenghui@huawei.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 1161 seconds by postgrey-1.37 at boromir; Mon, 16 Jun 2025 21:29:34 AEST
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bLSTB3f7xz2xHZ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Jun 2025 21:29:32 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4bLRzy28PLz1V43x;
	Mon, 16 Jun 2025 19:07:42 +0800 (CST)
Received: from kwepemk200017.china.huawei.com (unknown [7.202.194.83])
	by mail.maildlp.com (Postfix) with ESMTPS id 287C3180044;
	Mon, 16 Jun 2025 19:10:06 +0800 (CST)
Received: from [10.174.178.219] (10.174.178.219) by
 kwepemk200017.china.huawei.com (7.202.194.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 16 Jun 2025 19:10:04 +0800
Subject: Re: [PATCH 3/8] KVM: arm64: Move ARM specific headers in include/kvm
 to arch directory
To: Sean Christopherson <seanjc@google.com>
CC: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan
	<maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda
	<imbrenda@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
	<linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<kvm@vger.kernel.org>, <loongarch@lists.linux.dev>,
	<linux-mips@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	<kvm-riscv@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Anish Ghulati <aghulati@google.com>, Colton
 Lewis <coltonlewis@google.com>, Thomas Huth <thuth@redhat.com>
References: <20250611001042.170501-1-seanjc@google.com>
 <20250611001042.170501-4-seanjc@google.com>
From: Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <a5032f01-9f54-eff9-ee72-b159ed56ca70@huawei.com>
Date: Mon, 16 Jun 2025 19:10:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
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
In-Reply-To: <20250611001042.170501-4-seanjc@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.219]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk200017.china.huawei.com (7.202.194.83)
X-Spam-Status: No, score=-5.1 required=3.0 tests=NICE_REPLY_A,
	RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 2025/6/11 8:10, Sean Christopherson wrote:
> Move kvm/arm_{arch_timer,pmu,vgic}.h to arch/arm64/include/asm and drop
> the "arm" prefix from all file names.  Now that KVM no longer supports
> 32-bit ARM, there is no reason to expose ARM specific headers to other
> architectures beyond arm64.
> 
> Cc: Colton Lewis <coltonlewis@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  .../arm64/include/asm/kvm_arch_timer.h                     | 0
>  arch/arm64/include/asm/kvm_host.h                          | 7 +++----
>  include/kvm/arm_pmu.h => arch/arm64/include/asm/kvm_pmu.h  | 0
>  .../kvm/arm_vgic.h => arch/arm64/include/asm/kvm_vgic.h    | 0
>  arch/arm64/kvm/arch_timer.c                                | 5 ++---
>  arch/arm64/kvm/arm.c                                       | 3 +--
>  arch/arm64/kvm/pmu-emul.c                                  | 4 ++--
>  arch/arm64/kvm/reset.c                                     | 3 +--
>  arch/arm64/kvm/trace_arm.h                                 | 2 +-
>  arch/arm64/kvm/vgic/vgic-debug.c                           | 2 +-
>  arch/arm64/kvm/vgic/vgic-init.c                            | 2 +-
>  arch/arm64/kvm/vgic/vgic-irqfd.c                           | 2 +-
>  arch/arm64/kvm/vgic/vgic-kvm-device.c                      | 2 +-
>  arch/arm64/kvm/vgic/vgic-mmio-v2.c                         | 2 +-
>  arch/arm64/kvm/vgic/vgic-mmio-v3.c                         | 2 +-
>  arch/arm64/kvm/vgic/vgic-mmio.c                            | 4 ++--
>  arch/arm64/kvm/vgic/vgic-v2.c                              | 2 +-
>  arch/arm64/kvm/vgic/vgic-v3-nested.c                       | 3 +--
>  arch/arm64/kvm/vgic/vgic-v3.c                              | 2 +-
>  19 files changed, 21 insertions(+), 26 deletions(-)
>  rename include/kvm/arm_arch_timer.h => arch/arm64/include/asm/kvm_arch_timer.h (100%)
>  rename include/kvm/arm_pmu.h => arch/arm64/include/asm/kvm_pmu.h (100%)
>  rename include/kvm/arm_vgic.h => arch/arm64/include/asm/kvm_vgic.h (100%)

Nitpick:

|F:	include/kvm/arm_*

can be deleted from the KVM/arm64 MAINTAINERS entry now.

Thanks,
Zenghui

