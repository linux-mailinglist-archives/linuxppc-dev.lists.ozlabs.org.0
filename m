Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C7F261117
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Sep 2020 14:09:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bm3pm12lGzDqSh
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Sep 2020 22:09:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=1yr1j8u4; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bm3mT38DPzDqMp
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Sep 2020 22:07:03 +1000 (AEST)
Received: by mail-pj1-x1043.google.com with SMTP id jw11so2027730pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Sep 2020 05:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NIbtG5Q2rIwBLkq2SFzM1e6Kg81Hn9yCTElsdPgvuxo=;
 b=1yr1j8u4/gcbAyilFJAMaPdFd9c7c2Yq23z6glMSzlft8KR2gOYxpGKVgNf69E2HvB
 AY53u00GFZiaAv+JVaMNCLn7T3Pxv5rDdjZxwC6iHRNSsQrmi0qTww0ZWrCdYLRTOggm
 Mk1hTq8RykeMw0duVmiBOn84KRzPUaidI8aIyQEvlFmElIdbgVxoypmyneu1h8g4V9QC
 1brsc95T2+Vj6qHT/RbOoG5CagduWG0Io7ejDmbCM3AL7MgD3/2koXIy0r7eF+RYttOl
 MN0et8MsFoKjotNFoWYGqBS6mEj4uE3m1ZLU9oXKtJfXC1IGicY/vIVd7NjH7juD8A1T
 gyWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NIbtG5Q2rIwBLkq2SFzM1e6Kg81Hn9yCTElsdPgvuxo=;
 b=Vee9PYHH7TyaR9SOecOmDdEpu6TnrD+nEq/c+ZEEToFe84qM8I+lU/UJcTBsyTnfCO
 pWtRquvahIxZy8ZRJyRXoLJ+a+FoY4bekktePFEPxRpn5cUH1nVkELAg8YyAkcmTlcBS
 jJ6nch3sZZJWSX998rvnRhuoaTqqbvJ10fbGCdrh22tV8bSt+kRrOCUVP4CfNRhY5CyZ
 sLYOr9iigTbiu52d+BDgDO52dl5jeQViz/VH61HfuEuFRlae0i7AFucez15oWhCjJB1B
 5JRAgNglNnrUyQrgAK+iosBMyN1yV5ygAy7JuuL2FvZFly0HdUcSXLnuX8VV5LEHKb2r
 F/+w==
X-Gm-Message-State: AOAM5319DJLpZmTPPucSAhX1QDa/287xBGeGy9OpnlqLuy6/ni5Fk9I7
 qQQoDKsoFN7uFQOflRPS64LWHw==
X-Google-Smtp-Source: ABdhPJz111e1vIuWI4BQlP723OOW6ppNywTh0N/m3q/2t02dJRfYq94/p/ArWpWLE/eiOrzNlXq1pQ==
X-Received: by 2002:a17:90a:ca82:: with SMTP id
 y2mr3636033pjt.233.1599566820799; 
 Tue, 08 Sep 2020 05:07:00 -0700 (PDT)
Received: from [192.168.10.94] (124-171-83-152.dyn.iinet.net.au.
 [124.171.83.152])
 by smtp.gmail.com with ESMTPSA id z23sm10913089pfj.177.2020.09.08.05.06.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Sep 2020 05:07:00 -0700 (PDT)
Subject: Re: [PATCH kernel] powerpc/dma: Fix dma_map_ops::get_required_mask
To: Christoph Hellwig <hch@lst.de>
References: <20200908015106.79661-1-aik@ozlabs.ru>
 <20200908054416.GA13585@lst.de>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-ID: <94353228-2262-cfa1-7177-7eed2288ca63@ozlabs.ru>
Date: Tue, 8 Sep 2020 22:06:56 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200908054416.GA13585@lst.de>
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
Cc: Oliver O'Halloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 08/09/2020 15:44, Christoph Hellwig wrote:
> On Tue, Sep 08, 2020 at 11:51:06AM +1000, Alexey Kardashevskiy wrote:
>> What is dma_get_required_mask() for anyway? What "requires" what here?
> 
> Yes, it is a really odd API.  It comes from classic old PCI where
> 64-bit addressing required an additional bus cycle, and various devices
> had different addressing schemes, with the smaller addresses beeing
> more efficient.  So this allows the driver to request the "required"
> addressing mode to address all memory.  "preferred" might be a better
> name as we'll bounce buffer if it isn't met.  I also don't really see
> why a driver would ever want to use it for a modern PCIe device.


a-ha, this makes more sense, thanks. Then I guess we need to revert that 
one bit from yours f1565c24b596, do not we?


-- 
Alexey
