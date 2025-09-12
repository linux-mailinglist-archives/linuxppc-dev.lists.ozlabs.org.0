Return-Path: <linuxppc-dev+bounces-12099-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F3EB5585D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Sep 2025 23:29:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNncq1mHHz2yRZ;
	Sat, 13 Sep 2025 07:29:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1134"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757682986;
	cv=none; b=feyJM0+PP2UEA+Kt3gelh0jwQmjqLjVnKpy8ariYwhWvkjiKjGt83LlNUngJcYJa4P8bcXLacvN/gv9nvO7izv0Cghr8m2LMc3C92xkJWNFsqUqvk2lcLpnb9NYZl2+pNW8X3u5cynyrCsCLtww9/hOnS/shep9ZxnbzOjpBDiedcAkszuOdwoGmdZsOq4S7S7tyAJ7V02kSVTsVkmEWJFvjjB4PcCTBOGDHq3jwpmhqTWQOiRpZWMLCYP0/bdTaEHPUC1XO45/SDi/X/ht2rHogz6ukoBadwENZfEWoerl+LNqm/7zey99CjNl2M6hS/Qhg2NKm94m8F5Vqr69+Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757682986; c=relaxed/relaxed;
	bh=WacX0Y225mfF5Mr+dq8TTghuE82OqAke+XlwrZchO4o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fWohZWDl8zTVQ7719vX+gLYv0k2IgznNFmWw53KojQju01zB3/Ea7Aqm2i+T4hqlBmFHG67fiZfHPR7vB9PBxNZl9HgStQc9ahigi+kCHP9MPokCUGTwe4A5jbMAQZTUk2l08IZWpm8GF7azj9/HxBIK9+L2Z7uigUdrpIngQUZLKfZivXQ3eeSbn7q2Z4IOyhXYKMcGNdFTtLB9xtzq+qlD34aupvpxb1syvL9Vd6uDtcqY4NdRGMQmhx7DauxTzrocB4G5A53wuNtWCe0lh0+D22wrLGnrLcLSyqNf2vM6XNIvUfLJ3ocb/deOVrs342BVWqNbC7csYy0flby+UA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=PZduWXaH; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1134; helo=mail-yw1-x1134.google.com; envelope-from=sunjunchao@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=PZduWXaH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::1134; helo=mail-yw1-x1134.google.com; envelope-from=sunjunchao@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cNZgq6Jbmz3dCt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Sep 2025 23:16:22 +1000 (AEST)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-71d60150590so12013677b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Sep 2025 06:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1757682979; x=1758287779; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WacX0Y225mfF5Mr+dq8TTghuE82OqAke+XlwrZchO4o=;
        b=PZduWXaHWJUcNeGJHQaLBXoAM+tTlt8pzWZVVuAk5nDsAxcbTmIg3ChjA3EfmEBFST
         EM534NP+/O6xjDEKPnel9dxs42/eNOUvyx744qh2AYkjjepUgyHv85FhHZOZKKPzGnX2
         hNIGANvMSjJkMl0eAc38oCKhZ3/6CF/v0Rp9Nf/FO8ggtM7FbRsjfby+XiNclrnHhtut
         7moNYbStQ4TA6pPkPaZUvFVPmxNuuLPZdp3jY6I466Fm5xPCIWiSROi2vuVx92dhM0u4
         7qHIlORqN5YiH08if8AwFPHvT9l6T4+knOKTxuCPxeHfiREqLia+JyH9UhfqWl2sis2h
         OOdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757682979; x=1758287779;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WacX0Y225mfF5Mr+dq8TTghuE82OqAke+XlwrZchO4o=;
        b=sJfwKeQ5sW0/T1dC6BkUpTKr1Q34tr+Yud57qCRgHFPDBQ069rhmKoeWJL/vZUxup9
         chG/qvPNsWIyK5+267FL0fd8sUdb1whwCbmf29+5ztymbrMGOjc9ypJZDtf5+SmhQjaq
         Ih6lUZG5ODL+VACN32e6pJSnviDOY1J6ONRH092phqN+1O/ZSG84kgXRLjEaB4sp/FmI
         kPyp5/9zEl1DscrFQVUI+mJNEpL4rP+cH825REftpmIxpndjcXlP4FZ5uaI/cnjpd63C
         OSKo5h9v1tCKUD24xdafOClODhUb8kV+MmHXjHDAawOUKQ9BoT+t5lWZIIUhhA8shWpJ
         WGdA==
X-Forwarded-Encrypted: i=1; AJvYcCXHi3M+oINu1fsIfg5pFy6Knm1tSrun+couReNxna4vmm1rJODUpopjp0PAV7pk645ixYjxZ1hrh+2rC3o=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyGaFn6t6r/PO4Rsh6Hk03bI801hEcBqmvB8ag4kvCOjUo3B0A5
	+szK+UUZCLN7MuY4Sl/VSbOjTln/deO4AFmEPmHEget0mHMU3hkhvGpp0P8i+pPmCXPeZSj+3df
	T8zzIq7etaom1O/TN2DdC8aDJpspAXmSuMxHW4BMKUw==
X-Gm-Gg: ASbGncuPfPwwdY9KBJ1Wie0KfDajdkYEfbvUddY2yhmV5+z/6bjfOilbwZUx337hsQE
	s1yXfsJBp7hU9WScuhUC2QVohBo7ws3iebtkOnkjJuUsu5LoAGPUgOkO5+Tp8cIEuO5Uk4Co28M
	zW4huAkkD8nA0iecuf1v9NAhlRuU0nYGLqNd9yU9BeYSc6BENJWYHbUhZHwIYKGbPfWL19KQGtV
	+aHx/rN+VYiag4=
X-Google-Smtp-Source: AGHT+IGYP/z3abyUgCJL16DnEpbMeZjMz4kBCICiy0J25UHYR5eBa2TN11vPJBGTBUTyY1a8ErBJ1zUjhD2KUm8MoWo=
X-Received: by 2002:a05:690c:c90:b0:723:b3d4:1cfd with SMTP id
 00721157ae682-73065dac45bmr29462097b3.54.1757682978514; Fri, 12 Sep 2025
 06:16:18 -0700 (PDT)
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
References: <8957c526-d05c-4c0d-bfed-0eb6e6d2476c@linux.ibm.com> <BAEAC2F7-7D7F-49E4-AB21-10FC0E4BF5F3@linux.ibm.com>
In-Reply-To: <BAEAC2F7-7D7F-49E4-AB21-10FC0E4BF5F3@linux.ibm.com>
From: Julian Sun <sunjunchao@bytedance.com>
Date: Fri, 12 Sep 2025 21:16:07 +0800
X-Gm-Features: Ac12FXxgWzP6HGChGViD5jg5oUeivsG-aZaYxectxJJdHUjuwBlW_e-BOMpk6RE
Message-ID: <CAHSKhteONXP5n9m0=Xia0jTFvLWnfpSKHYWyzRVigT0VwmGcgQ@mail.gmail.com>
Subject: Re: [External] Re: [linux-next20250911]Kernel OOPs while running
 generic/256 on Pmem device
To: Venkat <venkat88@linux.ibm.com>
Cc: tj@kernel.org, akpm@linux-foundation.org, stable@vger.kernel.org, 
	songmuchun@bytedance.com, shakeelb@google.com, hannes@cmpxchg.org, 
	roman.gushchin@linux.dev, mhocko@suse.com, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, riteshh@linux.ibm.com, 
	ojaswin@linux.ibm.com, linux-fsdevel@vger.kernel.org, 
	linux-xfs@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, 
	cgroups@vger.kernel.org, linux-mm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Thanks for the report. I will take a look at this issue.

On Fri, Sep 12, 2025 at 8:33=E2=80=AFPM Venkat <venkat88@linux.ibm.com> wro=
te:
>
>
>
> > On 12 Sep 2025, at 10:51=E2=80=AFAM, Venkat Rao Bagalkote <venkat88@lin=
ux.ibm.com> wrote:
> >
> > Greetings!!!
> >
> >
> > IBM CI has reported a kernel crash, while running generic/256 test case=
 on pmem device from xfstests suite on linux-next20250911 kernel.
> >
> >
> > xfstests: git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git
> >
> > local.config:
> >
> > [xfs_dax]
> > export RECREATE_TEST_DEV=3Dtrue
> > export TEST_DEV=3D/dev/pmem0
> > export TEST_DIR=3D/mnt/test_pmem
> > export SCRATCH_DEV=3D/dev/pmem0.1
> > export SCRATCH_MNT=3D/mnt/scratch_pmem
> > export MKFS_OPTIONS=3D"-m reflink=3D0 -b size=3D65536 -s size=3D512"
> > export FSTYP=3Dxfs
> > export MOUNT_OPTIONS=3D"-o dax"
> >
> >
> > Test case: generic/256
> >
> >
> > Traces:
> >
> >
> > [  163.371929] ------------[ cut here ]------------
> > [  163.371936] kernel BUG at lib/list_debug.c:29!
> > [  163.371946] Oops: Exception in kernel mode, sig: 5 [#1]
> > [  163.371954] LE PAGE_SIZE=3D64K MMU=3DRadix  SMP NR_CPUS=3D8192 NUMA =
pSeries
> > [  163.371965] Modules linked in: xfs nft_fib_inet nft_fib_ipv4 nft_fib=
_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_=
ct nft_chain_nat nf_nat nf_conntrack bonding tls nf_defrag_ipv6 nf_defrag_i=
pv4 rfkill ip_set nf_tables nfnetlink sunrpc pseries_rng vmx_crypto dax_pme=
m fuse ext4 crc16 mbcache jbd2 nd_pmem papr_scm sd_mod libnvdimm sg ibmvscs=
i ibmveth scsi_transport_srp pseries_wdt
> > [  163.372127] CPU: 22 UID: 0 PID: 130 Comm: kworker/22:0 Kdump: loaded=
 Not tainted 6.17.0-rc5-next-20250911 #1 VOLUNTARY
> > [  163.372142] Hardware name: IBM,9080-HEX Power11 (architected) 0x8202=
00 0xf000007 of:IBM,FW1110.01 (NH1110_069) hv:phyp pSeries
> > [  163.372155] Workqueue: cgroup_free css_free_rwork_fn
> > [  163.372169] NIP:  c000000000d051d4 LR: c000000000d051d0 CTR: 0000000=
000000000
> > [  163.372176] REGS: c00000000ba079b0 TRAP: 0700   Not tainted (6.17.0-=
rc5-next-20250911)
> > [  163.372183] MSR:  800000000282b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>=
  CR: 28000000  XER: 00000006
> > [  163.372214] CFAR: c0000000002bae9c IRQMASK: 0
> > [  163.372214] GPR00: c000000000d051d0 c00000000ba07c50 c00000000230a60=
0 0000000000000075
> > [  163.372214] GPR04: 0000000000000004 0000000000000001 c000000000507e2=
c 0000000000000001
> > [  163.372214] GPR08: c000000d0cb87d13 0000000000000000 000000000000000=
0 a80e000000000000
> > [  163.372214] GPR12: c00e0001a1970fa2 c000000d0ddec700 c000000000208e5=
8 c000000107b5e190
> > [  163.372214] GPR16: c00000000d3e5d08 c00000000b71cf78 c00000000d3e5d0=
5 c00000000b71cf30
> > [  163.372214] GPR20: c00000000b71cf08 c00000000b71cf10 c000000019f5858=
8 c000000004704bc8
> > [  163.372214] GPR24: c000000107b5e100 c000000004704bd0 000000000000000=
3 c000000004704bd0
> > [  163.372214] GPR28: c000000004704bc8 c000000019f585a8 c000000019f53da=
8 c000000004704bc8
> > [  163.372315] NIP [c000000000d051d4] __list_add_valid_or_report+0x124/=
0x188
> > [  163.372326] LR [c000000000d051d0] __list_add_valid_or_report+0x120/0=
x188
> > [  163.372335] Call Trace:
> > [  163.372339] [c00000000ba07c50] [c000000000d051d0] __list_add_valid_o=
r_report+0x120/0x188 (unreliable)
> > [  163.372352] [c00000000ba07ce0] [c000000000834280] mem_cgroup_css_fre=
e+0xa0/0x27c
> > [  163.372363] [c00000000ba07d50] [c0000000003ba198] css_free_rwork_fn+=
0xd0/0x59c
> > [  163.372374] [c00000000ba07da0] [c0000000001f5d60] process_one_work+0=
x41c/0x89c
> > [  163.372385] [c00000000ba07eb0] [c0000000001f76c0] worker_thread+0x55=
8/0x848
> > [  163.372394] [c00000000ba07f80] [c000000000209038] kthread+0x1e8/0x23=
0
> > [  163.372406] [c00000000ba07fe0] [c00000000000ded8] start_kernel_threa=
d+0x14/0x18
> > [  163.372416] Code: 4b9b1099 60000000 7f63db78 4bae8245 60000000 e8bf0=
008 3c62ff88 7fe6fb78 7fc4f378 38637d40 4b5b5c89 60000000 <0fe00000> 600000=
00 60000000 7f83e378
> > [  163.372453] ---[ end trace 0000000000000000 ]---
> > [  163.380581] pstore: backend (nvram) writing error (-1)
> > [  163.380593]
> >
> >
> > If you happen to fix this issue, please add below tag.
> >
> >
> > Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
> >
> >
> >
> > Regards,
> >
> > Venkat.
> >
> >
>
> After reverting the below commit, issue is not seen.
>
> commit 61bbf51e75df1a94cf6736e311cb96aeb79826a8
> Author: Julian Sun <sunjunchao@bytedance.com>
> Date:   Thu Aug 28 04:45:57 2025 +0800
>
>     memcg: don't wait writeback completion when release memcg
>          Recently, we encountered the following hung task:
>          INFO: task kworker/4:1:1334558 blocked for more than 1720 second=
s.
>     [Wed Jul 30 17:47:45 2025] Workqueue: cgroup_destroy css_free_rwork_f=
n
>     [Wed Jul 30 17:47:45 2025] Call Trace:
>     [Wed Jul 30 17:47:45 2025]  __schedule+0x934/0xe10
>     [Wed Jul 30 17:47:45 2025]  ? complete+0x3b/0x50
>     [Wed Jul 30 17:47:45 2025]  ? _cond_resched+0x15/0x30
>     [Wed Jul 30 17:47:45 2025]  schedule+0x40/0xb0
>     [Wed Jul 30 17:47:45 2025]  wb_wait_for_completion+0x52/0x80
>     [Wed Jul 30 17:47:45 2025]  ? finish_wait+0x80/0x80
>     [Wed Jul 30 17:47:45 2025]  mem_cgroup_css_free+0x22/0x1b0
>     [Wed Jul 30 17:47:45 2025]  css_free_rwork_fn+0x42/0x380
>     [Wed Jul 30 17:47:45 2025]  process_one_work+0x1a2/0x360
>     [Wed Jul 30 17:47:45 2025]  worker_thread+0x30/0x390
>     [Wed Jul 30 17:47:45 2025]  ? create_worker+0x1a0/0x1a0
>     [Wed Jul 30 17:47:45 2025]  kthread+0x110/0x130
>     [Wed Jul 30 17:47:45 2025]  ? __kthread_cancel_work+0x40/0x40
>     [Wed Jul 30 17:47:45 2025]  ret_from_fork+0x1f/0x30
>          The direct cause is that memcg spends a long time waiting for di=
rty page
>     writeback of foreign memcgs during release.
>          The root causes are:
>         a. The wb may have multiple writeback tasks, containing millions
>            of dirty pages, as shown below:
>          >>> for work in list_for_each_entry("struct wb_writeback_work", =
\
>                                         wb.work_list.address_of_(), "list=
"):
>     ...     print(work.nr_pages, work.reason, hex(work))
>     ...
>     900628  WB_REASON_FOREIGN_FLUSH 0xffff969e8d956b40
>     1116521 WB_REASON_FOREIGN_FLUSH 0xffff9698332a9540
>     1275228 WB_REASON_FOREIGN_FLUSH 0xffff969d9b444bc0
>     1099673 WB_REASON_FOREIGN_FLUSH 0xffff969f0954d6c0
>     1351522 WB_REASON_FOREIGN_FLUSH 0xffff969e76713340
>     2567437 WB_REASON_FOREIGN_FLUSH 0xffff9694ae208400
>     2954033 WB_REASON_FOREIGN_FLUSH 0xffff96a22d62cbc0
>     3008860 WB_REASON_FOREIGN_FLUSH 0xffff969eee8ce3c0
>     3337932 WB_REASON_FOREIGN_FLUSH 0xffff9695b45156c0
>     3348916 WB_REASON_FOREIGN_FLUSH 0xffff96a22c7a4f40
>     3345363 WB_REASON_FOREIGN_FLUSH 0xffff969e5d872800
>     3333581 WB_REASON_FOREIGN_FLUSH 0xffff969efd0f4600
>     3382225 WB_REASON_FOREIGN_FLUSH 0xffff969e770edcc0
>     3418770 WB_REASON_FOREIGN_FLUSH 0xffff96a252ceea40
>     3387648 WB_REASON_FOREIGN_FLUSH 0xffff96a3bda86340
>     3385420 WB_REASON_FOREIGN_FLUSH 0xffff969efc6eb280
>     3418730 WB_REASON_FOREIGN_FLUSH 0xffff96a348ab1040
>     3426155 WB_REASON_FOREIGN_FLUSH 0xffff969d90beac00
>     3397995 WB_REASON_FOREIGN_FLUSH 0xffff96a2d7288800
>     3293095 WB_REASON_FOREIGN_FLUSH 0xffff969dab423240
>     3293595 WB_REASON_FOREIGN_FLUSH 0xffff969c765ff400
>     3199511 WB_REASON_FOREIGN_FLUSH 0xffff969a72d5e680
>     3085016 WB_REASON_FOREIGN_FLUSH 0xffff969f0455e000
>     3035712 WB_REASON_FOREIGN_FLUSH 0xffff969d9bbf4b00
>              b. The writeback might severely throttled by wbt, with a spe=
ed
>            possibly less than 100kb/s, leading to a very long writeback t=
ime.
>          >>> wb.write_bandwidth
>     (unsigned long)24
>     >>> wb.write_bandwidth
>     (unsigned long)13
>          The wb_wait_for_completion() here is probably only used to preve=
nt
>     use-after-free.  Therefore, we manage 'done' separately and automatic=
ally
>     free it.
>          This allows us to remove wb_wait_for_completion() while preventi=
ng the
>     use-after-free issue.
>      com
>     Fixes: 97b27821b485 ("writeback, memcg: Implement foreign dirty flush=
ing")
>     Signed-off-by: Julian Sun <sunjunchao@bytedance.com>
>     Acked-by: Tejun Heo <tj@kernel.org>
>     Cc: Michal Hocko <mhocko@suse.com>
>     Cc: Roman Gushchin <roman.gushchin@linux.dev>
>     Cc: Johannes Weiner <hannes@cmpxchg.org>
>     Cc: Shakeel Butt <shakeelb@google.com>
>     Cc: Muchun Song <songmuchun@bytedance.com>
>     Cc: <stable@vger.kernel.org>
>     Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
>
> Regards,
> Venkat.
>
> >
>

Thanks,
--=20
Julian Sun <sunjunchao@bytedance.com>

