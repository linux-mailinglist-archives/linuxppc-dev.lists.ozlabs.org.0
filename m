Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D15D5A31F7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Aug 2022 00:20:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MDvRT1T48z3c1N
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Aug 2022 08:20:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UKv4nGyl;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UKv4nGyl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UKv4nGyl;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UKv4nGyl;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MDvQk4mKqz2xGy
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Aug 2022 08:19:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661552394;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q82AOj5mgWsqghXykEygItIBdPuSqpKfW9fkWnf7Xws=;
	b=UKv4nGylS0BVRe9BVetVNaGb5OusJT8n5XwcZoDmWU234V8Pg9P+wFCfBwtBRl04qaoJaQ
	skhEQ884Kgxcglik0yAgnPgJMzbKl/OZ+xTgszAu0csCHAXoSFj2G2+t5DcrNsRxcFmPXx
	h9XZ413e5O4rN5jR9NBi9624dnuSeUk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661552394;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q82AOj5mgWsqghXykEygItIBdPuSqpKfW9fkWnf7Xws=;
	b=UKv4nGylS0BVRe9BVetVNaGb5OusJT8n5XwcZoDmWU234V8Pg9P+wFCfBwtBRl04qaoJaQ
	skhEQ884Kgxcglik0yAgnPgJMzbKl/OZ+xTgszAu0csCHAXoSFj2G2+t5DcrNsRxcFmPXx
	h9XZ413e5O4rN5jR9NBi9624dnuSeUk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-619--g8J7LmOODuKydkVYoMc-g-1; Fri, 26 Aug 2022 18:19:53 -0400
X-MC-Unique: -g8J7LmOODuKydkVYoMc-g-1
Received: by mail-wr1-f69.google.com with SMTP id i4-20020adfaac4000000b00226d1d39229so53723wrc.18
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Aug 2022 15:19:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:organization:from
         :references:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc;
        bh=Q82AOj5mgWsqghXykEygItIBdPuSqpKfW9fkWnf7Xws=;
        b=2OH5GpF0+j98PYZ45Hwt9h5DQI65eDKTKk6so/7gVmwgUytkTXxdf7dNVOH47OB8bb
         DVKMmCBDEqhXz9YfwtO62uyjg9D8DP/TViB4zKb11EZcF7n4sxo2ZEe/WMNA7yMPKXbo
         GkxH854Owz9sonSp4zSRnr/hgqvtFeQKaBQ3CArOoK6wj+FcpXgcGn0drn7OI2J2Hn7N
         Brroa8hW6o4tuWBvM3dFibEafi7pXqbPCLv3VkvlVmDRF2/R4FwemU79FdGl9CskSip3
         JVFyf2W9trFphi3JV0MQvbQgRcUdeKAvKW48IMuVKjjylLR8I0cpQly9OlAYQslLbujX
         mtLA==
X-Gm-Message-State: ACgBeo0Yw4ZhYNTX+uMXdVVYGGGkG50FSiKFDaniFUhJPd+f+vCoGyC4
	x1xbAEgesPbw50rr7LpoyEhyKOByJ+uAlOtMCYzhEKJ1csTAZxT1vNJoacOXoSjiScwx1PF7RJ+
	qBahTAZBwza0tyF2IJ2oIQ9OrHg==
X-Received: by 2002:a5d:698e:0:b0:225:72d1:94c with SMTP id g14-20020a5d698e000000b0022572d1094cmr794603wru.381.1661552392049;
        Fri, 26 Aug 2022 15:19:52 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7uezQ+j0oPcMek2XYoB9iVNLxa90U2dcSyOQ9ZNnqcMKuPPCHXv0+i1qNpul+pt30Kva2P9A==
X-Received: by 2002:a5d:698e:0:b0:225:72d1:94c with SMTP id g14-20020a5d698e000000b0022572d1094cmr794585wru.381.1661552391790;
        Fri, 26 Aug 2022 15:19:51 -0700 (PDT)
Received: from ?IPV6:2003:cb:c70c:d200:fbf4:8c3c:56fa:173d? (p200300cbc70cd200fbf48c3c56fa173d.dip0.t-ipconnect.de. [2003:cb:c70c:d200:fbf4:8c3c:56fa:173d])
        by smtp.gmail.com with ESMTPSA id j2-20020a056000124200b0022537d826f3sm824156wrx.23.2022.08.26.15.19.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Aug 2022 15:19:51 -0700 (PDT)
Message-ID: <a64b2131-5a78-c89d-9e88-b78aee0074b9@redhat.com>
Date: Sat, 27 Aug 2022 00:19:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
To: Peter Xu <peterx@redhat.com>
References: <3b01af093515ce2960ac39bb16ff77473150d179.1661309831.git-series.apopple@nvidia.com>
 <ffbc824af5daa2c44b91c66834a341894fba4ce6.1661309831.git-series.apopple@nvidia.com>
 <YwZGHyYJiJ+CGLn2@xz-m1.local> <8735dkeyyg.fsf@nvdebian.thelocal>
 <YwgFRLn43+U/hxwt@xz-m1.local> <8735dj7qwb.fsf@nvdebian.thelocal>
 <YwjZamk4n/dz+Y/M@xz-m1.local>
 <72146725-3d70-0427-50d4-165283a5a85d@redhat.com>
 <Ywjs/i4kIVlxZwpb@xz-m1.local>
 <140e7688-b66d-2f6d-fed8-e39da5045420@redhat.com>
 <Ywk9CKIJMX3z6WIq@xz-m1.local>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v3 2/3] mm/migrate_device.c: Copy pte dirty bit to page
In-Reply-To: <Ywk9CKIJMX3z6WIq@xz-m1.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: "Sierra Guiza, Alejandro \(Alex\)" <alex.sierra@amd.com>, Huang Ying <ying.huang@intel.com>, Ralph Campbell <rcampbell@nvidia.com>, linuxppc-dev@lists.ozlabs.org, Lyude Paul <lyude@redhat.com>, Karol Herbst <kherbst@redhat.com>, Nadav Amit <nadav.amit@gmail.com>, Felix Kuehling <Felix.Kuehling@amd.com>, Alistair Popple <apopple@nvidia.com>, LKML <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, Logan Gunthorpe <logang@deltatee.com>, Ben Skeggs <bskeggs@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, stable@vger.kernel.org, akpm@linux-foundation.org, huang ying <huang.ying.caritas@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 26.08.22 23:37, Peter Xu wrote:
> On Fri, Aug 26, 2022 at 06:46:02PM +0200, David Hildenbrand wrote:
>> On 26.08.22 17:55, Peter Xu wrote:
>>> On Fri, Aug 26, 2022 at 04:47:22PM +0200, David Hildenbrand wrote:
>>>>> To me anon exclusive only shows this mm exclusively owns this page. I
>>>>> didn't quickly figure out why that requires different handling on tlb
>>>>> flushs.  Did I perhaps miss something?
>>>>
>>>> GUP-fast is the magic bit, we have to make sure that we won't see new
>>>> GUP pins, thus the TLB flush.
>>>>
>>>> include/linux/mm.h:gup_must_unshare() contains documentation.
>>>
>>> Hmm.. Shouldn't ptep_get_and_clear() (e.g., xchg() on x86_64) already
>>> guarantees that no other process/thread will see this pte anymore
>>> afterwards?
>>
>> You could have a GUP-fast thread that just looked up the PTE and is
>> going to pin the page afterwards, after the ptep_get_and_clear()
>> returned. You'll have to wait until that thread finished.
> 

Good that we're talking about it, very helpful! If that's actually not
required -- good.


What I learned how GUP-fast and TLB flushes interact is the following:

GUP-fast disables local interrupts. A TLB flush will send an IPI and
wait until it has been processed. This implies, that once the TLB flush
succeeded, that the interrupt was handled and GUP-fast cannot be running
anymore.

BUT, there is the new RCU variant nowadays, and the TLB flush itself
should not actually perform such a sync. They merely protect the page
tables from getting freed and the THP from getting split IIUC. And
you're correct that that wouldn't help.


> IIUC the early tlb flush won't protect concurrent fast-gup from happening,
> but I think it's safe because fast-gup will check pte after pinning, so
> either:
> 
>   (1) fast-gup runs before ptep_get_and_clear(), then
>       page_try_share_anon_rmap() will fail properly, or,
> 
>   (2) fast-gup runs during or after ptep_get_and_clear(), then fast-gup
>       will see that either the pte is none or changed, then it'll fail the
>       fast-gup itself.

I think you're right and I might have managed to confuse myself with the
write_protect_page() comment. I placed the gup_must_unshare() check
explicitly after the "pte changed" check for this reason. So once the
PTE was cleared, GUP-fast would undo any pin performed on a now-stale PTE.

> 
>>
>> Another user that relies on this interaction between GUP-fast and TLB
>> flushing is for example mm/ksm.c:write_protect_page()
>>
>> There is a comment in there explaining the interaction a bit more detailed.
>>
>> Maybe we'll be able to handle this differently in the future (maybe once
>> this turns out to be an actual performance problem). Unfortunately,
>> mm->write_protect_seq isn't easily usable because we'd need have to make
>> sure we're the exclusive writer.
>>
>>
>> For now, it's not too complicated. For PTEs:
>> * try_to_migrate_one() already uses ptep_clear_flush().
>> * try_to_unmap_one() already conditionally used ptep_clear_flush().
>> * migrate_vma_collect_pmd() was the one case that didn't use it already
>>  (and I wonder why it's different than try_to_migrate_one()).
> 
> I'm not sure whether I fully get the point, but here one major difference
> is all the rest handles one page, so a tlb flush alongside with the pte
> clear sounds reasonable.  Even if so try_to_unmap_one() was modified to use
> tlb batching, but then I see that anon exclusive made that batching
> conditional.  I also have question there on whether we can keep using the
> tlb batching even with anon exclusive pages there.
> 
> In general, I still don't see how stall tlb could affect anon exclusive
> pages on racing with fast-gup, because the only side effect of a stall tlb
> is unwanted page update iiuc, the problem is fast-gup doesn't even use tlb,
> afaict..

I have the gut feeling that the comment in write_protect_page() is
indeed stale, and that clearing PageAnonExclusive doesn't strictly need
the TLB flush.

I'll try to refresh my memory if there was any other case that I had to
handle over the weekend.

Thanks!

-- 
Thanks,

David / dhildenb

