Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4181BF2A2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Apr 2020 10:23:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49CT0s0WhDzDr9S
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Apr 2020 18:23:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.61;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=CNsohpya; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=CNsohpya; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49CSxg5wh1zDqxQ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Apr 2020 18:20:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588234834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Oj3Gb/CDuSGT8ulKk/yMbVBXnCO14VNDywwKRzXNY0s=;
 b=CNsohpyauJPtjQ/VmSkfpGVmgmJU9KEMOK6sD+Xe+GCdvedOQwALCwy3HRRUPAyXJbSBR/
 1r3aGP4tkGvfblDR2fQBiXzEbCJ6fxVXxdkKM346i2r71bEEfd/EGUFxRwQpLpTBlefNaX
 +d5s6L3UUyHnZ1sigepsUvdzooTywIk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588234834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Oj3Gb/CDuSGT8ulKk/yMbVBXnCO14VNDywwKRzXNY0s=;
 b=CNsohpyauJPtjQ/VmSkfpGVmgmJU9KEMOK6sD+Xe+GCdvedOQwALCwy3HRRUPAyXJbSBR/
 1r3aGP4tkGvfblDR2fQBiXzEbCJ6fxVXxdkKM346i2r71bEEfd/EGUFxRwQpLpTBlefNaX
 +d5s6L3UUyHnZ1sigepsUvdzooTywIk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-286-dm43KJQWPbG-0H4SvcZs2g-1; Thu, 30 Apr 2020 04:20:32 -0400
X-MC-Unique: dm43KJQWPbG-0H4SvcZs2g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 848AB1902EA2;
 Thu, 30 Apr 2020 08:20:29 +0000 (UTC)
Received: from [10.36.113.172] (ovpn-113-172.ams2.redhat.com [10.36.113.172])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 44A771002395;
 Thu, 30 Apr 2020 08:20:22 +0000 (UTC)
Subject: Re: [PATCH v1 2/3] mm/memory_hotplug: Introduce MHP_DRIVER_MANAGED
To: Dan Williams <dan.j.williams@intel.com>
References: <20200429160803.109056-1-david@redhat.com>
 <20200429160803.109056-3-david@redhat.com>
 <a7305cd8-8b2f-1d8f-7654-ecf777c46df6@redhat.com>
 <CAPcyv4i04+QLxiOyz04_eef2DFetEFKBUmi2A4xxw9abQD8hNQ@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
Organization: Red Hat GmbH
Message-ID: <e32522cd-31bb-e129-47a6-9ec13b570506@redhat.com>
Date: Thu, 30 Apr 2020 10:20:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAPcyv4i04+QLxiOyz04_eef2DFetEFKBUmi2A4xxw9abQD8hNQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: virtio-dev@lists.oasis-open.org, linux-hyperv@vger.kernel.org,
 Michal Hocko <mhocko@suse.com>, Pavel Tatashin <pasha.tatashin@soleen.com>,
 Baoquan He <bhe@redhat.com>, Linux MM <linux-mm@kvack.org>,
 Wei Yang <richard.weiyang@gmail.com>, linux-s390 <linux-s390@vger.kernel.org>,
 linux-nvdimm <linux-nvdimm@lists.01.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 virtualization@lists.linux-foundation.org,
 Linux ACPI <linux-acpi@vger.kernel.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, Eric Biederman <ebiederm@xmission.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Morton <akpm@linux-foundation.org>, Michal Hocko <mhocko@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 30.04.20 10:11, Dan Williams wrote:
> On Thu, Apr 30, 2020 at 12:20 AM David Hildenbrand <david@redhat.com> w=
rote:
>>
>> On 29.04.20 18:08, David Hildenbrand wrote:
>>> Some paravirtualized devices that add memory via add_memory() and
>>> friends (esp. virtio-mem) don't want to create entries in
>>> /sys/firmware/memmap/ - primarily to hinder kexec from adding this
>>> memory to the boot memmap of the kexec kernel.
>>>
>>> In fact, such memory is never exposed via the firmware (e.g., e820), =
but
>>> only via the device, so exposing this memory via /sys/firmware/memmap=
/ is
>>> wrong:
>>>  "kexec needs the raw firmware-provided memory map to setup the
>>>   parameter segment of the kernel that should be booted with
>>>   kexec. Also, the raw memory map is useful for debugging. For
>>>   that reason, /sys/firmware/memmap is an interface that provides
>>>   the raw memory map to userspace." [1]
>>>
>>> We want to let user space know that memory which is always detected,
>>> added, and managed via a (device) driver - like memory managed by
>>> virtio-mem - is special. It cannot be used for placing kexec segments
>>> and the (device) driver is responsible for re-adding memory that
>>> (eventually shrunk/grown/defragmented) memory after a reboot/kexec. I=
t
>>> should e.g., not be added to a fixed up firmware memmap. However, it =
should
>>> be dumped by kdump.
>>>
>>> Also, such memory could behave differently than an ordinary DIMM - e.=
g.,
>>> memory managed by virtio-mem can have holes inside added memory resou=
rce,
>>> which should not be touched, especially for writing.
>>>
>>> Let's expose that memory as "System RAM (driver managed)" e.g., via
>>> /pro/iomem.
>>>
>>> We don't have to worry about firmware_map_remove() on the removal pat=
h.
>>> If there is no entry, it will simply return with -EINVAL.
>>>
>>> [1] https://www.kernel.org/doc/Documentation/ABI/testing/sysfs-firmwa=
re-memmap
>>>
>>> Cc: Andrew Morton <akpm@linux-foundation.org>
>>> Cc: Michal Hocko <mhocko@suse.com>
>>> Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
>>> Cc: Wei Yang <richard.weiyang@gmail.com>
>>> Cc: Baoquan He <bhe@redhat.com>
>>> Cc: Eric Biederman <ebiederm@xmission.com>
>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>> ---
>>>  include/linux/memory_hotplug.h |  8 ++++++++
>>>  mm/memory_hotplug.c            | 20 ++++++++++++++++----
>>>  2 files changed, 24 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_ho=
tplug.h
>>> index bf0e3edb8688..cc538584b39e 100644
>>> --- a/include/linux/memory_hotplug.h
>>> +++ b/include/linux/memory_hotplug.h
>>> @@ -68,6 +68,14 @@ struct mhp_params {
>>>       pgprot_t pgprot;
>>>  };
>>>
>>> +/* Flags used for add_memory() and friends. */
>>> +
>>> +/*
>>> + * Don't create entries in /sys/firmware/memmap/ and expose memory a=
s
>>> + * "System RAM (driver managed)" in e.g., /proc/iomem
>>> + */
>>> +#define MHP_DRIVER_MANAGED           1
>>> +
>>>  /*
>>>   * Zone resizing functions
>>>   *
>>> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
>>> index ebdf6541d074..cfa0721280aa 100644
>>> --- a/mm/memory_hotplug.c
>>> +++ b/mm/memory_hotplug.c
>>> @@ -98,11 +98,11 @@ void mem_hotplug_done(void)
>>>  u64 max_mem_size =3D U64_MAX;
>>>
>>>  /* add this memory to iomem resource */
>>> -static struct resource *register_memory_resource(u64 start, u64 size=
)
>>> +static struct resource *register_memory_resource(u64 start, u64 size=
,
>>> +                                              const char *resource_n=
ame)
>>>  {
>>>       struct resource *res;
>>>       unsigned long flags =3D  IORESOURCE_SYSTEM_RAM | IORESOURCE_BUS=
Y;
>>> -     char *resource_name =3D "System RAM";
>>>
>>>       /*
>>>        * Make sure value parsed from 'mem=3D' only restricts memory a=
dding
>>> @@ -1058,7 +1058,8 @@ int __ref add_memory_resource(int nid, struct r=
esource *res,
>>>       BUG_ON(ret);
>>>
>>>       /* create new memmap entry */
>>> -     firmware_map_add_hotplug(start, start + size, "System RAM");
>>> +     if (!(flags & MHP_DRIVER_MANAGED))
>>> +             firmware_map_add_hotplug(start, start + size, "System R=
AM");
>>>
>>>       /* device_online() will take the lock when calling online_pages=
() */
>>>       mem_hotplug_done();
>>> @@ -1081,10 +1082,21 @@ int __ref add_memory_resource(int nid, struct=
 resource *res,
>>>  /* requires device_hotplug_lock, see add_memory_resource() */
>>>  int __ref __add_memory(int nid, u64 start, u64 size, unsigned long f=
lags)
>>>  {
>>> +     const char *resource_name =3D "System RAM";
>>>       struct resource *res;
>>>       int ret;
>>>
>>> -     res =3D register_memory_resource(start, size);
>>> +     /*
>>> +      * Indicate that memory managed by a driver is special. It's al=
ways
>>> +      * detected and added via a driver, should not be given to the =
kexec
>>> +      * kernel for booting when manually crafting the firmware memma=
p, and
>>> +      * no kexec segments should be placed on it. However, kdump sho=
uld
>>> +      * dump this memory.
>>> +      */
>>> +     if (flags & MHP_DRIVER_MANAGED)
>>> +             resource_name =3D "System RAM (driver managed)";
>>> +
>>> +     res =3D register_memory_resource(start, size, resource_name);
>>>       if (IS_ERR(res))
>>>               return PTR_ERR(res);
>>>
>>>
>>
>> BTW, I was wondering if this is actually also something that
>> drivers/dax/kmem.c wants to use for adding memory.
>>
>> Just because we decided to use some DAX memory in the current kernel a=
s
>> system ram, doesn't mean we should make that decision for the kexec
>> kernel (e.g., using it as initial memory, placing kexec binaries onto
>> it, etc.). This is also not what we would observe during a real reboot=
.
>=20
> Agree.
>=20
>> I can see that the "System RAM" resource will show up as child resourc=
e
>> under the device e.g., in /proc/iomem.
>>
>> However, entries in /sys/firmware/memmap/ are created as "System RAM".
>=20
> True. Do you think this rename should just be limited to what type
> /sys/firmware/memmap/ emits? I have the concern, but no proof

We could split this patch into

MHP_NO_FIRMWARE_MEMMAP (create firmware memmap entries)

and

MHP_DRIVER_MANAGED (name of the resource)

See below, the latter might not be needed.

> currently, that there are /proc/iomem walkers that explicitly look for
> "System RAM", but might be thrown off by "System RAM (driver
> managed)". I was not aware of /sys/firmware/memmap until about 5
> minutes ago.

The only two users of /proc/iomem I am aware of are kexec-tools and some
s390x tools.

kexec-tools on x86-64 uses /sys/firmware/memmap to craft the initial
memmap, but uses /proc/iomem to
a) Find places for kexec images
b) Detect memory regions to dump via kdump

I am not yet sure if we really need the "System RAM (driver managed)"
part. If we can teach kexec-tools to
a) Don't place kexec images on "System RAM" that has a parent resource
(most likely requires kexec-tools changes)
b) Consider for kdump "System RAM" that has a parent resource
we might be able to avoid renaming that. (I assume that's already done)

E.g., regarding virtio-mem (patch #3) I am currently also looking into
creating a parent resource instead, like dax/kmem to avoid the rename:

:/# cat /proc/iomem
00000000-00000fff : Reserved
[...]
100000000-13fffffff : System RAM
140000000-33fffffff : virtio0
  140000000-147ffffff : System RAM
  148000000-14fffffff : System RAM
  150000000-157ffffff : System RAM
340000000-303fffffff : virtio1
  340000000-347ffffff : System RAM
3280000000-32ffffffff : PCI Bus 0000:00



--=20
Thanks,

David / dhildenb

