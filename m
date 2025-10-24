Return-Path: <linuxppc-dev+bounces-13280-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0C3C06CB0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Oct 2025 16:52:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ctQpm3CGMz3bjb;
	Sat, 25 Oct 2025 01:52:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761317520;
	cv=none; b=fHhjTF5t6EzJmsOkZCh08VL2dEJ9t1h3SmW6D5SwKQIdNBTfs929pwfB3MMEoj9EokfLWs6UueKu/rZm3oTZ4moXtlaE5FlyYAND+Hl/q5urjTMp0TKoqlVj48CbSd1C5cYnUNEFiWa3vD+0nsxAGWYbvfH1v5+u2YO86krLD4wxS4HII6J1DhkaG8jm7FRnibOj+6vgpa51zwDltitOKfX00xJFr0DAL6wWnlWaKaKoWEngdOBa8Q6j+KPC9ETEX0kmNQz3MrgSUGzX7oCLsN5P3QGm/I5LtMgYiylZhs3noyM17ip7wvo1F5jXjFZdtfQsuf6wumm+ULQOw7ejsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761317520; c=relaxed/relaxed;
	bh=sFCSKz+pbfmgnJ7WA2aI9CGgIZh/9VpaZ5Xtmq9YRV8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I+kTaX8HO7o8uVhd5dJ7qILbd5yYaep01mdeTazALu53l9VJrNuoMR/KPE268Nu9D1nxlvAHHO9Pcbm0I4Pwwv6La3aZdPA06ABMh+q9jdH8cg47raYea/xYFZiceI8b03gYvfBOFvFuk2AvZkLG2OiQJarF2pBzUa9NHAwS+CCobdOAZoi82KDPgefFcXndfEZPe8HywOCRbxlS2mEfEfcgOTBx0UCMcL+zpE6Q7dTejp3LElXJHJdZc1qtYpaCdtZV+14hq5Ce8PoyTya6LM7x6aYRBvPOpvgKXcjaRKVXtHmUpMng6/SF6E7UB1tsSSq2SmT0KrJXxDJYu/iM1g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PvauuW7Q; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PvauuW7Q; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PvauuW7Q;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PvauuW7Q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ctQpl4KWFz2xS9
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Oct 2025 01:51:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761317516;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=sFCSKz+pbfmgnJ7WA2aI9CGgIZh/9VpaZ5Xtmq9YRV8=;
	b=PvauuW7QYCKbMkEMjK+F5xeXlwJqNL6AUElwow+IkqWjecvCGsCBP/BsHGWtN2hEyk28rs
	Cd2trf3CfewIAuBfiZpgQRnv2OqFh0+vXPInrQeyx5uFAkUSUxUBewEU0a7l27FcsEDZad
	xzjbAUEjI4vvHpboS+xlrS2Fi1AJ7Xk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761317516;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=sFCSKz+pbfmgnJ7WA2aI9CGgIZh/9VpaZ5Xtmq9YRV8=;
	b=PvauuW7QYCKbMkEMjK+F5xeXlwJqNL6AUElwow+IkqWjecvCGsCBP/BsHGWtN2hEyk28rs
	Cd2trf3CfewIAuBfiZpgQRnv2OqFh0+vXPInrQeyx5uFAkUSUxUBewEU0a7l27FcsEDZad
	xzjbAUEjI4vvHpboS+xlrS2Fi1AJ7Xk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-22-ghY5PWyWNHOce7pJBufoeg-1; Fri, 24 Oct 2025 10:51:54 -0400
X-MC-Unique: ghY5PWyWNHOce7pJBufoeg-1
X-Mimecast-MFC-AGG-ID: ghY5PWyWNHOce7pJBufoeg_1761317514
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-4298b98f376so1282230f8f.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Oct 2025 07:51:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761317513; x=1761922313;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sFCSKz+pbfmgnJ7WA2aI9CGgIZh/9VpaZ5Xtmq9YRV8=;
        b=B7B7hktANpm74g7AtYSJDuyStVB5mO0AtOauxl2Bz3oLyGyUrarEkAXjxNQxcqQ5K0
         l4mY3eF7GWb68zVUYGS2QxbLAB/+FHPhZiTWASlCYUzjn79WQph8/1J0Ww8P8xG9YkO3
         Y0/QIN62lsMIm7hEGKzsPRRWC6NOq9fwqdaAB8tnLvCkgh0VvaEWNAvGllV8XW/WKn5u
         IzfVjNlmskZynDBPQitt4qlhdEqHJ/mpAluemp7/MvPWX618YNIxkMHbZV7E3UZXIudq
         ePwDPYormT7R94crVEwbolYHA4wFVTALrx6XvFrNapev2WVUgxJAIfidkeZMRA+xD6q/
         UqSg==
X-Forwarded-Encrypted: i=1; AJvYcCXxL4y1QU0fE0GaNDB1XaUWQzMFbYq9Dr2FKbAlNhEvIjo8zROTTlNJdvU3CW/FYpF6j26fl19hVDWECgQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwOeQxe32UwFGi3mJLccAtwKkzRrvCOzV9dFyhr+RZLDnhFgcCY
	I7tka1EywhZssxX+iFqStDKCTnSMocNQuFPxBTY4mDsxa9Tmk75d2TLBuIVzpNZtljBubgiZKSO
	6P67rh6Zz6SuwPTafUNslcshHMoEIkQnmh6q3FaaYYzoj8mTa6frzONmfVpIZMn6pl+0=
X-Gm-Gg: ASbGnctEdLFacwYtj0dpCM3ySd9lnlvgW9JpQzp5P9AOBTLrMB0FYXWYoht6uqCmXG0
	jAW40HOH7tA7/Ndw8JCZcS6Lt1l+VM1oVTfmBl4uy9ZbXi7qjzhoCopmQWyj0P/kIEWasOfEl6O
	GwIiIzp6edrg4b6RErqkAj6a4w8NwqXg4KyMo7y0iZ3qdGtB+T0eNfYRY1TJM+zFo4aEPMmB2vC
	4dpO4KTgcN2rYtMXROflXBIuP/I2bbNzG3OsaUZLi+H+9CqC6piM4OxMKr5BwkZfAVJOrEq/lO0
	ohZ9JKIY8ZxGkMFsSd+AZtR1ZOiy4pjcNxm56aBNQIQBJXEJRMqElb0mq1dN2cxGUCDHr+n6MvQ
	sGydiFE3AG4+xgURbSfUaTfqF2Sh4aHsk/smGNo8XXfZmAFnfJ8l9y8j+7t2TsZVttnZ49C5w/6
	2quYkeyF1Du8VlW7SXRcJXf9j1mkM=
X-Received: by 2002:a05:6000:2486:b0:429:8e79:a181 with SMTP id ffacd0b85a97d-4298e79a45dmr2899221f8f.56.1761317513374;
        Fri, 24 Oct 2025 07:51:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFAsv5JgYFopD0erwd4B2+Ll31lxxEQOMyEBbus09iXdFkBdtTufzvXtldPYP1cAIE4GNfNHQ==
X-Received: by 2002:a05:6000:2486:b0:429:8e79:a181 with SMTP id ffacd0b85a97d-4298e79a45dmr2899181f8f.56.1761317512945;
        Fri, 24 Oct 2025 07:51:52 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3? (p200300d82f4e3200c99da38b3f3ad4b3.dip0.t-ipconnect.de. [2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429930e35casm833065f8f.30.2025.10.24.07.51.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 07:51:52 -0700 (PDT)
Message-ID: <70723f4a-f42b-4d94-9344-5824e48bfad1@redhat.com>
Date: Fri, 24 Oct 2025 16:51:50 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/13] x86/xen: use lazy_mmu_state when
 context-switching
To: David Woodhouse <dwmw2@infradead.org>,
 Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>, "H. Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,
 Juergen Gross <jgross@suse.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251015082727.2395128-1-kevin.brodsky@arm.com>
 <20251015082727.2395128-12-kevin.brodsky@arm.com>
 <f0067f35-1048-4788-8401-f71d297f56f3@redhat.com>
 <348e5f1c5a90e4ab0f14b4d997baf7169745bf04.camel@infradead.org>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <348e5f1c5a90e4ab0f14b4d997baf7169745bf04.camel@infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rGEurI_wFweKAzAotX_J9t52UFnynurBvlAn7ZK6XN8_1761317514
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 24.10.25 16:47, David Woodhouse wrote:
> On Thu, 2025-10-23 at 22:06 +0200, David Hildenbrand wrote:
>> On 15.10.25 10:27, Kevin Brodsky wrote:
>>> We currently set a TIF flag when scheduling out a task that is in
>>> lazy MMU mode, in order to restore it when the task is scheduled
>>> again.
>>>
>>> The generic lazy_mmu layer now tracks whether a task is in lazy MMU
>>> mode in task_struct::lazy_mmu_state. We can therefore check that
>>> state when switching to the new task, instead of using a separate
>>> TIF flag.
>>>
>>> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
>>> ---
>>
>>
>> Looks ok to me, but I hope we get some confirmation from x86 / xen
>> folks.
> 
> 
> I know tglx has shouted at me in the past for precisely this reminder,
> but you know you can test Xen guests under QEMU/KVM now and don't need
> to actually run Xen? Has this been boot tested?

And after that, boot-testing sparc as well? :D

If it's easy, why not. But other people should not suffer for all the 
XEN hacks we keep dragging along.

-- 
Cheers

David / dhildenb


