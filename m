Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6C11A8684
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 19:01:35 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491sG424QTzDqyf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Apr 2020 03:01:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.120;
 helo=us-smtp-1.mimecast.com; envelope-from=eesposit@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=XwrPkUNK; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491qqr2bCLzDqVq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Apr 2020 01:57:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586879827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LtET4y1erldy/ABcJ/1Ge/mDl44RsauO4InLRypykLQ=;
 b=XwrPkUNKGxfcj8MpzzodKwoCO/nYlwvP3KomKIdI2OYOhrQo8cwi3KV8QH2wbIVyhUhKmj
 D9yEWDansbnqpSbRglxpyiGD+iepesHfBEJ1Udom8du80cxf00l7Az5l5Gu+YD4i5G82If
 74WzD8VAuZ4Ey0D/3OFqjSVZR9hO0wM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-163-s6Ho0jerOEyaCDEd34lARw-1; Tue, 14 Apr 2020 11:57:06 -0400
X-MC-Unique: s6Ho0jerOEyaCDEd34lARw-1
Received: by mail-wm1-f69.google.com with SMTP id s15so3994159wmc.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 08:57:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+YYLNoHPS0R9msE++qaePEk7EKWnckmMQYzoCYqpJRk=;
 b=NhFniYtZrP8LixIq52BTQtPEd+eAucNLLGsfLUzFc4zP4IUnzDznno5VKiyS4hjsBG
 smDhoUyxpjGNT5JA5UNS1mw9Sv5l0uI+AUelm5eXmOt0kJXWQn1SwJqrhDJy7jjqt6Ws
 igRQy0nQpYmzkkYBB2DHwj27EpOqIhx/NiW3pTybsuRH2IEU+we7/Y/ZJuMh7g7uN0EO
 MUfSrNX597JWmG2k5EfMQk6JHVdUd2cnQRbl/pTvQZsckcqancm2f+tx9e20bCX4aUcG
 341A7E1tR2eYOybvpruCwXqlFKLytLvXDlTeps9DPhyHA0hcrh//aOZMBFBvgyVsZzPS
 4h0g==
X-Gm-Message-State: AGi0PubK6Vj7cgtV1OKNkF5s6q73wFnCgDRxHwq+d1qfrzrfxL4/8w2F
 ZejYtATJ++fBmheuixCWnBzrNhnrd2CwH6yLaLOZRXBu9oyj6fgBX50rlMdk/QyDcwJsgSc8o5o
 5abABqyhY+vB6lK/kZniiEOo+qg==
X-Received: by 2002:a1c:5502:: with SMTP id j2mr502951wmb.93.1586879825158;
 Tue, 14 Apr 2020 08:57:05 -0700 (PDT)
X-Google-Smtp-Source: APiQypK43hPUptF5L9yvQziVzJGJV/VyMhS23tlGH7dzBh06iijjr98+S1d6K1K1pTXXFtXi18cgZQ==
X-Received: by 2002:a1c:5502:: with SMTP id j2mr502914wmb.93.1586879824909;
 Tue, 14 Apr 2020 08:57:04 -0700 (PDT)
Received: from localhost.localdomain ([194.230.155.210])
 by smtp.gmail.com with ESMTPSA id j10sm16390309wmi.18.2020.04.14.08.57.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Apr 2020 08:57:04 -0700 (PDT)
Subject: Re: [PATCH] kvm_host: unify VM_STAT and VCPU_STAT definitions in a
 single place
To: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 kvm@vger.kernel.org
References: <20200413140332.22896-1-eesposit@redhat.com>
 <03a481a8-bcf2-8755-d113-71ef393508bf@amsat.org>
 <bf870876-9f9a-7ba8-d941-a3883e519eed@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <a5e9246e-2bf3-204e-b79b-0ed4c40fcc5d@redhat.com>
Date: Tue, 14 Apr 2020 17:57:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <bf870876-9f9a-7ba8-d941-a3883e519eed@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
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



On 4/14/20 10:18 AM, Paolo Bonzini wrote:
> On 13/04/20 23:34, Philippe Mathieu-Daud=C3=A9 wrote:
>>> +#define VM_STAT(x, ...) offsetof(struct kvm, stat.x), KVM_STAT_VM, ## =
__VA_ARGS__
>>> +#define VCPU_STAT(x, ...) offsetof(struct kvm_vcpu, stat.x), KVM_STAT_=
VCPU, ## __VA_ARGS__
>> I find this macro expanding into multiple fields odd... Maybe a matter
>> of taste. Sugggestion, have the macro define the full structure, as in
>> the arm64 arch:
>>
>> #define VM_STAT(n, x, ...) { n, offsetof(struct kvm, stat.x),
>> KVM_STAT_VM, ## __VA_ARGS__ }
>>
>> Ditto for VCPU_STAT().
>>
Hi Philippe and Paolo,
>=20
> Yes, that's a good idea.  Emanuele, can you switch it to this format?

Sure, I just submitted the v2 version.

Thanks,

Emanuele

