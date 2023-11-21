Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 269847F21FE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Nov 2023 01:12:10 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=embeddedor.com header.i=@embeddedor.com header.a=rsa-sha256 header.s=default header.b=V6AbgRHt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SZ4Z00LZlz3cZd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Nov 2023 11:12:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=embeddedor.com header.i=@embeddedor.com header.a=rsa-sha256 header.s=default header.b=V6AbgRHt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=embeddedor.com (client-ip=44.202.169.39; helo=omta040.useast.a.cloudfilter.net; envelope-from=gustavo@embeddedor.com; receiver=lists.ozlabs.org)
Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SZ4Y51BZJz3bvB
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Nov 2023 11:11:19 +1100 (AEDT)
Received: from eig-obgw-5010a.ext.cloudfilter.net ([10.0.29.199])
	by cmsmtp with ESMTPS
	id 5C3Zrpn3M6nOZ5EKnryowZ; Tue, 21 Nov 2023 00:09:45 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id 5EKlrcwbkhDny5EKmrV9tq; Tue, 21 Nov 2023 00:09:44 +0000
X-Authority-Analysis: v=2.4 cv=fda+dmcF c=1 sm=1 tr=0 ts=655bf548
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=WzbPXH4gqzPVN0x6HrNMNA==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=BNY50KLci1gA:10 a=wYkD_t78qR0A:10 a=pGLkceISAAAA:8
 a=_Wotqz80AAAA:8 a=VwQbUJbxAAAA:8 a=mj1J1fUijU67ZuGb4usA:9 a=QEXdDO2ut3YA:10
 a=buJP51TR1BpY-zbLSsyS:22 a=AjGcO6oz07-iQ99wixmX:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=9MpSC42MjHarTm+Fwj/hKjEo0Wz2iqqispl/88xKKck=; b=V6AbgRHtBmAoqI+XAeb2JGUGe3
	BCi62XAn9IYkfWIC73pBTE8WCjlqx3AIfyiuVWCLq+/1oVm2V7Sq+GmGppagr9Biq8mJolhKBtQ/N
	mQ1HQVJcJhOkKKdqOaUYX7QollYHBnZfLMHvXMRFOVm84MX/z7JpDzizkPR1jFe3pw0WTsjiTnC3c
	8cfxeu57DxJKVsBNe/1m5lDYZt3c6z7AjZMH61u7Jtv3iYEKGVJ2RkZ6lgaG1uuRr7s9wrDIBqM98
	hqwjfGAPWZUnRvjYCc6M1WrnYCbzLPq8HWiq70lNMzw6fwMS0ftv05yBAn4QTaRvHNb8FURsbD9Bq
	TwUJXWRg==;
Received: from 187-162-21-192.static.axtel.net ([187.162.21.192]:59538 helo=[192.168.15.10])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <gustavo@embeddedor.com>)
	id 1r5EKl-000Hge-2F;
	Mon, 20 Nov 2023 18:09:43 -0600
Message-ID: <a4ffb451-ee0c-4888-8964-97cb5b59ad7a@embeddedor.com>
Date: Mon, 20 Nov 2023 18:09:42 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/lib: Avoid array bounds warnings in vec ops
Content-Language: en-US
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
References: <20231120235436.1569255-1-mpe@ellerman.id.au>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20231120235436.1569255-1-mpe@ellerman.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.ozlabs.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.21.192
X-Source-L: No
X-Exim-ID: 1r5EKl-000Hge-2F
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-21-192.static.axtel.net ([192.168.15.10]) [187.162.21.192]:59538
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 1
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfAaurAeMy8/XlgKZJh7D4LL11RsWv1LDwjlFH95aJt9KhApZkuTuo52Uoj81xfIWDZFv5vBrltdBWAmlGQTbszvIZx3hzl0ebba5ZKi2/7fz2xV6+YyZ
 OcEqH46/HFxVJ2Db+DWlxqZVZ48GrzTDT1XgvFPpgfs6CQjRhmOyl5XJ44uHD6xTHlB9zraLzi0a+7ACJRzRfUG6XZohg04Yf4gdew92CoN/pqZ90wEbFDxv
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 11/20/23 17:54, Michael Ellerman wrote:
> Building with GCC 13 (which has -array-bounds enabled) there are several
> warnings in sstep.c along the lines of:
> 
>    In function ‘do_byte_reverse’,
>        inlined from ‘do_vec_load’ at arch/powerpc/lib/sstep.c:691:3,
>        inlined from ‘emulate_loadstore’ at arch/powerpc/lib/sstep.c:3439:9:
>    arch/powerpc/lib/sstep.c:289:23: error: array subscript 2 is outside array bounds of ‘u8[16]’ {aka ‘unsigned char[16]’} [-Werror=array-bounds=]
>      289 |                 up[2] = byterev_8(up[1]);
>          |                 ~~~~~~^~~~~~~~~~~~~~~~~~
>    arch/powerpc/lib/sstep.c: In function ‘emulate_loadstore’:
>    arch/powerpc/lib/sstep.c:681:11: note: at offset 16 into object ‘u’ of size 16
>      681 |         } u = {};
>          |           ^
> 
> do_byte_reverse() supports a size up to 32 bytes, but in these cases the
> caller is only passing a 16 byte buffer. In practice there is no bug,
> do_vec_load() is only called from the LOAD_VMX case in emulate_loadstore().
> That in turn is only reached when analyse_instr() recognises VMX ops,
> and in all cases the size is no greater than 16:
> 
>    $ git grep -w LOAD_VMX arch/powerpc/lib/sstep.c
>    arch/powerpc/lib/sstep.c:                        op->type = MKOP(LOAD_VMX, 0, 1);
>    arch/powerpc/lib/sstep.c:                        op->type = MKOP(LOAD_VMX, 0, 2);
>    arch/powerpc/lib/sstep.c:                        op->type = MKOP(LOAD_VMX, 0, 4);
>    arch/powerpc/lib/sstep.c:                        op->type = MKOP(LOAD_VMX, 0, 16);
> 
> Similarly for do_vec_store().
> 
> Although the warning is incorrect, the code would be safer if it clamped
> the size from the caller to the known size of the buffer. Do that using
> min_t().
> 
> Reported-by: Bagas Sanjaya <bagasdotme@gmail.com>
> Reported-by: Jan-Benedict Glaw <jbglaw@lug-owl.de>
> Reported-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>
Build-tested-by: Gustavo A. R. Silva <gustavoars@kernel.org>

This indeed makes all those warnings go away. :)

Thanks, Michael!
--
Gustavo

> ---
>   arch/powerpc/lib/sstep.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
> index a4ab8625061a..a13f05cfc7db 100644
> --- a/arch/powerpc/lib/sstep.c
> +++ b/arch/powerpc/lib/sstep.c
> @@ -688,7 +688,7 @@ static nokprobe_inline int do_vec_load(int rn, unsigned long ea,
>   	if (err)
>   		return err;
>   	if (unlikely(cross_endian))
> -		do_byte_reverse(&u.b[ea & 0xf], size);
> +		do_byte_reverse(&u.b[ea & 0xf], min_t(size_t, size, sizeof(u)));
>   	preempt_disable();
>   	if (regs->msr & MSR_VEC)
>   		put_vr(rn, &u.v);
> @@ -719,7 +719,7 @@ static nokprobe_inline int do_vec_store(int rn, unsigned long ea,
>   		u.v = current->thread.vr_state.vr[rn];
>   	preempt_enable();
>   	if (unlikely(cross_endian))
> -		do_byte_reverse(&u.b[ea & 0xf], size);
> +		do_byte_reverse(&u.b[ea & 0xf], min_t(size_t, size, sizeof(u)));
>   	return copy_mem_out(&u.b[ea & 0xf], ea, size, regs);
>   }
>   #endif /* CONFIG_ALTIVEC */
