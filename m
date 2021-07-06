Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E89DB3BDA46
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jul 2021 17:34:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GK66y5Kqqz3bYf
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jul 2021 01:34:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=M3k/QbYt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.50;
 helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=M3k/QbYt; 
 dkim-atps=neutral
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.50])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GK66S5h8Bz2ymV
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Jul 2021 01:34:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625585624;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:Date:Message-ID:References:Cc:To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=VtEf5K4xr2ikQZZXeBeWremiLZpJOnqMXAXhE1aplqg=;
 b=M3k/QbYtdWsM891khv0YO4wrWoIg4FE9pj8cHUkmDLO+eMAuUMYvSgA3ZZNWZhosPr
 3FiFf1sKzN2KbT+DGw8HuNOSZhEVTpinccXgAYRa7dS5gautgtHXzTPZGpECQ/rhcgxo
 OFDFoYes/jwt1BHUT61nn0dJlLzuRzXkQZnmfbU0UWAIdqBtOnx/QlRVdd46dPCEVNuR
 OUrYuZLp9I7Rq/o6INIpdh5fvY5cr1JGfKF76QNkWcDg5VDz9fi+veznSKfSUTwHAnyi
 5A0FhJ54RLE/rApgl2N2/fy5wyE05OIIfT1U5Q8573Fq9WuASdqC150JydeAPgtsLqn9
 TA0Q==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHvJzedV4hZUmZXAXbYUBWF2x3OBR490ekaIAVREn8CoDlreD"
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2a01:598:a972:569d:25d0:f684:fc1b:518a]
 by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id D02c3ax66FXhRqj
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 6 Jul 2021 17:33:43 +0200 (CEST)
Subject: Re: Xorg doesn't work anymore after the latest DRM updates
From: Christian Zigotzky <chzigotzky@xenosoft.de>
To: "Das, Nirmoy" <nirmoy.das@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20210509224926.GA31035@embeddedor>
 <CADnq5_OWk+rXK5xrwu0YOMVC45WyQgFQBTUNkcF8oO3ucp+=XQ@mail.gmail.com>
 <ba5f2a73-58e8-6b3e-4048-bb19f238be51@embeddedor.com>
 <4e0a3130-4c20-aa8a-f32a-6c3f0d9cd6f8@xenosoft.de>
 <345042b3-7b96-63d9-d4a5-f31c4441ddaf@amd.com>
 <d22b9f68-3692-2819-33a4-123b7182daf3@xenosoft.de>
Message-ID: <1a269f97-7260-4860-dfe7-c723b73fd909@xenosoft.de>
Date: Tue, 6 Jul 2021 17:33:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <d22b9f68-3692-2819-33a4-123b7182daf3@xenosoft.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: de-DE
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
Cc: Darren Stevens <darren@stevens-zone.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 mad skateman <madskateman@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Nirmoy,

This patch works! Thanks a lot! We tested it on an A-EON AmigaOne 
X5000/20 today.

Screenshot: 
http://www.skateman.nl/wp-content/uploads/2021/07/Screenshot-at-2021-07-06-113237.png

Cheers,
Christian

On 05 July 2021 at 06:48 pm, Christian Zigotzky wrote:
> Hi Nirmoy,
>
> Many thanks for this information. We will test this patch asap.
>
> Have a nice day,
> Christian
>
> On 05 July 2021 at 10:26pm, Nirmoy wrote:
> > Hi Christian,
> >
> >
> > This issue looks similar to the one Mikel Rychliski fixed recently  
> : https://patchwork.freedesktop.org/patch/440791. Let us know if this 
> helps.
> >
> >
> > Regards,
> >
> > Nirmoy
> >
> > On 7/3/2021 9:30 AM, Christian Zigotzky wrote:
> >> Hi All,
> >>
> >> Xorg doesn't work anymore after the latest DRM updates. [1]
> >>
> >> Error messages:
> >>
> >> Jul 03 08:54:51 Fienix systemd[1]: Starting Light Display Manager...
> >> Jul 03 08:54:51 Fienix systemd[1]: Started Light Display Manager.
> >> Jul 03 08:54:51 Fienix kernel: BUG: Kernel NULL pointer dereference 
> on read at 0x00000010
> >> Jul 03 08:54:51 Fienix kernel: Faulting instruction address: 
> 0xc000000000630750
> >> Jul 03 08:54:51 Fienix kernel: Oops: Kernel access of bad area, 
> sig: 11 [#1]
> >> Jul 03 08:54:51 Fienix kernel: BE PAGE_SIZE=4K PREEMPT SMP 
> NR_CPUS=4 CoreNet Generic
> >> Jul 03 08:54:51 Fienix kernel: Modules linked in: algif_skcipher 
> bnep tuner_simple tuner_types tea5767 tuner tda7432 tvaudio msp3400 
> bttv tea575x tveeprom videobuf_dma_sg videobuf_core rc_core videodev 
> mc btusb btrtl btbcm btintel bluetooth ecdh_generic ecc 
> uio_pdrv_genirq uio
> >> Jul 03 08:54:51 Fienix kernel: CPU: 3 PID: 4300 Comm: Xorg.wrap Not 
> tainted 5.14.0-a3_A-EON_X5000-07637-g3dbdb38e2869-dirty #1
> >> Jul 03 08:54:51 Fienix kernel: NIP:  c000000000630750 LR: 
> c00000000060fedc CTR: c000000000630728
> >> Jul 03 08:54:51 Fienix kernel: REGS: c00000008d903470 TRAP: 0300 
> Not tainted (5.14.0-a3_A-EON_X5000-07637-g3dbdb38e2869-dirty)
> >> Jul 03 08:54:51 Fienix kernel: MSR:  0000000080029002 <CE,EE,ME>  
> CR: 20000222  XER: 20000000
> >> Jul 03 08:54:51 Fienix kernel: DEAR: 0000000000000010 ESR: 
> 0000000000000000 IRQMASK: 0
> >>                                GPR00: c00000000060fedc 
> c00000008d903710 c00000000190c400 c000000085d59c00
> >>                                GPR04: c00000008d9035b8 
> ffffffffffffffff c0000000870a4900 c000000085b62d00
> >>                                GPR08: 000000000000000f 
> 0000000000000000 c000000000630728 0000000000000003
> >>                                GPR12: 0000000020000222 
> c00000003fffeac0 00000000ffe51070 000000000086007c
> >>                                GPR16: 0000000000862820 
> 00000000ffb7ec68 0000000000000000 00000000ffffffff
> >>                                GPR20: 00000000c04064a0 
> 0000000000450088 00000000ffca79e4 5deadbeef0000122
> >>                                GPR24: 5deadbeef0000100 
> 0000000000000000 c0000000876028f0 c000000080bd4000
> >>                                GPR28: c000000087603c48 
> c000000085d59d78 c000000085d59c00 c000000085d59c78
> >> Jul 03 08:54:51 Fienix kernel: NIP [c000000000630750] 
> .radeon_ttm_bo_destroy+0x28/0xc0
> >> Jul 03 08:54:51 Fienix kernel: LR [c00000000060fedc] 
> .ttm_bo_put+0x2ec/0x344
> >> Jul 03 08:54:51 Fienix kernel: Call Trace:
> >> Jul 03 08:54:51 Fienix kernel: [c00000008d903710] 
> [c00000000060fbe4] .ttm_bo_cleanup_memtype_use+0x54/0x60 (unreliable)
> >> Jul 03 08:54:51 Fienix kernel: [c00000008d903790] 
> [c00000000060fedc] .ttm_bo_put+0x2ec/0x344
> >> Jul 03 08:54:51 Fienix kernel: [c00000008d903820] 
> [c000000000630b50] .radeon_bo_unref+0x28/0x3c
> >> Jul 03 08:54:51 Fienix kernel: [c00000008d9038a0] 
> [c0000000006d1f6c] .radeon_vm_fini+0x1b0/0x1b8
> >> Jul 03 08:54:51 Fienix kernel: [c00000008d903940] 
> [c000000000618e38] .radeon_driver_postclose_kms+0x128/0x178
> >> Jul 03 08:54:51 Fienix kernel: [c00000008d9039e0] 
> [c0000000005deb14] .drm_file_free+0x1d8/0x278
> >> Jul 03 08:54:51 Fienix kernel: [c00000008d903aa0] 
> [c0000000005def00] .drm_release+0x64/0xc8
> >> Jul 03 08:54:51 Fienix kernel: [c00000008d903b30] 
> [c00000000017636c] .__fput+0x11c/0x25c
> >> Jul 03 08:54:51 Fienix kernel: [c00000008d903bd0] 
> [c00000000008b1e8] .task_work_run+0xa4/0xbc
> >> Jul 03 08:54:51 Fienix kernel: [c00000008d903c70] 
> [c000000000004bf4] .do_notify_resume+0x144/0x2f0
> >> Jul 03 08:54:51 Fienix kernel: [c00000008d903d70] 
> [c00000000000b380] .syscall_exit_prepare+0x110/0x130
> >> Jul 03 08:54:51 Fienix kernel: [c00000008d903e10] 
> [c000000000000688] system_call_common+0x100/0x1fc
> >> Jul 03 08:54:51 Fienix kernel: --- interrupt: c00 at 0x3f4f58
> >> Jul 03 08:54:51 Fienix kernel: NIP:  00000000003f4f58 LR: 
> 00000000003f4f2c CTR: 0000000000000000
> >> Jul 03 08:54:51 Fienix kernel: REGS: c00000008d903e80 TRAP: 0c00 
> Not tainted (5.14.0-a3_A-EON_X5000-07637-g3dbdb38e2869-dirty)
> >> Jul 03 08:54:51 Fienix kernel: MSR:  000000000002d002 
> <CE,EE,PR,ME>  CR: 20000420  XER: 00000000
> >> Jul 03 08:54:51 Fienix kernel: IRQMASK: 0
> >>                                GPR00: 0000000000000006 
> 00000000ffca66a0 00000000f798a310 0000000000000000
> >>                                GPR04: 0000000000000000 
> 0000000000000000 0000000000000000 0000000000000000
> >>                                GPR08: 0000000000000000 
> 0000000000000000 0000000000000000 0000000000000000
> >>                                GPR12: 0000000000000000 
> 000000000044fff4 00000000ffe51070 000000000086007c
> >>                                GPR16: 0000000000862820 
> 00000000ffb7ec68 0000000000000000 00000000ffffffff
> >>                                GPR20: 00000000c04064a0 
> 0000000000450088 00000000ffca79e4 00000000004317ac
> >>                                GPR24: 00000000004317b8 
> 00000000ffca66d0 0000000000000001 00000000ffca673c
> >>                                GPR28: 0000000000000001 
> 0000000000000000 000000000041cff4 0000000000000003
> >> Jul 03 08:54:51 Fienix kernel: NIP [00000000003f4f58] 0x3f4f58
> >> Jul 03 08:54:51 Fienix kernel: LR [00000000003f4f2c] 0x3f4f2c
> >> Jul 03 08:54:51 Fienix kernel: --- interrupt: c00
> >> Jul 03 08:54:51 Fienix kernel: Instruction dump:
> >> Jul 03 08:54:51 Fienix kernel: 40c2fff4 4e800020 7c0802a6 fbc1fff0 
> f8010010 3bc3ff88 fbe1fff8 38a0ffff
> >> Jul 03 08:54:51 Fienix kernel: f821ff81 7c7f1b78 e9230168 7fc3f378 
> <80890010> 4bffff51 e87f0208 38631df8
> >> Jul 03 08:54:51 Fienix kernel: ---[ end trace ddf73d2d70058380 ]---
> >> Jul 03 08:54:51 Fienix kernel:
> >> Jul 03 08:54:51 Fienix systemd[1]: lightdm.service: Main process 
> exited, code=exited, status=1/FAILURE
> >> Jul 03 08:54:51 Fienix systemd[1]: lightdm.service: Failed with 
> result 'exit-code'.
> >> Jul 03 08:54:51 Fienix avahi-daemon[3857]: Registering new address 
> record for 2a02:8109:89c0:ebfc:d372:f06c:9247:7d54 on enP4096p4s4.*.
> >> Jul 03 08:54:51 Fienix systemd[1]: lightdm.service: Scheduled 
> restart job, restart counter is at 1.
> >> Jul 03 08:54:51 Fienix systemd[1]: Stopped Light Display Manager.
> >>
> >> ----
> >> Systems: A-EON AmigaOne X1000 and X5000 with Radeon HD6970 graphics 
> cards. [2] [3] [4]
> >>
> >> The biggest problem is, that I don't have time for bisecting and 
> fixing this issue.
> >>
> >> Cheers,
> >> Christian
> >>
> >> [1] 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e058a84bfddc42ba356a2316f2cf1141974625c9
> >> [2] http://wiki.amiga.org/index.php?title=X5000
> >> [3] https://en.wikipedia.org/wiki/AmigaOne_X1000
> >> [4] https://forum.hyperion-entertainment.com/viewtopic.php?f=58&t=4378
>
>

