Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E4E155826
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Feb 2020 14:11:17 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48DbKG4lmmzDqfW
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Feb 2020 00:11:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1041;
 helo=mail-pj1-x1041.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=q3mbCsFH; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48DbFs60nqzDqfG
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Feb 2020 00:08:17 +1100 (AEDT)
Received: by mail-pj1-x1041.google.com with SMTP id n96so914413pjc.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 07 Feb 2020 05:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=z3DaoOJkhTG6G3BmjkBdZhMduYvYgvSmSTWWEthlkSk=;
 b=q3mbCsFHzqyeqCJYLMglgwLFkVQ5mI7OMEB82wzE62obxmgZyo65BZlaOsUCDTv6Nu
 kRnhvLFZBTulcUKzB90AiP86bJ9FOC7Lb6fEEZmsQ3XsfxT9aeQhLutvYHfw5KYKC/6r
 aYDYXrDSWqkWyG0KJ+6xEyOjyW9W527U63CPdbqwXfSUrsDCA1O6gaoxxbzY8iqYpx1l
 SG8zv1SBFVCkaB/58pZIKQo9NjrMVcmOtSOUuE9OEJZhuzETd1WMA0rlZL8QCWHr7Hry
 1YuQZnpzVZQvuxHJ7A5HIaqECZ1HygnQ2qAN6OCM+i8IWriBmJVHNNwYwxdznBk3r3XP
 ja7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=z3DaoOJkhTG6G3BmjkBdZhMduYvYgvSmSTWWEthlkSk=;
 b=YLHGSzJH2jCiC2HOBmeD5UjEJY5RkGDVOqttxppsUb/wcTHWAAt9HUCjGPbICUhDeO
 MZE1hmkijk+B29H65TebwQZQQIuAjFwVCTDoyDU/g62MF1llUthKNss/+Lq7mcJkabCv
 V+fqezohjSpv4Me1wETxWkNYZblgHSIJ8Jm2xEzd8t/NS7KL3pp9iX2wC0CY9zTlCyKM
 U4CfRzq3LuJQIBNmUOpOPY9rl8Ntv2NHNAkraMcPQw1maf/JKh2vSUelTmyWehVjDT/K
 EEf7pKR7c/z4XZw4k7BTP40pRUj6pfsxS4BIppebs30HryiNMC3HVCFzSl3kSFraeXyz
 kSDw==
X-Gm-Message-State: APjAAAWc3aIG5lkfRdRwLG58XDgdWEk6MIGTYn6PHDKK3svHncZpSZIV
 XE/6jYZue8NQlibErNX/1xA=
X-Google-Smtp-Source: APXvYqwk8HrzennbNw/RIl9zKUEV7VY8jBDjhQsLTxfvUQMy8RkJMoubgl4aCH6DLaBXk1SQQcZZrQ==
X-Received: by 2002:a17:902:b110:: with SMTP id
 q16mr9434632plr.289.1581080893188; 
 Fri, 07 Feb 2020 05:08:13 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 d14sm3244514pfq.117.2020.02.07.05.08.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Feb 2020 05:08:12 -0800 (PST)
Subject: Re: [PATCH v5 17/17] powerpc/32s: Enable CONFIG_VMAP_STACK
To: Christophe Leroy <christophe.leroy@c-s.fr>
References: <cover.1576916812.git.christophe.leroy@c-s.fr>
 <2e2509a242fd5f3e23df4a06530c18060c4d321e.1576916812.git.christophe.leroy@c-s.fr>
 <20200206203146.GA23248@roeck-us.net>
 <c6285f2a-f8f5-0d97-2d80-061da1f1a7fc@c-s.fr>
 <0f866131-4292-a66b-2637-c34139277486@c-s.fr>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <551bad84-3e80-265b-93ab-25eae4aa9807@roeck-us.net>
Date: Fri, 7 Feb 2020 05:08:11 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <0f866131-4292-a66b-2637-c34139277486@c-s.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 Paul Mackerras <paulus@samba.org>, linux-kernel@vger.kernel.org,
 dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2/7/20 12:28 AM, Christophe Leroy wrote:
> 
> 
> On 02/07/2020 06:13 AM, Christophe Leroy wrote:
>>
>>
>> Le 06/02/2020 à 21:31, Guenter Roeck a écrit :
>>> On Sat, Dec 21, 2019 at 08:32:38AM +0000, Christophe Leroy wrote:
>>>> A few changes to retrieve DAR and DSISR from struct regs
>>>> instead of retrieving them directly, as they may have
>>>> changed due to a TLB miss.
>>>>
>>>> Also modifies hash_page() and friends to work with virtual
>>>> data addresses instead of physical ones. Same on load_up_fpu()
>>>> and load_up_altivec().
>>>>
>>>> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
>>>
>>> This patch results in qemu boot failures (mac99 with pmac32_defconfig).
>>> Images fail silently; there is no console output. Reverting the patch
>>> fixes the problem. Bisect log is attached below.
>>>
>>> Assuming this was tested on real hardware, am I correct to assume that qemu
>>> for ppc32 (more specifically, qemu's mac99 and g3beige machines) no longer
>>> works with the upstream kernel ?
>>
>> Before submitting the series, I successfully tested:
>> - Real HW with powerpc 8xx
>> - Real HW with powerpc 832x
>> - Qemu's mac99
>>
>> I'll re-check the upstream kernel.
>>
> 
> This is still working for me with the upstream kernel:
> 

Interesting. What is your kernel configuration, your qemu version, and
your qemu command line ?

It works for me with CONFIG_VMAP_STACK=n, but not with pmac32_defconfig.

Thanks,
Guenter
