Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D31177352
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Mar 2020 11:00:22 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48WsvR6kLyzDqTK
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Mar 2020 21:00:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48WskH43hfzDqZ9
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Mar 2020 20:52:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=ONFZwebO; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48WskF721yz9sRR;
 Tue,  3 Mar 2020 20:52:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1583229142;
 bh=Vn8yx1vqIZSvptmQMeeChkpykb4Gd+dJ6/ZPDLdhV2Y=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=ONFZwebOWNefVNSTqvVn/BXSyDwOLi7R5m+Sz74TQ9rktEzbSx3jI9Mm1ibrxkyIQ
 kqMYuh9TgzSJlFqOEgos5GKTsol5YPczZGJ2DH8Q5kQw1YXAXUSF162+rXtsx2cBoE
 Essy42eaVAXr9+UM0EOlU7MZAl2uVm70IzYFzbMVywr6+F9l0UBAcJogj7XwrPPIWW
 wJud3siIgP9D8rp3PbUCRVd/qbQf4N3Ip3MXCsZQFr7LNpyVNVN5YxhSKYy6kTs7sw
 gOBKz97zD5t2ld/9tCt4uPEuRGLLlqrsauRnXJlWrA8Ps3SYGXF9Kf1t/8vpg8RB5D
 0emccjJ3WMp6g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Oliver O'Halloran <oohall@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 6/6] powerpc: powernv: no need to check return value of
 debugfs_create functions
In-Reply-To: <CAOSf1CEKwjDkp-=SMjmJfQirxdGCkadougZbdDS6FK1muNNCZw@mail.gmail.com>
References: <20200209105901.1620958-1-gregkh@linuxfoundation.org>
 <20200209105901.1620958-6-gregkh@linuxfoundation.org>
 <CAOSf1CEKwjDkp-=SMjmJfQirxdGCkadougZbdDS6FK1muNNCZw@mail.gmail.com>
Date: Tue, 03 Mar 2020 20:52:20 +1100
Message-ID: <87a74xsr3f.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Paul Mackerras <paulus@samba.org>,
 Sukadev Bhattiprolu <sukadev@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Anju T Sudhakar <anju@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Oliver O'Halloran" <oohall@gmail.com> writes:
> On Mon, Feb 10, 2020 at 12:12 AM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
>>
>> When calling debugfs functions, there is no need to ever check the
>> return value.  The function can work or not, but the code logic should
>> never do something different based on this.
>
> For memtrace debugfs is the only way to actually use the feature. It'd
> be nice if it still printed out *something* if it failed to create the
> files rather than just being mysteriously absent

That's true, but the current code doesn't actually do that anyway.

>> diff --git a/arch/powerpc/platforms/powernv/memtrace.c b/arch/powerpc/platforms/powernv/memtrace.c
>> index eb2e75dac369..d6d64f8718e6 100644
>> --- a/arch/powerpc/platforms/powernv/memtrace.c
>> +++ b/arch/powerpc/platforms/powernv/memtrace.c
>> @@ -187,11 +187,6 @@ static int memtrace_init_debugfs(void)
>>
>>                 snprintf(ent->name, 16, "%08x", ent->nid);
>>                 dir = debugfs_create_dir(ent->name, memtrace_debugfs_dir);
>> -               if (!dir) {
>> -                       pr_err("Failed to create debugfs directory for node %d\n",
>> -                               ent->nid);
>> -                       return -1;
>> -               }

debugfs_create_dir() doesn't return NULL on error, it returns
ERR_PTR(-ENOMEM), which will not trigger that pr_err().

So I've merged this and if someone wants to they can send a follow-up to
do proper error checking in memtrace.c

cheers
