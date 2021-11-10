Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 630EC44BE13
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Nov 2021 10:51:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hq0VB2TKlz2ypT
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Nov 2021 20:51:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.208.46; helo=mail-ed1-f46.google.com;
 envelope-from=jirislaby@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hq0Tg4k5kz2yP9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Nov 2021 20:50:45 +1100 (AEDT)
Received: by mail-ed1-f46.google.com with SMTP id f4so8035046edx.12
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Nov 2021 01:50:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KeIlVKt/9xSQQTs2L6NDOm0eWEpONTN7EdsmQwnJyHM=;
 b=aQLngkfIOF1PeuTc66+skpO658RE/XfwAZg428E3LsAyfTg8m8+Y3I5P10Mx2jVfte
 2QvX/aWCD9ktgamY6sQqRhbZhx3IcSNNhleWSauTPKO65BlT/V1PpioOetWDfcvOHtBK
 a3oohfSVe1sTG86N9zp3MXJLeyX+nVZ3T96tgQ83x6nrbsFO/+Et8XPaS3PyU0UrkUVV
 xX01EUep3p1ieXUyVRfqkLSvSS+3RS+AJtd6NIeYAOAODA62p4b6cUSwnuwDrx5XlZgL
 QTJCY6S2gLzxsroCT2/NOE4Hm+cnW3gclhwwPhNbuiRzWapatKQkPFmCaaFWISQBuEOR
 xGTQ==
X-Gm-Message-State: AOAM5332pyt0DYGY9H/CCWu9whAWHNXXGpEdOn/iTghDkuQ2Mdasx3Kz
 YITB0DbmsCtTVgiuvgyfOGU=
X-Google-Smtp-Source: ABdhPJxKfaZW904QDKTo7q9yWc1H43QHgLcLPxIAtd3mUHIdQihHXv+xeNKdZIGKy5224MSbtl4xFw==
X-Received: by 2002:a17:907:7f8b:: with SMTP id
 qk11mr18953761ejc.313.1636537841497; 
 Wed, 10 Nov 2021 01:50:41 -0800 (PST)
Received: from ?IPV6:2a0b:e7c0:0:107::49? ([2a0b:e7c0:0:107::49])
 by smtp.gmail.com with ESMTPSA id g10sm12304528edr.56.2021.11.10.01.50.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Nov 2021 01:50:41 -0800 (PST)
Message-ID: <e2ff335d-5d21-345f-d899-8985477ffa53@kernel.org>
Date: Wed, 10 Nov 2021 10:50:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v12 1/2] tty: hvc: pass DMA capable memory to put_chars()
Content-Language: en-US
To: Xianting Tian <xianting.tian@linux.alibaba.com>,
 gregkh@linuxfoundation.org, amit@kernel.org, arnd@arndb.de, osandov@fb.com
References: <20211028150954.1356334-1-xianting.tian@linux.alibaba.com>
 <20211028150954.1356334-2-xianting.tian@linux.alibaba.com>
 <55b28b16-33f4-2a69-b2f1-6781d0241b99@kernel.org>
 <7dde342a-c2b7-32fe-7410-e372c82a4a68@linux.alibaba.com>
From: Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <7dde342a-c2b7-32fe-7410-e372c82a4a68@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: sfr@canb.auug.org.au, shile.zhang@linux.alibaba.com,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 04. 11. 21, 14:06, Xianting Tian wrote:
>> OTOH, you need c[N_OUTBUF] in the console case (hvc_console_print), but
>> not whole hvc_struct. So cons_hvcs should be an array of structs
>> composed of only the lock and the buffer.
> It is ok for me.
>> =============
>>
>> And I would do it even simpler now. One c[N_OUTBUF] buffer for all 
>> consoles and a single lock.
>>
>> And "char c" in struct hvc_struct.
>>
>> No need for the complex logic in hvc_console_print.
> 
> So you will implement this?

No, there is a slight difference between "I would" and "I will" :). I 
don't have anything to test this hvc change on…

thanks,
-- 
js
suse labs
