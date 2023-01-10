Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A429663A6B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 09:05:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nrjzb0TWjz3c8x
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 19:05:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=bkMGUV5j;
	dkim=fail reason="signature verification failed" header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=jMlUUvZi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz (client-ip=195.135.220.28; helo=smtp-out1.suse.de; envelope-from=vbabka@suse.cz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=bkMGUV5j;
	dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=jMlUUvZi;
	dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nrjyb3HGdz3c61
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jan 2023 19:04:38 +1100 (AEDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 558F24E0AD;
	Tue, 10 Jan 2023 08:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1673337859; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=15Ddtu/7qxw5eMSlnsFVGSlfgAQfIR6dNvo68q5wauM=;
	b=bkMGUV5j7WHNqCvCYYj4CfuhyVWMG1FihfQs3FDQvYsD+EUttzsajuOzHDoykPY1FkCUhA
	ciHm28fp9KLmZ4btDVFftnnuynWIkZdOLQ1pAzp6Huh4FtOmdPT6uvqYfutZvH/5z861Y4
	HkRIdagbxSDGdwYn7B+e6o8QuWUIbzE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1673337859;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=15Ddtu/7qxw5eMSlnsFVGSlfgAQfIR6dNvo68q5wauM=;
	b=jMlUUvZiWJb4nWS1WGaBP5M4JOwo6r8wna7GswTb+c08fyvFZeLybZ0CNenHGyH7I/wqJs
	6Y2gcmGussrmGvAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9F5251358A;
	Tue, 10 Jan 2023 08:04:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id TGk1JgIcvWOEBAAAMHmgww
	(envelope-from <vbabka@suse.cz>); Tue, 10 Jan 2023 08:04:18 +0000
Message-ID: <5874fea2-fc3b-5e5d-50ac-e413a11819a5@suse.cz>
Date: Tue, 10 Jan 2023 09:04:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 41/41] mm: replace rw_semaphore with atomic_t in vma_lock
Content-Language: en-US
To: Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org
References: <20230109205336.3665937-1-surenb@google.com>
 <20230109205336.3665937-42-surenb@google.com>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <20230109205336.3665937-42-surenb@google.com>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, laurent.dufour@fr.ibm.com, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, linux-arm-kernel@lists.infradead.org, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, tatashin@google.com, mgorman@techsingularity.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 1/9/23 21:53, Suren Baghdasaryan wrote:
> rw_semaphore is a sizable structure of 40 bytes and consumes
> considerable space for each vm_area_struct. However vma_lock has
> two important specifics which can be used to replace rw_semaphore
> with a simpler structure:
> 1. Readers never wait. They try to take the vma_lock and fall back to
> mmap_lock if that fails.
> 2. Only one writer at a time will ever try to write-lock a vma_lock
> because writers first take mmap_lock in write mode.
> Because of these requirements, full rw_semaphore functionality is not
> needed and we can replace rw_semaphore with an atomic variable.
> When a reader takes read lock, it increments the atomic unless the
> value is negative. If that fails read-locking is aborted and mmap_lock
> is used instead.
> When writer takes write lock, it resets atomic value to -1 if the
> current value is 0 (no readers). Since all writers take mmap_lock in
> write mode first, there can be only one writer at a time. If there
> are readers, writer will place itself into a wait queue using new
> mm_struct.vma_writer_wait waitqueue head. The last reader to release
> the vma_lock will signal the writer to wake up.
> vm_lock_seq is also moved into vma_lock and along with atomic_t they
> are nicely packed and consume 8 bytes, bringing the overhead from
> vma_lock from 44 to 16 bytes:
> 
>     slabinfo before the changes:
>      <name>            ... <objsize> <objperslab> <pagesperslab> : ...
>     vm_area_struct    ...    152   53    2 : ...
> 
>     slabinfo with vma_lock:
>      <name>            ... <objsize> <objperslab> <pagesperslab> : ...
>     rw_semaphore      ...      8  512    1 : ...

I guess the cache is called vma_lock, not rw_semaphore?

>     vm_area_struct    ...    160   51    2 : ...
> 
> Assuming 40000 vm_area_structs, memory consumption would be:
> baseline: 6040kB
> vma_lock (vm_area_structs+vma_lock): 6280kB+316kB=6596kB
> Total increase: 556kB
> 
> atomic_t might overflow if there are many competing readers, therefore
> vma_read_trylock() implements an overflow check and if that occurs it
> restors the previous value and exits with a failure to lock.
> 
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>

This patch is indeed an interesting addition indeed, but I can't help but
think it obsoletes the previous one :) We allocate an extra 8 bytes slab
object for the lock, and the pointer to it is also 8 bytes, and requires an
indirection. The vma_lock cache is not cacheline aligned (otherwise it would
be a major waste), so we have potential false sharing with up to 7 other
vma_lock's.
I'd expect if the vma_lock was placed with the relatively cold fields of
vm_area_struct, it shouldn't cause much cache ping pong when working with
that vma. Even if we don't cache align the vma to save memory (would be 192
bytes instead of 160 when aligned) and place the vma_lock and the cold
fields at the end of the vma, it may be false sharing the cacheline with the
next vma in the slab. But that's a single vma, not up to 7, so it shouldn't
be worse?


