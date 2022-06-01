Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF63539BAD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jun 2022 05:30:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LCZRd1fMRz3bsm
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jun 2022 13:30:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=o7fy97Kr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=bagasdotme@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=o7fy97Kr;
	dkim-atps=neutral
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LCZR16BBnz2yXP
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Jun 2022 13:30:20 +1000 (AEST)
Received: by mail-pf1-x42f.google.com with SMTP id 187so741965pfu.9
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 May 2022 20:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=wQyOKXM080NRb5rkPS2JjMh5+vUrsNfZv5lXjOTUDQM=;
        b=o7fy97KrDewf96diuqDBX0YwiRpBZua1iIeGC/NVulLIx+FYc/mUQvucPm7/jsN8QK
         g3mbdlXssLSpBMJmDUr53a1v1lseEXAXQjnwwm3JVpTC7myXb1woIB6hLksknsqOWXUH
         OCt8OfnXNZkYjPzHgfekS8dVaKKkr41XKys6TBZ4fIau70A1kApBlWS+ZGxJRgzHlCB1
         vxAIADPsK5a7GDBN3vImEZDn9oTOoZy6/L5do5FKhAhNVjMcQDMDv0OZ3pQwytlvM4P3
         fEKO8vf15SJ+qjUOFvpIRjpw+e+F4AewgJKn8rel57wQEzR2zFJXe7BDCAm37fJPU4ch
         z9bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=wQyOKXM080NRb5rkPS2JjMh5+vUrsNfZv5lXjOTUDQM=;
        b=490tacELB9Mb2xrNe3GnISS/NRoP9Opx361w+fNhQJ15J1RMqi90iwHKnvebmR6D2W
         KfUM8IjnTKcJ/wRIDzWhW4MQxMSrv8bliTprrT5g1/Lg8K3483KYnFmiJ/wMqg6IpVlb
         lgM1ocUTm3Xxi6Ez4jOndrtjSMuHOae0EyWfDvpbohZhm31UTY0vUYC+NZrHjPRWGfUp
         FiaGtKpWIq9H0rv+SrDhMGV9D2ZPSk4o+MI79I7TKZ0Ky4LY4sLaVv+J4pbgVTbhJu91
         gpTrp2a9CFMXwoZLcF1cHTV/OcibzYVWQl2JBP5TDbxqcjHQGUNR5LYGcHMBEaY/iCdt
         Mfxw==
X-Gm-Message-State: AOAM5312ZeguCuIlX3GDha4vWAj1BXXaIhQcsJSP6SobGpRyjf56q6ki
	Cx6nhYXGG0jCNv3wziM7zhM=
X-Google-Smtp-Source: ABdhPJyvK+9GA9A2ofdRcBz1cml0yuCdHczwuAAYoiE1ioa9by+n7ytenYufgWlJJhrzZAl8NvZ0Fw==
X-Received: by 2002:a63:1153:0:b0:3fb:10da:6277 with SMTP id 19-20020a631153000000b003fb10da6277mr25435617pgr.345.1654054218510;
        Tue, 31 May 2022 20:30:18 -0700 (PDT)
Received: from [192.168.43.80] (subs03-180-214-233-86.three.co.id. [180.214.233.86])
        by smtp.gmail.com with ESMTPSA id s18-20020aa78d52000000b0050dc76281fdsm188673pfe.215.2022.05.31.20.30.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 May 2022 20:30:17 -0700 (PDT)
Message-ID: <a759a960-9402-8c7e-92d7-4000d1ffb621@gmail.com>
Date: Wed, 1 Jun 2022 10:30:15 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] powerpc/64: Drop ppc_inst_as_str()
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>
References: <20220531065936.3674348-1-mpe@ellerman.id.au>
 <YpbW6fNSGx6s9yJ+@debian.me>
In-Reply-To: <YpbW6fNSGx6s9yJ+@debian.me>
Content-Type: text/plain; charset=UTF-8
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
Cc: jniethe5@gmail.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/1/22 10:03, Bagas Sanjaya wrote:
>>
>> Reported-by: Bagas Sanjaya <bagasdotme@gmail.com>
>> Reported-by: Petr Mladek <pmladek@suse.com>
>> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> 
> The arch/powerpc/kernel/trace/ftrace.c builds successfully, however
> there is also other build error for which I have reported at [1].
> 
> Thanks.
> 
> Tested-by: Bagas Sanjaya <bagasdotme@gmail.com>
> 
> [1]: https://lore.kernel.org/linuxppc-dev/YpbUcPrm61RLIiZF@debian.me/
> 

Oops, I forget to mention: is this patch meant for backporting into
stable tree? I don't see Fixes: tag and Cc: stable@vger.kernel.org
in the patch.

-- 
An old man doll... just what I always wanted! - Clara
