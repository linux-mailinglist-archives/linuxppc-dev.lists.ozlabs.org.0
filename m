Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 943E042192E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Oct 2021 23:23:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNYbd2r3Qz3bXP
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 08:23:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=YxVu7riC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2607:f8b0:4864:20::d2f;
 helo=mail-io1-xd2f.google.com; envelope-from=skhan@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=google header.b=YxVu7riC; 
 dkim-atps=neutral
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNYZx6BxBz2xsv
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Oct 2021 08:22:31 +1100 (AEDT)
Received: by mail-io1-xd2f.google.com with SMTP id b78so980841iof.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Oct 2021 14:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MuilptXu/lrbHdYIjm49Orq1L38EfLHYhkCQZMQN58Y=;
 b=YxVu7riC7j4LVz42GKgYXGTFCKJqdQPDoBbNgq6DmDMCPYIgq7r0JSZLEMwRUv3grr
 cdiedFdp4r+iNBBN/mXe7pWqYYu2JUV8jVVKsIYViY6+g5jaCREmtkDy07NScmLqvK+S
 JgdZ4x2qrsy/bvSg3+wlyjybySzvvSnkRl7J4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MuilptXu/lrbHdYIjm49Orq1L38EfLHYhkCQZMQN58Y=;
 b=o3gJIq/ZGrpoHxOZsb7xxsoL1Dr+hGfJ/zvJOWXi9RF27LF2IlPcF1ZmwAhUafsfoE
 oen3NO8FfwHCSYeKunyDYXEplm0vYJ5lNiOXZDgiB4SZYnLhRwOX/TNsKvsY2DqV8FQ7
 L+mzOIMa8ejFjkpt28tO6GriQ9c4vI0QJC8S+lmr5ecNH/bQhsyDnG4WVgSg+pqqjQmf
 rgQ+61FY5WtN5FdRkIv0C6TFbbwl67dpwKMNbFUz60HsMxCG6gfC1Y4M3CR5FmuJB+NJ
 akORkPtzxdKDunUOlotAefLfeqAAnyIZOiTjdZyPIOAzqnpn8qaiwGfWxdVsvjAv8I6w
 V4BA==
X-Gm-Message-State: AOAM531+qQlydXbK5HmLsYHdzdRX2bnti31BKQ2kSMJZKBi25eC5LLoL
 iUqG5ZUODuZL4fvSTEfblhAlfw==
X-Google-Smtp-Source: ABdhPJx1RzTfEn170/4xRIBn0Qw7X57+hgrKnGZ4qAFynZArJaATjwdrmMQXQOmPcAV4ahbaG9Xzng==
X-Received: by 2002:a5e:a916:: with SMTP id c22mr10780139iod.211.1633382546674; 
 Mon, 04 Oct 2021 14:22:26 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id v63sm9635481ioe.17.2021.10.04.14.22.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Oct 2021 14:22:26 -0700 (PDT)
Subject: Re: [PATCH v3 1/8] PCI/AER: Remove ID from aer_agent_string[]
To: Naveen Naidu <naveennaidu479@gmail.com>, bhelgaas@google.com,
 ruscur@russell.cc, oohall@gmail.com
References: <cover.1633357368.git.naveennaidu479@gmail.com>
 <b4c5a5005d4549420cf6e86f31a01d3fb2876731.1633357368.git.naveennaidu479@gmail.com>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <a51d90cb-2ffb-8d4e-6097-54d03e6ef693@linuxfoundation.org>
Date: Mon, 4 Oct 2021 15:22:25 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <b4c5a5005d4549420cf6e86f31a01d3fb2876731.1633357368.git.naveennaidu479@gmail.com>
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
Cc: linux-pci@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/4/21 8:29 AM, Naveen Naidu wrote:
> Before 010caed4ccb6 ("PCI/AER: Decode Error Source RequesterID")
> the AER error logs looked like:
> 
>    pcieport 0000:00:03.0: AER: Corrected error received: id=0018
>    pcieport 0000:00:03.0: PCIe Bus Error: severity=Corrected, type=Data Link Layer, id=0018 (Receiver ID)
>    pcieport 0000:00:03.0:   device [1b36:000c] error status/mask=00000040/0000e000
>    pcieport 0000:00:03.0:    [ 6] BadTLP
> 
> In 010caed4ccb6 ("PCI/AER: Decode Error Source Requester ID"),
> the "id" field was removed from the AER error logs, so currently AER
> logs look like:
> 
>    pcieport 0000:00:03.0: AER: Corrected error received: 0000:00:03:0
>    pcieport 0000:00:03.0: PCIe Bus Error: severity=Corrected, type=Data Link Layer, (Receiver ID)
>    pcieport 0000:00:03.0:   device [1b36:000c] error status/mask=00000040/0000e000
>    pcieport 0000:00:03.0:    [ 6] BadTLP
> 
> The second line in the above logs prints "(Receiver ID)", even when
> there is no "id" in the log line. This is confusing.
> 

Starting your commit log to say that message are confusing and then talk
about why will make it easier to understand why the change is needed.

> Remove the "ID" from the aer_agent_string[]. The error logs will
> look as follows (Sample from dummy error injected by aer-inject):
> 
>    pcieport 0000:00:03.0: AER: Corrected error received: 0000:00:03.0
>    pcieport 0000:00:03.0: PCIe Bus Error: severity=Corrected, type=Data Link Layer, (Receiver)
>    pcieport 0000:00:03.0:   device [1b36:000c] error status/mask=00000040/0000e000
>    pcieport 0000:00:03.0:    [ 6] BadTLP
> 

It is good to see before and after messages. However, it will be helpful
to know why this change is necessary. It isn't very clear why in this
commit log.

> Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com
> Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>

Extra signed-off-by?

> ---
>   drivers/pci/pcie/aer.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index 9784fdcf3006..241ff361b43c 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -516,10 +516,10 @@ static const char *aer_uncorrectable_error_string[] = {
>   };
>   
>   static const char *aer_agent_string[] = {
> -	"Receiver ID",
> -	"Requester ID",
> -	"Completer ID",
> -	"Transmitter ID"
> +	"Receiver",
> +	"Requester",
> +	"Completer",
> +	"Transmitter"
>   };
>   
>   #define aer_stats_dev_attr(name, stats_array, strings_array,		\
> @@ -703,7 +703,7 @@ void aer_print_error(struct pci_dev *dev, struct aer_err_info *info)
>   	const char *level;
>   
>   	if (!info->status) {
> -		pci_err(dev, "PCIe Bus Error: severity=%s, type=Inaccessible, (Unregistered Agent ID)\n",
> +		pci_err(dev, "PCIe Bus Error: severity=%s, type=Inaccessible, (Unregistered Agent)\n",
>   			aer_error_severity_string[info->severity]);
>   		goto out;
>   	}
> 

thanks,
-- Shuah
