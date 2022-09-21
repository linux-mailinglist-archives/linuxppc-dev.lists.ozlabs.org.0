Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B4A5BFEA0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 15:04:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXdsz48mgz3bms
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 23:04:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GpZ5c90j;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ov2mUhY1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GpZ5c90j;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ov2mUhY1;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXdsG40Vrz30LJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 23:04:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1663765436;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gdHnV3VWEqsU153bSqOynZpQmdwwjdT8tHpP+AqIewQ=;
	b=GpZ5c90jB1qhpRGCcgxGdhf6uOerhDEqL0/Ae5163qoLESZzLuWKPITHaUUyJQBBJdMi8W
	kM1V762aPpUe6Gt/9VFQVxpXq89sBXzFU6ZgiqtiyTdiwLKHzz5c15oe1hjde5G1OWscqC
	yv22am4GfzmzO952c5KqLr9SDf409Vs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1663765437;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gdHnV3VWEqsU153bSqOynZpQmdwwjdT8tHpP+AqIewQ=;
	b=Ov2mUhY1FOV7Cjf/TNFfnNli232Ncbk5d1ICh9JIiZY9bCz2vdCRbpoD8pApGNf4OMrNwB
	jB6Mr9Klmy81H8PC/7drvSf9tGxyxz6nV/fKjlWFnniMFuST8L3m8miNgmA+q1aKSVXmEh
	xo3GfNLwvGeaDXIdK29tWJGqxgq/O6A=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-490-jGJ8CW_BNSaSf7JUzTWTJA-1; Wed, 21 Sep 2022 09:03:55 -0400
X-MC-Unique: jGJ8CW_BNSaSf7JUzTWTJA-1
Received: by mail-wr1-f70.google.com with SMTP id e2-20020adf9bc2000000b0022ae4ea0afcso220864wrc.8
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 06:03:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=gdHnV3VWEqsU153bSqOynZpQmdwwjdT8tHpP+AqIewQ=;
        b=tLq3u3qGxPQuzRTdqSmphaioEF6agsdcC8UBJZcUmajmXIHy1zfLiR1Z17UdAsewXE
         251/lGszUJI+w7wR5L+8+EMwISYjqvVryeljsO/esmo83VTCTAzJvm3jtU1Sc8b4sBI8
         7r64SzjAFNE4KV6sH6mmDmOprwuVRGVcpqsP7jQ+KB5PvNBa67LGcN4lHn28X2wWsaGE
         Nef8DysQmprZmOXat0FByia06XEIcn3WblLB1V+s218gFaNvmbINg/JtdkVk6HTwQK3s
         mrAwisU0+aYGlJEZUv2z/ch+kZjz8MeRGnPW7PEgo3e/oe/dqCVBIfKqqsUKuJW9Hbvt
         azeQ==
X-Gm-Message-State: ACrzQf1tB3Fx5VF/8vqtbWAxyFiUtQEk5q67lzYPlfsOn4S4Z3u10D1z
	H5/bN3qgBQ0K01TbiEjU6qkYKuebwjCNmcuerM3/6JQe7dja/TcJMSbZXragktI+ox/ITs8HsZJ
	zY2knkTxAvlyQpa4R1Utkt3EC5w==
X-Received: by 2002:adf:e112:0:b0:21d:7195:3a8d with SMTP id t18-20020adfe112000000b0021d71953a8dmr17774995wrz.371.1663765432925;
        Wed, 21 Sep 2022 06:03:52 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4lMc4LT+3VySvRgJ/Fc31nBF9lBFT9H6ehTnnnf0ivjSkxi9SR6r+BJZ3x5kMq2M7Gjhw1UQ==
X-Received: by 2002:adf:e112:0:b0:21d:7195:3a8d with SMTP id t18-20020adfe112000000b0021d71953a8dmr17774956wrz.371.1663765432534;
        Wed, 21 Sep 2022 06:03:52 -0700 (PDT)
Received: from ?IPV6:2003:cb:c703:6900:26b8:85a4:a645:4128? (p200300cbc703690026b885a4a6454128.dip0.t-ipconnect.de. [2003:cb:c703:6900:26b8:85a4:a645:4128])
        by smtp.gmail.com with ESMTPSA id p25-20020a7bcc99000000b003b476bb2624sm2812131wma.6.2022.09.21.06.03.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 06:03:51 -0700 (PDT)
Message-ID: <9f649899-d227-6dff-2ada-aaac81b50879@redhat.com>
Date: Wed, 21 Sep 2022 15:03:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v1 2/3] powerpc/prom_init: drop PROM_BUG()
To: Michael Ellerman <mpe@ellerman.id.au>, linux-kernel@vger.kernel.org
References: <20220920122302.99195-1-david@redhat.com>
 <20220920122302.99195-3-david@redhat.com> <877d1w2844.fsf@mpe.ellerman.id.au>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <877d1w2844.fsf@mpe.ellerman.id.au>
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
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Baoquan He <bhe@redhat.com>, linux-doc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Dave Young <dyoung@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Jani Nikula <jani.nikula@linux.intel.com>, linux-mm@kvack.org, David Laight <David.Laight@ACULAB.COM>, Nicholas Piggin <npiggin@gmail.com>, Dwaipayan Ray <dwaipayanray1@gmail.com>, Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, Ingo Molnar <mingo@kernel.org>, Vivek Goyal <vgoyal@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 21.09.22 15:02, Michael Ellerman wrote:
> David Hildenbrand <david@redhat.com> writes:
>> Unused, let's drop it.
>>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>   arch/powerpc/kernel/prom_init.c | 6 ------
>>   1 file changed, 6 deletions(-)
> 
> Thanks. I'll take this one via the powerpc tree, and the others can go
> via wherever?

Makes sense; I'll drop this patch in case I have to resend, assuming 
it's in your tree.

Thanks!

-- 
Thanks,

David / dhildenb

