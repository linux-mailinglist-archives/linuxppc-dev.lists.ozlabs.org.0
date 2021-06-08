Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D8C39F9C0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 16:58:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fztdk5j8Lz30G8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Jun 2021 00:58:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FztdN5K55z2xZJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Jun 2021 00:57:44 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4FztdJ6WHszBDj8;
 Tue,  8 Jun 2021 16:57:40 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rYF-J-sCzJxT; Tue,  8 Jun 2021 16:57:40 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FztdJ5XkGzBDj7;
 Tue,  8 Jun 2021 16:57:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A9A608B7BF;
 Tue,  8 Jun 2021 16:57:40 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Kq4BMwCmb5qz; Tue,  8 Jun 2021 16:57:40 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5B2B78B7C0;
 Tue,  8 Jun 2021 16:57:39 +0200 (CEST)
Subject: Re: [PATCH v3 resend 01/15] mm: add setup_initial_init_mm() helper
To: Souptick Joarder <jrdr.linux@gmail.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>
References: <20210608083418.137226-1-wangkefeng.wang@huawei.com>
 <20210608083418.137226-2-wangkefeng.wang@huawei.com>
 <CAFqt6zYmCQ=wxEjnOJ6fgJWYQyFajBuxWD=UT_D-WjWUS_4pcw@mail.gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <34f88fdc-1842-7954-bccc-0142a8d66eea@csgroup.eu>
Date: Tue, 8 Jun 2021 16:57:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFqt6zYmCQ=wxEjnOJ6fgJWYQyFajBuxWD=UT_D-WjWUS_4pcw@mail.gmail.com>
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
Cc: uclinux-h8-devel@lists.sourceforge.jp, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, X86 ML <x86@kernel.org>,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 Linux-MM <linux-mm@kvack.org>, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 08/06/2021 à 16:53, Souptick Joarder a écrit :
> On Tue, Jun 8, 2021 at 1:56 PM Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
>>
>> Add setup_initial_init_mm() helper to setup kernel text,
>> data and brk.
>>
>> Cc: linux-snps-arc@lists.infradead.org
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-csky@vger.kernel.org
>> Cc: uclinux-h8-devel@lists.sourceforge.jp
>> Cc: linux-m68k@lists.linux-m68k.org
>> Cc: openrisc@lists.librecores.org
>> Cc: linuxppc-dev@lists.ozlabs.org
>> Cc: linux-riscv@lists.infradead.org
>> Cc: linux-sh@vger.kernel.org
>> Cc: linux-s390@vger.kernel.org
>> Cc: x86@kernel.org
>> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
>> ---
>>   include/linux/mm.h | 3 +++
>>   mm/init-mm.c       | 9 +++++++++
>>   2 files changed, 12 insertions(+)
>>
>> diff --git a/include/linux/mm.h b/include/linux/mm.h
>> index c274f75efcf9..02aa057540b7 100644
>> --- a/include/linux/mm.h
>> +++ b/include/linux/mm.h
>> @@ -244,6 +244,9 @@ int __add_to_page_cache_locked(struct page *page, struct address_space *mapping,
>>
>>   #define lru_to_page(head) (list_entry((head)->prev, struct page, lru))
>>
>> +void setup_initial_init_mm(void *start_code, void *end_code,
>> +                          void *end_data, void *brk);
>> +
> 
> Gentle query -> is there any limitation to add inline functions in
> setup_arch() functions ?

Kefeng just followed comment from Mike I guess, see 
https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20210604070633.32363-2-wangkefeng.wang@huawei.com/#2696253

Christophe

