Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BC24A60EA
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Feb 2022 17:02:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jp8np4htkz3bcX
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Feb 2022 03:02:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LDheT5Ut;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LDheT5Ut;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=LDheT5Ut; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=LDheT5Ut; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jp8n44XZ4z2xYG
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Feb 2022 03:01:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643731281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9TOgZSvYLjnxXgPMR3aA+UnxenzdhiCu/Ec4ih921w8=;
 b=LDheT5Utq2k5CZu62EmXM/eyjXAv6VxLn7cXpPej1HrgyH99DlCMLxZf0YRrwzMJg1ygOY
 5985xoiOeSk4uej3hJPUjMVetpTLETCaLQprCP0EiCk5pvJeAj+JvE0b8+Q6MwqNBMV6Wz
 8lxmhM5cCOH1U3bhwLGrwNH1bgs8yA8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643731281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9TOgZSvYLjnxXgPMR3aA+UnxenzdhiCu/Ec4ih921w8=;
 b=LDheT5Utq2k5CZu62EmXM/eyjXAv6VxLn7cXpPej1HrgyH99DlCMLxZf0YRrwzMJg1ygOY
 5985xoiOeSk4uej3hJPUjMVetpTLETCaLQprCP0EiCk5pvJeAj+JvE0b8+Q6MwqNBMV6Wz
 8lxmhM5cCOH1U3bhwLGrwNH1bgs8yA8=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-76-qVhkEOn1NbWrhipJMYh2dQ-1; Tue, 01 Feb 2022 11:01:03 -0500
X-MC-Unique: qVhkEOn1NbWrhipJMYh2dQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 i22-20020a50fd16000000b00405039f2c59so8923139eds.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Feb 2022 08:01:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9TOgZSvYLjnxXgPMR3aA+UnxenzdhiCu/Ec4ih921w8=;
 b=o0WmyZJqwHG2SL7HbbT7gVTN8gHWqLGyu/AJe94a7MKhKU2O2Po+fOn0p7WjqukJP7
 tJQmyHe+F8wElCMvaQk4JYwmAtVX5QWCcJNqfh5Zn5nohxu7P7TFfg+pn6aGEz0hpnz8
 QByoT2fOHvz1mJG68+AvqcJroxem0ZK1n/NO9PaI2mKGCHb9kJJlJcHtheysm/c/Jpi7
 pbrVWJxprm6CpBeZpGv2gPG7LSs+wBOSkGDbGj1VZLOovgytesT0ZChidoM2SODEDiu2
 8TbDZ3rlSlBrdmDxNcYQkhx5B7+aMVsYuhfRRuwaT8Rlg938aVRqZQtqSVUW1+AKxW5B
 H9ZA==
X-Gm-Message-State: AOAM5332fNkTQFFPcG+Lv6lMUiukEd0Sb3hc5Fn8s0rDYFFRbgsdrvZN
 o7JilPV/zV8JZvtWs/NLyUfPZay26joav/70vdfpCVisqROcb6vJHdzc5RFQ0oGC2aQkw1PjqdU
 QczDxHqwn5uyEl+ocwY4/wWvNqA==
X-Received: by 2002:a17:907:72d6:: with SMTP id
 du22mr21767243ejc.179.1643731257031; 
 Tue, 01 Feb 2022 08:00:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyi6gqf6sTZV2adqJ/EwU8K0kh4yabr0HjJDqz0uGv4IXAxFUKBb//nn4tH0Br/W6v0yRG1zw==
X-Received: by 2002:a17:907:72d6:: with SMTP id
 du22mr21767209ejc.179.1643731256826; 
 Tue, 01 Feb 2022 08:00:56 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 gh33sm14883510ejc.17.2022.02.01.08.00.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 08:00:56 -0800 (PST)
Message-ID: <f8359e15-412a-03d6-1b0c-a9f253816497@redhat.com>
Date: Tue, 1 Feb 2022 17:00:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH V5 21/21] KVM: compat: riscv: Prevent KVM_COMPAT from
 being selected
To: Anup Patel <anup@brainfault.org>, Guo Ren <guoren@kernel.org>
References: <20220201150545.1512822-1-guoren@kernel.org>
 <20220201150545.1512822-22-guoren@kernel.org>
 <CAAhSdy27nVvh9F08kPgffJe-Y-gOOc9cnQtCLFAE0GbDhHVbiQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAAhSdy27nVvh9F08kPgffJe-Y-gOOc9cnQtCLFAE0GbDhHVbiQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
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
Cc: Guo Ren <guoren@linux.alibaba.com>, KVM General <kvm@vger.kernel.org>,
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-riscv <linux-riscv@lists.infradead.org>, Christoph Hellwig <hch@lst.de>,
 linux-arch <linux-arch@vger.kernel.org>, linux-s390@vger.kernel.org,
 x86@kernel.org, linux-csky@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-parisc@vger.kernel.org, Drew Fustini <drew@beagleboard.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Wang Junqiang <wangjunqiang@iscas.ac.cn>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org,
 liush <liush@allwinnertech.com>, linuxppc-dev@lists.ozlabs.org,
 Wei Fu <wefu@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2/1/22 16:44, Anup Patel wrote:
> +Paolo
> 
> On Tue, Feb 1, 2022 at 8:38 PM <guoren@kernel.org> wrote:
>>
>> From: Guo Ren <guoren@linux.alibaba.com>
>>
>> Current riscv doesn't support the 32bit KVM API. Let's make it
>> clear by not selecting KVM_COMPAT.
>>
>> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
>> Signed-off-by: Guo Ren <guoren@kernel.org>
>> Cc: Arnd Bergmann <arnd@arndb.de>
>> Cc: Anup Patel <anup@brainfault.org>
> 
> This looks good to me.
> 
> Reviewed-by: Anup Patel <anup@brainfault.org>

Hi Anup,

feel free to send this via a pull request (perhaps together with Mark 
Rutland's entry/exit rework).

Paolo

