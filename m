Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D14B1AC75B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 16:55:22 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4932MW5nDbzDqtQ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 00:55:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.120;
 helo=us-smtp-1.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=RyoOfmNl; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=RyoOfmNl; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4932C23QbszDrTy
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Apr 2020 00:47:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587048475;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=yTXlG2ZlBz2KzBDuxzpWb6NbMDbx72vEqvaZ6hTl+0c=;
 b=RyoOfmNlqk2s5QlyDtL0PzMYLtaIHG+NzfFMfuGXyDnhF+UHpoQqDpKwMoP9R5iJ34nKyn
 BeWmMrFdkx7UuWTpxRlUa+17CyDjiWpqxsOW1oFG7w27lQE9/lEEYl9/czIRo4if1hBT5d
 mTH4o+cvVH2IXaP27wl3N1jXUCqsamk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587048475;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=yTXlG2ZlBz2KzBDuxzpWb6NbMDbx72vEqvaZ6hTl+0c=;
 b=RyoOfmNlqk2s5QlyDtL0PzMYLtaIHG+NzfFMfuGXyDnhF+UHpoQqDpKwMoP9R5iJ34nKyn
 BeWmMrFdkx7UuWTpxRlUa+17CyDjiWpqxsOW1oFG7w27lQE9/lEEYl9/czIRo4if1hBT5d
 mTH4o+cvVH2IXaP27wl3N1jXUCqsamk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-IbturGjoPfaMYwzdzHQ85A-1; Thu, 16 Apr 2020 10:47:51 -0400
X-MC-Unique: IbturGjoPfaMYwzdzHQ85A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93B94192D7AE;
 Thu, 16 Apr 2020 14:47:49 +0000 (UTC)
Received: from [10.36.114.9] (ovpn-114-9.ams2.redhat.com [10.36.114.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 98DC2A1881;
 Thu, 16 Apr 2020 14:47:29 +0000 (UTC)
Subject: Re: [PATCH 1/3] kexec: Prevent removal of memory in use by a loaded
 kexec image
To: Baoquan He <bhe@redhat.com>, Andrew Morton <akpm@linux-foundation.org>
References: <20200414064031.GB4247@MiWiFi-R3L-srv>
 <86e96214-7053-340b-5c1a-ff97fb94d8e0@redhat.com>
 <20200414092201.GD4247@MiWiFi-R3L-srv>
 <ad060c8a-8afe-3858-0a4f-27ff54ef4c68@redhat.com>
 <20200414143912.GE4247@MiWiFi-R3L-srv>
 <0085f460-b0c7-b25f-36a7-fa3bafaab6fe@redhat.com>
 <20200415023524.GG4247@MiWiFi-R3L-srv>
 <18cf6afd-c651-25c7-aca3-3ca3c0e07547@redhat.com>
 <20200416140247.GA12723@MiWiFi-R3L-srv>
 <4e1546eb-4416-dc6d-d549-62d1cecccbc8@redhat.com>
 <20200416143634.GH4247@MiWiFi-R3L-srv>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 mQINBFXLn5EBEAC+zYvAFJxCBY9Tr1xZgcESmxVNI/0ffzE/ZQOiHJl6mGkmA1R7/uUpiCjJ
 dBrn+lhhOYjjNefFQou6478faXE6o2AhmebqT4KiQoUQFV4R7y1KMEKoSyy8hQaK1umALTdL
 QZLQMzNE74ap+GDK0wnacPQFpcG1AE9RMq3aeErY5tujekBS32jfC/7AnH7I0v1v1TbbK3Gp
 XNeiN4QroO+5qaSr0ID2sz5jtBLRb15RMre27E1ImpaIv2Jw8NJgW0k/D1RyKCwaTsgRdwuK
 Kx/Y91XuSBdz0uOyU/S8kM1+ag0wvsGlpBVxRR/xw/E8M7TEwuCZQArqqTCmkG6HGcXFT0V9
 PXFNNgV5jXMQRwU0O/ztJIQqsE5LsUomE//bLwzj9IVsaQpKDqW6TAPjcdBDPLHvriq7kGjt
 WhVhdl0qEYB8lkBEU7V2Yb+SYhmhpDrti9Fq1EsmhiHSkxJcGREoMK/63r9WLZYI3+4W2rAc
 UucZa4OT27U5ZISjNg3Ev0rxU5UH2/pT4wJCfxwocmqaRr6UYmrtZmND89X0KigoFD/XSeVv
 jwBRNjPAubK9/k5NoRrYqztM9W6sJqrH8+UWZ1Idd/DdmogJh0gNC0+N42Za9yBRURfIdKSb
 B3JfpUqcWwE7vUaYrHG1nw54pLUoPG6sAA7Mehl3nd4pZUALHwARAQABtCREYXZpZCBIaWxk
 ZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT6JAlgEEwEIAEICGwMFCQlmAYAGCwkIBwMCBhUI
 AgkKCwQWAgMBAh4BAheAFiEEG9nKrXNcTDpGDfzKTd4Q9wD/g1oFAl3pImkCGQEACgkQTd4Q
 9wD/g1o+VA//SFvIHUAvul05u6wKv/pIR6aICPdpF9EIgEU448g+7FfDgQwcEny1pbEzAmiw
 zAXIQ9H0NZh96lcq+yDLtONnXk/bEYWHHUA014A1wqcYNRY8RvY1+eVHb0uu0KYQoXkzvu+s
 Dncuguk470XPnscL27hs8PgOP6QjG4jt75K2LfZ0eAqTOUCZTJxA8A7E9+XTYuU0hs7QVrWJ
 jQdFxQbRMrYz7uP8KmTK9/Cnvqehgl4EzyRaZppshruKMeyheBgvgJd5On1wWq4ZUV5PFM4x
 II3QbD3EJfWbaJMR55jI9dMFa+vK7MFz3rhWOkEx/QR959lfdRSTXdxs8V3zDvChcmRVGN8U
 Vo93d1YNtWnA9w6oCW1dnDZ4kgQZZSBIjp6iHcA08apzh7DPi08jL7M9UQByeYGr8KuR4i6e
 RZI6xhlZerUScVzn35ONwOC91VdYiQgjemiVLq1WDDZ3B7DIzUZ4RQTOaIWdtXBWb8zWakt/
 ztGhsx0e39Gvt3391O1PgcA7ilhvqrBPemJrlb9xSPPRbaNAW39P8ws/UJnzSJqnHMVxbRZC
 Am4add/SM+OCP0w3xYss1jy9T+XdZa0lhUvJfLy7tNcjVG/sxkBXOaSC24MFPuwnoC9WvCVQ
 ZBxouph3kqc4Dt5X1EeXVLeba+466P1fe1rC8MbcwDkoUo65Ag0EVcufkQEQAOfX3n0g0fZz
 Bgm/S2zF/kxQKCEKP8ID+Vz8sy2GpDvveBq4H2Y34XWsT1zLJdvqPI4af4ZSMxuerWjXbVWb
 T6d4odQIG0fKx4F8NccDqbgHeZRNajXeeJ3R7gAzvWvQNLz4piHrO/B4tf8svmRBL0ZB5P5A
 2uhdwLU3NZuK22zpNn4is87BPWF8HhY0L5fafgDMOqnf4guJVJPYNPhUFzXUbPqOKOkL8ojk
 CXxkOFHAbjstSK5Ca3fKquY3rdX3DNo+EL7FvAiw1mUtS+5GeYE+RMnDCsVFm/C7kY8c2d0G
 NWkB9pJM5+mnIoFNxy7YBcldYATVeOHoY4LyaUWNnAvFYWp08dHWfZo9WCiJMuTfgtH9tc75
 7QanMVdPt6fDK8UUXIBLQ2TWr/sQKE9xtFuEmoQGlE1l6bGaDnnMLcYu+Asp3kDT0w4zYGsx
 5r6XQVRH4+5N6eHZiaeYtFOujp5n+pjBaQK7wUUjDilPQ5QMzIuCL4YjVoylWiBNknvQWBXS
 lQCWmavOT9sttGQXdPCC5ynI+1ymZC1ORZKANLnRAb0NH/UCzcsstw2TAkFnMEbo9Zu9w7Kv
 AxBQXWeXhJI9XQssfrf4Gusdqx8nPEpfOqCtbbwJMATbHyqLt7/oz/5deGuwxgb65pWIzufa
 N7eop7uh+6bezi+rugUI+w6DABEBAAGJAiUEGAECAA8FAlXLn5ECGwwFCQlmAYAACgkQTd4Q
 9wD/g1qA6w/+M+ggFv+JdVsz5+ZIc6MSyGUozASX+bmIuPeIecc9UsFRatc91LuJCKMkD9Uv
 GOcWSeFpLrSGRQ1Z7EMzFVU//qVs6uzhsNk0RYMyS0B6oloW3FpyQ+zOVylFWQCzoyyf227y
 GW8HnXunJSC+4PtlL2AY4yZjAVAPLK2l6mhgClVXTQ/S7cBoTQKP+jvVJOoYkpnFxWE9pn4t
 H5QIFk7Ip8TKr5k3fXVWk4lnUi9MTF/5L/mWqdyIO1s7cjharQCstfWCzWrVeVctpVoDfJWp
 4LwTuQ5yEM2KcPeElLg5fR7WB2zH97oI6/Ko2DlovmfQqXh9xWozQt0iGy5tWzh6I0JrlcxJ
 ileZWLccC4XKD1037Hy2FLAjzfoWgwBLA6ULu0exOOdIa58H4PsXtkFPrUF980EEibUp0zFz
 GotRVekFAceUaRvAj7dh76cToeZkfsjAvBVb4COXuhgX6N4pofgNkW2AtgYu1nUsPAo+NftU
 CxrhjHtLn4QEBpkbErnXQyMjHpIatlYGutVMS91XTQXYydCh5crMPs7hYVsvnmGHIaB9ZMfB
 njnuI31KBiLUks+paRkHQlFcgS2N3gkRBzH7xSZ+t7Re3jvXdXEzKBbQ+dC3lpJB0wPnyMcX
 FOTT3aZT7IgePkt5iC/BKBk3hqKteTnJFeVIT7EC+a6YUFg=
Organization: Red Hat GmbH
Message-ID: <2525cc9c-3566-6275-105b-7f4af8f980bc@redhat.com>
Date: Thu, 16 Apr 2020 16:47:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200416143634.GH4247@MiWiFi-R3L-srv>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: piliu@redhat.com, Anshuman Khandual <anshuman.khandual@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Bhupesh Sharma <bhsharma@redhat.com>, linuxppc-dev@lists.ozlabs.org,
 kexec@lists.infradead.org,
 Russell King - ARM Linux admin <linux@armlinux.org.uk>, linux-mm@kvack.org,
 James Morse <james.morse@arm.com>, "Eric W. Biederman" <ebiederm@xmission.com>,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

>> kexec_walk_memblock() has the option for "kbuf->top_down". Only
>> kexec_walk_resources() seems to ignore it.
>=20
> Yeah, that top down searching is done in a found low mem area. Means
> firstly search an available region bottom up, then put kernel top down
> in that region. The reason is our iomem res is linked with singly linked
> list. So we can only search bottom up efficiently.
>=20
> kexec_load is doing the real top down searching, so kernel will be put
> at the top of system ram. I ever tried to change it to support top down
> searching for kexec_file_load too with patches, since QE and customers
> are often confused with this difference when debugging.
>=20
> Andrew may remeber this, he suggested me to change the singly linked list=
=20
> to doubly linked list for iomem res, then do the top down searching for
> kexec_file_load. I tried with some effort, the change introduced too much
> code change, I just gave up finally.

Well, at least right now this seems to be the right approach (hotplug),
lol :)

>=20
> http://archive.lwn.net:8080/devicetree/20180718024944.577-1-bhe@redhat.co=
m/
>=20
> I can see that top down searching for kexec can avoid the highly used
> low memory region, esp under 4G, for dma, kinds of firmware reserving,
> etc. And customers/QE of kexec get used to it. I can change kexec_file_lo=
ad
> to top down too with a simple way if people really complain it. But now,=
=20
> seems bottom up is not bad too.

Ah, I understand the problem. Maybe a simple "optimization" would be to
start searching bottom-up from e.g.,2GB/4GB first. If nothing was found,
search botoom-up from 0-2GB/4GB etc.

>=20
>>
>> So I think in case of memblocks (e.g., arm64), this still applies?
>=20
> Yeah, aren't you trying to remove it? I haven't read your patches
> carefully, maybe I got it wrong. And arm64 even can't support the hot add=
ed

For arm64 we're still creating memblocks for hotplugged memory, but I
guess it's not too hard to stop doing that.

> memory being able to recorded into firmware, seems it's not so ready,=20
> won't they change that design in the future?

It seems to be incomplete, yes. No idea if it's fixable, no arm64 expert ..=
.


>>>>>> - powerpc to filter out all LMBs that can be removed (assuming not a=
ll
>>>>>>   memory corresponds to LMBs that can be removed, otherwise we're in
>>>>>>   trouble ... :) )
>>>>>> - virtio-mem to filter out all memory it added.
>>>>>> - hyper-v to filter out partially backed memory blocks (esp. the las=
t
>>>>>>   memory block it added and only partially backed it by memory).
>>>>>>
>>>>>> This would make it work for kexec_file_load(), however, I do wonder =
how
>>>>>> we would want to approach that from userspace kexec-tools when handl=
ing
>>>>>> it from kexec_load().
>>>>>
>>>>> Let's make kexec_file_load work firstly. Since this work is only firs=
t
>>>>> step to make kexec-ed kernel not break memory hotplug. After kexec
>>>>> rebooting, the KASLR may locate kernel into hotpluggable area too.
>>>>
>>>> Can you elaborate how that would work?
>>>
>>> Well, boot memory can be hotplugged or not after boot, they are marked
>>> in uefi tables, the current kexec doesn't save and pass them into 2nd
>>> kenrel, when kexec kernel bootup, it need read them and avoid them to
>>> randomize kernel into.
>>
>> What about e.g., memory hotplugged by ACPI? I would assume, that the
>> kexec kernel will not make use of that (IOW detected that) until the
>> ACPI driver comes up and re-detects + adds that memory.
>>
>> Or how would that machinery work in case we have a DIMM hotplugged via A=
CPI?
>=20
> ACPI SRAT is embeded into efi, need read out the rsdp pointer. If we don'=
t
> pass the efi, it won't get the SRAT table correctly, if I remember
> correctly. Yeah, I remeber kvm guest can get memory hotplugged with
> ACPI only, this won't happen on bare metal though. Need check carefully.=
=20
> I have been using kvm guest with uefi firmwire recently.

Yeah, I can imagine that bare metal is different. kvm only uses ACPI.

I'm also asking because of virtio-mem. Memory added via virtio-mem is
not part of any efi tables or whatsoever. So I assume the kexec kernel
will not detect it automatically (good!), instead load the virtio-mem
driver and let it add memory back to the system.

I should probably play with kexec and virtio-mem once I have some spare
cycles ... to find out what's broken and needs to be addressed :)

--=20
Thanks,

David / dhildenb

