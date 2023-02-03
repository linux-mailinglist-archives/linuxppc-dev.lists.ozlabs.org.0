Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 70720689758
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 11:56:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P7XdH2R3Vz3f6y
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 21:56:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fIAtTLXk;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fIAtTLXk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fIAtTLXk;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fIAtTLXk;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P7XcC0jFbz3f60
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Feb 2023 21:55:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675421699;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RP8qXabbbkVFHjkXGB3iPT4qiggJHLCmrxY/0vUZBsk=;
	b=fIAtTLXkMvSZgrgJlnZO2xWmcxGbTRgSmDTDXSGjjEeGuogbIV2CiKulhV1mpRQ1aYBe/R
	cwDgfRPT5+06L2PwRWlqxIJBknrFIepCO3vTzzjatb+bZ2BJ4+ZZ97Eyohj++VscTQtD4T
	S6D/b20+1Nm/eOtQq604yfMPzID00bE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675421699;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RP8qXabbbkVFHjkXGB3iPT4qiggJHLCmrxY/0vUZBsk=;
	b=fIAtTLXkMvSZgrgJlnZO2xWmcxGbTRgSmDTDXSGjjEeGuogbIV2CiKulhV1mpRQ1aYBe/R
	cwDgfRPT5+06L2PwRWlqxIJBknrFIepCO3vTzzjatb+bZ2BJ4+ZZ97Eyohj++VscTQtD4T
	S6D/b20+1Nm/eOtQq604yfMPzID00bE=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-553-iSfz7U6UNDqtoOx5D9AbMQ-1; Fri, 03 Feb 2023 05:54:58 -0500
X-MC-Unique: iSfz7U6UNDqtoOx5D9AbMQ-1
Received: by mail-qv1-f69.google.com with SMTP id ly4-20020a0562145c0400b0054d2629a759so2523347qvb.16
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Feb 2023 02:54:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RP8qXabbbkVFHjkXGB3iPT4qiggJHLCmrxY/0vUZBsk=;
        b=hMuVMKv7+raia8vJitvKjgin5xqlGTjxHvb6eyQWRr+ve5k3tocSi7+IKMOO/Be5OO
         3Eil751dFqRUUNwmG5PgAgzhGIhF1yNkqQ76Xcasi4j66/nq72tBVv1LOWxB5o6MG000
         /CP7CZ6RLpR8RaYqI5sliNb/gOkGwT4dIZD0aoBaZCbtiYsfNdC1LD65DWKuEfd/Glhf
         Gg8MJSERkIlFQRU2WxG/c/RR0Lrn5D7Zn3cIaFoflkDj7LWJSI+F4Vuhh4gpS9hw/Guz
         UCE87Z+xgNBLg5liny7VgwdxHvIDdoQ0YOQWquAQILm/p7EWM3XALiItIprly7t+QW3G
         C1pw==
X-Gm-Message-State: AO0yUKW6xou72C7gqCJLzMuxqHACh3v5354P8YHbQW5xsBRkGAtGmfbW
	ia7RuBIqk38GmGlYHOVXzwFKAiSMZI5pPNTWB2LjHbgxzizeCzyiNvTmsS00X5CifawX49ndbEk
	2okThNf9qkGUsTCxTAX40ELZ2dg==
X-Received: by 2002:ac8:7d04:0:b0:3b6:3787:679d with SMTP id g4-20020ac87d04000000b003b63787679dmr18376056qtb.8.1675421697840;
        Fri, 03 Feb 2023 02:54:57 -0800 (PST)
X-Google-Smtp-Source: AK7set8N+04AaVpEWJqlRLC4f+pcB8NjgkYdMQcrG47rLW4TpdktzPu1UTGGOpRxuhVJPJmt51StNw==
X-Received: by 2002:ac8:7d04:0:b0:3b6:3787:679d with SMTP id g4-20020ac87d04000000b003b63787679dmr18376027qtb.8.1675421697468;
        Fri, 03 Feb 2023 02:54:57 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-179-40.web.vodafone.de. [109.43.179.40])
        by smtp.gmail.com with ESMTPSA id o11-20020ac87c4b000000b003b9a426d626sm1405276qtv.22.2023.02.03.02.54.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Feb 2023 02:54:56 -0800 (PST)
Message-ID: <2c37f524-593f-a155-a01f-57a68b2e362c@redhat.com>
Date: Fri, 3 Feb 2023 11:54:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 3/7] KVM: Move KVM_GET_NR_MMU_PAGES into the deprecation
 section
To: Nicholas Piggin <npiggin@gmail.com>, kvm@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>
References: <20230203094230.266952-1-thuth@redhat.com>
 <20230203094230.266952-4-thuth@redhat.com> <CQ8UM1FTPEUZ.3F2RONR3AJ5YP@bobo>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CQ8UM1FTPEUZ.3F2RONR3AJ5YP@bobo>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, David Hildenbrand <david@redhat.com>, Marc Zyngier <maz@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, linux-kernel@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, kvmarm@lists.linux.dev, James Morse <james.morse@arm.com>, kvm-riscv@lists.infradead.org, Zenghui Yu <yuzenghui@huawei.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 03/02/2023 11.16, Nicholas Piggin wrote:
> On Fri Feb 3, 2023 at 7:42 PM AEST, Thomas Huth wrote:
>> The KVM_GET_NR_MMU_PAGES ioctl is quite questionable on 64-bit hosts
>> since it fails to return the full 64 bits of the value that can be
>> set with the corresponding KVM_SET_NR_MMU_PAGES call. This ioctl
>> likely has also never really been used by userspace applications
>> (at least not by QEMU and kvmtool which I checked), so it's better
>> to move it to the deprecation section in kvm.h to make it clear for
>> developers that this also should not be used in new code in the
>> future anymore.
> 
> Did this get included in the series inadvertently?

No, it's here on purpose, as a second step to patch 2/7 (and a follow up 
from the discussion last year, see 
https://lore.kernel.org/kvm/YpZu6%2Fk+8EydfBKf@google.com/ ) ... sorry, I 
should have elaborated on this in the cover letter, too.

  Thomas

