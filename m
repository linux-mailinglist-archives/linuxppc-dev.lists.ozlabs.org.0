Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F421B3CC0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Apr 2020 12:08:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 496bk63zmfzDqhY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Apr 2020 20:08:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.81;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=E2vPty66; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=E2vPty66; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 496bfm709BzDqdZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Apr 2020 20:05:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587549950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=rATKYts2554mzs5OMKZzueMwerGodqJQMSarGToJc4M=;
 b=E2vPty66eyh8RXmW9wDUnjboLxgp0K3IhXwrucgS5O9Ex++sHYKmGdtED7/pb/SKF0SG5q
 JSuZfcSyX0c0QSjJFMGCP5IojKCEvhTWwL2RhoxHiWn58msexKpSQSRnf3mufMTZsu+Sq2
 3iP3NBfA1VOgmV0ijlI1S3bQ7vxR3Xc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587549950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=rATKYts2554mzs5OMKZzueMwerGodqJQMSarGToJc4M=;
 b=E2vPty66eyh8RXmW9wDUnjboLxgp0K3IhXwrucgS5O9Ex++sHYKmGdtED7/pb/SKF0SG5q
 JSuZfcSyX0c0QSjJFMGCP5IojKCEvhTWwL2RhoxHiWn58msexKpSQSRnf3mufMTZsu+Sq2
 3iP3NBfA1VOgmV0ijlI1S3bQ7vxR3Xc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-3QDnJ9pxOSi9dKLdBNAUfQ-1; Wed, 22 Apr 2020 06:05:47 -0400
X-MC-Unique: 3QDnJ9pxOSi9dKLdBNAUfQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0C9688018A6;
 Wed, 22 Apr 2020 10:05:46 +0000 (UTC)
Received: from [10.36.114.57] (ovpn-114-57.ams2.redhat.com [10.36.114.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 156E71009940;
 Wed, 22 Apr 2020 10:05:40 +0000 (UTC)
Subject: Re: [PATCH 1/3] kexec: Prevent removal of memory in use by a loaded
 kexec image
To: Baoquan He <bhe@redhat.com>
References: <0085f460-b0c7-b25f-36a7-fa3bafaab6fe@redhat.com>
 <20200415023524.GG4247@MiWiFi-R3L-srv>
 <18cf6afd-c651-25c7-aca3-3ca3c0e07547@redhat.com>
 <20200416140247.GA12723@MiWiFi-R3L-srv>
 <4e1546eb-4416-dc6d-d549-62d1cecccbc8@redhat.com>
 <20200416143634.GH4247@MiWiFi-R3L-srv>
 <2525cc9c-3566-6275-105b-7f4af8f980bc@redhat.com>
 <9a4eb1d7-33bf-8707-9c0c-1ca657c3e502@redhat.com>
 <20200422091718.GT4247@MiWiFi-R3L-srv>
 <b9173744-6be4-5b41-d205-319542d821ba@redhat.com>
 <20200422095733.GU4247@MiWiFi-R3L-srv>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
Organization: Red Hat GmbH
Message-ID: <b0e7b7e8-01d0-e03e-83a8-4763ccbede43@redhat.com>
Date: Wed, 22 Apr 2020 12:05:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200422095733.GU4247@MiWiFi-R3L-srv>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
 Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 22.04.20 11:57, Baoquan He wrote:
> On 04/22/20 at 11:24am, David Hildenbrand wrote:
>> On 22.04.20 11:17, Baoquan He wrote:
>>> On 04/21/20 at 03:29pm, David Hildenbrand wrote:
>>>>>> ACPI SRAT is embeded into efi, need read out the rsdp pointer. If we=
 don't
>>>>>> pass the efi, it won't get the SRAT table correctly, if I remember
>>>>>> correctly. Yeah, I remeber kvm guest can get memory hotplugged with
>>>>>> ACPI only, this won't happen on bare metal though. Need check carefu=
lly.=20
>>>>>> I have been using kvm guest with uefi firmwire recently.
>>>>>
>>>>> Yeah, I can imagine that bare metal is different. kvm only uses ACPI.
>>>>>
>>>>> I'm also asking because of virtio-mem. Memory added via virtio-mem is
>>>>> not part of any efi tables or whatsoever. So I assume the kexec kerne=
l
>>>>> will not detect it automatically (good!), instead load the virtio-mem
>>>>> driver and let it add memory back to the system.
>>>>>
>>>>> I should probably play with kexec and virtio-mem once I have some spa=
re
>>>>> cycles ... to find out what's broken and needs to be addressed :)
>>>>
>>>> FWIW, I just gave virtio-mem and kexec/kdump a try.
>>>>
>>>> a) kdump seems to work. Memory added by virtio-mem is getting dumped.
>>>> The kexec kernel only uses memory in the crash region. The virtio-mem
>>>> driver properly bails out due to is_kdump_kernel().
>>>
>>> Right, kdump is not impacted later added memory.
>>>
>>>>
>>>> b) "kexec -s -l" seems to work fine. For now, the kernel does not seem
>>>> to get placed on virtio-mem memory (pure luck due to the left-to-right
>>>> search). Memory added by virtio-mem is not getting added to the e820
>>>> map. Once the virtio-mem driver comes back up in the kexec kernel, the
>>>> right memory is readded.
>>>
>>> kexec_file_load just behaves as you tested. It doesn't collect later
>>> added memory to e820 because it uses e820_table_kexec directly to pass
>>> e820 to kexec-ed kernel. However, this e820_table_kexec is only updated
>>> during boot stage. I tried hot adding DIMM after boot, kexec-ed kernel
>>> doesn't have it in e820 during bootup, but it's recoginized and added
>>> when ACPI scanning. I think we should update e820_table_kexec when hot
>>> add/remove memory, at least for DIMM. Not sure if DLPAR, virtio-mem,
>>> balloon will need be added into e820_table_kexec too, and if this is
>>> expected behaviour.
>>>
>>> But whatever we do, it won't impact the kexec file_loading, because of
>>> the searching strategy bottom up. Just adding them into e820_table_kexe=
c
>>> will make it consistent with cold reboot which get recognizes and get
>>> them into e820 during bootup.
>>
>> Yeah, I think whatever a cold-booted kernel will see is what kexec-ed
>> kernel should see. Not more, not less.
>>
>> Regarding virtio-mem: Not in e820 on cold-boot.
>> Regarding DIMMs: DIMMs under KVM will never show up in the e820 map
>> IIRC. I think on real HW it can be different.
>=20
> Yeah, DIMMs under KVM won't show up in e820 map. While this is not featur=
e
> of QEMU/KVM, but a defect of it. I ever asked Igor who is developer of
> QEMU/KVM guest in this area, why we don't make kvm guest recognize
> hotpluggable DIMM and add it into e820 map, he said he had tried to make
> it, but this will corrupt guest on HyperV. So he had to revert the

Yeah, I remember that this had to be reverted due to something breaking.
But OTOH, it allows us to online coldplugged DIMMs online_movable
easily, so I'd say it's even a feature (although, does not behave like
real HW we have).

I use this extensively when testing memory hot(un)plug via coldplugged
DIMMs.

I do wonder if there is real HW, where this is also the case.

> commit on qemu. So I think we can leave it for now for both real HW and
> kvm, or update the e820_table_kexec to include added DIMM for both real
> HW and KVM. I hope one day KVM dev will find a way to conquer the defect
> on HyperV and make the e820map consistent with bare metal. After all,
> kvm guest is trying to imitate real HW for the most part.
>=20
> Anyway, I will think about the e820_table_kexec updating. See if we can
> do something about it.

Yeah, for DIMMs on real HW it might definitely make sense. We might be
able to hook into updates of /sys/firmware/memmap on memory add/remove.

--=20
Thanks,

David / dhildenb

