Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5E26182C6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 16:28:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N372Q48MYz3cGH
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Nov 2022 02:28:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NZ3fF7Tx;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NZ3fF7Tx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NZ3fF7Tx;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NZ3fF7Tx;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N371V2F8Zz3c5D
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Nov 2022 02:27:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667489275;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xCSLioTknXwq+ek9x4fiuIn1LdVr/LliQOq4IIs2CLE=;
	b=NZ3fF7TxqELuNFxzBWYoUexywm/lT8kIbKbKohyUpTBbq3FCShWRW+6COii9KwpFnmptp9
	hyvToGLdDDbpcM40ZbarMvN5EzStTHRyJ/kBOeg87+AcCd8ScXR40xQppiwcelGgDxPyNA
	xH6d6+ycZSRf4OF5jyYVNyAKI8uRHu4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667489275;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xCSLioTknXwq+ek9x4fiuIn1LdVr/LliQOq4IIs2CLE=;
	b=NZ3fF7TxqELuNFxzBWYoUexywm/lT8kIbKbKohyUpTBbq3FCShWRW+6COii9KwpFnmptp9
	hyvToGLdDDbpcM40ZbarMvN5EzStTHRyJ/kBOeg87+AcCd8ScXR40xQppiwcelGgDxPyNA
	xH6d6+ycZSRf4OF5jyYVNyAKI8uRHu4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-259-9HL59JjQNL-PSA1_RukxVg-1; Thu, 03 Nov 2022 11:27:52 -0400
X-MC-Unique: 9HL59JjQNL-PSA1_RukxVg-1
Received: by mail-ed1-f70.google.com with SMTP id q13-20020a056402518d00b00462b0599644so1644441edd.20
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 03 Nov 2022 08:27:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xCSLioTknXwq+ek9x4fiuIn1LdVr/LliQOq4IIs2CLE=;
        b=oYpKzoiSnoZklqZ13SR32rNyk9x5/fRcMKyCk9wm0BcDA4AZ3Pprrley2TJqK7aQi+
         tSbFtrEXGGWnvHy49kEpHxFREgELhOU/UfZtND0baq1KhHJIwk2i1lcxqqbobGS9Azti
         gYGWUjJ3kZ/YG7QMHrmxz5qvUidl8PTuEiHQXB672OVfQmi/QGjdcN86aX9RDkhE6q5U
         f2yby6EuEZNrjK6LG/Y29ynDbINRLCmdBN+irq1OzRzjJlUlaIacIhVy001SUM3IRuDn
         qixab2V40U3KX03by4p4SPk7I6Rhka5xBg90ND0vwhhbtzGdxyWy6cz4yovUF7kCbbb1
         tc0w==
X-Gm-Message-State: ACrzQf1Uqgykk8+diUdl3L8z9c1UvHfMANK83UiZhwHgi2xyCjzFKyZ7
	4epZ5NrSzgyJUDk2on/4caM6yXT/l2ZQ8HJODH4JKwEST0HmPzIQGqszM3/6BYkXP6yzrj6OZAK
	I5h7jhbnaydCov9R7VowZpHr9Jw==
X-Received: by 2002:a17:907:2dab:b0:78d:fc4b:7e31 with SMTP id gt43-20020a1709072dab00b0078dfc4b7e31mr28147756ejc.531.1667489270827;
        Thu, 03 Nov 2022 08:27:50 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7u9a9PiI+1WXKEKW1T9dxImTSTFhIKArq6MPRri6hHxMVLdP9Ji+9iwit/AYCn6duMyFkDdg==
X-Received: by 2002:a17:907:2dab:b0:78d:fc4b:7e31 with SMTP id gt43-20020a1709072dab00b0078dfc4b7e31mr28147732ejc.531.1667489270591;
        Thu, 03 Nov 2022 08:27:50 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c? ([2001:b07:6468:f312:1c09:f536:3de6:228c])
        by smtp.googlemail.com with ESMTPSA id 15-20020a508e4f000000b00463bc1ddc76sm657729edx.28.2022.11.03.08.27.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Nov 2022 08:27:49 -0700 (PDT)
Message-ID: <82df23f2-b049-8bee-8bb8-608645b918d8@redhat.com>
Date: Thu, 3 Nov 2022 16:27:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 00/44] KVM: Rework kvm_init() and hardware enabling
To: Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Janosch Frank <frankja@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>
References: <20221102231911.3107438-1-seanjc@google.com>
 <b37267a9-c0b4-9841-71af-d8eab9baeb60@linux.ibm.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <b37267a9-c0b4-9841-71af-d8eab9baeb60@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, kvmarm@lists.cs.columbia.edu, linux-s390@vger.kernel.org, Chao Gao <chao.gao@intel.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Yuan Yao <yuan.yao@intel.com>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, Alexandru Elisei <alexandru.elisei@arm.com>, linux-arm-kernel@lists.infradead.org, Isaku Yamahata <isaku.yamahata@intel.com>, Fabiano Rosas <farosas@linux.ibm.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, kvm-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/3/22 13:08, Christian Borntraeger wrote:
>> There are bug fixes throughout this series.  They are more scattered than
>> I would usually prefer, but getting the sequencing correct was a gigantic
>> pain for many of the x86 fixes due to needing to fix common code in order
>> for the x86 fix to have any meaning.  And while the bugs are often fatal,
>> they aren't all that interesting for most users as they either require a
>> malicious admin or broken hardware, i.e. aren't likely to be encountered
>> by the vast majority of KVM users.  So unless someone _really_ wants a
>> particular fix isolated for backporting, I'm not planning on shuffling
>> patches.
>>
>> Tested on x86.  Lightly tested on arm64.  Compile tested only on all 
>> other architectures.
> 
> Some sniff tests seem to work ok on s390.

Thanks.  There are just a couple nits, and MIPS/PPC/RISC-V have very 
small changes.  Feel free to send me a pull request once Marc acks.

Paolo

