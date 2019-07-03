Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB935E2BA
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2019 13:19:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45dzCD4y0PzDqSS
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2019 21:19:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx1.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45dz9716VDzDqSJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jul 2019 21:17:22 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C5F9EADEF;
 Wed,  3 Jul 2019 11:17:18 +0000 (UTC)
Date: Wed, 3 Jul 2019 13:17:16 +0200
From: Michal =?UTF-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>
To: Sachin Sant <sachinp@linux.vnet.ibm.com>
Subject: Re: Kernel Bug/oops during boot (PowerVM LPAR w/vTPM)
Message-ID: <20190703131716.7e16d840@naga>
In-Reply-To: <49B804EE-726B-4EB4-9BED-116F8FB5B374@linux.vnet.ibm.com>
References: <49B804EE-726B-4EB4-9BED-116F8FB5B374@linux.vnet.ibm.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: nayna@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, gcwilson@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 3 Jul 2019 15:54:59 +0530
Sachin Sant <sachinp@linux.vnet.ibm.com> wrote:

> Booting mainline kernel on PowerVM LPAR with vTPM enabled results
> into a kernel crash.
>=20
> [    0.365989] BUG: Kernel NULL pointer dereference at 0x00000012
> [    0.365995] Faulting instruction address: 0xc00000000073dd80
> [    0.366000] Oops: Kernel access of bad area, sig: 11 [#1]
> [    0.366005] LE PAGE_SIZE=3D64K MMU=3DHash SMP NR_CPUS=3D2048 NUMA pSer=
ies
> [    0.366010] Modules linked in:
> [    0.366015] CPU: 1 PID: 1 Comm: swapper/0 Not tainted 5.2.0-rc7-autote=
st-autotest #1
> [    0.366020] NIP:  c00000000073dd80 LR: c00000000073dcd0 CTR: 000000000=
0000000
> [    0.366026] REGS: c0000018ed8e7550 TRAP: 0380   Not tainted  (5.2.0-rc=
7-autotest-autotest)
> [    0.366031] MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: 2800244=
8  XER: 20040001
> [    0.366038] CFAR: c000000000b6d1c4 IRQMASK: 0
> [    0.366038] GPR00: c00000000073dcd0 c0000018ed8e77e0 c000000001524a00 =
0000000000000000
> [    0.366038] GPR04: 0000000000000003 0000000000000000 0000000000010000 =
000000000000000e
> [    0.366038] GPR08: 0000000000000022 0000000000010000 c0000018e5510000 =
00000000883bfecd
> [    0.366038] GPR12: 0000000048002448 c00000001ec6ee00 c0000000000107a8 =
0000000000000000
> [    0.366038] GPR16: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000
> [    0.366038] GPR20: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000
> [    0.366038] GPR24: c0000018eb9eaaa0 0000000000000000 c000000000bce810 =
c000000000e2ed28
> [    0.366038] GPR28: c0000018e70a4000 000000000000000a 0000000000000012 =
c0000018e5510000
> [    0.366085] NIP [c00000000073dd80] tpm1_pcr_extend+0x130/0x230
> [    0.366090] LR [c00000000073dcd0] tpm1_pcr_extend+0x80/0x230
> [    0.366094] Call Trace:
> [    0.366098] [c0000018ed8e77e0] [c00000000073dcd0] tpm1_pcr_extend+0x80=
/0x230 (unreliable)
> [    0.366105] [c0000018ed8e7890] [c00000000073c8c4] tpm_pcr_extend+0xd4/=
0x180
> [    0.366111] [c0000018ed8e78d0] [c0000000005745f8] ima_add_template_ent=
ry+0x198/0x320
> [    0.366117] [c0000018ed8e79b0] [c000000000577058] ima_store_template+0=
xc8/0x160
> [    0.366124] [c0000018ed8e7a30] [c000000000f6081c] ima_add_boot_aggrega=
te+0xf8/0x184
> [    0.366130] [c0000018ed8e7b30] [c000000000f6093c] ima_init+0x94/0xbc
> [    0.366135] [c0000018ed8e7b90] [c000000000f60aac] init_ima+0x44/0xe8
> [    0.366140] [c0000018ed8e7c10] [c000000000010448] do_one_initcall+0x68=
/0x2c0
> [    0.366146] [c0000018ed8e7ce0] [c000000000f14738] kernel_init_freeable=
+0x318/0x47c
> [    0.366152] [c0000018ed8e7db0] [c0000000000107c4] kernel_init+0x24/0x1=
50
> [    0.366158] [c0000018ed8e7e20] [c00000000000ba54] ret_from_kernel_thre=
ad+0x5c/0x68
> [    0.366163] Instruction dump:
> [    0.366167] 7d404d2c 81210068 792a07e1 e9410070 392a0002 7d004c2c 7907=
0020 40c20048
> [    0.366174] 39080014 3d200001 7f884840 419d00a4 <807e0000> 809e0004 80=
be0008 80de000c
> [    0.366182] ---[ end trace ec40127c4fe87b2c ]=E2=80=94
>=20
> Thanks
> -Sachin

You need to revert (or fix up) commit 0b6cf6b97b7e ("tpm: pass an array
of tpm_extend_digest structures to tpm_pcr_extend()". At least
reverting it fixes the issue for me.

Thanks

Michal

