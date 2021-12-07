Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B79BD46BE16
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Dec 2021 15:46:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7jmn4T7Tz3c4p
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Dec 2021 01:46:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=G6Czo5VL;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=G6Czo5VL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=joe.lawrence@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=G6Czo5VL; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=G6Czo5VL; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7jm03fvNz2ync
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Dec 2021 01:46:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638888365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZFRnYClsIQOAbSPKNTW9TG+E3dxiCbpXnDZqk0mz9ZY=;
 b=G6Czo5VLZXUjVQJbRx3UPCBGNKzNodvnpNj7s7rQAPUYCtVLHXZSdmp3o+tg1iKy4eQ0kG
 WJCPkchbuxYGfaw+xG8U7vyeKm4vUhOV0ugj2WcZwOB4SE66TPlVmSXBNppmYWqoaQ8Wr4
 gvlwQ5NcOIkjMi6W0ivCJM6c+nHRy/4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638888365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZFRnYClsIQOAbSPKNTW9TG+E3dxiCbpXnDZqk0mz9ZY=;
 b=G6Czo5VLZXUjVQJbRx3UPCBGNKzNodvnpNj7s7rQAPUYCtVLHXZSdmp3o+tg1iKy4eQ0kG
 WJCPkchbuxYGfaw+xG8U7vyeKm4vUhOV0ugj2WcZwOB4SE66TPlVmSXBNppmYWqoaQ8Wr4
 gvlwQ5NcOIkjMi6W0ivCJM6c+nHRy/4=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-511-q39LidrsOxWfU4yItqYsJg-1; Tue, 07 Dec 2021 09:44:51 -0500
X-MC-Unique: q39LidrsOxWfU4yItqYsJg-1
Received: by mail-qv1-f69.google.com with SMTP id
 h14-20020a0562140dae00b003ae664126e9so17980011qvh.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Dec 2021 06:44:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZFRnYClsIQOAbSPKNTW9TG+E3dxiCbpXnDZqk0mz9ZY=;
 b=6dPTvY3/bDiWQa05WVKvW8vZzLnK0WjOOJJL6FMoz5KDdJeLh+Yxzme+pVjj2Tc/zD
 QSKNMqH/bNjF+56RE3GKcI9uiWEw8bJy8QHVzLbv57SMx4w6zN+Im6j+PnkmpUTGbkp7
 Wh2YXIUliS57CPzjOddDMgomtRECOOQDN5Agl5o7EIboT2n1sj8OUgWHzkbL3HRBvixs
 bnonFQZNAPwpx97N8OG/in7SA8/QrxqIGux9pwGmKYi5MeOSewnc7eiy4v9PIG799p9r
 2rF07P5noNv0Qj/YAyUr1jhrRuAESmF/Q5ZnEesVWxwj5EjpcBrPISHTIvF+t970zcTr
 /LwQ==
X-Gm-Message-State: AOAM530iBTKAFD3671BPjI3wgIDvw9e+sWh7THmJNBZPg6DpzhUWadv8
 Dl5Ygp9rkeaPoyZONQAtkGwB2Y2/7j6oEZtWyjNLUoz1ArbQSvtCJoy2UQvrmXnQ+WolSuON/ht
 5MlyyWDQwbsDAnD1GlA/NQ5TkDg==
X-Received: by 2002:a05:620a:84a:: with SMTP id
 u10mr41617364qku.339.1638888290218; 
 Tue, 07 Dec 2021 06:44:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzFKfpFtLLdQhG5FpFPHH4Vxm5PxhRcLv/tk5/N4acxTqPNPri1nD6OUoFTAD1JmzmJVizLuQ==
X-Received: by 2002:a05:620a:84a:: with SMTP id
 u10mr41617338qku.339.1638888289918; 
 Tue, 07 Dec 2021 06:44:49 -0800 (PST)
Received: from [192.168.1.9] (pool-68-163-101-245.bstnma.fios.verizon.net.
 [68.163.101.245])
 by smtp.gmail.com with ESMTPSA id b5sm7837927qka.51.2021.12.07.06.44.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Dec 2021 06:44:49 -0800 (PST)
To: Russell Currey <ruscur@russell.cc>, linuxppc-dev@lists.ozlabs.org
References: <20211123081520.18843-1-ruscur@russell.cc>
From: Joe Lawrence <joe.lawrence@redhat.com>
Subject: Re: [PATCH] powerpc/module_64: Fix livepatching for RO modules
Message-ID: <d9d9ef2d-4aaa-7d8b-d15e-0452a355c5cf@redhat.com>
Date: Tue, 7 Dec 2021 09:44:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20211123081520.18843-1-ruscur@russell.cc>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=joe.lawrence@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: live-patching@vger.kernel.org, jniethe5@gmail.com,
 naveen.n.rao@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/23/21 3:15 AM, Russell Currey wrote:
> Livepatching a loaded module involves applying relocations through
> apply_relocate_add(), which attempts to write to read-only memory when
> CONFIG_STRICT_MODULE_RWX=y.  Work around this by performing these
> writes through the text poke area by using patch_instruction().
> 
> R_PPC_REL24 is the only relocation type generated by the kpatch-build
> userspace tool or klp-convert kernel tree that I observed applying a
> relocation to a post-init module.
> 
> A more comprehensive solution is planned, but using patch_instruction()
> for R_PPC_REL24 on should serve as a sufficient fix.
> 
> This does have a performance impact, I observed ~15% overhead in
> module_load() on POWER8 bare metal with checksum verification off.
> 
> Fixes: c35717c71e98 ("powerpc: Set ARCH_HAS_STRICT_MODULE_RWX")
> Cc: stable@vger.kernel.org # v5.14+
> Reported-by: Joe Lawrence <joe.lawrence@redhat.com>
> Signed-off-by: Russell Currey <ruscur@russell.cc>
> ---
> Intended to be a minimal fix that can go to stable.
> 
>  arch/powerpc/kernel/module_64.c | 30 ++++++++++++++++++++++--------
>  1 file changed, 22 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/module_64.c b/arch/powerpc/kernel/module_64.c
> index 6baa676e7cb6..c25ef36c3ef4 100644
> --- a/arch/powerpc/kernel/module_64.c
> +++ b/arch/powerpc/kernel/module_64.c
> @@ -422,11 +422,16 @@ static inline int create_stub(const Elf64_Shdr *sechdrs,
>  			      const char *name)
>  {
>  	long reladdr;
> +	func_desc_t desc;
> +	int i;
>  
>  	if (is_mprofile_ftrace_call(name))
>  		return create_ftrace_stub(entry, addr, me);
>  
> -	memcpy(entry->jump, ppc64_stub_insns, sizeof(ppc64_stub_insns));
> +	for (i = 0; i < sizeof(ppc64_stub_insns) / sizeof(u32); i++) {
> +		patch_instruction(&entry->jump[i],
> +				  ppc_inst(ppc64_stub_insns[i]));
> +	}
>  
>  	/* Stub uses address relative to r2. */
>  	reladdr = (unsigned long)entry - my_r2(sechdrs, me);
> @@ -437,10 +442,19 @@ static inline int create_stub(const Elf64_Shdr *sechdrs,
>  	}
>  	pr_debug("Stub %p get data from reladdr %li\n", entry, reladdr);
>  
> -	entry->jump[0] |= PPC_HA(reladdr);
> -	entry->jump[1] |= PPC_LO(reladdr);
> -	entry->funcdata = func_desc(addr);
> -	entry->magic = STUB_MAGIC;
> +	patch_instruction(&entry->jump[0],
> +			  ppc_inst(entry->jump[0] | PPC_HA(reladdr)));
> +	patch_instruction(&entry->jump[1],
> +			  ppc_inst(entry->jump[1] | PPC_LO(reladdr)));
> +
> +	// func_desc_t is 8 bytes if ABIv2, else 16 bytes
> +	desc = func_desc(addr);
> +	for (i = 0; i < sizeof(func_desc_t) / sizeof(u32); i++) {
> +		patch_instruction(((u32 *)&entry->funcdata) + i,
> +				  ppc_inst(((u32 *)(&desc))[i]));
> +	}
> +
> +	patch_instruction(&entry->magic, ppc_inst(STUB_MAGIC));
>  
>  	return 1;
>  }
> @@ -496,7 +510,7 @@ static int restore_r2(const char *name, u32 *instruction, struct module *me)
>  		return 0;
>  	}
>  	/* ld r2,R2_STACK_OFFSET(r1) */
> -	*instruction = PPC_INST_LD_TOC;
> +	patch_instruction(instruction, ppc_inst(PPC_INST_LD_TOC));
>  	return 1;
>  }
>  
> @@ -636,9 +650,9 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
>  			}
>  
>  			/* Only replace bits 2 through 26 */
> -			*(uint32_t *)location
> -				= (*(uint32_t *)location & ~0x03fffffc)
> +			value = (*(uint32_t *)location & ~0x03fffffc)
>  				| (value & 0x03fffffc);
> +			patch_instruction((u32 *)location, ppc_inst(value));
>  			break;
>  
>  		case R_PPC64_REL64:
> 

[[ cc += livepatching list ]]

Hi Russell,

Thanks for writing a minimal fix for stable / backporting.  As I
mentioned on the github issue [1], this avoided the crashes I reported
here and over on kpatch github [2].  I wasn't sure if this is the final
version for stable, but feel free to add my:

Tested-by: Joe Lawrence <joe.lawrence@redhat.com>

[1] https://github.com/linuxppc/issues/issues/375
[2] https://github.com/dynup/kpatch/issues/1228

-- 
Joe

