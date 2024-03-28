Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A81890748
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 18:38:25 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hukCDuE7;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IW3/m5R9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V59k73GjPz3vdB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Mar 2024 04:38:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hukCDuE7;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IW3/m5R9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V59jP2qKXz3dXZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Mar 2024 04:37:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711647460;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=xrIHgfhkhLZpk6FmbvIYhAy69CmFs8+HHh/oFSiCeJA=;
	b=hukCDuE739ir1NBovOH/ebmp+pnOmeemLXaP+YxTDhj0Bs062ymxYisPxjeDDAenJDxH8W
	xBT5hmbWiX2VuZDwhNMfdSRXQXQwZwu3YHWatcEvOiNU4vOEPconuxUWEDcbrzUxmuyLZH
	lz6k5pDSeM33aqdZPSOUJPZKNR2LCDw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711647461;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=xrIHgfhkhLZpk6FmbvIYhAy69CmFs8+HHh/oFSiCeJA=;
	b=IW3/m5R9QvBLWM9cs5LcnpNLEyFakQX6HaashJK+WVsDbx3n9BYAh9EJo3pDAE+MCGekC2
	VP+ANa2eZquocxXlclclTi6InWZrbQkYfS8E8wR+OpYdrZEFgOnHQ09zF4s1RO74disrtq
	k1wUZcic4ATQHRl4SbGZZnlzsBSTxxk=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-171-6iMzJSSkPfWaHX-cs_KfqQ-1; Thu, 28 Mar 2024 13:37:36 -0400
X-MC-Unique: 6iMzJSSkPfWaHX-cs_KfqQ-1
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-789ea357429so120375485a.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Mar 2024 10:37:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711647456; x=1712252256;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xrIHgfhkhLZpk6FmbvIYhAy69CmFs8+HHh/oFSiCeJA=;
        b=W9KfeKNXyDyMXkvFDfvw5m64HJyrhWyioHJBIocCLYmbJXqyC700GTgodj4tEDH663
         WIS7mvuLLkKO+hvpCp7fYtOXMU5hQHe5Rr5G9ZSLXwUBdSL99Zz2+30rwRZ1xxDAn8TO
         XQLpjmORuopT0A+fTTVMC2aGcNvhD9VaeP64Q8FXKwZadhU++0P68eTdpVSf9tuPTyzv
         FcbYjC83sPMxVkaTkfC8d2KG6MBUwBGQ9rFSDxl86i8TbUK5j99w5PIj+LjRPIolZqSP
         CUzkSf4z2YzauEb8kYA+33n+T4F3xGWRrlySd0Dvpa7p0dq/k93KGqZmzUKPoqbDBEZr
         bIkw==
X-Forwarded-Encrypted: i=1; AJvYcCXQ//F0ZqREbG3Q3/U7ZylHdCAFK9aDwE0gVwgAj3y6gdahhSOvIs7ckqbB0Ke08RxXB6M+kFhCqvvGXhihnq41wIHfiAm7fzM3H1ipjw==
X-Gm-Message-State: AOJu0Yy4r+CBi1LgMxugaDtH6cJi1KFmrGNi0ASqWMMFFcsf5NpcSFR6
	8QLTS3vB7mtWsczpeMDd47tnIXMGbHUPR/M+/9QYo75xbBTsg69UrIfUkljMadb5mLouyg7YFBu
	RK5mbm89yst9AcJpC4wpCZVdSPNRP6lF2g5aNpJwyOxgrfauclEKb4VrJ8vlp+yU=
X-Received: by 2002:a05:620a:1455:b0:78a:5813:d644 with SMTP id i21-20020a05620a145500b0078a5813d644mr128129qkl.41.1711647456381;
        Thu, 28 Mar 2024 10:37:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHt54JNBNLnsfjYXiqqTkyrXFTAMpL/dAv67YOAQo0okM9Cbbf94sXOJ+9yGmUUtiCpL6+vWw==
X-Received: by 2002:a05:620a:1455:b0:78a:5813:d644 with SMTP id i21-20020a05620a145500b0078a5813d644mr128105qkl.41.1711647456030;
        Thu, 28 Mar 2024 10:37:36 -0700 (PDT)
Received: from [192.168.0.9] (ip-109-43-177-37.web.vodafone.de. [109.43.177.37])
        by smtp.gmail.com with ESMTPSA id k8-20020a05620a0b8800b0078a0dda6d35sm690097qkh.107.2024.03.28.10.37.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Mar 2024 10:37:35 -0700 (PDT)
Message-ID: <6821682a-56f8-46aa-8fee-197434723bf5@redhat.com>
Date: Thu, 28 Mar 2024 18:37:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH v7 07/35] common: add memory dirtying vs
 migration test
To: Nicholas Piggin <npiggin@gmail.com>
References: <20240319075926.2422707-1-npiggin@gmail.com>
 <20240319075926.2422707-8-npiggin@gmail.com>
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
In-Reply-To: <20240319075926.2422707-8-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, Andrew Jones <andrew.jones@linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 19/03/2024 08.58, Nicholas Piggin wrote:
> This test stores to a bunch of pages and verifies previous stores,
> while being continually migrated. Default runtime is 5 seconds.
> 
> Add this test to ppc64 and s390x builds. This can fail due to a QEMU
> TCG physical memory dirty bitmap bug, so it is not enabled in unittests
> for TCG yet.
> 
> The selftest-migration test time is reduced significantly because
> this test
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   common/memory-verify.c      | 67 +++++++++++++++++++++++++++++++++++++
>   common/selftest-migration.c |  8 ++---
>   powerpc/Makefile.common     |  1 +
>   powerpc/memory-verify.c     |  1 +
>   powerpc/unittests.cfg       |  7 ++++
>   s390x/Makefile              |  1 +
>   s390x/memory-verify.c       |  1 +
>   s390x/unittests.cfg         |  6 ++++
>   8 files changed, 88 insertions(+), 4 deletions(-)
>   create mode 100644 common/memory-verify.c
>   create mode 120000 powerpc/memory-verify.c
>   create mode 120000 s390x/memory-verify.c
> 
> diff --git a/common/memory-verify.c b/common/memory-verify.c
> new file mode 100644
> index 000000000..e78fb4338
> --- /dev/null
> +++ b/common/memory-verify.c
> @@ -0,0 +1,67 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Simple memory verification test, used to exercise dirty memory migration.
> + */
> +#include <libcflat.h>
> +#include <migrate.h>
> +#include <alloc.h>
> +#include <asm/page.h>
> +#include <asm/time.h>
> +
> +#define NR_PAGES 32
> +
> +static unsigned time_sec = 5;
> +
> +static void do_getopts(int argc, char **argv)
> +{
> +	int i;
> +
> +	for (i = 0; i < argc; ++i) {
> +		if (strcmp(argv[i], "-t") == 0) {
> +			i++;
> +			if (i == argc)
> +				break;
> +			time_sec = atol(argv[i]);
> +		}
> +	}
> +
> +	printf("running for %d secs\n", time_sec);
> +}
> +
> +int main(int argc, char **argv)
> +{
> +	void *mem = malloc(NR_PAGES*PAGE_SIZE);

Use alloc_pages(5) instead ? Or add at least some white spaces around "*".

Apart from that this patch looks sane to me, so with that line fixed:
Reviewed-by: Thomas Huth <thuth@redhat.com>

