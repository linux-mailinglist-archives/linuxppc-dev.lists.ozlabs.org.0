Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD577851609
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Feb 2024 14:55:21 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=P55xZ7+M;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=P55xZ7+M;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TYQvW5jkBz3dVR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 00:55:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=P55xZ7+M;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=P55xZ7+M;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TYQtk19trz3c1g
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Feb 2024 00:54:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707746074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=YP7Y72pR3TzaVeTLoSMRU6+Mwmpub8nSmmmtqDdNsGw=;
	b=P55xZ7+MkooaprmUV4wjnR7l9rBSAG0LatJX0wD1oxn6XEUsr4WoZfh+IZ2GzREa3kQKPR
	O1tfc9HWqme22Mwpbw8IedtVEFJn7aawbsEZjTvaC64lnXz/JFQwmxSbWJD7TisCuXIxJi
	XJpWlUdENxMJggKM/azlXCMbT38ZiCI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707746074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=YP7Y72pR3TzaVeTLoSMRU6+Mwmpub8nSmmmtqDdNsGw=;
	b=P55xZ7+MkooaprmUV4wjnR7l9rBSAG0LatJX0wD1oxn6XEUsr4WoZfh+IZ2GzREa3kQKPR
	O1tfc9HWqme22Mwpbw8IedtVEFJn7aawbsEZjTvaC64lnXz/JFQwmxSbWJD7TisCuXIxJi
	XJpWlUdENxMJggKM/azlXCMbT38ZiCI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-340-IrsiipZUMiqTBA5aJxw5Xg-1; Mon, 12 Feb 2024 08:54:32 -0500
X-MC-Unique: IrsiipZUMiqTBA5aJxw5Xg-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-40e435a606aso21162215e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Feb 2024 05:54:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707746070; x=1708350870;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YP7Y72pR3TzaVeTLoSMRU6+Mwmpub8nSmmmtqDdNsGw=;
        b=hehrXusC/CgWZop+4oKQ8Ijbbgb+Ivo2eiBEBZQktHZ1wZeB3A891eEXc2I0Rmj6DN
         NM5qcK7CziL8FSFBH2OCSDZVilEqHPW5ZNGOqEts6OFIUGIG20z5toJTpAaKTk9BjQZx
         Jyz3M7L+3PKtL0Xbeg8/fq5OSYchH1yXun+El5tNYNAgmeiZMgfqhZ3+at6tSDJRjM8v
         yTnOzvwctF6RkK2kSBhprkZ5UtON8N6eT32g14Udt8tejN34q8tdysUmgcbUV/IVpWWy
         CDoYYeti2/1zedEspVxVToZNJAZuDZ7HuaBWRkLcSuLKBMetbcgWyfbzSFlfhNulNQlq
         89Pg==
X-Forwarded-Encrypted: i=1; AJvYcCXLqBcg0cmfGAGAxXnC77Ahzm+BaZEon/Aaxr4qnWM96D46CDW2AELPQtFR6qrTooBx0m7Vz4oJ8Oab1s80Rkj/qXgeL7+cABt9hUKcFQ==
X-Gm-Message-State: AOJu0YymzBLl2vLS6XLYp3zqJQHa+w6E65gM0EQ2djHTcay31Lb1Ml8t
	hKXPke+slGH0ppcAwYyJdTpJPyVddQhb5eIXly1MVPn7CUBhSnSPsrdogjBbAGN75VWbtr+ZelQ
	czNJuZfTcVEHRA1q412UsRD+1ZtLh6f4zghepsj4pc4kB0hsh0ERFI4yzyX7IfUA=
X-Received: by 2002:a05:600c:1d82:b0:411:a8e9:993e with SMTP id p2-20020a05600c1d8200b00411a8e9993emr79112wms.32.1707746070477;
        Mon, 12 Feb 2024 05:54:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IECqjY4b/HynzxzJ2l+7/0bVWIETsdljuuAUD3AMoClAzlgC1kozPzME5eFXS62b0PYVkarNg==
X-Received: by 2002:a05:600c:1d82:b0:411:a8e9:993e with SMTP id p2-20020a05600c1d8200b00411a8e9993emr79096wms.32.1707746070090;
        Mon, 12 Feb 2024 05:54:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWrxG08xbF92anXCefVJKs4zYGQ6FMEDjKc2YetNG2vh4Bg4ZCnCsPM1AeM2s7LPqH1NZaBpVhdNYZXh8eoa69XRJa7RDpwA7WX9efD0mo2EBSI6osKvdy2MIsbjTvoflbj04Hl1hPq+2Ys6ZgX/5DNEobWqiu1OLmOuEj0LWYiMdeHXLX6+usmiNl2Ng9hGfm/rfpp9fmE6DMR1Dr4PfDcYvaSmXKMkmAZImLM1hd4t31wJ4+9zwqJkTnipshs5fPPL0X0O3Uvg8H5fFulYkYD2OPe9S6qjlesFjojqyEjTqnZWMmgKSG/MGAQ+Qd3P/8A2/wuvuMY6VGVYFH5YmppFaXeByzDlBavtELstwJcZMjyAfhDUaOkc1iYAz9NZOjPMv6lLai7Qf4h5KNPxotLQ926Qs7iOj2O2ttR0fmlqGmY/eTID2f6XWjmfloTAv0q8aJB8nkoLVUJBMsxRxJw0mQkJkXA5vO9pqqYKfG/4P6/PgBry+x2AY6nw3n6lyI1xLduov664gL1BigaeB4HYrpuxzPbv4Lo69US8Iu2dPbd98415V9m41pkxzp8G8EHWa+tX0Yz819QOE5/0/xKyDIE+haoZ+lU5aAohEvijwZJSU39CWLaoeq1A2V6/gR1uxcoclr7k1Q9YZNKRMBxslsbp6wniWUoTQzD+Fy7zDrwSg3HXTHP6DJq3UbxmrZ2aVJMzJW4x6dPz5B3NmE31/pwF9LptuXsmKX6McG0lSK9An9ALBEKG/B1mF+o1K5pdOxkyge0P/VTJuhjSpmunKrxyz0SdkpRIRFGJGZUbi7Vl6M6b9zaySa5EoJ59sQtLsgHzEjZznMDyJgi8TFxXEMKjjIkLN3OPgtQ0onCMr/n0UFJwlPHD5OLJg==
Received: from [192.168.3.108] (p4ff23a05.dip0.t-ipconnect.de. [79.242.58.5])
        by smtp.gmail.com with ESMTPSA id ay15-20020a5d6f0f000000b0033b4ebc3c8fsm7090793wrb.2.2024.02.12.05.54.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 05:54:29 -0800 (PST)
Message-ID: <a91cfe1c-289e-4828-8cfc-be34eb69a71b@redhat.com>
Date: Mon, 12 Feb 2024 14:54:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 19/25] arm64/mm: Wire up PTE_CONT for user mappings
To: Ryan Roberts <ryan.roberts@arm.com>, Mark Rutland <mark.rutland@arm.com>
References: <20240202080756.1453939-1-ryan.roberts@arm.com>
 <20240202080756.1453939-20-ryan.roberts@arm.com>
 <ZcoIVypNwOPIX30w@FVFF77S0Q05N>
 <c899f252-dbf3-4e7b-8342-b5a5180486cd@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <c899f252-dbf3-4e7b-8342-b5a5180486cd@arm.com>
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Yang Shi <shy828301@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org, Andrey Ryabinin <ryabinin.a.a@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>, Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>, Alistair Popple <apopple@nvidia.com>, Barry Song <21cnbao@gmail.com>, Matthew Wilcox <willy@infradead.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Ingo Molnar <mingo@redhat.com>, Zi Yan <ziy@nvidia.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, John Hubbard <jhubbard@nvidia.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

>> If so, I wonder if we could instead do that comparison modulo the access/dirty
>> bits,
> 
> I think that would work - but will need to think a bit more on it.
> 
>> and leave ptep_get_lockless() only reading a single entry?
> 
> I think we will need to do something a bit less fragile. ptep_get() does collect
> the access/dirty bits so its confusing if ptep_get_lockless() doesn't IMHO. So
> we will likely want to rename the function and make its documentation explicit
> that it does not return those bits.
> 
> ptep_get_lockless_noyoungdirty()? yuk... Any ideas?
> 
> Of course if I could convince you the current implementation is safe, I might be
> able to sidestep this optimization until a later date?

As discussed (and pointed out abive), there might be quite some 
callsites where we don't really care about uptodate accessed/dirty bits 
-- where ptep_get() is used nowadays.

One way to approach that I had in mind was having an explicit interface:

ptep_get()
ptep_get_uptodate()
ptep_get_lockless()
ptep_get_lockless_uptodate()

Especially the last one might not be needed.

Futher, "uptodate" might not be the best choice because of 
PageUptodate() and friends. But it's better than 
"youngdirty"/"noyoungdirty" IMHO.

Of course, any such changes require care and are better done one step at 
at time separately.

-- 
Cheers,

David / dhildenb

