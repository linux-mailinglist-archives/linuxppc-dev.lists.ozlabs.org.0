Return-Path: <linuxppc-dev+bounces-946-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 255FE96B158
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2024 08:16:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WzC145MDLz2xxw;
	Wed,  4 Sep 2024 16:16:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725430234;
	cv=none; b=MMmnfiOjX0pbWC1F6r/+Vx3mcduMhtRiLR4Nhk6MYuu0syShfdOjgiZw7wpgTdMnWhf5BQuCjq3o20Co0Igm0uRQlr8zBxzZl80KwDkHdpRW8fzGSTTlP17QRn/OL1EFS+QoA3c/bA1Fnqz0BoDkWF1olfPm0pEL81eVDsV135sspQLT3yCziSdTuP42APb6xi3v3E1Haga2CZK6aa9oE+oA4mLbLaZEW/rI3UOcTSF7BQJCFvzVdO+LqLlJtBIcGo6nwMqq29+fqNAkkfVkuz2CGKY6XyZmoNp3km1//l6h4MRvMceCEaSjNbFvH9CgfLjvCFG8kMovUuWfYwb4Og==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725430234; c=relaxed/relaxed;
	bh=l6V+fxyx9J17jMpvz7+Fq8AeiBhZGiwz6aJOg0X+z7o=;
	h=DKIM-Signature:DKIM-Signature:Message-ID:Date:MIME-Version:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type; b=QYQ5FlSkRN6Yx7pCugQGteU+xRsglbThrtu7pO/3ody9ySKgNZGuA8ewfBM3RYuWk4JleirNrBJqU1J/LZVnvRmQG/6nJjKRI2s4jxWlGaytik1zJICZA9uhYH6RvpkqLIHvKlG3rDqeur3c+5aYyVS4op4qdUxwyZ758pgZgJmz/m0FtrP7IzCQUY/K+xtItj6C7g9EoHqA/zZerbWxYuUSHpyUcIqj69FTA4ahALoi9hLOVhkhC6KhNPwOFPCzAkbCl/R0ng936AQa49ulsuXlbXXs8MJdxbPUTqM5/vaL8ZLhkPFn2emJoZX2qdMWgbHHcrDtprdB2YUfj83Hvw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Az0zsf+c; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Az0zsf+c; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Az0zsf+c;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Az0zsf+c;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WzBtd42fJz2xZQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2024 16:10:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725430228;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=l6V+fxyx9J17jMpvz7+Fq8AeiBhZGiwz6aJOg0X+z7o=;
	b=Az0zsf+cNf4tNkJWQnKP7uMM1XToP2o2q3oRmrZV5su4LjTCUfAchTSMSQ/usQZvplaahn
	DO1rtfN105Qqd33S3pmenrRnNp7DbIZL1+3OjqQDds7OmmNislot8p1Y3c74KvE3UWfGDe
	CZ71sugEhjGWx4G6IcxXgnxpzEpyHPU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725430228;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=l6V+fxyx9J17jMpvz7+Fq8AeiBhZGiwz6aJOg0X+z7o=;
	b=Az0zsf+cNf4tNkJWQnKP7uMM1XToP2o2q3oRmrZV5su4LjTCUfAchTSMSQ/usQZvplaahn
	DO1rtfN105Qqd33S3pmenrRnNp7DbIZL1+3OjqQDds7OmmNislot8p1Y3c74KvE3UWfGDe
	CZ71sugEhjGWx4G6IcxXgnxpzEpyHPU=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-434-1Af5BVi3Ozy1f-aAK8NmKg-1; Wed, 04 Sep 2024 02:10:27 -0400
X-MC-Unique: 1Af5BVi3Ozy1f-aAK8NmKg-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a7a83fad218so556233866b.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Sep 2024 23:10:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725430226; x=1726035026;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l6V+fxyx9J17jMpvz7+Fq8AeiBhZGiwz6aJOg0X+z7o=;
        b=L+XSdynAyAgUccG4DEQxjth80uB9Js908uvFGiI1MtR4VATSoQORO2quVCkwCwnUG2
         i8h8/aGgTqA2pD05p7oRkCT2CDTG+tuYyxNcAT38ukLtA7TO+w5Cpp8t7l2UMmDQMzZ+
         HTqDyyHOKiCMHc0c8SK+Tdpi5m6dMS2ZZKZQ2InZ7NaDJGkphmPJwXwYRp91SEmNuVt6
         9It2A+9USrVeR4ZHWXow5fPAC0BEHo7zJY72OJzm5RdHYM29CEPXtkX9Kb6h2HmXDw8R
         nPqXe2b8yEMEk5JMHfB9XznygBozS4gDw87SitgOYwBPr6VF58SLSvZ8Rj16eIIAKWk2
         UhLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXQ+bAK/gnTuuxA00sa6w0lTB4Fmh1TmKU9KJO65dL+GZ0FbXs/qc53r6VDhjPOKWy++3/4aJPi60loKQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxGuiPu8xLDO09XmmlqXLRqD6pQ4z1Ni+7E586uFmGKcG++p/W0
	uwT99cP/nrvmLgEF39dThjAOgjs5kMnNLBFBMd1YzRenTugt0rLPRQJlfuNI7TjENVzRevzqkxY
	CMWo+Ul9OL2V/6uKCNfC7Jv4gG2S1LNCbEkfx2LNaCO5fmQ3E7nne96P84jPPqMk=
X-Received: by 2002:a17:907:7e98:b0:a7a:97ca:3059 with SMTP id a640c23a62f3a-a89b9568fb7mr914180266b.34.1725430225921;
        Tue, 03 Sep 2024 23:10:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2R4cP9J+W47K4+S/93+/qMlByI9g4pLQSot/De5DcDW6cAfj6YNv4/0hVq6CwiaDFPMR8sw==
X-Received: by 2002:a17:907:7e98:b0:a7a:97ca:3059 with SMTP id a640c23a62f3a-a89b9568fb7mr914178066b.34.1725430225410;
        Tue, 03 Sep 2024 23:10:25 -0700 (PDT)
Received: from [192.168.0.6] (ip-109-43-176-181.web.vodafone.de. [109.43.176.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a898900e746sm768992066b.52.2024.09.03.23.10.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Sep 2024 23:10:24 -0700 (PDT)
Message-ID: <f8c797ae-a8de-4e6f-a1b5-c0db79e15011@redhat.com>
Date: Wed, 4 Sep 2024 08:10:23 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH 2/3] configure: Support cross compiling
 with clang
To: Andrew Jones <andrew.jones@linux.dev>, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, kvmarm@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org
Cc: pbonzini@redhat.com, lvivier@redhat.com, frankja@linux.ibm.com,
 imbrenda@linux.ibm.com, nrb@linux.ibm.com, atishp@rivosinc.com,
 cade.richard@berkeley.edu, jamestiotio@gmail.com
References: <20240903163046.869262-5-andrew.jones@linux.dev>
 <20240903163046.869262-7-andrew.jones@linux.dev>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 xsFNBFH7eUwBEACzyOXKU+5Pcs6wNpKzrlJwzRl3VGZt95VCdb+FgoU9g11m7FWcOafrVRwU
 yYkTm9+7zBUc0sW5AuPGR/dp3pSLX/yFWsA/UB4nJsHqgDvDU7BImSeiTrnpMOTXb7Arw2a2
 4CflIyFqjCpfDM4MuTmzTjXq4Uov1giGE9X6viNo1pxyEpd7PanlKNnf4PqEQp06X4IgUacW
 tSGj6Gcns1bCuHV8OPWLkf4hkRnu8hdL6i60Yxz4E6TqlrpxsfYwLXgEeswPHOA6Mn4Cso9O
 0lewVYfFfsmokfAVMKWzOl1Sr0KGI5T9CpmRfAiSHpthhHWnECcJFwl72NTi6kUcUzG4se81
 O6n9d/kTj7pzTmBdfwuOZ0YUSqcqs0W+l1NcASSYZQaDoD3/SLk+nqVeCBB4OnYOGhgmIHNW
 0CwMRO/GK+20alxzk//V9GmIM2ACElbfF8+Uug3pqiHkVnKqM7W9/S1NH2qmxB6zMiJUHlTH
 gnVeZX0dgH27mzstcF786uPcdEqS0KJuxh2kk5IvUSL3Qn3ZgmgdxBMyCPciD/1cb7/Ahazr
 3ThHQXSHXkH/aDXdfLsKVuwDzHLVSkdSnZdt5HHh75/NFHxwaTlydgfHmFFwodK8y/TjyiGZ
 zg2Kje38xnz8zKn9iesFBCcONXS7txENTzX0z80WKBhK+XSFJwARAQABzR5UaG9tYXMgSHV0
 aCA8dGh1dGhAcmVkaGF0LmNvbT7CwXgEEwECACIFAlVgX6oCGwMGCwkIBwMCBhUIAgkKCwQW
 AgMBAh4BAheAAAoJEC7Z13T+cC21EbIP/ii9cvT2HHGbFRl8HqGT6+7Wkb+XLMqJBMAIGiQK
 QIP3xk1HPTsLfVG0ao4hy/oYkGNOP8+ubLnZen6Yq3zAFiMhQ44lvgigDYJo3Ve59gfe99KX
 EbtB+X95ODARkq0McR6OAsPNJ7gpEUzfkQUUJTXRDQXfG/FX303Gvk+YU0spm2tsIKPl6AmV
 1CegDljzjycyfJbk418MQmMu2T82kjrkEofUO2a24ed3VGC0/Uz//XCR2ZTo+vBoBUQl41BD
 eFFtoCSrzo3yPFS+w5fkH9NT8ChdpSlbNS32NhYQhJtr9zjWyFRf0Zk+T/1P7ECn6gTEkp5k
 ofFIA4MFBc/fXbaDRtBmPB0N9pqTFApIUI4vuFPPO0JDrII9dLwZ6lO9EKiwuVlvr1wwzsgq
 zJTPBU3qHaUO4d/8G+gD7AL/6T4zi8Jo/GmjBsnYaTzbm94lf0CjXjsOX3seMhaE6WAZOQQG
 tZHAO1kAPWpaxne+wtgMKthyPLNwelLf+xzGvrIKvLX6QuLoWMnWldu22z2ICVnLQChlR9d6
 WW8QFEpo/FK7omuS8KvvopFcOOdlbFMM8Y/8vBgVMSsK6fsYUhruny/PahprPbYGiNIhKqz7
 UvgyZVl4pBFjTaz/SbimTk210vIlkDyy1WuS8Zsn0htv4+jQPgo9rqFE4mipJjy/iboDzsFN
 BFH7eUwBEAC2nzfUeeI8dv0C4qrfCPze6NkryUflEut9WwHhfXCLjtvCjnoGqFelH/PE9NF4
 4VPSCdvD1SSmFVzu6T9qWdcwMSaC+e7G/z0/AhBfqTeosAF5XvKQlAb9ZPkdDr7YN0a1XDfa
 +NgA+JZB4ROyBZFFAwNHT+HCnyzy0v9Sh3BgJJwfpXHH2l3LfncvV8rgFv0bvdr70U+On2XH
 5bApOyW1WpIG5KPJlDdzcQTyptOJ1dnEHfwnABEfzI3dNf63rlxsGouX/NFRRRNqkdClQR3K
 gCwciaXfZ7ir7fF0u1N2UuLsWA8Ei1JrNypk+MRxhbvdQC4tyZCZ8mVDk+QOK6pyK2f4rMf/
 WmqxNTtAVmNuZIwnJdjRMMSs4W4w6N/bRvpqtykSqx7VXcgqtv6eqoDZrNuhGbekQA0sAnCJ
 VPArerAZGArm63o39me/bRUQeQVSxEBmg66yshF9HkcUPGVeC4B0TPwz+HFcVhheo6hoJjLq
 knFOPLRj+0h+ZL+D0GenyqD3CyuyeTT5dGcNU9qT74bdSr20k/CklvI7S9yoQje8BeQAHtdV
 cvO8XCLrpGuw9SgOS7OP5oI26a0548M4KldAY+kqX6XVphEw3/6U1KTf7WxW5zYLTtadjISB
 X9xsRWSU+Yqs3C7oN5TIPSoj9tXMoxZkCIHWvnqGwZ7JhwARAQABwsFfBBgBAgAJBQJR+3lM
 AhsMAAoJEC7Z13T+cC21hPAQAIsBL9MdGpdEpvXs9CYrBkd6tS9mbaSWj6XBDfA1AEdQkBOn
 ZH1Qt7HJesk+qNSnLv6+jP4VwqK5AFMrKJ6IjE7jqgzGxtcZnvSjeDGPF1h2CKZQPpTw890k
 fy18AvgFHkVk2Oylyexw3aOBsXg6ukN44vIFqPoc+YSU0+0QIdYJp/XFsgWxnFIMYwDpxSHS
 5fdDxUjsk3UBHZx+IhFjs2siVZi5wnHIqM7eK9abr2cK2weInTBwXwqVWjsXZ4tq5+jQrwDK
 cvxIcwXdUTLGxc4/Z/VRH1PZSvfQxdxMGmNTGaXVNfdFZjm4fz0mz+OUi6AHC4CZpwnsliGV
 ODqwX8Y1zic9viSTbKS01ZNp175POyWViUk9qisPZB7ypfSIVSEULrL347qY/hm9ahhqmn17
 Ng255syASv3ehvX7iwWDfzXbA0/TVaqwa1YIkec+/8miicV0zMP9siRcYQkyTqSzaTFBBmqD
 oiT+z+/E59qj/EKfyce3sbC9XLjXv3mHMrq1tKX4G7IJGnS989E/fg6crv6NHae9Ckm7+lSs
 IQu4bBP2GxiRQ+NV3iV/KU3ebMRzqIC//DCOxzQNFNJAKldPe/bKZMCxEqtVoRkuJtNdp/5a
 yXFZ6TfE1hGKrDBYAm4vrnZ4CXFSBDllL59cFFOJCkn4Xboj/aVxxJxF30bn
In-Reply-To: <20240903163046.869262-7-andrew.jones@linux.dev>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/09/2024 18.30, Andrew Jones wrote:
> When a user specifies the compiler with --cc assume it's already
> fully named, even if the user also specifies a cross-prefix. This
> allows clang to be selected for the compiler, which doesn't use
> prefixes, but also still provide a cross prefix for binutils. If
> a user needs a prefix on the compiler that they specify with --cc,
> then they'll just have to specify it with the prefix prepended.
> 
> Also ensure user provided cflags are used when testing the compiler,
> since the flags may drastically change behavior, such as the --target
> flag for clang.
> 
> With these changes it's possible to cross compile for riscv with
> clang after configuring with
> 
>   ./configure --arch=riscv64 --cc=clang --cflags='--target=riscv64' \
>               --cross-prefix=riscv64-linux-gnu-
> 
> Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
> ---
>   configure | 11 ++++++++---
>   1 file changed, 8 insertions(+), 3 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


