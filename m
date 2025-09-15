Return-Path: <linuxppc-dev+bounces-12250-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9478EB5845A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Sep 2025 20:17:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQYCj5fMPz3dFB;
	Tue, 16 Sep 2025 04:17:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1136"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757960241;
	cv=none; b=TQyKytCJJBi0XYKkdIqhzsSYIlVcPvPeIBiN9WCVtTHa0PdnD+p6CB0Mjak+8YltaVUwBMsQfJqs1G/dWh1HPlROqBuw7mkZgz/GWeRZ5SCV8Q1euGjdFYlk+VX7MvaWclpsXAgwmd5zQ5sRi/hshI0lMsaNGa+S/Pd6MBclXfLA3q5l9L0WUTzzw4BgGdJDo5eP+O9diIXtBO6V1y+mbT0O8yixBH5F0kqVlofXcfpFkeMtyy6MIiaYtd1Jh0UbNz32n0Vry/3ebmZeh0ylzJYzxx6b94JNFQw14nYDRIZy91rMGJDdocLsnH4uVEGfdhSjGVfZj0MzRjZS8z7w/w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757960241; c=relaxed/relaxed;
	bh=HKlJwLV4pOJ4puXUorbm745sN+ixIvqNcAK/DngGboE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ULm643qR9GQ8w5ZAUWahfAfWhpxVgyTJb9AHBQTtn9u0MKHGKHjVVp/vWnRH+gO1JK4knKVtqkhezzXU8DtWLZUGwJDUoHYFTS2tlmtuk1MjKXjFeHHT3xNml2V+c7iKnE9ov7QDL6mCKw5HNqj/mtLI0FOqisbK5K2P0ySlQTSqPMmgbi1UjGw57Z7eLC3belj6G4ty6xxSMRYwI6j4hJojHk9zoVBkUNJCuYqTCzLDwL9KEdzkzxz+jV464WywmRMSM3SflCiA311EGVLotfIksuZ4GFP8oQny5Ja5QskNVuzOOHjiUqT6u48RGWY3Wq84P7owvcf40rKFEtI2sg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=C3FTrBAb; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1136; helo=mail-yw1-x1136.google.com; envelope-from=sunjunchao@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=C3FTrBAb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::1136; helo=mail-yw1-x1136.google.com; envelope-from=sunjunchao@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cQYCg6YsLz3d9q
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Sep 2025 04:17:18 +1000 (AEST)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-71d5fe46572so49353127b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Sep 2025 11:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1757960235; x=1758565035; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HKlJwLV4pOJ4puXUorbm745sN+ixIvqNcAK/DngGboE=;
        b=C3FTrBAbJjPW8jc+vI/q0mBVqjFEVOiOK6BAangTWk+Ic/KJuKJsbnBD6GkPae8r+w
         nuKWW/omVqItFl8qOrCLcmT4sNSvdb6Gks0+2EVp+IGqhRI1uFkXLmgyVvI9RZNfX+++
         UzIac2h9gH2zxBbpIpnBx3Lv95tb75UYpX2ZvgbDqlSatZm6hdplf3a2iyv7SsJ8rXxM
         YJppIcatuYRVUV0AKg8Xd8MOEEX8j1vyeVBH1n6lRaHg616EeOfEAFhMsnY+HF+NvEp5
         A/l23yO0TRJ7vHp/4E/pm1ieErLQOQzlTfZu45+Qi+/jSyMsS+f77//ycd237ucl2p1M
         3ZNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757960235; x=1758565035;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HKlJwLV4pOJ4puXUorbm745sN+ixIvqNcAK/DngGboE=;
        b=BmoDLCRVXpZLrzm2/bCwGsCg36/aDmHqdJre0thJLYMOtzT3l+xWNxtQ1nKofHeXFc
         XzVdqml+n+cNhMAjolof/QK7LOIkkF5CJUJdJEnCbhybQuf83EocWww5Fi/H0a8bwoKu
         A4Az6ItwW+rtI4mt0vENp8Yros1d2tZBXv7XbmY3vFlprNXGjJ84PFEs3Yk51JOIqNr7
         4uE5BB8SM92ZZIlBcN8+WaiMiyjQPLBV8WrTW4LXG7GGbGGALHPKki3rvrxq4MeG7fx7
         2qAVQJf0QZiEnYb8JZQSF48cCTo3tlaFrTajvWYqlZVDBoQvSFBFg6fKll6HxBNetOje
         M/PA==
X-Forwarded-Encrypted: i=1; AJvYcCUgUBGDZknicz1mZ+0f+XqoBqQYlbfIUpfVBq12asVww9oEJv579BvFkQMRFTeRdZkV/uxNCasXw1VKoGw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzAZzElKWXhwdum+JPF3OVfs357e+v/Fp1Vk0ziVJADPXg5TDpx
	7gN1n6GCRrYA+UZZoyfAoo/P4I0xmEipFSvVWkyGcWXKyvW3fBY92k+ZV/lhxqsPzbAIrtpZ6JZ
	j2tFJubstHcpDKO7j0FShw+SkCvzSyEEHe/yvN0ueNQ==
X-Gm-Gg: ASbGncuj0OkqN0AR3kfjwQHHJtjCFGFmP8oad/XgEm4syZWXRDlfV5fGlNVb5fi3qFQ
	rCCWzesdC+OtJ3x2WhQyg/CY3GBerTYXf5ny9qHPafJCxCSRrJgyY5L1S2CERgwBQNs8CeDfUJk
	fMNKmQ2zXTH3vnfKP8puJrR1q2Kq6Y+s3bLjPSo4GdjOZrfRYyClLrVJD+yTYqjBykaKhXrWPfH
	GkdVCsCEsWAdfQ=
X-Google-Smtp-Source: AGHT+IH2QrZCMVWhvvri3m8MxFDEcR0HmA+y/PUfUv7fmACFArS88p8HCYr635Yfqj73ooPhrYiGLmLkR7TW9H/RB9o=
X-Received: by 2002:a05:690c:11:b0:736:9b6b:b60 with SMTP id
 00721157ae682-7369b6b0be4mr4506137b3.1.1757960235244; Mon, 15 Sep 2025
 11:17:15 -0700 (PDT)
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
References: <8957c526-d05c-4c0d-bfed-0eb6e6d2476c@linux.ibm.com>
 <BAEAC2F7-7D7F-49E4-AB21-10FC0E4BF5F3@linux.ibm.com> <CAHSKhteHC26yXVFtjgdanfM7+vsOVZ+HHWnBYD01A4eiRHibVQ@mail.gmail.com>
 <240A7968-D530-4135-856A-CE90D269D5E6@linux.ibm.com>
In-Reply-To: <240A7968-D530-4135-856A-CE90D269D5E6@linux.ibm.com>
From: Julian Sun <sunjunchao@bytedance.com>
Date: Tue, 16 Sep 2025 02:17:04 +0800
X-Gm-Features: Ac12FXxKsCIM3iC7qE18J4UiGkC_uav_J5eUCDy79Yskt9qkAhILOdX4JZ7_6xI
Message-ID: <CAHSKhteezz0pjUYibp6drOysBzxUV6LzSi6oyA8LgHCtL_CysA@mail.gmail.com>
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

Hi,

On Mon, Sep 15, 2025 at 10:20=E2=80=AFPM Venkat <venkat88@linux.ibm.com> wr=
ote:
>
>
>
> > On 13 Sep 2025, at 8:18=E2=80=AFAM, Julian Sun <sunjunchao@bytedance.co=
m> wrote:
> >
> > Hi,
> >
> > Does this fix make sense to you?
> >
> > diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> > index d0dfaa0ccaba..ed24dcece56a 100644
> > --- a/mm/memcontrol.c
> > +++ b/mm/memcontrol.c
> > @@ -3945,9 +3945,10 @@ static void mem_cgroup_css_free(struct
> > cgroup_subsys_state *css)
> >                 * Not necessary to wait for wb completion which might
> > cause task hung,
> >                 * only used to free resources. See
> > memcg_cgwb_waitq_callback_fn().
> >                 */
> > -               __add_wait_queue_entry_tail(wait->done.waitq, &wait->wq=
_entry);
> >                if (atomic_dec_and_test(&wait->done.cnt))
> > -                       wake_up_all(wait->done.waitq);
> > +                       kfree(wait);
> > +               else
> > +                       __add_wait_queue_entry_tail(wait->done.waitq,
> > &wait->wq_entry);;
> >        }
> > #endif
> >        if (cgroup_subsys_on_dfl(memory_cgrp_subsys) && !cgroup_memory_n=
osocket)
>
> Hello,
>
> Thanks for the fix. This is fixing the reported issue.

Thanks for your testing and feedback.
>
> While sending out the patch please add below tag as well.
>
> Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>

Sure. That's how it should be.

Could you please try again with the following patch? The previous one
might have caused a memory leak and had race conditions. I can=E2=80=99t
reproduce it locally...

diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 80257dba30f8..35da16928599 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -3940,6 +3940,7 @@ static void mem_cgroup_css_free(struct
cgroup_subsys_state *css)
        int __maybe_unused i;

 #ifdef CONFIG_CGROUP_WRITEBACK
+       spin_lock(&memcg_cgwb_frn_waitq.lock);
        for (i =3D 0; i < MEMCG_CGWB_FRN_CNT; i++) {
                struct cgwb_frn_wait *wait =3D memcg->cgwb_frn[i].wait;

@@ -3948,9 +3949,12 @@ static void mem_cgroup_css_free(struct
cgroup_subsys_state *css)
                 * only used to free resources. See
memcg_cgwb_waitq_callback_fn().
                 */
                __add_wait_queue_entry_tail(wait->done.waitq, &wait->wq_ent=
ry);
-               if (atomic_dec_and_test(&wait->done.cnt))
-                       wake_up_all(wait->done.waitq);
+               if (atomic_dec_and_test(&wait->done.cnt)) {
+                       list_del(&wait->wq_entry.entry);
+                       kfree(wait);
+               }
        }
+       spin_unlock(&memcg_cgwb_frn_waitq.lock);
 #endif
        if (cgroup_subsys_on_dfl(memory_cgrp_subsys) && !cgroup_memory_noso=
cket)
                static_branch_dec(&memcg_sockets_enabled_key);

>
> Regards,
> Venkat.
> >
> > On Fri, Sep 12, 2025 at 8:33=E2=80=AFPM Venkat <venkat88@linux.ibm.com>=
 wrote:
> >>
> >>
> >>
> >>> On 12 Sep 2025, at 10:51=E2=80=AFAM, Venkat Rao Bagalkote <venkat88@l=
inux.ibm.com> wrote:
> >>>
> >>> Greetings!!!
> >>>
> >>>
> >>> IBM CI has reported a kernel crash, while running generic/256 test ca=
se on pmem device from xfstests suite on linux-next20250911 kernel.
> >>>
> >>>
> >>> xfstests: git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git
> >>>
> >>> local.config:
> >>>
> >>> [xfs_dax]
> >>> export RECREATE_TEST_DEV=3Dtrue
> >>> export TEST_DEV=3D/dev/pmem0
> >>> export TEST_DIR=3D/mnt/test_pmem
> >>> export SCRATCH_DEV=3D/dev/pmem0.1
> >>> export SCRATCH_MNT=3D/mnt/scratch_pmem
> >>> export MKFS_OPTIONS=3D"-m reflink=3D0 -b size=3D65536 -s size=3D512"
> >>> export FSTYP=3Dxfs
> >>> export MOUNT_OPTIONS=3D"-o dax"
> >>>
> >>>
> >>> Test case: generic/256
> >>>
> >>>
> >>> Traces:
> >>>
> >>>
> >>> [  163.371929] ------------[ cut here ]------------
> >>> [  163.371936] kernel BUG at lib/list_debug.c:29!
> >>> [  163.371946] Oops: Exception in kernel mode, sig: 5 [#1]
> >>> [  163.371954] LE PAGE_SIZE=3D64K MMU=3DRadix  SMP NR_CPUS=3D8192 NUM=
A pSeries
> >>> [  163.371965] Modules linked in: xfs nft_fib_inet nft_fib_ipv4 nft_f=
ib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nf=
t_ct nft_chain_nat nf_nat nf_conntrack bonding tls nf_defrag_ipv6 nf_defrag=
_ipv4 rfkill ip_set nf_tables nfnetlink sunrpc pseries_rng vmx_crypto dax_p=
mem fuse ext4 crc16 mbcache jbd2 nd_pmem papr_scm sd_mod libnvdimm sg ibmvs=
csi ibmveth scsi_transport_srp pseries_wdt
> >>> [  163.372127] CPU: 22 UID: 0 PID: 130 Comm: kworker/22:0 Kdump: load=
ed Not tainted 6.17.0-rc5-next-20250911 #1 VOLUNTARY
> >>> [  163.372142] Hardware name: IBM,9080-HEX Power11 (architected) 0x82=
0200 0xf000007 of:IBM,FW1110.01 (NH1110_069) hv:phyp pSeries
> >>> [  163.372155] Workqueue: cgroup_free css_free_rwork_fn
> >>> [  163.372169] NIP:  c000000000d051d4 LR: c000000000d051d0 CTR: 00000=
00000000000
> >>> [  163.372176] REGS: c00000000ba079b0 TRAP: 0700   Not tainted (6.17.=
0-rc5-next-20250911)
> >>> [  163.372183] MSR:  800000000282b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,L=
E>  CR: 28000000  XER: 00000006
> >>> [  163.372214] CFAR: c0000000002bae9c IRQMASK: 0
> >>> [  163.372214] GPR00: c000000000d051d0 c00000000ba07c50 c00000000230a=
600 0000000000000075
> >>> [  163.372214] GPR04: 0000000000000004 0000000000000001 c000000000507=
e2c 0000000000000001
> >>> [  163.372214] GPR08: c000000d0cb87d13 0000000000000000 0000000000000=
000 a80e000000000000
> >>> [  163.372214] GPR12: c00e0001a1970fa2 c000000d0ddec700 c000000000208=
e58 c000000107b5e190
> >>> [  163.372214] GPR16: c00000000d3e5d08 c00000000b71cf78 c00000000d3e5=
d05 c00000000b71cf30
> >>> [  163.372214] GPR20: c00000000b71cf08 c00000000b71cf10 c000000019f58=
588 c000000004704bc8
> >>> [  163.372214] GPR24: c000000107b5e100 c000000004704bd0 0000000000000=
003 c000000004704bd0
> >>> [  163.372214] GPR28: c000000004704bc8 c000000019f585a8 c000000019f53=
da8 c000000004704bc8
> >>> [  163.372315] NIP [c000000000d051d4] __list_add_valid_or_report+0x12=
4/0x188
> >>> [  163.372326] LR [c000000000d051d0] __list_add_valid_or_report+0x120=
/0x188
> >>> [  163.372335] Call Trace:
> >>> [  163.372339] [c00000000ba07c50] [c000000000d051d0] __list_add_valid=
_or_report+0x120/0x188 (unreliable)
> >>> [  163.372352] [c00000000ba07ce0] [c000000000834280] mem_cgroup_css_f=
ree+0xa0/0x27c
> >>> [  163.372363] [c00000000ba07d50] [c0000000003ba198] css_free_rwork_f=
n+0xd0/0x59c
> >>> [  163.372374] [c00000000ba07da0] [c0000000001f5d60] process_one_work=
+0x41c/0x89c
> >>> [  163.372385] [c00000000ba07eb0] [c0000000001f76c0] worker_thread+0x=
558/0x848
> >>> [  163.372394] [c00000000ba07f80] [c000000000209038] kthread+0x1e8/0x=
230
> >>> [  163.372406] [c00000000ba07fe0] [c00000000000ded8] start_kernel_thr=
ead+0x14/0x18
> >>> [  163.372416] Code: 4b9b1099 60000000 7f63db78 4bae8245 60000000 e8b=
f0008 3c62ff88 7fe6fb78 7fc4f378 38637d40 4b5b5c89 60000000 <0fe00000> 6000=
0000 60000000 7f83e378
> >>> [  163.372453] ---[ end trace 0000000000000000 ]---
> >>> [  163.380581] pstore: backend (nvram) writing error (-1)
> >>> [  163.380593]
> >>>
> >>>
> >>> If you happen to fix this issue, please add below tag.
> >>>
> >>>
> >>> Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
> >>>
> >>>
> >>>
> >>> Regards,
> >>>
> >>> Venkat.
> >>>
> >>>
> >>
> >> After reverting the below commit, issue is not seen.
> >>
> >> commit 61bbf51e75df1a94cf6736e311cb96aeb79826a8
> >> Author: Julian Sun <sunjunchao@bytedance.com>
> >> Date:   Thu Aug 28 04:45:57 2025 +0800
> >>
> >>    memcg: don't wait writeback completion when release memcg
> >>         Recently, we encountered the following hung task:
> >>         INFO: task kworker/4:1:1334558 blocked for more than 1720 seco=
nds.
> >>    [Wed Jul 30 17:47:45 2025] Workqueue: cgroup_destroy css_free_rwork=
_fn
> >>    [Wed Jul 30 17:47:45 2025] Call Trace:
> >>    [Wed Jul 30 17:47:45 2025]  __schedule+0x934/0xe10
> >>    [Wed Jul 30 17:47:45 2025]  ? complete+0x3b/0x50
> >>    [Wed Jul 30 17:47:45 2025]  ? _cond_resched+0x15/0x30
> >>    [Wed Jul 30 17:47:45 2025]  schedule+0x40/0xb0
> >>    [Wed Jul 30 17:47:45 2025]  wb_wait_for_completion+0x52/0x80
> >>    [Wed Jul 30 17:47:45 2025]  ? finish_wait+0x80/0x80
> >>    [Wed Jul 30 17:47:45 2025]  mem_cgroup_css_free+0x22/0x1b0
> >>    [Wed Jul 30 17:47:45 2025]  css_free_rwork_fn+0x42/0x380
> >>    [Wed Jul 30 17:47:45 2025]  process_one_work+0x1a2/0x360
> >>    [Wed Jul 30 17:47:45 2025]  worker_thread+0x30/0x390
> >>    [Wed Jul 30 17:47:45 2025]  ? create_worker+0x1a0/0x1a0
> >>    [Wed Jul 30 17:47:45 2025]  kthread+0x110/0x130
> >>    [Wed Jul 30 17:47:45 2025]  ? __kthread_cancel_work+0x40/0x40
> >>    [Wed Jul 30 17:47:45 2025]  ret_from_fork+0x1f/0x30
> >>         The direct cause is that memcg spends a long time waiting for =
dirty page
> >>    writeback of foreign memcgs during release.
> >>         The root causes are:
> >>        a. The wb may have multiple writeback tasks, containing million=
s
> >>           of dirty pages, as shown below:
> >>>>> for work in list_for_each_entry("struct wb_writeback_work", \
> >>                                        wb.work_list.address_of_(), "li=
st"):
> >>    ...     print(work.nr_pages, work.reason, hex(work))
> >>    ...
> >>    900628  WB_REASON_FOREIGN_FLUSH 0xffff969e8d956b40
> >>    1116521 WB_REASON_FOREIGN_FLUSH 0xffff9698332a9540
> >>    1275228 WB_REASON_FOREIGN_FLUSH 0xffff969d9b444bc0
> >>    1099673 WB_REASON_FOREIGN_FLUSH 0xffff969f0954d6c0
> >>    1351522 WB_REASON_FOREIGN_FLUSH 0xffff969e76713340
> >>    2567437 WB_REASON_FOREIGN_FLUSH 0xffff9694ae208400
> >>    2954033 WB_REASON_FOREIGN_FLUSH 0xffff96a22d62cbc0
> >>    3008860 WB_REASON_FOREIGN_FLUSH 0xffff969eee8ce3c0
> >>    3337932 WB_REASON_FOREIGN_FLUSH 0xffff9695b45156c0
> >>    3348916 WB_REASON_FOREIGN_FLUSH 0xffff96a22c7a4f40
> >>    3345363 WB_REASON_FOREIGN_FLUSH 0xffff969e5d872800
> >>    3333581 WB_REASON_FOREIGN_FLUSH 0xffff969efd0f4600
> >>    3382225 WB_REASON_FOREIGN_FLUSH 0xffff969e770edcc0
> >>    3418770 WB_REASON_FOREIGN_FLUSH 0xffff96a252ceea40
> >>    3387648 WB_REASON_FOREIGN_FLUSH 0xffff96a3bda86340
> >>    3385420 WB_REASON_FOREIGN_FLUSH 0xffff969efc6eb280
> >>    3418730 WB_REASON_FOREIGN_FLUSH 0xffff96a348ab1040
> >>    3426155 WB_REASON_FOREIGN_FLUSH 0xffff969d90beac00
> >>    3397995 WB_REASON_FOREIGN_FLUSH 0xffff96a2d7288800
> >>    3293095 WB_REASON_FOREIGN_FLUSH 0xffff969dab423240
> >>    3293595 WB_REASON_FOREIGN_FLUSH 0xffff969c765ff400
> >>    3199511 WB_REASON_FOREIGN_FLUSH 0xffff969a72d5e680
> >>    3085016 WB_REASON_FOREIGN_FLUSH 0xffff969f0455e000
> >>    3035712 WB_REASON_FOREIGN_FLUSH 0xffff969d9bbf4b00
> >>             b. The writeback might severely throttled by wbt, with a s=
peed
> >>           possibly less than 100kb/s, leading to a very long writeback=
 time.
> >>>>> wb.write_bandwidth
> >>    (unsigned long)24
> >>>>> wb.write_bandwidth
> >>    (unsigned long)13
> >>         The wb_wait_for_completion() here is probably only used to pre=
vent
> >>    use-after-free.  Therefore, we manage 'done' separately and automat=
ically
> >>    free it.
> >>         This allows us to remove wb_wait_for_completion() while preven=
ting the
> >>    use-after-free issue.
> >>     com
> >>    Fixes: 97b27821b485 ("writeback, memcg: Implement foreign dirty flu=
shing")
> >>    Signed-off-by: Julian Sun <sunjunchao@bytedance.com>
> >>    Acked-by: Tejun Heo <tj@kernel.org>
> >>    Cc: Michal Hocko <mhocko@suse.com>
> >>    Cc: Roman Gushchin <roman.gushchin@linux.dev>
> >>    Cc: Johannes Weiner <hannes@cmpxchg.org>
> >>    Cc: Shakeel Butt <shakeelb@google.com>
> >>    Cc: Muchun Song <songmuchun@bytedance.com>
> >>    Cc: <stable@vger.kernel.org>
> >>    Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> >>
> >> Regards,
> >> Venkat.
> >>
> >>>
> >>
> >
> >
> > --
> > Julian Sun <sunjunchao@bytedance.com>
>

Thanks,
--=20
Julian Sun <sunjunchao@bytedance.com>

