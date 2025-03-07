Return-Path: <linuxppc-dev+bounces-6797-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6EFA562BF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Mar 2025 09:42:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z8KXp0zxXz3cBd;
	Fri,  7 Mar 2025 19:42:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741336938;
	cv=none; b=LHGvPSZQ0obika4G7I3pgX8iHut3mFxwvJWfRndn6BkuG9Ehm05vtnQvxRd18PjKlnYRkrOjnIHqceaLPYhV8cogXC6opz7qfIuGBcYXgGjvR876RK0+OwnhQEvJbtZvdzUZhYGxYNBb7B8VsaddaIL69w6bZg38ptvLkbY35sm/0cfVqPdRi9DKXshuLdzxAsfuuDhDz5JWxkAoBxRl2/EVfer2eh+4zpMHfqbdOopl8iKRq/p7WDpsa4O4i1jNOCgVJ5SOmw2qhmg+KCtMA+pSrjS4duTJAKoCwKYHnpWjjCDYBtY3jD7P4CdiziKm819PC6lfObGMlSMNXA+0HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741336938; c=relaxed/relaxed;
	bh=l8faWtD+xJ1942m4oDwtKpTnc6C+l89fRhpPKTFDxTI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CENEIDk6adTo/QxzWfDCb6moYulJN16qrvc6YGVOdB/Znzrjclooz1btwEsealMSTcAHPWoOlk0d21QOWBQ//RAQFk9i9h2wx9afxh+g9LcTnNwu3dnL5+sE19U1rxioMsVIUYEr9R8jT5f/u31XgN/jd1ncjoJVw9gT/8+gs7t0rjh8wNyLOLdRAfPl34baC5m7q4kDoysst8oHnV36CWcBZl2sCccA/UdcA4AhHihRvyW4fAaKc8kx3SSDuhD6ZiZ01WpAO0UUO9GqqZmIW75DVbgQHpoeo1OhmQADQFzCh0TWnLfOEqLR8YL0VmJrpuTPDNfu441LQNrhhPNwkQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=R47plaJA; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=R47plaJA; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=R47plaJA;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=R47plaJA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z8KXn0VXFz30CN
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Mar 2025 19:42:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741336931;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=l8faWtD+xJ1942m4oDwtKpTnc6C+l89fRhpPKTFDxTI=;
	b=R47plaJA8LNqKmqmCxXSI7A98DxRc1HzBIGb7ws+wDnrfzhyFvPHFkD+CNQNyYt1UejseD
	/pITRjfuNG9haePO42FnG2/RRSWE3aeh8DCNhljv47fqjA3brfE+otO73hkVODPpQvZtKv
	L/idQiv/eZP59ggNG1vIXQjbQ4VVyac=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741336931;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=l8faWtD+xJ1942m4oDwtKpTnc6C+l89fRhpPKTFDxTI=;
	b=R47plaJA8LNqKmqmCxXSI7A98DxRc1HzBIGb7ws+wDnrfzhyFvPHFkD+CNQNyYt1UejseD
	/pITRjfuNG9haePO42FnG2/RRSWE3aeh8DCNhljv47fqjA3brfE+otO73hkVODPpQvZtKv
	L/idQiv/eZP59ggNG1vIXQjbQ4VVyac=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-470-zu95HlhBOrKiJUE0oRrG2Q-1; Fri, 07 Mar 2025 03:42:07 -0500
X-MC-Unique: zu95HlhBOrKiJUE0oRrG2Q-1
X-Mimecast-MFC-AGG-ID: zu95HlhBOrKiJUE0oRrG2Q_1741336927
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3910cd78330so825894f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 07 Mar 2025 00:42:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741336926; x=1741941726;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l8faWtD+xJ1942m4oDwtKpTnc6C+l89fRhpPKTFDxTI=;
        b=suqP3HuFrzCyAfX4IRTyKcqlO3Bze9kuCDLYNxMtXQQxJ0Q7sbhL7dxpN4lV8ewXts
         UbFSQAFvov8UUQJbaogtI+WmxmzBrdqHqfWuj0pf6rYKM613QREqEdYl1X8K87jl1sry
         vZiL8y8IVeJbiOyBsPUEqpUu16plDL0MDNnikOu8Sz+vL7rD5ZzDBH7DRpZCWcbmJwXR
         O63vzuP7rztigV3GWX37cphqlpqTYlVJCAZd98XaIvlGpEQbsAgQeDFaCoUA9XlYMOrC
         HAujKVMKYXfcA7IQVY0PKT3xzjUxQ6CrVGu8WSirtKIHCbB5+Qpx79zmw39j4SFdcl9C
         jPjA==
X-Forwarded-Encrypted: i=1; AJvYcCUTEsPpccaotjoIUszqf1YtdbyYXyR/MiRafHqYHMpt2btuoQHsSVHgNtyTbJ1+je8hiLD/xLHdDo+CaNc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwB4oeWNmNsbGKGLzSLpy0H9ucptEnLA7JqspSsDLPeaZjqBEC6
	JaM079WokIbCRJeuchPFGEiggQ6v/RrhDrYIMB9hxZP2cuZLMmvsq/VBEeSrFrzWhBNR2CZDIPd
	IoKJrCkMl7Fc4perZ7lmgiutOkoHjFWaYDBoZF7pwrgCPNfB6BAVdINNQAczc7U8=
X-Gm-Gg: ASbGncuYLcubDZ0wzYLQdpvOkghvdhAqgnJqhdUxJz2yvsHt2I/+UazAH8qxYMlzHz+
	NFKNWXYU2mjH20LpWa5kc6SdXjUWXtPu/loAhorFPeFSsUA1Gf1qzqI0GHakvQ8AtPfaEpZXaeV
	sYS49AgTzyZ/W5RMTzZe7EIJ2NLfHJERRv+38UWYHjxPTcS0s5C11tadQXy5E7wG1HKaNla8XJp
	aUzRhFcxE4kPFLM8jLhyoPAU6aKqKMomStriWbDif5YlaK7CRNjqZmZohtSh+1+FuTPR/IjU9i2
	HzEHFyt5CjjuGLDI57hox4kmFzfRzW0k80X/yUjD5cDsGfQ=
X-Received: by 2002:a5d:64c3:0:b0:391:31c8:ba58 with SMTP id ffacd0b85a97d-39132d16dd6mr1491119f8f.10.1741336926627;
        Fri, 07 Mar 2025 00:42:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFEvTfkOOstDpIQCVNVrNI5tXKqN/Unz1X0joyz13KAcVi+91nu9TMSHHsyDlvACic/Oa9C5w==
X-Received: by 2002:a5d:64c3:0:b0:391:31c8:ba58 with SMTP id ffacd0b85a97d-39132d16dd6mr1491095f8f.10.1741336926296;
        Fri, 07 Mar 2025 00:42:06 -0800 (PST)
Received: from [192.168.0.7] (ip-109-42-51-231.web.vodafone.de. [109.42.51.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfba679sm4602122f8f.8.2025.03.07.00.42.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Mar 2025 00:42:05 -0800 (PST)
Message-ID: <2c0bd772-0132-4053-bd22-aac88a8dcfee@redhat.com>
Date: Fri, 7 Mar 2025 09:42:03 +0100
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
Subject: Re: [kvm-unit-tests PATCH] Makefile: Use CFLAGS in cc-option
To: Andrew Jones <andrew.jones@linux.dev>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org
Cc: pbonzini@redhat.com, alexandru.elisei@arm.com, eric.auger@redhat.com,
 lvivier@redhat.com, frankja@linux.ibm.com, imbrenda@linux.ibm.com,
 nrb@linux.ibm.com
References: <20250307083952.40999-2-andrew.jones@linux.dev>
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
In-Reply-To: <20250307083952.40999-2-andrew.jones@linux.dev>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: etCBNraTqMrtmIdm8E99_0j954gTCs_gXqjJyu2hjPw_1741336927
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 07/03/2025 09.39, Andrew Jones wrote:
> When cross compiling with clang we need to specify the target in
> CFLAGS and cc-option will fail to recognize target-specific options
> without it. Add CFLAGS to the CC invocation in cc-option.
> 
> Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
> ---
>   Makefile | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 78352fced9d4..9dc5d2234e2a 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -21,7 +21,7 @@ DESTDIR := $(PREFIX)/share/kvm-unit-tests/
>   
>   # cc-option
>   # Usage: OP_CFLAGS+=$(call cc-option, -falign-functions=0, -malign-functions=0)
> -cc-option = $(shell if $(CC) -Werror $(1) -S -o /dev/null -xc /dev/null \
> +cc-option = $(shell if $(CC) $(CFLAGS) -Werror $(1) -S -o /dev/null -xc /dev/null \
>                 > /dev/null 2>&1; then echo "$(1)"; else echo "$(2)"; fi ;)
>   
>   libcflat := lib/libcflat.a

Reviewed-by: Thomas Huth <thuth@redhat.com>


