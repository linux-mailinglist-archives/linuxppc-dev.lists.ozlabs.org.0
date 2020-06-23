Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E84CB204F00
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 12:26:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49rj9q25CdzDqSt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 20:26:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.81;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=pbonzini@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=UQpR6sez; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=UQpR6sez; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49rj802mjdzDqGt
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jun 2020 20:24:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592907884;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rM1BfodItBtK7hezukdZSeFePaoeuCpD4E8vQ9IKGDU=;
 b=UQpR6sezXewhvjEHd2WzS0gocnChl5WNNacxcdC8B9WNKzsCtUypWz+r9hWoh8kCTNfiGO
 7IJMEN+Cy4+HzZuK6yLUPQVExZOll17urXYwSEgQF+URC4EV3tx6KxXsB8lamAzWc+XCn1
 zD5kzbEzLsOdop/Nbtx9DpEYNbcVqQo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592907884;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rM1BfodItBtK7hezukdZSeFePaoeuCpD4E8vQ9IKGDU=;
 b=UQpR6sezXewhvjEHd2WzS0gocnChl5WNNacxcdC8B9WNKzsCtUypWz+r9hWoh8kCTNfiGO
 7IJMEN+Cy4+HzZuK6yLUPQVExZOll17urXYwSEgQF+URC4EV3tx6KxXsB8lamAzWc+XCn1
 zD5kzbEzLsOdop/Nbtx9DpEYNbcVqQo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-izHYmbAxPCGbeOSfPttdPA-1; Tue, 23 Jun 2020 06:24:42 -0400
X-MC-Unique: izHYmbAxPCGbeOSfPttdPA-1
Received: by mail-wm1-f69.google.com with SMTP id p24so3459556wmc.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jun 2020 03:24:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=K0VMF+zOglKc79uK7nAPfjf+HV37t2ditCPtYi6hRnc=;
 b=aJLJLBQ4U7gr//kpWKBdoAjjCDpVZmZwLYC1AxF1Up91YZDh4xvdN/u/N2leJnVKJT
 fKLXrHVToZJQoLr3P1lfORVRHmRKH36paR7pm4uY9cfxz9a01n2BZgiUirIccJd0eYht
 tVQpVlWZnjPDypd4SuhWvTzuS/m2mtEaD05rT0jOvKs2jLQmWKgiAdbRny9eLYtjZJhO
 4kq4XiDcLiGxNVircemzMNB08jJW7yrEEDWbc1obvk9LEV2qoAYrdspbg+S2jAowLlsT
 d1aWWGBiwrxdT6MP/j0M4WmvPerJuJZUhaGLSKgCF90UrL0ad7OK7QSqnd9eUg44xUg8
 Twmg==
X-Gm-Message-State: AOAM533HM7SuzKpVrFqBDMXqfBqcLvEgErZONfqgTymzLnNuPjs9VZB5
 1KtEBxk96kois13OwaOfmx4OyQNqkx3D5A5/rf+MIr99h0gv5qvi0I9iiZkpo5oja0IRY4jdYAx
 h07ESwOvrH0wp5WMOwmIkUlQPmw==
X-Received: by 2002:a05:6000:ce:: with SMTP id
 q14mr16454574wrx.294.1592907881340; 
 Tue, 23 Jun 2020 03:24:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7GKxnJWV0b4Mz/7lWJjdPl3+rZwUgIO80Ac5HDjj13PmRVjDey+yK0l49hJjTmncjlmTnYw==
X-Received: by 2002:a05:6000:ce:: with SMTP id
 q14mr16454534wrx.294.1592907881013; 
 Tue, 23 Jun 2020 03:24:41 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:24f5:23b:4085:b879?
 ([2001:b07:6468:f312:24f5:23b:4085:b879])
 by smtp.gmail.com with ESMTPSA id c66sm3351206wma.20.2020.06.23.03.24.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jun 2020 03:24:40 -0700 (PDT)
Subject: Re: [PATCH v4 0/7] clean up redundant 'kvm_run' parameters
To: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>,
 tsbogend@alpha.franken.de, paulus@ozlabs.org, mpe@ellerman.id.au,
 benh@kernel.crashing.org, borntraeger@de.ibm.com, frankja@linux.ibm.com,
 david@redhat.com, cohuck@redhat.com, heiko.carstens@de.ibm.com,
 gor@linux.ibm.com, sean.j.christopherson@intel.com, vkuznets@redhat.com,
 wanpengli@tencent.com, jmattson@google.com, joro@8bytes.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, x86@kernel.org,
 hpa@zytor.com, maz@kernel.org, james.morse@arm.com,
 julien.thierry.kdev@gmail.com, suzuki.poulose@arm.com,
 christoffer.dall@arm.com, peterx@redhat.com, thuth@redhat.com,
 chenhuacai@gmail.com
References: <20200427043514.16144-1-tianjia.zhang@linux.alibaba.com>
 <fe463233-d094-fca5-b4e9-c1d97124fd69@redhat.com>
 <3a2bee8b-20b4-5d33-7d12-09c374a5afde@linux.alibaba.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <bad08799-274e-0a6f-9638-92c0010b1ba1@redhat.com>
Date: Tue, 23 Jun 2020 12:24:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <3a2bee8b-20b4-5d33-7d12-09c374a5afde@linux.alibaba.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: 8bit
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
Cc: linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-mips@vger.kernel.org,
 kvm-ppc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvmarm@lists.cs.columbia.edu,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 23/06/20 12:00, Tianjia Zhang wrote:
> 
> 
> On 2020/6/23 17:42, Paolo Bonzini wrote:
>> On 27/04/20 06:35, Tianjia Zhang wrote:
>>> In the current kvm version, 'kvm_run' has been included in the
>>> 'kvm_vcpu'
>>> structure. For historical reasons, many kvm-related function parameters
>>> retain the 'kvm_run' and 'kvm_vcpu' parameters at the same time. This
>>> patch does a unified cleanup of these remaining redundant parameters.
>>>
>>> This series of patches has completely cleaned the architecture of
>>> arm64, mips, ppc, and s390 (no such redundant code on x86). Due to
>>> the large number of modified codes, a separate patch is made for each
>>> platform. On the ppc platform, there is also a redundant structure
>>> pointer of 'kvm_run' in 'vcpu_arch', which has also been cleaned
>>> separately.
>>
>> Tianjia, can you please refresh the patches so that each architecture
>> maintainer can pick them up?  Thanks very much for this work!
>>
>> Paolo
>>
> 
> No problem, this is what I should do.
> After I update, do I submit separately for each architecture or submit
> them together in a patchset?

You can send them together.

Paolo

