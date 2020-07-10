Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E22E921B08A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jul 2020 09:50:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B34vr71lXzDqyk
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jul 2020 17:50:16 +1000 (AEST)
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
 header.s=mimecast20190719 header.b=DA/PMilA; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=UIwwVZez; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B34t25rDGzDqxM
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jul 2020 17:48:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594367317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w3lPi8IIyg6JHok2MkrSRXRUKV+20Z+zeyOlBbulHrA=;
 b=DA/PMilACvKbOEt5xT7G2N0kvEEIhYvGscxwHJLyG7B/iNbQcEjdneXeLyWyHZVBV+IGAq
 +wjGHpSIXZXlmLliI8BhjcfbWykm0nZ0WG7sGl0iq5JtIjRPbfUWdDRdWX8VJYklfXbBtn
 4+0PEm1n5uBomIozA0Az1+S5Ha2XDJw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594367318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w3lPi8IIyg6JHok2MkrSRXRUKV+20Z+zeyOlBbulHrA=;
 b=UIwwVZezTDq6vUmce3Y1ef+Ehzm4G3VyUPnegLqxtIOw4MahNujDj9DYBiQ22AT1KosoRF
 whFbgfxVdWntveU+CGH47c3k7ucYNEYnp0AWblCtvNadzsmUVivZCaOe7p63ePL4M9GI9d
 yyiK71vwBliW02CQo2kSbPhg2o6llng=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-259-d3NcN7AONWW3XHOp9ah8AQ-1; Fri, 10 Jul 2020 03:48:36 -0400
X-MC-Unique: d3NcN7AONWW3XHOp9ah8AQ-1
Received: by mail-wm1-f72.google.com with SMTP id e15so5663951wme.8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jul 2020 00:48:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=w3lPi8IIyg6JHok2MkrSRXRUKV+20Z+zeyOlBbulHrA=;
 b=rYC4l6v4t9BPHvbzK/ItEwsJRIi5pHqIb3LDsSiyU62N1G8IO+A3T+LkDsmd4bzjn1
 u92WnVBxdn1ebLcktMfrGmJur7lrZEtG23Wn9LUaCd1HMbA0occitd9V+wDnrFDpBqkT
 cSZZqpcjUSL+A89nZDyjmwZrjcsmsuloSEyJcxY2y999fdo4UoDqd74eaJk3fqJwbsRt
 B6+gtFITXp40zKzdrjrTKA0Q8DtupnY5tfBkyneghfdSO/EHNz2oZ1cZ1CozUwobMpXm
 UgJx2di6He4tfutz7H7CYY0ao3gb2txecv1t0WmzXNLXZuf/lpi9Fuz9yXTbPKVLMZR7
 i67Q==
X-Gm-Message-State: AOAM532n3xYpyvDFrz3/OMEyEAtEf9GluP8rBnGWozEv+gueF2yI8Wmd
 BSNuv/5JOkbpaS/mf2xjw7hofDQgYx6Vyfo18XwY/UHfMyYkqSECp6QbAQjX1ATSqTFOPo6no2g
 e34vwJrFctyrc0DiAW8KrQVeWcg==
X-Received: by 2002:a7b:c952:: with SMTP id i18mr4118705wml.65.1594367315234; 
 Fri, 10 Jul 2020 00:48:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzoVcmgycalDG2NxxBpe/F1Ip5MhErG5G/6zxHhUH+uoCv6KdhugBz3NZfr470zRIHVmrw60A==
X-Received: by 2002:a7b:c952:: with SMTP id i18mr4118689wml.65.1594367315031; 
 Fri, 10 Jul 2020 00:48:35 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:9541:9439:cb0f:89c?
 ([2001:b07:6468:f312:9541:9439:cb0f:89c])
 by smtp.gmail.com with ESMTPSA id o9sm8786762wrs.1.2020.07.10.00.48.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2020 00:48:34 -0700 (PDT)
Subject: Re: [PATCH v6 1/5] KVM: s390: clean up redundant 'kvm_run' parameters
To: Christian Borntraeger <borntraeger@de.ibm.com>,
 Tianjia Zhang <tianjia.zhang@linux.alibaba.com>, tsbogend@alpha.franken.de,
 paulus@ozlabs.org, mpe@ellerman.id.au, benh@kernel.crashing.org,
 frankja@linux.ibm.com, david@redhat.com, cohuck@redhat.com,
 heiko.carstens@de.ibm.com, gor@linux.ibm.com,
 sean.j.christopherson@intel.com, vkuznets@redhat.com, wanpengli@tencent.com,
 jmattson@google.com, joro@8bytes.org, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, x86@kernel.org, hpa@zytor.com, maz@kernel.org,
 james.morse@arm.com, julien.thierry.kdev@gmail.com, suzuki.poulose@arm.com,
 christoffer.dall@arm.com, peterx@redhat.com, thuth@redhat.com,
 chenhuacai@gmail.com
References: <20200623131418.31473-1-tianjia.zhang@linux.alibaba.com>
 <20200623131418.31473-2-tianjia.zhang@linux.alibaba.com>
 <c49f8814-c7ea-6884-91c5-3dcd40c6509f@de.ibm.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <2e986527-1585-e1b4-1251-ef36ac3bd233@redhat.com>
Date: Fri, 10 Jul 2020 09:48:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <c49f8814-c7ea-6884-91c5-3dcd40c6509f@de.ibm.com>
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
Cc: linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-mips@vger.kernel.org,
 kvm-ppc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvmarm@lists.cs.columbia.edu,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 23/06/20 17:31, Christian Borntraeger wrote:
> 
> I have trouble seeing value in this particular patch. We add LOCs
> without providing any noticable benefit. All other patches in this series at
> least reduce the amount of code. So I would defer this to Paolo if he prefers
> to have this way across all architectures. 

Yes, it adds lines of code but they're just

+	struct kvm_run *kvm_run = vcpu->run;

You could avoid the LoC increase by repeating vcpu->run over and over,
but I think the code overall is clearer.

Paolo

