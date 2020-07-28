Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AAD2231198
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jul 2020 20:24:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BGQ746pHJzDr4t
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jul 2020 04:24:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BGQ4w3PQBzDr28
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jul 2020 04:22:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=fB7XuS7s; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4BGQ4w23PRz8tQh
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jul 2020 04:22:24 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4BGQ4w1RRWz9sTK; Wed, 29 Jul 2020 04:22:24 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.81;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=fB7XuS7s; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4BGQ4v4cQ2z9sT6
 for <linuxppc-dev@ozlabs.org>; Wed, 29 Jul 2020 04:22:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595960537;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=hvg77V7s48tRVuMOc3FyCiq83CG8mZmx+x00IAeYa2Y=;
 b=fB7XuS7sZ8wAdfZPDIY48Ch7dx0ipGlYMwx6qinlSseH/dWdxNTpbTolYvY9wLPooeRQBI
 4oOw3K+pR0JG+aQoSQO41237UdZFawo5vsTNwC9Fuf4cZfMmW4MUOF6geCM1XIVSrhAEjk
 6eXoGGHY9jNO+zrw8IcYS0HIHgsIVSc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-381-3nrKdO--Mr-1NdFZoSgqdw-1; Tue, 28 Jul 2020 14:22:15 -0400
X-MC-Unique: 3nrKdO--Mr-1NdFZoSgqdw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7662A8017FB;
 Tue, 28 Jul 2020 18:22:14 +0000 (UTC)
Received: from [10.36.113.249] (ovpn-113-249.ams2.redhat.com [10.36.113.249])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4E52D10013D7;
 Tue, 28 Jul 2020 18:22:12 +0000 (UTC)
Subject: Re: [PATCH v2] pseries/drmem: don't cache node id in drmem_lmb struct
To: Scott Cheloha <cheloha@linux.ibm.com>, linuxppc-dev@ozlabs.org
References: <20200728165339.3031126-1-cheloha@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
 WNyWQQ==
Organization: Red Hat GmbH
Message-ID: <2249e1b4-57f0-dfd3-1104-3e7cb2f90840@redhat.com>
Date: Tue, 28 Jul 2020 20:22:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200728165339.3031126-1-cheloha@linux.ibm.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Michal Suchanek <msuchanek@suse.de>,
 Laurent Dufour <ldufour@linux.vnet.ibm.com>,
 Rick Lindsley <ricklind@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 28.07.20 18:53, Scott Cheloha wrote:
> At memory hot-remove time we can retrieve an LMB's nid from its
> corresponding memory_block.  There is no need to store the nid
> in multiple locations.
> 
> Note that lmb_to_memblock() uses find_memory_block() to get the
> corresponding memory_block.  As find_memory_block() runs in sub-linear
> time this approach is negligibly slower than what we do at present.
> 
> In exchange for this lookup at hot-remove time we no longer need to
> call memory_add_physaddr_to_nid() during drmem_init() for each LMB.
> On powerpc, memory_add_physaddr_to_nid() is a linear search, so this
> spares us an O(n^2) initialization during boot.
> 
> On systems with many LMBs that initialization overhead is palpable and
> disruptive.  For example, on a box with 249854 LMBs we're seeing
> drmem_init() take upwards of 30 seconds to complete:
> 
> [   53.721639] drmem: initializing drmem v2
> [   80.604346] watchdog: BUG: soft lockup - CPU#65 stuck for 23s! [swapper/0:1]
> [   80.604377] Modules linked in:
> [   80.604389] CPU: 65 PID: 1 Comm: swapper/0 Not tainted 5.6.0-rc2+ #4
> [   80.604397] NIP:  c0000000000a4980 LR: c0000000000a4940 CTR: 0000000000000000
> [   80.604407] REGS: c0002dbff8493830 TRAP: 0901   Not tainted  (5.6.0-rc2+)
> [   80.604412] MSR:  8000000002009033 <SF,VEC,EE,ME,IR,DR,RI,LE>  CR: 44000248  XER: 0000000d
> [   80.604431] CFAR: c0000000000a4a38 IRQMASK: 0
> [   80.604431] GPR00: c0000000000a4940 c0002dbff8493ac0 c000000001904400 c0003cfffffede30
> [   80.604431] GPR04: 0000000000000000 c000000000f4095a 000000000000002f 0000000010000000
> [   80.604431] GPR08: c0000bf7ecdb7fb8 c0000bf7ecc2d3c8 0000000000000008 c00c0002fdfb2001
> [   80.604431] GPR12: 0000000000000000 c00000001e8ec200
> [   80.604477] NIP [c0000000000a4980] hot_add_scn_to_nid+0xa0/0x3e0
> [   80.604486] LR [c0000000000a4940] hot_add_scn_to_nid+0x60/0x3e0
> [   80.604492] Call Trace:
> [   80.604498] [c0002dbff8493ac0] [c0000000000a4940] hot_add_scn_to_nid+0x60/0x3e0 (unreliable)
> [   80.604509] [c0002dbff8493b20] [c000000000087c10] memory_add_physaddr_to_nid+0x20/0x60
> [   80.604521] [c0002dbff8493b40] [c0000000010d4880] drmem_init+0x25c/0x2f0
> [   80.604530] [c0002dbff8493c10] [c000000000010154] do_one_initcall+0x64/0x2c0
> [   80.604540] [c0002dbff8493ce0] [c0000000010c4aa0] kernel_init_freeable+0x2d8/0x3a0
> [   80.604550] [c0002dbff8493db0] [c000000000010824] kernel_init+0x2c/0x148
> [   80.604560] [c0002dbff8493e20] [c00000000000b648] ret_from_kernel_thread+0x5c/0x74
> [   80.604567] Instruction dump:
> [   80.604574] 392918e8 e9490000 e90a000a e92a0000 80ea000c 1d080018 3908ffe8 7d094214
> [   80.604586] 7fa94040 419d00dc e9490010 714a0088 <2faa0008> 409e00ac e9490000 7fbe5040
> [   89.047390] drmem: 249854 LMB(s)
> 
> With a patched kernel on the same machine we're no longer seeing the
> soft lockup.  drmem_init() now completes in negligible time, even when
> the LMB count is large.
> 

Yeah, as long as you remove_memory() in memory block granularity, this
is guaranteed to work.

Reviewed-by: David Hildenbrand <david@redhat.com>


-- 
Thanks,

David / dhildenb

