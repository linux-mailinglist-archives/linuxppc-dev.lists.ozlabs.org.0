Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F35493B18CA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Jun 2021 13:24:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G91BN5hPqz3btr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Jun 2021 21:24:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=LU6oGvda;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f;
 helo=mail-pj1-x102f.google.com; envelope-from=colorfulshark@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=LU6oGvda; dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8yxn0NZcz2yXK
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Jun 2021 19:43:24 +1000 (AEST)
Received: by mail-pj1-x102f.google.com with SMTP id
 x21-20020a17090aa395b029016e25313bfcso1046627pjp.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Jun 2021 02:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=YTjbbCpbMCXFGMXathKIB/XfWymj1wgzv0Sjansfpao=;
 b=LU6oGvdao7ftXBDiv/ZXTnz/VA/kjDQdEs1JfXsPZkRLki1sG45CEW1IyVwbt6Wz7r
 VF2rEUSN39eEVxMGLEtQToHorhykwlbj7xs8Hi7x2jOI0kTATv/1fcLDIXMJrpN5sCWT
 Rx+GgUqxSqABhha1nXaTn6/ddKo91RZ5iCUYMH+jLr+ICiPiH7dIyY0x/WBmaiYwkVP3
 JApb/HRAUTio8+x/o1VvTl84NYG/2itxALfJU3hkPPcvsXl2w77Mf8uVmij6X9QDkA5R
 gRJrz2AP4HlP40GWSYJGn62TqYzRXcL2//leWXpgnj8O20Z0+wKmO02LCe/F1Wh4xgkS
 OnTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=YTjbbCpbMCXFGMXathKIB/XfWymj1wgzv0Sjansfpao=;
 b=H1Kqi2Ze+MQUP9STAyt/HhCjpHl082e0K1Hk1Lbe4cQeGsRFpU7aMCETTvfb+AFhdH
 4F/yQmuBbKwHln5C2fSjbWIe1trPrgMhwYw8WYKUpjCWtrFgRTBUnHkFjsxNnwi9QVRd
 tTpXjUdntuO0yl1BpF7fTC+cKgARp/2MXZr9GlIj12PYKUDOpXW1NONDCRZVZwTsDDgF
 wW3/frq0/pXU+O5eP7c22a3OF8E/hBD9N7c8ZD2sX71qKmsdv+ZM3RQ9hHTvSECKEeCZ
 bsGg50WwPNYbYhKhB4M6+NdSMwmjTXcxp8t00lHKRx/0NiaGrWBcUOeLKQV0N+xQtLvi
 QppQ==
X-Gm-Message-State: AOAM531vDhiC9rWZbtPrwK8FERgRgCLWJ7ppGk85Ca5PmB1SX+Ex++55
 KOcs7Ayc0g6d+Rd9D7VGVWIAzknjTgWXfWIdy8joKlYtfgFYGQ==
X-Google-Smtp-Source: ABdhPJzEpKXu8TGfgM/VI73TR/jWAyU9J8L3oQqkHGaBZGTKx9/5KAs+LfwATODqVkMBwoqFWPXrY1I00NV3Vf8Z10E=
X-Received: by 2002:a17:90b:1958:: with SMTP id
 nk24mr8705563pjb.28.1624441399642; 
 Wed, 23 Jun 2021 02:43:19 -0700 (PDT)
MIME-Version: 1.0
From: Ryan Wong <colorfulshark@gmail.com>
Date: Wed, 23 Jun 2021 17:43:08 +0800
Message-ID: <CAMbeZn6ERB7a=XjOkoO1r8SpA-+YFwZBdOk7Q0GjpzofRJbi1g@mail.gmail.com>
Subject: kernel panic with "Unrecoverable FP Unavailable Exception 800 at
 c00000000009e308"
To: linuxppc-dev@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000958cbc05c56bbc50"
X-Mailman-Approved-At: Wed, 23 Jun 2021 21:24:06 +1000
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--000000000000958cbc05c56bbc50
Content-Type: text/plain; charset="UTF-8"

Hi,

Recently I encountered a kernel panic announcing "Unrecoverable FP
Unavailable Exception 800 at c00000000009e308". I have attached the panic
log at the end of the mail.
As I known, this exception occured when the hard floating-point instruction
was executed with FPU disabled, and if the instruction was from kernel
space, kernel would assume it as unrecoverable and panic itself.
*Here is the investigation I have done.*
I checked the MSR firstly, and MSR[PR] = 0 and MSR[FP] = 0, It seems that
the system did match the panic condition.
Because MSR[PR] = 0, the instruction seemed come from kernel, but kernel
would not do floating point calculation normally, so I was quite curious
about the code which triggered the exception. And from the backtrace log,
it should be the "update_min_vruntime" function.
Unfortunately, I didn't see any floating-point operation in that function.
Then I disassembled the vmlinux and found out the disassembly code of that
function, and matched it with the instruction dump:


















*c00000000009e2b8 <.update_min_vruntime>:...c00000000009e2d8:       e9 1f
00 20     ld      r8,32(r31)c00000000009e2dc:       2f a9 00 00     cmpdi
cr7,r9,0c00000000009e2e0:       41 9e 00 68     beq
cr7,c00000000009e348 <.update_min_vruntime+0x90>c00000000009e2e4:       e9
5f 00 30     ld      r10,48(r31)c00000000009e2e8:       e9 29 00 50     ld
     r9,80(r9)c00000000009e2ec:       2f aa 00 00     cmpdi
cr7,r10,0c00000000009e2f0:       41 9e 00 10     beq
cr7,c00000000009e300 <.update_min_vruntime+0x48>c00000000009e2f4:       e9
4a 00 40     ld      r10,64(r10)c00000000009e2f8:       7c e9 50 51
subf.   r7,r9,r10c00000000009e2fc:       41 80 00 24     blt
c00000000009e320 <.update_min_vruntime+0x68>c00000000009e300:       7c e8
48 51     subf.   r7,r8,r9c00000000009e304:       40 81 00 28     ble
c00000000009e32c <.update_min_vruntime+0x74>c00000000009e308:       f9 3f
00 20     std     r9,32(r31)c00000000009e30c:       38 21 00 80     addi
 r1,r1,128c00000000009e310:       e8 01 00 10     ld
 r0,16(r1)c00000000009e314:       eb e1 ff f8     ld      r31,-8(r1)*

And the criminal instruction is
*c00000000009e308:       f9 3f 00 20     std     r9,32(r31)  *

This is nothing to do with floating-point, I could not imagine why it will
trigger the exception.

Do you guys have any idea about this condition, appreciate for your reply.

*Panic log*
...
Linux version 4.1.21 (ryan@ubuntu) (gcc version 5.2.0) #22 SMP PREEMPT Wed
Oct 28 10:04:32 CST 2020
...
<1>Kernel command line: ramdisk_size=0x700000 root=/dev/ram rw init=/init
mem=3840M reserve=256M@3840M console=ttyS0,115200 crashkernel=128M@32M
bportals=s1 qportals=s1
...
<0>linux-kernel-bde (16258): Allocating DMA memory using method dmaalloc=0
<0>linux-kernel-bde (16258): _use_dma_mapping:1 _dma_vbase:c000000060000000
_dma_pbase:60000000 _cpu_pbase:60000000 allocated:2000000 dmaalloc:0
<0>linux-kernel-bde (16247): _interrupt_connect d 0
<0>linux-kernel-bde (16247): connect primary isr
<0>linux-kernel-bde (16247): _interrupt_connect(3514):device# = 0,
irq_flags = 128, irq = 41
<1>device eth0.4092 entered promiscuous mode
<1>Unrecoverable FP Unavailable Exception 800 at c00000000009e308
<0>Oops: Unrecoverable FP Unavailable Exception, sig: 6 [#1]
<0>PREEMPT SMP NR_CPUS=4 CoreNet Generic
<0>Modules linked in: linux_user_bde(PO) linux_kernel_bde(PO) dma2(O)
dma(O) watchdog(O) ttyVS(O) gpiodev(O) lbdev(O) spid(O) block2mtd
mpc85xx_edac edac_core sch_fq_codel uio_seville(O) loop [last unloaded:
linux_kernel_bde]
<1>CPU: 1 PID: 7 Comm: rcu_preempt Tainted: P           O    4.1.21 #22
<1>task: c0000000e11a4680 ti: c0000000e11d8000 task.ti: c0000000e11d8000
<0>NIP: c00000000009e308 LR: c00000000009eda4 CTR: c0000000000a2de8
<0>REGS: c0000000e11db4d0 TRAP: 0800   Tainted: P           O     (4.1.21)
<0>MSR: 0000000080029000 <CE,EE,ME>  CR: 44a44242  XER: 00000000
<0>SOFTE: 0
<0>GPR00: c00000000009eda4 c0000000e11db750 c000000001763800
c0000000efe476a0
<0>GPR04: c0000000e11a4680 c0000000efe4fea0 c0000000efe47fa0
c000000001643800
<0>GPR08: 000006b94a32fd58 000006b949bb61f8 0000000000000000
c0000000e11f0000
<0>GPR12: 0000000044a44244 c00000000fffe6c0 0000000000000000
0000000000000000
<0>GPR16: c0000000016a9fa0 c0000000016aa108 00000000000000fa
0000000000000001
<0>GPR20: c00000000176d578 0000000000000000 0000000000000001
0000000000000000
<0>GPR24: 0000000000000001 c000000000b08a18 0000000000000000
c0000000efe47640
<0>NIP [c00000000009e308] .update_min_vruntime+0x50/0xa4
<0>LR [c00000000009eda4] .update_curr+0x80/0x1ec
<0>Call Trace:
<0>[c0000000e11db750] [c0000000e1004560] 0xc0000000e1004560 (unreliable)
<0>[c0000000e11db7d0] [c00000000009eda4] .update_curr+0x80/0x1ec
<0>[c0000000e11db870] [c0000000000a2e80] .dequeue_task_fair+0x98/0xaf0
<0>[c0000000e11db960] [c00000000009376c] .dequeue_task+0x68/0x88
<0>[c0000000e11db9f0] [c000000000ae8f88] .__schedule+0x2f4/0x7b4
<0>[c0000000e11dbaa0] [c000000000ae9484] .schedule+0x3c/0xa8
<0>[c0000000e11dbb20] [c000000000aecc98] .schedule_timeout+0x150/0x2d0
<0>[c0000000e11dbc00] [c0000000000cdbb0] .rcu_gp_kthread+0x6c4/0xad4
<0>[c0000000e11dbd30] [c000000000088aac] .kthread+0x10c/0x12c
<0>[c0000000e11dbe30] [c0000000000009b0] .ret_from_kernel_thread+0x58/0xa8
<0>Instruction dump:
<0>e91f0020 2fa90000 419e0068 e95f0030 e9290050 2faa0000 419e0010 e94a0040
<0>7ce95051 41800024 7ce84851 40810028 <f93f0020> 38210080 e8010010 ebe1fff8
<1>---[ end trace bc398b62ecbb6901 ]---
<0>
<1>note: rcu_preempt[7] exited with preempt_count 2

Thanks,
Ryan

--000000000000958cbc05c56bbc50
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi,<div><br></div><div>Recently I encount=
ered a kernel panic announcing &quot;Unrecoverable FP Unavailable Exception=
 800 at c00000000009e308&quot;. I have attached the panic log at the end of=
 the mail.</div><div>As I known, this exception occured when the hard float=
ing-point instruction was executed with FPU disabled, and if the instructio=
n was from kernel space, kernel would assume it as unrecoverable and panic =
itself.</div><div><b>Here is the investigation I have done.</b></div><div>I=
 checked the MSR firstly, and MSR[PR] =3D 0 and MSR[FP] =3D 0, It seems tha=
t the system did match the panic condition.</div><div>Because MSR[PR] =3D 0=
, the instruction=C2=A0seemed come from kernel, but kernel would not do flo=
ating point calculation normally, so I was quite curious about the code whi=
ch triggered the exception. And from the backtrace log, it should be the &q=
uot;update_min_vruntime&quot; function.</div><div>Unfortunately, I didn&#39=
;t see any floating-point operation in that function.</div><div>Then I disa=
ssembled the vmlinux and found out the disassembly code of that function, a=
nd matched it with the instruction dump:</div><div><br></div><div><b>c00000=
000009e2b8 &lt;.update_min_vruntime&gt;:<br>...<br>c00000000009e2d8: =C2=A0=
 =C2=A0 =C2=A0 e9 1f 00 20 =C2=A0 =C2=A0 ld =C2=A0 =C2=A0 =C2=A0r8,32(r31)<=
br>c00000000009e2dc: =C2=A0 =C2=A0 =C2=A0 2f a9 00 00 =C2=A0 =C2=A0 cmpdi =
=C2=A0 cr7,r9,0<br>c00000000009e2e0: =C2=A0 =C2=A0 =C2=A0 41 9e 00 68 =C2=
=A0 =C2=A0 beq =C2=A0 =C2=A0 cr7,c00000000009e348 &lt;.update_min_vruntime+=
0x90&gt;<br>c00000000009e2e4: =C2=A0 =C2=A0 =C2=A0 e9 5f 00 30 =C2=A0 =C2=
=A0 ld =C2=A0 =C2=A0 =C2=A0r10,48(r31)<br>c00000000009e2e8: =C2=A0 =C2=A0 =
=C2=A0 e9 29 00 50 =C2=A0 =C2=A0 ld =C2=A0 =C2=A0 =C2=A0r9,80(r9)<br>c00000=
000009e2ec: =C2=A0 =C2=A0 =C2=A0 2f aa 00 00 =C2=A0 =C2=A0 cmpdi =C2=A0 cr7=
,r10,0<br>c00000000009e2f0: =C2=A0 =C2=A0 =C2=A0 41 9e 00 10 =C2=A0 =C2=A0 =
beq =C2=A0 =C2=A0 cr7,c00000000009e300 &lt;.update_min_vruntime+0x48&gt;<br=
>c00000000009e2f4: =C2=A0 =C2=A0 =C2=A0 e9 4a 00 40 =C2=A0 =C2=A0 ld =C2=A0=
 =C2=A0 =C2=A0r10,64(r10)<br>c00000000009e2f8: =C2=A0 =C2=A0 =C2=A0 7c e9 5=
0 51 =C2=A0 =C2=A0 subf. =C2=A0 r7,r9,r10<br>c00000000009e2fc: =C2=A0 =C2=
=A0 =C2=A0 41 80 00 24 =C2=A0 =C2=A0 blt =C2=A0 =C2=A0 c00000000009e320 &lt=
;.update_min_vruntime+0x68&gt;<br>c00000000009e300: =C2=A0 =C2=A0 =C2=A0 7c=
 e8 48 51 =C2=A0 =C2=A0 subf. =C2=A0 r7,r8,r9<br>c00000000009e304: =C2=A0 =
=C2=A0 =C2=A0 40 81 00 28 =C2=A0 =C2=A0 ble =C2=A0 =C2=A0 c00000000009e32c =
&lt;.update_min_vruntime+0x74&gt;<br>c00000000009e308: =C2=A0 =C2=A0 =C2=A0=
 f9 3f 00 20 =C2=A0 =C2=A0 std =C2=A0 =C2=A0 r9,32(r31)<br>c00000000009e30c=
: =C2=A0 =C2=A0 =C2=A0 38 21 00 80 =C2=A0 =C2=A0 addi =C2=A0 =C2=A0r1,r1,12=
8<br>c00000000009e310: =C2=A0 =C2=A0 =C2=A0 e8 01 00 10 =C2=A0 =C2=A0 ld =
=C2=A0 =C2=A0 =C2=A0r0,16(r1)<br>c00000000009e314: =C2=A0 =C2=A0 =C2=A0 eb =
e1 ff f8 =C2=A0 =C2=A0 ld =C2=A0 =C2=A0 =C2=A0r31,-8(r1)</b><br></div><div>=
<br></div><div>And the criminal instruction is</div><div><b>c00000000009e30=
8: =C2=A0 =C2=A0 =C2=A0 f9 3f 00 20 =C2=A0 =C2=A0 std =C2=A0 =C2=A0 r9,32(r=
31)=C2=A0=C2=A0</b><br></div><div><br></div><div>This is nothing to do with=
 floating-point, I could not imagine why it will trigger the exception.</di=
v><div><br></div><div>Do you guys have any idea about this condition, appre=
ciate for your reply.</div><div><br></div><div><b>Panic log</b></div><div>.=
..</div><div>Linux version 4.1.21 (ryan@ubuntu) (gcc version 5.2.0) #22 SMP=
 PREEMPT Wed Oct 28 10:04:32 CST 2020<br></div><div>...</div><div>&lt;1&gt;=
Kernel command line: ramdisk_size=3D0x700000 root=3D/dev/ram rw init=3D/ini=
t mem=3D3840M reserve=3D256M@3840M console=3DttyS0,115200 crashkernel=3D128=
M@32M bportals=3Ds1 qportals=3Ds1<br></div><div>...</div><div>&lt;0&gt;linu=
x-kernel-bde (16258): Allocating DMA memory using method dmaalloc=3D0<br>&l=
t;0&gt;linux-kernel-bde (16258): _use_dma_mapping:1 _dma_vbase:c00000006000=
0000 _dma_pbase:60000000 _cpu_pbase:60000000 allocated:2000000 dmaalloc:0<b=
r>&lt;0&gt;linux-kernel-bde (16247): _interrupt_connect d 0<br>&lt;0&gt;lin=
ux-kernel-bde (16247): connect primary isr<br>&lt;0&gt;linux-kernel-bde (16=
247): _interrupt_connect(3514):device# =3D 0, irq_flags =3D 128, irq =3D 41=
<br>&lt;1&gt;device eth0.4092 entered promiscuous mode<br>&lt;1&gt;Unrecove=
rable FP Unavailable Exception 800 at c00000000009e308<br>&lt;0&gt;Oops: Un=
recoverable FP Unavailable Exception, sig: 6 [#1]<br>&lt;0&gt;PREEMPT SMP N=
R_CPUS=3D4 CoreNet Generic<br>&lt;0&gt;Modules linked in: linux_user_bde(PO=
) linux_kernel_bde(PO) dma2(O) dma(O) watchdog(O) ttyVS(O) gpiodev(O) lbdev=
(O) spid(O) block2mtd mpc85xx_edac edac_core sch_fq_codel uio_seville(O) lo=
op [last unloaded: linux_kernel_bde]<br>&lt;1&gt;CPU: 1 PID: 7 Comm: rcu_pr=
eempt Tainted: P =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 O =C2=A0 =C2=A04.1.21 #=
22<br>&lt;1&gt;task: c0000000e11a4680 ti: c0000000e11d8000 task.ti: c000000=
0e11d8000<br>&lt;0&gt;NIP: c00000000009e308 LR: c00000000009eda4 CTR: c0000=
000000a2de8<br>&lt;0&gt;REGS: c0000000e11db4d0 TRAP: 0800 =C2=A0 Tainted: P=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 O =C2=A0 =C2=A0 (4.1.21)<br>&lt;0&gt;MS=
R: 0000000080029000 &lt;CE,EE,ME&gt; =C2=A0CR: 44a44242 =C2=A0XER: 00000000=
<br>&lt;0&gt;SOFTE: 0<br>&lt;0&gt;GPR00: c00000000009eda4 c0000000e11db750 =
c000000001763800 c0000000efe476a0<br>&lt;0&gt;GPR04: c0000000e11a4680 c0000=
000efe4fea0 c0000000efe47fa0 c000000001643800<br>&lt;0&gt;GPR08: 000006b94a=
32fd58 000006b949bb61f8 0000000000000000 c0000000e11f0000<br>&lt;0&gt;GPR12=
: 0000000044a44244 c00000000fffe6c0 0000000000000000 0000000000000000<br>&l=
t;0&gt;GPR16: c0000000016a9fa0 c0000000016aa108 00000000000000fa 0000000000=
000001<br>&lt;0&gt;GPR20: c00000000176d578 0000000000000000 000000000000000=
1 0000000000000000<br>&lt;0&gt;GPR24: 0000000000000001 c000000000b08a18 000=
0000000000000 c0000000efe47640<br>&lt;0&gt;NIP [c00000000009e308] .update_m=
in_vruntime+0x50/0xa4<br>&lt;0&gt;LR [c00000000009eda4] .update_curr+0x80/0=
x1ec<br>&lt;0&gt;Call Trace:<br>&lt;0&gt;[c0000000e11db750] [c0000000e10045=
60] 0xc0000000e1004560 (unreliable)<br>&lt;0&gt;[c0000000e11db7d0] [c000000=
00009eda4] .update_curr+0x80/0x1ec<br>&lt;0&gt;[c0000000e11db870] [c0000000=
000a2e80] .dequeue_task_fair+0x98/0xaf0<br>&lt;0&gt;[c0000000e11db960] [c00=
000000009376c] .dequeue_task+0x68/0x88<br>&lt;0&gt;[c0000000e11db9f0] [c000=
000000ae8f88] .__schedule+0x2f4/0x7b4<br>&lt;0&gt;[c0000000e11dbaa0] [c0000=
00000ae9484] .schedule+0x3c/0xa8<br>&lt;0&gt;[c0000000e11dbb20] [c000000000=
aecc98] .schedule_timeout+0x150/0x2d0<br>&lt;0&gt;[c0000000e11dbc00] [c0000=
000000cdbb0] .rcu_gp_kthread+0x6c4/0xad4<br>&lt;0&gt;[c0000000e11dbd30] [c0=
00000000088aac] .kthread+0x10c/0x12c<br>&lt;0&gt;[c0000000e11dbe30] [c00000=
00000009b0] .ret_from_kernel_thread+0x58/0xa8<br>&lt;0&gt;Instruction dump:=
<br>&lt;0&gt;e91f0020 2fa90000 419e0068 e95f0030 e9290050 2faa0000 419e0010=
 e94a0040<br>&lt;0&gt;7ce95051 41800024 7ce84851 40810028 &lt;f93f0020&gt; =
38210080 e8010010 ebe1fff8<br>&lt;1&gt;---[ end trace bc398b62ecbb6901 ]---=
<br>&lt;0&gt;<br>&lt;1&gt;note: rcu_preempt[7] exited with preempt_count 2<=
br></div><div><br></div><div>Thanks,</div><div>Ryan</div></div></div>

--000000000000958cbc05c56bbc50--
