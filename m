Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3199B86DFE8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Mar 2024 12:12:36 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=O5TZ1LVw;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=O5TZ1LVw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TmQRP5r8mz3vbv
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Mar 2024 22:12:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=O5TZ1LVw;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=O5TZ1LVw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TmQQY4sCSz3dXc
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Mar 2024 22:11:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709291505;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=FCQYsUouDSxv5reDjPV/4WyHKOYkBj14Aw0nlup8uBQ=;
	b=O5TZ1LVwJ+l3GFW1FVsKTmdLI94RCIg3hWAMxVDLc5u3KYzFplWNuEEaQ9QA35ddn3dXwT
	wDDiHqgiIhFuGwlDMKXKGb545XcsxqPN/XKRq78yEeRgCXdrp7DrqBQZTOo1i20hPxpUS9
	beSMwdTwkSnRxsYBMg0sf9vcYMYqZHU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709291505;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=FCQYsUouDSxv5reDjPV/4WyHKOYkBj14Aw0nlup8uBQ=;
	b=O5TZ1LVwJ+l3GFW1FVsKTmdLI94RCIg3hWAMxVDLc5u3KYzFplWNuEEaQ9QA35ddn3dXwT
	wDDiHqgiIhFuGwlDMKXKGb545XcsxqPN/XKRq78yEeRgCXdrp7DrqBQZTOo1i20hPxpUS9
	beSMwdTwkSnRxsYBMg0sf9vcYMYqZHU=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-458-1r3stkNNMjm8wrjdfwvk4w-1; Fri, 01 Mar 2024 06:11:43 -0500
X-MC-Unique: 1r3stkNNMjm8wrjdfwvk4w-1
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-42e61f21790so17087381cf.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 01 Mar 2024 03:11:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709291503; x=1709896303;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FCQYsUouDSxv5reDjPV/4WyHKOYkBj14Aw0nlup8uBQ=;
        b=EeHtzsJoCSuZH2wFTShm/9xfk+S9pyjxDZk0aYQMWrcM59QB0O3Okh5Sz5ZS6d8cJl
         R8teIWIdhObJ6Lbo8+HVeM9wDPT7sDmZv7TA11DngmQFDdM3dOMzyM+jlRhV7PQp/emL
         xTEwM45/pyTlz/Jizss0F443jJxy2XRNElyXzJJFFOwfVOpjPdzg+OjkBmVewen4nzCh
         TJV/xZ1SN0UXjWVNvbIRMH4yOFPK2JJUwhfHeV+8c8lrDpwqSUm1vMQn/L9LcQlRGCAF
         VM7eexrv2Gfb9EDK1S9DoyWRjtbYOuAvF2HvbbGy+tN8M67dORk0n2kiCPh0pd86mEWI
         GmMA==
X-Forwarded-Encrypted: i=1; AJvYcCXuyGpPQ2p8cK+fdz/pbETARuju4NI+EvZlFBlWMjGhyC3GLvY9tplb5ssSGd394ngRF4rJWaVjfjwIDdMmRb47d5/BXxkebo+MbVBjnQ==
X-Gm-Message-State: AOJu0YxuCuRKdDVnrTv8JqFS8BvetP8AXNgFygkCTNkmfsVvdrTYghLk
	GWa5VwcXxjLb1oaRS4/HuM4O+x2/yhyrD/JIskMUYAeEFlcDD/SgG9ayvgyoSjStMdwrWQ6pWyi
	PbjdkIQn5fweSPP8lwoQ2PxLiX/iPMEZYJ1X/6/3UnmgqyDRFrnrkA75nPOyS5Nk=
X-Received: by 2002:a05:622a:190b:b0:42e:8190:1974 with SMTP id w11-20020a05622a190b00b0042e81901974mr1411229qtc.59.1709291503134;
        Fri, 01 Mar 2024 03:11:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IErXEfe705xXBhoFeCqf6iTiv9eaDLvwqBUTIjTmv+up8UgiX/WNvnRCbJQ4RdUyq4h5yLKww==
X-Received: by 2002:a05:622a:190b:b0:42e:8190:1974 with SMTP id w11-20020a05622a190b00b0042e81901974mr1411221qtc.59.1709291502844;
        Fri, 01 Mar 2024 03:11:42 -0800 (PST)
Received: from [192.168.0.9] (ip-109-43-178-133.web.vodafone.de. [109.43.178.133])
        by smtp.gmail.com with ESMTPSA id k23-20020ac84757000000b0042ece270fdbsm233117qtp.93.2024.03.01.03.11.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Mar 2024 03:11:42 -0800 (PST)
Message-ID: <678e3dde-2579-4a21-9417-36f8374a2529@redhat.com>
Date: Fri, 1 Mar 2024 12:11:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH 05/32] powerpc: Cleanup SPR and MSR
 definitions
To: Nicholas Piggin <npiggin@gmail.com>
References: <20240226101218.1472843-1-npiggin@gmail.com>
 <20240226101218.1472843-6-npiggin@gmail.com>
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
In-Reply-To: <20240226101218.1472843-6-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, kvm@vger.kernel.org, Andrew Jones <andrew.jones@linux.dev>, Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 26/02/2024 11.11, Nicholas Piggin wrote:
> Move SPR and MSR defines out of ppc_asm.h and processor.h and into a
> new include, asm/reg.h.
> 
> Add a define for the PVR SPR and various processor versions, and replace
> the open coded numbers in the sprs.c test case.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   lib/powerpc/asm/ppc_asm.h   |  8 +-------
>   lib/powerpc/asm/processor.h |  7 +------
>   lib/powerpc/asm/reg.h       | 30 ++++++++++++++++++++++++++++++
>   lib/powerpc/asm/time.h      |  1 +
>   lib/ppc64/asm/reg.h         |  1 +
>   powerpc/sprs.c              | 21 ++++++++++-----------
>   6 files changed, 44 insertions(+), 24 deletions(-)
>   create mode 100644 lib/powerpc/asm/reg.h
>   create mode 100644 lib/ppc64/asm/reg.h

Reviewed-by: Thomas Huth <thuth@redhat.com>

