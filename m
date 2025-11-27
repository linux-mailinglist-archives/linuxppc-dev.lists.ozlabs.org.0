Return-Path: <linuxppc-dev+bounces-14521-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F37C8DDCD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Nov 2025 11:58:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dHD1H4gR7z2yvW;
	Thu, 27 Nov 2025 21:58:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764241091;
	cv=none; b=a8klXAhmXFWfL6Cq4ZUG5R/8qW5Megq+wUCHP/OEBYA4a+VYft6mh75CaFSbwL3uBIFN8awHIT0jgfTq5Gk1nyGklRvo97TnaP5BWpchF3211CkMpSDWJJ4P3ZJwubzKfoRiLAZ7aa8f1EUs0j3Gx/uouE35QzcfoAVSREo45WNODi/vSM0Ea953lnPLkClNE4uoC09KejUay3VbPgE4vIcK2Ye/8nuvqMnGi9F1YWIayEUn2BshgONcUMO8Xnp1s8hPEHHdhzVkBi1er0kjHgHDC2zNU4OMV1TRzkTefgaOjUmRBqovMQRDpczb9KhvcZ0SNLJnyjU4nCnftbID3w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764241091; c=relaxed/relaxed;
	bh=dSkfS1PH0V2GqQ7JwCU589oUysx1YAYg5wc2qE7DJO8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i2Rgv6fMT8RP0kJV9PuTTcOUoLtiX72QbNButc2bdET4fEiA7rkLgbLKR+9UWc3xiv4J0cxeKeFtw10RbO9iHUnNWI0YJTxUM8JiVUdxVeyiZFuMJpKtyWxQ1tnjZxsRI2jZOMtLejcxGXhM29a4bxCzhWSpxPWkWw+xx2ZxeS8d8Eblmy0Q5RFy8QAZ0isQH+GHjskKcnjLkjCXNDc2XErHmX6iXBImUai8a08ElwuZAib2+dk/SG8gA8bYZpdJb8mUEJQuF48s9W+RuW8Y5Lc+2xuucvlMdiaFIe8jVzxLVUrscDfPUL4Q+HG2gh8ybH6d2qcDhiIfouGXFhHL/w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass (client-ip=195.135.223.130; helo=smtp-out1.suse.de; envelope-from=pfalcato@suse.de; receiver=lists.ozlabs.org) smtp.mailfrom=suse.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.223.130; helo=smtp-out1.suse.de; envelope-from=pfalcato@suse.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 313 seconds by postgrey-1.37 at boromir; Thu, 27 Nov 2025 21:58:10 AEDT
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dHD1G5Cywz2xQq
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Nov 2025 21:58:10 +1100 (AEDT)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7B48433693;
	Thu, 27 Nov 2025 10:52:54 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B0C7F3EA63;
	Thu, 27 Nov 2025 10:52:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id xrDGJ4ItKGlFNgAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Thu, 27 Nov 2025 10:52:50 +0000
Date: Thu, 27 Nov 2025 10:52:49 +0000
From: Pedro Falcato <pfalcato@suse.de>
To: Barry Song <21cnbao@gmail.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, 
	Oven Liyang <liyangouwen1@oppo.com>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Matthew Wilcox <willy@infradead.org>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Oscar Salvador <osalvador@suse.de>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Mark Rutland <mark.rutland@arm.com>, Ada Couprie Diaz <ada.coupriediaz@arm.com>, 
	Robin Murphy <robin.murphy@arm.com>, Kristina =?utf-8?Q?Mart=C5=A1enko?= <kristina.martsenko@arm.com>, 
	Kevin Brodsky <kevin.brodsky@arm.com>, Yeoreum Yun <yeoreum.yun@arm.com>, 
	Wentao Guan <guanwentao@uniontech.com>, Thorsten Blum <thorsten.blum@linux.dev>, 
	Steven Rostedt <rostedt@goodmis.org>, Yunhui Cui <cuiyunhui@bytedance.com>, 
	Nam Cao <namcao@linutronix.de>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, 
	Barry Song <v-songbaohua@oppo.com>
Subject: Re: [RFC PATCH 1/2] mm/filemap: Retry fault by VMA lock if the lock
 was released for I/O
Message-ID: <5by7tko4v3kqvvpu4fdsgpw42yl5ed5qisbaz3la4an52hq4j2@v75fagey6gva>
References: <20251127011438.6918-1-21cnbao@gmail.com>
 <20251127011438.6918-2-21cnbao@gmail.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251127011438.6918-2-21cnbao@gmail.com>
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Queue-Id: 7B48433693
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spam-Score: -4.00
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Nov 27, 2025 at 09:14:37AM +0800, Barry Song wrote:
> From: Oven Liyang <liyangouwen1@oppo.com>
> 
> If the current page fault is using the per-VMA lock, and we only released
> the lock to wait for I/O completion (e.g., using folio_lock()), then when
> the fault is retried after the I/O completes, it should still qualify for
> the per-VMA-lock path.
> 
<snip>
> Signed-off-by: Oven Liyang <liyangouwen1@oppo.com>
> Signed-off-by: Barry Song <v-songbaohua@oppo.com>
> ---
>  arch/arm/mm/fault.c       | 5 +++++
>  arch/arm64/mm/fault.c     | 5 +++++
>  arch/loongarch/mm/fault.c | 4 ++++
>  arch/powerpc/mm/fault.c   | 5 ++++-
>  arch/riscv/mm/fault.c     | 4 ++++
>  arch/s390/mm/fault.c      | 4 ++++
>  arch/x86/mm/fault.c       | 4 ++++

If only we could unify all these paths :(

>  include/linux/mm_types.h  | 9 +++++----
>  mm/filemap.c              | 5 ++++-
>  9 files changed, 39 insertions(+), 6 deletions(-)
> 
> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> index b71625378ce3..12b2d65ef1b9 100644
> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -1670,10 +1670,11 @@ enum vm_fault_reason {
>  	VM_FAULT_NOPAGE         = (__force vm_fault_t)0x000100,
>  	VM_FAULT_LOCKED         = (__force vm_fault_t)0x000200,
>  	VM_FAULT_RETRY          = (__force vm_fault_t)0x000400,
> -	VM_FAULT_FALLBACK       = (__force vm_fault_t)0x000800,
> -	VM_FAULT_DONE_COW       = (__force vm_fault_t)0x001000,
> -	VM_FAULT_NEEDDSYNC      = (__force vm_fault_t)0x002000,
> -	VM_FAULT_COMPLETED      = (__force vm_fault_t)0x004000,
> +	VM_FAULT_RETRY_VMA      = (__force vm_fault_t)0x000800,

So, what I am wondering here is why we need one more fault flag versus
just blindly doing this on a plain-old RETRY. Is there any particular
reason why? I can't think of one. 

I would also like to see performance numbers.

The rest of the patch looks OK to me.

-- 
Pedro

