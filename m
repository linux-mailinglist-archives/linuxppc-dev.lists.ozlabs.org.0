Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9181A3464FB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 17:24:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4cBZ4g6Mz30JV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Mar 2021 03:24:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel-dk.20150623.gappssmtp.com header.i=@kernel-dk.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=WGtYCALb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.dk (client-ip=2607:f8b0:4864:20::12b;
 helo=mail-il1-x12b.google.com; envelope-from=axboe@kernel.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel-dk.20150623.gappssmtp.com
 header.i=@kernel-dk.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=WGtYCALb; dkim-atps=neutral
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4cB71Pxyz30Fd
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Mar 2021 03:23:40 +1100 (AEDT)
Received: by mail-il1-x12b.google.com with SMTP id z9so18649943ilb.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 09:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rWh3AKi5SFPZYfzTilgKq/RJwaJMU4SjT7+h6/AuhnI=;
 b=WGtYCALbmPj3DX9JRJyoxXSZACk/il6nthYFGpEHryoq58Ih91nCA5mA4oViGDLmP6
 5cr3PyMALQT4sZKcYkJtInrtdDEY0vUOS9b6Pqk2KUUov47fzc2aA05wYWPektI1STWM
 KJLgJEtmNrFJu/BOzAKT0yPfKVhkt3tj7oE1uG4xYinbkUko0yeweeVobEkuW8blVEWS
 eTuZ04ThCZCe2puzBxMTGDz3FFw2cFZca6IKEoq8YycSoZrHDy6sOaSYd63aaLe9tEVq
 pcTD0p24+UkvCJQPdohsXJMh+nVSVzHsAGkyDs5NrAHe5x/9z/k42Qw5l0cmBqBwPwjl
 xfkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rWh3AKi5SFPZYfzTilgKq/RJwaJMU4SjT7+h6/AuhnI=;
 b=IZjeS2QzQSMGZxdbBvK85smyIIoeeZ8zzwLXxkbXltaM9aDo7fEANfGD02EehHssB7
 KP6QB+Xh0saqpC7E/cjI2AlO/EHheWSDPzZSO8BmnfnWFcyqCSpeEvYQU+1uATnKPu+U
 Ss5PEnnBTrehHxWyn7PYJz/aOA8aNUl5Px3/ZCEYj2hSciyMEYKLWkPkFZfy98sYIlH1
 jjERjvXtSYWQtTtbwx1spgmyAnpGITZYhj9SmfpV6r71npTPt6Nu7qOqbUCMckXAJanq
 QAk3q87wJ/fitVc+Q5kw6l1OomCsePsX6n8lAjX0il+3h4cdm83WzxithST//y+c42wr
 IphA==
X-Gm-Message-State: AOAM530B3Z+vMWbiIbX8oklexSM5MiHtMfnec2RipgyieWw3b5ppsTV2
 yuz4VtfLiA7CAbVGFTpl0gjMMiivPUbmdQ==
X-Google-Smtp-Source: ABdhPJwouPug3WEYGZOba12nsSNtkNanniEIp80Dp4dSxD6i3FNNVXc6j63VH4CZUlecYnMGaTAC9A==
X-Received: by 2002:a92:7d0d:: with SMTP id y13mr5652853ilc.269.1616516617058; 
 Tue, 23 Mar 2021 09:23:37 -0700 (PDT)
Received: from [192.168.1.30] ([65.144.74.34])
 by smtp.gmail.com with ESMTPSA id h15sm9729695ils.73.2021.03.23.09.23.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Mar 2021 09:23:36 -0700 (PDT)
Subject: Re: [PATCH] xsysace: Remove SYSACE driver
To: Davidlohr Bueso <dave@stgolabs.net>, Michal Simek <michal.simek@xilinx.com>
References: <ee1fe969905f641f5f97d812ee0cac44c12fe0f6.1604919578.git.michal.simek@xilinx.com>
 <20210323000436.qm5rkiplwt5x5ttk@offworld>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <6948510c-dc7e-d74a-62e3-e42be14cff16@kernel.dk>
Date: Tue, 23 Mar 2021 10:23:35 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210323000436.qm5rkiplwt5x5ttk@offworld>
Content-Type: text/plain; charset=utf-8
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
Cc: devicetree@vger.kernel.org, monstr@monstr.eu,
 YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-block@vger.kernel.org,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Paul Mackerras <paulus@samba.org>, git@xilinx.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/22/21 6:04 PM, Davidlohr Bueso wrote:
> Hi,
> 
> On Mon, 09 Nov 2020, Michal Simek wrote:
> 
>> Sysace IP is no longer used on Xilinx PowerPC 405/440 and Microblaze
>> systems. The driver is not regularly tested and very likely not working for
>> quite a long time that's why remove it.
> 
> Is there a reason this patch was never merged? can the driver be
> removed? I ran into this as a potential tasklet user that can be
> replaced/removed.

I'd be happy to merge it for 5.13.

-- 
Jens Axboe

