Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A2112A8ED
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Dec 2019 19:51:45 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47jhyQ6m8jzDqLC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Dec 2019 05:51:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.120;
 helo=us-smtp-1.mimecast.com; envelope-from=bhsharma@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.b="S/o5fzzB"; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47jhwS0Y3WzDqJj
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Dec 2019 05:49:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577299793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=285kDepmv9QK1DA/8vrnMjbxXwuHVWfi0yZmFm9MG4s=;
 b=S/o5fzzBuq2p+m+JUTUu//xUXLsrwwEw+wvuGuG81V7tzDrTrICAFQPl9bVKMDB/6r918f
 1vS6nkcaZRc9fEpaWW9azzsBGnsnfqjL7JQ5M9mE0nBDIwghvoL/BrZtmB+o9/3ZYVTb/y
 fYafnz64aIlIFwvZnwHwKtsxIhnvlVI=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-32-hRBEEhQYMW-JwD8u7lhkYw-1; Wed, 25 Dec 2019 13:49:47 -0500
Received: by mail-pf1-f199.google.com with SMTP id q5so16238032pfh.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Dec 2019 10:49:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=285kDepmv9QK1DA/8vrnMjbxXwuHVWfi0yZmFm9MG4s=;
 b=KE5UUAtx4BlP8gvSBBcgkHxaOWbGayOB72z55MGs48gjNZMFH14Xe4ngZw3UvRk/2j
 R46+iuaX7nCC7ZHsJrnQU0P+p5TNgsk71NlVSnmsQtPAC+mgzpFj/w1Ad2VD/0XkfVgA
 Q/DGKlzoMxQh3S3vQ1QErknD+uzXy1WQsN8GQgeGsorqNKZVz9Ryodpeay2VxH8cg/QH
 HEPT1kmIhZeKH+biL+5kzMQqGZtJKHqmBP7EWFLOYR2B6kn+d2uLUGnn/MF3qTct4nT3
 /BjNeZmoVmwTqFro+l51L/b7fyOMrmoYa7FCmuXL5Urrax/utppQS5RBmbXS71HxjL3t
 gJWg==
X-Gm-Message-State: APjAAAWKWUbA5aJ+NYbweQ0FTWnkJYn7QXsEGTUHfKkthJxorFcVgDMh
 MzHS8/1V9rpQZih0BhvJsNT+CcgvTWHusISjFKBTxSptTeCgxhgjOyxmO5OLepB1VETnYuevooq
 +SmDWfGxbiTIN6swDjokg2zuUuQ==
X-Received: by 2002:a17:902:9003:: with SMTP id
 a3mr13216803plp.224.1577299785880; 
 Wed, 25 Dec 2019 10:49:45 -0800 (PST)
X-Google-Smtp-Source: APXvYqyZq0WNOzdua1RfDEkn3HqURrkcIdrDtqUjWUQg9SWvt9FzZCJpCtHEmlsjvv06Sjav1Dxdww==
X-Received: by 2002:a62:7c54:: with SMTP id x81mr43381216pfc.180.1577299783422; 
 Wed, 25 Dec 2019 10:49:43 -0800 (PST)
Received: from localhost.localdomain ([122.177.237.105])
 by smtp.gmail.com with ESMTPSA id b98sm7539818pjc.16.2019.12.25.10.49.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 25 Dec 2019 10:49:42 -0800 (PST)
Subject: Re: [RESEND PATCH v5 5/5] Documentation/vmcoreinfo: Add documentation
 for 'TCR_EL1.T1SZ'
To: James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org
References: <1575057559-25496-1-git-send-email-bhsharma@redhat.com>
 <1575057559-25496-6-git-send-email-bhsharma@redhat.com>
 <8a982138-f1fa-34e8-18fd-49a79cea3652@arm.com>
From: Bhupesh Sharma <bhsharma@redhat.com>
Message-ID: <b7d8d603-d9fe-3e18-c754-baf2015acd16@redhat.com>
Date: Thu, 26 Dec 2019 00:19:35 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <8a982138-f1fa-34e8-18fd-49a79cea3652@arm.com>
Content-Language: en-US
X-MC-Unique: hRBEEhQYMW-JwD8u7lhkYw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-doc@vger.kernel.org,
 Will Deacon <will@kernel.org>, x86@kernel.org, kexec@lists.infradead.org,
 Kazuhito Hagio <k-hagio@ab.jp.nec.com>, Dave Anderson <anderson@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, bhupesh.linux@gmail.com,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 Steve Capper <steve.capper@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi James,

On 12/12/2019 04:02 PM, James Morse wrote:
> Hi Bhupesh,

I am sorry this review mail skipped my attention due to holidays and 
focus on other urgent issues.

> On 29/11/2019 19:59, Bhupesh Sharma wrote:
>> Add documentation for TCR_EL1.T1SZ variable being added to
>> vmcoreinfo.
>>
>> It indicates the size offset of the memory region addressed by TTBR1_EL1
> 
>> and hence can be used for determining the vabits_actual value.
> 
> used for determining random-internal-kernel-variable, that might not exist tomorrow.
> 
> Could you describe how this is useful/necessary if a debugger wants to walk the page
> tables from the core file? I think this is a better argument.
> 
> Wouldn't the documentation be better as part of the patch that adds the export?
> (... unless these have to go via different trees? ..)

Ok, will fix the same in v6 version.

>> diff --git a/Documentation/admin-guide/kdump/vmcoreinfo.rst b/Documentation/admin-guide/kdump/vmcoreinfo.rst
>> index 447b64314f56..f9349f9d3345 100644
>> --- a/Documentation/admin-guide/kdump/vmcoreinfo.rst
>> +++ b/Documentation/admin-guide/kdump/vmcoreinfo.rst
>> @@ -398,6 +398,12 @@ KERNELOFFSET
>>   The kernel randomization offset. Used to compute the page offset. If
>>   KASLR is disabled, this value is zero.
>>   
>> +TCR_EL1.T1SZ
>> +------------
>> +
>> +Indicates the size offset of the memory region addressed by TTBR1_EL1
> 
>> +and hence can be used for determining the vabits_actual value.
> 
> 'vabits_actual' may not exist when the next person comes to read this documentation (its
> going to rot really quickly).
> 
> I think the first half of this text is enough to say what this is for. You should include
> words to the effect that its the hardware value that goes with swapper_pg_dir. You may
> want to point readers to the arm-arm for more details on what the value means.

Ok, got it. Fixed this in v6, which should be on its way shortly.

Thanks,
Bhupesh

