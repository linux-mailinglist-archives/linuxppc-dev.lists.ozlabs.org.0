Return-Path: <linuxppc-dev+bounces-9278-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE838AD4A95
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Jun 2025 07:55:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bHFJW4p8Nz307q;
	Wed, 11 Jun 2025 15:55:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749621355;
	cv=none; b=DNaOtKv4eU2EYY/zSixWbekZD1SNnr78x9tPMG3vtD0TnItFSqeblp8vWu1CfIzEqzYM7IAbFFQoCOiXDHL4vebdqEIlknKhF5MqmFrjtrEUtqiDd3CMXHGU5AdgiEfGyRF3F/wfI+1VD+zmeBn5xSg1UF1xtV/OGc4s9aeDnfG7NsuXHI7RHgPcuXCCFuOhIz1C3BodwuVQRO5H0VJexcDzYhJ1K/yXj+LNpC8OGkK4EDJXmsCLYCr5lVcH1DBcuJOEa/MjQv7AunCMlPOcZbp/IFAF8CAW64VQDoDdjnxxYltWMgfxlGo9ckOSNyv6EPktaPVdP2wnev+QEtt0TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749621355; c=relaxed/relaxed;
	bh=K843Q3pgT+61lbrWizu6epwQCyVTjY3OINehU8t9Nmo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dzh+c4kK5cemMUPxHQY0vsL+KQdchvUIaCAiWkzeH9smPTcAwVS87HpUj2kHIohc8cE+kmJZ9k7tXHRL3V278FM1H14V2cxNymZ9ddIvgRzQG4qYqsIWOZNKF4bJAs5B6NG47U7bKM56WRGVFmn10Wa7CKy/ge7nz3wOWfosbBP4gGCPobREeq27cHEnCujUgS+vXYrDybF3mZC8+RvowpzX+dXl0b8RAIxfN2R2wgDr+m/lfJDMWvwowl5vrvsJpY9ezCUGeP+GzicbXMEWZbM20Z2YltpqF7iOi2cIi/c2S12g4Mxtwn5RvFJphNecJSgJWf0GbKJAzqxQwr+V4Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AFetBiAv; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AFetBiAv; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AFetBiAv;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AFetBiAv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bHFJV5XLLz2yMt
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Jun 2025 15:55:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749621350;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=K843Q3pgT+61lbrWizu6epwQCyVTjY3OINehU8t9Nmo=;
	b=AFetBiAv4RIeqdtIvOaMb3N6ZrLAZbrLrsBpRbd6yJnGVaaiSr8833BXFzDWPUi58O+sTq
	joJs9C7+pa1lCwtXpZUr/89qKne8IBlxoJd/bhvMXJqLMXKTzWKGOfK+HVJ08OYUNP7jK4
	XiDRFcvMAGOQ3ZSdmYIZamH1cknGMzA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749621350;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=K843Q3pgT+61lbrWizu6epwQCyVTjY3OINehU8t9Nmo=;
	b=AFetBiAv4RIeqdtIvOaMb3N6ZrLAZbrLrsBpRbd6yJnGVaaiSr8833BXFzDWPUi58O+sTq
	joJs9C7+pa1lCwtXpZUr/89qKne8IBlxoJd/bhvMXJqLMXKTzWKGOfK+HVJ08OYUNP7jK4
	XiDRFcvMAGOQ3ZSdmYIZamH1cknGMzA=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-619-Ux4prGkcNZipd3CezL6Tcw-1; Wed, 11 Jun 2025 01:55:48 -0400
X-MC-Unique: Ux4prGkcNZipd3CezL6Tcw-1
X-Mimecast-MFC-AGG-ID: Ux4prGkcNZipd3CezL6Tcw_1749621348
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-ade6db50bb4so166784766b.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jun 2025 22:55:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749621347; x=1750226147;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K843Q3pgT+61lbrWizu6epwQCyVTjY3OINehU8t9Nmo=;
        b=FAi5PTn++fX806O9X2AcVe6PrPEufmvFYrB0jO/C+XyLSRE0z2Y5Ul0yKmK5gl1Y7s
         JU/5fLbiHketdnGsZR5+AN2yc5Y8Zs4ePmvz8JhNdTnaFeSHzKr08m7Jqzk4g0m/Cv5z
         gv+d1WZXHS2tSRwWky/SGjLJM63XSX+rtPG4Iyu8J/y1gymqFdZwr0B61NbZeDC7NXL8
         tlJStTeFP6GopUWEsc6NmmQT2qQ5kZ/e43wonnYb/fYgXEhyj1uaJSG0RzfQ1+k0UIfd
         f9GJXK4YjWbCOgY6khR79Tsbe6juJBb1T6sQdCMqfifmzNvYUlmrcIbOAIYp+tYEN1HU
         nSuQ==
X-Gm-Message-State: AOJu0Yzn8tB/GbrA2mB/k8YFys5nCjtQOP+z69rKozBO/abd8pKN7m0j
	kUoVa2Ovd+MMxyx9XcHkE+yArgpiF3xU5izA3vmTG6MDVTXIXTrk1JghHAp4J50Pkp66VzOu70m
	i9/MqoqwlQXjLcaELw+vAU77o3OSfT8GZnS4hV5ctp6jqgQ2ozlvJSfJY6K6natoZKvc=
X-Gm-Gg: ASbGncuZjEmAuduJMKPq/1SJX/JKAMHqSeBxgINkrUdWinkw2Kl3CedE/iMeszGcvye
	qKfiFqv0fRvZf8r4sg0zvVXIsYub7UKVQD9I+wFjvpWGhbRssd25V3o/zQOFBm3UgoY5p63bAJV
	VE5rueJeSk7TOvqC/6x+fDGIODxDSxDEXcnZaWO3QP7eC6c9N4BzbzUKFezDP84y8HoLHj9nxYz
	BG6za03GxIQ/trb/st67SInMB0sRwJODEySDoUnIeLYvDY0B5zVNkTtgxSDEUphgp5xeY+U3Hv1
	MXbwnrUfc7Jzswj5ZxkUdjLkeprwYKsJyKG1FqGTNby2IHHF427zHMDwjw37pzs=
X-Received: by 2002:a17:907:2d8c:b0:add:fc52:898f with SMTP id a640c23a62f3a-ade8976341emr186578766b.42.1749621347549;
        Tue, 10 Jun 2025 22:55:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELUgyV3ZD4SmuVm/65YKbewvg/mMblFu8/n8vjCmzFg+kQUNgjR3D6DMf9Ajqsq95FEIJxbw==
X-Received: by 2002:a17:907:2d8c:b0:add:fc52:898f with SMTP id a640c23a62f3a-ade8976341emr186574666b.42.1749621347107;
        Tue, 10 Jun 2025 22:55:47 -0700 (PDT)
Received: from [192.168.0.4] (ltea-047-064-115-122.pools.arcor-ip.net. [47.64.115.122])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc78f56sm826197366b.154.2025.06.10.22.55.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 22:55:46 -0700 (PDT)
Message-ID: <53b46042-4ca3-4ba8-bf72-2dee9c54dc6d@redhat.com>
Date: Wed, 11 Jun 2025 07:55:45 +0200
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
Subject: Re: [PATCH v2 2/2] powerpc: Replace __ASSEMBLY__ with __ASSEMBLER__
 in non-uapi headers
To: Segher Boessenkool <segher@kernel.crashing.org>
Cc: linuxppc-dev@lists.ozlabs.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Geoff Levand <geoff@infradead.org>, Naveen N Rao <naveen@kernel.org>
References: <20250610160128.69033-1-thuth@redhat.com>
 <20250610160128.69033-3-thuth@redhat.com>
 <20250610202634.GG30295@gate.crashing.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250610202634.GG30295@gate.crashing.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: o7I8zbUJ5cNXOzJhlAyT6DlUr4kQiBsPyHgpomfKfuU_1749621348
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 10/06/2025 22.26, Segher Boessenkool wrote:
> On Tue, Jun 10, 2025 at 06:01:28PM +0200, Thomas Huth wrote:
>> From: Thomas Huth <thuth@redhat.com>
>>
>> While the GCC and Clang compilers already define __ASSEMBLER__
>> automatically when compiling assembly code, __ASSEMBLY__ is a
>> macro that only gets defined by the Makefiles in the kernel.
> 
> And it should not, the kernel is not allowed to define any symbol
> starting with two underscores at all!  Including __ASSEMBLER__ yes.

Right, I can add that in the next version, too.

>> This can be very confusing when switching between userspace
>> and kernelspace coding, or when dealing with uapi headers that
>> rather should use __ASSEMBLER__ instead. So let's standardize on
>> the __ASSEMBLER__ macro that is provided by the compilers now.
> 
> "Now"?  This is true since at least 2003, and probably a lot longer
> already.

Sorry, I've put the "now" into the wrong location ... it should rather be in 
the first half of the sentence instead :-)

  Thomas


