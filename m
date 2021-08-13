Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D74863EAFCE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Aug 2021 07:54:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GmCS05B21z3cTX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Aug 2021 15:54:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.128.50; helo=mail-wm1-f50.google.com;
 envelope-from=jirislaby@gmail.com; receiver=<UNKNOWN>)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GmCRX5gVwz2yXf
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Aug 2021 15:53:58 +1000 (AEST)
Received: by mail-wm1-f50.google.com with SMTP id
 k5-20020a05600c1c85b02902e699a4d20cso6155984wms.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Aug 2021 22:53:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kDicGygeeiPHvZ/oC8eypBw+MyBw86cziX0DHpCxNAc=;
 b=FU2y2j/FoAR5wpYs3EfLf5vz341S2R9qT8f0+zTm5Dw8w7Ia6ZX4RCEb4Gw6ecXUit
 q4tcH+hWviPPF9/zNU+/+ObKGBgQvf4eJPnSl9usT9s4fgQd03i8o0V1XTS4Q5Rr7eEG
 9+9Tda57D3WWJr1CuEWUjN4F/hYxWMqEyw72gGf5+wsYGpfgrVKnbsk1PIgS1h/Qs5WJ
 Qfc4bKWzYXxW6VThNGeWYwPZ8W7lXHu8h8dVLCmMwcT2kShVKJDE0gKgI67Aof/ntI78
 nZlaz+KzbW8SYo00S9fmzzBiACs9rFNhVnED+9MiDqlBBBtsjO5k2Tz5RP/u3738ADU2
 kcow==
X-Gm-Message-State: AOAM53163yvnm41ft4c/JZMpg+WAaSwDbCf0u3GQwm/7bAS9PWyOw4DP
 YPmWhDuVTP7sSySRyI7xClA=
X-Google-Smtp-Source: ABdhPJy8wAfKyM+oLt0Q9y4Hp5Drbt085CfMeHVfhn6+xq33iBgJferYKQ07teGjmNfJzUb9YyPx7g==
X-Received: by 2002:a7b:c399:: with SMTP id s25mr917659wmj.180.1628834033697; 
 Thu, 12 Aug 2021 22:53:53 -0700 (PDT)
Received: from ?IPv6:2a0b:e7c0:0:107::49? ([2a0b:e7c0:0:107::49])
 by smtp.gmail.com with ESMTPSA id l7sm388877wmj.9.2021.08.12.22.53.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Aug 2021 22:53:52 -0700 (PDT)
Subject: Re: [PATCH v6 1/2] tty: hvc: pass DMA capable memory to put_chars()
To: kernel test robot <lkp@intel.com>,
 Xianting Tian <xianting.tian@linux.alibaba.com>, gregkh@linuxfoundation.org,
 amit@kernel.org, arnd@arndb.de, osandov@fb.com
References: <20210812094532.145497-2-xianting.tian@linux.alibaba.com>
 <202108122040.lBf24DNp-lkp@intel.com>
From: Jiri Slaby <jirislaby@kernel.org>
Message-ID: <0c808001-7643-fdcf-66ba-738654ec0c21@kernel.org>
Date: Fri, 13 Aug 2021 07:53:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <202108122040.lBf24DNp-lkp@intel.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
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
Cc: clang-built-linux@googlegroups.com, kbuild-all@lists.01.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On 12. 08. 21, 14:26, kernel test robot wrote:
>>> drivers/tty/hvc/hvc_console.c:190:26: warning: variable 'hp' is uninitialized when used here [-Wuninitialized]
>             spin_unlock_irqrestore(&hp->c_lock, flags);
>                                     ^~
>     drivers/tty/hvc/hvc_console.c:149:23: note: initialize the variable 'hp' to silence this warning
>             struct hvc_struct *hp;
>                                  ^
>                                   = NULL

So you clearly didn't test your change as it would crash quite 
instantly. I wonder, where do you intend to get hp from in the 
console::print() hook?

thanks,
-- 
js
suse labs
