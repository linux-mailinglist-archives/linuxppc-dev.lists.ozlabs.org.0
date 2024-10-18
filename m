Return-Path: <linuxppc-dev+bounces-2370-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4507D9A3D7F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Oct 2024 13:49:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XVNK56Pqkz3bnB;
	Fri, 18 Oct 2024 22:49:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::52a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729246950;
	cv=none; b=LJsL6YOIDHLl/+CMnftmVKkLn1WdBWduZvGcxS4sGidfEmoNC3xc9jKYlXcwLALl8l2xP1spVes29w6yJZaRh5heq08LXwJ+WLTe4RiyJZvbycclE4dxOk36unGlIfVamG3fhhGNJHYHmDAKOAyX7n01pwW74dl3YEJzAFcajBgqRS1/TMbtsQuNoVLGjrW48E6UNB18lWUDIYeoBR87ySyvIg6arG2FxHBFCS1mjFsrc6+8lHAclqUhvgBjwMlLoaLgNew4NP+ewpy33nb99U0jMOuuOKpqNRDU7N1CSt0h/MGPoLOXd0TYlgsfpmE2aiA6Bk7zNKf7xr2vTV6MNw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729246950; c=relaxed/relaxed;
	bh=do5wdsbij7Oys+zwiDI1d2qY6LQSe9z9sPPQ1NxbeNI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=B+Sok7o1e3nhuuDdGC9W7iMW43z8LYHjFzXBWlwUj1yGVAujJgHMvsqRsoBHsI+84ychqEJXjNhuzao2UGmCSjH0JNuz1PDC7k99hue6XjGlWtzUT/M4msloA4M9YYl8lrBUdAoUCfCsMKHS4nOFCOybTS/FkK2qKDiYjuCQ9SzGyQ62A7Z24Q68U0ftE3l7E9aNHdgTC3Q01ls9jfPR4azArmAKQX+fW9hxu2oHRE/hFxxKStKYCN9MAD20+tpVrcIj1UPxSP5/nU/HLh57N6xBzLFCbYgZK8z03a79BehCm5/VIVSzOC79Kl5v3P00prlY0YWxnfrlrISrWFW9mw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gf+iGPr8; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com; envelope-from=matorola@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gf+iGPr8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com; envelope-from=matorola@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XVLP03FpWz3blG
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Oct 2024 21:22:26 +1100 (AEDT)
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-7db54269325so1549017a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Oct 2024 03:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729246944; x=1729851744; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=do5wdsbij7Oys+zwiDI1d2qY6LQSe9z9sPPQ1NxbeNI=;
        b=gf+iGPr8RJ4PNzhYRTO5RnKQMzdPyUUI6JJxfq8kGb01aifs1uEjhMmVFXyaEf3wxT
         ewu2OAYR4TMza9iiJZCAD/+ZQwa2qo78PgFLI0NZi0HRdL6z2l6iRMriqbkVqvbQPRjH
         lpRH5JNu29RPbdghGkd3B9ziNJ5cbibT3zKocA7Lq8NfIhOcRDGk0WGNrq+Jr+y0zPrv
         fVaP6iPgdv0P/dOJmtUAncCcwHqlMhVxt4sq8IVoDwa/17mra3gTasSp60wUbX+6xj9M
         UhHUvmrDI8HmIA/Srffg6cX+0fZuaT1ZHLU68bw76HFDK+Z0A+9ogcKXD8vSAkKSPnd1
         Ou8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729246944; x=1729851744;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=do5wdsbij7Oys+zwiDI1d2qY6LQSe9z9sPPQ1NxbeNI=;
        b=IV/5ex5KhMmK90Gi7/3mJz3glIV3ErrRI/jGu1aTGOpRO/VXdI6R3e/rIvuK3UmdIP
         L9cIyzVYYA75oRbHc6OB1kYlFDZOJTLBeVMv/vEjKmyyokWC4stsmhJ0m3xfxYNedm+K
         LS10DWpQ+ZvIMJ9vPexAG1azAEWz4V3ggP6xHRWVN5roWo7eUdLJBfYsy1toaE2HMvR0
         mK6N64+mGKiyjzCvwtOKzYvPi1zJq6fRXofhm7XqRWQ2+vEzXSSeH0PQKQEmc6zzMWFW
         UV48wz9IVY3MTPe61Tv5LfiAF59T8rtOx/zkZzG/6+SvmECSnh0/S6QSNLyCMXSegXZA
         M1Tg==
X-Forwarded-Encrypted: i=1; AJvYcCURzrZOm1BXKt7noK0sRhpksPICKJhPvrQPrUppTPAzjLBdT4zJy5Bn3La5kA4RKjfGdqxRjxRSiHzx6Cs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz7G5ZxdnXSz7hUTljolYF+AY4DoTWl4XmH8rJKlBQU5/9JAJK9
	W31d7nVG/5Bbj/Wnml+us+ITq5elP76XsOW8YkN6xahjSsvBQWpVKnAmAxhlBtaWzkqdIUiN4yV
	EhlO6cFBBAau5Rupz9FkZF7Po4TaxuF0Bl+J4lg==
X-Google-Smtp-Source: AGHT+IGBYAnY2AUlP7PxhnUlPCemnFscqrcIMDZvYeaAHiD/746R6kuy8z5bpNE6xXfE/29xgODfSB6g5fMtz2d6a7M=
X-Received: by 2002:a05:6a21:3a94:b0:1d9:21c7:5af7 with SMTP id
 adf61e73a8af0-1d92c4e0698mr2775622637.15.1729246943870; Fri, 18 Oct 2024
 03:22:23 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
From: Anatoly Pugachev <matorola@gmail.com>
Date: Fri, 18 Oct 2024 14:22:12 +0400
Message-ID: <CADxRZqz1Yex_SyTXMtRxB+nztc1JgzX=ERFei5gBVh-gati-pA@mail.gmail.com>
Subject: nx_crypto on power8 lpar
To: linux-crypto@vger.kernel.org
Cc: Linux Kernel list <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org, 
	Debian PowerPC <debian-powerpc@lists.debian.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello!

Is it possible to somehow debug crypto-nx errors and follow-up in
cryptomgr_test ?

System info is debian sid , running in LPAR on IBM S822 machine.

# uname -a
Linux redpanda 6.12.0-rc3 #119 SMP Thu Oct 17 23:47:18 MSK 2024 ppc64 GNU/Linux

# lscpu
Architecture:             ppc64
  CPU op-mode(s):         32-bit, 64-bit
  Byte Order:             Big Endian
CPU(s):                   32
  On-line CPU(s) list:    0-31
Model name:               POWER8 (architected), altivec supported
  Model:                  2.1 (pvr 004b 0201)
  Thread(s) per core:     8
  Core(s) per socket:     4
  Socket(s):              1
Virtualization features:
  Hypervisor vendor:      pHyp
  Virtualization type:    para
Caches (sum of all):
  L1d:                    256 KiB (4 instances)
  L1i:                    128 KiB (4 instances)
NUMA:
  NUMA node(s):           1
  NUMA node0 CPU(s):      0-31

after doing "modprobe nx_crypto"
getting the following kernel error logs:
(this trace is non-debug kernel)

[   79.134739] nx-crypto ibm,sym-encryption-v1: bogus
sglen/databytelen for 0/6/1: 0/0 (ignored)
[   79.134750] ------------[ cut here ]------------
[   79.134756] nx-crypto ibm,sym-encryption-v1: bogus
sglen/databytelen for 0/6/1: 0/0 (ignored)
[   79.134771] WARNING: CPU: 11 PID: 1273 at mm/slab_common.c:991
__ksize+0x14c/0x1a0
[   79.134784] Modules linked in: nx_crypto(E+) binfmt_misc(E) ctr(E)
xts(E) vmx_crypto(E) gf128mul(E) sg(E) configfs(E) nfnetlink(E)
vsock_loopback(E) vmw_vsock_virti
o_transport_common(E) vsock(E) ip_tables(E) x_tables(E) autofs4(E)
ext4(E) crc16(E) mbcache(E) jbd2(E) btrfs(E) blake2b_generic(E)
raid10(E) raid456(E) async_raid6_rec
ov(E) async_memcpy(E) async_pq(E) async_xor(E) async_tx(E) xor(E)
raid6_pq(E) raid1(E) raid0(E) md_mod(E) dm_mod(E) sr_mod(E) cdrom(E)
sd_mod(E) ibmvscsi(E) scsi_trans
port_srp(E) crc32c_vpmsum(E)
[   79.134854] CPU: 11 UID: 0 PID: 1273 Comm: cryptomgr_test Tainted:
G            E      6.12.0-rc3 #119
[   79.134863] Tainted: [E]=UNSIGNED_MODULE
[   79.134866] Hardware name: IBM,8284-22A POWER8 (architected)
0x4b0201 0xf000004 of:IBM,FW860.42 (SV860_138) hv:phyp pSeries
[   79.134872] NIP:  c000000000476e8c LR: c000000000476fd8 CTR: c000000000476f60
[   79.134877] REGS: c00000000ed679b0 TRAP: 0700   Tainted: G
  E       (6.12.0-rc3)
[   79.134882] MSR:  800000000282b032 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI>
CR: 44008420  XER: 20000010
[   79.134897] CFAR: c000000000476d90 IRQMASK: 0
               GPR00: c000000000476fd8 c00000000ed67c50
c00000000114be00 0000000030399000
               GPR04: 0000000030399000 0000000000000000
b0bac02b000000c0 000000000000008c
               GPR08: c000000000001000 c000000030398000
0000000000000001 c0003d0004ee2370
               GPR12: c000000000476f60
[   79.134917] nx-crypto ibm,sym-encryption-v1: bogus
sglen/databytelen for 0/20/1: 0/0 (ignored)
[   79.134918] c00000001e437f00
[   79.134932] c000000000165a78 c0000000031aae80
               GPR16: 0000000000000000 0000000000000000
00000000000000ed 0000000000000077
               GPR20: c000000000e60ca8 ffffffffffffffff
0000000000000077 0000000000000076
               GPR24: c000000000e625f8 c00000000f3d9408
0000000000000005 c00000002bc0ba80
               GPR28: c00000000f3d9400 0000000000000000
c0003d0004ee5470 c0003f0000c0e600
[   79.134982] NIP [c000000000476e8c] __ksize+0x14c/0x1a0
[   79.134990] LR [c000000000476fd8] kfree_sensitive+0x78/0xa0
[   79.134998] Call Trace:
[   79.135001] [c00000000ed67c50] [c00000000ed67d40]
0xc00000000ed67d40 (unreliable)
[   79.135013] [c00000000ed67c80] [0000000000000003] 0x3
[   79.135020] [c00000000ed67cb0] [c0003d0004eddcf4]
nx_crypto_ctx_skcipher_exit+0x2c/0x60 [nx_crypto]
[   79.135034] [c00000000ed67ce0] [c000000000884d58]
crypto_skcipher_exit_tfm+0x38/0x50
[   79.135045] [c00000000ed67d00] [c00000000087d8d8]
crypto_destroy_tfm+0x98/0x140
[   79.135053] [c00000000ed67d40] [c000000000897c14]
alg_test_skcipher+0x164/0x280
[   79.135063] [c00000000ed67de0] [c00000000089864c] alg_test+0x91c/0xf18
[   79.135071] [c00000000ed67f60] [c000000000890294] cryptomgr_test+0x34/0x70
[   79.135080] [c00000000ed67f90] [c000000000165ba4] kthread+0x134/0x140
[   79.135089] [c00000000ed67fe0] [c00000000000cd30]
start_kernel_thread+0x14/0x18
[   79.135097] Code: 7d084110 39080001 0b080000 282a2000 40810064
7d29f850 3940ffff 792934e4 7949f00e 7c884a78 3148ffff 7d4a4110
<0b0a0000> 7c244840 4082003c e93f0000
[   79.135131] ---[ end trace 0000000000000000 ]---
[   79.135294] ------------[ cut here ]------------
[   79.135317] WARNING: CPU: 31 PID: 1274 at mm/slab_common.c:991
__ksize+0x14c/0x1a0
[   79.135340] Modules linked in: nx_crypto(E) binfmt_misc(E) ctr(E)
xts(E) vmx_crypto(E) gf128mul(E) sg(E) configfs(E) nfnetlink(E)
vsock_loopback(E) vmw_vsock_virtio
_transport_common(E) vsock(E) ip_tables(E) x_tables(E) autofs4(E)
ext4(E) crc16(E) mbcache(E) jbd2(E) btrfs(E) blake2b_generic(E)
raid10(E) raid456(E) async_raid6_reco
v(E) async_memcpy(E) async_pq(E) async_xor(E) async_tx(E) xor(E)
raid6_pq(E) raid1(E) raid0(E) md_mod(E) dm_mod(E) sr_mod(E) cdrom(E)
sd_mod(E) ibmvscsi(E) scsi_transp
ort_srp(E) crc32c_vpmsum(E)
[   79.135472] CPU: 31 UID: 0 PID: 1274 Comm: cryptomgr_test Tainted:
G        W   E      6.12.0-rc3 #119
[   79.135490] Tainted: [W]=WARN, [E]=UNSIGNED_MODULE
[   79.135498] Hardware name: IBM,8284-22A POWER8 (architected)
0x4b0201 0xf000004 of:IBM,FW860.42 (SV860_138) hv:phyp pSeries
[   79.135510] NIP:  c000000000476e8c LR: c000000000476fd8 CTR: c000000000476f60
[   79.135521] REGS: c00000000999f9b0 TRAP: 0700   Tainted: G        W
  E       (6.12.0-rc3)
[   79.135533] MSR:  800000000282b032 <SF
[   79.135538] alg: aead: gcm-aes-nx decryption failed on test vector
0; expected_error=0, actual_error=-22, cfg="in-place (one sglist)"
[   79.135540] ,VEC
[   79.135548] ,VSX
[   79.135560] ------------[ cut here ]------------
[   79.135565] alg: self-tests for gcm(aes) using gcm-aes-nx failed (rc=-22)
[   79.135563] WARNING: CPU: 17 PID: 1275 at mm/slab_common.c:991
__ksize+0x14c/0x1a0
[   79.135570] ,EE
[   79.135575] Modules linked in:
[   79.135577] ------------[ cut here ]------------
[   79.135579] alg: self-tests for gcm(aes) using gcm-aes-nx failed (rc=-22)
[   79.135584] ,FP
[   79.135588]  nx_crypto(E)
[   79.135589] WARNING: CPU: 16 PID: 1276 at crypto/testmgr.c:5929
alg_test+0xeb4/0xf18
[   79.135592] ,ME
[   79.135597] Modules linked in:
...

Older kernels:

Getting the following trace on 5.14.0:

Oct 15 16:36:22 redpanda kernel: alg: aead: gcm-aes-nx decryption
failed on test vector 0; expected_error=0, actual_error=-22,
cfg="in-place"
Oct 15 16:36:22 redpanda kernel: ------------[ cut here ]------------
Oct 15 16:36:22 redpanda kernel: alg: self-tests for gcm-aes-nx
(gcm(aes)) failed (rc=-22)
Oct 15 16:36:22 redpanda kernel: WARNING: CPU: 16 PID: 1263 at
crypto/testmgr.c:5652 .alg_test+0x874/0xcd0
Oct 15 16:36:22 redpanda kernel: Modules linked in: nx_crypto(E+)
binfmt_misc(E) xts(E) ctr(E) vmx_crypto(E) sg(E) gf128mul(E)
configfs(E) nfnetlink(E) vsock_loopback(E)
vmw_vsock_virtio_transport_common(E) vsock(E) ip_tables(E) x_tables(E)
autofs4(E) ext4(E) crc16(E) mbcache(E) jbd2(E) btrfs(E)
blake2b_generic(E) zstd_compress(E) raid10(E) raid456(E)
async_memcpy(E) async_raid6_recov(E) async_pq(E) async_xor(E)
async_tx(E) xor(E) raid6_pq(E) raid1(E) raid0(E) md_mod(E) dm_mod(E)
sr_mod(E) sd_mod(E) cdrom(E) t10_pi(E) ibmvscsi(E)
scsi_transport_srp(E) crc32c_vpmsum(E)
Oct 15 16:36:22 redpanda kernel: CPU: 16 PID: 1263 Comm:
cryptomgr_test Tainted: G            E     5.14.0 #108
Oct 15 16:36:22 redpanda kernel: NIP:  c0000000007f6df4 LR:
c0000000007f6df0 CTR: 0000000000000000
Oct 15 16:36:22 redpanda kernel: REGS: c0000000260278b0 TRAP: 0700
Tainted: G            E      (5.14.0)
Oct 15 16:36:22 redpanda kernel: MSR:  800000000282b032
<SF,VEC,VSX,EE,FP,ME,IR,DR,RI>  CR: 44008220  XER: 20000005
Oct 15 16:36:22 redpanda kernel: CFAR: c000000000138320 IRQMASK: 0
                                 GPR00: c0000000007f6df0
c000000026027b50 c000000002898900 0000000000000039
                                 GPR04: 00000000ffffbfff
000000000002fff4 c0000000260276c8 0000000000000027
                                 GPR08: 0000000000000001
c00000080e906f90 0000000000000023 0000000000003b44
                                 GPR12: 0000000048008221
c00000001ec84300 c000000000177690 c000000026360f40
                                 GPR16: 0000000000000000
0000000000000000 0000000000000000 0000000000000101
                                 GPR20: c000000000dd3940
0000000000000081 ffffffffffffffea ffffffffffffffff
                                 GPR24: 0000000000000080
c000000000dd4328 0000000000000080 c000000002a14f08
                                 GPR28: 0000000000000400
0000000000000003 c000000026690e80 c000000026690e00
Oct 15 16:36:22 redpanda kernel: NIP [c0000000007f6df4] .alg_test+0x874/0xcd0
Oct 15 16:36:22 redpanda kernel: LR [c0000000007f6df0] .alg_test+0x870/0xcd0
Oct 15 16:36:22 redpanda kernel: Call Trace:
Oct 15 16:36:22 redpanda kernel: [c000000026027b50] [c0000000007f6df0]
.alg_test+0x870/0xcd0 (unreliable)
Oct 15 16:36:22 redpanda kernel: [c000000026027cd0] [c0000000007f2ca0]
.cryptomgr_test+0x40/0x70
Oct 15 16:36:22 redpanda kernel: [c000000026027d50] [c000000000177814]
.kthread+0x184/0x190
Oct 15 16:36:22 redpanda kernel: [c000000026027e10] [c00000000000ce60]
.ret_from_kernel_thread+0x58/0x60
Oct 15 16:36:22 redpanda kernel: Instruction dump:
Oct 15 16:36:22 redpanda kernel: 3d220018 8929c62e 2c090000 408203c0
7ed607b4 3c62fe6c 7fc5f378 7fe4fb78
Oct 15 16:36:22 redpanda kernel: 7ec6b378 38633f08 4b9414cd 60000000
<0fe00000> ea610118 ea810120 eaa10128
Oct 15 16:36:22 redpanda kernel: ---[ end trace a286778a1394c87c ]---
Oct 15 16:36:22 redpanda kernel: nx-crypto ibm,sym-encryption-v1:
bogus sglen/databytelen for 0/6/1: 0/0 (ignored)
Oct 15 16:36:22 redpanda kernel: nx-crypto ibm,sym-encryption-v1:
bogus sglen/databytelen for 0/6/1: 0/0 (ignored)
Oct 15 16:36:22 redpanda kernel: nx-crypto ibm,sym-encryption-v1:
bogus sglen/databytelen for 0/20/1: 0/0 (ignored)


kernel 5.12.0:

Oct 15 17:49:32 redpanda kernel: alg: aead: gcm-aes-nx decryption
failed on test vector 0; expected_error=0, actual_error=-22,
cfg="in-place"
Oct 15 17:49:32 redpanda kernel: ------------[ cut here ]------------
Oct 15 17:49:32 redpanda kernel: alg: self-tests for gcm-aes-nx
(gcm(aes)) failed (rc=-22)
Oct 15 17:49:32 redpanda kernel: WARNING: CPU: 25 PID: 1245 at
crypto/testmgr.c:5623 .alg_test+0x874/0xcc0
Oct 15 17:49:32 redpanda kernel: Modules linked in: nx_crypto(E+)
binfmt_misc(E) xts(E) ctr(E) vmx_crypto(E) sg(E) gf128mul(E)
configfs(E) nfnetlink(E) vsock_loopback(E)
vmw_vsock_virtio_transport_common(E) vsock(E) ip_tables(E) x_tables(E)
autofs4(E) ext4(E) crc16(E) mbcache(E) jbd2(E) raid10(E) raid456(E)
async_memcpy(E) async_raid6_recov(E) async_pq(E) raid6_pq(E)
async_xor(E) async_tx(E) xor(E) raid1(E) raid0(E) md_mod(E) dm_mod(E)
sr_mod(E) sd_mod(E) cdrom(E) t10_pi(E) ibmvscsi(E)
scsi_transport_srp(E) crc32c_vpmsum(E)
Oct 15 17:49:32 redpanda kernel: CPU: 25 PID: 1245 Comm:
cryptomgr_test Tainted: G            E     5.12.0 #109
Oct 15 17:49:32 redpanda kernel: NIP:  c0000000007bddb4 LR:
c0000000007bddb0 CTR: 0000000000000000
Oct 15 17:49:32 redpanda kernel: REGS: c00000000847b8b0 TRAP: 0700
Tainted: G            E      (5.12.0)
Oct 15 17:49:32 redpanda kernel: MSR:  800000000282b032
<SF,VEC,VSX,EE,FP,ME,IR,DR,RI>  CR: 44008220  XER: 20000005
Oct 15 17:49:32 redpanda kernel: CFAR: c000000000131290 IRQMASK: 0
                                 GPR00: c0000000007bddb0
c00000000847bb50 c0000000018a5500 0000000000000039
                                 GPR04: 0000000000000001
0000000000000000 0000000000000000 0000000000000027
                                 GPR08: 0000000000000001
c00000080eb46f90 0000000000000023 0000000000002bc7
                                 GPR12: 0000000048008221
c00000001ec7d700 c00000000016a940 c000000011691240
                                 GPR16: 0000000000000000
0000000000000000 0000000000000000 00000000000000f6
                                 GPR20: c000000000d45a68
000000000000007c ffffffffffffffea ffffffffffffffff
                                 GPR24: 000000000000007b
c000000000d46450 000000000000007b c000000001a157c8
                                 GPR28: 0000000000000400
0000000000000003 c000000009eca480 c000000009eca400
Oct 15 17:49:32 redpanda kernel: NIP [c0000000007bddb4] .alg_test+0x874/0xcc0
Oct 15 17:49:32 redpanda kernel: LR [c0000000007bddb0] .alg_test+0x870/0xcc0
Oct 15 17:49:32 redpanda kernel: Call Trace:
Oct 15 17:49:32 redpanda kernel: [c00000000847bb50] [c0000000007bddb0]
.alg_test+0x870/0xcc0 (unreliable)
Oct 15 17:49:32 redpanda kernel: [c00000000847bcd0] [c0000000007b9c10]
.cryptomgr_test+0x40/0x70
Oct 15 17:49:32 redpanda kernel: [c00000000847bd50] [c00000000016aae0]
.kthread+0x1a0/0x1b0
Oct 15 17:49:32 redpanda kernel: [c00000000847be10] [c00000000000d574]
.ret_from_kernel_thread+0x58/0x64
Oct 15 17:49:32 redpanda kernel: Instruction dump:
Oct 15 17:49:32 redpanda kernel: 3d220017 892902ee 2c090000 408203bc
7ed607b4 3c62ff61 7fc5f378 7fe4fb78
Oct 15 17:49:32 redpanda kernel: 7ec6b378 38637f18 4b97347d 60000000
<0fe00000> ea610118 ea810120 eaa10128
Oct 15 17:49:32 redpanda kernel: ---[ end trace 4b358059cc05f982 ]---
Oct 15 17:49:32 redpanda kernel: nx-crypto ibm,sym-encryption-v1:
bogus sglen/databytelen for 0/6/1: 0/0 (ignored)
Oct 15 17:49:32 redpanda kernel: nx-crypto ibm,sym-encryption-v1:
bogus sglen/databytelen for 0/6/1: 0/0 (ignored)
Oct 15 17:49:32 redpanda kernel: nx-crypto ibm,sym-encryption-v1:
bogus sglen/databytelen for 0/20/1: 0/0 (ignored)

5.3.0:

Oct 18 12:37:21 redpanda kernel: alg: aead: gcm-aes-nx decryption
failed on test vector 0; expected_error=0, actual_error=-22,
cfg="in-place"
Oct 18 12:37:21 redpanda kernel: nx-crypto ibm,sym-encryption-v1:
bogus sglen/databytelen for 0/6/1: 0/0 (ignored)
Oct 18 12:37:21 redpanda kernel: nx-crypto ibm,sym-encryption-v1:
bogus sglen/databytelen for 0/6/1: 0/0 (ignored)
Oct 18 12:37:21 redpanda kernel: nx-crypto ibm,sym-encryption-v1:
bogus sglen/databytelen for 0/20/1: 0/0 (ignored)


I tried to bisect the error, but 5.8 and earlier kernels does not
compile for me on this LPAR, so for the earlier kernels I used a
precompiled debian kernel.

Thank you.

