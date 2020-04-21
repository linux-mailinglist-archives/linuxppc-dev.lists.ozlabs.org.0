Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 608FA1B2A89
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 16:54:52 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49666c3snMzDqwb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Apr 2020 00:54:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=xmission.com (client-ip=166.70.13.232;
 helo=out02.mta.xmission.com; envelope-from=ebiederm@xmission.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=xmission.com
Received: from out02.mta.xmission.com (out02.mta.xmission.com [166.70.13.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4964yZ18HWzDqCG
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Apr 2020 00:02:43 +1000 (AEST)
Received: from in02.mta.xmission.com ([166.70.13.52])
 by out02.mta.xmission.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.90_1)
 (envelope-from <ebiederm@xmission.com>)
 id 1jQtTv-0005xC-GY; Tue, 21 Apr 2020 08:02:35 -0600
Received: from ip68-227-160-95.om.om.cox.net ([68.227.160.95]
 helo=x220.xmission.com) by in02.mta.xmission.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.87)
 (envelope-from <ebiederm@xmission.com>)
 id 1jQtTt-0001fg-Qr; Tue, 21 Apr 2020 08:02:35 -0600
From: ebiederm@xmission.com (Eric W. Biederman)
To: David Hildenbrand <david@redhat.com>
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
 <2525cc9c-3566-6275-105b-7f4af8f980bc@redhat.com>
 <9a4eb1d7-33bf-8707-9c0c-1ca657c3e502@redhat.com>
Date: Tue, 21 Apr 2020 08:59:27 -0500
In-Reply-To: <9a4eb1d7-33bf-8707-9c0c-1ca657c3e502@redhat.com> (David
 Hildenbrand's message of "Tue, 21 Apr 2020 15:29:37 +0200")
Message-ID: <87a735548w.fsf@x220.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-XM-SPF: eid=1jQtTt-0001fg-Qr; ; ; mid=<87a735548w.fsf@x220.int.ebiederm.org>;
 ; ; hst=in02.mta.xmission.com; ; ; ip=68.227.160.95; ; ;
 frm=ebiederm@xmission.com; ; ; spf=neutral
X-XM-AID: U2FsdGVkX1+XPCnvTWzC4ci/zsgEXcGATbogYgI8il0=
X-SA-Exim-Connect-IP: 68.227.160.95
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on sa06.xmission.com
X-Spam-Level: **
X-Spam-Status: No, score=2.0 required=8.0 tests=ALL_TRUSTED,BAYES_50,
 DCC_CHECK_NEGATIVE,T_TM2_M_HEADER_IN_MSG,XMNoVowels,XMSubLong
 autolearn=disabled version=3.4.2
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
 *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
 *      [score: 0.5000]
 *  1.5 XMNoVowels Alpha-numberic number with no vowels
 *  0.7 XMSubLong Long Subject
 *  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
 * -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
 *      [sa06 1397; Body=1 Fuz1=1 Fuz2=1]
X-Spam-DCC: XMission; sa06 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: **;David Hildenbrand <david@redhat.com>
X-Spam-Relay-Country: 
X-Spam-Timing: total 1313 ms - load_scoreonly_sql: 0.09 (0.0%),
 signal_user_changed: 12 (0.9%), b_tie_ro: 11 (0.8%), parse: 1.86
 (0.1%), extract_message_metadata: 99 (7.5%), get_uri_detail_list: 4.7
 (0.4%), tests_pri_-1000: 14 (1.1%), tests_pri_-950: 1.93 (0.1%),
 tests_pri_-900: 1.53 (0.1%), tests_pri_-90: 159 (12.1%), check_bayes:
 143 (10.9%), b_tokenize: 29 (2.2%), b_tok_get_all: 40 (3.0%),
 b_comp_prob: 5 (0.4%), b_tok_touch_all: 52 (4.0%), b_finish: 1.02
 (0.1%), tests_pri_0: 957 (72.9%), check_dkim_signature: 0.95 (0.1%),
 check_dkim_adsp: 9 (0.6%), poll_dns_idle: 6 (0.4%), tests_pri_10: 3.3
 (0.3%), tests_pri_500: 12 (0.9%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [PATCH 1/3] kexec: Prevent removal of memory in use by a loaded
 kexec image
X-Spam-Flag: No
X-SA-Exim-Version: 4.2.1 (built Thu, 05 May 2016 13:38:54 -0600)
X-SA-Exim-Scanned: Yes (on in02.mta.xmission.com)
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
Cc: piliu@redhat.com, Baoquan He <bhe@redhat.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Bhupesh Sharma <bhsharma@redhat.com>, linuxppc-dev@lists.ozlabs.org,
 kexec@lists.infradead.org,
 Russell King - ARM Linux admin <linux@armlinux.org.uk>, linux-mm@kvack.org,
 James Morse <james.morse@arm.com>, Andrew Morton <akpm@linux-foundation.org>,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

David Hildenbrand <david@redhat.com> writes:

>>> ACPI SRAT is embeded into efi, need read out the rsdp pointer. If we don't
>>> pass the efi, it won't get the SRAT table correctly, if I remember
>>> correctly. Yeah, I remeber kvm guest can get memory hotplugged with
>>> ACPI only, this won't happen on bare metal though. Need check carefully. 
>>> I have been using kvm guest with uefi firmwire recently.
>> 
>> Yeah, I can imagine that bare metal is different. kvm only uses ACPI.
>> 
>> I'm also asking because of virtio-mem. Memory added via virtio-mem is
>> not part of any efi tables or whatsoever. So I assume the kexec kernel
>> will not detect it automatically (good!), instead load the virtio-mem
>> driver and let it add memory back to the system.
>> 
>> I should probably play with kexec and virtio-mem once I have some spare
>> cycles ... to find out what's broken and needs to be addressed :)
>
> FWIW, I just gave virtio-mem and kexec/kdump a try.
>
> a) kdump seems to work. Memory added by virtio-mem is getting dumped.
> The kexec kernel only uses memory in the crash region. The virtio-mem
> driver properly bails out due to is_kdump_kernel().
>
> b) "kexec -s -l" seems to work fine. For now, the kernel does not seem
> to get placed on virtio-mem memory (pure luck due to the left-to-right
> search). Memory added by virtio-mem is not getting added to the e820
> map. Once the virtio-mem driver comes back up in the kexec kernel, the
> right memory is readded.

This sounds like a bug.

> c) "kexec -c -l" does not work properly. All memory added by virtio-mem
> is added to the e820 map, which is wrong. Memory that should not be
> touched will be touched by the kexec kernel. I assume kexec-tools just
> goes ahead and adds anything it can find in /proc/iomem (or
> /sys/firmware/memmap/) to the e820 map of the new kernel.
>
> Due to c), I assume all hotplugged memory (e.g., ACPI DIMMs) is
> similarly added to the e820 map and, therefore, won't be able to be
> onlined MOVABLE easily.

This sounds like correct behavior to me.  If you add memory to the
system it is treated as memory to the system.

If we need to make it a special kind of memory with special rules we can
have some kind of special marking for the memory.  But hotplugged is not
in itself a sufficient criteria to say don't use this as normal memory.

If take a huge server and I plug in an extra dimm it is just memory.

For a similarly huge server I might want to have memory that the system
booted with unpluggable, in case hardware error reporting notices
a dimm generating a lot of memory errors.

Now perhaps virtualization needs a special tier of memory that should
only be used for cases where the memory is easily movable.

I am not familiar with virtio-mem but my skim of the initial design
is that virtio-mem was not designed to be such a special tier of memory.
Perhaps something has changed?
https://lists.gnu.org/archive/html/qemu-devel/2017-06/msg03870.html


> At least for virtio-mem, I would either have to
> a) Not support "kexec -c -l". A viable option if we would be planning on
> not supporting it either way in the long term. I could block this
> in-kernel somehow eventually.

No.

> b) Teach kexec-tools to leave virtio-mem added memory alone. E.g., by
> indicating it in /proc/iomem in a special way ("System RAM
> (hotplugged)"/"System RAM (virtio-mem)").

How does the kernel memory allocator treat this memory?

The logic is simple.  If the kernel memory allocator treats that memory
as ordinary memory available for all uses it should be presented as
ordinary memory available for all uses.

If the kernel memory allocator treats that memory as special memory
only available for uses that we can easily free later and give back to
the system.  AKA it is special and not oridinary memory we should mark
it as such.

Eric

p.s.  Please excuse me for jumping in I may be missing some important
context, but what I read when I saw this message in my inbox just seemed
very wrong.


