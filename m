Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8998368ADF6
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Feb 2023 02:36:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P8X773Nslz3f94
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Feb 2023 12:36:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uX9MJcpe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uX9MJcpe;
	dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P8X66014kz30Mn
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 Feb 2023 12:35:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=IwELQq+u55+D3EFvij7/3Egp7EtXodznpG+Iv+sxei8=; b=uX9MJcpeKwFhTkM119uoroA8Iv
	vyKEQS7SOMmSNNMxChhOzOM9rhrDjlj8tuW9hQwW//kgZswtij9P1eFIXdQ7seLRw76cGozpeRE2e
	t6NAJeFvoRBEbzEeFKh82WdDwaYu9uhh0prJLlkCoCz1zxzopNJvmZTIvNu8Leo5B1Q2oA1GtvnC1
	KTD4OD0oSsDUO2gtgnZ/LZNe0MwZpchPEd/gYAvd7QCgyl7S1aJ3Z9JxhEKKzfgZ5Zwo2QfNW/Guf
	0f9bEZFjq8l9zTJgJqpxLoIdtrf2lMeR0BlJUwHauHiaA3hJYaWvlbLhZPTJJPKpwqaQ9ih30Ie1u
	aIh+jpuQ==;
Received: from [2601:1c2:d00:6a60::9526]
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOTwh-005p7l-Bc; Sun, 05 Feb 2023 01:35:55 +0000
Message-ID: <4e96046c-96f8-d5ae-3143-00a0bba6b9b9@infradead.org>
Date: Sat, 4 Feb 2023 17:35:54 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: PPC64 TOC. warnings
Content-Language: en-US
To: Masahiro Yamada <masahiroy@kernel.org>
References: <80c85984-7609-cab5-2341-48baeb67841e@infradead.org>
 <CAK7LNAQ2==FuLS9P3xqHocd_+4SxkP-Y45F038Y0o9SYwPR6SA@mail.gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <CAK7LNAQ2==FuLS9P3xqHocd_+4SxkP-Y45F038Y0o9SYwPR6SA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 2/4/23 09:40, Masahiro Yamada wrote:
> On Sun, Feb 5, 2023 at 2:30 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>>
>> Hi,
>>
>> I'm seeing thousands of these warnings:
>> (gcc 12.2.0)
>>
>>
>> ./include/generated/autoksyms.h:7:9: warning: ISO C99 requires whitespace after the macro name
>>     7 | #define __KSYM_TOC. 1
>>       |         ^~~~~~~~~~
>>
>> In file included from ../include/asm-generic/export.h:57,
>>                  from ./arch/powerpc/include/generated/asm/export.h:1,
>>                  from ../arch/powerpc/kernel/misc.S:17:
>> ./include/generated/autoksyms.h:7:9: warning: missing whitespace after the macro name
>>     7 | #define __KSYM_TOC. 1
>>       |         ^~~~~~~~~~
>>
>>
>> Can anything be done about them?
>>
>> Thanks.
>> --
>> ~Randy
> 
> 
> 
> Hmm, I just thought this issue was fixed by
> commit 29500f15b54b63ad0ea60b58e85144262bd24df2
> 
> 
> 
> Does this happen only for GCC 12?
> 
> Does the following patch fix the issue?
> (I did not test it.)
> 
> 

I have been running build tests all day (have probably done around 500 builds)
and I'm not seeing the build problem now. I don't know why not or what changed.

I have not applied the patch below. I'm just trying to reproduce the problem
and cannot do so. (Bad me: I had 3 build failures earlier but I didn't save the
failing .config files! I didn't think that it would be so difficult to reproduce.)

Thanks for your help.

> 
> 
> 
> diff --git a/scripts/gen_autoksyms.sh b/scripts/gen_autoksyms.sh
> index 12bcfae940ee..70d4ab3621f6 100755
> --- a/scripts/gen_autoksyms.sh
> +++ b/scripts/gen_autoksyms.sh
> @@ -54,7 +54,7 @@ EOT
>  } | sed -e 's/ /\n/g' | sed -n -e '/^$/!p' |
>  # Remove the dot prefix for ppc64; symbol names with a dot (.) hold entry
>  # point addresses.
> -sed -e 's/^\.//' |
> +sed -e 's/^\.//g' |
>  sort -u |
>  # Ignore __this_module. It's not an exported symbol, and will be resolved
>  # when the final .ko's are linked.


-- 
~Randy
