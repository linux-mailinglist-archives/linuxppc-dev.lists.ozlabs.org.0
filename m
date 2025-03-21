Return-Path: <linuxppc-dev+bounces-7271-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB29CA6BF95
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Mar 2025 17:18:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZK7101GT4z30Sv;
	Sat, 22 Mar 2025 03:18:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742573924;
	cv=none; b=NAs3SSK0g6XuUnhzlGfN2xZRw8mVIQd0j3/LLW6Wp/cj+HoiNl9OJLzrfNxDLtH4MpQxtm+MVuJqprNUTYy5kE+jxMm1njflErMdnAhUQtok9zRhqDl+4MoVo6Wj4thEMUykGamt4ZwSZ9Hana6bpfPDZlKUhRVSKYkD+l0xAvQQxFVvsxr6lI4bC4SHpwOIl7Pp9U4C25avWIcWNEBBld3NgMufknX215aK25QHFqyOqJ1ViXT62UEMVfSqgsP/1/TlY3sj/8GRVsDemq1c/Q9yfATGQr3zBhL5u4tbjYqnNhPNmwSb6IU5SyuyKMJkFG0g4lusMHoprr5UvUd5cw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742573924; c=relaxed/relaxed;
	bh=aa/oeSqu9j7ZG2jk5B9U7UubDFHfuN9VI7rabr0YyHM=;
	h=From:To:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-version:Content-type; b=jB8bitz0IZXnS9MgSZi5gjch7JtFk6+K72ko94Uva/tfuixd4dW/WS1Z4WbrsbiPUkLBetP4qthi4x7Nw5x3nNEibgMrNa5apqlGDDBZbvBEB21c8P9qcGKYWYA+Z7spRJzFhwxSa2OgkMDG22bUoLbYYSIc1UZvr6Or7bEGx+UjUTsUN8OGNJVCdtZgxassD9LhctDr5OLiV/5xIkIRZn/H8/QFTMLMrORZ1MGohtaMOtHzX5GwTJjkIyQASw0Hj9kAef7YPIHNB9RcN6Eu+j4ZvTQwhj0ZRktn7OusQ8ugaCRdPH9SHPuXVCQTQS4kvTW10DbdPKR0/ghVfQoHOA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cohVzfWz; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cohVzfWz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZK70y5XQ5z30RK
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Mar 2025 03:18:41 +1100 (AEDT)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-22622ddcc35so19913225ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Mar 2025 09:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742573920; x=1743178720; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:message-id:date
         :in-reply-to:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aa/oeSqu9j7ZG2jk5B9U7UubDFHfuN9VI7rabr0YyHM=;
        b=cohVzfWzQvrv7D79poo+aGy0/vD0903/tJl8PSswxq0hcmdLcySySjs8SSadodnbXP
         ueTBPIDwOrieUSDUTYFJDSC/StfY/wNLGimFEIFDbt/dvaV7uxID2acc8/8qBUqjjBmN
         w30t1dcKc8vxhSjIV8yZitoc286AQQzgoe1fGbhu7n9Y6znT8v4ifIFAxtYfrpXpVcHl
         6Rsw7BtS7zAVin6xVB1z2jZjivMmECd4DzcrrpoFpTzEnH1LHGDagCwIuY/3JYjDU89S
         rUr0dzakvclEDryET8cKk7AKPNIDXt+j65f4SWx7EtO0oth9HwdZkvjnfTcvcwqTqf/B
         o/iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742573920; x=1743178720;
        h=content-transfer-encoding:mime-version:references:message-id:date
         :in-reply-to:subject:to:from:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aa/oeSqu9j7ZG2jk5B9U7UubDFHfuN9VI7rabr0YyHM=;
        b=ZjHz+81WOrzpScbwVAhHWufBVmiHr3ygjK+T6wl5DQw6/qiBNQrPoAzrQf56lyJaM5
         /tuYbZed8kLlNUBGz/1PfAJDMFeHHU2ZkLc9EnmcjSOgKNWWECcGm0SpHdT3q/SIPCaq
         axLCfYsGS/E03JNFl+4C9fGpcG6RvpmexhN4vhXzLaO1ytxRnbNsaNLGtZj6EvW40mrd
         FEWT2g/bVlvmFaFXOXloMOv4fGfZ78xTMh2EVd40ep65ObpmklwDZC9qsLt4JsSAS6Ug
         BxOGU/k5uEaTCwWywz7n9BEEVsZoO2DBouM0Gj4UrsO4WMMX9Jxa4Jxw9/PznTkbYWQe
         ztkw==
X-Forwarded-Encrypted: i=1; AJvYcCXki52JdoqQXjv6013QVN/7WQRLnkiHiLHl8Uyk/+GCuF/OZvGHOnh/refWqm/0J7GXsZzGjBvP3UVAKns=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxI3gQrgpv1zWenwKuDr0evpPNMFe7mt2LYclUWcBJN1IcDL6Ea
	1ynS3KojbxbUxF/6GMX4Bi+XiG/N6xkrokZf53dpACsUTvwWwG7I
X-Gm-Gg: ASbGncsHA60EfM8GeQqOB+hgqTkp2DcvRW9t1oATOEgCLExcx5LrRw5VgIaP1TmDLRe
	Zj/XLe+/SHqnk+FO76hrVUc9zgTJuVpDR0ATO6/rKc44I+rKbSKb3SekUikl+0drV4gS8BZotj2
	wFR4nqTbyRS4WFmlPZX/3+o7vgdcpyqvZ1fzKzQ0MA1OQ9J1ZKyhzyLvnass0EjoUMvscr8LTIE
	Eao8JbRD6OuWYL79ICgVoAwP7ALKp7rP2PWrRAJosIvElwMeSOuFzHotX+DnktUCAyRBC/JzO9K
	IbrEiH4rPXIU21J2KgK7t/rH9hD0jgWZNLSjHg==
X-Google-Smtp-Source: AGHT+IHXK9ihuIUg5cGB2ifPWnnFjgVEW5WEuE0I3f27Sirj3sdGKbFJ6aKgD/fM7L49KZ3goFwL7w==
X-Received: by 2002:a05:6a00:3c95:b0:736:eb7e:df39 with SMTP id d2e1a72fcca58-73905a54b96mr7338183b3a.24.1742573919427;
        Fri, 21 Mar 2025 09:18:39 -0700 (PDT)
Received: from dw-tp ([171.76.82.198])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73905fd54d5sm2132885b3a.39.2025.03.21.09.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 09:18:38 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: Venkat Rao Bagalkote <venkat88@linux.ibm.com>, LKML <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org, Madhavan Srinivasan <maddy@linux.ibm.com>, linux-btrfs@vger.kernel.org, "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: Re: [linux-next-20250320][btrfs] Kernel OOPs while running btrfs/108
In-Reply-To: <e4b1ccf8-c626-4683-82db-219354a27e61@linux.ibm.com>
Date: Fri, 21 Mar 2025 21:26:43 +0530
Message-ID: <87h63ms7gk.fsf@gmail.com>
References: <e4b1ccf8-c626-4683-82db-219354a27e61@linux.ibm.com>
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
MIME-version: 1.0
Content-type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,MALFORMED_FREEMAIL,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


+linux-btrfs

Venkat Rao Bagalkote <venkat88@linux.ibm.com> writes:

> Greetings!!!
>
>
> I am observing Kernel oops while running brtfs/108 TC on IBM Power System.
>
> Repo: Linux-Next (next-20250320)

Looks like this next tag had many btrfs related changes -
https://web.git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/log/fs/btrfs?h=next-20250320

>
> Traces:
>
> [  418.392604] run fstests btrfs/108 at 2025-03-21 05:11:21
> [  418.560137] Kernel attempted to read user page (0) - exploit attempt? 
> (uid: 0)
> [  418.560156] BUG: Kernel NULL pointer dereference on read at 0x00000000

NULL pointer dereference... 

> [  418.560161] Faulting instruction address: 0xc0000000010ef8b0
> [  418.560166] Oops: Kernel access of bad area, sig: 11 [#1]
> [  418.560169] LE PAGE_SIZE=64K MMU=Radix  SMP NR_CPUS=8192 NUMA pSeries
> [  418.560174] Modules linked in: btrfs blake2b_generic xor raid6_pq 
> zstd_compress loop nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib 
> nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct 
> nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 bonding nf_defrag_ipv4 
> tls rfkill ip_set nf_tables nfnetlink sunrpc pseries_rng vmx_crypto fuse 
> ext4 mbcache jbd2 sd_mod sg ibmvscsi scsi_transport_srp ibmveth
> [  418.560212] CPU: 1 UID: 0 PID: 37583 Comm: rm Kdump: loaded Not 
> tainted 6.14.0-rc7-next-20250320 #1 VOLUNTARY
> [  418.560218] Hardware name: IBM,9080-HEX Power11
> [  418.560223] NIP:  c0000000010ef8b0 LR: c00800000bb190ac CTR: 
> c0000000010ef888
> [  418.560227] REGS: c0000000a252f5a0 TRAP: 0300   Not tainted 
> (6.14.0-rc7-next-20250320)
> [  418.560232] MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: 
> 44008444  XER: 20040000
> [  418.560240] CFAR: c00800000bc1df84 DAR: 0000000000000000 DSISR: 
> 40000000 IRQMASK: 1
> [  418.560240] GPR00: c00800000bb190ac c0000000a252f840 c0000000016a8100 
> 0000000000000000
> [  418.560240] GPR04: 0000000000000000 0000000000010000 0000000000000000 
> fffffffffffe0000
> [  418.560240] GPR08: c00000010724aad8 0000000000000003 0000000000001000 
> c00800000bc1df70
> [  418.560240] GPR12: c0000000010ef888 c000000affffdb00 0000000000000000 
> 0000000000000000
> [  418.560240] GPR16: 0000000000000000 0000000000000000 0000000000000000 
> 0000000000000000
> [  418.560240] GPR20: c0000000777a8000 c00000006a9c9000 c00000010724a950 
> c0000000777a8000
> [  418.560240] GPR24: fffffffffffffffe c00000010724aad8 0000000000010000 
> 00000000000000a0
> [  418.560240] GPR28: 0000000000010000 c00c00000048c3c0 0000000000000000 
> 0000000000000000
> [  418.560287] NIP [c0000000010ef8b0] _raw_spin_lock_irq+0x28/0x98
> [  418.560294] LR [c00800000bb190ac] wait_subpage_spinlock+0x64/0xd0 [btrfs]


btrfs is working on subpage size support for a while now.
Adding +linux-btrfs, in case if they are already aware of this problem.

I am not that familiar with btrfs code. But does this look like that the
subpage (folio->private became NULL here) somehow?

-ritesh

> [  418.560339] Call Trace:
> [  418.560342] [c0000000a252f870] [c00800000bb205dc] 
> btrfs_invalidate_folio+0xa8/0x4f0 [btrfs]
> [  418.560384] [c0000000a252f930] [c0000000004cbcdc] 
> truncate_cleanup_folio+0x110/0x14c
> [  418.560391] [c0000000a252f960] [c0000000004ccc7c] 
> truncate_inode_pages_range+0x100/0x4dc
> [  418.560397] [c0000000a252fbd0] [c00800000bb20ba8] 
> btrfs_evict_inode+0x74/0x510 [btrfs]
> [  418.560437] [c0000000a252fc90] [c00000000065c71c] evict+0x164/0x334
> [  418.560443] [c0000000a252fd30] [c000000000647c9c] do_unlinkat+0x2f4/0x3a4
> [  418.560449] [c0000000a252fde0] [c000000000647da0] sys_unlinkat+0x54/0xac
> [  418.560454] [c0000000a252fe10] [c000000000033498] 
> system_call_exception+0x138/0x330
> [  418.560461] [c0000000a252fe50] [c00000000000d05c] 
> system_call_vectored_common+0x15c/0x2ec
> [  418.560468] --- interrupt: 3000 at 0x7fffb1b366bc
> [  418.560471] NIP:  00007fffb1b366bc LR: 00007fffb1b366bc CTR: 
> 0000000000000000
> [  418.560475] REGS: c0000000a252fe80 TRAP: 3000   Not tainted 
> (6.14.0-rc7-next-20250320)
> [  418.560479] MSR:  800000000280f033 
> <SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 44008804  XER: 00000000
> [  418.560490] IRQMASK: 0
> [  418.560490] GPR00: 0000000000000124 00007ffffcb4e2b0 00007fffb1c37d00 
> ffffffffffffff9c
> [  418.560490] GPR04: 000000013d660380 0000000000000000 0000000000000000 
> 0000000000000003
> [  418.560490] GPR08: 0000000000000000 0000000000000000 0000000000000000 
> 0000000000000000
> [  418.560490] GPR12: 0000000000000000 00007fffb1dba5c0 00007ffffcb4e538 
> 000000011972d0e8
> [  418.560490] GPR16: 000000011972d098 000000011972d060 000000011972d020 
> 000000011972cff0
> [  418.560490] GPR20: 000000011972d298 000000011972cc10 0000000000000000 
> 000000013d6615a0
> [  418.560490] GPR24: 0000000000000002 000000011972d0b8 000000011972cf98 
> 000000011972d1d0
> [  418.560490] GPR28: 00007ffffcb4e538 000000013d6602f0 0000000000000000 
> 0000000000100000
> [  418.560532] NIP [00007fffb1b366bc] 0x7fffb1b366bc
> [  418.560536] LR [00007fffb1b366bc] 0x7fffb1b366bc
> [  418.560538] --- interrupt: 3000
> [  418.560541] Code: 7c0803a6 4e800020 3c4c005c 38428878 7c0802a6 
> 60000000 39200001 992d0932 a12d0008 3ce0fffe 5529083c 61290001 
> <7d001829> 7d063879 40c20018 7d063838
> [  418.560555] ---[ end trace 0000000000000000 ]---
>
>
> If you happed to fix this, please add below tag.
>
>
> Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
>
>
> Regards,
>
> Venkat.

