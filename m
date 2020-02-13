Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A42415BBD1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Feb 2020 10:40:02 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48JBLl21FQzDqSc
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Feb 2020 20:39:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::243;
 helo=mail-lj1-x243.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.a=rsa-sha256 header.s=google header.b=QijSSUZm; 
 dkim-atps=neutral
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48JBJJ3lSVzDqTF
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Feb 2020 20:37:51 +1100 (AEDT)
Received: by mail-lj1-x243.google.com with SMTP id n18so5785684ljo.7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Feb 2020 01:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=abAWSR2K9H6Y7+jBghj7Y02LAAu4P/DFtVh1G9MzXxs=;
 b=QijSSUZmAvV9r/UmfLRddFu/lj5MAcoPgRZbVa3v9j5jiiATXWzyL/BvURW3lz3KW7
 iMjlFqEHYvawzlPHLR/6TBOqcOgIPA8kR1X2nWq5kW9cvm8JEMkz8Q9hVcUSVr23HHE4
 ZwjkFtmmfIky8bGKUhfgRMyi8KT/hNbFyFmrU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=abAWSR2K9H6Y7+jBghj7Y02LAAu4P/DFtVh1G9MzXxs=;
 b=Pviv1v/MJQfxTSbU2o0qg/B6PU/cJLb+ofEcUlfLx82ltRSQ51jjiARe0hRqIBxmK8
 hR+HbYRWXrL1QyxoXlkV4b+gkIW9tRAGa9afy/6fSK2SonB4Fg6bqcZ162Q/Wy9zqwjO
 HWFnEQIetoJpUqB17HLSnQLoIE8qxiLeDfmIig9wpcuJdAfZLo+xWH4q1ejYO2EqTsEi
 pIGAti7+c3znAoQ3OyCkXIS0l2lFOoD7xZoqcR3Z8zTJ3IqkFTey8BpgU5LJmb0OLKNt
 sdjgwgib8SN3hU0Ej8zmcpwjxl8Y7yA+cQbFd3w5nVz+aXbbmOH7dQm71ObWuRs7Pfvq
 tnEQ==
X-Gm-Message-State: APjAAAXQ3HjtDSuGyGBcPmx3wMHm9LHDTPidkGqQFb8I7W5CetByPPWu
 uAKwXW53ny88lYkVCOZFuu9aGw==
X-Google-Smtp-Source: APXvYqyZFOrtSR7eABF1EXRChiVl4lCT5gyFw0WU8p2xdTyGdZA18sFRm59BfuNt7mQK9C5WtPUKtw==
X-Received: by 2002:a05:651c:232:: with SMTP id
 z18mr11013557ljn.85.1581586666416; 
 Thu, 13 Feb 2020 01:37:46 -0800 (PST)
Received: from [172.16.11.50] ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id r9sm1151939lfc.72.2020.02.13.01.37.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Feb 2020 01:37:45 -0800 (PST)
Subject: Re: [Regression 5.6-rc1][Bisected b6231ea2b3c6] Powerpc 8xx doesn't
 boot anymore
To: Christophe Leroy <christophe.leroy@c-s.fr>, Li Yang <leoyang.li@nxp.com>, 
 Qiang Zhao <qiang.zhao@nxp.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <0d45fa64-51ee-0052-cb34-58c770c5b3ce@c-s.fr>
 <aee10440-c244-7c93-d3bb-fd29d8a83be4@c-s.fr>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <59487f8a-fd2e-703d-d954-d263f756a3a0@rasmusvillemoes.dk>
Date: Thu, 13 Feb 2020 10:37:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <aee10440-c244-7c93-d3bb-fd29d8a83be4@c-s.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: Scott Wood <oss@buserror.net>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 LKML <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12/02/2020 15.50, Christophe Leroy wrote:
> 
> 
> On 02/12/2020 02:24 PM, Christophe Leroy wrote:

>> In your commit text you explain that cpm_muram_init() is called via
>> subsys_initcall. But console init is done before that, so it cannot work.
>>
>> Do you have a fix for that ?
>>
> 
> The following patch allows powerpc 8xx to boot again. Don't know if
> that's the good place and way to do the fix though.
> 
> ---
> diff --git a/drivers/tty/serial/cpm_uart/cpm_uart_core.c
> b/drivers/tty/serial/cpm_uart/cpm_uart_core.c
> index 4cabded8390b..341d682ec6eb 100644
> --- a/drivers/tty/serial/cpm_uart/cpm_uart_core.c
> +++ b/drivers/tty/serial/cpm_uart/cpm_uart_core.c
> @@ -1351,6 +1351,7 @@ static int __init cpm_uart_console_setup(struct
> console *co, char *options)
>          clrbits32(&pinfo->sccp->scc_gsmrl, SCC_GSMRL_ENR | SCC_GSMRL_ENT);
>      }
> 
> +    cpm_muram_init();
>      ret = cpm_uart_allocbuf(pinfo, 1);
> 
>      if (ret)

Hmm, that seems to be a somewhat random place, making it hard to see
that it is indeed early enough. Would it work to put it inside the
console_initcall that registers the cpm console? I.e.

static int __init cpm_uart_console_init(void)
{
+       cpm_muram_init();
        register_console(&cpm_scc_uart_console);
        return 0;
}

console_initcall(cpm_uart_console_init);

Rasmus
