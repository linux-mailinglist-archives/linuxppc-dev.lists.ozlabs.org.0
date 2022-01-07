Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 16961486EBB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jan 2022 01:25:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JVPBJ01qmz3bY4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jan 2022 11:25:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ozlabs-ru.20210112.gappssmtp.com header.i=@ozlabs-ru.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=RByHUaq+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::530;
 helo=mail-pg1-x530.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20210112.gappssmtp.com
 header.i=@ozlabs-ru.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=RByHUaq+; dkim-atps=neutral
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JVP9f68v3z2xsm
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jan 2022 11:24:37 +1100 (AEDT)
Received: by mail-pg1-x530.google.com with SMTP id i30so4040169pgl.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Jan 2022 16:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=1kNOBBJWV4zJS8HcYHpk7kQECqCPSScEopNDxozF4p4=;
 b=RByHUaq+mIc6q8K14rNcuw8hac6QEN8yr6i8199we3eKHoQJhlE5CAKSJDUbB0hxtA
 iR0pnuyxKtjzB1lu/RKyfR/FEVKI2xrjGaTcWxFD9KicWbZmn7ZUQD2hhOvznTEqReCF
 ZHV8j88jIFcklJE/QHTN+Xbo+/zPLVWIK0P/TuKbgYMvfEakMOOlqNL9G6hwQrX61frt
 Ic5tziMjQ2Tdp+GZsnfiKxOiRCLm+0oR3Og92B8xHMQiAMgjVrfz6RXA8ipwEzbo8PJ2
 g98qrcf79UoAENo1llT6MQlUgLjWkMSxyhMkx9sW0zeySxG+if2PgSPAM7W2ZVzDJd0r
 Ysqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1kNOBBJWV4zJS8HcYHpk7kQECqCPSScEopNDxozF4p4=;
 b=Z01WHTW0x3QOUpd5rF7LDCELbyoZBm01gukzZ3lSrPwDkoSd8/PWd/RxYMrPWVkMMg
 UDLg0DpTha1bVKV6QmSHMhyPxAHu0w8arjSiFnQF+EdFbob0yDy4RxCR0qBBicO3/dhb
 8COtt43rwYc/xw616dfzbkLst3KQfWqsEVtca2kpzgTQkWnNDLOp+AWzjnlw+4ce/Lqp
 1HER0EMqBsemyHifIVubMvUC6987cpDTun8xxYTGQptI8VBo0IxM48sFdwCmLDFdho6I
 KbmQ7WeVMkKu9TxPON9J/iZnfb4lefjWMIWUzn7OkXGql7hg91YF+RIjumCYTOdct5O9
 nlHg==
X-Gm-Message-State: AOAM533iPHv0Ic07JYUOy0HTcB5I2IGhq3+S8XyrVrtyl6si5zJc4T1m
 RVoSVNIzle3tzFblJQ14R1BbOA==
X-Google-Smtp-Source: ABdhPJyDF6BN7+vp1sENXru8rXjc7zmWvq1Khm9qSOnSc8B+1qOs7zNr3w9qezB+gSEfwNNQ5YAjog==
X-Received: by 2002:a05:6a00:b8e:b0:4ba:cbf2:516e with SMTP id
 g14-20020a056a000b8e00b004bacbf2516emr63051141pfj.72.1641515075585; 
 Thu, 06 Jan 2022 16:24:35 -0800 (PST)
Received: from [192.168.10.153] (203-7-124-83.dyn.iinet.net.au. [203.7.124.83])
 by smtp.gmail.com with ESMTPSA id e4sm1025122pjr.40.2022.01.06.16.24.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 16:24:35 -0800 (PST)
Message-ID: <555dd74b-75ce-b87b-7ef1-5559af9e631e@ozlabs.ru>
Date: Fri, 7 Jan 2022 11:24:29 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
Subject: Re: [PATCH v2 5/7] KVM: PPC: mmio: Queue interrupt at
 kvmppc_emulate_mmio
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>, kvm-ppc@vger.kernel.org
References: <20220106200304.4070825-1-farosas@linux.ibm.com>
 <20220106200304.4070825-6-farosas@linux.ibm.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <20220106200304.4070825-6-farosas@linux.ibm.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 07/01/2022 07:03, Fabiano Rosas wrote:
> If MMIO emulation fails, we queue a Program interrupt to the
> guest. Move that line up into kvmppc_emulate_mmio, which is where we
> set RESUME_GUEST/HOST.
> 
> No functional change, just separation of responsibilities.
> 
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> ---
>   arch/powerpc/kvm/emulate_loadstore.c | 4 +---
>   arch/powerpc/kvm/powerpc.c           | 2 +-
>   2 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/powerpc/kvm/emulate_loadstore.c b/arch/powerpc/kvm/emulate_loadstore.c
> index 48272a9b9c30..ef50e8cfd988 100644
> --- a/arch/powerpc/kvm/emulate_loadstore.c
> +++ b/arch/powerpc/kvm/emulate_loadstore.c
> @@ -355,10 +355,8 @@ int kvmppc_emulate_loadstore(struct kvm_vcpu *vcpu)
>   		}
>   	}
>   
> -	if (emulated == EMULATE_FAIL) {
> +	if (emulated == EMULATE_FAIL)
>   		advance = 0;


You can now drop @advance by moving the "if" few lines down.


> -		kvmppc_core_queue_program(vcpu, 0);
> -	}
>   
>   	trace_kvm_ppc_instr(inst, kvmppc_get_pc(vcpu), emulated);
>   
> diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
> index 3fc8057db4b4..a2e78229d645 100644
> --- a/arch/powerpc/kvm/powerpc.c
> +++ b/arch/powerpc/kvm/powerpc.c
> @@ -307,7 +307,7 @@ int kvmppc_emulate_mmio(struct kvm_vcpu *vcpu)
>   		u32 last_inst;
>   
>   		kvmppc_get_last_inst(vcpu, INST_GENERIC, &last_inst);
> -		/* XXX Deliver Program interrupt to guest. */
> +		kvmppc_core_queue_program(vcpu, 0);
>   		pr_info("%s: emulation failed (%08x)\n", __func__, last_inst);
>   		r = RESUME_HOST;
>   		break;

-- 
Alexey
