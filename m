Return-Path: <linuxppc-dev+bounces-6755-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A41CA545B9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Mar 2025 10:01:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z7k154w5Sz3brc;
	Thu,  6 Mar 2025 20:01:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741251673;
	cv=none; b=gTCZFUmzbdVOOW8pbeD9/PiEFb42WwM651zVflVhK/KDsczCb7jh9dbNakrAtZppN9w15ruFD/kE2nC4BG4ly01n65KgrMzirMJSQ2Pt2jneLhcR4HVMhkno7kRvMtcGkXsbuy+qFRD+T2mgHlO4v2ui7kkUAeWxYSfcc7WpCRU7HcG7EzMy3K54Uflf7PUmyewfT2RQShcfHmuMtgiSBLUAl7yIOfIgjNQLowpfPRQifX1i/UDrFT402IzprFEngY8CHJaBPkY8kb5wkEDWectH2uyRSqfWQdaBWBL+3pgDyAPSvwwUfBkERGTT+7nSPIM3x0HUgJiQ6MxWZ/dA2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741251673; c=relaxed/relaxed;
	bh=pY2indv9DvyBZQJoUjIBXHffPxVcc0dm+eOOwrLDR6k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k2xCZV8NH3T2eIbhpY21dhtgZNv5MFBT2nxCbOqO9epAUQ2IBq5H+aAjiulerj/ybYqA6sta3y8cdOPwvpRjhPDldyLc2yIPcu4K8qkd6DHumw70xwkupSb8d7x12rn9geUKlxcXlqEGZKePgkgeRSg/wd6R8prlTa3FeANZyBMMU0HyttZz5yftuzS1vpXnn/czoCDKRdGBDBURpY57nEAyN3VMrvsYlwlyqYazuSAZu/FAaX28NARnLTGIyiI/82hPIwQADfqzwuQ8PEi9vYTtDRevBZzaj99bR55lzrGhxGfi8V49cbotchVpS6IE+Q+qLJe1s04DWROK1GCHJg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NQZqz9X+; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NQZqz9X+; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NQZqz9X+;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NQZqz9X+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z7k1432CMz30Pn
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Mar 2025 20:01:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741251667;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=pY2indv9DvyBZQJoUjIBXHffPxVcc0dm+eOOwrLDR6k=;
	b=NQZqz9X+1/wMoaVvOfo0v2EUzIIArDANXRZZo8JK3Yeqs1puteaH5F+CAi1wYFuYSxwfuy
	k7nNbjDwf4JdNVK74sv046reQfjkYMRDW4x/Yl0Y6fbMZ7+zedJFNlaAEVkKxawY5srnVo
	qWsxdNnC8LFMqZkru0qA3WILk2yCaxg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741251667;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=pY2indv9DvyBZQJoUjIBXHffPxVcc0dm+eOOwrLDR6k=;
	b=NQZqz9X+1/wMoaVvOfo0v2EUzIIArDANXRZZo8JK3Yeqs1puteaH5F+CAi1wYFuYSxwfuy
	k7nNbjDwf4JdNVK74sv046reQfjkYMRDW4x/Yl0Y6fbMZ7+zedJFNlaAEVkKxawY5srnVo
	qWsxdNnC8LFMqZkru0qA3WILk2yCaxg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-189-QDyzwQhkNfCtP2QNV2GeEg-1; Thu, 06 Mar 2025 04:01:00 -0500
X-MC-Unique: QDyzwQhkNfCtP2QNV2GeEg-1
X-Mimecast-MFC-AGG-ID: QDyzwQhkNfCtP2QNV2GeEg_1741251660
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-438e180821aso1516125e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Mar 2025 01:01:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741251659; x=1741856459;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pY2indv9DvyBZQJoUjIBXHffPxVcc0dm+eOOwrLDR6k=;
        b=mcecTg99wS3QJ2cy1giJpBNGfwE6516ym1Mpoy7hxR1i5Q/xlyfUkN+mixYoN6shT7
         isJi+M74C5VVBi7MuCXkIriKC9EEcOSzJfAAOr86Pdji5V0cv8tJt7LwbB3p1XWHILzl
         HuSCIDcx1Wb1l3/LE6nECoFV5fNdUOnsFQlCWaBJ6I5wkBZwODXk4A7ztTs95o3LWQ66
         lbKrlS9aFuzuXzcy7mxR/0ZWcJiaO3aaf+10vnrSNjsjai2kHBma2Y/7sVY/TQG24jJ8
         g9KuySGBoXCkw5BKf7BANvL8cvMxZ9koIaL9te+sPxSpxlT29d7N/Fk6IIay+B3LIEng
         m8mQ==
X-Forwarded-Encrypted: i=1; AJvYcCU660J38g423dKJiLP9KtTG0hYIFAsZg1yYqhSGwzp8mLAEDbgBNIQm4+FEYnD055rPAt5M99KMai/orSI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwGHwO0AFxbf5BzZ6K13JfYk9ZxaEe95OzHof9OKRxueBobyOxN
	R41dAeMce8+yY9o1WYyxCP47tFfsleL2a9zMnculxzRh4Npo8nZcL/LrCFp7Uq1dOxr77y5Uuc5
	KXlrsFg5Zw5+z1yuhcltXmyAHM3NTWvl/TMwcWzc/STqNtzoSIXjJtKHdFgwDclM=
X-Gm-Gg: ASbGncuMYLeueCBJe9OeHV+vX7Ox+LF4ntLNGTRstI27LPuSyP4WWbCwOO94sO1RNFb
	ErUowhys9UuIEcEGyztrI26y7YHrPOkn8YJw8DgLThdzyHg3lRK1wP/U/IRKBKsUj3PCiMj/o5/
	h/EYPDjzCFM5otwktAc6ZTZ6z3r7yAjqRvNI69fa+Fwy1xYWExFUUazT6JNKcUxy5UbhIfR1DoW
	Yckvoy6YtDoO7zB5u4HZG2czybQx9o1/JoGLWWQ41b5sXT/onkI5FqZPViugkcBnquupg5+YLVQ
	v5/DJNTPF2uUrO+yzRYa4voH0gVg9I/kb83n39Y9hXWpZLc=
X-Received: by 2002:a05:600c:35d4:b0:439:9f42:c137 with SMTP id 5b1f17b1804b1-43bd298f9fbmr59118545e9.11.1741251659597;
        Thu, 06 Mar 2025 01:00:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG2NgeNdUnGXbD+op2sXJsB/SN3xlXNlbIFOWQaCFoi1UgYgSk1r/tZKHyzVnT9tI/XhwhMWA==
X-Received: by 2002:a05:600c:35d4:b0:439:9f42:c137 with SMTP id 5b1f17b1804b1-43bd298f9fbmr59118055e9.11.1741251659046;
        Thu, 06 Mar 2025 01:00:59 -0800 (PST)
Received: from [192.168.0.7] (ip-109-42-51-231.web.vodafone.de. [109.42.51.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bdd948cd0sm12787105e9.38.2025.03.06.01.00.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Mar 2025 01:00:58 -0800 (PST)
Message-ID: <a10378eb-4bff-488c-86f7-b4fec20feb6a@redhat.com>
Date: Thu, 6 Mar 2025 10:00:57 +0100
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC kvm-unit-tests PATCH] lib: Use __ASSEMBLER__ instead of
 __ASSEMBLY__
To: Sean Christopherson <seanjc@google.com>,
 Andrew Jones <andrew.jones@linux.dev>, Laurent Vivier <lvivier@redhat.com>
Cc: kvmarm@lists.linux.dev, kvm@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org
References: <20250222014526.2302653-1-seanjc@google.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250222014526.2302653-1-seanjc@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fSbz4qU-39-FhV-GnSprt0LsUXKAXM53p36lCeE2hXM_1741251660
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 22/02/2025 02.45, Sean Christopherson wrote:
> Convert all non-x86 #ifdefs from __ASSEMBLY__ to __ASSEMBLER__, and remove
> all manual __ASSEMBLY__ #defines.  __ASSEMBLY_ was inherited blindly from
> the Linux kernel, and must be manually defined, e.g. through build rules
> or with the aforementioned explicit #defines in assembly code.
> 
> __ASSEMBLER__ on the other hand is automatically defined by the compiler
> when preprocessing assembly, i.e. doesn't require manually #defines for
> the code to function correctly.
> 
> Ignore x86, as x86 doesn't actually rely on __ASSEMBLY__ at the moment,
> and is undergoing a parallel cleanup.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
> 
> Completely untested.  This is essentially a "rage" patch after spending
> way, way too much time trying to understand why I couldn't include some
> __ASSEMBLY__ protected headers in x86 assembly files.

Thanks, applied (after fixing the spot that Andrew mentioned and another one 
that has been merged in between)!

BTW, do you happen to know why the kernel uses __ASSEMBLY__ and not 
__ASSEMBLER__? Just grown historically, or is there a real reason?

  Thomas


