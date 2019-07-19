Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B26A76E205
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2019 09:54:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45qjvS6SxvzDqnc
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2019 17:54:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ozlabs.ru
 (client-ip=2607:f8b0:4864:20::52d; helo=mail-pg1-x52d.google.com;
 envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.b="g0+JAsGA"; 
 dkim-atps=neutral
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45qjsX3fn6zDqnc
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jul 2019 17:52:45 +1000 (AEST)
Received: by mail-pg1-x52d.google.com with SMTP id f25so14086072pgv.10
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jul 2019 00:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PuJN2DBc5sr/5wXIdG/j79dZnQDz6GCJAAYgdTmkZDQ=;
 b=g0+JAsGAxwuUxVw4hDwshiuB5+wu37vpZoZ5p4pzkzHCqTEjyCRWAx2w2CMcPU/P35
 4n/94b5Iyp61YngriWWbIOcpnJRqzAR8gUJLMdEwo2/bBpID4SysnUENtb7KNq/IfjhK
 Yfgum3oSpppP5H+qwzKB4Mk7CpGHIlE+IQ/tON5l23/nKTa6sJlkORUVJ7YGuZqZj0Sj
 63mn0JVPtS9vaATkJmfBafFeJBuei2WwR/Ss97R7/I1K2OQLG3mqTiwSKZOzutBQMa9w
 T1Si804Ahw/4i3AjcKorIlw4255mEqCzHVJ8M6+WH5Jh6svQ/0JruY93sdhPclhODMiI
 q5qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PuJN2DBc5sr/5wXIdG/j79dZnQDz6GCJAAYgdTmkZDQ=;
 b=qBD0jkgW0CURg5C+Wix6e7Mb50s+KoOPraYcDpADbOVLCgIEr1RbcxY/d99aTWhEjQ
 aPnQ6O8y93JUepxHN8AXgIQizW7i7ej+NtP9n+EfzCau4UjfapuNS0TrEjdf37UXCAOU
 qI5CBt9KafsRTm5ZsyIjBKa8KVVzQpjVnKKBi1c3vqCNeeSYU2BEpj5YLdqZfxFWtpEm
 IBZ3r0pMB5YcrBalivlibAJ9R+Yv789KabQHNIHulYMbUUyt7NvyPdTAGq2vcIQa51Hp
 VAPDJvHOrb3wnu6iwEaY3GkBZZAyIx4mAkxMY7Yy/7of0vlOEb9jRoBmPiO9+7/iDZcX
 tvRw==
X-Gm-Message-State: APjAAAXsmH0vXsMVRE73hWVO0SihK8+91MCd7DZGWxFCLh6pDJ8J+CAC
 flrCZFrFx4JUfPjsNPfXW+bgTLYmjc4=
X-Google-Smtp-Source: APXvYqzaA1W+al6v35/1YaUt2NFaOHPQs3cvcu5AZCKIMwJe+THbktOvJYDQxRFqOC1DeUpOXJoVOw==
X-Received: by 2002:a17:90a:35e6:: with SMTP id
 r93mr56578728pjb.20.1563522762169; 
 Fri, 19 Jul 2019 00:52:42 -0700 (PDT)
Received: from [10.61.2.175] ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id g8sm17165649pgk.1.2019.07.19.00.52.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 19 Jul 2019 00:52:41 -0700 (PDT)
Subject: Re: question on "powerpc/pseries/dma: Allow SWIOTLB"
To: Christoph Hellwig <hch@infradead.org>
References: <20190719071014.GA1922@infradead.org>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-ID: <0f969485-a3fe-4436-a448-5f4c4f875cb2@ozlabs.ru>
Date: Fri, 19 Jul 2019 17:52:37 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190719071014.GA1922@infradead.org>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 19/07/2019 17:10, Christoph Hellwig wrote:
> Hey Alexey,
> 
> what is the use case for the above commit?  Shouldn't we handle all
> addressing limits using the iommu?

Our secure VMs is the use case, when only a fraction of system memory is 
available for DMA.


-- 
Alexey
