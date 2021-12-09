Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F38046F380
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Dec 2021 19:56:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J93D620HWz3cPC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Dec 2021 05:56:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=BgFP9f2A;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52f;
 helo=mail-ed1-x52f.google.com; envelope-from=paolo.bonzini@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=BgFP9f2A; dkim-atps=neutral
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J93CN43c3z3bXW
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Dec 2021 05:55:58 +1100 (AEDT)
Received: by mail-ed1-x52f.google.com with SMTP id x10so5327564edd.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Dec 2021 10:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pWwoYV6f5eE3TAEXwDK4FFkFf2kDxMmFmHp/m8WrKqU=;
 b=BgFP9f2AS8qbKScGYulFkIKBIZF7JhPtQutQZsMXRAyJ3VsVqzndrMn244/YxeSa51
 1JUMrJPUwH6WLWl6wKGB+t4kB+BfxBS/3tylxelJEEsxjfutVgkY0NGGWdXlHSxUH9/s
 IG5V5H9F2fbokZUBDHFl4GJeYwFtPdJjNvWKwn/iXALcP0VtLbtjDrHf8WZWTCwB3Xhm
 geXXoQOtv6TQOuhRK4Dwojif5cLxpkeylANQuiS2B3K1Yq5gB28MA62ZLyfdvPigvuID
 /R8nJ2bNX2pioETM5nl38v0+1+ad+KAxF1M3iKasVf2dXhApLQn8URlgJhmcpu2xwC3Q
 0KEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pWwoYV6f5eE3TAEXwDK4FFkFf2kDxMmFmHp/m8WrKqU=;
 b=FRGZKBthpIrdEal1LegWKwYhfogyaLSoabzbN+StA5CQzyRxMfqUPkTbGicZtAAF1E
 dyolUHTYx/Hl/PG1cWvRJ6n+FF06gR0LG0cDP5frmdGyXvLEvfUuFdytMY9Fv5p4Dm3d
 QtLTWDAcU4010ZFbbnxNABYgaURiKKm6S2fWXZd59Fri3fyDJcBxQbkoYls6W7tysGvY
 BWqfWaqXDutP1x52NSMGIgr8SOZSbvutMGBfj2hbco47zgdZrDmFpGueO4Z9kBHrn2BY
 6ivHvJlEDeKKMfN1cFqJymZSMXjBsbNGI1NcwHOlmkWDTfeaoHbpee5ZENC1jJXO0GPT
 IYIg==
X-Gm-Message-State: AOAM532Naq9fKl8e22CXpYN4FyLZFosHZMyO+hhs1fC/AoqdaSfq4s/d
 HJq2Zoe1DH9gVepjDBbCjDI=
X-Google-Smtp-Source: ABdhPJwFiK8t4T2rMj2CnTJwfI5KDFX/WPkj8rfHAoRspVvoAsdM3AeM8i4uwXNbLWDTdu8wAOHXxw==
X-Received: by 2002:a05:6402:40d2:: with SMTP id
 z18mr31216197edb.395.1639076154663; 
 Thu, 09 Dec 2021 10:55:54 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id h7sm279134edb.89.2021.12.09.10.55.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Dec 2021 10:55:54 -0800 (PST)
Message-ID: <68d867c7-1031-00be-e28d-bd435d9c4170@redhat.com>
Date: Thu, 9 Dec 2021 19:55:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v5 00/12] KVM: x86/xen: Add in-kernel Xen event channel
 delivery
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, kvm <kvm@vger.kernel.org>
References: <20211121125451.9489-1-dwmw2@infradead.org>
 <2617aea0-af09-5c0d-1fd7-65e2a814b516@redhat.com>
 <5706a7fec0ffdb18097792374dad90c0400b17cd.camel@infradead.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <5706a7fec0ffdb18097792374dad90c0400b17cd.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Anup Patel <anup.patel@wdc.com>,
 "wanpengli @ tencent . com" <wanpengli@tencent.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Joao Martins <joao.m.martins@oracle.com>, Will Deacon <will@kernel.org>,
 kvmarm@lists.cs.columbia.edu, linux-s390@vger.kernel.org,
 "joro @ 8bytes . org" <joro@8bytes.org>, Huacai Chen <chenhuacai@kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, karahmed@amazon.com,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 butt3rflyh4ck <butterflyhuangxx@gmail.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 "jmattson @ google . com" <jmattson@google.com>,
 "seanjc @ google . com" <seanjc@google.com>,
 "mtosatti @ redhat . com" <mtosatti@redhat.com>, linux-mips@vger.kernel.org,
 James Morse <james.morse@arm.com>, kvm-riscv@lists.infradead.org,
 Marc Zyngier <maz@kernel.org>, "vkuznets @ redhat . com" <vkuznets@redhat.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12/9/21 19:47, David Woodhouse wrote:
>>> As in the previous two rounds, the last patch (this time patch 12) is
>>> included as illustration of how we*might*  use this for fixing the UAF
>>> bugs in nesting, but isn't intended to be applied as-is. Patches 1-11 are.
>> Queued 1-7, will be on kvm/next tomorrow though.
>
> Thanks. I assume you made the changes you wanted to the makefiles then,
> and will work on the gfn_to_pfn_cache changes you suggested.

Yes, thanks.

Paolo
