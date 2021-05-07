Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50033375FE0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 May 2021 07:52:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fc02p289Pz301N
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 May 2021 15:52:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fc02S0NfMz2yWQ
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 May 2021 15:52:00 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4Fc02N4hxyz9sZN;
 Fri,  7 May 2021 07:51:56 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2_0quOkazggz; Fri,  7 May 2021 07:51:56 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4Fc02N3lGdz9sZL;
 Fri,  7 May 2021 07:51:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5F5B28B81A;
 Fri,  7 May 2021 07:51:56 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id sA6WJm0vMBCX; Fri,  7 May 2021 07:51:56 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id AC8368B764;
 Fri,  7 May 2021 07:51:55 +0200 (CEST)
Subject: Re: [PATCH v12 4/8] powerpc/bpf: Remove bpf_jit_free()
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20210506023449.3568630-1-jniethe5@gmail.com>
 <20210506023449.3568630-5-jniethe5@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <a4fb13b5-79f0-f50a-b301-2329f9715709@csgroup.eu>
Date: Fri, 7 May 2021 07:51:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210506023449.3568630-5-jniethe5@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
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
Cc: ajd@linux.ibm.com, npiggin@gmail.com, cmr@codefail.de,
 aneesh.kumar@linux.ibm.com, naveen.n.rao@linux.ibm.com, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 06/05/2021 à 04:34, Jordan Niethe a écrit :
> Commit 74451e66d516 ("bpf: make jited programs visible in traces") added
> a default bpf_jit_free() implementation. Powerpc did not use the default
> bpf_jit_free() as powerpc did not set the images read-only. The default
> bpf_jit_free() called bpf_jit_binary_unlock_ro() is why it could not be
> used for powerpc.
> 
> Commit d53d2f78cead ("bpf: Use vmalloc special flag") moved keeping
> track of read-only memory to vmalloc. This included removing
> bpf_jit_binary_unlock_ro(). Therefore there is no reason powerpc needs
> its own bpf_jit_free(). Remove it.
> 
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
> v11: New to series
> ---
>   arch/powerpc/net/bpf_jit_comp.c | 12 ------------
>   1 file changed, 12 deletions(-)
> 
> diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
> index 798ac4350a82..6c8c268e4fe8 100644
> --- a/arch/powerpc/net/bpf_jit_comp.c
> +++ b/arch/powerpc/net/bpf_jit_comp.c
> @@ -257,15 +257,3 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
>   
>   	return fp;
>   }
> -
> -/* Overriding bpf_jit_free() as we don't set images read-only. */
> -void bpf_jit_free(struct bpf_prog *fp)
> -{
> -	unsigned long addr = (unsigned long)fp->bpf_func & PAGE_MASK;
> -	struct bpf_binary_header *bpf_hdr = (void *)addr;
> -
> -	if (fp->jited)
> -		bpf_jit_binary_free(bpf_hdr);
> -
> -	bpf_prog_unlock_free(fp);
> -}
> 
