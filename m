Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BC6723E1D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 11:47:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qb5Gq0Fgpz3f86
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 19:46:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=K9Lu9G39;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::531; helo=mail-pg1-x531.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=K9Lu9G39;
	dkim-atps=neutral
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qb5G13Hdcz3bdV
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Jun 2023 19:46:16 +1000 (AEST)
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-53f7bef98b7so5238631a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jun 2023 02:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686044773; x=1688636773;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=82KymGko1+wd7JT5GKcIigdi0TlS7W7QNWmu/cWLy3c=;
        b=K9Lu9G39x6lnCK1MeFEnb04z2KrA2Ql8evFNR+EXcgRRA2aEdPN7SvlPXfi+L2iAVB
         KWhDxyGRHnFXLuljujVmEEluYNahwPt5LjbmbeZVidHRUYt4EkEoZ0q8ct8i94K89MuH
         5wHIQ8Tkc99aAefKn4QUSpKJ6EROn3LDiqwFZxXVzrm+5FNNXAeu6Qt9RVwQCMTGwDI6
         h+sai8zhWZb9LxJ9H3/Xr+42lEjZBZLxJAP5gpT64J04klxy2LElzRp5LkIRAguNTy23
         DVQbGntVehlqSFJsP1V4V39jomo9oJav3izG4JdZPskCr6kiZmdpWls8CLa1oMge+cvQ
         mD2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686044773; x=1688636773;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=82KymGko1+wd7JT5GKcIigdi0TlS7W7QNWmu/cWLy3c=;
        b=NDf/yhn1pVM9/Bdn+5dodGxWEwi1J0qSYdXpexc59Mx3swr7/MLOfLpuP8OZZUoumk
         wmBuIfb5wbphzjYsvb2uAd8eYuMyisP/0DLOsB6PCnKwGfTOYQbOEl7wmi4SSxN/MPzJ
         1iK/lJ+JbCS4Acv1PX6/xRSTfDVvBsAhf56WQm/vEmswo64TCnLcNh2ho6lbbCnOGMIR
         s/LkpHaW4Lx8pUOft1YeG7eLfMMLEP6YEww1aBtFxpfjT/fh/TRBaq+GEb1YR90M66fU
         UhBwUq1o5VKi6g5fcgLjVxdyyxZkfNfyeMthRzWqKqPCGeTrsSRRDqa1Z49SM0n7Jiwn
         12Hg==
X-Gm-Message-State: AC+VfDxsrrY6fYmCKRoW2gOt7KqSddSLlzCN7FS5a3zcv/ivA69+TCzW
	hEgtHshTeVxWraO51YerN2w=
X-Google-Smtp-Source: ACHHUZ5X0kVBbcWdn8vHqAaEgroopnqD9zsEBAtfkQP9RX/G3qkIgTXDnQsm+Gu6QKxVqo5kmMmrZg==
X-Received: by 2002:a17:90b:68d:b0:256:cbe9:83c2 with SMTP id m13-20020a17090b068d00b00256cbe983c2mr1412864pjz.38.1686044773624;
        Tue, 06 Jun 2023 02:46:13 -0700 (PDT)
Received: from localhost (58-6-230-127.tpgi.com.au. [58.6.230.127])
        by smtp.gmail.com with ESMTPSA id 72-20020a63034b000000b005344b30d449sm7180072pgd.86.2023.06.06.02.46.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 02:46:12 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 06 Jun 2023 19:46:08 +1000
Message-Id: <CT5GZLOV5Y7B.2TE12USLNTKER@wheely>
To: "Sachin Sant" <sachinp@linux.ibm.com>, "linuxppc-dev"
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: WARN at kernel/sched/core.c:5358 (kthread_end_lazy_tlb_mm)
From: "Nicholas Piggin" <npiggin@gmail.com>
X-Mailer: aerc 0.14.0
References: <A9A5D83D-BA70-47A4-BCB4-30C1AE19BC22@linux.ibm.com>
In-Reply-To: <A9A5D83D-BA70-47A4-BCB4-30C1AE19BC22@linux.ibm.com>
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
Cc: linux-mm@kvack.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu Jun 1, 2023 at 8:46 PM AEST, Sachin Sant wrote:
> While compiling a kernel on a IBM Power system booted with
> 6.4.0-rc4-next-20230601 following warning is observed
>
> [  276.351697] ------------[ cut here ]------------
> [  276.351709] WARNING: CPU: 27 PID: 9237 at kernel/sched/core.c:5358 kth=
read_end_lazy_tlb_mm+0x90/0xa0
> [  276.351719] Modules linked in: dm_mod nft_fib_inet nft_fib_ipv4 nft_fi=
b_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft=
_ct nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 bonding=
 tls rfkill ip_set nf_tables nfnetlink sunrpc pseries_rng aes_gcm_p10_crypt=
o xfs libcrc32c sd_mod sr_mod t10_pi crc64_rocksoft_generic cdrom crc64_roc=
ksoft crc64 sg ibmvscsi scsi_transport_srp ibmveth vmx_crypto fuse
> [  276.351752] CPU: 27 PID: 9237 Comm: cc1 Kdump: loaded Not tainted 6.4.=
0-rc4-next-20230601 #1
> [  276.351756] Hardware name: IBM,9080-HEX POWER10 (raw) 0x800200 0xf0000=
06 of:IBM,FW1030.20 (NH1030_058) hv:phyp pSeries
> [  276.351759] NIP:  c0000000001b8c10 LR: c0000000000a8d54 CTR: c00000000=
046ec00
> [  276.351763] REGS: c0000000dce337d0 TRAP: 0700   Not tainted  (6.4.0-rc=
4-next-20230601)
> [  276.351766] MSR:  8000000000029033 <SF,EE,ME,IR,DR,RI,LE>  CR: 2400222=
8  XER: 00000000
> [  276.351774] CFAR: c0000000001b8ba0 IRQMASK: 0  [  276.351774] GPR00: c=
0000000000a8d54 c0000000dce33a70 c0000000014a1800 c000000007852a00  [  276.=
351774] GPR04: 0000000000000001 ffffffffffffffff 0000000000000000 c00000000=
7852f78  [  276.351774] GPR08: 0000000000000000 0000000000000000 0000000000=
000000 0000000024002428  [  276.351774] GPR12: c0000000a032b608 c00000135fa=
a5b00 0000000000000000 0000000000000000  [  276.351774] GPR16: 000000000000=
0000 0000000000000000 0000000000000000 0000000000000000  [  276.351774] GPR=
20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000  [ =
 276.351774] GPR24: 0000000000000000 0000000000000000 0000000000000000 c000=
000007852a70  [  276.351774] GPR28: 0000000000000000 0000000000000000 00000=
0000000001b c000000007852a00  [  276.351810] NIP [c0000000001b8c10] kthread=
_end_lazy_tlb_mm+0x90/0xa0
> [  276.351814] LR [c0000000000a8d54] exit_lazy_flush_tlb+0xf4/0x110
> [  276.351818] Call Trace:
> [  276.351820] [c0000000dce33a70] [0000000000000001] 0x1 (unreliable)
> [  276.351825] [c0000000dce33ab0] [c0000000000a8fbc] flush_type_needed+0x=
24c/0x260
> [  276.351829] [c0000000dce33af0] [c0000000000a91a8] __flush_all_mm+0x48/=
0x2c0
> [  276.351833] [c0000000dce33b40] [c0000000004d6dcc] tlb_finish_mmu+0x16c=
/0x230
> [  276.351839] [c0000000dce33b70] [c0000000004d2a2c] exit_mmap+0x17c/0x4c=
0

Thanks for the report. IRQs aren't diabled where I'd they would be. Fix
should be just add a local_irq_disable somewhere, but this looks like it
is exposing an upstream bug of mine so I'll work out a fix for that
first. No big deal for this series, it can stay in -next for now, it
might just require a rebase.

Thanks,
Nick
