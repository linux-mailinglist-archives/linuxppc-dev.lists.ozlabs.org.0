Return-Path: <linuxppc-dev+bounces-10885-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB56EB2357D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Aug 2025 20:50:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c1gYw14gFz2xck;
	Wed, 13 Aug 2025 04:50:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755024644;
	cv=none; b=oDPqn35/4jAWZ/nE1Rc+2H0P7TGDX9CoV0iKX4rG9U0W+p/sUqzC7tc5HcK+DC+K8vvhAQgFJmnlg1LiUUMHyPVSRF2aiyb0UJBxM0ZLP7TcF+WK97MRYeVo4uy2NKV8I+LXHNeOUEP03y1PT7iylC9eF2SaYkQ7wUnM24Yo84+z/ufVn5o5Z6BLN222AGfopl5g5Cpzor7IBcpCAu9A36S1LALuiS26QcVmti9/QGaE376mivG9ZEwgvFM5I97q+eSTLUIm5OH5Tui6SPf00+PweoCZcrDEXV+vl/8ArW+8oTZl7CVWiBFPeFpuA3Gm7Ydkbtg1xDf/uXGcBrPwlA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755024644; c=relaxed/relaxed;
	bh=CtG2kVxK8k1NQdvyEki9JRqyDdfWlHhua5AM1GdDq2k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y+/g37pMyDhsY/J71efuqOrSHh6TKXX/jdAPoE83kZAwoymzjPxeexFrbS7OOpQ2iX7DH3T0VoQBxEGtGgGVQp3+yZUz9PYJhk1qzTiHOyYoM1fjXbX8q/rf6/nhl+oGrFPhZlU9Agu5L/+SruZMDwXZ3gesge6WjUbcTLqUShnzY69h/jyt+rRDn+jtEt9MVuC+I/QvUxULZu2z7PPVIqk5MSx9wBDpSAoB0/d9wVA/CN2I1DD6H0E16JzfJxMQjE8sttINJlutDHlWM/ZJfrf9x9sozxzKyrS1CMhA3UNDYMH6W6wKw8s1wkPIcQ1R/ieiPYL3IlVDxIxF0R5q3Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c1gYv3vlFz2xcD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Aug 2025 04:50:43 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4c1gK71N21z9sSN;
	Tue, 12 Aug 2025 20:39:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W34agYFEkjYq; Tue, 12 Aug 2025 20:39:39 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4c1gK707Z2z9sSL;
	Tue, 12 Aug 2025 20:39:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D45368B764;
	Tue, 12 Aug 2025 20:39:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id KCsZS5tQGZ3E; Tue, 12 Aug 2025 20:39:38 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 03CD88B763;
	Tue, 12 Aug 2025 20:39:36 +0200 (CEST)
Message-ID: <1cc6f739-3891-4cc7-84ac-676fef62c445@csgroup.eu>
Date: Tue, 12 Aug 2025 20:39:36 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/11] powerpc/ptdump: rename "struct pgtable_level" to
 "struct ptdump_pglevel"
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 xen-devel@lists.xenproject.org, linux-fsdevel@vger.kernel.org,
 nvdimm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Dan Williams <dan.j.williams@intel.com>, Matthew Wilcox
 <willy@infradead.org>, Jan Kara <jack@suse.cz>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>,
 Hugh Dickins <hughd@google.com>, Oscar Salvador <osalvador@suse.de>,
 Lance Yang <lance.yang@linux.dev>
References: <20250811112631.759341-1-david@redhat.com>
 <20250811112631.759341-7-david@redhat.com>
 <dac9e243-33ce-4203-a598-2877cf908cad@lucifer.local>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <dac9e243-33ce-4203-a598-2877cf908cad@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Lorenzo,

Le 12/08/2025 à 20:23, Lorenzo Stoakes a écrit :
> On Mon, Aug 11, 2025 at 01:26:26PM +0200, David Hildenbrand wrote:
>> We want to make use of "pgtable_level" for an enum in core-mm. Other
>> architectures seem to call "struct pgtable_level" either:
>> * "struct pg_level" when not exposed in a header (riscv, arm)
>> * "struct ptdump_pg_level" when expose in a header (arm64)
>>
>> So let's follow what arm64 does.
>>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
> 
> This LGTM, but I'm super confused what these are for, they don't seem to be
> used anywhere? Maybe I'm missing some macro madness, but it seems like dead
> code anyway?

pg_level[] are used several times in arch/powerpc/mm/ptdump/ptdump.c, 
for instance here:

static void note_page_update_state(struct pg_state *st, unsigned long 
addr, int level, u64 val)
{
	u64 flag = level >= 0 ? val & pg_level[level].mask : 0;
	u64 pa = val & PTE_RPN_MASK;

	st->level = level;
	st->current_flags = flag;
	st->start_address = addr;
	st->start_pa = pa;

	while (addr >= st->marker[1].start_address) {
		st->marker++;
		pt_dump_seq_printf(st->seq, "---[ %s ]---\n", st->marker->name);
	}
}

> 
> Anyway:
> 
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> 
>> ---
>>   arch/powerpc/mm/ptdump/8xx.c      | 2 +-
>>   arch/powerpc/mm/ptdump/book3s64.c | 2 +-
>>   arch/powerpc/mm/ptdump/ptdump.h   | 4 ++--
>>   arch/powerpc/mm/ptdump/shared.c   | 2 +-
>>   4 files changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/arch/powerpc/mm/ptdump/8xx.c b/arch/powerpc/mm/ptdump/8xx.c
>> index b5c79b11ea3c2..4ca9cf7a90c9e 100644
>> --- a/arch/powerpc/mm/ptdump/8xx.c
>> +++ b/arch/powerpc/mm/ptdump/8xx.c
>> @@ -69,7 +69,7 @@ static const struct flag_info flag_array[] = {
>>   	}
>>   };
>>
>> -struct pgtable_level pg_level[5] = {
>> +struct ptdump_pg_level pg_level[5] = {
>>   	{ /* pgd */
>>   		.flag	= flag_array,
>>   		.num	= ARRAY_SIZE(flag_array),
>> diff --git a/arch/powerpc/mm/ptdump/book3s64.c b/arch/powerpc/mm/ptdump/book3s64.c
>> index 5ad92d9dc5d10..6b2da9241d4c4 100644
>> --- a/arch/powerpc/mm/ptdump/book3s64.c
>> +++ b/arch/powerpc/mm/ptdump/book3s64.c
>> @@ -102,7 +102,7 @@ static const struct flag_info flag_array[] = {
>>   	}
>>   };
>>
>> -struct pgtable_level pg_level[5] = {
>> +struct ptdump_pg_level pg_level[5] = {
>>   	{ /* pgd */
>>   		.flag	= flag_array,
>>   		.num	= ARRAY_SIZE(flag_array),
>> diff --git a/arch/powerpc/mm/ptdump/ptdump.h b/arch/powerpc/mm/ptdump/ptdump.h
>> index 154efae96ae09..4232aa4b57eae 100644
>> --- a/arch/powerpc/mm/ptdump/ptdump.h
>> +++ b/arch/powerpc/mm/ptdump/ptdump.h
>> @@ -11,12 +11,12 @@ struct flag_info {
>>   	int		shift;
>>   };
>>
>> -struct pgtable_level {
>> +struct ptdump_pg_level {
>>   	const struct flag_info *flag;
>>   	size_t num;
>>   	u64 mask;
>>   };
>>
>> -extern struct pgtable_level pg_level[5];
>> +extern struct ptdump_pg_level pg_level[5];
>>
>>   void pt_dump_size(struct seq_file *m, unsigned long delta);
>> diff --git a/arch/powerpc/mm/ptdump/shared.c b/arch/powerpc/mm/ptdump/shared.c
>> index 39c30c62b7ea7..58998960eb9a4 100644
>> --- a/arch/powerpc/mm/ptdump/shared.c
>> +++ b/arch/powerpc/mm/ptdump/shared.c
>> @@ -67,7 +67,7 @@ static const struct flag_info flag_array[] = {
>>   	}
>>   };
>>
>> -struct pgtable_level pg_level[5] = {
>> +struct ptdump_pg_level pg_level[5] = {
>>   	{ /* pgd */
>>   		.flag	= flag_array,
>>   		.num	= ARRAY_SIZE(flag_array),
>> --
>> 2.50.1
>>


