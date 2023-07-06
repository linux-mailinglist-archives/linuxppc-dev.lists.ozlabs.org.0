Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2D87496D0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 09:51:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=pZJlJ0lh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxTJ967ZWz3c51
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 17:51:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=pZJlJ0lh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=jniethe5@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QxTHH1fnwz2yyX
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jul 2023 17:51:06 +1000 (AEST)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1b8ad8383faso2178485ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Jul 2023 00:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688629863; x=1691221863;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QhmbPLkoVnQhuhvNhVkHDTHyTpdp4PNjj/xlZtzICCA=;
        b=pZJlJ0lhz4RO8QoDrWADXtr8A5uaqPG0cwNebZMTSJRHlc338zrRGHFo3MIorFa2tQ
         oq6MlKfAlG8KZ60E/115YlDf0YYqa4FJzW+ggBF+IfVqyzKcsWvhIlOtly2TXdIAtZIC
         kQJ1mkIGoR3h9cWBkekYbDH7W1yTJaNw4IgML0FxAYY5e+Sw5eu+aMhdo/Ihcj/IhGkL
         c5t+jlYZ2/9vc3tgLabzRqijUCaQebkqOnX1LXdznIo7jHagMovL4z991lH/lpNQ3sYZ
         gkx7jmNwWPYxk5o9hpenRu5awvq/1Ifiy+KXJm5Q/c8apaSwVDVCHTajkHdmZ8HPJOpA
         06jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688629863; x=1691221863;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QhmbPLkoVnQhuhvNhVkHDTHyTpdp4PNjj/xlZtzICCA=;
        b=fBknktigWva6ozkgS/fRf61qgPLrDZWuEstQJgefMC67NVTSnv8g+CuQLecLMJDmAj
         aNK1t/9/7jd/Aoev1v8f7Mggc2Pu6oLIp92fFLPsIM38OI3R9bdW63i7RTxsOZAa1zFN
         Gy4I5tkC2FOdmW+zocFw8oL5k50NjuA2gv+lLmGhkDSNC6iPfkDtnVOebcBRQJ/1jKWd
         kmrc/So3jEcA0gItn4uugsvv3NrYtcBWqNpgf4xYDFNtQzJVDui7xSmzYWNnTxoWf0qN
         UwYFSv9ovcomPeni4SnrimuuVP2eyPg1nAqaUDQOM2R5tcu163oIltPCdD5N2gcWxLRk
         WEcg==
X-Gm-Message-State: ABy/qLajW++rgV02XfJpp+6b4U1vZ3j2FUyhs/PTmwknsPd5ojRtl3y1
	JkUSqHo7XTx3rLh6/P1A6xg=
X-Google-Smtp-Source: APBJJlHczXf/MN0VAPTai+IfIcf2/+/D8hnfRWRFIWPZptyNQl2VwFGl9sZr3ln/+QTcnNrzEnEylg==
X-Received: by 2002:a17:902:f7d3:b0:1b8:b73d:a75b with SMTP id h19-20020a170902f7d300b001b8b73da75bmr1127393plw.44.1688629863140;
        Thu, 06 Jul 2023 00:51:03 -0700 (PDT)
Received: from localhost-live.default (110-175-254-242.static.tpgi.com.au. [110.175.254.242])
        by smtp.gmail.com with ESMTPSA id g5-20020a1709026b4500b001b027221393sm750161plt.43.2023.07.06.00.51.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jul 2023 00:51:02 -0700 (PDT)
Subject: Re: [PATCH] arch/powerpc: Remove unnecessary endian conversion code
 in XICS
To: Gautam Menghani <gautam@linux.ibm.com>, mpe@ellerman.id.au,
 npiggin@gmail.com, christophe.leroy@csgroup.eu
References: <20230630055628.17790-1-gautam@linux.ibm.com>
From: Jordan Niethe <jniethe5@gmail.com>
Message-ID: <39920b0f-f261-8417-af7a-eef791ad5726@gmail.com>
Date: Thu, 6 Jul 2023 17:50:57 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20230630055628.17790-1-gautam@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 30/6/23 3:56 pm, Gautam Menghani wrote:
> Remove an unnecessary piece of code that does an endianness conversion but
> does not use the result. The following warning was reported by Clang's
> static analyzer:
> 
> arch/powerpc/sysdev/xics/ics-opal.c:114:2: warning: Value stored to
> 'server' is never read [deadcode.DeadStores]
>          server = be16_to_cpu(oserver);
> 
> As the result of endianness conversion is never used, delete the line
> and fix the warning.
> 
> Signed-off-by: Gautam Menghani <gautam@linux.ibm.com>

'server' was used as a parameter to opal_get_xive() in commit 
5c7c1e9444d8 ("powerpc/powernv: Add OPAL ICS backend") when it was 
introduced. 'server' was also used in an error message for the call to 
opal_get_xive().

'server' was always later set by a call to ics_opal_mangle_server() 
before being used.

Commit bf8e0f891a32 ("powerpc/powernv: Fix endian issues in OPAL ICS 
backend") used a new variable 'oserver' as the parameter to 
opal_get_xive() instead of 'server' for endian correctness. It also 
removed 'server' from the error message for the call to opal_get_xive().

It was commit bf8e0f891a32 that added the unnecessary conversion and 
never used the result.

Reviewed-by: Jordan Niethe <jniethe5@gmail.com>


> ---
>   arch/powerpc/sysdev/xics/ics-opal.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/arch/powerpc/sysdev/xics/ics-opal.c b/arch/powerpc/sysdev/xics/ics-opal.c
> index 6cfbb4fac7fb..5fe73dabab79 100644
> --- a/arch/powerpc/sysdev/xics/ics-opal.c
> +++ b/arch/powerpc/sysdev/xics/ics-opal.c
> @@ -111,7 +111,6 @@ static int ics_opal_set_affinity(struct irq_data *d,
>   		       __func__, d->irq, hw_irq, rc);
>   		return -1;
>   	}
> -	server = be16_to_cpu(oserver);
>   
>   	wanted_server = xics_get_irq_server(d->irq, cpumask, 1);
>   	if (wanted_server < 0) {
> 
