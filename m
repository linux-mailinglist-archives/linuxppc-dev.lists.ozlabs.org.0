Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 656E270D5FB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 May 2023 09:49:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QQRK641X8z3f9c
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 May 2023 17:48:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.218.50; helo=mail-ej1-f50.google.com; envelope-from=jirislaby@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QQRJf4RbFz30CT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 May 2023 17:48:34 +1000 (AEST)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-96f6e83e12fso653543966b.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 May 2023 00:48:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684828110; x=1687420110;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G/ga9kfQAmCrlcMothWIufyDqrfE6sQdv6qR5XzdMOg=;
        b=ILnSTJruaY3m10G076RxUZqULjR/EfxZThI1w5Z8OpLUvthSWkLlNKM4SE/BAv3Oor
         B6VodflvTQIyEBcY+awVDOMFJJNZZWz+mnvbG4u8FhKx52MQ41tC/dYGchGUpgRYq/+X
         w0RuGxUUWCtZQethvowlCCqkyogkFqZKKciOspnCY+BTaRM07rQ0DXSfM7dcGpwoDr1h
         mkU2nehnPdNSmKQURaj9JnUdjMAbe7+93tHO3S9dKNnoPmbwr8E6OXQcB+S7Novgt1k7
         430WUIhDGKAHQbJ7R6vd97Qf2IQZ9/TET3hOgxXHgmL/Njoz+bkdrX0yuOq3j1Pc2rIm
         xiuA==
X-Gm-Message-State: AC+VfDwQhepSW/ccyOQWeJVs1G+hJm25/cY4QxGG1/V/ERPOnS4kN9ex
	APF+VxuiXNBIRl0x0sn9XCY=
X-Google-Smtp-Source: ACHHUZ5Lkei+0eevntPfv1VfTj6uFljsHPeKK8tvdztEH9quqLFDVH+u77ys6bL04uOufoqRWiCGNw==
X-Received: by 2002:a17:907:928b:b0:96a:411a:1cc4 with SMTP id bw11-20020a170907928b00b0096a411a1cc4mr11813594ejc.66.1684828109630;
        Tue, 23 May 2023 00:48:29 -0700 (PDT)
Received: from [192.168.1.58] (185-219-167-24-static.vivo.cz. [185.219.167.24])
        by smtp.gmail.com with ESMTPSA id jy2-20020a170907762200b0096f689848desm4087738ejc.195.2023.05.23.00.48.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 May 2023 00:48:29 -0700 (PDT)
Message-ID: <e8c45035-1834-7214-46af-834e879cf3c5@kernel.org>
Date: Tue, 23 May 2023 09:48:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 0/2] Fix COMPILE_TEST dependencies for CPM uart, TSA and
 QMC
Content-Language: en-US
To: Herve Codina <herve.codina@bootlin.com>, Qiang Zhao <qiang.zhao@nxp.com>,
 Li Yang <leoyang.li@nxp.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20230522082048.21216-1-herve.codina@bootlin.com>
From: Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <20230522082048.21216-1-herve.codina@bootlin.com>
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, linux-serial@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 22. 05. 23, 10:20, Herve Codina wrote:
> This series fixes issues raised by the kernel test robot
>    https://lore.kernel.org/oe-kbuild-all/202305160221.9XgweObz-lkp@intel.com/
> 
> In COMPILE_TEST configurations, TSA and QMC need CONFIG_CPM to be set in
> order to compile and CPM uart needs CONFIG_CPM2.

Ah, perfect. Greg, please disregard my revert posted at:
   https://lore.kernel.org/all/20230518055620.29957-1-jirislaby@kernel.org/

and take these instead.

Thanks.

> Best regards,
> Hervé
> 
> Herve Codina (2):
>    soc: fsl: cpm1: Fix TSA and QMC dependencies in case of COMPILE_TEST
>    serial: cpm_uart: Fix a COMPILE_TEST dependency
> 
>   drivers/soc/fsl/qe/Kconfig | 4 ++--
>   drivers/tty/serial/Kconfig | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 

-- 
js

