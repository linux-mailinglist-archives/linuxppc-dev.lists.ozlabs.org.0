Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F4A2B4345
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Nov 2020 13:05:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CZSSq3x2zzDqLR
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Nov 2020 23:05:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CZSPf0vhfzDqJ2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Nov 2020 23:02:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=d03+xvWb; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CZSPd3VYKz9sPB;
 Mon, 16 Nov 2020 23:02:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1605528165;
 bh=6Q0zbWcNFsWDYLLD6BC7mnGqqQA7exfLnoqQDh15XXM=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=d03+xvWbis/+I36rmXvj65Qj7u/wRBGTvhXUj/+DAt8t/ZoLy3F/wE9FiRTpPo15c
 ZLiM5OXOynXtjx2ffSB0/uupbFViTWkGEZ3xi8zNS73eGzkQaBUv6ebv7NtNY0R/Tb
 Whsi5Nt55TK1Vv1iu6MMiRbKAaaeB8gcSdqxQjVs0wMumQVlMFQDbVG3qcxT/tSxBj
 X+/e7gLwpSPvn7rXA/3xYTGiYQq2SKjiOcjfoFxEfCwbZzdzN/cZsom9kILSPdJ/YY
 p1foCiZWeMJ6kDs/6ACo8FyxSkGf8q4bq5u3Ow+2nSmF+wVm9iHJKq0sU2gcRROjeJ
 TlHBq7lFA5kXQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/powernv/memtrace: Fake non-memblock aligned sized
 traces
In-Reply-To: <20201111055524.2458-1-jniethe5@gmail.com>
References: <20201111055524.2458-1-jniethe5@gmail.com>
Date: Mon, 16 Nov 2020 23:02:43 +1100
Message-ID: <87blfx4iho.fsf@mpe.ellerman.id.au>
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
Cc: Jordan Niethe <jniethe5@gmail.com>, mikey@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Jordan Niethe <jniethe5@gmail.com> writes:
> The hardware trace macros which use the memory provided by memtrace are
> able to use trace sizes as small as 16MB. Only memblock aligned values
> can be removed from each NUMA node by writing that value to
> memtrace/enable in debugfs.  This means setting up, say, a 16MB trace is
> not possible.  To allow such a trace size, instead align whatever value
> is written to memtrace/enable to the memblock size for the purpose of
> removing it from each NUMA node but report the written value from
> memtrace/enable and memtrace/x/size in debugfs.

Why does it matter if the size that's removed is larger than the size
that was requested?

Is it about constraining the size of the trace? If so that seems like it
should be the job of the tracing tools, not the kernel.

cheers
