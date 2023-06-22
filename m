Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C851973A10D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 14:37:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=l4o9EtEw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qn0J25KZJz30Nv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 22:37:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=l4o9EtEw;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qn0H74DNlz2yNy
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jun 2023 22:36:35 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Qn0H72pR1z4x04;
	Thu, 22 Jun 2023 22:36:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1687437395;
	bh=PhA5+kop2iXZ6Mkow9yrkX73kH99Wncs+I7Pmewke+g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=l4o9EtEwCOKVVZ6TXRfOFGvPTfRkoPA3wyY41e9A8DYR0rGuUPr2d6wtexrZmHgXj
	 xe98s/eMyThWo5gqr/ULMeair58Yw2eJKTGNtwGSOR6Ty/7hi8ZbIZtoNtShzsCzaY
	 naWwgvS+U2l4a7Dt+Gc6VqgqN5TRWQql23qVDvCRmPAD+UcbEoouGfPYlTaXOrWVPf
	 Cpa6caUI11a1bfzqi4vQUhpdZ0q6/jmtwebo7Xwj0kyTZ2MsyuuDCcQFLFvyX00xWh
	 SD+0fyo1bROZcNgGS1HOarqHJ73qiMmDunOXi82ukPrcGg6tmCFkaC2rhm7lL2EPYD
	 RtW29leyBGX6A==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linux regressions mailing list <regressions@lists.linux.dev>, Sachin
 Sant <sachinp@linux.ibm.com>
Subject: Re: [6.4-rc6] Crash during a kexec operation
 (tpm_amd_is_rng_defective)
In-Reply-To: <675a8893-429d-05be-b647-089b249c814c@leemhuis.info>
References: <99B81401-DB46-49B9-B321-CF832B50CAC3@linux.ibm.com>
 <87o7lhfmoh.fsf@mail.lhotse>
 <CA0088E4-2851-4AFF-94F8-2A07C5CDA8D8@linux.ibm.com>
 <675a8893-429d-05be-b647-089b249c814c@leemhuis.info>
Date: Thu, 22 Jun 2023 22:36:34 +1000
Message-ID: <87o7l7oer1.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: linux-integrity@vger.kernel.org, jarkko@kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, open list <linux-kernel@vger.kernel.org>, mario.limonciello@amd.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>=
 writes:
> Hi, Thorsten here, the Linux kernel's regression tracker. Top-posting
> for once, to make this easily accessible to everyone.
>
> As Linus will likely release 6.4 on this or the following Sunday a quick
> question: is there any hope this regression might be fixed any time
> soon?

No.

I have added the author of the commit to Cc, maybe they can help?

The immediate question is, is it expected for chip->ops to be NULL in
this path? Obviously on actual AMD systems that isn't the case,
otherwise the code would crash there. But is the fact that chip->ops is
NULL a bug in the ibmvtpm driver, or a possibility that has been
overlooked by the checking code.

cheers

> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> --
> Everything you wanna know about Linux kernel regression tracking:
> https://linux-regtracking.leemhuis.info/about/#tldr
> If I did something stupid, please tell me, as explained on that page.
>
> #regzbot poke
>
> On 15.06.23 06:57, Sachin Sant wrote:
>>=20
>>>> [ 34.381788] Code: 5463063e 408201c8 38210080 4e800020 60000000 600000=
00 60000000 7c0802a6 fbe10078 7c7f1b78 f8010090 e9230728 <e9890050> 2c2c000=
0 41820020 7d8903a6=20
>>>
>>>  2c:   28 07 23 e9     ld      r9,1832(r3)
>>>  30:   50 00 89 e9     ld      r12,80(r9)
>>>
>>> Where r3 is *chip.
>>> r9 is NULL, and 80 =3D 0x50.
>>>
>>> Looks like a NULL chip->ops, which oopses in:
>>>
>>> static int tpm_request_locality(struct tpm_chip *chip)
>>> {
>>> int rc;
>>>
>>> if (!chip->ops->request_locality)
>>>
>>>
>>> Can you test the patch below?
>>>
>>=20
>> It proceeds further but then run into following crash
>>=20
>> [  103.269574] Kernel attempted to read user page (18) - exploit attempt=
? (uid: 0)
>> [  103.269589] BUG: Kernel NULL pointer dereference on read at 0x00000018
>> [  103.269595] Faulting instruction address: 0xc0000000009dcf34
>> [  103.269599] Oops: Kernel access of bad area, sig: 11 [#1]
>> [  103.269602] LE PAGE_SIZE=3D64K MMU=3DRadix SMP NR_CPUS=3D2048 NUMA pS=
eries
>> [  103.269606] Modules linked in: dm_mod(E) nft_fib_inet(E) nft_fib_ipv4=
(E) nft_fib_ipv6(E) nft_fib(E) nft_reject_inet(E) nf_reject_ipv4(E) nf_reje=
ct_ipv6(E) nft_reject(E) nft_ct(E) nft_chain_nat(E) nf_nat(E) nf_conntrack(=
E) nf_defrag_ipv6(E) nf_defrag_ipv4(E) bonding(E) tls(E) rfkill(E) ip_set(E=
) sunrpc(E) nf_tables(E) nfnetlink(E) pseries_rng(E) aes_gcm_p10_crypto(E) =
drm(E) drm_panel_orientation_quirks(E) xfs(E) libcrc32c(E) sd_mod(E) sr_mod=
(E) t10_pi(E) crc64_rocksoft_generic(E) cdrom(E) crc64_rocksoft(E) crc64(E)=
 sg(E) ibmvscsi(E) scsi_transport_srp(E) ibmveth(E) vmx_crypto(E) fuse(E)
>> [  103.269644] CPU: 18 PID: 6872 Comm: kexec Kdump: loaded Tainted: G   =
         E      6.4.0-rc6-dirty #8
>> [  103.269649] Hardware name: IBM,9080-HEX POWER10 (raw) 0x800200 0xf000=
006 of:IBM,FW1030.20 (NH1030_058) hv:phyp pSeries
>> [  103.269653] NIP:  c0000000009dcf34 LR: c0000000009dd2bc CTR: c0000000=
009eaa60
>> [  103.269656] REGS: c0000000a113f510 TRAP: 0300   Tainted: G           =
 E       (6.4.0-rc6-dirty)
>> [  103.269660] MSR:  800000000280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE> =
 CR: 88484886  XER: 00000001
>> [  103.269669] CFAR: c0000000009dd2b8 DAR: 0000000000000018 DSISR: 40000=
000 IRQMASK: 0  [  103.269669] GPR00: c0000000009dd2bc c0000000a113f7b0 c00=
00000014a1500 c000000090310000  [  103.269669] GPR04: c00000009f770000 0000=
000000000016 0000060000007a01 0000000000000016  [  103.269669] GPR08: c0000=
0009f770000 0000000000000000 0000000000000000 0000000000008000  [  103.2696=
69] GPR12: c0000000009eaa60 c00000135fab7f00 0000000000000000 0000000000000=
000  [  103.269669] GPR16: 0000000000000000 0000000000000000 00000000000000=
00 0000000000000000  [  103.269669] GPR20: 0000000000000000 000000000000000=
0 0000000000000000 0000000000000000  [  103.269669] GPR24: 0000000000000000=
 0000000000000016 c000000090310000 0000000000001000  [  103.269669] GPR28: =
c00000009f770000 000000007a010000 c00000009f770000 c000000090310000  [  103=
.269707] NIP [c0000000009dcf34] tpm_try_transmit+0x74/0x300
>> [  103.269713] LR [c0000000009dd2bc] tpm_transmit+0xfc/0x190
>> [  103.269717] Call Trace:
>> [  103.269718] [c0000000a113f7b0] [c0000000a113f880] 0xc0000000a113f880 =
(unreliable)
>> [  103.269724] [c0000000a113f840] [c0000000009dd2bc] tpm_transmit+0xfc/0=
x190
>> [  103.269727] [c0000000a113f900] [c0000000009dd398] tpm_transmit_cmd+0x=
48/0x110
>> [  103.269731] [c0000000a113f980] [c0000000009df1b0] tpm2_get_tpm_pt+0x1=
40/0x230
>> [  103.269736] [c0000000a113fa20] [c0000000009db208] tpm_amd_is_rng_defe=
ctive+0xb8/0x250
>> [  103.269739] [c0000000a113faa0] [c0000000009db828] tpm_chip_unregister=
+0x138/0x160
>> [  103.269743] [c0000000a113fae0] [c0000000009eaa94] tpm_ibmvtpm_remove+=
0x34/0x130
>> [  103.269748] [c0000000a113fb50] [c000000000115738] vio_bus_remove+0x58=
/0xd0
>> [  103.269754] [c0000000a113fb90] [c000000000a01dcc] device_shutdown+0x2=
1c/0x39c
>> [  103.269758] [c0000000a113fc20] [c0000000001a2684] kernel_restart_prep=
are+0x54/0x70
>> [  103.269762] [c0000000a113fc40] [c000000000292c48] kernel_kexec+0xa8/0=
x100
>> [  103.269766] [c0000000a113fcb0] [c0000000001a2cd4] __do_sys_reboot+0x2=
14/0x2c0
>> [  103.269770] [c0000000a113fe10] [c000000000034adc] system_call_excepti=
on+0x13c/0x340
>> [  103.269776] [c0000000a113fe50] [c00000000000d05c] system_call_vectore=
d_common+0x15c/0x2ec
>> [  103.269781] --- interrupt: 3000 at 0x7fff805459f0
>> [  103.269784] NIP:  00007fff805459f0 LR: 0000000000000000 CTR: 00000000=
00000000
>> [  103.269786] REGS: c0000000a113fe80 TRAP: 3000   Tainted: G           =
 E       (6.4.0-rc6-dirty)
>> [  103.269790] MSR:  800000000280f033 <SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,L=
E>  CR: 42422884  XER: 00000000
>> [  103.269799] IRQMASK: 0  [  103.269799] GPR00: 0000000000000058 00007f=
ffc07a68c0 0000000110437f00 fffffffffee1dead  [  103.269799] GPR04: 0000000=
028121969 0000000045584543 0000000000000000 0000000000000003  [  103.269799=
] GPR08: 0000000000100000 0000000000000000 0000000000000000 000000000000000=
0  [  103.269799] GPR12: 0000000000000000 00007fff8089b2c0 000000011042f598=
 0000000000000000  [  103.269799] GPR16: ffffffffffffffff 0000000000000000 =
000000011040fcc0 0000000000000000  [  103.269799] GPR20: 0000000000008913 0=
000000000008914 0000000149c61020 0000000000000003  [  103.269799] GPR24: 00=
00000000000000 0000000000000001 0000000000000003 00007fffc07a6a40  [  103.2=
69799] GPR28: 0000000110409f10 00007fff806419c0 0000000149c61080 0000000149=
c61040  [  103.269833] NIP [00007fff805459f0] 0x7fff805459f0
>> [  103.269836] LR [0000000000000000] 0x0
>> [  103.269838] --- interrupt: 3000
>> [  103.269839] Code: 83a40006 2c090000 41820208 7c0802a6 79250020 7c25d8=
40 f80100a0 41810224 fbe10088 f8410018 7c7f1b78 e9230728 <e9890018> 7d8903a=
6 4e800421 e8410018  [  103.269852] ---[ end trace 0000000000000000 ]=E2=80=
=94
>>=20
>> - Sachin
