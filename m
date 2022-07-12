Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DF37D57102F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jul 2022 04:28:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lhl6F5k4Gz3c2D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jul 2022 12:28:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ozlabs-ru.20210112.gappssmtp.com header.i=@ozlabs-ru.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=FOgGspso;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com; envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ozlabs-ru.20210112.gappssmtp.com header.i=@ozlabs-ru.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=FOgGspso;
	dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lhl5b14pzz3brk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Jul 2022 12:27:27 +1000 (AEST)
Received: by mail-pj1-x1030.google.com with SMTP id fz10so6391297pjb.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Jul 2022 19:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ozlabs-ru.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=aZB3UGhgPcDW1xV3kcl8kwXBo405C0t8FD0AZJD9BPE=;
        b=FOgGspsoBmU9j5Y9NmWK0vgVrEvFYwYk83edHfZHMIXqyKE6c0upC2vWfBw27zveUV
         vvXAl6YuNf3vYqsn7BtvNOHA5zuIUcwQPHneit6IdDDLOk0QTrVSCXRxXmqp6e0SxO9J
         qv751qwBjSkkIH9/6zm/NqfhoNjGadD+3c9SToEaa3cnZRlHuiduMRrftxN1Y/KcyLbn
         Qxs4PQoyuIOfqHYnhZ/cnT56JfJG3nDVmGEikAMJaWR6+74RDOqHombWs7odOl7XmFCm
         NvB9LWUQj89CwEJOOfVwHQwgaJvgRLOMZVwRzD8ZnsFTVsqbYQfuclB3O07Iu2Mh3rgQ
         RLbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=aZB3UGhgPcDW1xV3kcl8kwXBo405C0t8FD0AZJD9BPE=;
        b=QX2zlg/mJHsVREfrCnAs00d6heCfz/6K1odA6eKA9PsmaakSlpQu2UJAsWXXLg9PN0
         Ig3YjiRcBF4zWNbMLFeu9CBjnsrQ+ecYKAAJbiUAxhfFI1LbNcqMBOHOEQm0FO1O3IRr
         d1bDXWMKk7lgWVmmAyhCiamRvl0pD4c4ckli62e9dyJf1KDzYD9e+G3mOD1JuHkZ1k16
         7+wfXdIhacX328F0lvFUNUek7FjCWU81Ruo+2eKIAMTcbWhGcXdLI9TCWZNSVhkijghF
         FMjwvmLrFZi6N4HBvVQXRK+etMASXiqwSVFD58tJncws+izJuBplZ1ML0PCEEB3kulYz
         V+WA==
X-Gm-Message-State: AJIora/KXFBBvwrD1/RX8xOpsRvmm5gMguWe6HzQyk/gDV2TTLFC2J6/
	V8t08lS7UiIXaY6IXVqZKuyeUw==
X-Google-Smtp-Source: AGRyM1sD9tHZyJixe85jL9snzEsUc0wIr1LqiIXQCwAcr3ekxqscZ41QdpY1hOTPrKnVI5X8+XXKrA==
X-Received: by 2002:a17:902:d48a:b0:16b:f0be:4e15 with SMTP id c10-20020a170902d48a00b0016bf0be4e15mr21573742plg.155.1657592845557;
        Mon, 11 Jul 2022 19:27:25 -0700 (PDT)
Received: from [10.61.2.177] (110-175-254-242.static.tpgi.com.au. [110.175.254.242])
        by smtp.gmail.com with ESMTPSA id mr2-20020a17090b238200b001ef8912f763sm5486466pjb.7.2022.07.11.19.27.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Jul 2022 19:27:24 -0700 (PDT)
Message-ID: <b39583f2-e054-8fc7-430c-d52bf6ed5016@ozlabs.ru>
Date: Tue, 12 Jul 2022 12:27:17 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:103.0) Gecko/20100101
 Thunderbird/103.0
Subject: Re: [PATCH kernel] powerpc/iommu: Add iommu_ops to report
 capabilities and allow blocking domains
Content-Language: en-US
To: Jason Gunthorpe <jgg@nvidia.com>
References: <20220707135552.3688927-1-aik@ozlabs.ru>
 <20220707151002.GB1705032@nvidia.com>
 <bb8f4c93-6cbc-0106-d4c1-1f3c0751fbba@ozlabs.ru>
 <bbe29694-66a3-275b-5a79-71237ad7388f@ozlabs.ru>
 <20220708115522.GD1705032@nvidia.com>
 <8329c51a-601e-0d93-41b4-2eb8524c9bcb@ozlabs.ru>
 <Yspx307fxRXT67XG@nvidia.com>
 <861e8bd1-9f04-2323-9b39-d1b46bf99711@ozlabs.ru>
 <64bc8c04-2162-2e4b-6556-03b9dde051e2@ozlabs.ru>
 <YsxwDTBLxyo5W3uQ@nvidia.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <YsxwDTBLxyo5W3uQ@nvidia.com>
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
Cc: Joerg Roedel <jroedel@suse.de>, kvm@vger.kernel.org, Fabiano Rosas <farosas@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Daniel Henrique Barboza <danielhb413@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, Murilo Opsfelder Araujo <muriloo@linux.ibm.com>, kvm-ppc@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>, Oliver O'Halloran <oohall@gmail.com>, Joel Stanley <joel@jms.id.au>, Robin Murphy <robin.murphy@arm.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 7/12/22 04:46, Jason Gunthorpe wrote:
> On Mon, Jul 11, 2022 at 11:24:32PM +1000, Alexey Kardashevskiy wrote:
> 
>> I really think that for 5.19 we should really move this blocked domain
>> business to Type1 like this:
>>
>> https://github.com/aik/linux/commit/96f80c8db03b181398ad355f6f90e574c3ada4bf
> 
> This creates the same security bug for power we are discussing here. If you

How so? attach_dev() on power makes uninitalizes DMA setup for the group 
on the hardware level, any other DMA user won't be able to initiate DMA.


> don't want to fix it then lets just merge this iommu_ops patch as is rather than
> mangle the core code.

The core code should not be assuming iommu_ops != NULL, Type1 should, I 
thought it is the whole point of having Type1, why is not it the case 
anymore?


-- 
Alexey
