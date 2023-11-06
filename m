Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE3F7E1CEE
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Nov 2023 10:07:03 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Mp5bH6h2;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AkD+XkfF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SP5850CSwz3cQM
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Nov 2023 20:07:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Mp5bH6h2;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AkD+XkfF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SP5784NKDz3bT8
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Nov 2023 20:06:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699261568;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=BYBy2dNMIY24Mhy3u9xmGG7Mw1UOwwSG11VPZiqW4uI=;
	b=Mp5bH6h2MYEoxrM+EEl8PvRryuG7FceibDAa2Y1mDMwaGNYhyAsfYyJX1F/BfoPoeW0/w3
	APKArQkIN2z8wpgEa+5Hwnr6mgijaKM6RbWoqDRPBtVdIi617HTNX+XzMxOOJTUK+2ht2c
	H0rke9+kIgG/Bbu8KfW9epUZuqPS/CQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699261569;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=BYBy2dNMIY24Mhy3u9xmGG7Mw1UOwwSG11VPZiqW4uI=;
	b=AkD+XkfFSya8yxUxOr/VFozq/53qu0+ukDr34e/5K+m3yTg1X/zUCUHhVp7jWLm2Bppnk2
	bgrF8Grvb5mNcChUpKSPhL21Vgu1vFLv4dqL6QRydiUFffsYMfDgV+jXjcmLiAWGtWwcZW
	oIYs5fXCs09C8jf9bvz4e5DItDlmRh0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-589-s0W3DOlYNtCijGNWhCzKbA-1; Mon, 06 Nov 2023 04:06:07 -0500
X-MC-Unique: s0W3DOlYNtCijGNWhCzKbA-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-32dee12c5b4so2298730f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Nov 2023 01:06:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699261566; x=1699866366;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BYBy2dNMIY24Mhy3u9xmGG7Mw1UOwwSG11VPZiqW4uI=;
        b=Fvc83C6TAKwMZviydYUADR8s8taIlrAB1U04SbpCALkoGt/juUgeSHgJB7v6WHQmRc
         a4jFinZ0JtavEvFBoFs0wypt0Q+cnSkYmJI3sN5EBAyo+PllLScBUQODh1e4P9BWgFi1
         O8Q+LOuILbyw+3aRERLu29z3Tje4ocAysJYRx3uWvZEMxVn1pJ95ND6Q2l4berVLQo+D
         lr3Lao0+UtEq/aZHpwUkIQxOGA43fiU5Yo+SJJnHvMxFG3IHAW/hsH40PjcUmuna/wXY
         gZmCdyxZLA+Dm50IKDVwWj1E3ndwnBBxuqjra3hF6RTZ5ILOvmsmb/go93t4MRFy2cw+
         EUgw==
X-Gm-Message-State: AOJu0YxRNOGFTmJsMuqD94rpmueJK9jEN/OU3LFXRYB9IbOFuP0MAPkO
	6EyuFt2bYgTS3Fnt0GnLxqJ/4Sz9nYRiExvEERu8a0P/3yL1hcNYGt+cPvymO8oGR3iRwphZT2K
	uWWXp68miLpIvJ977Yr3PHEh9Jg==
X-Received: by 2002:adf:d1ef:0:b0:32f:7db1:22fb with SMTP id g15-20020adfd1ef000000b0032f7db122fbmr20855284wrd.28.1699261565917;
        Mon, 06 Nov 2023 01:06:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHA42wJ56gmu5mh37nBffHnBUHylTAE96Top/AGloCfZiYJqwhNEp91gKpy2mZWZgvDqRsgjg==
X-Received: by 2002:adf:d1ef:0:b0:32f:7db1:22fb with SMTP id g15-20020adfd1ef000000b0032f7db122fbmr20855255wrd.28.1699261565420;
        Mon, 06 Nov 2023 01:06:05 -0800 (PST)
Received: from ?IPV6:2003:cb:c723:8300:17ef:a8f2:1ed1:81e6? (p200300cbc723830017efa8f21ed181e6.dip0.t-ipconnect.de. [2003:cb:c723:8300:17ef:a8f2:1ed1:81e6])
        by smtp.gmail.com with ESMTPSA id r7-20020adff107000000b0032db8f7f378sm8929587wro.71.2023.11.06.01.06.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Nov 2023 01:06:05 -0800 (PST)
Message-ID: <71d7ba18-8784-4b1c-9797-6fee088fa684@redhat.com>
Date: Mon, 6 Nov 2023 10:06:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: mm/debug_vm_pgtable.c:860 warning triggered
To: Michael Ellerman <mpe@ellerman.id.au>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 "Daniel Walker (danielwa)" <danielwa@cisco.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>
References: <ZUV+W9bwUBjahL15@goliath>
 <dc5a1072-0c2b-4f49-8a5f-de3dcfb8c06e@arm.com> <87sf5jqutl.fsf@mail.lhotse>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <87sf5jqutl.fsf@mail.lhotse>
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
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>, "David Beazley \(dbeazley\)" <dbeazley@cisco.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "xe-linux-external\(mailer list\)" <xe-linux-external@cisco.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 06.11.23 07:06, Michael Ellerman wrote:
> Anshuman Khandual <anshuman.khandual@arm.com> writes:
>> Hello Daniel,
>>
>> This test just ensures that PFN is preserved during pte <--> swap pte transformations
>> , and the warning here seems to have been caused by powerpc platform specific helpers
>> and/or its pte_t representation. Adding powerpc folks and platform mailing list here.
> 

32bit swp_entry_t with 64bit pte is supported by making sure that we 
never store a swap offset larger than what we can actually fit into the 
swp_entry_t.

There is common code in place to handle that: see 
generic_max_swapfile_size(), which does to conversion back and forth to 
see how many bits of the offset actually survive the conversion.

> Doesn't the test need a similar treatment to:
> 
>    2321ba3e3733 ("mm/debug_vm_pgtable: more pte_swp_exclusive() sanity checks")
> 
> Which said:
>      Especially, the pfn_pte() is dodgy when the swap PTE layout differs
>      heavily from ordinary PTEs.  Let's properly construct a swap PTE from swap
>      type+offset.


Sounds reasonable to me.

-- 
Cheers,

David / dhildenb

