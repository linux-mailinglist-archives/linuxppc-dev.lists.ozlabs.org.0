Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2F31E79D1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 May 2020 11:50:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49YKYf08PkzDqVB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 May 2020 19:50:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.120;
 helo=us-smtp-1.mimecast.com; envelope-from=pbonzini@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=Xp+FpzNS; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=Xp+FpzNS; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49YKWV6jKPzDqSt
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 May 2020 19:48:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590745699;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f6w/D95eveaUv1V0PC/H4Q2Slese/OFGRios5LqI3Lo=;
 b=Xp+FpzNSig6u6XpQeRDVCu08pG9SZU1pkJBd1viCvCmkXu0jmPnJcVNPkybA+vaeoeRWjH
 Ky3xEa33kvBO+9ZCGKIGTreFRWvirjEuBUhsGa3ddFMS2aTX7oDMAq1qZh23zjgEKQ+gSn
 lDsN6OevHGTbIs7EhPRSnkIMk7yQ1Mo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590745699;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f6w/D95eveaUv1V0PC/H4Q2Slese/OFGRios5LqI3Lo=;
 b=Xp+FpzNSig6u6XpQeRDVCu08pG9SZU1pkJBd1viCvCmkXu0jmPnJcVNPkybA+vaeoeRWjH
 Ky3xEa33kvBO+9ZCGKIGTreFRWvirjEuBUhsGa3ddFMS2aTX7oDMAq1qZh23zjgEKQ+gSn
 lDsN6OevHGTbIs7EhPRSnkIMk7yQ1Mo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-yiV0VmOnOFmgmx5c52QLfg-1; Fri, 29 May 2020 05:48:17 -0400
X-MC-Unique: yiV0VmOnOFmgmx5c52QLfg-1
Received: by mail-wr1-f70.google.com with SMTP id a4so824611wrp.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 May 2020 02:48:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=f6w/D95eveaUv1V0PC/H4Q2Slese/OFGRios5LqI3Lo=;
 b=TODPH3Sus+zlzHJNz9AwgLuQgT8QdlfVdRZrcK461SMRwmoTaAyRf1ed+HOl5Aps7Q
 FATk8R19fTS6jZVXSFr2OZR7QqZc/ROgwqGvfu88jpVAvf2dvPNOMCCczDt3bgLCoHc1
 29J06AlyZxT5+7hG4KrKLjWkx4oQnSUM3huGc9d4JA/uVRo8CX+cdN32VysG6YSjWq3m
 LVi9uGKmKAhyqfEPGD09zGwLd+ul1s5h3VCFPAsK4q8JlS3fyp5LSBTPLbvvnQZ6nNAs
 8yFa/v6R7pjFifiL+klCiEN6LVGbcI90t/0INuSa2vcO8DI/Z4AZ6cAPuNxfD1fWJ3hA
 n+KQ==
X-Gm-Message-State: AOAM532IxRHiCFeEX/1yEmIER9v8Woxi+LaBKDZxjxcTWIh41oZ742+N
 62LbIj92qze/0YBZpxP4/e8r4+lKAelJ5SXg8SehT0UIwbOtWibqaQBTLWMh+g7qod7VGJKiQH2
 KwOvygLym6wa9kYNpjWksUtOgrw==
X-Received: by 2002:a05:6000:124e:: with SMTP id
 j14mr7990032wrx.154.1590745695769; 
 Fri, 29 May 2020 02:48:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwY5u800IehczM/cQdM/5qPUlY08WZ5sRKP7f3fL0jBY9tgOmWNoklBLDcXU/RONPfyNhc2eg==
X-Received: by 2002:a05:6000:124e:: with SMTP id
 j14mr7990004wrx.154.1590745695574; 
 Fri, 29 May 2020 02:48:15 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:b096:1b7:7695:e4f7?
 ([2001:b07:6468:f312:b096:1b7:7695:e4f7])
 by smtp.gmail.com with ESMTPSA id k26sm10567358wmi.27.2020.05.29.02.48.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 May 2020 02:48:15 -0700 (PDT)
Subject: Re: [PATCH v4 6/7] KVM: MIPS: clean up redundant 'kvm_run' parameters
To: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>,
 Huacai Chen <chenhuacai@gmail.com>
References: <20200427043514.16144-1-tianjia.zhang@linux.alibaba.com>
 <20200427043514.16144-7-tianjia.zhang@linux.alibaba.com>
 <CAAhV-H7kpKUfQoWid6GSNL5+4hTTroGyL83EaW6yZwS2+Ti9kA@mail.gmail.com>
 <37246a25-c4dc-7757-3f5c-d46870a4f186@linux.alibaba.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <30c2ac06-1a7e-2f85-fbe1-e9dc25bf2ae2@redhat.com>
Date: Fri, 29 May 2020 11:48:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <37246a25-c4dc-7757-3f5c-d46870a4f186@linux.alibaba.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
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
Cc: wanpengli@tencent.com, kvm@vger.kernel.org, david@redhat.com,
 heiko.carstens@de.ibm.com, Peter Xu <peterx@redhat.com>,
 "open list:MIPS" <linux-mips@vger.kernel.org>, hpa@zytor.com,
 kvmarm@lists.cs.columbia.edu, linux-s390@vger.kernel.org,
 frankja@linux.ibm.com, Marc Zyngier <maz@kernel.org>, joro@8bytes.org,
 x86@kernel.org, borntraeger@de.ibm.com, mingo@redhat.com,
 julien.thierry.kdev@gmail.com, thuth@redhat.com, gor@linux.ibm.com,
 suzuki.poulose@arm.com, kvm-ppc@vger.kernel.org,
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, jmattson@google.com,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, cohuck@redhat.com,
 christoffer.dall@arm.com, sean.j.christopherson@intel.com,
 LKML <linux-kernel@vger.kernel.org>, james.morse@arm.com, vkuznets@redhat.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 27/05/20 08:24, Tianjia Zhang wrote:
>>>
>>>
> 
> Hi Huacai,
> 
> These two patches(6/7 and 7/7) should be merged into the tree of the
> mips architecture separately. At present, there seems to be no good way
> to merge the whole architecture patchs.
> 
> For this series of patches, some architectures have been merged, some
> need to update the patch.

Hi Tianjia, I will take care of this during the merge window.

Thanks,

Paolo

