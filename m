Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BC02F9898
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Jan 2021 05:17:50 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DJz6265SXzDrPy
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Jan 2021 15:17:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::530;
 helo=mail-pg1-x530.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=GeK0Qowi; dkim-atps=neutral
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DJz446mnJzDqm6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Jan 2021 15:16:04 +1100 (AEDT)
Received: by mail-pg1-x530.google.com with SMTP id n10so10128618pgl.10
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Jan 2021 20:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZMsaSxf4zuxG0jJN9z4+6EOG9sctH6uCfuBTKntZy5M=;
 b=GeK0QowikC5oIe4mj0Sa7NaG1ZFyB5oqbcdB4aR5FKY8KEtfScjW96/V8xh3lkEbnX
 qSSeEfBnYXBvuLm2TgDuRNf+fKpui+Tl3zy66exm3GB12HQm5wj9jgaEGzLCfhocNvEF
 XFmaGorh5a/25jJFw0wLtpv5PjOu4hgBZdowesdGBpOdnRxkX5CbR7Lv/NohGTPwoNvF
 X2OkiRDXjThpYMjpezRl2mqEqaxmxo43PDRFDbkw5ABPJwamqI9iFjjh2oCaM5GfUSRA
 8DEi53eOlh1LMgRoTPrUgF0VW6b/vvrZBRNM6XJeSx7QOFlO/1EcHc3N7giqnj/M5ntb
 BAdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZMsaSxf4zuxG0jJN9z4+6EOG9sctH6uCfuBTKntZy5M=;
 b=cdoyste8mv7elGbJ/xLva3/oxooOdOGzsYGuhy56fY9oiMYxdulLOC5cgEzCwRlPc4
 4H+PJJHbhrQFPA7TCq54Ku1OeteAJkmnIyMTw2It3lJegXId/VpRPpx9sGlf9WEjX8q4
 ztehJd/uOdNsVlJGuAEt5bqHXbrDPsPYsx0yK4YTg4RGXYXbAOs9NL3zrrvune6fREWo
 0055cGnrZ8rZIb4apcGhLYCTE2o0HnF00NFudwvvfERGNkzFK19MFpZug9AaQsxBG9LI
 zp/lO3q6Iq+4v+/n928iXaiPdsiY+t5w4xRBDdB9klWTaGY6mu+bU7HqNxEig6my/fQ+
 f9nA==
X-Gm-Message-State: AOAM53370dU9umjVTp+uP5HCTgsDcq6zo0798pvIETYZ4E2PPU2CkwLN
 qVXGvz6v3F4Pfm0wV06Jx91obg==
X-Google-Smtp-Source: ABdhPJzBLRrL6KuKDeHK5ZyLQEp//KGu0qVa3LxwviOpPXCo6QBFUFLER/WKJxaWVUBi2zUip97s9A==
X-Received: by 2002:a63:4966:: with SMTP id y38mr23946598pgk.428.1610943361042; 
 Sun, 17 Jan 2021 20:16:01 -0800 (PST)
Received: from [192.168.10.23] (124-171-107-241.dyn.iinet.net.au.
 [124.171.107.241])
 by smtp.gmail.com with UTF8SMTPSA id me5sm9054855pjb.19.2021.01.17.20.15.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Jan 2021 20:16:00 -0800 (PST)
Subject: Re: [PATCH 5/6] powerpc/rtas: rename RTAS_RMOBUF_MAX to
 RTAS_USER_REGION_SIZE
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20210114220004.1138993-1-nathanl@linux.ibm.com>
 <20210114220004.1138993-6-nathanl@linux.ibm.com>
 <d91c5b15-7c3d-a332-45ac-1b865341e962@ozlabs.ru>
 <87a6taxkgf.fsf@linux.ibm.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-ID: <6905c3d2-e524-b6d8-036f-7812ea3f8b85@ozlabs.ru>
Date: Mon, 18 Jan 2021 15:15:55 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:85.0) Gecko/20100101
 Thunderbird/85.0
MIME-Version: 1.0
In-Reply-To: <87a6taxkgf.fsf@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Language: en-US
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
Cc: tyreld@linux.ibm.com, brking@linux.ibm.com, ajd@linux.ibm.com,
 aneesh.kumar@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 16/01/2021 02:56, Nathan Lynch wrote:
> Alexey Kardashevskiy <aik@ozlabs.ru> writes:
>> On 15/01/2021 09:00, Nathan Lynch wrote:
>>> diff --git a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm/rtas.h
>>> index 332e1000ca0f..1aa7ab1cbc84 100644
>>> --- a/arch/powerpc/include/asm/rtas.h
>>> +++ b/arch/powerpc/include/asm/rtas.h
>>> @@ -19,8 +19,11 @@
>>>    #define RTAS_UNKNOWN_SERVICE (-1)
>>>    #define RTAS_INSTANTIATE_MAX (1ULL<<30) /* Don't instantiate rtas at/above this value */
>>>    
>>> -/* Buffer size for ppc_rtas system call. */
>>> -#define RTAS_RMOBUF_MAX (64 * 1024)
>>> +/* Work areas shared with RTAS must be 4K, naturally aligned. */
>>
>> Why exactly 4K and not (for example) PAGE_SIZE?
> 
> 4K is a platform requirement and isn't related to Linux's configured
> page size. See the PAPR specification for RTAS functions such as
> ibm,configure-connector, ibm,update-nodes, ibm,update-properties.

Good, since we are documenting things here - add to the comment ("per 
PAPR")?


> There are other calls with work area parameters where alignment isn't
> specified (e.g. ibm,get-system-parameter) but 4KB alignment is a safe
> choice for those.
> 
>>> +#define RTAS_WORK_AREA_SIZE   4096
>>> +
>>> +/* Work areas allocated for user space access. */
>>> +#define RTAS_USER_REGION_SIZE (RTAS_WORK_AREA_SIZE * 16)
>>
>> This is still 64K but no clarity why. There is 16 of something, what
>> is it?
> 
> There are 16 4KB work areas in the region. I can name it
> RTAS_NR_USER_WORK_AREAS or similar.


Why 16? PAPR (then add "per PAPR") or we just like 16 ("should be enough")?


-- 
Alexey
