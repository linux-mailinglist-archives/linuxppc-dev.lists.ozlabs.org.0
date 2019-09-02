Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB49A5C2E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2019 20:19:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Mddq3ZV8zDqdD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 04:19:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::444; helo=mail-wr1-x444.google.com;
 envelope-from=mingo.kernel.org@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="faS7HABw"; 
 dkim-atps=neutral
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Mdbp6pBYzDqcW
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2019 04:17:39 +1000 (AEST)
Received: by mail-wr1-x444.google.com with SMTP id h7so13536856wrt.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Sep 2019 11:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=jBcP8+814FXVBIRmjcz1VaPKi5ctF20nPKwL6I2CNCQ=;
 b=faS7HABw9gu83gEWeJ9t0e3z7PXG4M/CTkKuWq9ZyzIl2d/x/mrg8a4P2YSBHuKkSK
 j2Jg0qR3ZMKYg3+W7fvfsjaTQsvaBLPDjNaHD1ciIoo++3q8Gq3ayEnY4ZosSMskNtna
 jtIMiT5+IthZl4oiuye8lom+YlFCguCKVcGl1nUVQkkkmDfAOOc02yjm+c6tbI9xlQfY
 V3XPL6hwvqyqMTLCqyt+cBvG4fk84XYerqrjv+EcSshJoTCU0YcNIwr45nwLa1lBsKFx
 dmtdHjnxenFTjUHrkvu+KQsqikg2CyST7bDw43rc0pKScjGwdWOORIp8CLdPsVl/BcLF
 fnCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=jBcP8+814FXVBIRmjcz1VaPKi5ctF20nPKwL6I2CNCQ=;
 b=ZFA9MwIMtECWAIjupKF5W2JO6QCA9nwz8yDeFO5xoInGx2je6zGV6iX5JGxYUAuNQM
 hJxXwaicb+UTLW42sn2HgE/ojZgA1P40Ngos3kp4YjOLc7uM/oHvV/4kEbDuGs9MT7+s
 XnYKkS/y9Y3AWYuWV9LZhyKhpy1ucsUdXBDOxhqxjaS0VqP/hZn8pY0EZQ+/Jqk1hSea
 HZNdjpudoLtrujcq+XXvEz1FGFdd04ZZ/4tEBaoR/JNFkV5TyKbebZq6EWE+sz9zz+11
 +iT7MyVjBfB4Fy/tnRTpwcK5Y1WdnlYwigMxL3mIFlYUM9r+otKhp6bDNbV62UzDTVEx
 dvmQ==
X-Gm-Message-State: APjAAAUGLJcNf64p0WqUti6WfdFOdnKovZbXttUIDZEIiZTvgg0nn/lh
 Cn082ihEPNQKs3ZdkVrH0TU=
X-Google-Smtp-Source: APXvYqwUXJn4is9dMaEXtNMq6w3Zcbe080FjEkYCKmNqosg3UzNOs5c67Kaj0+u++ZycwRSpujDPDQ==
X-Received: by 2002:adf:dd4d:: with SMTP id u13mr28979309wrm.112.1567448255456; 
 Mon, 02 Sep 2019 11:17:35 -0700 (PDT)
Received: from gmail.com (2E8B0CD5.catv.pool.telekom.hu. [46.139.12.213])
 by smtp.gmail.com with ESMTPSA id y186sm27829061wmd.26.2019.09.02.11.17.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2019 11:17:34 -0700 (PDT)
Date: Mon, 2 Sep 2019 20:17:31 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v2 2/9] x86: numa: check the node id consistently for x86
Message-ID: <20190902181731.GB35858@gmail.com>
References: <1567231103-13237-1-git-send-email-linyunsheng@huawei.com>
 <1567231103-13237-3-git-send-email-linyunsheng@huawei.com>
 <20190831085539.GG2369@hirez.programming.kicks-ass.net>
 <4d89c688-49e4-a2aa-32ee-65e36edcd913@huawei.com>
 <20190831161247.GM2369@hirez.programming.kicks-ass.net>
 <ae64285f-5134-4147-7b02-34bb5d519e8c@huawei.com>
 <20190902072542.GN2369@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190902072542.GN2369@hirez.programming.kicks-ass.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: dalias@libc.org, linux-sh@vger.kernel.org, catalin.marinas@arm.com,
 dave.hansen@linux.intel.com, heiko.carstens@de.ibm.com, linuxarm@huawei.com,
 jiaxun.yang@flygoat.com, linux-kernel@vger.kernel.org, mwb@linux.vnet.ibm.com,
 paulus@samba.org, hpa@zytor.com, sparclinux@vger.kernel.org, chenhc@lemote.com,
 will@kernel.org, linux-s390@vger.kernel.org, ysato@users.sourceforge.jp,
 x86@kernel.org, paul.burton@mips.com, rppt@linux.ibm.com,
 borntraeger@de.ibm.com, dledford@redhat.com, mingo@redhat.com,
 jeffrey.t.kirsher@intel.com, jhogan@kernel.org, nfont@linux.vnet.ibm.com,
 mattst88@gmail.com, len.brown@intel.com, gor@linux.ibm.com,
 anshuman.khandual@arm.com, ink@jurassic.park.msu.ru, cai@lca.pw,
 luto@kernel.org, tglx@linutronix.de, naveen.n.rao@linux.vnet.ibm.com,
 linux-arm-kernel@lists.infradead.org, rth@twiddle.net, axboe@kernel.dk,
 robin.murphy@arm.com, linux-mips@vger.kernel.org, ralf@linux-mips.org,
 tbogendoerfer@suse.de, Yunsheng Lin <linyunsheng@huawei.com>,
 linux-alpha@vger.kernel.org, bp@alien8.de, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


* Peter Zijlstra <peterz@infradead.org> wrote:

> Also note that the CONFIG_DEBUG_PER_CPU_MAPS version of
> cpumask_of_node() already does this (although it wants the below fix).
> 
> ---
> diff --git a/arch/x86/mm/numa.c b/arch/x86/mm/numa.c
> index e6dad600614c..5f49c10201c7 100644
> --- a/arch/x86/mm/numa.c
> +++ b/arch/x86/mm/numa.c
> @@ -861,7 +861,7 @@ void numa_remove_cpu(int cpu)
>   */
>  const struct cpumask *cpumask_of_node(int node)
>  {
> -	if (node >= nr_node_ids) {
> +	if ((unsigned)node >= nr_node_ids) {
>  		printk(KERN_WARNING
>  			"cpumask_of_node(%d): node > nr_node_ids(%u)\n",
>  			node, nr_node_ids);

Nitpicking: please also fix the kernel message to say ">=".

With that:

Acked-by: Ingo Molnar <mingo@kernel.org>

Note that:

- arch/arm64/mm/numa.c copied the same sign bug (or unrobustness if we 
  don't want to call it a bug).

- Kudos to the mm/memcontrol.c and kernel/bpf/syscall.c teams for not 
  copying that bug. Booo for none of them fixing the buggy pattern 
  elsewhere in the kernel ;-)

Thanks,

	Ingo
