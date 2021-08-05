Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FC03E0FF2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Aug 2021 10:10:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GgLrM3nXZz3d7l
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Aug 2021 18:10:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.221.48; helo=mail-wr1-f48.google.com;
 envelope-from=jirislaby@gmail.com; receiver=<UNKNOWN>)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GgLqz5QyQz300x
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Aug 2021 18:09:51 +1000 (AEST)
Received: by mail-wr1-f48.google.com with SMTP id c16so5297021wrp.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Aug 2021 01:09:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wOvvcGOWNL43pF5gzZ1KGiUW3rYoHQr+5VBEfIZFYow=;
 b=sYY5ElURzq7tEqWHFQnaD2HQLzXIMfZfbO71+1+oMX4q8x00Kv6rufOLOglLj1jhX7
 hbAzNQTjX912rzH4KppM9lPgXfwKDNiJCnQ4HY+LTzCuV8ml7i5vOiskgp79StkTVR2E
 5i6W5lOeoIc2Sbxiu5dtygqN6eJzn8s7dJ7t7o3QLTy14fX1ITIetwfZGKHShf2uNuJF
 WbMbBlRw7I/MtoSfZ2idWVt1baTzUKnjccTY6O8UAjcPTtZlXNWK0hFaFa60ii4ROnqN
 qZBdF2SyYUEtr4DP+eJfwlGK9Etopp1E5v7hWZCYJEGxFXVCaCQ3DC7bT9y2tHPo3AXm
 YSoA==
X-Gm-Message-State: AOAM530333C6sm0JncgPPjl3l2ypk0yY9vRxPKw5qXH5FQbHUPHtY4Rj
 jvh60joT3GKHNLs89tqKRsY=
X-Google-Smtp-Source: ABdhPJza9yPxZ/Yp1GJ6J7eu3qML/uunC/YdJrWn4YIzJejETB/deUbtlehxI2PyWD7B9IGNnmfT1A==
X-Received: by 2002:a5d:6691:: with SMTP id l17mr3681771wru.368.1628150988580; 
 Thu, 05 Aug 2021 01:09:48 -0700 (PDT)
Received: from ?IPv6:2a0b:e7c0:0:107::49? ([2a0b:e7c0:0:107::49])
 by smtp.gmail.com with ESMTPSA id i5sm5215326wrs.85.2021.08.05.01.09.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 01:09:48 -0700 (PDT)
Subject: Re: [PATCH v3 1/2] tty: hvc: pass DMA capable memory to put_chars()
From: Jiri Slaby <jirislaby@kernel.org>
To: Xianting Tian <xianting.tian@linux.alibaba.com>,
 gregkh@linuxfoundation.org, amit@kernel.org, arnd@arndb.de, osandov@fb.com
References: <20210804025453.93543-1-xianting.tian@linux.alibaba.com>
 <0f26a1c3-53e8-9282-69e8-8d81a9cafc59@kernel.org>
Message-ID: <f1b92c7d-0eaf-4eac-ecd2-fbb74fb63b52@kernel.org>
Date: Thu, 5 Aug 2021 10:09:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <0f26a1c3-53e8-9282-69e8-8d81a9cafc59@kernel.org>
Content-Type: text/plain; charset=iso-8859-2; format=flowed
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 05. 08. 21, 9:58, Jiri Slaby wrote:
> Hi,
> 
> On 04. 08. 21, 4:54, Xianting Tian wrote:
>> @@ -933,6 +949,16 @@ struct hvc_struct *hvc_alloc(uint32_t vtermno, 
>> int data,
>>       hp->outbuf_size = outbuf_size;
>>       hp->outbuf = &((char *)hp)[ALIGN(sizeof(*hp), sizeof(long))];

This deserves cleanup too. Why is "outbuf" not "char outbuf[0] 
__ALIGNED__" at the end of the structure? The allocation would be easier 
(using struct_size()) and this line would be gone completely.

>> +    /*
>> +     * hvc_con_outbuf is guaranteed to be aligned at least to the
>> +     * size(N_OUTBUF) by kmalloc().
>> +     */
>> +    hp->hvc_con_outbuf = kzalloc(N_OUTBUF, GFP_KERNEL);
>> +    if (!hp->hvc_con_outbuf)
>> +        return ERR_PTR(-ENOMEM);
> 
> This leaks hp, right?

Actually, why don't you make
char c[N_OUTBUF] __ALIGNED__;

part of struct hvc_struct directly?

> BTW your 2 patches are still not threaded, that is hard to follow.
> 
>> +
>> +    spin_lock_init(&hp->hvc_con_lock);
>> +
>>       tty_port_init(&hp->port);
>>       hp->port.ops = &hvc_port_ops;
> 
> thanks,
-- 
js
suse labs
