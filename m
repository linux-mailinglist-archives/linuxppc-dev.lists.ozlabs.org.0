Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D88590E07
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Aug 2022 11:28:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M3yym38Pmz3c0g
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Aug 2022 19:28:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=oCrlkqT6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com; envelope-from=chenzhuo.1@bytedance.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=oCrlkqT6;
	dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M3yy62LPCz2xmn
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Aug 2022 19:27:40 +1000 (AEST)
Received: by mail-pj1-x102f.google.com with SMTP id o3-20020a17090a0a0300b001f7649cd317so7871517pjo.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Aug 2022 02:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=LzSEVyCY0rVcjjfGUaDS5CrDNhUakD7W6pkaedXCK3M=;
        b=oCrlkqT6QEgaGNjRK3uXf1a3edsqWHkyeNSIJ7B7AZlUTVJz0vJFXLsg9PDYbD9PQ0
         zPYv1dWvc67zKrHY/O4Ygj/axQvYTd04weKewgFQMty1Cc6yHY/GNr/nyP/EKngQqiZE
         d4vAKaJ5seUIQ9hdGKGurZYmfi0quA8+aAycI0/Ey5IAHd8U6jVOI9k5Fyn8YEhAy1zE
         soaKHveguOvXckf/kra51veFM0eD0MOAAh2ijzPHM1lvVvmziI+irgm7o8pARCPtr3He
         YFI0j7nwHc2TYI8YDmi2DajVxRC52TVYVjzly0wie+KkstHxh5ooH1chAZ6GAOW9p242
         7o5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=LzSEVyCY0rVcjjfGUaDS5CrDNhUakD7W6pkaedXCK3M=;
        b=HjP82psz+1XHhP7fhdmqsR0SW2K3OgRbWy4iVTCaYnLUliRe1npxz9Zy4995AHsQuy
         kmwT2ywxQLVooeE5tE7PRaQ49KKHHFiIeyj9h5VWa8U+932Yn3KaUaHQVL0HjC8I/Hp2
         3HBuoStsyFWzuEf39PL8ZzycS0ZRW+0++pEaBOdxkCuPc9nSIUzTtEYTDTWBEeH1+5Lb
         WMPnpQPqB9Sy9ix6IszdqzpwlytOKHGJu1m5nlWVF8kF1a8n9OeKL0tztB7E/7JF3q0R
         CQP4ZQGad2nCZkxPGCcEHJ2QwWpeeln3OWOok6vdXgX57Kq5RhLGEtGQowKiJMRjaYat
         O0Pw==
X-Gm-Message-State: ACgBeo2BonwawWVokhrU2aulZCoYVaQkohIF8i02F05x2AAZ3JV3W0WJ
	vH3gLhFwqcrlj8qdq0iZd1cUrw==
X-Google-Smtp-Source: AA6agR548JNzF0k/wghBss2w8gS+i/8K9JWBwwU3cusnYsQeQ9eKg4O8qjzNC9Jjm3/R7fWU64098A==
X-Received: by 2002:a17:903:11cf:b0:171:afc7:8936 with SMTP id q15-20020a17090311cf00b00171afc78936mr1017395plh.95.1660296455618;
        Fri, 12 Aug 2022 02:27:35 -0700 (PDT)
Received: from [10.2.223.68] ([61.120.150.75])
        by smtp.gmail.com with ESMTPSA id w3-20020a170902d10300b0016d9b94ddfasm1181771plw.145.2022.08.12.02.27.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Aug 2022 02:27:35 -0700 (PDT)
Message-ID: <1e24242e-bb37-e15f-906a-abe5cd865a98@bytedance.com>
Date: Fri, 12 Aug 2022 17:27:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.0
Subject: Re: [External] Re: [PATCH v3] PCI/ERR: Use pcie_aer_is_native() to
 judge whether OS owns AER
Content-Language: en-US
To: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
References: <20220727035334.9997-1-chenzhuo.1@bytedance.com>
 <b5c746db-f6a0-d89e-6db5-e4a206c9237a@linux.intel.com>
 <cfd44d9c-453b-e498-2630-9057947cf3cd@bytedance.com>
 <b54b068b-fe9a-8609-3e9f-170579affc27@bytedance.com>
 <6056c6cc-9861-9c29-8e36-48e0dd36c702@linux.intel.com>
From: Zhuo Chen <chenzhuo.1@bytedance.com>
In-Reply-To: <6056c6cc-9861-9c29-8e36-48e0dd36c702@linux.intel.com>
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
Cc: jan.kiszka@siemens.com, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, lukas@wunner.de, oohall@gmail.com, stuart.w.hayes@gmail.com, bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 8/3/22 6:18 AM, Sathyanarayanan Kuppuswamy wrote:
> 
> 
> On 7/27/22 2:37 AM, Zhuo Chen wrote:
>>>
>> Do you mean changing "if ((host->native_aer || pcie_ports_native) && aer)" into "if (pcie_aer_is_native(dev) && aer)" ?
>> I thought changing into "if (pcie_aer_is_native(dev))" before.
>>
>> One another doubt. Not every pci device support aer. When dev->aer_cap is NULL and root->aer_cap is not NULL in aer_root_reset(), pcie_aer_is_native() will return false and OS cannot operate root register. It's different from just using "(host->native_aer || pcie_ports_native)".
>>
>> Or we can change "if ((host->native_aer || pcie_ports_native) && aer)" into "if (pcie_aer_is_native(root))". But in this way, argument NULL pointer check should be added in pcie_aer_is_native().
> 
> Looking into it again, I think it is better to leave it as it is. Please ignore my comment.
> 

Thanks! Is there anything else to improve and what's next for
the patch v3 ?

-- 
Thanks,
Zhuo Chen
