Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2052055F248
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 02:15:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXhnF6g88z3c7P
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 10:15:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=dzzx4WtX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=schmitzmic@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=dzzx4WtX;
	dkim-atps=neutral
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXhmc6W3Tz3c7K
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jun 2022 10:14:54 +1000 (AEST)
Received: by mail-pl1-x62f.google.com with SMTP id d5so12487562plo.12
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jun 2022 17:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=05ASLe35KlS/635AYkr9ttdQBevoBXGVkR7t9AbxzS8=;
        b=dzzx4WtXS/WkHpvykE0Ug4pI7IQoDYpxYcwT22eGTgXydtRyVau06KToMULz4WZ85p
         grc9sV1BmBI096bjPV6AYIg+FD5hBe5gj3092gLAqIoDR6Usno3qkCUxW0him8f4Kt+7
         5Uf02V1S6CU9QXgRzjHroyahVKDiR/lHNsV044fz9JWOwGa1zg1AbzobwrAmZjbW8zFF
         NJWZj5bNSbN92/C5/1fpmT4IbOePFpLv8AN2psJq3YvTqAwnlZ6jrlyHQy1YHFlzFM4V
         6GGIoWoQqCmV+YlWQVYdo/a8/uHvejllTjqLg43Sy9OxgGuiI2LvtGtvLWOWEwxpHjVI
         SvDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=05ASLe35KlS/635AYkr9ttdQBevoBXGVkR7t9AbxzS8=;
        b=LlSszvhb6HwvA3L5qJTIO9EIj4msechSZvKvAwKweJDxpwWgEzJzUWEoU+CCZ+M9N0
         GXLM7TMOmC4WUZzgTHTVWWiz4chzdv5YL3uKEFdH5uPYC6Hqq6E7aG+kh1N3XNK+qAni
         NQI38JexPuwlluelyXlXQW0bcmxnBwE4BbaWdUYzO7pEUClRonlTVlQpP3NykgsGX7Py
         QNSaYWlq/PbvVQ3iOgdTbFDLf9F+zOv+HkSq6Ps2PLSSV/+x3oOZ9mXZMH1526S6gBU4
         G/Ntf5C4oqwMCVp3msVIuTB5pTBrwmVgI3t0Tszn8usaMCLk9bWVmx6l096SxU3T0QO2
         U80A==
X-Gm-Message-State: AJIora8U/llbavl4Pk+B8eeHJ08H+9EMIU1k3j/nsDvdjnX9UPAgTigu
	NP9aUp/cqQ4b4Oo4VYMzWxY=
X-Google-Smtp-Source: AGRyM1s6BvhKknOd3DGT0QQr5uB83fgcSZ645ndGItCzAFy4UPsuv2Gt9Oy4n8CrGTj/IyliMMkT6Q==
X-Received: by 2002:a17:903:240e:b0:168:ea13:f9e0 with SMTP id e14-20020a170903240e00b00168ea13f9e0mr7684101plo.6.1656461692074;
        Tue, 28 Jun 2022 17:14:52 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:75aa:d6ca:4354:6033? ([2001:df0:0:200c:75aa:d6ca:4354:6033])
        by smtp.gmail.com with ESMTPSA id c13-20020a170902c1cd00b0016a276aada7sm9950167plc.20.2022.06.28.17.14.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jun 2022 17:14:51 -0700 (PDT)
Message-ID: <2402062b-aae6-a247-06a8-3775c2909bdb@gmail.com>
Date: Wed, 29 Jun 2022 12:14:42 +1200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 3/3] arch/*/: remove CONFIG_VIRT_TO_BUS
Content-Language: en-US
From: Michael Schmitz <schmitzmic@gmail.com>
To: Bart Van Assche <bvanassche@acm.org>, Arnd Bergmann <arnd@kernel.org>
References: <20220617125750.728590-1-arnd@kernel.org>
 <20220617125750.728590-4-arnd@kernel.org>
 <6ba86afe-bf9f-1aca-7af1-d0d348d75ffc@gmail.com>
 <CAMuHMdVewn0OYA9oJfStk0-+vCKAUou+4Mvd5H2kmrSks1p5jg@mail.gmail.com>
 <b4e5a1c9-e375-63fb-ec7c-abb7384a6d59@gmail.com>
 <9289fd82-285c-035f-5355-4d70ce4f87b0@gmail.com>
 <CAMuHMdXUihTPD9A9hs__Xr2ErfOqkZ5KgCHqm+9HvRf39uS5kA@mail.gmail.com>
 <c30bc9b6-6ccd-8856-dc6b-4e16450dad6f@gmail.com>
 <CAK8P3a1rxEVwVF5U-PO6pQkfURU5Tro1Qp8SPUfHEV9jjWOmCQ@mail.gmail.com>
 <9f812d3d-0fcd-46e6-6d7e-6d4bf66f24ab@gmail.com>
 <fc47e8da-81d3-e563-0a17-4eb23db015cc@acm.org>
 <859c2adc-d3cb-64e8-faba-06e1ac5eddaf@gmail.com>
In-Reply-To: <859c2adc-d3cb-64e8-faba-06e1ac5eddaf@gmail.com>
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
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Linux-Arch <linux-arch@vger.kernel.org>, scsi <linux-scsi@vger.kernel.org>, Christoph Hellwig <hch@infradead.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Jakub Kicinski <kuba@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Denis Efremov <efremov@linux.com>, linux-m68k <linux-m68k@lists.linux-m68k.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Khalid Aziz <khalid@gonehiking.org>, Miquel van Smoorenburg <mikevs@xs4all.net>, Parisc List <linux-parisc@vger.kernel.org>, Robin Murphy <robin.murphy@arm.com>, Matt Wang <wwentao@vmware.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mark Salyzyn <salyzyn@android.com>, Linux IOMMU <iommu@lists.linux-foundation.org>, alpha <linux-alpha@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "Maciej W . Rozycki" <macro@orcam.me.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Bart,

On 29/06/22 12:01, Michael Schmitz wrote:
>
>> An example of a user space application that passes an SG I/O data 
>> buffer to the kernel that is aligned to a four byte boundary but not 
>> to an eight byte boundary if the -s (scattered) command line option 
>> is used: 
>> https://github.com/osandov/blktests/blob/master/src/discontiguous-io.cpp
>
> Thanks - four byte alignment actually wouldn't be an issue for me. 
> It's two byte or smaller that would trip up the SCSI DMA.
>
> While I'm sure such an even more pathological test case could be 
> written, I was rather worried about st.c and sr.c input ...
Nevermind - I just see m68k defines ARCH_DMA_MINALIGN to be four bytes. 
Should be safe for all that matters, then.

Cheers,

     Michael


