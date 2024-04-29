Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 929FD8B59DD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2024 15:27:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CYcigg9u;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PV0Smxnz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VSkdZ1Z10z3clL
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2024 23:27:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CYcigg9u;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PV0Smxnz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VSkcr4gJrz3cWv
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2024 23:26:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714397192;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=0gIVyldPn8MVMDBzhE2sqz8u4+WJFxHqSQpWy/KuHHE=;
	b=CYcigg9uMYRh1tc3mNGO4Fk9fWCmMIAfbOWq8BeOtFNATPaW2V0foY1quHyNb4ULSridG/
	nBfiumMi1ySdtM9/eAlMGIUxMNDGKE7Z0BpSDtI70nnZKBjdIJnmezUVkFzUsnisdFZ4Xz
	Gcj3QqK1Q4S8JUVWl5jkD1YQeTsxoNU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714397193;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=0gIVyldPn8MVMDBzhE2sqz8u4+WJFxHqSQpWy/KuHHE=;
	b=PV0Smxnz/+nCXKiowe2mtoTvw4bF4wG6AJBlvmCgbl/Ck7s/lkfidotWxpWIqEWhwd7IOX
	HTnxze2/5NdaKoyQM2vFNmoHlYVJ6bO1t+mwaECU8WW+Ztc1FSoKtqIMtydlAQy+7TU5QQ
	wmate6K26fld+eDkmm4Nclp+pk8IAn0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-9y1SW5GiMDizSRxxVx4Igg-1; Mon, 29 Apr 2024 09:26:30 -0400
X-MC-Unique: 9y1SW5GiMDizSRxxVx4Igg-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-34c99c419e7so1482243f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2024 06:26:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714397189; x=1715001989;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0gIVyldPn8MVMDBzhE2sqz8u4+WJFxHqSQpWy/KuHHE=;
        b=CFNizx6d95S6HNSSL7ERh4juCRxG517ZI7FOMRfEsqsCT/DSxPbsJx6F39EMKRbGqv
         mTel5v58MqkfO0bGKYgnyD9di63BaphUOPNQPbx5+qE2/E4iV7I9NqtbEz3QzBRZYTHY
         9ysC6fi4iNOsq69bvh5IHLfpEJVc7ws8DGscNePHQ1AmX50+HnIe3hPFqhaZIl1e+S2y
         nSrx8WSVPJzOkOFkVGUVUc75xFe48n56HFllavLv6JYQqhlDw185wPAWg0F7moTXLgxX
         d3Pi/BDSARpdHtAf5/vS2AGLJv/tHkWK7tWcMEeSt7kb5PBF8ZAff8jnC94Tn5Y2I6mi
         jJiw==
X-Forwarded-Encrypted: i=1; AJvYcCVnwAPl4Sc33rPLqS/cckOtpPZzx2bRpLVWyJr8R2roV7LAM1JDQgVDCs6G7cnb0zRiqmv4noTjRXz1V55j2Hm0kec/aGjaExsWdRYTTQ==
X-Gm-Message-State: AOJu0Yx8QlsXmDLCwoCR5vVD3StMfflpDMPGIbYg8Or6+klBn4p4qp+C
	h+JtIifZrQLL4Fg4Nk0Oy0bHJACyMgjcxGSC3Ahsn8H2CjX2BMqXjf4O9lKcKPU8MuJjYKvZGpU
	W50+nqsOsRcYkGhFKEPOqeYqGeQGUyGxyNxXZL3FptluqeI65xXOR3tXaswPOeIU=
X-Received: by 2002:a05:6000:188e:b0:34d:369a:5add with SMTP id a14-20020a056000188e00b0034d369a5addmr1970148wri.71.1714397189666;
        Mon, 29 Apr 2024 06:26:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESuiY9F954N8SgtSKuJC3MJc+u2CViHo/nOi7RhMaMpgfxvryLr5BXg2wW4QVMuvXo2CcbPQ==
X-Received: by 2002:a05:6000:188e:b0:34d:369a:5add with SMTP id a14-20020a056000188e00b0034d369a5addmr1970123wri.71.1714397189178;
        Mon, 29 Apr 2024 06:26:29 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f26:e700:f1c5:285b:72a5:d8c8? (p200300d82f26e700f1c5285b72a5d8c8.dip0.t-ipconnect.de. [2003:d8:2f26:e700:f1c5:285b:72a5:d8c8])
        by smtp.gmail.com with ESMTPSA id a16-20020adffb90000000b0034af18ef68csm21643897wrr.5.2024.04.29.06.26.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Apr 2024 06:26:28 -0700 (PDT)
Message-ID: <2338119d-060b-4127-9199-5ff39fd62fc4@redhat.com>
Date: Mon, 29 Apr 2024 15:26:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] mm/selftests: Don't prefault in gup_longterm tests
To: Peter Xu <peterx@redhat.com>
References: <20240428190151.201002-1-peterx@redhat.com>
 <20240428190151.201002-3-peterx@redhat.com>
 <4171dbb6-81c0-4553-a405-a55f75be4cb7@redhat.com> <Zi-cONgqV4_kUIE4@x1n>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <Zi-cONgqV4_kUIE4@x1n>
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
Cc: Lorenzo Stoakes <lstoakes@gmail.com>, John Hubbard <jhubbard@nvidia.com>, Muchun Song <muchun.song@linux.dev>, linux-kernel@vger.kernel.org, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, linux-mm@kvack.org, Jason Gunthorpe <jgg@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 29.04.24 15:10, Peter Xu wrote:
> On Mon, Apr 29, 2024 at 09:28:15AM +0200, David Hildenbrand wrote:
>> On 28.04.24 21:01, Peter Xu wrote:
>>> Prefault, especially with RW, makes the GUP test too easy, and may not yet
>>> reach the core of the test.
>>>
>>> For example, R/O longterm pins will just hit, pte_write()==true for
>>> whatever cases, the unsharing logic won't be ever tested.
>>>
>>> This patch remove the prefault.  This tortures more code paths at least to
>>> cover the unshare care for R/O longterm pins, in which case the first R/O
>>> GUP attempt will fault in the page R/O first, then the 2nd will go through
>>> the unshare path, checking whether an unshare is needed.
>>>
>>> Cc: David Hildenbrand <david@redhat.com>
>>> Signed-off-by: Peter Xu <peterx@redhat.com>
>>> ---
>>>    tools/testing/selftests/mm/gup_longterm.c | 12 +++++++++---
>>>    1 file changed, 9 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/tools/testing/selftests/mm/gup_longterm.c b/tools/testing/selftests/mm/gup_longterm.c
>>> index ad168d35b23b..488e32186246 100644
>>> --- a/tools/testing/selftests/mm/gup_longterm.c
>>> +++ b/tools/testing/selftests/mm/gup_longterm.c
>>> @@ -119,10 +119,16 @@ static void do_test(int fd, size_t size, enum test_type type, bool shared)
>>>    	}
>>>    	/*
>>> -	 * Fault in the page writable such that GUP-fast can eventually pin
>>> -	 * it immediately.
>>> +	 * Explicitly avoid pre-faulting in the page, this can help testing
>>> +	 * more code paths.
>>> +	 *
>>> +	 * Take example of an upcoming R/O pin test, if we RW prefault the
>>> +	 * page, such pin will directly skip R/O unsharing and the longterm
>>> +	 * pin will success mostly always.  When not prefaulted, R/O
>>> +	 * longterm pin will first fault in a RO page, then the 2nd round
>>> +	 * it'll go via the unshare check.  Otherwise those paths aren't
>>> +	 * covered.
>>>    	 */
>> This will mean that GUP-fast never succeeds, which removes quite some testing
>> coverage for most other tests here.
>>
>> Note that the main motivation of this test was to test gup_fast_folio_allowed(),
>> where we had issues with GUP-fast during development.
> 
> Ah I didn't notice that, as I thought that whitelists memfd ones.
> 
>>
>> Would the following also get the job done?
>>
>> diff --git a/tools/testing/selftests/mm/gup_longterm.c b/tools/testing/selftests/mm/gup_longterm.c
>> index ad168d35b23b7..e917a7c58d571 100644
>> --- a/tools/testing/selftests/mm/gup_longterm.c
>> +++ b/tools/testing/selftests/mm/gup_longterm.c
>> @@ -92,7 +92,7 @@ static void do_test(int fd, size_t size, enum test_type type, bool shared)
>>   {
>>   	__fsword_t fs_type = get_fs_type(fd);
>>   	bool should_work;
>> -	char *mem;
>> +	char tmp, *mem;
>>   	int ret;
>>   	if (ftruncate(fd, size)) {
>> @@ -119,10 +119,19 @@ static void do_test(int fd, size_t size, enum test_type type, bool shared)
>>   	}
>>   	/*
>> -	 * Fault in the page writable such that GUP-fast can eventually pin
>> -	 * it immediately.
>> +	 * Fault in the page such that GUP-fast might be able to pin it
>> +	 * immediately. To cover more cases, don't fault in pages writable when
>> +	 * R/O pinning.
>>   	 */
>> -	memset(mem, 0, size);
>> +	switch (type) {
>> +	case TEST_TYPE_RO:
>> +	case TEST_TYPE_RO_FAST:
>> +		tmp = *mem;
>> +		asm volatile("" : "+r" (tmp));
>> +		break;
>> +	default:
>> +		memset(mem, 0, size);
>> +	};
>>   	switch (type) {
>>   	case TEST_TYPE_RO:
> 
> Yes this could work too.
> 
> The test patch here doesn't need to rush. David, how about you prepare a
> better and verified patch and post it separately, making sure to cover all
> the things we used to cover plus the unshare?  IIUC it used to be not
> touched because of pte_write() always returns true with a write prefault.
> 
> Then we let patch 1 go through first, and drop this one?

Whatever you prefer!

-- 
Cheers,

David / dhildenb

