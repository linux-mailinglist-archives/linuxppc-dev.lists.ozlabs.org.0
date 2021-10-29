Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D509C43FC60
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Oct 2021 14:33:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HghgK62VFz2ypT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Oct 2021 23:33:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=zedat.fu-berlin.de (client-ip=130.133.4.66;
 helo=outpost1.zedat.fu-berlin.de; envelope-from=glaubitz@zedat.fu-berlin.de;
 receiver=<UNKNOWN>)
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de
 [130.133.4.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hghfq5Qk1z2yHX
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Oct 2021 23:33:22 +1100 (AEDT)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
 by outpost.zedat.fu-berlin.de (Exim 4.94) with esmtps (TLS1.2)
 tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (envelope-from <glaubitz@zedat.fu-berlin.de>)
 id 1mgR4L-002StF-4G; Fri, 29 Oct 2021 14:33:13 +0200
Received: from p57bd9736.dip0.t-ipconnect.de ([87.189.151.54]
 helo=[192.168.178.81]) by inpost2.zedat.fu-berlin.de (Exim 4.94)
 with esmtpsa (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
 (envelope-from <glaubitz@physik.fu-berlin.de>)
 id 1mgR4K-0038ad-Qd; Fri, 29 Oct 2021 14:33:13 +0200
Message-ID: <1d02b53d-cb39-38bb-8ce2-9a92cc97e729@physik.fu-berlin.de>
Date: Fri, 29 Oct 2021 14:33:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: Linux kernel: powerpc: KVM guest can trigger host crash on Power8
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>
References: <87pmrtbbdt.fsf@mpe.ellerman.id.au>
 <05b88724-90b6-a38a-bb3b-7392f85c1934@physik.fu-berlin.de>
 <878ryfavaz.fsf@mpe.ellerman.id.au>
 <04864fe5-fdd0-74b2-2bad-0303e4c2b15a@physik.fu-berlin.de>
 <874k92bubv.fsf@mpe.ellerman.id.au>
 <c21c7a0e-95f1-e6d2-a04c-fb99d801e8da@physik.fu-berlin.de>
 <878rydac0d.fsf@mpe.ellerman.id.au>
 <87b1404f-7805-da29-4899-6ab9459e5364@physik.fu-berlin.de>
 <9ed788c0-b99b-f327-0814-a2d92db6bd8b@physik.fu-berlin.de>
 <1635467831.en5s268a3l.astroid@bobo.none>
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
In-Reply-To: <1635467831.en5s268a3l.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.189.151.54
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
Cc: "debian-powerpc@lists.debian.org" <debian-powerpc@lists.debian.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Nicholas!

On 10/29/21 02:41, Nicholas Piggin wrote:
> Soft lockup should mean it's taking timer interrupts still, just not=20
> scheduling. Do you have the hard lockup detector enabled as well? Is
> there anything stuck spinning on another CPU?

I haven't enabled it. But looking at the documentation [1] it seems we co=
uld
use it to print a backtrace once the lockup occurs.

> Do you have the full dmesg / kernel log for this boot?

I do, uploaded the messages file here: https://people.debian.org/~glaubit=
z/messages-kvm-lockup.gz

Also, I noticed there is actually a backtrace:

Oct 25 17:02:31 watson kernel: [14104.902061]   (detected by 80, t=3D5252=
 jiffies, g=3D49897, q=3D37)
Oct 25 17:02:31 watson kernel: [14104.902072] Sending NMI from CPU 80 to =
CPUs 136:
Oct 25 17:02:31 watson kernel: [14108.253972] Modules linked in: dm_mod(E=
) vhost_net(E) vhost(E) vhost_iotlb(E) tap(E) tun(E) kvm_hv(E) kvm_pr(E) =
kvm(E) xt_CHECKSUM(E) xt_MASQUERADE(E) xt_conntrack(E) ipt_REJECT(E) nf_r=
eject_ipv4(E) xt_tcpudp(E) nft_compat(E) nft_chain_nat(E) nf_nat(E) nf_co=
nntrack(E) nf_defrag_ipv6(E) nf_defrag_ipv4(E) nft_counter(E) nf_tables(E=
) nfnetlink(E) bridge(E) stp(E) llc(E) xfs(E) ecb(E) xts(E) sg(E) ctr(E) =
vmx_crypto(E) gf128mul(E) ipmi_powernv(E) powernv_rng(E) ipmi_devintf(E) =
rng_core(E) ipmi_msghandler(E) powernv_op_panel(E) ib_iser(E) rdma_cm(E) =
iw_cm(E) ib_cm(E) ib_core(E) iscsi_tcp(E) libiscsi_tcp(E) sunrpc(E) libis=
csi(E) drm(E) scsi_transport_iscsi(E) fuse(E) drm_panel_orientation_quirk=
s(E) configfs(E) ip_tables(E) x_tables(E) autofs4(E) ext4(E) crc16(E) mbc=
ache(E) jbd2(E) sr_mod(E) sd_mod(E) ses(E) cdrom(E) enclosure(E) t10_pi(E=
) crc_t10dif(E) scsi_transport_sas(E) crct10dif_generic(E) crct10dif_comm=
on(E) btrfs(E) blake2b_generic(E) zstd_compress(E) raid10(E) raid456(E)
Oct 25 17:02:31 watson kernel: [14108.254101]  async_raid6_recov(E) async=
_memcpy(E) async_pq(E) async_xor(E) async_tx(E) xor(E) raid6_pq(E) libcrc=
32c(E) crc32c_generic(E) raid1(E) raid0(E) multipath(E) linear(E) md_mod(=
E) xhci_pci(E) xhci_hcd(E) e1000e(E) usbcore(E) ptp(E) pps_core(E) ipr(E)=
 usb_common(E)
Oct 25 17:02:31 watson kernel: [14108.254139] CPU: 104 PID: 175 Comm: mig=
ration/104 Tainted: G            E     5.14.0-0.bpo.2-powerpc64le #1  Deb=
ian 5.14.9-2~bpo11+2
Oct 25 17:02:31 watson kernel: [14108.254146] Stopper: multi_cpu_stop+0x0=
/0x240 <- migrate_swap+0xf8/0x240
Oct 25 17:02:31 watson kernel: [14108.254160] NIP:  c0000000001f6a58 LR: =
c00000000026b734 CTR: c00000000026b5c0
Oct 25 17:02:31 watson kernel: [14108.254163] REGS: c000001001237970 TRAP=
: 0900   Tainted: G            E      (5.14.0-0.bpo.2-powerpc64le Debian =
5.14.9-2~bpo11+2)
Oct 25 17:02:31 watson kernel: [14108.254168] MSR:  9000000000009033 <SF,=
HV,EE,ME,IR,DR,RI,LE>  CR: 28002442  XER: 20000000
Oct 25 17:02:31 watson kernel: [14108.254183] CFAR: c00000000026b730 IRQM=
ASK: 0=20
Oct 25 17:02:31 watson kernel: [14108.254183] GPR00: c00000000026b32c c00=
0001001237c10 c00000000166ce00 c000000000d02c30=20
Oct 25 17:02:31 watson kernel: [14108.254183] GPR04: c000001806433198 c00=
0001806433198 0000000000000000 000000005687ca06=20
Oct 25 17:02:31 watson kernel: [14108.254183] GPR08: c0000017fc8948a0 c00=
00017fc894780 0000000000000004 c00800000a80e378=20
Oct 25 17:02:31 watson kernel: [14108.254183] GPR12: 0000000000000000 c00=
00017ffff5a00 c000000000173ec8 c00000000194c080=20
Oct 25 17:02:31 watson kernel: [14108.254183] GPR16: 0000000000000000 000=
0000000000000 0000000000000000 0000000000000000=20
Oct 25 17:02:31 watson kernel: [14108.254183] GPR20: 0000000000000000 c00=
0001806433170 0000000000000000 0000000000000001=20
Oct 25 17:02:31 watson kernel: [14108.254183] GPR24: 0000000000000002 000=
0000000000003 0000000000000000 c000000000d02c30=20
Oct 25 17:02:31 watson kernel: [14108.254183] GPR28: 0000000000000001 c00=
0001806433170 c000001806433194 0000000000000001=20
Oct 25 17:02:31 watson kernel: [14108.254240] NIP [c0000000001f6a58] rcu_=
momentary_dyntick_idle+0x48/0x60
Oct 25 17:02:31 watson kernel: [14108.254245] LR [c00000000026b734] multi=
_cpu_stop+0x174/0x240
Oct 25 17:02:31 watson kernel: [14108.254251] Call Trace:
Oct 25 17:02:31 watson kernel: [14108.254253] [c000001001237c10] [c000001=
001237c80] 0xc000001001237c80 (unreliable)
Oct 25 17:02:31 watson kernel: [14108.254260] [c000001001237c80] [c000000=
00026b32c] cpu_stopper_thread+0x16c/0x280
Oct 25 17:02:31 watson kernel: [14108.254267] [c000001001237d40] [c000000=
00017ad4c] smpboot_thread_fn+0x1ec/0x260
Oct 25 17:02:31 watson kernel: [14108.254273] [c000001001237da0] [c000000=
00017403c] kthread+0x17c/0x190
Oct 25 17:02:31 watson kernel: [14108.254280] [c000001001237e10] [c000000=
00000cf64] ret_from_kernel_thread+0x5c/0x64
Oct 25 17:02:31 watson kernel: [14108.254287] Instruction dump:
Oct 25 17:02:31 watson kernel: [14108.254289] 394a7aa4 39297980 7cc751ae =
e94d0030 7d295214 39090120 7c0004ac 39400004=20
Oct 25 17:02:31 watson kernel: [14108.254301] 7ce04028 7cea3a14 7ce0412d =
40c2fff4 <7c0004ac> 70e90002 4c820020 0fe00000=20
Oct 25 17:02:31 watson kernel: [14110.585275] CPU 136 didn't respond to b=
acktrace IPI, inspecting paca.
Oct 25 17:02:31 watson kernel: [14110.585279] irq_soft_mask: 0x03 in_mce:=
 0 in_nmi: 0 current: 1813 (CPU 12/KVM)
Oct 25 17:02:31 watson kernel: [14110.585284] Back trace of paca->saved_r=
1 (0xc00000180640f4c0) (possibly stale):
Oct 25 17:02:31 watson kernel: [14110.585286] Call Trace:
Oct 25 17:02:31 watson kernel: [14110.585378] task:rcu_sched       state:=
R  running task     stack:    0 pid:   13 ppid:     2 flags:0x00000800
Oct 25 17:02:31 watson kernel: [14110.585386] Call Trace:
Oct 25 17:02:31 watson kernel: [14110.585388] [c00000000e0978d0] [c000000=
0001f71c0] rcu_implicit_dynticks_qs+0x0/0x370 (unreliable)
Oct 25 17:02:31 watson kernel: [14110.585399] [c00000000e097ac0] [c000000=
00001b264] __switch_to+0x1d4/0x2e0
Oct 25 17:02:31 watson kernel: [14110.585407] [c00000000e097b30] [c000000=
000cb9838] __schedule+0x2f8/0xbb0
Oct 25 17:02:31 watson kernel: [14110.585416] [c00000000e097c00] [c000000=
000cba334] __cond_resched+0x64/0x90
Oct 25 17:02:31 watson kernel: [14110.585424] [c00000000e097c30] [c000000=
0001f8670] force_qs_rnp+0xe0/0x2e0
Oct 25 17:02:31 watson kernel: [14110.585433] [c00000000e097cd0] [c000000=
0001fc8a8] rcu_gp_kthread+0x9c8/0xc90
Oct 25 17:02:31 watson kernel: [14110.585442] [c00000000e097da0] [c000000=
00017403c] kthread+0x17c/0x190
Oct 25 17:02:31 watson kernel: [14110.585450] [c00000000e097e10] [c000000=
00000cf64] ret_from_kernel_thread+0x5c/0x64
Oct 25 17:02:31 watson kernel: [14110.585462] Sending NMI from CPU 80 to =
CPUs 32:
Oct 25 17:02:31 watson kernel: [14110.585469] NMI backtrace for cpu 32
Oct 25 17:02:31 watson kernel: [14110.585473] CPU: 32 PID: 1289 Comm: in:=
imklog Tainted: G            EL    5.14.0-0.bpo.2-powerpc64le #1  Debian =
5.14.9-2~bpo11+2
Oct 25 17:02:31 watson kernel: [14110.585477] NIP:  00007fff92bc3bbc LR: =
00007fff92bc5e90 CTR: 00007fff92bc5bf0
Oct 25 17:02:31 watson kernel: [14110.585480] REGS: c00000001c9bfe80 TRAP=
: 0500   Tainted: G            EL     (5.14.0-0.bpo.2-powerpc64le Debian =
5.14.9-2~bpo11+2)
Oct 25 17:02:31 watson kernel: [14110.585483] MSR:  900000000280f033 <SF,=
HV,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 48004802  XER: 00000000
Oct 25 17:02:31 watson kernel: [14110.585496] CFAR: 00007fff92bc3c34 IRQM=
ASK: 0=20
Oct 25 17:02:31 watson kernel: [14110.585496] GPR00: 0000000000000000 000=
07fff9220d940 00007fff92d37100 000000000000000c=20
Oct 25 17:02:31 watson kernel: [14110.585496] GPR04: 00007fff9222f928 000=
07fff84000060 00007fff84097800 00007fff84000900=20
Oct 25 17:02:31 watson kernel: [14110.585496] GPR08: 00007fff840008d0 000=
07fff84000050 00007fff8408f3a0 0000000000000007=20
Oct 25 17:02:31 watson kernel: [14110.585496] GPR12: 0000000028004802 000=
07fff92236810 00007fff84097af0 0000000000000000=20
Oct 25 17:02:31 watson kernel: [14110.585496] GPR16: 00007fff93040000 000=
07fff92f54478 0000000000000000 00007fff9222f160=20
Oct 25 17:02:31 watson kernel: [14110.585496] GPR20: 00007fff9222f810 000=
07fff9220e4f0 0000000000000008 00007fff927156b0=20
Oct 25 17:02:31 watson kernel: [14110.585496] GPR24: 00007fff92715638 000=
07fff927304f8 0000000000001fa0 0000000000000000=20
Oct 25 17:02:31 watson kernel: [14110.585496] GPR28: 00007fff9220e529 000=
000000000006f 00007fff84000020 0000000000000030=20
Oct 25 17:02:31 watson kernel: [14110.585530] NIP [00007fff92bc3bbc] 0x7f=
ff92bc3bbc
Oct 25 17:02:31 watson kernel: [14110.585534] LR [00007fff92bc5e90] 0x7ff=
f92bc5e90

> Could you try a sysrq+w to get a trace of blocked tasks?

Not sure how to send a magic sysrequest over the IPMI serial console. Any=
 idea?

> Are you able to shut down the guests and exit qemu normally?

Not after the crash. I have to hard-reboot the whole machine.

Adrian

> [1] https://www.kernel.org/doc/html/latest/admin-guide/lockup-watchdogs=
=2Ehtml

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

