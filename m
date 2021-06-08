Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0172439F9AC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 16:55:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FztZG1VMrz302f
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Jun 2021 00:55:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FztYv27Npz2xZJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Jun 2021 00:54:40 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4FztYn36F5z9trp;
 Tue,  8 Jun 2021 16:54:37 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 470n_Hf-Cc4b; Tue,  8 Jun 2021 16:54:37 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FztYl2NxWzBDhb;
 Tue,  8 Jun 2021 16:54:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 338438B7C1;
 Tue,  8 Jun 2021 16:54:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id CBcAUjaryt1b; Tue,  8 Jun 2021 16:54:35 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9FE408B7BF;
 Tue,  8 Jun 2021 16:54:34 +0200 (CEST)
Subject: Re: [PATCH v3 resend 11/15] powerpc: convert to
 setup_initial_init_mm()
To: Souptick Joarder <jrdr.linux@gmail.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>
References: <20210608083418.137226-1-wangkefeng.wang@huawei.com>
 <20210608083418.137226-12-wangkefeng.wang@huawei.com>
 <CAFqt6zZWanzsy=F4LVUkovQE-wqKd0CNG-n=Sx7SBddord6Gcg@mail.gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <215985fd-67d5-731f-743c-ea446b55bb8d@csgroup.eu>
Date: Tue, 8 Jun 2021 16:54:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFqt6zZWanzsy=F4LVUkovQE-wqKd0CNG-n=Sx7SBddord6Gcg@mail.gmail.com>
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
Cc: Linux-MM <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 08/06/2021 à 16:36, Souptick Joarder a écrit :
> On Tue, Jun 8, 2021 at 1:56 PM Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
>>
>> Use setup_initial_init_mm() helper to simplify code.
>>
>> Note klimit is (unsigned long) _end, with new helper,
>> will use _end directly.
> 
> With this change klimit left with no user in this file and can be
> moved to some appropriate header.
> But in a separate series.

I have a patch to remove klimit, see 
https://patchwork.ozlabs.org/project/linuxppc-dev/patch/9fa9ba6807c17f93f35a582c199c646c4a8bfd9c.1622800638.git.christophe.leroy@csgroup.eu/

Christophe


> 
>>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>> Cc: linuxppc-dev@lists.ozlabs.org
>> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
>> ---
>>   arch/powerpc/kernel/setup-common.c | 5 +----
>>   1 file changed, 1 insertion(+), 4 deletions(-)
>>
>> diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
>> index 74a98fff2c2f..96697c6e1e16 100644
>> --- a/arch/powerpc/kernel/setup-common.c
>> +++ b/arch/powerpc/kernel/setup-common.c
>> @@ -927,10 +927,7 @@ void __init setup_arch(char **cmdline_p)
>>
>>          klp_init_thread_info(&init_task);
>>
>> -       init_mm.start_code = (unsigned long)_stext;
>> -       init_mm.end_code = (unsigned long) _etext;
>> -       init_mm.end_data = (unsigned long) _edata;
>> -       init_mm.brk = klimit;
>> +       setup_initial_init_mm(_stext, _etext, _edata, _end);
>>
>>          mm_iommu_init(&init_mm);
>>          irqstack_early_init();
>> --
>> 2.26.2
>>
>>
