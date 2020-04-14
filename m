Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B739B1A75B8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 10:21:16 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491djk0vwNzDqLw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 18:21:14 +1000 (AEST)
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
 header.s=mimecast20190719 header.b=PkTSlSFu; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491dgH1S5FzDqN2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 18:19:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586852344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5Wb7ghxdvKYdRHUeDIrwZRLDN53fs9i+DGns+KVd+no=;
 b=PkTSlSFuPa3VHPfkwulYvXZXNWKPSqnP6MKwyfdAH/CtMAG9ixUBadV96a2iIFtplJkuof
 +Pf/4L5xGmUNSBj0r5Chp14DGoHvwwK6QqPSk0BAuGfoNwVyZGDnAzZsIbiAq9nhfRGx0S
 oi0yCtUlTd5/6cqd7bzGEgCXIY46AdU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-ghLu0PAqMuGt4vEQuO8ocw-1; Tue, 14 Apr 2020 04:19:02 -0400
X-MC-Unique: ghLu0PAqMuGt4vEQuO8ocw-1
Received: by mail-wr1-f70.google.com with SMTP id q10so1748190wrv.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 01:19:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TtBLM3c8JTLmBP2uDmSrWuT9/+Pwll6JJwpjBt6QX00=;
 b=DMKit7EXZ6W+EmNbriMjPeq+tyhOogAv39+T6YlWQVV/qIMGrekD1/SuOLb6c6c8Eo
 ro/xf/Q6PY4R4H8oKeCokIUDst3w0TKsV10VmJz7y3UN6DYs1uFW4H5CHBSlNKg58oWw
 /oTOe/MKfp1t+ZdU5tGYHhF1wrmSajBaYUbkI1htvkOlpI4gwD69dCVJmTjokXGIuVoQ
 xI/1ZsUf6L8/wNysGwKY9wP/lMt9GoZ/n/FA1msuLUSjlZq51+a7Xw9sTdU7JPmOypFi
 jNPxpYF9Qs0uPWnmh/E9Czna4O2Voai24x/P9TWBUfoO74aRtFGhcz7cidwAvhcjfa1i
 cK3Q==
X-Gm-Message-State: AGi0PuZu4fVuWniJg54S/tYy0GskcO0zMVy65NW9Yppx3cuFNLrgJZb9
 93xvCgMH+rgJUXzus2bVp5eSLzODWOHcPVXx6ucI3/Q/GHqMJnnGRR95PSWbp8l/E0kIqObn4PU
 psbKqeUhHT/mqcAolJQ05xhFXYw==
X-Received: by 2002:a05:6000:8b:: with SMTP id
 m11mr8390713wrx.168.1586852341232; 
 Tue, 14 Apr 2020 01:19:01 -0700 (PDT)
X-Google-Smtp-Source: APiQypKNVMzJLyv+Go05DzXWcde1VJnPobjfS5TpC3OSGCsAYJkHQBkL4kr8iyDzRWBXP64iQWFZGA==
X-Received: by 2002:a05:6000:8b:: with SMTP id
 m11mr8390681wrx.168.1586852340970; 
 Tue, 14 Apr 2020 01:19:00 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:e159:eda1:c472:fcfa?
 ([2001:b07:6468:f312:e159:eda1:c472:fcfa])
 by smtp.gmail.com with ESMTPSA id o28sm3426907wra.84.2020.04.14.01.18.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Apr 2020 01:19:00 -0700 (PDT)
Subject: Re: [PATCH] kvm_host: unify VM_STAT and VCPU_STAT definitions in a
 single place
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, kvm@vger.kernel.org
References: <20200413140332.22896-1-eesposit@redhat.com>
 <03a481a8-bcf2-8755-d113-71ef393508bf@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <bf870876-9f9a-7ba8-d941-a3883e519eed@redhat.com>
Date: Tue, 14 Apr 2020 10:18:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <03a481a8-bcf2-8755-d113-71ef393508bf@amsat.org>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
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
Cc: Wanpeng Li <wanpengli@tencent.com>, David Hildenbrand <david@redhat.com>,
 linux-mips@vger.kernel.org, kvmarm@lists.cs.columbia.edu,
 linux-s390@vger.kernel.org, Janosch Frank <frankja@linux.ibm.com>,
 Marc Zyngier <maz@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Julien Thierry <julien.thierry.kdev@gmail.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, kvm-ppc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Jim Mattson <jmattson@google.com>,
 Cornelia Huck <cohuck@redhat.com>, linux-kernel@vger.kernel.org,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 James Morse <james.morse@arm.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 13/04/20 23:34, Philippe Mathieu-Daud=C3=A9 wrote:
>> +#define VM_STAT(x, ...) offsetof(struct kvm, stat.x), KVM_STAT_VM, ## _=
_VA_ARGS__
>> +#define VCPU_STAT(x, ...) offsetof(struct kvm_vcpu, stat.x), KVM_STAT_V=
CPU, ## __VA_ARGS__
> I find this macro expanding into multiple fields odd... Maybe a matter
> of taste. Sugggestion, have the macro define the full structure, as in
> the arm64 arch:
>=20
> #define VM_STAT(n, x, ...) { n, offsetof(struct kvm, stat.x),
> KVM_STAT_VM, ## __VA_ARGS__ }
>=20
> Ditto for VCPU_STAT().
>=20

Yes, that's a good idea.  Emanuele, can you switch it to this format?

Thanks,

Paolo

