Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B61D91C0327
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Apr 2020 18:52:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49ChJC5FXGzDr6K
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 May 2020 02:52:27 +1000 (AEST)
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
 header.s=mimecast20190719 header.b=NtQGQgg0; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=NtQGQgg0; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49ChFK06BkzDr5g
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 May 2020 02:49:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588265393;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=B9luQcDf1oWYK0AhgcBL9GSRdmBN4OPZecF4rGENsoA=;
 b=NtQGQgg06wZHi/izsHAXTPyB4kDYQxjzKf5OLw+OcEIlKUNvp/GGviliu6tR9TUJPGNE1W
 8GPEoQGYYhVloiPqnQG7SIU4nd5zaHdFDVKy66ku+g2G850dkAwgU3hBHrto/elCNG0i5P
 WSJwrRQFU3tEhkABjBuV3XTN3DM77Ak=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588265393;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=B9luQcDf1oWYK0AhgcBL9GSRdmBN4OPZecF4rGENsoA=;
 b=NtQGQgg06wZHi/izsHAXTPyB4kDYQxjzKf5OLw+OcEIlKUNvp/GGviliu6tR9TUJPGNE1W
 8GPEoQGYYhVloiPqnQG7SIU4nd5zaHdFDVKy66ku+g2G850dkAwgU3hBHrto/elCNG0i5P
 WSJwrRQFU3tEhkABjBuV3XTN3DM77Ak=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-v8jSMvXVN_mxbmwJaY0ocA-1; Thu, 30 Apr 2020 12:49:49 -0400
X-MC-Unique: v8jSMvXVN_mxbmwJaY0ocA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93C0F462;
 Thu, 30 Apr 2020 16:49:46 +0000 (UTC)
Received: from [10.36.113.172] (ovpn-113-172.ams2.redhat.com [10.36.113.172])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 929D0512E4;
 Thu, 30 Apr 2020 16:49:40 +0000 (UTC)
Subject: Re: [PATCH v2 2/3] mm/memory_hotplug: Introduce MHP_NO_FIRMWARE_MEMMAP
To: "Eric W. Biederman" <ebiederm@xmission.com>
References: <20200430102908.10107-1-david@redhat.com>
 <20200430102908.10107-3-david@redhat.com>
 <87pnbp2dcz.fsf@x220.int.ebiederm.org>
 <1b49c3be-6e2f-57cb-96f7-f66a8f8a9380@redhat.com>
 <871ro52ary.fsf@x220.int.ebiederm.org>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
Organization: Red Hat GmbH
Message-ID: <373a6898-4020-4af1-5b3d-f827d705dd77@redhat.com>
Date: Thu, 30 Apr 2020 18:49:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <871ro52ary.fsf@x220.int.ebiederm.org>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
 Michal Hocko <mhocko@suse.com>, Baoquan He <bhe@redhat.com>,
 linux-mm@kvack.org, Wei Yang <richard.weiyang@gmail.com>,
 linux-s390@vger.kernel.org, linux-nvdimm@lists.01.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-acpi@vger.kernel.org, "Michael S . Tsirkin" <mst@redhat.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, xen-devel@lists.xenproject.org,
 Andrew Morton <akpm@linux-foundation.org>, Michal Hocko <mhocko@kernel.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 30.04.20 18:33, Eric W. Biederman wrote:
> David Hildenbrand <david@redhat.com> writes:
>=20
>> On 30.04.20 17:38, Eric W. Biederman wrote:
>>> David Hildenbrand <david@redhat.com> writes:
>>>
>>>> Some devices/drivers that add memory via add_memory() and friends (e=
.g.,
>>>> dax/kmem, but also virtio-mem in the future) don't want to create en=
tries
>>>> in /sys/firmware/memmap/ - primarily to hinder kexec from adding thi=
s
>>>> memory to the boot memmap of the kexec kernel.
>>>>
>>>> In fact, such memory is never exposed via the firmware memmap as Sys=
tem
>>>> RAM (e.g., e820), so exposing this memory via /sys/firmware/memmap/ =
is
>>>> wrong:
>>>>  "kexec needs the raw firmware-provided memory map to setup the
>>>>   parameter segment of the kernel that should be booted with
>>>>   kexec. Also, the raw memory map is useful for debugging. For
>>>>   that reason, /sys/firmware/memmap is an interface that provides
>>>>   the raw memory map to userspace." [1]
>>>>
>>>> We don't have to worry about firmware_map_remove() on the removal pa=
th.
>>>> If there is no entry, it will simply return with -EINVAL.
>>>>
>>>> [1]
>>>> https://www.kernel.org/doc/Documentation/ABI/testing/sysfs-firmware-=
memmap
>>>
>>>
>>> You know what this justification is rubbish, and I have previously
>>> explained why it is rubbish.
>>
>> Actually, no, I don't think it is rubbish. See patch #3 and the cover
>> letter why this is the right thing to do *for special memory*, *not
>> ordinary DIMMs*.
>>
>> And to be quite honest, I think your response is a little harsh. I don=
't
>> recall you replying to my virtio-mem-related comments.
>>
>>>
>>> Nacked-by: "Eric W. Biederman" <ebiederm@xmission.com>
>>>
>>> This needs to be based on weather the added memory is ultimately norm=
al
>>> ram or is something special.
>>
>> Yes, that's what the caller are expected to decide, see patch #3.
>>
>> kexec should try to be as closely as possible to a real reboot - IMHO.
>=20
> That is very fuzzy in terms of hotplug memory.  The kexec'd kernel
> should see the hotplugged memory assuming it is ordinary memory.
>=20
> But kexec is not a reboot although it is quite similar.   Kexec is
> swapping one running kernel and it's state for another kernel without
> rebooting.

I agree (especially regarding the arm64 DIMM hotplug discussion).
However, for the two cases

a) dax/kmem
b) virtio-mem

We really want to let the driver take back control and figure out "what
to do with the memory".

>=20
>>> Justifying behavior by documentation that does not consider memory
>>> hotplug is bad thinking.
>>
>> Are you maybe confusing this patch series with the arm64 approach? Thi=
s
>> is not about ordinary hotplugged DIMMs.
>=20
> I think I am.
>=20
> My challenge is that I don't see anything in the description that says
> this isn't about ordinary hotplugged DIMMs.  All I saw was hotplug
> memory.

I'm sorry if that was confusing, I tried to stress that kmem and
virtio-mem is special in the description.

I squeezed a lot of that information into the cover letter and into
patch #3.

>=20
> If the class of memory is different then please by all means let's mark
> it differently in struct resource so everyone knows it is different.
> But that difference needs to be more than hotplug.
>=20
> That difference needs to be the hypervisor loaned us memory and might
> take it back at any time, or this memory is persistent and so it has
> these different characteristics so don't use it as ordinary ram.

Yes, and I think kmem took an excellent approach of explicitly putting
that "System RAM" into a resource hierarchy. That "System RAM" won't
show up as a root node under /proc/iomem (see patch #3), which already
results in kexec-tools to treat it in a special way. I am thinking about
doing the same for virtio-mem.

>=20
> That information is also useful to other people looking at the system
> and seeing what is going on.
>=20
> Just please don't muddle the concepts, or assume that whatever subset o=
f
> hotplug memory you are dealing with is the only subset.

I can certainly rephrase the subject/description/comment, stating that
this is not to be used for ordinary hotplugged DIMMs - only when the
device driver is under control to decide what to do with that memory -
especially when kexec'ing.

(previously, I called this flag MHP_DRIVER_MANAGED, but I think
MHP_NO_FIRMWARE_MEMMAP is clearer, we just need a better description)

Would that make it clearer?

Thanks!

--=20
Thanks,

David / dhildenb

