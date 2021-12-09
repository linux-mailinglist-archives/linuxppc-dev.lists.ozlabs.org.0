Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF8346F2AF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Dec 2021 19:01:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J92005dXYz3bXV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Dec 2021 05:01:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=AfxDwo47;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52c;
 helo=mail-ed1-x52c.google.com; envelope-from=paolo.bonzini@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=AfxDwo47; dkim-atps=neutral
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J91zH4skwz3053
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Dec 2021 05:00:25 +1100 (AEDT)
Received: by mail-ed1-x52c.google.com with SMTP id x10so4857380edd.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Dec 2021 10:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Al9kg2F9KDqFvq3nxTcebEIzKXlYK2ZMwKvTrLWHJ6E=;
 b=AfxDwo47UvGMhAdm6Rw/BtUIa4RRpUznlxWNvCDi2EwKzRCRrPvpJmh+M2nKrIHif6
 RpHyhRpE97GWx32ojsr+vOQSd5ecRefy6O6Vid8OcOd0+D4p0Q2SoCBgR3rrAmmKahlA
 aUl3wft7sP5QEuN7iSZhH5rkRKaVK1peWM2Os+UDkvDQn533w9x1rcBKjnT9Nokfcqta
 Nef0h+w0lhpcQqN0kBurWFGd8S50Mwadf5HiHCGvZWYCzfgJ7NBAmJnNi6ZglYeTn5YH
 YVCRHEqPF2Ka7FDT6tHNM5M/dGc0icYZIyOfod4j1semrTFhGJ0HeqkSr+p8VomRXS/o
 2VaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Al9kg2F9KDqFvq3nxTcebEIzKXlYK2ZMwKvTrLWHJ6E=;
 b=kgGycH05sQ39CEtBm4cp5d/AylNE7S+Qe3VRxXWBCYqGAKmUVYMO4c6v4xxv3Ztrhi
 3TvcuwHxnGMX63g77g7p8M/IaN/2SRsE496CMuypm5kPW+TUbmx6qonJCI9AFD/FNB0F
 myZFlTou+RruEFboZsIzkfWIZWi/zB6eFf1JC04PwDA6Lc+WxNJCKva4leSSU6PRCM9Y
 2PXjqdkf8YmBNSZ9ZdEB96dr8DW53GB4S8Z/2ZDJehb/TQs7O3T7O9pBX6tfwuz7FHkb
 UwchoGgwWDIB7i7LASs5KAoZiC9TBC4aYOxrJhmKZcCcjglhABCcLtvtlzBJWiNgJ8fa
 UwAQ==
X-Gm-Message-State: AOAM532LOJFomd0UfZJkmg3VjTpznhZL1etsSQzfeHDvRoqLz+4MiMPc
 gTKin8acqwsDD0nvZr1vXvM=
X-Google-Smtp-Source: ABdhPJxaGNq1VOGmKW6I6GM+NsKqxWNzc1RuAQMRjvuCk3KwBPxNP9Ur2NQtkE54kPDyjrnXzFPGaA==
X-Received: by 2002:a17:906:7315:: with SMTP id
 di21mr14270348ejc.193.1639072703169; 
 Thu, 09 Dec 2021 09:58:23 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id hs20sm259690ejc.26.2021.12.09.09.58.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Dec 2021 09:58:22 -0800 (PST)
Message-ID: <5549294a-b411-1279-dcd0-3977c19c928e@redhat.com>
Date: Thu, 9 Dec 2021 18:58:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v5 03/12] KVM: s390: Use Makefile.kvm for common files
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, kvm <kvm@vger.kernel.org>
References: <20211121125451.9489-1-dwmw2@infradead.org>
 <20211121125451.9489-4-dwmw2@infradead.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211121125451.9489-4-dwmw2@infradead.org>
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

On 11/21/21 13:54, David Woodhouse wrote:
>   
> -kvm-objs := $(common-objs) kvm-s390.o intercept.o interrupt.o priv.o sigp.o
> +kvm-objs := kvm-s390.o intercept.o interrupt.o priv.o sigp.o
>   kvm-objs += diag.o gaccess.o guestdbg.o vsie.o pv.o

"kvm-y +=" here (for both lines) would be nicer, it's consistent with 
x86 and avoids the question of what happens if you have both kvm-objs 
and kvm-y.

Paolo
