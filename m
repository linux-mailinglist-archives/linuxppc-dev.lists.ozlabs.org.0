Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D747510F0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jul 2023 21:07:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HrKVprYS;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Zd9LPH0I;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R1S0T621cz3cBC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jul 2023 05:07:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HrKVprYS;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Zd9LPH0I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R1RzY2DVTz3bbW
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jul 2023 05:06:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689188772;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TH8kSVdw6te9fZYouICsYG10z251roU+ykSRmjAwUKo=;
	b=HrKVprYSFewBDyhCJHb7c+tDBrAN8ueEqJ3CabZ0z/O3VUhp8bHgzv8b7fwhcB0Kdz0Xkz
	Vhl3DInMXqNt7vhzzmv5Kk+HuP/8BMmcW6a2QfapMuCUJpNP8JUV/5w/9yJRqdm7a2Gt3f
	jvfDgzE3qAQA0LVcDcUaAtHrT+GadbM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689188773;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TH8kSVdw6te9fZYouICsYG10z251roU+ykSRmjAwUKo=;
	b=Zd9LPH0I0ovmIg9kn44OaRaudqz4sXUNA6IzMsBaaTqQsTAIMuNEzksIMqzSZFOoQ4vq2z
	ruXMP5nh6bwe+yhmWdzVJ4oJgdxVBY043BTNonmw+0XzaF2nw1AZMh8xCT/WnCi24z166B
	4vneULNvykR7auI/bkD4AO3XNdVdpKY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-KRflGqzGM5WRbIBOdhbYGw-1; Wed, 12 Jul 2023 15:06:11 -0400
X-MC-Unique: KRflGqzGM5WRbIBOdhbYGw-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-3fbe4cecd66so42692305e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jul 2023 12:06:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689188769; x=1691780769;
        h=content-transfer-encoding:in-reply-to:subject:organization:from
         :references:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TH8kSVdw6te9fZYouICsYG10z251roU+ykSRmjAwUKo=;
        b=UPoFDamvGGLBfujlm7Af5pY9Tl7nxRmiI4UqDjBKCbgFq4Gy2SZEW9YR+Fz4U3ALOj
         J23ja9gKfe5MacyAoXhCB8gkZFzS2inhaAtcofg4ScuNIp/k7wG7DTboXQaQHK9RfkWk
         w8Y6GRyF0cIuOs4UyGaWjXjJtZ0adb39/pXtBfMEjiCknYfnyPoqEo+9tJQN5ekZ5XTp
         /OvrhCSTA7grkiRLOusDxUpIDrCrI1m6OuGkdfRw1CidGBLsFfLIaRGAzTivac7hkWud
         spC08RFfMVuVXmh/aGA3y2Tb8HauxoERBjaHDjVyTUgmV+iGBXHWk3YDW91fcO+jVsBA
         syIA==
X-Gm-Message-State: ABy/qLaUs+8nfi9/5eEkVL7rttEBstcxuNESH7kxqNwlPcdFmLunA1Vo
	GvVLUeP+nHgR7aiSsb5BCAWTJrvhgQfWfW5APwyL7rqN+M+ovq5TtIpGycBJv9G+sGS8AVTTZvx
	DaJ59Qgz/sRx+VKC7vMEJXqJYeA==
X-Received: by 2002:a05:600c:3644:b0:3fc:627:ea31 with SMTP id y4-20020a05600c364400b003fc0627ea31mr13170857wmq.38.1689188769704;
        Wed, 12 Jul 2023 12:06:09 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEJAY+2GhS4XJclXcXEd8YQMKAMPvGWx2HjQXRKwdVt2URQdeCbd85XkzInZ39IOwfgHTAaNA==
X-Received: by 2002:a05:600c:3644:b0:3fc:627:ea31 with SMTP id y4-20020a05600c364400b003fc0627ea31mr13170839wmq.38.1689188769283;
        Wed, 12 Jul 2023 12:06:09 -0700 (PDT)
Received: from ?IPV6:2003:cb:c707:3700:3eea:ace6:5bde:4478? (p200300cbc70737003eeaace65bde4478.dip0.t-ipconnect.de. [2003:cb:c707:3700:3eea:ace6:5bde:4478])
        by smtp.gmail.com with ESMTPSA id q10-20020adfdfca000000b003144b95e1ecsm5745648wrn.93.2023.07.12.12.06.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jul 2023 12:06:08 -0700 (PDT)
Message-ID: <5b4dcee6-c72f-103a-dd7b-b829f5be948b@redhat.com>
Date: Wed, 12 Jul 2023 21:06:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, christophe.leroy@csgroup.eu
References: <20230711044834.72809-1-aneesh.kumar@linux.ibm.com>
 <20230711044834.72809-5-aneesh.kumar@linux.ibm.com>
 <b44ce7ab-7fcf-3f1b-4bca-3d5d12838812@redhat.com>
 <ccda3be5-1e44-145e-7b46-2e420935b1d6@linux.ibm.com>
 <57dd0568-ee56-ff8d-3ba3-a9089a2ab386@redhat.com>
 <87wmz56xyh.fsf@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v3 4/7] mm/hotplug: Allow pageblock alignment via altmap
 reservation
In-Reply-To: <87wmz56xyh.fsf@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Vishal Verma <vishal.l.verma@intel.com>, Michal Hocko <mhocko@suse.com>, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12.07.23 15:50, Aneesh Kumar K.V wrote:
> David Hildenbrand <david@redhat.com> writes:
> 
>> On 12.07.23 05:16, Aneesh Kumar K V wrote:
>>> On 7/11/23 10:49 PM, David Hildenbrand wrote:
>>>> On 11.07.23 06:48, Aneesh Kumar K.V wrote:
>>>>> Add a new kconfig option that can be selected if we want to allow
>>>>> pageblock alignment by reserving pages in the vmemmap altmap area.
>>>>> This implies we will be reserving some pages for every memoryblock
>>>>> This also allows the memmap on memory feature to be widely useful
>>>>> with different memory block size values.
>>>>
>>>> "reserving pages" is a nice way of saying "wasting memory". :) Let's spell that out.
>>>>
>>>> I think we have to find a better name for this, and I think we should have a toggle similar to memory_hotplug.memmap_on_memory. This should be an admin decision, not some kernel config option.
>>>>
>>>>
>>>> memory_hotplug.force_memmap_on_memory
>>>>
>>>> "Enable the memmap on memory feature even if it could result in memory waste due to memmap size limitations. For example, if the memmap for a memory block requires 1 MiB, but the pageblock size is 2 MiB, 1 MiB
>>>> of hotplugged memory will be wasted. Note that there are still cases where the feature cannot be enforced: for example, if the memmap is smaller than a single page, or if the architecture does not support the forced mode in all configurations."
>>>>
>>>> Thoughts?
>>>>
>>>
>>> With module parameter, do we still need the Kconfig option?
>>
>> No.
>>
>> Sleeping over this, maybe we can convert the existing
>> memory_hotplug.memmap_on_memory parameter to also accept "force".
>>
> 
> How about this?
> 
> modified   mm/memory_hotplug.c
> @@ -45,13 +45,67 @@
>   /*
>    * memory_hotplug.memmap_on_memory parameter
>    */
> -static bool memmap_on_memory __ro_after_init;
> -module_param(memmap_on_memory, bool, 0444);
> -MODULE_PARM_DESC(memmap_on_memory, "Enable memmap on memory for memory hotplug");
> +enum {
> +	MEMMAP_ON_MEMORY_DISABLE = 0,
> +	MEMMAP_ON_MEMORY_ENABLE,
> +	FORCE_MEMMAP_ON_MEMORY,

MEMMAP_ON_MEMORY_FORCE ?

> +};
> +static int memmap_mode __read_mostly = MEMMAP_ON_MEMORY_DISABLE;
> +static const char *memmap_on_memory_to_str[] = {
> +	[MEMMAP_ON_MEMORY_DISABLE]  = "disable",
> +	[MEMMAP_ON_MEMORY_ENABLE]   = "enable",
> +	[FORCE_MEMMAP_ON_MEMORY]    = "force",
> +};
> +
> +static inline unsigned long memory_block_align_base(unsigned long size)
> +{
> +	if (memmap_mode == FORCE_MEMMAP_ON_MEMORY) {
> +		unsigned long align;
> +		unsigned long nr_vmemmap_pages = size >> PAGE_SHIFT;
> +		unsigned long vmemmap_size;
> +
> +		vmemmap_size = DIV_ROUND_UP(nr_vmemmap_pages * sizeof(struct page), PAGE_SIZE);
> +		align = pageblock_align(vmemmap_size) - vmemmap_size;
> +		return align;
> +	} else
> +		return 0;

^ have to see that in action :)

> +}
> +
> +static int set_memmap_mode(const char *val, const struct kernel_param *kp)
> +{
> +	int ret = sysfs_match_string(memmap_on_memory_to_str, val);
> +

That would break existing cmdlines that eat Y/N/0/..., no?

Maybe try parsing "force/FORCE" first and then fallback to the common 
bool parsing (kstrtobool).

Same when printing: handle "force" separately and then just print Y/N 
like param_get_bool() used to do.

So you'd end up with Y/N/FORCE as output and Y/N/0/.../FORCE/force as input.

But I'm happy to hear about alternatives. Maybe a second parameter is 
better ... but what name should it have "memmap_on_memory_force" sounds 
wrong. We'd need a name that expresses that we might be wasting memory, 
hm ...

> +	if (ret < 0)
> +		return ret;
> +	*((int *)kp->arg) = ret;
> +	if (ret == FORCE_MEMMAP_ON_MEMORY) {
> +		pr_info("Memory hotplug will reserve %ld pages in each memory block\n",
> +			memory_block_align_base(memory_block_size_bytes()));
> +	}
> +	return 0;
> +}
> +
> +static int get_memmap_mode(char *buffer, const struct kernel_param *kp)
> +{
> +	return sprintf(buffer, "%s\n", memmap_on_memory_to_str[*((int *)kp->arg)]);
> +}
> +
> +static const struct kernel_param_ops memmap_mode_ops = {
> +	.set = set_memmap_mode,
> +	.get = get_memmap_mode,
> +};
> +module_param_cb(memmap_on_memory, &memmap_mode_ops, &memmap_mode, 0644);
> +MODULE_PARM_DESC(memmap_on_memory, "Enable memmap on memory for memory hotplug\n"
> +	"With value \"force\" it could result in memory waste due to memmap size limitations \n"
> +	"For example, if the memmap for a memory block requires 1 MiB, but the pageblock \n"
> +	"size is 2 MiB, 1 MiB of hotplugged memory will be wasted. Note that there are \n"
> +	"still cases where the feature cannot be enforced: for example, if the memmap is \n"
> +	"smaller than a single page, or if the architecture does not support the forced \n"
> +	"mode in all configurations. (disable/enable/force)");
>   
>   static inline bool mhp_memmap_on_memory(void)
>   {
> -	return memmap_on_memory;
> +	return !!memmap_mode;
>   }
>   #else
> 
> We can also enable runtime enable/disable/force the feature. We just
> need to make sure on try_remove_memory we lookup for altmap correctly.
> 

Yes, that's already been asked for. But let's do that as a separate 
change later.

-- 
Cheers,

David / dhildenb

