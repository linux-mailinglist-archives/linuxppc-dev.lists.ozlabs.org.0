Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9534556FF8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jun 2022 03:38:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LT2w03cGFz3cgL
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jun 2022 11:38:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=chenzhongjin@huawei.com; receiver=<UNKNOWN>)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LT2vX3j7Qz3bln
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jun 2022 11:38:13 +1000 (AEST)
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.53])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4LT2rG1SKTzhXZY;
	Thu, 23 Jun 2022 09:35:26 +0800 (CST)
Received: from dggpemm500013.china.huawei.com (7.185.36.172) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 23 Jun 2022 09:37:33 +0800
Received: from [127.0.0.1] (10.67.108.67) by dggpemm500013.china.huawei.com
 (7.185.36.172) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 23 Jun
 2022 09:37:33 +0800
Message-ID: <913e2f4a-ec70-d914-ce70-0cfea7d52921@huawei.com>
Date: Thu, 23 Jun 2022 09:37:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v5 00/33] objtool: add base support for arm64
Content-Language: en-US
To: Daniel Thompson <daniel.thompson@linaro.org>
References: <20220622154920.95075-1-chenzhongjin@huawei.com>
 <20220622171946.mc3cd375fy4fou3b@maple.lan>
From: Chen Zhongjin <chenzhongjin@huawei.com>
In-Reply-To: <20220622171946.mc3cd375fy4fou3b@maple.lan>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.108.67]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
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
Cc: linux-arch@vger.kernel.org, mark.rutland@arm.com, michal.lkml@markovi.net, pasha.tatashin@soleen.com, will@kernel.org, linux-kbuild@vger.kernel.org, peterz@infradead.org, catalin.marinas@arm.com, masahiroy@kernel.org, ndesaulniers@google.com, linux-kernel@vger.kernel.org, madvenka@linux.microsoft.com, rmk+kernel@armlinux.org.uk, broonie@kernel.org, live-patching@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, jpoimboe@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On 2022/6/23 1:19, Daniel Thompson wrote:
> On Wed, Jun 22, 2022 at 11:48:47PM +0800, Chen Zhongjin wrote:
>> This series enables objtool to start doing stack validation and orc
>> generation on arm64 kernel builds.
>>
>> Based on Julien's previous work(1)(2), Now I have finished most of work
>> for objtool enable on arm64. This series includes objtool part [1-13]
>> and arm64 support part [14-33], the second part is to make objtool run
>> correctly with no warning on arm64 so if necessary it can be taken apart
>> as two series.
>>
>> ORC generation feature is implemented but not used because we don't have
>> an unwinder_orc on arm64, now it only be used to check whether objtool
>> has correct validation.
>>
>> This series depends on (https://lkml.org/lkml/2022/6/22/463)
>> I moved some changes which work for all architectures to that series
>> because this one becomes too big now.
>> And it is rebased to tip/objtool/core branch.
> 
> What is the sha1 of the base?
> 
> With b4 and git am the patch series is derailing at patch 6 and I'm even
> after a bit of fixup (had to use rediff) I'm still getting a cascade of
> errors in later patches to decode.c .
> 
> 
> Daniel.
> .

Thanks for your review!

It seems I stupidly deleted something before sending the patch. I'm trying to
regenerate it and send another version.

Very sorry for that makes trouble, please try the next version later, thanks!

Best,
Chen

