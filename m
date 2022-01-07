Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A14C486F6E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jan 2022 02:09:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JVQ9N2b0bz3bTt
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jan 2022 12:09:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ozlabs-ru.20210112.gappssmtp.com header.i=@ozlabs-ru.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=15v9dLeP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::434;
 helo=mail-pf1-x434.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20210112.gappssmtp.com
 header.i=@ozlabs-ru.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=15v9dLeP; dkim-atps=neutral
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JVQ8j5cQBz2xYG
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jan 2022 12:08:51 +1100 (AEDT)
Received: by mail-pf1-x434.google.com with SMTP id s15so3893282pfk.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Jan 2022 17:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Ouy0zNLVVIhFTQ9/jbGwNZKkMA9lx/bmMEnsS2uflqw=;
 b=15v9dLePGXMI4QIcJawAT+kO4viyJZUBpg8N8tyVxwzzfav4rVfgIhAcB5AWeU382C
 zZK9OeObmFqDGp75MZrUR++A2OCxh/EYtKFYGRKjj8zH8OZsv0HHVKzlKTUiKh3nAvui
 x/F0UgEiyoX6TVH8axGpW9Lpe3L+MnxUdKoynfZkPh2sgCBrpfmK6oic16bHxpb+uS8u
 1CwsFgSHYaKm9dYt6WfHOSRUFk+192J+08tC/UYlAPH28tY+X/fFrQHZBgC174N/411y
 KmgfJ+vbIP6pL92CmXs5Myt5J2y7TkNZe1/TYGuQymhWBvsSjoNaiSqUAE9qRMaUQeiF
 c2HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Ouy0zNLVVIhFTQ9/jbGwNZKkMA9lx/bmMEnsS2uflqw=;
 b=ZWB7E3mKqVESefzqxyJ1VeK7BvJVKyznzX2TpOJrGf8IlIk8hM4XS5a8qCBoL3THic
 46yk5ILrPxOAIoRFLIm7H2F3rLATYxU734/sLTSuAvQ2ViAdd/JeHTXET68o9fnreeYX
 JZFYGbuY8HUxcX9CQpdEUn5AzpDyAY98Lm7k6PTNWa9korXHeG+3fYwusSROWgu+kgZ8
 cPdWQ80bw7MIM9lxlqrKOCYJ4ub0YHyF+fOB1G9S9MJ6iDtt3OVZgX7LzrB4eWFojpyB
 3f2GrC1pMIX0o2nWfscwfM+SCA4RN0Q5wlZ4PwpoZzq1DmuTasUnakrjnfyJ/qcrzBzw
 ESCA==
X-Gm-Message-State: AOAM532jYWZtl8+AIPsxjPQ1phSuj3Go3sIni84TL3Z3hETvvUuVbleT
 YDQ0IzgVieQmtFlA9/IIvou6RQ==
X-Google-Smtp-Source: ABdhPJzq2JGQZjdR5OGk9J9NlgdjAcggzbH/xZlIMngI0QE7KIEVYc+ZlOjit/MR4mnM4y0EasaNYQ==
X-Received: by 2002:a05:6a00:216f:b0:49f:dcb7:2bf2 with SMTP id
 r15-20020a056a00216f00b0049fdcb72bf2mr62778701pff.19.1641517729011; 
 Thu, 06 Jan 2022 17:08:49 -0800 (PST)
Received: from [192.168.10.153] (203-7-124-83.dyn.iinet.net.au. [203.7.124.83])
 by smtp.gmail.com with ESMTPSA id s18sm356768pjq.56.2022.01.06.17.08.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 17:08:48 -0800 (PST)
Message-ID: <63f9a19c-0b5c-8746-7ef4-ab72cbda397c@ozlabs.ru>
Date: Fri, 7 Jan 2022 12:08:42 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
Subject: Re: [PATCH v2 6/7] KVM: PPC: mmio: Return to guest after emulation
 failure
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>, kvm-ppc@vger.kernel.org
References: <20220106200304.4070825-1-farosas@linux.ibm.com>
 <20220106200304.4070825-7-farosas@linux.ibm.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <20220106200304.4070825-7-farosas@linux.ibm.com>
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
> If MMIO emulation fails we don't want to crash the whole guest by
> returning to userspace.
> 
> The original commit bbf45ba57eae ("KVM: ppc: PowerPC 440 KVM
> implementation") added a todo:
> 
>    /* XXX Deliver Program interrupt to guest. */
> 
> and later the commit d69614a295ae ("KVM: PPC: Separate loadstore
> emulation from priv emulation") added the Program interrupt injection
> but in another file, so I'm assuming it was missed that this block
> needed to be altered.
> 
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>


Looks right.
Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>

but this means if I want to keep debugging those kvm selftests in 
comfort, I'll have to have some exception handlers in the vm as 
otherwise the failing $pc is lost after this change :)

> ---
>   arch/powerpc/kvm/powerpc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
> index a2e78229d645..50e08635e18a 100644
> --- a/arch/powerpc/kvm/powerpc.c
> +++ b/arch/powerpc/kvm/powerpc.c
> @@ -309,7 +309,7 @@ int kvmppc_emulate_mmio(struct kvm_vcpu *vcpu)
>   		kvmppc_get_last_inst(vcpu, INST_GENERIC, &last_inst);
>   		kvmppc_core_queue_program(vcpu, 0);
>   		pr_info("%s: emulation failed (%08x)\n", __func__, last_inst);
> -		r = RESUME_HOST;
> +		r = RESUME_GUEST;
>   		break;
>   	}
>   	default:

-- 
Alexey
