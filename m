Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F3F3106B7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Feb 2021 09:32:55 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DX7w32dYszDvZK
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Feb 2021 19:32:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=FcOUTK/C; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=FcOUTK/C; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DX7rm2cbxzDvZM
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Feb 2021 19:29:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612513787;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DWOcO3uoOpH4F+jDhXKK3Onym76g8W4DkUdj3mzQVbM=;
 b=FcOUTK/C6UWl9iWePHxd1yHDGysVVjI7UK7GOawN5xarf+/pC4T37Z4vXt1v/x3Ld3P6HC
 NUf1nKek8fbV+uPPW+zvxxQ9LY2BrMTzedFTaWf3kD/RjZkhD91KkiPyvOgBBxGYX5ZGNX
 Vr2ftB0B4mWV62FVmcP+aN87/zmSw5M=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612513787;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DWOcO3uoOpH4F+jDhXKK3Onym76g8W4DkUdj3mzQVbM=;
 b=FcOUTK/C6UWl9iWePHxd1yHDGysVVjI7UK7GOawN5xarf+/pC4T37Z4vXt1v/x3Ld3P6HC
 NUf1nKek8fbV+uPPW+zvxxQ9LY2BrMTzedFTaWf3kD/RjZkhD91KkiPyvOgBBxGYX5ZGNX
 Vr2ftB0B4mWV62FVmcP+aN87/zmSw5M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-MPNj4J5VPEik1K3UV8z0fA-1; Fri, 05 Feb 2021 03:29:44 -0500
X-MC-Unique: MPNj4J5VPEik1K3UV8z0fA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 56BE8803F47;
 Fri,  5 Feb 2021 08:29:43 +0000 (UTC)
Received: from [10.36.113.156] (ovpn-113-156.ams2.redhat.com [10.36.113.156])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A99B85D9D7;
 Fri,  5 Feb 2021 08:29:41 +0000 (UTC)
Subject: Re: [PATCH] mm/pmem: Avoid inserting hugepage PTE entry with fsdax if
 hugepage support is disabled
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linux-nvdimm@lists.01.org, dan.j.williams@intel.com,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Jan Kara <jack@suse.cz>
References: <20210205023956.417587-1-aneesh.kumar@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <ee1bfaf9-88a3-1d3f-0af9-36cc75f957bb@redhat.com>
Date: Fri, 5 Feb 2021 09:29:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210205023956.417587-1-aneesh.kumar@linux.ibm.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 05.02.21 03:39, Aneesh Kumar K.V wrote:
> Differentiate between hardware not supporting hugepages and user disabling THP
> via 'echo never > /sys/kernel/mm/transparent_hugepage/enabled'
> 
> For the devdax namespace, the kernel handles the above via the
> supported_alignment attribute and failing to initialize the namespace
> if the namespace align value is not supported on the platform.
> 
> For the fsdax namespace, the kernel will continue to initialize
> the namespace. This can result in the kernel creating a huge pte
> entry even though the hardware don't support the same.
> 
> We do want hugepage support with pmem even if the end-user disabled THP
> via sysfs file (/sys/kernel/mm/transparent_hugepage/enabled). Hence
> differentiate between hardware/firmware lacking support vs user-controlled
> disable of THP and prevent a huge fault if the hardware lacks hugepage
> support.
> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>   include/linux/huge_mm.h | 15 +++++++++------
>   mm/huge_memory.c        |  6 +++++-
>   2 files changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
> index 6a19f35f836b..ba973efcd369 100644
> --- a/include/linux/huge_mm.h
> +++ b/include/linux/huge_mm.h
> @@ -78,6 +78,7 @@ static inline vm_fault_t vmf_insert_pfn_pud(struct vm_fault *vmf, pfn_t pfn,
>   }
>   
>   enum transparent_hugepage_flag {
> +	TRANSPARENT_HUGEPAGE_NEVER_DAX,
>   	TRANSPARENT_HUGEPAGE_FLAG,
>   	TRANSPARENT_HUGEPAGE_REQ_MADV_FLAG,
>   	TRANSPARENT_HUGEPAGE_DEFRAG_DIRECT_FLAG,
> @@ -123,6 +124,13 @@ extern unsigned long transparent_hugepage_flags;
>    */
>   static inline bool __transparent_hugepage_enabled(struct vm_area_struct *vma)
>   {
> +
> +	/*
> +	 * If the hardware/firmware marked hugepage support disabled.
> +	 */
> +	if (transparent_hugepage_flags & (1 << TRANSPARENT_HUGEPAGE_NEVER_DAX))
> +		return false;
> +
>   	if (vma->vm_flags & VM_NOHUGEPAGE)
>   		return false;
>   
> @@ -134,12 +142,7 @@ static inline bool __transparent_hugepage_enabled(struct vm_area_struct *vma)
>   
>   	if (transparent_hugepage_flags & (1 << TRANSPARENT_HUGEPAGE_FLAG))
>   		return true;
> -	/*
> -	 * For dax vmas, try to always use hugepage mappings. If the kernel does
> -	 * not support hugepages, fsdax mappings will fallback to PAGE_SIZE
> -	 * mappings, and device-dax namespaces, that try to guarantee a given
> -	 * mapping size, will fail to enable
> -	 */
> +
>   	if (vma_is_dax(vma))
>   		return true;
>   
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 9237976abe72..d698b7e27447 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -386,7 +386,11 @@ static int __init hugepage_init(void)
>   	struct kobject *hugepage_kobj;
>   
>   	if (!has_transparent_hugepage()) {
> -		transparent_hugepage_flags = 0;
> +		/*
> +		 * Hardware doesn't support hugepages, hence disable
> +		 * DAX PMD support.
> +		 */
> +		transparent_hugepage_flags = 1 << TRANSPARENT_HUGEPAGE_NEVER_DAX;
>   		return -EINVAL;
>   	}
>   
> 

Looks sane to me from my limited understanding of that code :)

-- 
Thanks,

David / dhildenb

