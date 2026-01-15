Return-Path: <linuxppc-dev+bounces-15818-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8A2D24221
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jan 2026 12:22:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dsLDc31vwz309N;
	Thu, 15 Jan 2026 22:22:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768476144;
	cv=none; b=SWnfEMcSeeUIYVxjdF7cvqQeHdNTHC2zBUo0+ebQEubD0UKq29nzb5EX4AL3Xi0VvIwLF6/uL6IGzGx+i1WliF7pn83S177xkC7njiQSQ5BNkk6LCPeTdGsMeZUkZ5n2aihTAo6qPnoHtmFnjfS1nqJgjIlJvSaudsY7UqarzfVqAxWn84CvEzu0IZquH81w7JlnGDIDfsooM7K+mOiaxsR1MMYapBfRxf35fF8VrT4LYqbyl9+xHhsTwUOQTWx77uL8VujQhaQ9AbuORpz16ZRxmaDXkae6reHY0Pw436ldmfl7CEjIT94SzDQiRpO95lNQlhEuWXsNqZ3UwN/+4w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768476144; c=relaxed/relaxed;
	bh=/uqqd9quCH0/nnsuDeC5Y/PVONnzka3eh3yRgCaY2BU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SaJUsxFkoT7gLV7SA+yNyEwQzn9j6KkHWsqOZF0gyE3VuPShDnzGtMp0XJXQLG1+Ml9WAQKBRJfSW8uvPliM32DAi9rACKP687/foVmqiMDpj+HfG24xnWb7NyeL2ycOWNuxiSJEmX+Kbb+pyBXC6Ay9NsYtDe+ImY9eAREwVP82QInpQkyIFTEoNEQ1+cjrITLtfqrg5vHb9P+zFikhPwYyaLEUh4gVSOR0nfD3j7cnWqP8e6rrZS4zuL8KM/qrcK6UBFjro1LGb/03fEk/nkytjGq3lkP4BF9eNy2XqzEdj+T5FX6VpFTsrKOAfPJ46BDg3UudIDJGGG3WYL2PyQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Eq345J4z; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Eq345J4z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dsLDb4gyzz2xJ6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 22:22:23 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A14F84096C;
	Thu, 15 Jan 2026 11:22:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C68ABC116D0;
	Thu, 15 Jan 2026 11:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768476141;
	bh=I44va9OEt4jVcZBfMvPSjlSIjgMNsGiYT577FTZiAaA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Eq345J4zXsoXEojnzBTa/BT5NqCJGPr15PKbHZLjJ49rvtJ3huiO/X14J5xcjPKK5
	 cVEVw2wQOaTcdC1B7RDfC7bHplcGjapCXtOak1TZCa5uqKikCa/dX6Htp1bE1pQYVM
	 4g/tFNPRzX6RbccC7WJZuP5sUTRNgCZKrzmgAxAdoUNK+Sr5c6j/BB3e41JrWKLU82
	 sxwQ/JE05o1SBN/kAVcTTHDvY7hGlX3/BvvL/Uo9DCC5prIIhkxRDASVmdIi8zwoQ5
	 fXBiiPtW0+ir4Ojxde9w1lykaFQxWYx3njJirBoX8schsoUIBgEcSTOQ/fVkKbyytX
	 IICNptCv/8+IQ==
Message-ID: <21ba2222-0b68-4295-b046-77910488fc0e@kernel.org>
Date: Thu, 15 Jan 2026 12:22:12 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 23/23] MAINTAINERS: move memory balloon infrastructure
 to "MEMORY MANAGEMENT - BALLOON"
To: Lance Yang <lance.yang@linux.dev>
Cc: Liam.Howlett@oracle.com, akpm@linux-foundation.org, arnd@arndb.de,
 bcm-kernel-feedback-list@broadcom.com, christophe.leroy@csgroup.eu,
 corbet@lwn.net, eperezma@redhat.com, gregkh@linuxfoundation.org,
 jasowang@redhat.com, jerrin.shaji-george@broadcom.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, lorenzo.stoakes@oracle.com,
 maddy@linux.ibm.com, mhocko@suse.com, mpe@ellerman.id.au, mst@redhat.com,
 npiggin@gmail.com, osalvador@suse.de, rppt@kernel.org, surenb@google.com,
 vbabka@suse.cz, virtualization@lists.linux.dev, xuanzhuo@linux.alibaba.com,
 ziy@nvidia.com
References: <20260115092015.3928975-24-david@kernel.org>
 <20260115093827.12557-1-lance.yang@linux.dev>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
In-Reply-To: <20260115093827.12557-1-lance.yang@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 1/15/26 10:38, Lance Yang wrote:
> 
> On Thu, 15 Jan 2026 10:20:13 +0100, David Hildenbrand (Red Hat) wrote:
>> Nowadays, there is nothing virtio-balloon specific anymore about these
>> files, the basic infrastructure is used by multiple memory balloon
>> drivers.
>>
>> For now we'll route it through Andrew's tree, maybe in some future it
>> makes sense to route this through a separate tree.
>>
>> Signed-off-by: David Hildenbrand (Red Hat) <david@kernel.org>
>> ---
>>   MAINTAINERS | 12 ++++++++++--
>>   1 file changed, 10 insertions(+), 2 deletions(-)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index de8f89ca1149f..b974f8c1c2225 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -16454,6 +16454,16 @@ T:	quilt git://git.kernel.org/pub/scm/linux/kernel/git/akpm/25-new
>>   F:	mm/
>>   F:	tools/mm/
>>   
>> +MEMORY MANAGEMENT - BALLOON
>> +M:	Andrew Morton <akpm@linux-foundation.org>
>> +M:	David Hildenbrand <david@redhat.com>
> 
> Should it be david@kernel.org instead?

Yes, the patch is apparently a bit older :)
-- 
Cheers

David

