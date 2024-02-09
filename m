Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4106D84FB53
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Feb 2024 18:58:11 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PPC5XmDG;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PPC5XmDG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TWhR46Smfz3cnT
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Feb 2024 04:58:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PPC5XmDG;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PPC5XmDG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TWhQG45XJz3bv3
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Feb 2024 04:57:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707501442;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=2kgITGNgRH4Wqk6mUUFnib2/8oqDp6rW8fOt5+7CaGI=;
	b=PPC5XmDGBvqKXPIj5WdfBw6jE58eM6EhdzRfuAfs2GNOcc2H+NIbz0LNykEfDeSpburPTU
	iNhNmuagYrekW4yMsMxQqU/12ZRufRT1YjTeLcPp6jgincqqbAwehlUExuf8g5OFXNBy3j
	tEDL9za3/it0t2koGaLoQWj8rwXX43g=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707501442;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=2kgITGNgRH4Wqk6mUUFnib2/8oqDp6rW8fOt5+7CaGI=;
	b=PPC5XmDGBvqKXPIj5WdfBw6jE58eM6EhdzRfuAfs2GNOcc2H+NIbz0LNykEfDeSpburPTU
	iNhNmuagYrekW4yMsMxQqU/12ZRufRT1YjTeLcPp6jgincqqbAwehlUExuf8g5OFXNBy3j
	tEDL9za3/it0t2koGaLoQWj8rwXX43g=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-581-XZbpxsdEPlyERH6TVmDH-A-1; Fri, 09 Feb 2024 12:57:21 -0500
X-MC-Unique: XZbpxsdEPlyERH6TVmDH-A-1
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7859f5ae990so144696585a.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Feb 2024 09:57:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707501441; x=1708106241;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2kgITGNgRH4Wqk6mUUFnib2/8oqDp6rW8fOt5+7CaGI=;
        b=gCnMY3MU1bEf+LMPoTEdPG0yzvFg1mhn8YFdocFHTjyqerySCgNa8QUQJ3yO0uXxCi
         44jqYeQIXmnjaJ73SWHKInXVRaAoBTLA328VVC3RX4K/SQ3rSyc9swIkxhqQp5h56hHE
         bVoTdzcnyGtb3JGAAl5B3McPZ/vPmjwYCJtfPBmeY2zU9pvLyV8RkC16CetoZ513zi2M
         NUmzgK48uXBloCZvv6Ov0dUC05/V6QbRAe69X8SITNGdLCSV/aFXtSnqXqGYiNfPrqX0
         XF+TYzej+/ZeZjx3UGfbLIv/Kv0b71bYHPtbMmbynat0SDy8xul6PW7UPbak+1LovVII
         ZkNA==
X-Gm-Message-State: AOJu0YwNqkgs33fywS6BrC2bXSJHfBRarP7Jxhj17nrjdW0QMRrWDvms
	uNTu6ObaJ5hSwbQgC+mnmZb50e1umUOS0EwFwhLX5MaqJdMt2wa/HdewweDHfb4lh+zsLZfhll3
	EZkBs0sMPaQ54uI09ol+JjLtdB2JWodA2zTk2vLxTwWh7AHoEi+EZ7jWajNdJJew=
X-Received: by 2002:a05:620a:199a:b0:783:cb5a:ec3b with SMTP id bm26-20020a05620a199a00b00783cb5aec3bmr2878181qkb.71.1707501440843;
        Fri, 09 Feb 2024 09:57:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFh9eBa+uL0TgU8I7s2UC/0d5VeQVwvoUVp9Qb/f8h1ezUPmyU5PofF8iaO+q5Htkiy1Je+JQ==
X-Received: by 2002:a05:620a:199a:b0:783:cb5a:ec3b with SMTP id bm26-20020a05620a199a00b00783cb5aec3bmr2878147qkb.71.1707501440460;
        Fri, 09 Feb 2024 09:57:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXxdog3KtAVjA17ihb7yJMbtJys8LsF81l51sg4R8zhMr2ceg2lq62vOmj3gdhH39XD6aOFg9/L2Tk7nAT44EypfeNloh5Yb7v4MNhzbRx4awkuF9OcLqiBSxinoNtZLQBjd50L0P1ROKqAWPwz+/ohXd3W9z1cF830kNeU2FJXwo8LBlzxZMk/AsGOGTG7TvpjQJSar+4xvsPmATSrwMdekkSzwlnVvUqAtnC0xfnJVhcy2Hmwxh4+pZu2R3EXYzUgXla5jBmGgT1V2oyqG0bckI9VnJeIVGRD4sIsai7qCEtnLQHCyTtxBJWqJ+wj5SuLs48NSjgUR9iw/Pswh+ZmZiJOGnuxamkYGHPerL947oleU1N+nqSQmvm2Hpcrd3vXFVykzbExpeInqc9aC4rz6ohJv5jdthDnIk9YkLNxuQjJmRdFIKgVoKuyURm1BI+3Vnx2cIYKcvMdK74s3GZinvKMrYLpZcLDpnQGHSWPH4yUTeqivOQ3O1cRuvuqj2A4zqr0mjnP5HtxAM2hrc/gYj4Z
Received: from [192.168.0.9] (ip-109-43-177-145.web.vodafone.de. [109.43.177.145])
        by smtp.gmail.com with ESMTPSA id f6-20020a05620a12e600b0078552b5e161sm896441qkl.78.2024.02.09.09.57.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Feb 2024 09:57:20 -0800 (PST)
Message-ID: <54232155-ef97-4911-b1c7-acc7ee06a676@redhat.com>
Date: Fri, 9 Feb 2024 18:57:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH v4 4/8] migration: Support multiple
 migrations
To: Nicholas Piggin <npiggin@gmail.com>
References: <20240209091134.600228-1-npiggin@gmail.com>
 <20240209091134.600228-5-npiggin@gmail.com>
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
In-Reply-To: <20240209091134.600228-5-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linux-s390@vger.kernel.org, Nico Boehr <nrb@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linuxppc-dev@lists.ozlabs.org, Shaoqin Huang <shahuang@redhat.com>, Andrew Jones <andrew.jones@linux.dev>, Eric Auger <eric.auger@redhat.com>, Marc Hartmayer <mhartmay@linux.ibm.com>, kvm-riscv@lists.infradead.org, kvmarm@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexandru Elisei <alexandru.elisei@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 09/02/2024 10.11, Nicholas Piggin wrote:
> Support multiple migrations by flipping dest file/socket variables to
> source after the migration is complete, ready to start again. A new
> destination is created if the test outputs the migrate line again.
> Test cases may now switch to calling migrate() one or more times.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   lib/migrate.c         |  8 ++--
>   lib/migrate.h         |  1 +
>   scripts/arch-run.bash | 86 ++++++++++++++++++++++++++++++++++++-------
>   3 files changed, 77 insertions(+), 18 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


