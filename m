Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AEEF61C1F61
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 May 2020 23:13:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49DQ2c0zKqzDrQt
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 May 2020 07:13:12 +1000 (AEST)
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
 header.s=mimecast20190719 header.b=jDhri3Uh; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=jDhri3Uh; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49DQ0N4tL7zDrMX
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 May 2020 07:11:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588367471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=fRnz7yVdPFbQgbwK7ShtSld7Iu+KxsdDibH5r6Rzhl8=;
 b=jDhri3UhQTrjWS8CxNkL4gjID1KSF3lJUEwbVM/i6KkX1ildH/HveGEg8JwDoOzTkbaBoE
 tlD/XYUdS/m29Z56lLXFMm1l09VQkMnRrZGbqUyDsSoSm70PJcI703Jc+eQdrQkDBXFqCs
 WiozvAnU7kuYbNoKArU9vMQxXUaNM4w=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588367471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=fRnz7yVdPFbQgbwK7ShtSld7Iu+KxsdDibH5r6Rzhl8=;
 b=jDhri3UhQTrjWS8CxNkL4gjID1KSF3lJUEwbVM/i6KkX1ildH/HveGEg8JwDoOzTkbaBoE
 tlD/XYUdS/m29Z56lLXFMm1l09VQkMnRrZGbqUyDsSoSm70PJcI703Jc+eQdrQkDBXFqCs
 WiozvAnU7kuYbNoKArU9vMQxXUaNM4w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-f73fybUJPlyu_J1p8_v2yQ-1; Fri, 01 May 2020 17:11:04 -0400
X-MC-Unique: f73fybUJPlyu_J1p8_v2yQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 167D181CBF5;
 Fri,  1 May 2020 21:11:01 +0000 (UTC)
Received: from [10.36.112.180] (ovpn-112-180.ams2.redhat.com [10.36.112.180])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0706A605D7;
 Fri,  1 May 2020 21:10:53 +0000 (UTC)
Subject: Re: [PATCH v2 2/3] mm/memory_hotplug: Introduce MHP_NO_FIRMWARE_MEMMAP
To: Dan Williams <dan.j.williams@intel.com>
References: <20200430102908.10107-1-david@redhat.com>
 <1b49c3be-6e2f-57cb-96f7-f66a8f8a9380@redhat.com>
 <871ro52ary.fsf@x220.int.ebiederm.org>
 <373a6898-4020-4af1-5b3d-f827d705dd77@redhat.com>
 <875zdg26hp.fsf@x220.int.ebiederm.org>
 <b28c9e02-8cf2-33ae-646b-fe50a185738e@redhat.com>
 <20200430152403.e0d6da5eb1cad06411ac6d46@linux-foundation.org>
 <5c908ec3-9495-531e-9291-cbab24f292d6@redhat.com>
 <CAPcyv4j=YKnr1HW4OhAmpzbuKjtfP7FdAn4-V7uA=b-Tcpfu+A@mail.gmail.com>
 <2d019c11-a478-9d70-abd5-4fd2ebf4bc1d@redhat.com>
 <CAPcyv4iOqS0Wbfa2KPfE1axQFGXoRB4mmPRP__Lmqpw6Qpr_ig@mail.gmail.com>
 <62dd4ce2-86cc-5b85-734f-ec8766528a1b@redhat.com>
 <0169e822-a6cc-1543-88ed-2a85d95ffb93@redhat.com>
 <CAPcyv4jGnR_fPtpKBC1rD2KRcT88bTkhqnTMmuwuc+f9Dwrz1g@mail.gmail.com>
 <9f3a813e-dc1d-b675-6e69-85beed3057a4@redhat.com>
 <CAPcyv4jjrxQ27rsfmz6wYPgmedevU=KG+wZ0GOm=qiE6tqa+VA@mail.gmail.com>
 <04242d48-5fa9-6da4-3e4a-991e401eb580@redhat.com>
 <CAPcyv4iXyOUDZgqhWH1KCObvATL=gP55xEr64rsRfUuJg5B+eQ@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
Organization: Red Hat GmbH
Message-ID: <8242c0c5-2df2-fc0c-079a-3be62c113a11@redhat.com>
Date: Fri, 1 May 2020 23:10:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAPcyv4iXyOUDZgqhWH1KCObvATL=gP55xEr64rsRfUuJg5B+eQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
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
 Linux ACPI <linux-acpi@vger.kernel.org>, Wei Yang <richard.weiyang@gmail.com>,
 linux-s390 <linux-s390@vger.kernel.org>,
 linux-nvdimm <linux-nvdimm@lists.01.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 virtualization@lists.linux-foundation.org, Linux MM <linux-mm@kvack.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Morton <akpm@linux-foundation.org>, Michal Hocko <mhocko@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 01.05.20 22:12, Dan Williams wrote:
> On Fri, May 1, 2020 at 12:18 PM David Hildenbrand <david@redhat.com> wr=
ote:
>>
>> On 01.05.20 20:43, Dan Williams wrote:
>>> On Fri, May 1, 2020 at 11:14 AM David Hildenbrand <david@redhat.com> =
wrote:
>>>>
>>>> On 01.05.20 20:03, Dan Williams wrote:
>>>>> On Fri, May 1, 2020 at 10:51 AM David Hildenbrand <david@redhat.com=
> wrote:
>>>>>>
>>>>>> On 01.05.20 19:45, David Hildenbrand wrote:
>>>>>>> On 01.05.20 19:39, Dan Williams wrote:
>>>>>>>> On Fri, May 1, 2020 at 10:21 AM David Hildenbrand <david@redhat.=
com> wrote:
>>>>>>>>>
>>>>>>>>> On 01.05.20 18:56, Dan Williams wrote:
>>>>>>>>>> On Fri, May 1, 2020 at 2:34 AM David Hildenbrand <david@redhat=
.com> wrote:
>>>>>>>>>>>
>>>>>>>>>>> On 01.05.20 00:24, Andrew Morton wrote:
>>>>>>>>>>>> On Thu, 30 Apr 2020 20:43:39 +0200 David Hildenbrand <david@=
redhat.com> wrote:
>>>>>>>>>>>>
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Why does the firmware map support hotplug entries?
>>>>>>>>>>>>>
>>>>>>>>>>>>> I assume:
>>>>>>>>>>>>>
>>>>>>>>>>>>> The firmware memmap was added primarily for x86-64 kexec (a=
nd still, is
>>>>>>>>>>>>> mostly used on x86-64 only IIRC). There, we had ACPI hotplu=
g. When DIMMs
>>>>>>>>>>>>> get hotplugged on real HW, they get added to e820. Same app=
lies to
>>>>>>>>>>>>> memory added via HyperV balloon (unless memory is unplugged=
 via
>>>>>>>>>>>>> ballooning and you reboot ... the the e820 is changed as we=
ll). I assume
>>>>>>>>>>>>> we wanted to be able to reflect that, to make kexec look li=
ke a real reboot.
>>>>>>>>>>>>>
>>>>>>>>>>>>> This worked for a while. Then came dax/kmem. Now comes virt=
io-mem.
>>>>>>>>>>>>>
>>>>>>>>>>>>>
>>>>>>>>>>>>> But I assume only Andrew can enlighten us.
>>>>>>>>>>>>>
>>>>>>>>>>>>> @Andrew, any guidance here? Should we really add all memory=
 to the
>>>>>>>>>>>>> firmware memmap, even if this contradicts with the existing
>>>>>>>>>>>>> documentation? (especially, if the actual firmware memmap w=
ill *not*
>>>>>>>>>>>>> contain that memory after a reboot)
>>>>>>>>>>>>
>>>>>>>>>>>> For some reason that patch is misattributed - it was authore=
d by
>>>>>>>>>>>> Shaohui Zheng <shaohui.zheng@intel.com>, who hasn't been hea=
rd from in
>>>>>>>>>>>> a decade.  I looked through the email discussion from that t=
ime and I'm
>>>>>>>>>>>> not seeing anything useful.  But I wasn't able to locate Dav=
e Hansen's
>>>>>>>>>>>> review comments.
>>>>>>>>>>>
>>>>>>>>>>> Okay, thanks for checking. I think the documentation from 200=
8 is pretty
>>>>>>>>>>> clear what has to be done here. I will add some of these deta=
ils to the
>>>>>>>>>>> patch description.
>>>>>>>>>>>
>>>>>>>>>>> Also, now that I know that esp. kexec-tools already don't con=
sider
>>>>>>>>>>> dax/kmem memory properly (memory will not get dumped via kdum=
p) and
>>>>>>>>>>> won't really suffer from a name change in /proc/iomem, I will=
 go back to
>>>>>>>>>>> the MHP_DRIVER_MANAGED approach and
>>>>>>>>>>> 1. Don't create firmware memmap entries
>>>>>>>>>>> 2. Name the resource "System RAM (driver managed)"
>>>>>>>>>>> 3. Flag the resource via something like IORESOURCE_MEM_DRIVER=
_MANAGED.
>>>>>>>>>>>
>>>>>>>>>>> This way, kernel users and user space can figure out that thi=
s memory
>>>>>>>>>>> has different semantics and handle it accordingly - I think t=
hat was
>>>>>>>>>>> what Eric was asking for.
>>>>>>>>>>>
>>>>>>>>>>> Of course, open for suggestions.
>>>>>>>>>>
>>>>>>>>>> I'm still more of a fan of this being communicated by "System =
RAM"
>>>>>>>>>
>>>>>>>>> I was mentioning somewhere in this thread that "System RAM" ins=
ide a
>>>>>>>>> hierarchy (like dax/kmem) will already be basically ignored by
>>>>>>>>> kexec-tools. So, placing it inside a hierarchy already makes it=
 look
>>>>>>>>> special already.
>>>>>>>>>
>>>>>>>>> But after all, as we have to change kexec-tools either way, we =
can
>>>>>>>>> directly go ahead and flag it properly as special (in case ther=
e will
>>>>>>>>> ever be other cases where we could no longer distinguish it).
>>>>>>>>>
>>>>>>>>>> being parented especially because that tells you something abo=
ut how
>>>>>>>>>> the memory is driver-managed and which mechanism might be in p=
lay.
>>>>>>>>>
>>>>>>>>> The could be communicated to some degree via the resource hiera=
rchy.
>>>>>>>>>
>>>>>>>>> E.g.,
>>>>>>>>>
>>>>>>>>>             [root@localhost ~]# cat /proc/iomem
>>>>>>>>>             ...
>>>>>>>>>             140000000-33fffffff : Persistent Memory
>>>>>>>>>               140000000-1481fffff : namespace0.0
>>>>>>>>>               150000000-33fffffff : dax0.0
>>>>>>>>>                 150000000-33fffffff : System RAM (driver manage=
d)
>>>>>>>>>
>>>>>>>>> vs.
>>>>>>>>>
>>>>>>>>>            :/# cat /proc/iomem
>>>>>>>>>             [...]
>>>>>>>>>             140000000-333ffffff : virtio-mem (virtio0)
>>>>>>>>>               140000000-147ffffff : System RAM (driver managed)
>>>>>>>>>               148000000-14fffffff : System RAM (driver managed)
>>>>>>>>>               150000000-157ffffff : System RAM (driver managed)
>>>>>>>>>
>>>>>>>>> Good enough for my taste.
>>>>>>>>>
>>>>>>>>>> What about adding an optional /sys/firmware/memmap/X/parent at=
tribute.
>>>>>>>>>
>>>>>>>>> I really don't want any firmware memmap entries for something t=
hat is
>>>>>>>>> not part of the firmware provided memmap. In addition,
>>>>>>>>> /sys/firmware/memmap/ is still a fairly x86_64 specific thing. =
Only mips
>>>>>>>>> and two arm configs enable it at all.
>>>>>>>>>
>>>>>>>>> So, IMHO, /sys/firmware/memmap/ is definitely not the way to go=
.
>>>>>>>>
>>>>>>>> I think that's a policy decision and policy decisions do not bel=
ong in
>>>>>>>> the kernel. Give the tooling the opportunity to decide whether S=
ystem
>>>>>>>> RAM stays that way over a kexec. The parenthetical reference oth=
erwise
>>>>>>>> looks out of place to me in the /proc/iomem output. What makes i=
t
>>>>>>>> "driver managed" is how the kernel handles it, not how the kerne=
l
>>>>>>>> names it.
>>>>>>>
>>>>>>> At least, virtio-mem is different. It really *has to be handled* =
by the
>>>>>>> driver. This is not a policy. It's how it works.
>>>>>
>>>>> ...but that's not necessarily how dax/kmem works.
>>>>>
>>>>
>>>> Yes, and user space could still take that memory and add it to the
>>>> firmware memmap if it really wants to. It knows that it is special. =
It
>>>> can figure out that it belongs to a dax device using /proc/iomem.
>>>>
>>>>>>>
>>>>>>
>>>>>> Oh, and I don't see why "System RAM (driver managed)" would hinder=
 any
>>>>>> policy in user case to still do what it thinks is the right thing =
to do
>>>>>> (e.g., for dax).
>>>>>>
>>>>>> "System RAM (driver managed)" would mean: Memory is not part of th=
e raw
>>>>>> firmware memmap. It was detected and added by a driver. Handle wit=
h
>>>>>> care, this is special.
>>>>>
>>>>> Oh, no, I was more reacting to your, "don't update
>>>>> /sys/firmware/memmap for the (driver managed) range" choice as bein=
g a
>>>>> policy decision. It otherwise feels to me "System RAM (driver
>>>>> managed)" adds confusion for casual users of /proc/iomem and for cl=
ued
>>>>> in tools they have the parent association to decide policy.
>>>>
>>>> Not sure if I understand correctly, so bear with me :).
>>>>
>>>> Adding or not adding stuff to /sys/firmware/memmap is not a policy
>>>> decision. If it's not part of the raw firmware-provided memmap, it h=
as
>>>> nothing to do in /sys/firmware/memmap. That's what the documentation
>>>> from 2008 tells us.
>>>
>>> It just occurs to me that there are valid cases for both wanting to
>>> start over with driver managed memory with a kexec and keeping it in
>>> the map.
>>
>> Yes, there might be valid cases. My gut feeling is that in the general
>> case, you want to let the kexec kernel implement a policy/ let the use=
r
>> in the new system decide.
>>
>> But as I said, you can implement in kexec-tools whatever policy you
>> want. It has access to all information.
>=20
> Right, so why is a new type needed if all the information is there by
> other means?

You mean "System RAM (driver managed)" in /proc/iomem? See below for more=
.

>=20
>>> Consider the case of EFI Special Purpose (SP) Memory that is
>>> marked EFI Conventional Memory with the SP attribute. In that case th=
e
>>> firmware memory map marked it as conventional RAM, but the kernel
>>> optionally marks it as System RAM vs Soft Reserved. The 2008 patch
>>> simply does not consider that case. I'm not sure strict textualism
>>> works for coding decisions.
>>
>> I am no expert on that matter (esp EFI). But looking at the users of
>> firmware_map_add_early(), the single user is in arch/x86/kernel/e820.c
>> . So the single source of /sys/firmware/memmap is (besides hotplug) e8=
20.
>>
>> "'e820_table_firmware': the original firmware version passed to us by
>> the bootloader - not modified by the kernel. ... inform the user about
>> the firmware's notion of memory layout via /sys/firmware/memmap"
>> (arch/x86/kernel/e820.c)
>>
>> How is the EFI Special Purpose (SP) Memory represented in e820?
>> /sys/firmware/memmap is really simple: just dump in e820. No policies =
IIUC.
>=20
> e820 now has a Soft Reserved translation for this which means "try to
> reserve, but treat as System RAM is ok too". It seems generically
> useful to me that the toggle for determining whether Soft Reserved or
> System RAM shows up /sys/firmware/memmap is a determination that
> policy can make. The kernel need not preemptively block it.

So, I think I have to clarify something here. We do have two ways to kexe=
c

1. kexec_load(): User space (kexec-tools) crafts the memmap (e.g., using
/sys/firmware/memmap on x86-64) and selects memory where to place the
kexec images (e.g., using /proc/iomem)

2. kexec_file_load(): The kernel reuses the (basically) raw firmware
memmap and selects memory where to place kexec images.

We are talking about changing 1, to behave like 2 in regards to
dax/kmem. 2. does currently not add any hotplugged memory to the
fixed-up e820, and it should be fixed regarding hotplugged DIMMs that
would appear in e820 after a reboot.

Now, all these policy discussions are nice and fun, but I don't really
see a good reason to (ab)use /sys/firmware/memmap for that (e.g., parent
properties). If you want to be able to make this configurable, then
e.g., add a way to configure this in the kernel (for example along with
kmem) to make 1. and 2. behave the same way. Otherwise, you really only
can change 1.


Now, let's clarify what I want regarding virtio-mem:

1. kexec should not add virtio-mem memory to the initial firmware
   memmap. The driver has to be in charge as discussed.
2. kexec should not place kexec images onto virtio-mem memory. That
   would end badly.
3. kexec should still dump virtio-mem memory via kdump.

This has to work when using kexec_load() or kexec_file_load(). This has
to theoretically work on different architectures (especially, without
/sys/firmware/memmap). kexec-tools has to have access to that
information to figure out what to do.

Regarding 1:
- kexec_file_load(): works out of the box currently.
- kexec_load(): Don't create entries in /sys/firmware/memmap (for
  reasons discussed)
Regarding 2:
- kexec_file_load(): tag the resources as IORESOURCE_MEM_DRIVER_MANAGED
  (inspired by Eric)
- kexec_load(): indicate the memory as "System RAM (driver managed)"
Regarding 3:
- Same as 2. kexec-tools need to be thought to properly consider the
  memory during kdump.

Now, you are asking, "why System RAM (driver managed)". I don't think
it's strictly needed right now, but it feels cleaner. E.g., for
virtio-mem the current plan is to have /proc/iomem look like

           :/# cat /proc/iomem
            [...]
            140000000-333ffffff : virtio-mem (virtio0)
              140000000-147ffffff : System RAM (driver managed)
              148000000-14fffffff : System RAM (driver managed)
              150000000-157ffffff : System RAM (driver managed)

One could judge by looking at the hierarchy, that this memory is
special. kexec-tools will skip it currently in either form.

If we all agree here, that we can drop it, then let's drop it,
especially if it would allow dax/kmem to use the same mechanism I am
proposing here for virtio-mem.


Now, it would be fairly simple to add a config option for dax/kmem,
making it configurable in the kernel, whether to add memory via
MHP_DRIVER_MANAGED or just as we do now. It would contradict with the
"raw firmware/prov..." description of /sys/firmware/memmap, but hey,
somebody explicitly configured it, so it can't be wrong.

--=20
Thanks,

David / dhildenb

