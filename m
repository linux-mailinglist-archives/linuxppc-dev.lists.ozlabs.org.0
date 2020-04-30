Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A427A1C00AF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Apr 2020 17:45:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49CfpM05gWzDqgk
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 May 2020 01:44:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=xmission.com (client-ip=166.70.13.233;
 helo=out03.mta.xmission.com; envelope-from=ebiederm@xmission.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=xmission.com
Received: from out03.mta.xmission.com (out03.mta.xmission.com [166.70.13.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49CfkM03sCzDr7H
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 May 2020 01:41:28 +1000 (AEST)
Received: from in02.mta.xmission.com ([166.70.13.52])
 by out03.mta.xmission.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.90_1)
 (envelope-from <ebiederm@xmission.com>)
 id 1jUBJT-0008Qi-7v; Thu, 30 Apr 2020 09:41:23 -0600
Received: from ip68-227-160-95.om.om.cox.net ([68.227.160.95]
 helo=x220.xmission.com) by in02.mta.xmission.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.87)
 (envelope-from <ebiederm@xmission.com>)
 id 1jUBJS-0002Fp-2k; Thu, 30 Apr 2020 09:41:22 -0600
From: ebiederm@xmission.com (Eric W. Biederman)
To: David Hildenbrand <david@redhat.com>
References: <20200430102908.10107-1-david@redhat.com>
 <20200430102908.10107-3-david@redhat.com>
Date: Thu, 30 Apr 2020 10:38:04 -0500
In-Reply-To: <20200430102908.10107-3-david@redhat.com> (David Hildenbrand's
 message of "Thu, 30 Apr 2020 12:29:07 +0200")
Message-ID: <87pnbp2dcz.fsf@x220.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-XM-SPF: eid=1jUBJS-0002Fp-2k; ; ; mid=<87pnbp2dcz.fsf@x220.int.ebiederm.org>;
 ; ; hst=in02.mta.xmission.com; ; ; ip=68.227.160.95; ; ;
 frm=ebiederm@xmission.com; ; ; spf=neutral
X-XM-AID: U2FsdGVkX18EJxut0ZMAzA6GiTlXjw55Di06eL/sNkE=
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
X-Spam-Timing: total 643 ms - load_scoreonly_sql: 0.04 (0.0%),
 signal_user_changed: 11 (1.7%), b_tie_ro: 10 (1.5%), parse: 1.37
 (0.2%), extract_message_metadata: 29 (4.4%), get_uri_detail_list: 4.7
 (0.7%), tests_pri_-1000: 50 (7.8%), tests_pri_-950: 1.81 (0.3%),
 tests_pri_-900: 1.57 (0.2%), tests_pri_-90: 188 (29.3%), check_bayes:
 186 (28.9%), b_tokenize: 11 (1.7%), b_tok_get_all: 91 (14.2%),
 b_comp_prob: 3.8 (0.6%), b_tok_touch_all: 76 (11.8%), b_finish: 0.97
 (0.2%), tests_pri_0: 346 (53.9%), check_dkim_signature: 0.82 (0.1%),
 check_dkim_adsp: 2.4 (0.4%), poll_dns_idle: 0.54 (0.1%), tests_pri_10:
 2.3 (0.4%), tests_pri_500: 7 (1.1%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [PATCH v2 2/3] mm/memory_hotplug: Introduce MHP_NO_FIRMWARE_MEMMAP
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

> Some devices/drivers that add memory via add_memory() and friends (e.g.,
> dax/kmem, but also virtio-mem in the future) don't want to create entries
> in /sys/firmware/memmap/ - primarily to hinder kexec from adding this
> memory to the boot memmap of the kexec kernel.
>
> In fact, such memory is never exposed via the firmware memmap as System
> RAM (e.g., e820), so exposing this memory via /sys/firmware/memmap/ is
> wrong:
>  "kexec needs the raw firmware-provided memory map to setup the
>   parameter segment of the kernel that should be booted with
>   kexec. Also, the raw memory map is useful for debugging. For
>   that reason, /sys/firmware/memmap is an interface that provides
>   the raw memory map to userspace." [1]
>
> We don't have to worry about firmware_map_remove() on the removal path.
> If there is no entry, it will simply return with -EINVAL.
>
> [1]
> https://www.kernel.org/doc/Documentation/ABI/testing/sysfs-firmware-memmap


You know what this justification is rubbish, and I have previously
explained why it is rubbish.

Nacked-by: "Eric W. Biederman" <ebiederm@xmission.com>

This needs to be based on weather the added memory is ultimately normal
ram or is something special.

At least when we are talking memory resources.  Keeping it out of the
firmware map that is fine.

If the hotplugged memory is the result of plugging a stick of ram
into the kernel and can and should used be like any other memory
it should be treated like any normal memory.

If the hotplugged memory is something special it should be treated as
something special.

Justifying behavior by documentation that does not consider memory
hotplug is bad thinking.








> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
> Cc: Wei Yang <richard.weiyang@gmail.com>
> Cc: Baoquan He <bhe@redhat.com>
> Cc: Eric Biederman <ebiederm@xmission.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  include/linux/memory_hotplug.h | 8 ++++++++
>  mm/memory_hotplug.c            | 3 ++-
>  2 files changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplug.h
> index 0151fb935c09..4ca418a731eb 100644
> --- a/include/linux/memory_hotplug.h
> +++ b/include/linux/memory_hotplug.h
> @@ -68,6 +68,14 @@ struct mhp_params {
>  	pgprot_t pgprot;
>  };
>  
> +/* Flags used for add_memory() and friends. */
> +
> +/*
> + * Don't create entries in /sys/firmware/memmap/. The memory is detected and
> + * added via a device driver, not via the initial (firmware) memmap.
> + */
> +#define MHP_NO_FIRMWARE_MEMMAP		1
> +
>  /*
>   * Zone resizing functions
>   *
> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> index c01be92693e3..e94ede9cad00 100644
> --- a/mm/memory_hotplug.c
> +++ b/mm/memory_hotplug.c
> @@ -1062,7 +1062,8 @@ int __ref add_memory_resource(int nid, struct resource *res,
>  	BUG_ON(ret);
>  
>  	/* create new memmap entry */
> -	firmware_map_add_hotplug(start, start + size, "System RAM");
> +	if (!(flags & MHP_NO_FIRMWARE_MEMMAP))
> +		firmware_map_add_hotplug(start, start + size, "System RAM");
>  
>  	/* device_online() will take the lock when calling online_pages() */
>  	mem_hotplug_done();
