Return-Path: <linuxppc-dev+bounces-14089-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD009C4CE44
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Nov 2025 11:08:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d5Mgp5mm7z304Q;
	Tue, 11 Nov 2025 21:08:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762855734;
	cv=none; b=YVj0GEQh+UMHYIVflQ/Ow4y/FrBzG3AMIeVvGFTVd7K45G12V9iemEJN2LZcfEogTQZZLfBEdL2lCiJGr/aUr+euD673pkaYyw+/tolA9JEUXC2x0FlVA5/eQd1NG3sfHm/suFg0jl/gdR7CuArmO0xHKnd38Jz4O5MTA4ZzSQdeDF24qCTBXjzZNkiVEpLbs3DxE73WqcE+oY4HntMZzGJZi17VpmT7htLoOJcVhUmt/Gb2lVtOqIGRqT6OJmjPd2oOgWPy70hd21gUSn+K0tgOs7wtUakyYJnY5IDUWhz6hbrxTHe6T6dXUw4XwxAD3OeX6FgORFto9LGyD87GQg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762855734; c=relaxed/relaxed;
	bh=t+WmW7yNqD2aweWk296ozfzQ200USyv416afCxbmVnk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PA62rknX64tslB4u/RSM0ipMulFAAZx4Clkqb7dFY2dacqoxdJrWJDthk44bNw0a5jUIOwB3ODfJ6O6IU6lRljy9XiFBPPsqxJlK0J1YgZ8Hw5a2gp0MANZ/VoePPrWUZLKgZ2U4OiCcooOHoVTOOjwQjJx+aYa2fkITyIhgRXbRw6vJfh5/Rboptj3bqk9TGtrCJz00aJ03kDQLtSdUyAtIxzHQn7HCJuV6qhasJHL1jqAeXRYB6+xRi8tE8Pq5AqOccvI8dKFvJBezEBjG2l1e3yUxZ1tYsj7tQ186b2evghmaaC+JvmVjGoy3vl9f5+yUxjbLUPf63YyqPEqRAw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d5Mgn56Bqz2yvZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Nov 2025 21:08:51 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ACCFF2F;
	Tue, 11 Nov 2025 02:08:11 -0800 (PST)
Received: from [10.57.88.30] (unknown [10.57.88.30])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D9E443F63F;
	Tue, 11 Nov 2025 02:08:13 -0800 (PST)
Message-ID: <e2497863-8cbf-42b2-8f83-2c7b46fd1f47@arm.com>
Date: Tue, 11 Nov 2025 10:08:12 +0000
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
Subject: Re: [PATCH v4 02/12] x86/xen: simplify flush_lazy_mmu()
Content-Language: en-GB
To: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, "David S. Miller"
 <davem@davemloft.net>, David Woodhouse <dwmw2@infradead.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
 Jann Horn <jannh@google.com>, Juergen Gross <jgross@suse.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Suren Baghdasaryan
 <surenb@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251029100909.3381140-1-kevin.brodsky@arm.com>
 <20251029100909.3381140-3-kevin.brodsky@arm.com>
 <b165098a-8164-4664-aaaf-1e8c4391d797@arm.com>
 <b21fb5b9-2e7f-4cbc-ae62-015b1317a9bd@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <b21fb5b9-2e7f-4cbc-ae62-015b1317a9bd@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 10/11/2025 10:36, Kevin Brodsky wrote:
> On 07/11/2025 12:31, Ryan Roberts wrote:
>> On 29/10/2025 10:08, Kevin Brodsky wrote:
>>> arch_flush_lazy_mmu_mode() is called when outstanding batched
>>> pgtable operations must be completed immediately. There should
>>> however be no need to leave and re-enter lazy MMU completely. The
>>> only part of that sequence that we really need is xen_mc_flush();
>>> call it directly.
>>>
>>> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
>> This looks functionally equivalent to me, so:
>>
>> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
>>
>> But I don't think this tidy up is strictly necessary for your series to work?
>> (perhaps I'll change my mind on that as I go through it).
> 
> I initially thought it might be, but in the end I think you're right -
> it should still work fine without this patch.
> 
> Still, I'd rather avoid unnecessary calls to arch_enter() and
> arch_leave() as it makes it harder to reason about what is called where.
> Namely, keeping them here means that a nested call to
> lazy_mmu_mode_disable() would cause arch_leave() then arch_enter() to be
> called - rather unexpected.
> 
> The only calls to arch_enter() and arch_leave() that are left after this
> series are the ones in <linux/pgtable.h> and the Xen context-switching
> logic (the one case where calling arch hooks directly is justified, see
> discussion on v3 [1]).

OK yeah, sounds reasonable.

> 
> - Kevin
> 
> [1]
> https://lore.kernel.org/all/390e41ae-4b66-40c1-935f-7a1794ba0b71@arm.com/


