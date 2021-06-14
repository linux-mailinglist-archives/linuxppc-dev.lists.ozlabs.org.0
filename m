Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BDC03A5C77
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Jun 2021 07:27:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G3Khz1FFYz3cDQ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Jun 2021 15:27:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G3Khf1Vpsz2xtt
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Jun 2021 15:27:27 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4G3KhV14cZzBDBP;
 Mon, 14 Jun 2021 07:27:22 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UWgPplpQZ_8c; Mon, 14 Jun 2021 07:27:22 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4G3KhV017RzBDBC;
 Mon, 14 Jun 2021 07:27:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E6CCB8B789;
 Mon, 14 Jun 2021 07:27:21 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id t7pqco8zY48P; Mon, 14 Jun 2021 07:27:21 +0200 (CEST)
Received: from [172.25.230.102] (po15451.idsi0.si.c-s.fr [172.25.230.102])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B6FFB8B763;
 Mon, 14 Jun 2021 07:27:21 +0200 (CEST)
Subject: Re: [PATCH 5/6] mm/mremap: Use pmd/pud_poplulate to update page table
 entries
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Matthew Wilcox <willy@infradead.org>
References: <20210610083549.386085-1-aneesh.kumar@linux.ibm.com>
 <20210610083549.386085-6-aneesh.kumar@linux.ibm.com>
 <CAHk-=wi+J+iodze9FtjM3Zi4j4OeS+qqbKxME9QN4roxPEXH9Q@mail.gmail.com>
 <87wnqy9lru.fsf@linux.ibm.com> <YMXi6AZm4fPpPKrH@casper.infradead.org>
 <dd2f0d9d-da78-46a4-78cb-c5cfb7df7f16@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <d49125f2-ab15-05a8-7982-12cbbfcc4dc9@csgroup.eu>
Date: Mon, 14 Jun 2021 07:27:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <dd2f0d9d-da78-46a4-78cb-c5cfb7df7f16@linux.ibm.com>
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
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Nick Piggin <npiggin@gmail.com>, Linux-MM <linux-mm@kvack.org>,
 Kalesh Singh <kaleshsingh@google.com>, Joel Fernandes <joel@joelfernandes.org>,
 "Kirill A . Shutemov" <kirill@shutemov.name>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 13/06/2021 à 13:13, Aneesh Kumar K.V a écrit :
> On 6/13/21 4:20 PM, Matthew Wilcox wrote:
>> On Sun, Jun 13, 2021 at 02:36:13PM +0530, Aneesh Kumar K.V wrote:
>>> IIUC the reason why we do have pmd_pgtable() is that pgtable_t type
>>> is arch dependent. On some architecture it is pte_t * and on the other
>>> struct page *. The reason being highmem and level 4 page table can
>>> be located in highmem.
>>
>> That is ahistorical.  See 2f569afd9ced9ebec9a6eb3dbf6f83429be0a7b4 --
>> we have pgtable_t for the benefit of s390's crazy sub-page page table
>> sizes.
> 
> That is also true with ppc64. We do sub-page page table size. I was trying to explain why it can't 
> be pte_t * everywhere and why we have
> it as struct page *.

ppc32 as well. On the 8xx, with 16k size pages, the HW still use 4k page tables, so we do use sub-pages.

In order too keep the code simple, we have converted all powerpc to sub-pages for that, allthough 
some powerpc platforms have only one sub-page per page.

Christophe
