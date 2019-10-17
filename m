Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A18DA4C0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Oct 2019 06:32:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46tx8S6Jn8zDqfp
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Oct 2019 15:32:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::12c;
 helo=mail-il1-x12c.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="egjDyKlK"; 
 dkim-atps=neutral
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46tx5q00RTzDqcQ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Oct 2019 15:29:48 +1100 (AEDT)
Received: by mail-il1-x12c.google.com with SMTP id o18so703178ilo.9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Oct 2019 21:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=AhCwAb9/44cetx367+mRZ3OC80ukeLiQrfkhBwF1vyE=;
 b=egjDyKlK2U/VvK5EBAJ3qGJGM/OcgjPr9OUG34WEO5bbsDdGDZe2eGyRd/KCSQDsxq
 +nHLZz68mPXuAqybSFaQfsZbnVnxs4mcsOcrjUi8Ke3MpGeSpSPXL8+ewgWfJ8/SLtdd
 q1qAx0DREHxOJgVVwe7Twsd4TKwWApeTod3DPZSLogWIHbDlLppflQB/H6F7cduWTGD4
 HhbjdS7qKqTrgaDhFxyG8EkBoF6w6AJwrFbbm+GzqVtP3svzUuKsZXqLIvZO3JNrsXwQ
 8pvjLrhbc3hJA8tL8Os6qJjk4MZS2Ss9stFOZxAoQ3pgimUQIR1jEaSE8pbhxiGJiIx6
 6BmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=AhCwAb9/44cetx367+mRZ3OC80ukeLiQrfkhBwF1vyE=;
 b=F3n7bbye5WboruRz9KUTx3mvwyGZa2TA73Vz+8ZhIXvR8lsVrFElrkjhwhTj6YnQuS
 2EE7Z9XReJYKxZqcd7fHfNKJSRHCSkyycmyQvwLI6O5TmS5LUq+WHLQtqW7m3a1eCuJ6
 VbD1EGveTM+vB/9RIUKhjnQMr0aKdK0Jj8aZtTJLaY5rRN8AjH7TC2bmDjNGWk/GZU/R
 hLOh64hXYE+eZkNYmfhIAtPBJgp6VrDiJ6LBhLyoJ6lIuPmR50HrN4EU4ZP76Ml6KSVp
 4NSWZ9fMtHfgeVdThdnNdXcrVKUB5Q9Yubq5ecfYA+5AkRu8yhCikQqq9+9VwIRB7qrp
 iBmg==
X-Gm-Message-State: APjAAAXZLOPOsNCAtVRHA3Ju4VPgn2DtNfPCXm2zNkn/Zlw7fIKIu2xZ
 qmPMgin/Nnhd3McfCn8fZEHZ3YJ07SKBQWLxrUk=
X-Google-Smtp-Source: APXvYqz8tQQNUyp0Vu9kS9JCXzsMR7AKV7GydB2SkuExVO7vt9HAYp0o7KoRDZbF/N2Ek+wea5Aw5gH/Q28ArVW7cE4=
X-Received: by 2002:a92:8384:: with SMTP id p4mr1497357ilk.276.1571286586357; 
 Wed, 16 Oct 2019 21:29:46 -0700 (PDT)
MIME-Version: 1.0
References: <HK0PR02MB3283E73F2AA72D7EFA4350A3D96D0@HK0PR02MB3283.apcprd02.prod.outlook.com>
In-Reply-To: <HK0PR02MB3283E73F2AA72D7EFA4350A3D96D0@HK0PR02MB3283.apcprd02.prod.outlook.com>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Thu, 17 Oct 2019 15:29:35 +1100
Message-ID: <CAOSf1CF21ScwyJzHP+6t=Ev_ED4kW+M0f43VuhJmFucwXrtpQQ@mail.gmail.com>
Subject: Re: system call hook triggers kernel panic
To: Yi Li <adamliyi@msn.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Oct 17, 2019 at 1:01 PM Yi Li <adamliyi@msn.com> wrote:
>
> Hi,

*snip*

> The kernel module can be insert correctly, and we mount a tmpfs, then umo=
unt.
> Kernel panic when doing umount:
> "
> [  148.569777] umount /home/adam/test 0x0
> [  148.608227] umount2 returned 0
> [  148.608268] Unable to handle kernel paging request for data at address=
 0xc00800001625a288
> [  148.608320] Faulting instruction address: 0xc00000000001d610
> [  148.608387] Oops: Kernel access of bad area, sig: 11 [#1]
> [  148.608418] LE SMP NR_CPUS=3D2048 NUMA PowerNV
> [  148.608460] Modules linked in: poc(OE) rpcrdma sunrpc ib_isert iscsi_t=
arget_mod ib_iser libiscsi scsi_transport_iscsi ib_srpt target_core_mod ib_=
srp scsi_transport_srp ib_ipoib rdma_ucm ib_ucm ib_uverbs ib_umad rdma_cm i=
b_cm iw_cm ib_core i2c_dev ses ipmi_powernv enclosure scsi_transport_sas sg=
 ipmi_devintf at24 ofpart powernv_flash ipmi_msghandler mtd shpchp uio_pdrv=
_genirq opal_prd ibmpowernv uio ip_tables ext4 mbcache jbd2 sd_mod ast i2c_=
algo_bit drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops ttm d=
rm tg3 megaraid_sas be2net aacraid ptp pps_core
> [  148.608946] CPU: 5 PID: 15540 Comm: umount Tainted: G           OE  --=
----------   4.14.0-115.10.1.el7a.ppc64le #1
> [  148.609075] task: c000003fc4017000 task.stack: c000003fbae9c000
> [  148.609159] NIP:  c00000000001d610 LR: c00000000000dd00 CTR: 000000000=
000004e
> [  148.609239] REGS: c000003fbae9fb70 TRAP: 0300   Tainted: G           O=
E  ------------    (4.14.0-115.10.1.el7a.ppc64le)
> [  148.609339] MSR:  9000000002803033 <SF,HV,VEC,VSX,FP,ME,IR,DR,RI,LE>  =
CR: 22000844  XER: 20040000
> [  148.609391] CFAR: c00000000001d5f8 DAR: c00800001625a288 DSISR: 400000=
00 SOFTE: 1
> [  148.609391] GPR00: c00000000000dd00 c000003fbae9fdf0 c0080000161c8400 =
c000003fbae9fea0
> [  148.609391] GPR04: 0000000000040080 0000000000000000 0000000000000001 =
0000000000000000
> [  148.609391] GPR08: c008000016258400 0000000000000002 0000000000000002 =
0000000000000c00
> [  148.609391] GPR12: 0000000000000000 c00000000fa83700 0000000000000000 =
0000000000000000
> [  148.609391] GPR16: 0000000000000000 0000000000000000 0000000000000000 =
00007fffe86f3234
> [  148.609391] GPR20: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000
> [  148.609391] GPR24: 000000012a7d6468 000000012a7d6590 0000000000000001 =
0000000163a574f0
> [  148.609391] GPR28: 00002000000e1d54 0000000000000000 c000003fbae9fea0 =
900000000280f033
> [  148.610016] NIP [c00000000001d610] restore_math+0x60/0x200
> [  148.610079] LR [c00000000000dd00] ret_from_except_lite+0x2c/0x74
> [  148.610143] Call Trace:
> [  148.610186] [c000003fbae9fdf0] [c000003fbae9fe30] 0xc000003fbae9fe30 (=
unreliable)
> [  148.610287] [c000003fbae9fe30] [c00000000000dd00] ret_from_except_lite=
+0x2c/0x74
> [  148.610378] Instruction dump:
> [  148.610414] 7be7e8a4 78e71f87 40820024 e92d0260 89290e78 2f890000 409e=
0014 e92d0260
> [  148.610471] 89290e79 2f890000 419e0074 3d020009 <e9081e88> 7d4000a6 7d=
494378 60000000
> [  148.610568] ---[ end trace 1ec6b39ae7531745 ]---
> [  149.593561]
> [  150.593628] Kernel panic - not syncing: Fatal exception
> "

The ABI (v1 and v2) uses r2 as a pointer to the "table of contents"
which is used to look up the addresses of global symbols. TOCs are
specific to the current unit of execution and the vmlinux and each
module has its own TOC. From the dump it looks like the r2 is pointing
into the vmalloc area where modules are loaded so odds are the crash
is because the TOC isn't being restored when we return from the
patched function. One of the many reasons why you really shouldn't
hook the syscall table ;)

The vmlinux's TOC is saved somewhere in the PACA (legacy ppc specific
per-cpu thing) so you could restore it with some inline asm before
returning from your hook. Have a look at what we to load r2 in the
system call entry path.

> Thanks,
> -Yi Li
