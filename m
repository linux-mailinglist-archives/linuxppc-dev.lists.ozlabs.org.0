Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 097DD3EA7DA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Aug 2021 17:42:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GlrXn6xb4z3bW1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Aug 2021 01:42:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=G6RCX9QE;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=G6RCX9QE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=G6RCX9QE; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=G6RCX9QE; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GlrWz5r3Vz30B9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Aug 2021 01:41:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628782888;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wVAySSNkRIQjjk+QH2YkijF+uGWoxw5I4DLvZClTw1U=;
 b=G6RCX9QEnL4Zf8vfwUjHYbM4kSdslBkMX3aCmO5/Z4t57VUaBHV/d+HZBrzfwIwfMk3v2y
 j5i6sC7AOSXC5dxJ98EYEw0iIv2YlE4RpLDnEGL9uFjlG9+gvrXaZu/8AfqGT+whsAmtAZ
 ppQGXoMzB1k8VCpKK+0jHf9iPLFCa2Y=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628782888;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wVAySSNkRIQjjk+QH2YkijF+uGWoxw5I4DLvZClTw1U=;
 b=G6RCX9QEnL4Zf8vfwUjHYbM4kSdslBkMX3aCmO5/Z4t57VUaBHV/d+HZBrzfwIwfMk3v2y
 j5i6sC7AOSXC5dxJ98EYEw0iIv2YlE4RpLDnEGL9uFjlG9+gvrXaZu/8AfqGT+whsAmtAZ
 ppQGXoMzB1k8VCpKK+0jHf9iPLFCa2Y=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-m7OHyrC9Py2npyqhBt1cDg-1; Thu, 12 Aug 2021 11:41:26 -0400
X-MC-Unique: m7OHyrC9Py2npyqhBt1cDg-1
Received: by mail-ed1-f70.google.com with SMTP id
 e3-20020a50ec830000b02903be5be2fc73so3204957edr.16
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Aug 2021 08:41:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wVAySSNkRIQjjk+QH2YkijF+uGWoxw5I4DLvZClTw1U=;
 b=IEpF8WS7MSx7PG/1fVGWx43OJOmuVCPxf8xq28G56U2p30yoebiH7vM55cWN3GyypB
 I3nczs4O8pDo82iAOjnPs6c/5JXYo1ynSsqnrn3m/GlEqjyXFW7vGnETj5V3Y70Xjc0Z
 u8P5F+DYH1jAislHyb/ZkhukNjMRHH4LlQUF63+lCzHmI1x4iBFvaeJbRbw3Hrs6QZ00
 2WRbSMFZhlJKSkmhgk9eBVJtEPRTdMPvu14yJCHUysj7Yv0v2bv+XEN/x0MEt+bFGP+i
 DYfjrhWsqHFQNo+tDiJMPHpken4ONUwseejkAdZd/52g4njTN2a8XY7HJKg6fI1GBQoO
 yZWQ==
X-Gm-Message-State: AOAM532stzfT0dpqnuCLaiWL2YOO5x71C098xvCvIFRbMhMaDusb2u32
 iBdO71DJnClOB7be91sOKKwBtlSpMMRimAHIOWitp+AROAD49b1EyUZAKh+nOE6100AHRF+1lJh
 mfai9C6tIbHLDDfcglZS+TFyr8g==
X-Received: by 2002:a50:ef11:: with SMTP id m17mr6095944eds.233.1628782885251; 
 Thu, 12 Aug 2021 08:41:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzbkauFimraFjcUcxW/s5naeDzEHblJnwTGW5kN8SFMxVNVXXtWI2AkXQ1TgeG7maJbDTkRTw==
X-Received: by 2002:a50:ef11:: with SMTP id m17mr6095860eds.233.1628782884809; 
 Thu, 12 Aug 2021 08:41:24 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id s18sm988134ejh.12.2021.08.12.08.41.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Aug 2021 08:41:24 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] KVM: Refactor kvm_arch_vcpu_fault() to return a
 struct page pointer
To: David Hildenbrand <david@redhat.com>,
 Hou Wenlong <houwenlong93@linux.alibaba.com>, kvm@vger.kernel.org
References: <YRQcZqCWwVH8bCGc@google.com>
 <1c510b24fc1d7cbae8aa4b69c0799ebd32e65b82.1628739116.git.houwenlong93@linux.alibaba.com>
 <98adbd3c-ec6f-5689-1686-2a8a7909951a@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <d29447d4-a1b4-7f12-7bbc-8dc24cb38b72@redhat.com>
Date: Thu, 12 Aug 2021 17:41:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <98adbd3c-ec6f-5689-1686-2a8a7909951a@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: x86@kernel.org, Wanpeng Li <wanpengli@tencent.com>,
 linux-mips@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>,
 kvmarm@lists.cs.columbia.edu, linux-s390@vger.kernel.org,
 Janosch Frank <frankja@linux.ibm.com>, Marc Zyngier <maz@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Huacai Chen <chenhuacai@kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Ingo Molnar <mingo@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Heiko Carstens <hca@linux.ibm.com>, kvm-ppc@vger.kernel.org,
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 linux-arm-kernel@lists.infradead.org, Jim Mattson <jmattson@google.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Sean Christopherson <seanjc@google.com>, Cornelia Huck <cohuck@redhat.com>,
 linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12/08/21 11:04, David Hildenbrand wrote:
> 
> Reviewed-by: David Hildenbrand <david@redhat.com>
> 
> But at the same time I wonder if we should just get rid of 
> CONFIG_KVM_S390_UCONTROL and consequently kvm_arch_vcpu_fault().
> 
> In practice CONFIG_KVM_S390_UCONTROL, is never enabled in any reasonable 
> kernel build and consequently it's never tested; further, exposing the 
> sie_block to user space allows user space to generate random SIE 
> validity intercepts.
> 
> CONFIG_KVM_S390_UCONTROL feels like something that should just be 
> maintained out of tree by someone who really needs to hack deep into hw 
> virtualization for testing purposes etc.

I have no preference either way.  It should definitely have selftests, 
but in x86 land there are some features that are not covered by QEMU and 
were nevertheless accepted upstream with selftests.

Paolo

