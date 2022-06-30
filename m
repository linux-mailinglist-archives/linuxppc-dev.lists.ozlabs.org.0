Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 707CF560F43
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jun 2022 04:42:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LYN0m2qZqz3dpx
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jun 2022 12:42:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=chenzhongjin@huawei.com; receiver=<UNKNOWN>)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LYN0K2Cp2z3bmM
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jun 2022 12:42:21 +1000 (AEST)
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.57])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4LYMww0jZXzhYcx;
	Thu, 30 Jun 2022 10:39:28 +0800 (CST)
Received: from dggpemm500013.china.huawei.com (7.185.36.172) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 30 Jun 2022 10:41:45 +0800
Received: from [127.0.0.1] (10.67.108.67) by dggpemm500013.china.huawei.com
 (7.185.36.172) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 30 Jun
 2022 10:41:45 +0800
Message-ID: <99883975-4fb7-b073-ac16-7a5474f5ac79@huawei.com>
Date: Thu, 30 Jun 2022 10:41:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v6 18/33] arm64: Change symbol type annotations
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20220623014917.199563-1-chenzhongjin@huawei.com>
 <20220623014917.199563-19-chenzhongjin@huawei.com>
 <YryQQlQga2wtWqv9@sirena.org.uk>
From: Chen Zhongjin <chenzhongjin@huawei.com>
In-Reply-To: <YryQQlQga2wtWqv9@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.108.67]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500013.china.huawei.com (7.185.36.172)
X-CFilter-Loop: Reflected
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
Cc: linux-arch@vger.kernel.org, mark.rutland@arm.com, daniel.thompson@linaro.org, michal.lkml@markovi.net, pasha.tatashin@soleen.com, will@kernel.org, linux-kbuild@vger.kernel.org, peterz@infradead.org, catalin.marinas@arm.com, masahiroy@kernel.org, ndesaulniers@google.com, linux-kernel@vger.kernel.org, madvenka@linux.microsoft.com, rmk+kernel@armlinux.org.uk, live-patching@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, jpoimboe@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Mark,

Thanks for review!

On 2022/6/30 1:47, Mark Brown wrote:
> On Thu, Jun 23, 2022 at 09:49:02AM +0800, Chen Zhongjin wrote:
>> Code symbols not following the aarch64 procedure call convention should
>> be annotated with SYM_CODE_* instead of SYM_FUNC_*
>>
>> Mark relevant symbols as generic code symbols.
> 
>> -SYM_CODE_START(tramp_exit_native)
>> +SYM_CODE_START_LOCAL(tramp_exit_native)
>>  	tramp_exit
>>  SYM_CODE_END(tramp_exit_native)
>>  
>> -SYM_CODE_START(tramp_exit_compat)
>> +SYM_CODE_START_LOCAL(tramp_exit_compat)
> 
> The commit log says this is fixing things mistakenly lablelld SYM_FUNC
> but this bit of the actual change is making some symbols local.
> 

It makes sense. I'll remove this because whether this symbol is global makes few
difference here.

>> -SYM_FUNC_START_LOCAL(__create_page_tables)
>> +SYM_CODE_START_LOCAL(__create_page_tables)
>>  	mov	x28, lr
>>  
>>  	/*
>> @@ -389,7 +389,7 @@ SYM_FUNC_START_LOCAL(__create_page_tables)
>>  	bl	dcache_inval_poc
>>  
>>  	ret	x28
>> -SYM_FUNC_END(__create_page_tables)
>> +SYM_CODE_END(__create_page_tables)
> 
> This is removed by Ard's recent refactoring, the others that are still
> present look valid enough (for things that don't use the stack IIRC they
> could be seen as conforming but equally this is all running in non
> standard environments).

You are right, for SYM_CODE_, objtool won't generate ORC automatically as other
normal functions, unless UNWIND_HINT is explicitly specified for non-standard
stack frames.

