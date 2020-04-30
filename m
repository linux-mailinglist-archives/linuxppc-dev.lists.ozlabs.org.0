Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB151C02BC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Apr 2020 18:40:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Ch236zbhzDqQV
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 May 2020 02:40:11 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Cgyk3Z1WzDqQD
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 May 2020 02:37:17 +1000 (AEST)
Received: from in01.mta.xmission.com ([166.70.13.51])
 by out02.mta.xmission.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.90_1)
 (envelope-from <ebiederm@xmission.com>)
 id 1jUCBV-000583-GC; Thu, 30 Apr 2020 10:37:13 -0600
Received: from ip68-227-160-95.om.om.cox.net ([68.227.160.95]
 helo=x220.xmission.com) by in01.mta.xmission.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.87)
 (envelope-from <ebiederm@xmission.com>)
 id 1jUCBT-0003Sj-B6; Thu, 30 Apr 2020 10:37:12 -0600
From: ebiederm@xmission.com (Eric W. Biederman)
To: David Hildenbrand <david@redhat.com>
References: <20200430102908.10107-1-david@redhat.com>
 <20200430102908.10107-3-david@redhat.com>
 <87pnbp2dcz.fsf@x220.int.ebiederm.org>
 <1b49c3be-6e2f-57cb-96f7-f66a8f8a9380@redhat.com>
Date: Thu, 30 Apr 2020 11:33:53 -0500
In-Reply-To: <1b49c3be-6e2f-57cb-96f7-f66a8f8a9380@redhat.com> (David
 Hildenbrand's message of "Thu, 30 Apr 2020 17:52:35 +0200")
Message-ID: <871ro52ary.fsf@x220.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-XM-SPF: eid=1jUCBT-0003Sj-B6; ; ; mid=<871ro52ary.fsf@x220.int.ebiederm.org>;
 ; ; hst=in01.mta.xmission.com; ; ; ip=68.227.160.95; ; ;
 frm=ebiederm@xmission.com; ; ; spf=neutral
X-XM-AID: U2FsdGVkX1/rjTp6/iiXIJNS/hMPK4PB5d8gU9GVdPg=
X-SA-Exim-Connect-IP: 68.227.160.95
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on sa07.xmission.com
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=8.0 tests=ALL_TRUSTED,BAYES_50,
 DCC_CHECK_NEGATIVE,T_TM2_M_HEADER_IN_MSG,T_TooManySym_01,
 XMGappySubj_01,XMSubLong autolearn=disabled version=3.4.2
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
 *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
 *      [score: 0.5000] *  0.5 XMGappySubj_01 Very gappy subject
 *  0.7 XMSubLong Long Subject
 *  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
 * -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
 *      [sa07 1397; Body=1 Fuz1=1 Fuz2=1]
 *  0.0 T_TooManySym_01 4+ unique symbols in subject
X-Spam-DCC: XMission; sa07 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: *;David Hildenbrand <david@redhat.com>
X-Spam-Relay-Country: 
X-Spam-Timing: total 593 ms - load_scoreonly_sql: 0.05 (0.0%),
 signal_user_changed: 11 (1.8%), b_tie_ro: 9 (1.6%), parse: 0.91 (0.2%),
 extract_message_metadata: 12 (2.0%), get_uri_detail_list: 2.4 (0.4%),
 tests_pri_-1000: 13 (2.2%), tests_pri_-950: 1.23 (0.2%),
 tests_pri_-900: 1.02 (0.2%), tests_pri_-90: 215 (36.3%), check_bayes:
 214 (36.0%), b_tokenize: 9 (1.6%), b_tok_get_all: 87 (14.6%),
 b_comp_prob: 3.3 (0.6%), b_tok_touch_all: 110 (18.5%), b_finish: 0.89
 (0.2%), tests_pri_0: 328 (55.3%), check_dkim_signature: 0.57 (0.1%),
 check_dkim_adsp: 2.3 (0.4%), poll_dns_idle: 0.71 (0.1%), tests_pri_10:
 2.1 (0.4%), tests_pri_500: 6 (1.0%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [PATCH v2 2/3] mm/memory_hotplug: Introduce MHP_NO_FIRMWARE_MEMMAP
X-Spam-Flag: No
X-SA-Exim-Version: 4.2.1 (built Thu, 05 May 2016 13:38:54 -0600)
X-SA-Exim-Scanned: Yes (on in01.mta.xmission.com)
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

David Hildenbrand <david@redhat.com> writes:

> On 30.04.20 17:38, Eric W. Biederman wrote:
>> David Hildenbrand <david@redhat.com> writes:
>> 
>>> Some devices/drivers that add memory via add_memory() and friends (e.g.,
>>> dax/kmem, but also virtio-mem in the future) don't want to create entries
>>> in /sys/firmware/memmap/ - primarily to hinder kexec from adding this
>>> memory to the boot memmap of the kexec kernel.
>>>
>>> In fact, such memory is never exposed via the firmware memmap as System
>>> RAM (e.g., e820), so exposing this memory via /sys/firmware/memmap/ is
>>> wrong:
>>>  "kexec needs the raw firmware-provided memory map to setup the
>>>   parameter segment of the kernel that should be booted with
>>>   kexec. Also, the raw memory map is useful for debugging. For
>>>   that reason, /sys/firmware/memmap is an interface that provides
>>>   the raw memory map to userspace." [1]
>>>
>>> We don't have to worry about firmware_map_remove() on the removal path.
>>> If there is no entry, it will simply return with -EINVAL.
>>>
>>> [1]
>>> https://www.kernel.org/doc/Documentation/ABI/testing/sysfs-firmware-memmap
>> 
>> 
>> You know what this justification is rubbish, and I have previously
>> explained why it is rubbish.
>
> Actually, no, I don't think it is rubbish. See patch #3 and the cover
> letter why this is the right thing to do *for special memory*, *not
> ordinary DIMMs*.
>
> And to be quite honest, I think your response is a little harsh. I don't
> recall you replying to my virtio-mem-related comments.
>
>> 
>> Nacked-by: "Eric W. Biederman" <ebiederm@xmission.com>
>> 
>> This needs to be based on weather the added memory is ultimately normal
>> ram or is something special.
>
> Yes, that's what the caller are expected to decide, see patch #3.
>
> kexec should try to be as closely as possible to a real reboot - IMHO.

That is very fuzzy in terms of hotplug memory.  The kexec'd kernel
should see the hotplugged memory assuming it is ordinary memory.

But kexec is not a reboot although it is quite similar.   Kexec is
swapping one running kernel and it's state for another kernel without
rebooting.

>> Justifying behavior by documentation that does not consider memory
>> hotplug is bad thinking.
>
> Are you maybe confusing this patch series with the arm64 approach? This
> is not about ordinary hotplugged DIMMs.

I think I am.

My challenge is that I don't see anything in the description that says
this isn't about ordinary hotplugged DIMMs.  All I saw was hotplug
memory.

If the class of memory is different then please by all means let's mark
it differently in struct resource so everyone knows it is different.
But that difference needs to be more than hotplug.

That difference needs to be the hypervisor loaned us memory and might
take it back at any time, or this memory is persistent and so it has
these different characteristics so don't use it as ordinary ram.

That information is also useful to other people looking at the system
and seeing what is going on.

Just please don't muddle the concepts, or assume that whatever subset of
hotplug memory you are dealing with is the only subset.

I didn't see that flag making the distinction about the kind of memory
it is.

Eric




