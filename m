Return-Path: <linuxppc-dev+bounces-16785-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aBAkLKBji2nDUAAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16785-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Feb 2026 17:58:08 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF44C11D7C4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Feb 2026 17:58:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f9SRq1F1bz2xQ1;
	Wed, 11 Feb 2026 03:57:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=109.224.244.24
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770742679;
	cv=none; b=Zj9b5piRFrkLNYVGNzL19+pvBtDgiDcQFsnbx1dDxzD/GjUBZ1yQttUvxNS34reZaXq/IhfXlbMl4fi3O9fgJsMyoVqphBBKYeH3uFxb9FJD2PvVYGnziX2/j/vhQSPc2Uhrn5oDV9dZ4NbYQqXckkKRDUm3ZGd3DA1t3ktncIUnTkxd6xGkAZuMDIKEpmbFwagF4Igse5XioCtObTndiJ3NerAEnlwUADyCOzShXdKlHycwaO1yPacT63ixizMU/jKRWcNh9h4eAxXDsoFtD3VxZ2SqUYf6auSp3D8ZDHT5aNXCcG1baJJvFxudTFvVxLjuTTolD6jC622FqsHXzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770742679; c=relaxed/relaxed;
	bh=zV90zc6dhFMLq0URWBX2cCScoAnWsvqDwMcIENWQx9k=;
	h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QzVLo0TCz6ANhGApl/dkvT0Y5tk89a/mQ74NDL9SneBfqopBDd7spOchN6yqqjMvv1SOQBzWyniXf5YIjdrPwi8qvSr4TV7x9dMieNB541dAhAvmVM8+W1i0apu/ysOBZM0LlX3HzAzM8Ii+N5P4XDA/FJbg7zuX6vD7qQ9bTJHeDf+y4y9PCfV0NuaOU72mZz54zq9jyZVSvC2VzRbkFQpgXBSwpnwMYzuKN9ML1HNMfZz9EOqJRvfaLeDKVVpKoEd9mMhAYx2Sqx2zUhamrrjAY+0aQJOQWTGmJ0SSZBx1fb/rMfdvwBy2H397ckrUvROc/IbKa8dW2XajJPplug==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; dkim=pass (2048-bit key; secure) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=3r6gmifjtbd3tnqeyecktvhdim.protonmail header.b=mrHiTTkY; dkim-atps=neutral; spf=pass (client-ip=109.224.244.24; helo=mail-24424.protonmail.ch; envelope-from=jfiusdq@proton.me; receiver=lists.ozlabs.org) smtp.mailfrom=proton.me
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=3r6gmifjtbd3tnqeyecktvhdim.protonmail header.b=mrHiTTkY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=proton.me (client-ip=109.224.244.24; helo=mail-24424.protonmail.ch; envelope-from=jfiusdq@proton.me; receiver=lists.ozlabs.org)
Received: from mail-24424.protonmail.ch (mail-24424.protonmail.ch [109.224.244.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f9SRj2N87z2xKx
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Feb 2026 03:57:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=3r6gmifjtbd3tnqeyecktvhdim.protonmail; t=1770742665; x=1771001865;
	bh=zV90zc6dhFMLq0URWBX2cCScoAnWsvqDwMcIENWQx9k=;
	h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=mrHiTTkY946LdnDiUvL9Dq0hu13HYAiCKXGxqZAHpgsgmnbk2anBIZFYIchRzeY89
	 XJiIf25V+imXKDGaxIf/BEuEqJcRYhuIs8wPMtV1UDSUAbfVPdiSYc7hj5FS1Ia7QP
	 woWUzawSva7iuOVgPdfcOVLpckqfeEE6ixZUYtUiEJjfxb/CujjVARsZGhS8gbaxs2
	 OYt/jU7TXtKJzX09dBdMjOiCzCj3x5+6r+tSoUzU7d/4Dl8QxcQX7Mi8Ar8QGZ0KjS
	 78UNJ5dRoRb9VLbu5fNwvGteTGgcDfsIAcZ2JrsZkZjbpFqJ3Ewz9CNWrJa4EZcr9N
	 o+Q32A7b9kr/g==
Date: Tue, 10 Feb 2026 16:57:41 +0000
To: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
From: jfiusdq <jfiusdq@proton.me>
Subject: Re: slab raid6-md125 start c000000d9371bf30 pointer offset 16 size 2544 ist_add corruption. prev->next should be next
Message-ID: <hWTi4qnyyq1EBkwAD1UperpLdhLIpIPWhx2YNesZO9blCrGVIa24-c8eOQ0NK7my8KqyzN_NOiV7tRODZAR1fDSpDUyibmXubU74FdXZcKs=@proton.me>
In-Reply-To: <xqGbbceZZfpScrUjLzi4aIaxDEn6eM-5uusdXyCYPe-CJ4prSGsCztpS6LdkRk1l3kGSBGIraVjdk3y8g5bPBrleLnXN3Bm8Tex0AYS9Nkw=@proton.me>
References: <7U4DoryKHwk5nrwUmPBHdm6PVnv01nM51PnTb3VAYzTtv2vPp7-FjwXkccToIFSQN6it9_9qqf5OyYRJtotDRorEfM907p3PNKvr3XUYlBY=@proton.me> <xqGbbceZZfpScrUjLzi4aIaxDEn6eM-5uusdXyCYPe-CJ4prSGsCztpS6LdkRk1l3kGSBGIraVjdk3y8g5bPBrleLnXN3Bm8Tex0AYS9Nkw=@proton.me>
Feedback-ID: 167378330:user:proton
X-Pm-Message-ID: 3482d2d4a43455a093d67d87d58b046509011aad
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
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha512; boundary="------d307f6120bf5471a8c132adba3c811fa069d22c073c95ea82e2a81bc01daf6a7"; charset=utf-8
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.11 / 15.00];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[proton.me,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,multipart/alternative,text/plain,multipart/related];
	R_DKIM_ALLOW(-0.20)[proton.me:s=3r6gmifjtbd3tnqeyecktvhdim.protonmail];
	MAILLIST(-0.20)[generic];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_EQ_ADDR_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-16785-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:+,5:~,6:~,7:~];
	RCPT_COUNT_ONE(0.00)[1];
	HAS_ATTACHMENT(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[jfiusdq@proton.me,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[proton.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[proton.me:mid,proton.me:dkim,proton.me:email]
X-Rspamd-Queue-Id: AF44C11D7C4
X-Rspamd-Action: no action

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------d307f6120bf5471a8c132adba3c811fa069d22c073c95ea82e2a81bc01daf6a7
Content-Type: multipart/mixed;boundary=---------------------f69c6ac5f8850f800c10b0c0cb625fee

-----------------------f69c6ac5f8850f800c10b0c0cb625fee
Content-Type: multipart/alternative;boundary=---------------------e8879fb0755d5889eeddfd3a1a2f4966

-----------------------e8879fb0755d5889eeddfd3a1a2f4966
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;charset=utf-8

I have removed my out of tree module out of precaution and it still happen=
ed again, this time un-tainted kernel:

[24962.760298] sd 1:0:0:0: Power-on or device reset occurred[122456.581878=
] =C2=A0slab raid6-md125 start c0000006487c31b0 pointer offset 16 size 254=
4
[122456.581972] list_add corruption. prev->next should be next (c00020005a=
376ce0), but was c0000006487c31c0. (prev=3Dc0000006487c31c0).
[122456.582068] ------------[ cut here ]------------
[122456.582097] kernel BUG at lib/list_debug.c:32!
[122456.582130] Oops: Exception in kernel mode, sig: 5 [#1]
[122456.582185] LE PAGE_SIZE=3D64K MMU=3DRadix =C2=A0SMP NR_CPUS=3D2048 NU=
MA PowerNV
[122456.582231] Modules linked in: vhost_net vhost vhost_iotlb tap tun nft=
_masq nft_reject_ipv4 act_csum cls_u32 sch_htb nf_nat_tftp nf_conntrack_tf=
tp bridge stp llc kvm_hv kvm rfkill xt_conntrack nft_compat nft_fib_inet n=
ft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_=
ipv6 nft_reject nft_ct nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf=
_defrag_ipv4 nf_tables dm_cache_smq dm_cache raid456 async_raid6_recov asy=
nc_memcpy async_pq async_xor async_tx sunrpc raid10 snd_hda_intel snd_inte=
l_dspcfg snd_hda_codec snd_hda_core joydev snd_hwdep snd_seq snd_seq_devic=
e at24 onboard_usb_dev snd_pcm snd_timer atlantic tg3 snd ofpart ipmi_powe=
rnv macsec soundcore powernv_flash ipmi_devintf mtd ipmi_msghandler vmx_cr=
ypto opal_prd rtc_opal i2c_opal fuse dm_multipath loop nfnetlink zram lz4h=
c_compress lz4_compress xfs dm_thin_pool dm_persistent_data dm_bio_prison =
dm_crypt raid1 nvme nvme_core uas usb_storage nvme_keyring mpt3sas nvme_au=
th hkdf ast raid_class scsi_transport_sas i2c_algo_bit scsi_dh_rdac
[122456.582467] =C2=A0scsi_dh_emc scsi_dh_alua i2c_dev aes_gcm_p10_crypto =
crypto_simd cryptd
[122456.583119] CPU: 5 UID: 0 PID: 2697 Comm: dmcrypt_write/2 Not tainted =
6.18.8-200.fc43.ppc64le #1 PREEMPT(voluntary)
[122456.583216] Hardware name: T2P9D01 REV 1.00 POWER9 (raw) 0x4e1202 opal=
:skiboot-ecb1dc7 PowerNV
[122456.583292] NIP: =C2=A0c000000000e098fc LR: c000000000e098f8 CTR: 0000=
000000000000
[122456.583370] REGS: c00000003c9877a0 TRAP: 0700 =C2=A0 Not tainted =C2=A0=
(6.18.8-200.fc43.ppc64le)
[122456.583432] MSR: =C2=A0900000000282b033 <SF,HV,VEC,VSX,EE,FP,ME,IR,DR,=
RI,LE> =C2=A0CR: 24004240 =C2=A0XER: 00000156
[122456.583498] CFAR: c00000000034542c IRQMASK: 0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GPR00: c000000000e=
098f8 c00000003c987a40 c0000000026ba900 0000000000000075
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GPR04: 00000000fff=
fbfff 0000000000000001 0000201ff71a0000 0000000000000001
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GPR08: 00000000000=
00027 0000000000000000 0000000000000000 c00000003c987890
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GPR12: c000201fff1=
8ffa8 c000201fff7e8180 c000000000299c28 c000000005aba780
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GPR16: 00000000000=
00000 0000000000000000 0000000000000000 0000000000000000
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GPR20: 00000000000=
00000 0000000000000000 0000000000000000 0000000000000001
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GPR24: 00000000000=
00000 c00000003c987c70 c000200060539800 c000200618eddb30
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GPR28: 00000000000=
00000 c000201485cbe738 c00000003bd42800 c000201485cbe6f0
[122456.583968] NIP [c000000000e098fc] __list_add_valid_or_report+0xdc/0x1=
40
[122456.584045] LR [c000000000e098f8] __list_add_valid_or_report+0xd8/0x14=
0
[122456.584093] Call Trace:
[122456.584115] [c00000003c987a40] [c000000000e098f8] __list_add_valid_or_=
report+0xd8/0x140 (unreliable)
[122456.584189] [c00000003c987ab0] [c008000026e90ad4] release_stripe_plug+=
0x9c/0x150 [raid456]
[122456.584258] [c00000003c987b00] [c008000026e959f4] make_stripe_request+=
0x32c/0x560 [raid456]
[122456.584333] [c00000003c987bd0] [c008000026e95df8] raid5_make_request+0=
x1d0/0x610 [raid456]
[122456.584418] [c00000003c987d10] [c000000001369a04] md_handle_request+0x=
1c4/0x400
[122456.584484] [c00000003c987da0] [c000000000d04010] __submit_bio+0x230/0=
x3d0
[122456.584560] [c00000003c987e40] [c000000000d04244] __submit_bio_noacct+=
0x94/0x250
[122456.584635] [c00000003c987eb0] [c00000000138743c] dm_submit_bio_remap+=
0x4c/0x120
[122456.584698] [c00000003c987ef0] [c00800001dc226a8] dmcrypt_write+0x1a0/=
0x200 [dm_crypt]
[122456.584765] [c00000003c987f90] [c000000000299da8] kthread+0x188/0x1a0
[122456.584818] [c00000003c987fe0] [c00000000000ded8] start_kernel_thread+=
0x14/0x18
[122456.584879] Code: f8c10060 f8010080 4b883b35 60000000 3c62ff82 3863938=
8 e8c10060 e9210068 e8a60000 7d244b78 4b53baf5 60000000 <0fe00000> 7c0802a=
6 7c852378 7c641b78
[122456.585015] ---[ end trace 0000000000000000 ]---
[122457.162074] pstore: backend (nvram) writing error (-1)

[122457.162141] note: dmcrypt_write/2[2697] exited with irqs disabled
[122457.162214] ------------[ cut here ]------------
[122457.162257] WARNING: CPU: 5 PID: 2697 at kernel/exit.c:903 do_exit+0x5=
c/0x5b0
[122457.162314] Modules linked in: vhost_net vhost vhost_iotlb tap tun nft=
_masq nft_reject_ipv4 act_csum cls_u32 sch_htb nf_nat_tftp nf_conntrack_tf=
tp bridge stp llc kvm_hv kvm rfkill xt_conntrack nft_compat nft_fib_inet n=
ft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_=
ipv6 nft_reject nft_ct nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf=
_defrag_ipv4 nf_tables dm_cache_smq dm_cache raid456 async_raid6_recov asy=
nc_memcpy async_pq async_xor async_tx sunrpc raid10 snd_hda_intel snd_inte=
l_dspcfg snd_hda_codec snd_hda_core joydev snd_hwdep snd_seq snd_seq_devic=
e at24 onboard_usb_dev snd_pcm snd_timer atlantic tg3 snd ofpart ipmi_powe=
rnv macsec soundcore powernv_flash ipmi_devintf mtd ipmi_msghandler vmx_cr=
ypto opal_prd rtc_opal i2c_opal fuse dm_multipath loop nfnetlink zram lz4h=
c_compress lz4_compress xfs dm_thin_pool dm_persistent_data dm_bio_prison =
dm_crypt raid1 nvme nvme_core uas usb_storage nvme_keyring mpt3sas nvme_au=
th hkdf ast raid_class scsi_transport_sas i2c_algo_bit scsi_dh_rdac
[122457.162459] =C2=A0scsi_dh_emc scsi_dh_alua i2c_dev aes_gcm_p10_crypto =
crypto_simd cryptd
[122457.163011] CPU: 5 UID: 0 PID: 2697 Comm: dmcrypt_write/2 Tainted: G =C2=
=A0 =C2=A0 =C2=A0D =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 6.18.8-200.=
fc43.ppc64le #1 PREEMPT(voluntary)
[122457.163123] Tainted: [D]=3DDIE
[122457.163171] Hardware name: T2P9D01 REV 1.00 POWER9 (raw) 0x4e1202 opal=
:skiboot-ecb1dc7 PowerNV
[122457.163240] NIP: =C2=A0c00000000026035c LR: c000000000260950 CTR: 0000=
000000000000
[122457.163322] REGS: c00000003c987330 TRAP: 0700 =C2=A0 Tainted: G =C2=A0=
 =C2=A0 =C2=A0D =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(6.18.8-20=
0.fc43.ppc64le)
[122457.163406] MSR: =C2=A09000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE> =
=C2=A0CR: 24004240 =C2=A0XER: 20040156
[122457.163501] CFAR: c00000000026094c IRQMASK: 0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GPR00: c0000000002=
60950 c00000003c9875d0 c0000000026ba900 0000000000000005
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GPR04: 00000000000=
02710 0000000000000001 0000201ff71a0000 0000000000000001
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GPR08: 00000000000=
00005 0000000000000001 c00000003c987f18 0000000000004000
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GPR12: c000201fff1=
8ffa8 c000201fff7e8180 0000000000000000 0000000000000000
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GPR16: 00000000000=
00000 0000000000000000 0000000000000000 0000000000000000
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GPR20: 00000000000=
00000 0000000000000000 0000000000000000 0000000000000000
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GPR24: 00000000000=
00000 0000000000000000 0000000000000000 0000000000000000
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GPR28: 00000000000=
00005 0000000000000003 c000000003e3a900 c00000001be2a000
[122457.163984] NIP [c00000000026035c] do_exit+0x5c/0x5b0
[122457.164037] LR [c000000000260950] make_task_dead+0xa0/0x1d0
[122457.164079] Call Trace:
[122457.164126] [c00000003c9875d0] [c00000003c987600] 0xc00000003c987600 (=
unreliable)
[122457.164216] [c00000003c987670] [c000000000260950] make_task_dead+0xa0/=
0x1d0
[122457.164276] [c00000003c9876f0] [c00000000002a314] oops_end+0x164/0x1a0
[122457.164336] [c00000003c987770] [c000000000009b2c] program_check_common=
_virt+0x3bc/0x3c0
[122457.164399] ---- interrupt: 700 at __list_add_valid_or_report+0xdc/0x1=
40
[122457.164454] NIP: =C2=A0c000000000e098fc LR: c000000000e098f8 CTR: 0000=
000000000000
[122457.164509] REGS: c00000003c9877a0 TRAP: 0700 =C2=A0 Tainted: G =C2=A0=
 =C2=A0 =C2=A0D =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(6.18.8-20=
0.fc43.ppc64le)
[122457.164575] MSR: =C2=A0900000000282b033 <SF,HV,VEC,VSX,EE,FP,ME,IR,DR,=
RI,LE> =C2=A0CR: 24004240 =C2=A0XER: 00000156
[122457.164654] CFAR: c00000000034542c IRQMASK: 0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GPR00: c000000000e=
098f8 c00000003c987a40 c0000000026ba900 0000000000000075
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GPR04: 00000000fff=
fbfff 0000000000000001 0000201ff71a0000 0000000000000001
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GPR08: 00000000000=
00027 0000000000000000 0000000000000000 c00000003c987890
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GPR12: c000201fff1=
8ffa8 c000201fff7e8180 c000000000299c28 c000000005aba780
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GPR16: 00000000000=
00000 0000000000000000 0000000000000000 0000000000000000
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GPR20: 00000000000=
00000 0000000000000000 0000000000000000 0000000000000001
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GPR24: 00000000000=
00000 c00000003c987c70 c000200060539800 c000200618eddb30
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GPR28: 00000000000=
00000 c000201485cbe738 c00000003bd42800 c000201485cbe6f0
[122457.165148] NIP [c000000000e098fc] __list_add_valid_or_report+0xdc/0x1=
40
[122457.165191] LR [c000000000e098f8] __list_add_valid_or_report+0xd8/0x14=
0
[122457.165233] ---- interrupt: 700
[122457.165273] [c00000003c987ab0] [c008000026e90ad4] release_stripe_plug+=
0x9c/0x150 [raid456]
[122457.165358] [c00000003c987b00] [c008000026e959f4] make_stripe_request+=
0x32c/0x560 [raid456]
[122457.165405] [c00000003c987bd0] [c008000026e95df8] raid5_make_request+0=
x1d0/0x610 [raid456]
[122457.165481] [c00000003c987d10] [c000000001369a04] md_handle_request+0x=
1c4/0x400
[122457.165545] [c00000003c987da0] [c000000000d04010] __submit_bio+0x230/0=
x3d0
[122457.165593] [c00000003c987e40] [c000000000d04244] __submit_bio_noacct+=
0x94/0x250
[122457.165648] [c00000003c987eb0] [c00000000138743c] dm_submit_bio_remap+=
0x4c/0x120
[122457.165744] [c00000003c987ef0] [c00800001dc226a8] dmcrypt_write+0x1a0/=
0x200 [dm_crypt]
[122457.165832] [c00000003c987f90] [c000000000299da8] kthread+0x188/0x1a0
[122457.165889] [c00000003c987fe0] [c00000000000ded8] start_kernel_thread+=
0x14/0x18
[122457.165960] Code: 91610008 f8010010 f821ff61 e92d0c78 f9210078 3920000=
0 892d0932 552907fe 0b090000 e95f0c68 312affff 7d295110 <0b090000> ebbf0b9=
0 ebdf0b88 7fa3eb78
[122457.166065] ---[ end trace 0000000000000000 ]---
On Monday, February 9th, 2026 at 12:38 AM, jfiusdq <jfiusdq@proton.me> wro=
te:

> Sorry for duplicate but it happened after a disk started failing during =
a check that was triggered on all my 3 RAID arrays and then after a good w=
hile this bug happened. That's basically it.
> =


> [154043.105837] md: check of RAID array md125[154049.432225] md: check o=
f RAID array md126
> [154055.718196] md: check of RAID array md127
> [163101.001572] sd 1:0:0:0: [sda] tag#8069 FAILED Result: hostbyte=3DDID=
_SOFT_ERROR driverbyte=3DDRIVER_OK cmd_age=3D0s
> [163101.001655] sd 1:0:0:0: [sda] tag#8069 CDB: Read(10) 28 00 1b 28 d1 =
80 00 02 80 00
> [163101.001691] I/O error, dev sda, sector 455659904 op 0x0:(READ) flags=
 0x80700 phys_seg 5 prio class 2
> [163101.412714] sd 1:0:0:0: Power-on or device reset occurred
> [163101.698759] sd 1:0:0:0: [sda] tag#7728 FAILED Result: hostbyte=3DDID=
_SOFT_ERROR driverbyte=3DDRIVER_OK cmd_age=3D0s
> [163101.698813] sd 1:0:0:0: [sda] tag#7728 CDB: Read(10) 28 00 74 70 6d =
00 00 00 80 00
> [163101.698843] I/O error, dev sda, sector 1953524992 op 0x0:(READ) flag=
s 0x80700 phys_seg 1 prio class 2
> [163102.162693] sd 1:0:0:0: Power-on or device reset occurred
> [163102.447648] sd 1:0:0:0: [sda] Unaligned partial completion (resid=3D=
866300, sector_sz=3D512)
> [163102.447723] sd 1:0:0:0: [sda] tag#8049 CDB: Read(10) 28 00 5e 21 d4 =
00 00 08 00 00
> [163102.447751] sd 1:0:0:0: [sda] tag#8049 FAILED Result: hostbyte=3DDID=
_SOFT_ERROR driverbyte=3DDRIVER_OK cmd_age=3D0s
> [163102.447789] sd 1:0:0:0: [sda] tag#8049 CDB: Read(10) 28 00 5e 21 d4 =
00 00 08 00 00
> [163102.447855] I/O error, dev sda, sector 1579275264 op 0x0:(READ) flag=
s 0x80700 phys_seg 8 prio class 2
> [163102.912783] sd 1:0:0:0: Power-on or device reset occurred
> [163103.662867] sd 1:0:0:0: Power-on or device reset occurred
> [163104.413036] sd 1:0:0:0: Power-on or device reset occurred
> [163105.163044] sd 1:0:0:0: Power-on or device reset occurred
> [163105.913609] sd 1:0:0:0: Power-on or device reset occurred
> [163106.663213] sd 1:0:0:0: Power-on or device reset occurred
> [163107.289773] sd 1:0:0:0: Power-on or device reset occurred
> [163107.932812] sd 1:0:0:0: Power-on or device reset occurred
> [163108.913957] sd 1:0:0:0: Power-on or device reset occurred
> [163109.664106] sd 1:0:0:0: Power-on or device reset occurred
> [163110.414281] sd 1:0:0:0: Power-on or device reset occurred
> [163111.164312] sd 1:0:0:0: Power-on or device reset occurred
> [163111.913814] sd 1:0:0:0: Power-on or device reset occurred
> [163112.663904] sd 1:0:0:0: Power-on or device reset occurred
> [163113.414627] sd 1:0:0:0: Power-on or device reset occurred
> [163113.699639] sd 1:0:0:0: [sda] Unaligned partial completion (resid=3D=
205820, sector_sz=3D512)
> [163113.699771] sd 1:0:0:0: [sda] tag#7615 CDB: Read(10) 28 00 01 4d 84 =
00 00 04 00 00
> [163113.699976] sd 1:0:0:0: [sda] tag#7615 FAILED Result: hostbyte=3DDID=
_SOFT_ERROR driverbyte=3DDRIVER_OK cmd_age=3D0s
> [163113.700198] sd 1:0:0:0: [sda] tag#7615 CDB: Read(10) 28 00 01 4d 84 =
00 00 04 00 00
> [163113.700329] I/O error, dev sda, sector 21857280 op 0x0:(READ) flags =
0x80700 phys_seg 4 prio class 2
> [163114.164085] sd 1:0:0:0: Power-on or device reset occurred
> [163114.914167] sd 1:0:0:0: Power-on or device reset occurred
> [163115.664261] sd 1:0:0:0: Power-on or device reset occurred
> [163115.959965] sd 1:0:0:0: [sda] tag#8044 FAILED Result: hostbyte=3DDID=
_SOFT_ERROR driverbyte=3DDRIVER_OK cmd_age=3D0s
> [163115.959963] sd 1:0:0:0: [sda] Unaligned partial completion (resid=3D=
308220, sector_sz=3D512)
> [163115.959996] sd 1:0:0:0: [sda] tag#8016 CDB: Read(10) 28 00 00 58 a0 =
00 00 04 00 00
> [163115.960041] sd 1:0:0:0: [sda] tag#8044 CDB: Read(10) 28 00 1b 48 fc =
00 00 04 00 00
> [163115.960081] sd 1:0:0:0: [sda] tag#8016 FAILED Result: hostbyte=3DDID=
_SOFT_ERROR driverbyte=3DDRIVER_OK cmd_age=3D0s
> [163115.960109] I/O error, dev sda, sector 457767936 op 0x0:(READ) flags=
 0x80700 phys_seg 8 prio class 2
> [163115.960155] sd 1:0:0:0: [sda] tag#8016 CDB: Read(10) 28 00 00 58 a0 =
00 00 04 00 00
> [163115.960402] I/O error, dev sda, sector 5808128 op 0x0:(READ) flags 0=
x80700 phys_seg 4 prio class 2
> [163116.414438] sd 1:0:0:0: Power-on or device reset occurred
> [163116.706739] sd 1:0:0:0: [sda] tag#8103 FAILED Result: hostbyte=3DDID=
_SOFT_ERROR driverbyte=3DDRIVER_OK cmd_age=3D0s
> [163116.706804] sd 1:0:0:0: [sda] tag#8103 CDB: Read(10) 28 00 0d 86 3c =
00 00 08 00 00
> [163116.706853] I/O error, dev sda, sector 226900992 op 0x0:(READ) flags=
 0x80700 phys_seg 12 prio class 2
> [163117.109789] sd 1:0:0:0: Power-on or device reset occurred
> [163117.914577] sd 1:0:0:0: Power-on or device reset occurred
> [163497.189569] md: md126: check done.
> [163829.231426] md: md127: check done.
> [185096.100388] md: md125: check done.
> =


> =


> and just after that, just the kernel logs you saw in my previous mail, n=
othing in between.
> On Monday, February 9th, 2026 at 12:19 AM, jfiusdq <jfiusdq@proton.me> w=
rote:
> =


> > Hello,
> > =


> > =


> > Today I was met with the following kernel log on IBM POWER9, abit worr=
ying because of it concerning RAID6:
> > =


> > =


> > [240888.555387] =C2=A0slab raid6-md125 start c000000d9371bf30 pointer =
offset 16 size 2544
> > [240888.555464] list_add corruption. prev->next should be next (c00000=
002a3fc3e0), but was c000000d9371bf40. (prev=3Dc000000d9371bf40).
> > [240888.555582] ------------[ cut here ]------------
> > [240888.555615] kernel BUG at lib/list_debug.c:32!
> > [240888.555650] Oops: Exception in kernel mode, sig: 5 [#1]
> > [240888.555703] LE PAGE_SIZE=3D64K MMU=3DRadix =C2=A0SMP NR_CPUS=3D204=
8 NUMA PowerNV
> > [240888.555755] Modules linked in: vendor_reset(OE) vfio_pci vfio_pci_=
core vfio_iommu_spapr_tce vfio iommufd vhost_net vhost vhost_iotlb tap tun=
 nft_masq nft_reject_ipv4 act_csum cls_u32 sch_htb nf_nat_tftp nf_conntrac=
k_tftp bridge stp llc kvm_hv kvm rfkill xt_conntrack nft_compat nft_fib_in=
et nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_rej=
ect_ipv6 nft_reject nft_ct nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv=
6 nf_defrag_ipv4 nf_tables dm_cache_smq dm_cache raid456 async_raid6_recov=
 async_memcpy async_pq async_xor async_tx sunrpc raid10 snd_hda_intel at24=
 joydev snd_intel_dspcfg snd_hda_codec snd_hda_core onboard_usb_dev snd_hw=
dep snd_seq snd_seq_device snd_pcm ofpart tg3 powernv_flash snd_timer atla=
ntic vmx_crypto ipmi_powernv snd ipmi_devintf mtd ipmi_msghandler macsec r=
tc_opal opal_prd soundcore i2c_opal fuse dm_multipath loop nfnetlink zram =
lz4hc_compress lz4_compress xfs dm_thin_pool dm_persistent_data dm_bio_pri=
son dm_crypt raid1 nvme mpt3sas nvme_core uas usb_storage ast nvme_keyring
> > [240888.555962] =C2=A0nvme_auth hkdf raid_class i2c_algo_bit scsi_tran=
sport_sas scsi_dh_rdac scsi_dh_emc scsi_dh_alua i2c_dev aes_gcm_p10_crypto=
 crypto_simd cryptd
> > [240888.556531] CPU: 33 UID: 0 PID: 2851 Comm: dmcrypt_write/2 Tainted=
: G =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OE =C2=A0 =C2=A0 =C2=A0 6.18.8-200.=
fc43.ppc64le #1 PREEMPT(voluntary)
> > [240888.556608] Tainted: [O]=3DOOT_MODULE, [E]=3DUNSIGNED_MODULE
> > [240888.556650] Hardware name: T2P9D01 REV 1.00 POWER9 (raw) 0x4e1202 =
opal:skiboot-ecb1dc7 PowerNV
> > [240888.556721] NIP: =C2=A0c000000000e098fc LR: c000000000e098f8 CTR: =
0000000000000000
> > [240888.556766] REGS: c0000000295e77a0 TRAP: 0700 =C2=A0 Tainted: G =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OE =C2=A0 =C2=A0 =C2=A0 =C2=A0(6.18.8-200=
.fc43.ppc64le)
> > [240888.556822] MSR: =C2=A09000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE> =
=C2=A0CR: 24004280 =C2=A0XER: 00000000
> > [240888.556904] CFAR: c00000000034542c IRQMASK: 0
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GPR00: c000000=
000e098f8 c0000000295e7a40 c0000000026ba900 0000000000000075
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GPR04: 0000000=
0ffffbfff 0000000000000001 0000001ffc2d0000 0000000000000001
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GPR08: 0000000=
000000027 0000000000000000 0000000000000000 c0000000295e7890
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GPR12: c000201=
fff18ffa8 c000001ffffde600 c000000000299c28 c0002000113fdb40
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GPR16: 0000000=
000000000 0000000000000000 0000000000000000 0000000000000000
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GPR20: 0000000=
000000000 0000000000000000 0000000000000000 0000000000000001
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GPR24: 0000000=
000000000 c0000000295e7c70 c00000002bbce800 c000001126d57830
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GPR28: 0000000=
000000000 c000201d2995b588 c00020005f464000 c000201d2995b540
> > [240888.557339] NIP [c000000000e098fc] __list_add_valid_or_report+0xdc=
/0x140
> > [240888.557405] LR [c000000000e098f8] __list_add_valid_or_report+0xd8/=
0x140
> > [240888.557463] Call Trace:
> > [240888.557484] [c0000000295e7a40] [c000000000e098f8] __list_add_valid=
_or_report+0xd8/0x140 (unreliable)
> > [240888.557541] [c0000000295e7ab0] [c0080000238f0ad4] release_stripe_p=
lug+0x9c/0x150 [raid456]
> > [240888.557607] [c0000000295e7b00] [c0080000238f59f4] make_stripe_requ=
est+0x32c/0x560 [raid456]
> > [240888.557678] [c0000000295e7bd0] [c0080000238f5df8] raid5_make_reque=
st+0x1d0/0x610 [raid456]
> > [240888.557765] [c0000000295e7d10] [c000000001369a04] md_handle_reques=
t+0x1c4/0x400
> > [240888.557850] [c0000000295e7da0] [c000000000d04010] __submit_bio+0x2=
30/0x3d0
> > [240888.557927] [c0000000295e7e40] [c000000000d04244] __submit_bio_noa=
cct+0x94/0x250
> > [240888.557998] [c0000000295e7eb0] [c00000000138743c] dm_submit_bio_re=
map+0x4c/0x120
> > [240888.558070] [c0000000295e7ef0] [c00800001bce26a8] dmcrypt_write+0x=
1a0/0x200 [dm_crypt]
> > [240888.558131] [c0000000295e7f90] [c000000000299da8] kthread+0x188/0x=
1a0
> > [240888.558196] [c0000000295e7fe0] [c00000000000ded8] start_kernel_thr=
ead+0x14/0x18
> > [240888.558257] Code: f8c10060 f8010080 4b883b35 60000000 3c62ff82 386=
39388 e8c10060 e9210068 e8a60000 7d244b78 4b53baf5 60000000 <0fe00000> 7c0=
802a6 7c852378 7c641b78
> > [240888.558363] ---[ end trace 0000000000000000 ]---
> > [240889.114586] pstore: backend (nvram) writing error (-1)
> > =


> > [240889.114636] note: dmcrypt_write/2[2851] exited with irqs disabled
> > [240889.114756] ------------[ cut here ]------------
> > [240889.114785] WARNING: CPU: 33 PID: 2851 at kernel/exit.c:903 do_exi=
t+0x5c/0x5b0
> > [240889.114837] Modules linked in: vendor_reset(OE) vfio_pci vfio_pci_=
core vfio_iommu_spapr_tce vfio iommufd vhost_net vhost vhost_iotlb tap tun=
 nft_masq nft_reject_ipv4 act_csum cls_u32 sch_htb nf_nat_tftp nf_conntrac=
k_tftp bridge stp llc kvm_hv kvm rfkill xt_conntrack nft_compat nft_fib_in=
et nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_rej=
ect_ipv6 nft_reject nft_ct nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv=
6 nf_defrag_ipv4 nf_tables dm_cache_smq dm_cache raid456 async_raid6_recov=
 async_memcpy async_pq async_xor async_tx sunrpc raid10 snd_hda_intel at24=
 joydev snd_intel_dspcfg snd_hda_codec snd_hda_core onboard_usb_dev snd_hw=
dep snd_seq snd_seq_device snd_pcm ofpart tg3 powernv_flash snd_timer atla=
ntic vmx_crypto ipmi_powernv snd ipmi_devintf mtd ipmi_msghandler macsec r=
tc_opal opal_prd soundcore i2c_opal fuse dm_multipath loop nfnetlink zram =
lz4hc_compress lz4_compress xfs dm_thin_pool dm_persistent_data dm_bio_pri=
son dm_crypt raid1 nvme mpt3sas nvme_core uas usb_storage ast nvme_keyring
> > [240889.114993] =C2=A0nvme_auth hkdf raid_class i2c_algo_bit scsi_tran=
sport_sas scsi_dh_rdac scsi_dh_emc scsi_dh_alua i2c_dev aes_gcm_p10_crypto=
 crypto_simd cryptd
> > [240889.115528] CPU: 33 UID: 0 PID: 2851 Comm: dmcrypt_write/2 Tainted=
: G =C2=A0 =C2=A0 =C2=A0D =C2=A0 =C2=A0OE =C2=A0 =C2=A0 =C2=A0 6.18.8-200.=
fc43.ppc64le #1 PREEMPT(voluntary)
> > [240889.115641] Tainted: [D]=3DDIE, [O]=3DOOT_MODULE, [E]=3DUNSIGNED_M=
ODULE
> > [240889.115678] Hardware name: T2P9D01 REV 1.00 POWER9 (raw) 0x4e1202 =
opal:skiboot-ecb1dc7 PowerNV
> > [240889.115771] NIP: =C2=A0c00000000026035c LR: c000000000260950 CTR: =
0000000000000000
> > [240889.115828] REGS: c0000000295e7330 TRAP: 0700 =C2=A0 Tainted: G =C2=
=A0 =C2=A0 =C2=A0D =C2=A0 =C2=A0OE =C2=A0 =C2=A0 =C2=A0 =C2=A0(6.18.8-200=
.fc43.ppc64le)
> > [240889.115875] MSR: =C2=A09000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,=
LE> =C2=A0CR: 24004280 =C2=A0XER: 20040000
> > [240889.115936] CFAR: c00000000026094c IRQMASK: 0
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GPR00: c000000=
000260950 c0000000295e75d0 c0000000026ba900 0000000000000005
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GPR04: 0000000=
000002710 0000000000000001 0000001ffc2d0000 0000000000000001
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GPR08: 0000000=
000000005 0000000000000001 c0000000295e7f18 0000000000004000
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GPR12: c000201=
fff18ffa8 c000001ffffde600 0000000000000000 0000000000000000
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GPR16: 0000000=
000000000 0000000000000000 0000000000000000 0000000000000000
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GPR20: 0000000=
000000000 0000000000000000 0000000000000000 0000000000000000
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GPR24: 0000000=
000000000 0000000000000000 0000000000000000 0000000000000000
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GPR28: 0000000=
000000005 0000000000000003 c000000003e3a900 c00000004555e800
> > [240889.116379] NIP [c00000000026035c] do_exit+0x5c/0x5b0
> > [240889.116407] LR [c000000000260950] make_task_dead+0xa0/0x1d0
> > [240889.116427] Call Trace:
> > [240889.116473] [c0000000295e75d0] [c0000000295e7600] 0xc0000000295e76=
00 (unreliable)
> > [240889.116549] [c0000000295e7670] [c000000000260950] make_task_dead+0=
xa0/0x1d0
> > [240889.116621] [c0000000295e76f0] [c00000000002a314] oops_end+0x164/0=
x1a0
> > [240889.116689] [c0000000295e7770] [c000000000009b2c] program_check_co=
mmon_virt+0x3bc/0x3c0
> > [240889.116749] ---- interrupt: 700 at __list_add_valid_or_report+0xdc=
/0x140
> > [240889.116799] NIP: =C2=A0c000000000e098fc LR: c000000000e098f8 CTR: =
0000000000000000
> > [240889.116838] REGS: c0000000295e77a0 TRAP: 0700 =C2=A0 Tainted: G =C2=
=A0 =C2=A0 =C2=A0D =C2=A0 =C2=A0OE =C2=A0 =C2=A0 =C2=A0 =C2=A0(6.18.8-200=
.fc43.ppc64le)
> > [240889.116905] MSR: =C2=A09000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE> =
=C2=A0CR: 24004280 =C2=A0XER: 00000000
> > [240889.116967] CFAR: c00000000034542c IRQMASK: 0
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GPR00: c000000=
000e098f8 c0000000295e7a40 c0000000026ba900 0000000000000075
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GPR04: 0000000=
0ffffbfff 0000000000000001 0000001ffc2d0000 0000000000000001
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GPR08: 0000000=
000000027 0000000000000000 0000000000000000 c0000000295e7890
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GPR12: c000201=
fff18ffa8 c000001ffffde600 c000000000299c28 c0002000113fdb40
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GPR16: 0000000=
000000000 0000000000000000 0000000000000000 0000000000000000
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GPR20: 0000000=
000000000 0000000000000000 0000000000000000 0000000000000001
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GPR24: 0000000=
000000000 c0000000295e7c70 c00000002bbce800 c000001126d57830
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GPR28: 0000000=
000000000 c000201d2995b588 c00020005f464000 c000201d2995b540
> > [240889.117343] NIP [c000000000e098fc] __list_add_valid_or_report+0xdc=
/0x140
> > [240889.117400] LR [c000000000e098f8] __list_add_valid_or_report+0xd8/=
0x140
> > [240889.117454] ---- interrupt: 700
> > [240889.117487] [c0000000295e7ab0] [c0080000238f0ad4] release_stripe_p=
lug+0x9c/0x150 [raid456]
> > [240889.117544] [c0000000295e7b00] [c0080000238f59f4] make_stripe_requ=
est+0x32c/0x560 [raid456]
> > [240889.117605] [c0000000295e7bd0] [c0080000238f5df8] raid5_make_reque=
st+0x1d0/0x610 [raid456]
> > [240889.117678] [c0000000295e7d10] [c000000001369a04] md_handle_reques=
t+0x1c4/0x400
> > [240889.117738] [c0000000295e7da0] [c000000000d04010] __submit_bio+0x2=
30/0x3d0
> > [240889.117792] [c0000000295e7e40] [c000000000d04244] __submit_bio_noa=
cct+0x94/0x250
> > [240889.117859] [c0000000295e7eb0] [c00000000138743c] dm_submit_bio_re=
map+0x4c/0x120
> > [240889.117956] [c0000000295e7ef0] [c00800001bce26a8] dmcrypt_write+0x=
1a0/0x200 [dm_crypt]
> > [240889.118017] [c0000000295e7f90] [c000000000299da8] kthread+0x188/0x=
1a0
> > [240889.118084] [c0000000295e7fe0] [c00000000000ded8] start_kernel_thr=
ead+0x14/0x18
> > [240889.118131] Code: 91610008 f8010010 f821ff61 e92d0c78 f9210078 392=
00000 892d0932 552907fe 0b090000 e95f0c68 312affff 7d295110 <0b090000> ebb=
f0b90 ebdf0b88 7fa3eb78
> > [240889.118320] ---[ end trace 0000000000000000 ]---
> > =


> > =


> > If that's any useful to reveal a bug, about the tainting module, it's =
a port of=C2=A0https://github.com/gnif/vendor-reset=C2=A0to ppc to reset s=
ome older graphics cards, nothing that should affect what the log is talki=
ng about, furthermore its been here for quite a long time without any erro=
rs.
> > =


> > =


> > Thanks
-----------------------e8879fb0755d5889eeddfd3a1a2f4966
Content-Type: multipart/related;boundary=---------------------04ae03f88bb1137945136139d41e6e0e

-----------------------04ae03f88bb1137945136139d41e6e0e
Content-Type: text/html;charset=utf-8
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IEFyaWFsLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDE0
cHg7IGNvbG9yOiByZ2IoMCwgMCwgMCk7IGJhY2tncm91bmQtY29sb3I6IHJnYigyNTUsIDI1NSwg
MjU1KTsiPkkgaGF2ZSByZW1vdmVkIG15IG91dCBvZiB0cmVlIG1vZHVsZSBvdXQgb2YgcHJlY2F1
dGlvbiBhbmQgaXQgc3RpbGwgaGFwcGVuZWQgYWdhaW4sIHRoaXMgdGltZSB1bi10YWludGVkIGtl
cm5lbDo8L2Rpdj48ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQXJpYWwsIHNhbnMtc2VyaWY7IGZv
bnQtc2l6ZTogMTRweDsgY29sb3I6IHJnYigwLCAwLCAwKTsgYmFja2dyb3VuZC1jb2xvcjogcmdi
KDI1NSwgMjU1LCAyNTUpOyI+PGJyPjwvZGl2PjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBBcmlh
bCwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxNHB4OyBjb2xvcjogcmdiKDAsIDAsIDApOyBiYWNr
Z3JvdW5kLWNvbG9yOiByZ2IoMjU1LCAyNTUsIDI1NSk7Ij48c3Bhbj5bMjQ5NjIuNzYwMjk4XSBz
ZCAxOjA6MDowOiBQb3dlci1vbiBvciBkZXZpY2UgcmVzZXQgb2NjdXJyZWQ8L3NwYW4+PGRpdj48
c3Bhbj5bMTIyNDU2LjU4MTg3OF0gJm5ic3A7c2xhYiByYWlkNi1tZDEyNSBzdGFydCBjMDAwMDAw
NjQ4N2MzMWIwIHBvaW50ZXIgb2Zmc2V0IDE2IHNpemUgMjU0NDwvc3Bhbj48L2Rpdj48ZGl2Pjxz
cGFuPlsxMjI0NTYuNTgxOTcyXSBsaXN0X2FkZCBjb3JydXB0aW9uLiBwcmV2LSZndDtuZXh0IHNo
b3VsZCBiZSBuZXh0IChjMDAwMjAwMDVhMzc2Y2UwKSwgYnV0IHdhcyBjMDAwMDAwNjQ4N2MzMWMw
LiAocHJldj1jMDAwMDAwNjQ4N2MzMWMwKS48L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj5bMTIyNDU2
LjU4MjA2OF0gLS0tLS0tLS0tLS0tWyBjdXQgaGVyZSBdLS0tLS0tLS0tLS0tPC9zcGFuPjwvZGl2
PjxkaXY+PHNwYW4+WzEyMjQ1Ni41ODIwOTddIGtlcm5lbCBCVUcgYXQgbGliL2xpc3RfZGVidWcu
YzozMiE8L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj5bMTIyNDU2LjU4MjEzMF0gT29wczogRXhjZXB0
aW9uIGluIGtlcm5lbCBtb2RlLCBzaWc6IDUgWyMxXTwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPlsx
MjI0NTYuNTgyMTg1XSBMRSBQQUdFX1NJWkU9NjRLIE1NVT1SYWRpeCAmbmJzcDtTTVAgTlJfQ1BV
Uz0yMDQ4IE5VTUEgUG93ZXJOVjwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPlsxMjI0NTYuNTgyMjMx
XSBNb2R1bGVzIGxpbmtlZCBpbjogdmhvc3RfbmV0IHZob3N0IHZob3N0X2lvdGxiIHRhcCB0dW4g
bmZ0X21hc3EgbmZ0X3JlamVjdF9pcHY0IGFjdF9jc3VtIGNsc191MzIgc2NoX2h0YiBuZl9uYXRf
dGZ0cCBuZl9jb25udHJhY2tfdGZ0cCBicmlkZ2Ugc3RwIGxsYyBrdm1faHYga3ZtIHJma2lsbCB4
dF9jb25udHJhY2sgbmZ0X2NvbXBhdCBuZnRfZmliX2luZXQgbmZ0X2ZpYl9pcHY0IG5mdF9maWJf
aXB2NiBuZnRfZmliIG5mdF9yZWplY3RfaW5ldCBuZl9yZWplY3RfaXB2NCBuZl9yZWplY3RfaXB2
NiBuZnRfcmVqZWN0IG5mdF9jdCBuZnRfY2hhaW5fbmF0IG5mX25hdCBuZl9jb25udHJhY2sgbmZf
ZGVmcmFnX2lwdjYgbmZfZGVmcmFnX2lwdjQgbmZfdGFibGVzIGRtX2NhY2hlX3NtcSBkbV9jYWNo
ZSByYWlkNDU2IGFzeW5jX3JhaWQ2X3JlY292IGFzeW5jX21lbWNweSBhc3luY19wcSBhc3luY194
b3IgYXN5bmNfdHggc3VucnBjIHJhaWQxMCBzbmRfaGRhX2ludGVsIHNuZF9pbnRlbF9kc3BjZmcg
c25kX2hkYV9jb2RlYyBzbmRfaGRhX2NvcmUgam95ZGV2IHNuZF9od2RlcCBzbmRfc2VxIHNuZF9z
ZXFfZGV2aWNlIGF0MjQgb25ib2FyZF91c2JfZGV2IHNuZF9wY20gc25kX3RpbWVyIGF0bGFudGlj
IHRnMyBzbmQgb2ZwYXJ0IGlwbWlfcG93ZXJudiBtYWNzZWMgc291bmRjb3JlIHBvd2VybnZfZmxh
c2ggaXBtaV9kZXZpbnRmIG10ZCBpcG1pX21zZ2hhbmRsZXIgdm14X2NyeXB0byBvcGFsX3ByZCBy
dGNfb3BhbCBpMmNfb3BhbCBmdXNlIGRtX211bHRpcGF0aCBsb29wIG5mbmV0bGluayB6cmFtIGx6
NGhjX2NvbXByZXNzIGx6NF9jb21wcmVzcyB4ZnMgZG1fdGhpbl9wb29sIGRtX3BlcnNpc3RlbnRf
ZGF0YSBkbV9iaW9fcHJpc29uIGRtX2NyeXB0IHJhaWQxIG52bWUgbnZtZV9jb3JlIHVhcyB1c2Jf
c3RvcmFnZSBudm1lX2tleXJpbmcgbXB0M3NhcyBudm1lX2F1dGggaGtkZiBhc3QgcmFpZF9jbGFz
cyBzY3NpX3RyYW5zcG9ydF9zYXMgaTJjX2FsZ29fYml0IHNjc2lfZGhfcmRhYzwvc3Bhbj48L2Rp
dj48ZGl2PjxzcGFuPlsxMjI0NTYuNTgyNDY3XSAmbmJzcDtzY3NpX2RoX2VtYyBzY3NpX2RoX2Fs
dWEgaTJjX2RldiBhZXNfZ2NtX3AxMF9jcnlwdG8gY3J5cHRvX3NpbWQgY3J5cHRkPC9zcGFuPjwv
ZGl2PjxkaXY+PHNwYW4+WzEyMjQ1Ni41ODMxMTldIENQVTogNSBVSUQ6IDAgUElEOiAyNjk3IENv
bW06IGRtY3J5cHRfd3JpdGUvMiBOb3QgdGFpbnRlZCA2LjE4LjgtMjAwLmZjNDMucHBjNjRsZSAj
MSBQUkVFTVBUKHZvbHVudGFyeSkgPC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+WzEyMjQ1Ni41ODMy
MTZdIEhhcmR3YXJlIG5hbWU6IFQyUDlEMDEgUkVWIDEuMDAgUE9XRVI5IChyYXcpIDB4NGUxMjAy
IG9wYWw6c2tpYm9vdC1lY2IxZGM3IFBvd2VyTlY8L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj5bMTIy
NDU2LjU4MzI5Ml0gTklQOiAmbmJzcDtjMDAwMDAwMDAwZTA5OGZjIExSOiBjMDAwMDAwMDAwZTA5
OGY4IENUUjogMDAwMDAwMDAwMDAwMDAwMDwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPlsxMjI0NTYu
NTgzMzcwXSBSRUdTOiBjMDAwMDAwMDNjOTg3N2EwIFRSQVA6IDA3MDAgJm5ic3A7IE5vdCB0YWlu
dGVkICZuYnNwOyg2LjE4LjgtMjAwLmZjNDMucHBjNjRsZSk8L3NwYW4+PC9kaXY+PGRpdj48c3Bh
bj5bMTIyNDU2LjU4MzQzMl0gTVNSOiAmbmJzcDs5MDAwMDAwMDAyODJiMDMzICZsdDtTRixIVixW
RUMsVlNYLEVFLEZQLE1FLElSLERSLFJJLExFJmd0OyAmbmJzcDtDUjogMjQwMDQyNDAgJm5ic3A7
WEVSOiAwMDAwMDE1Njwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPlsxMjI0NTYuNTgzNDk4XSBDRkFS
OiBjMDAwMDAwMDAwMzQ1NDJjIElSUU1BU0s6IDAgPC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+Jm5i
c3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyBHUFIw
MDogYzAwMDAwMDAwMGUwOThmOCBjMDAwMDAwMDNjOTg3YTQwIGMwMDAwMDAwMDI2YmE5MDAgMDAw
MDAwMDAwMDAwMDA3NSA8L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj4mbmJzcDsgJm5ic3A7ICZuYnNw
OyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7IEdQUjA0OiAwMDAwMDAwMGZmZmZi
ZmZmIDAwMDAwMDAwMDAwMDAwMDEgMDAwMDIwMWZmNzFhMDAwMCAwMDAwMDAwMDAwMDAwMDAxIDwv
c3Bhbj48L2Rpdj48ZGl2PjxzcGFuPiZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsg
Jm5ic3A7ICZuYnNwOyAmbmJzcDsgR1BSMDg6IDAwMDAwMDAwMDAwMDAwMjcgMDAwMDAwMDAwMDAw
MDAwMCAwMDAwMDAwMDAwMDAwMDAwIGMwMDAwMDAwM2M5ODc4OTAgPC9zcGFuPjwvZGl2PjxkaXY+
PHNwYW4+Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZu
YnNwOyBHUFIxMjogYzAwMDIwMWZmZjE4ZmZhOCBjMDAwMjAxZmZmN2U4MTgwIGMwMDAwMDAwMDAy
OTljMjggYzAwMDAwMDAwNWFiYTc4MCA8L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj4mbmJzcDsgJm5i
c3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7IEdQUjE2OiAwMDAw
MDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMDAw
MDAwMDAwIDwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPiZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNw
OyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgR1BSMjA6IDAwMDAwMDAwMDAwMDAwMDAgMDAw
MDAwMDAwMDAwMDAwMCAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDEgPC9zcGFuPjwv
ZGl2PjxkaXY+PHNwYW4+Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsg
Jm5ic3A7ICZuYnNwOyBHUFIyNDogMDAwMDAwMDAwMDAwMDAwMCBjMDAwMDAwMDNjOTg3YzcwIGMw
MDAyMDAwNjA1Mzk4MDAgYzAwMDIwMDYxOGVkZGIzMCA8L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj4m
bmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7IEdQ
UjI4OiAwMDAwMDAwMDAwMDAwMDAwIGMwMDAyMDE0ODVjYmU3MzggYzAwMDAwMDAzYmQ0MjgwMCBj
MDAwMjAxNDg1Y2JlNmYwIDwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPlsxMjI0NTYuNTgzOTY4XSBO
SVAgW2MwMDAwMDAwMDBlMDk4ZmNdIF9fbGlzdF9hZGRfdmFsaWRfb3JfcmVwb3J0KzB4ZGMvMHgx
NDA8L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj5bMTIyNDU2LjU4NDA0NV0gTFIgW2MwMDAwMDAwMDBl
MDk4ZjhdIF9fbGlzdF9hZGRfdmFsaWRfb3JfcmVwb3J0KzB4ZDgvMHgxNDA8L3NwYW4+PC9kaXY+
PGRpdj48c3Bhbj5bMTIyNDU2LjU4NDA5M10gQ2FsbCBUcmFjZTo8L3NwYW4+PC9kaXY+PGRpdj48
c3Bhbj5bMTIyNDU2LjU4NDExNV0gW2MwMDAwMDAwM2M5ODdhNDBdIFtjMDAwMDAwMDAwZTA5OGY4
XSBfX2xpc3RfYWRkX3ZhbGlkX29yX3JlcG9ydCsweGQ4LzB4MTQwICh1bnJlbGlhYmxlKTwvc3Bh
bj48L2Rpdj48ZGl2PjxzcGFuPlsxMjI0NTYuNTg0MTg5XSBbYzAwMDAwMDAzYzk4N2FiMF0gW2Mw
MDgwMDAwMjZlOTBhZDRdIHJlbGVhc2Vfc3RyaXBlX3BsdWcrMHg5Yy8weDE1MCBbcmFpZDQ1Nl08
L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj5bMTIyNDU2LjU4NDI1OF0gW2MwMDAwMDAwM2M5ODdiMDBd
IFtjMDA4MDAwMDI2ZTk1OWY0XSBtYWtlX3N0cmlwZV9yZXF1ZXN0KzB4MzJjLzB4NTYwIFtyYWlk
NDU2XTwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPlsxMjI0NTYuNTg0MzMzXSBbYzAwMDAwMDAzYzk4
N2JkMF0gW2MwMDgwMDAwMjZlOTVkZjhdIHJhaWQ1X21ha2VfcmVxdWVzdCsweDFkMC8weDYxMCBb
cmFpZDQ1Nl08L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj5bMTIyNDU2LjU4NDQxOF0gW2MwMDAwMDAw
M2M5ODdkMTBdIFtjMDAwMDAwMDAxMzY5YTA0XSBtZF9oYW5kbGVfcmVxdWVzdCsweDFjNC8weDQw
MDwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPlsxMjI0NTYuNTg0NDg0XSBbYzAwMDAwMDAzYzk4N2Rh
MF0gW2MwMDAwMDAwMDBkMDQwMTBdIF9fc3VibWl0X2JpbysweDIzMC8weDNkMDwvc3Bhbj48L2Rp
dj48ZGl2PjxzcGFuPlsxMjI0NTYuNTg0NTYwXSBbYzAwMDAwMDAzYzk4N2U0MF0gW2MwMDAwMDAw
MDBkMDQyNDRdIF9fc3VibWl0X2Jpb19ub2FjY3QrMHg5NC8weDI1MDwvc3Bhbj48L2Rpdj48ZGl2
PjxzcGFuPlsxMjI0NTYuNTg0NjM1XSBbYzAwMDAwMDAzYzk4N2ViMF0gW2MwMDAwMDAwMDEzODc0
M2NdIGRtX3N1Ym1pdF9iaW9fcmVtYXArMHg0Yy8weDEyMDwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFu
PlsxMjI0NTYuNTg0Njk4XSBbYzAwMDAwMDAzYzk4N2VmMF0gW2MwMDgwMDAwMWRjMjI2YThdIGRt
Y3J5cHRfd3JpdGUrMHgxYTAvMHgyMDAgW2RtX2NyeXB0XTwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFu
PlsxMjI0NTYuNTg0NzY1XSBbYzAwMDAwMDAzYzk4N2Y5MF0gW2MwMDAwMDAwMDAyOTlkYThdIGt0
aHJlYWQrMHgxODgvMHgxYTA8L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj5bMTIyNDU2LjU4NDgxOF0g
W2MwMDAwMDAwM2M5ODdmZTBdIFtjMDAwMDAwMDAwMDBkZWQ4XSBzdGFydF9rZXJuZWxfdGhyZWFk
KzB4MTQvMHgxODwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPlsxMjI0NTYuNTg0ODc5XSBDb2RlOiBm
OGMxMDA2MCBmODAxMDA4MCA0Yjg4M2IzNSA2MDAwMDAwMCAzYzYyZmY4MiAzODYzOTM4OCBlOGMx
MDA2MCBlOTIxMDA2OCBlOGE2MDAwMCA3ZDI0NGI3OCA0YjUzYmFmNSA2MDAwMDAwMCAmbHQ7MGZl
MDAwMDAmZ3Q7IDdjMDgwMmE2IDdjODUyMzc4IDdjNjQxYjc4IDwvc3Bhbj48L2Rpdj48ZGl2Pjxz
cGFuPlsxMjI0NTYuNTg1MDE1XSAtLS1bIGVuZCB0cmFjZSAwMDAwMDAwMDAwMDAwMDAwIF0tLS08
L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj5bMTIyNDU3LjE2MjA3NF0gcHN0b3JlOiBiYWNrZW5kIChu
dnJhbSkgd3JpdGluZyBlcnJvciAoLTEpPC9zcGFuPjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+
PHNwYW4+WzEyMjQ1Ny4xNjIxNDFdIG5vdGU6IGRtY3J5cHRfd3JpdGUvMlsyNjk3XSBleGl0ZWQg
d2l0aCBpcnFzIGRpc2FibGVkPC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+WzEyMjQ1Ny4xNjIyMTRd
IC0tLS0tLS0tLS0tLVsgY3V0IGhlcmUgXS0tLS0tLS0tLS0tLTwvc3Bhbj48L2Rpdj48ZGl2Pjxz
cGFuPlsxMjI0NTcuMTYyMjU3XSBXQVJOSU5HOiBDUFU6IDUgUElEOiAyNjk3IGF0IGtlcm5lbC9l
eGl0LmM6OTAzIGRvX2V4aXQrMHg1Yy8weDViMDwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPlsxMjI0
NTcuMTYyMzE0XSBNb2R1bGVzIGxpbmtlZCBpbjogdmhvc3RfbmV0IHZob3N0IHZob3N0X2lvdGxi
IHRhcCB0dW4gbmZ0X21hc3EgbmZ0X3JlamVjdF9pcHY0IGFjdF9jc3VtIGNsc191MzIgc2NoX2h0
YiBuZl9uYXRfdGZ0cCBuZl9jb25udHJhY2tfdGZ0cCBicmlkZ2Ugc3RwIGxsYyBrdm1faHYga3Zt
IHJma2lsbCB4dF9jb25udHJhY2sgbmZ0X2NvbXBhdCBuZnRfZmliX2luZXQgbmZ0X2ZpYl9pcHY0
IG5mdF9maWJfaXB2NiBuZnRfZmliIG5mdF9yZWplY3RfaW5ldCBuZl9yZWplY3RfaXB2NCBuZl9y
ZWplY3RfaXB2NiBuZnRfcmVqZWN0IG5mdF9jdCBuZnRfY2hhaW5fbmF0IG5mX25hdCBuZl9jb25u
dHJhY2sgbmZfZGVmcmFnX2lwdjYgbmZfZGVmcmFnX2lwdjQgbmZfdGFibGVzIGRtX2NhY2hlX3Nt
cSBkbV9jYWNoZSByYWlkNDU2IGFzeW5jX3JhaWQ2X3JlY292IGFzeW5jX21lbWNweSBhc3luY19w
cSBhc3luY194b3IgYXN5bmNfdHggc3VucnBjIHJhaWQxMCBzbmRfaGRhX2ludGVsIHNuZF9pbnRl
bF9kc3BjZmcgc25kX2hkYV9jb2RlYyBzbmRfaGRhX2NvcmUgam95ZGV2IHNuZF9od2RlcCBzbmRf
c2VxIHNuZF9zZXFfZGV2aWNlIGF0MjQgb25ib2FyZF91c2JfZGV2IHNuZF9wY20gc25kX3RpbWVy
IGF0bGFudGljIHRnMyBzbmQgb2ZwYXJ0IGlwbWlfcG93ZXJudiBtYWNzZWMgc291bmRjb3JlIHBv
d2VybnZfZmxhc2ggaXBtaV9kZXZpbnRmIG10ZCBpcG1pX21zZ2hhbmRsZXIgdm14X2NyeXB0byBv
cGFsX3ByZCBydGNfb3BhbCBpMmNfb3BhbCBmdXNlIGRtX211bHRpcGF0aCBsb29wIG5mbmV0bGlu
ayB6cmFtIGx6NGhjX2NvbXByZXNzIGx6NF9jb21wcmVzcyB4ZnMgZG1fdGhpbl9wb29sIGRtX3Bl
cnNpc3RlbnRfZGF0YSBkbV9iaW9fcHJpc29uIGRtX2NyeXB0IHJhaWQxIG52bWUgbnZtZV9jb3Jl
IHVhcyB1c2Jfc3RvcmFnZSBudm1lX2tleXJpbmcgbXB0M3NhcyBudm1lX2F1dGggaGtkZiBhc3Qg
cmFpZF9jbGFzcyBzY3NpX3RyYW5zcG9ydF9zYXMgaTJjX2FsZ29fYml0IHNjc2lfZGhfcmRhYzwv
c3Bhbj48L2Rpdj48ZGl2PjxzcGFuPlsxMjI0NTcuMTYyNDU5XSAmbmJzcDtzY3NpX2RoX2VtYyBz
Y3NpX2RoX2FsdWEgaTJjX2RldiBhZXNfZ2NtX3AxMF9jcnlwdG8gY3J5cHRvX3NpbWQgY3J5cHRk
PC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+WzEyMjQ1Ny4xNjMwMTFdIENQVTogNSBVSUQ6IDAgUElE
OiAyNjk3IENvbW06IGRtY3J5cHRfd3JpdGUvMiBUYWludGVkOiBHICZuYnNwOyAmbmJzcDsgJm5i
c3A7RCAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyA2LjE4LjgtMjAw
LmZjNDMucHBjNjRsZSAjMSBQUkVFTVBUKHZvbHVudGFyeSkgPC9zcGFuPjwvZGl2PjxkaXY+PHNw
YW4+WzEyMjQ1Ny4xNjMxMjNdIFRhaW50ZWQ6IFtEXT1ESUU8L3NwYW4+PC9kaXY+PGRpdj48c3Bh
bj5bMTIyNDU3LjE2MzE3MV0gSGFyZHdhcmUgbmFtZTogVDJQOUQwMSBSRVYgMS4wMCBQT1dFUjkg
KHJhdykgMHg0ZTEyMDIgb3BhbDpza2lib290LWVjYjFkYzcgUG93ZXJOVjwvc3Bhbj48L2Rpdj48
ZGl2PjxzcGFuPlsxMjI0NTcuMTYzMjQwXSBOSVA6ICZuYnNwO2MwMDAwMDAwMDAyNjAzNWMgTFI6
IGMwMDAwMDAwMDAyNjA5NTAgQ1RSOiAwMDAwMDAwMDAwMDAwMDAwPC9zcGFuPjwvZGl2PjxkaXY+
PHNwYW4+WzEyMjQ1Ny4xNjMzMjJdIFJFR1M6IGMwMDAwMDAwM2M5ODczMzAgVFJBUDogMDcwMCAm
bmJzcDsgVGFpbnRlZDogRyAmbmJzcDsgJm5ic3A7ICZuYnNwO0QgJm5ic3A7ICZuYnNwOyAmbmJz
cDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7KDYuMTguOC0yMDAuZmM0My5wcGM2NGxlKTwv
c3Bhbj48L2Rpdj48ZGl2PjxzcGFuPlsxMjI0NTcuMTYzNDA2XSBNU1I6ICZuYnNwOzkwMDAwMDAw
MDIwMjkwMzMgJmx0O1NGLEhWLFZFQyxFRSxNRSxJUixEUixSSSxMRSZndDsgJm5ic3A7Q1I6IDI0
MDA0MjQwICZuYnNwO1hFUjogMjAwNDAxNTY8L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj5bMTIyNDU3
LjE2MzUwMV0gQ0ZBUjogYzAwMDAwMDAwMDI2MDk0YyBJUlFNQVNLOiAwIDwvc3Bhbj48L2Rpdj48
ZGl2PjxzcGFuPiZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNw
OyAmbmJzcDsgR1BSMDA6IGMwMDAwMDAwMDAyNjA5NTAgYzAwMDAwMDAzYzk4NzVkMCBjMDAwMDAw
MDAyNmJhOTAwIDAwMDAwMDAwMDAwMDAwMDUgPC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+Jm5ic3A7
ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyBHUFIwNDog
MDAwMDAwMDAwMDAwMjcxMCAwMDAwMDAwMDAwMDAwMDAxIDAwMDAyMDFmZjcxYTAwMDAgMDAwMDAw
MDAwMDAwMDAwMSA8L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj4mbmJzcDsgJm5ic3A7ICZuYnNwOyAm
bmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7IEdQUjA4OiAwMDAwMDAwMDAwMDAwMDA1
IDAwMDAwMDAwMDAwMDAwMDEgYzAwMDAwMDAzYzk4N2YxOCAwMDAwMDAwMDAwMDA0MDAwIDwvc3Bh
bj48L2Rpdj48ZGl2PjxzcGFuPiZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5i
c3A7ICZuYnNwOyAmbmJzcDsgR1BSMTI6IGMwMDAyMDFmZmYxOGZmYTggYzAwMDIwMWZmZjdlODE4
MCAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDAgPC9zcGFuPjwvZGl2PjxkaXY+PHNw
YW4+Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNw
OyBHUFIxNjogMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAw
MDAgMDAwMDAwMDAwMDAwMDAwMCA8L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj4mbmJzcDsgJm5ic3A7
ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7IEdQUjIwOiAwMDAwMDAw
MDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMDAwMDAw
MDAwIDwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPiZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAm
bmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgR1BSMjQ6IDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAw
MDAwMDAwMDAwMCAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDAgPC9zcGFuPjwvZGl2
PjxkaXY+PHNwYW4+Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5i
c3A7ICZuYnNwOyBHUFIyODogMDAwMDAwMDAwMDAwMDAwNSAwMDAwMDAwMDAwMDAwMDAzIGMwMDAw
MDAwMDNlM2E5MDAgYzAwMDAwMDAxYmUyYTAwMCA8L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj5bMTIy
NDU3LjE2Mzk4NF0gTklQIFtjMDAwMDAwMDAwMjYwMzVjXSBkb19leGl0KzB4NWMvMHg1YjA8L3Nw
YW4+PC9kaXY+PGRpdj48c3Bhbj5bMTIyNDU3LjE2NDAzN10gTFIgW2MwMDAwMDAwMDAyNjA5NTBd
IG1ha2VfdGFza19kZWFkKzB4YTAvMHgxZDA8L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj5bMTIyNDU3
LjE2NDA3OV0gQ2FsbCBUcmFjZTo8L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj5bMTIyNDU3LjE2NDEy
Nl0gW2MwMDAwMDAwM2M5ODc1ZDBdIFtjMDAwMDAwMDNjOTg3NjAwXSAweGMwMDAwMDAwM2M5ODc2
MDAgKHVucmVsaWFibGUpPC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+WzEyMjQ1Ny4xNjQyMTZdIFtj
MDAwMDAwMDNjOTg3NjcwXSBbYzAwMDAwMDAwMDI2MDk1MF0gbWFrZV90YXNrX2RlYWQrMHhhMC8w
eDFkMDwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPlsxMjI0NTcuMTY0Mjc2XSBbYzAwMDAwMDAzYzk4
NzZmMF0gW2MwMDAwMDAwMDAwMmEzMTRdIG9vcHNfZW5kKzB4MTY0LzB4MWEwPC9zcGFuPjwvZGl2
PjxkaXY+PHNwYW4+WzEyMjQ1Ny4xNjQzMzZdIFtjMDAwMDAwMDNjOTg3NzcwXSBbYzAwMDAwMDAw
MDAwOWIyY10gcHJvZ3JhbV9jaGVja19jb21tb25fdmlydCsweDNiYy8weDNjMDwvc3Bhbj48L2Rp
dj48ZGl2PjxzcGFuPlsxMjI0NTcuMTY0Mzk5XSAtLS0tIGludGVycnVwdDogNzAwIGF0IF9fbGlz
dF9hZGRfdmFsaWRfb3JfcmVwb3J0KzB4ZGMvMHgxNDA8L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj5b
MTIyNDU3LjE2NDQ1NF0gTklQOiAmbmJzcDtjMDAwMDAwMDAwZTA5OGZjIExSOiBjMDAwMDAwMDAw
ZTA5OGY4IENUUjogMDAwMDAwMDAwMDAwMDAwMDwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPlsxMjI0
NTcuMTY0NTA5XSBSRUdTOiBjMDAwMDAwMDNjOTg3N2EwIFRSQVA6IDA3MDAgJm5ic3A7IFRhaW50
ZWQ6IEcgJm5ic3A7ICZuYnNwOyAmbmJzcDtEICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAm
bmJzcDsgJm5ic3A7ICZuYnNwOyg2LjE4LjgtMjAwLmZjNDMucHBjNjRsZSk8L3NwYW4+PC9kaXY+
PGRpdj48c3Bhbj5bMTIyNDU3LjE2NDU3NV0gTVNSOiAmbmJzcDs5MDAwMDAwMDAyODJiMDMzICZs
dDtTRixIVixWRUMsVlNYLEVFLEZQLE1FLElSLERSLFJJLExFJmd0OyAmbmJzcDtDUjogMjQwMDQy
NDAgJm5ic3A7WEVSOiAwMDAwMDE1Njwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPlsxMjI0NTcuMTY0
NjU0XSBDRkFSOiBjMDAwMDAwMDAwMzQ1NDJjIElSUU1BU0s6IDAgPC9zcGFuPjwvZGl2PjxkaXY+
PHNwYW4+Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZu
YnNwOyBHUFIwMDogYzAwMDAwMDAwMGUwOThmOCBjMDAwMDAwMDNjOTg3YTQwIGMwMDAwMDAwMDI2
YmE5MDAgMDAwMDAwMDAwMDAwMDA3NSA8L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj4mbmJzcDsgJm5i
c3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7IEdQUjA0OiAwMDAw
MDAwMGZmZmZiZmZmIDAwMDAwMDAwMDAwMDAwMDEgMDAwMDIwMWZmNzFhMDAwMCAwMDAwMDAwMDAw
MDAwMDAxIDwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPiZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNw
OyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgR1BSMDg6IDAwMDAwMDAwMDAwMDAwMjcgMDAw
MDAwMDAwMDAwMDAwMCAwMDAwMDAwMDAwMDAwMDAwIGMwMDAwMDAwM2M5ODc4OTAgPC9zcGFuPjwv
ZGl2PjxkaXY+PHNwYW4+Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsg
Jm5ic3A7ICZuYnNwOyBHUFIxMjogYzAwMDIwMWZmZjE4ZmZhOCBjMDAwMjAxZmZmN2U4MTgwIGMw
MDAwMDAwMDAyOTljMjggYzAwMDAwMDAwNWFiYTc4MCA8L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj4m
bmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7IEdQ
UjE2OiAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAwMDAwMCAw
MDAwMDAwMDAwMDAwMDAwIDwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPiZuYnNwOyAmbmJzcDsgJm5i
c3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgR1BSMjA6IDAwMDAwMDAwMDAw
MDAwMDAgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDEg
PC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNw
OyAmbmJzcDsgJm5ic3A7ICZuYnNwOyBHUFIyNDogMDAwMDAwMDAwMDAwMDAwMCBjMDAwMDAwMDNj
OTg3YzcwIGMwMDAyMDAwNjA1Mzk4MDAgYzAwMDIwMDYxOGVkZGIzMCA8L3NwYW4+PC9kaXY+PGRp
dj48c3Bhbj4mbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsg
Jm5ic3A7IEdQUjI4OiAwMDAwMDAwMDAwMDAwMDAwIGMwMDAyMDE0ODVjYmU3MzggYzAwMDAwMDAz
YmQ0MjgwMCBjMDAwMjAxNDg1Y2JlNmYwIDwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPlsxMjI0NTcu
MTY1MTQ4XSBOSVAgW2MwMDAwMDAwMDBlMDk4ZmNdIF9fbGlzdF9hZGRfdmFsaWRfb3JfcmVwb3J0
KzB4ZGMvMHgxNDA8L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj5bMTIyNDU3LjE2NTE5MV0gTFIgW2Mw
MDAwMDAwMDBlMDk4ZjhdIF9fbGlzdF9hZGRfdmFsaWRfb3JfcmVwb3J0KzB4ZDgvMHgxNDA8L3Nw
YW4+PC9kaXY+PGRpdj48c3Bhbj5bMTIyNDU3LjE2NTIzM10gLS0tLSBpbnRlcnJ1cHQ6IDcwMDwv
c3Bhbj48L2Rpdj48ZGl2PjxzcGFuPlsxMjI0NTcuMTY1MjczXSBbYzAwMDAwMDAzYzk4N2FiMF0g
W2MwMDgwMDAwMjZlOTBhZDRdIHJlbGVhc2Vfc3RyaXBlX3BsdWcrMHg5Yy8weDE1MCBbcmFpZDQ1
Nl08L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj5bMTIyNDU3LjE2NTM1OF0gW2MwMDAwMDAwM2M5ODdi
MDBdIFtjMDA4MDAwMDI2ZTk1OWY0XSBtYWtlX3N0cmlwZV9yZXF1ZXN0KzB4MzJjLzB4NTYwIFty
YWlkNDU2XTwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPlsxMjI0NTcuMTY1NDA1XSBbYzAwMDAwMDAz
Yzk4N2JkMF0gW2MwMDgwMDAwMjZlOTVkZjhdIHJhaWQ1X21ha2VfcmVxdWVzdCsweDFkMC8weDYx
MCBbcmFpZDQ1Nl08L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj5bMTIyNDU3LjE2NTQ4MV0gW2MwMDAw
MDAwM2M5ODdkMTBdIFtjMDAwMDAwMDAxMzY5YTA0XSBtZF9oYW5kbGVfcmVxdWVzdCsweDFjNC8w
eDQwMDwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPlsxMjI0NTcuMTY1NTQ1XSBbYzAwMDAwMDAzYzk4
N2RhMF0gW2MwMDAwMDAwMDBkMDQwMTBdIF9fc3VibWl0X2JpbysweDIzMC8weDNkMDwvc3Bhbj48
L2Rpdj48ZGl2PjxzcGFuPlsxMjI0NTcuMTY1NTkzXSBbYzAwMDAwMDAzYzk4N2U0MF0gW2MwMDAw
MDAwMDBkMDQyNDRdIF9fc3VibWl0X2Jpb19ub2FjY3QrMHg5NC8weDI1MDwvc3Bhbj48L2Rpdj48
ZGl2PjxzcGFuPlsxMjI0NTcuMTY1NjQ4XSBbYzAwMDAwMDAzYzk4N2ViMF0gW2MwMDAwMDAwMDEz
ODc0M2NdIGRtX3N1Ym1pdF9iaW9fcmVtYXArMHg0Yy8weDEyMDwvc3Bhbj48L2Rpdj48ZGl2Pjxz
cGFuPlsxMjI0NTcuMTY1NzQ0XSBbYzAwMDAwMDAzYzk4N2VmMF0gW2MwMDgwMDAwMWRjMjI2YThd
IGRtY3J5cHRfd3JpdGUrMHgxYTAvMHgyMDAgW2RtX2NyeXB0XTwvc3Bhbj48L2Rpdj48ZGl2Pjxz
cGFuPlsxMjI0NTcuMTY1ODMyXSBbYzAwMDAwMDAzYzk4N2Y5MF0gW2MwMDAwMDAwMDAyOTlkYThd
IGt0aHJlYWQrMHgxODgvMHgxYTA8L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj5bMTIyNDU3LjE2NTg4
OV0gW2MwMDAwMDAwM2M5ODdmZTBdIFtjMDAwMDAwMDAwMDBkZWQ4XSBzdGFydF9rZXJuZWxfdGhy
ZWFkKzB4MTQvMHgxODwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPlsxMjI0NTcuMTY1OTYwXSBDb2Rl
OiA5MTYxMDAwOCBmODAxMDAxMCBmODIxZmY2MSBlOTJkMGM3OCBmOTIxMDA3OCAzOTIwMDAwMCA4
OTJkMDkzMiA1NTI5MDdmZSAwYjA5MDAwMCBlOTVmMGM2OCAzMTJhZmZmZiA3ZDI5NTExMCAmbHQ7
MGIwOTAwMDAmZ3Q7IGViYmYwYjkwIGViZGYwYjg4IDdmYTNlYjc4IDwvc3Bhbj48L2Rpdj48ZGl2
PjxzcGFuPlsxMjI0NTcuMTY2MDY1XSAtLS1bIGVuZCB0cmFjZSAwMDAwMDAwMDAwMDAwMDAwIF0t
LS08L3NwYW4+PC9kaXY+PHNwYW4+PC9zcGFuPjxicj48L2Rpdj48ZGl2IGNsYXNzPSJwcm90b25t
YWlsX3F1b3RlIj4KICAgICAgICBPbiBNb25kYXksIEZlYnJ1YXJ5IDl0aCwgMjAyNiBhdCAxMjoz
OCBBTSwgamZpdXNkcSAmbHQ7amZpdXNkcUBwcm90b24ubWUmZ3Q7IHdyb3RlOjxicj4KICAgICAg
ICA8YmxvY2txdW90ZSBjbGFzcz0icHJvdG9ubWFpbF9xdW90ZSIgdHlwZT0iY2l0ZSI+CiAgICAg
ICAgICAgIDxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBBcmlhbCwgc2Fucy1zZXJpZjsgZm9udC1z
aXplOiAxNHB4OyBjb2xvcjogcmdiKDAsIDAsIDApOyBiYWNrZ3JvdW5kLWNvbG9yOiByZ2IoMjU1
LCAyNTUsIDI1NSk7Ij5Tb3JyeSBmb3IgZHVwbGljYXRlIGJ1dCBpdCBoYXBwZW5lZCBhZnRlciBh
IGRpc2sgc3RhcnRlZCBmYWlsaW5nIGR1cmluZyBhIGNoZWNrIHRoYXQgd2FzIHRyaWdnZXJlZCBv
biBhbGwgbXkgMyBSQUlEIGFycmF5cyBhbmQgdGhlbiBhZnRlciBhIGdvb2Qgd2hpbGUgdGhpcyBi
dWcgaGFwcGVuZWQuIFRoYXQncyBiYXNpY2FsbHkgaXQuPC9kaXY+PGRpdiBzdHlsZT0iZm9udC1m
YW1pbHk6IEFyaWFsLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDE0cHg7IGNvbG9yOiByZ2IoMCwg
MCwgMCk7IGJhY2tncm91bmQtY29sb3I6IHJnYigyNTUsIDI1NSwgMjU1KTsiPjxicj48L2Rpdj48
ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQXJpYWwsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTRw
eDsgY29sb3I6IHJnYigwLCAwLCAwKTsgYmFja2dyb3VuZC1jb2xvcjogcmdiKDI1NSwgMjU1LCAy
NTUpOyI+PHNwYW4+WzE1NDA0My4xMDU4MzddIG1kOiBjaGVjayBvZiBSQUlEIGFycmF5IG1kMTI1
PC9zcGFuPjxkaXY+PHNwYW4+WzE1NDA0OS40MzIyMjVdIG1kOiBjaGVjayBvZiBSQUlEIGFycmF5
IG1kMTI2PC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+WzE1NDA1NS43MTgxOTZdIG1kOiBjaGVjayBv
ZiBSQUlEIGFycmF5IG1kMTI3PC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+WzE2MzEwMS4wMDE1NzJd
IHNkIDE6MDowOjA6IFtzZGFdIHRhZyM4MDY5IEZBSUxFRCBSZXN1bHQ6IGhvc3RieXRlPURJRF9T
T0ZUX0VSUk9SIGRyaXZlcmJ5dGU9RFJJVkVSX09LIGNtZF9hZ2U9MHM8L3NwYW4+PC9kaXY+PGRp
dj48c3Bhbj5bMTYzMTAxLjAwMTY1NV0gc2QgMTowOjA6MDogW3NkYV0gdGFnIzgwNjkgQ0RCOiBS
ZWFkKDEwKSAyOCAwMCAxYiAyOCBkMSA4MCAwMCAwMiA4MCAwMDwvc3Bhbj48L2Rpdj48ZGl2Pjxz
cGFuPlsxNjMxMDEuMDAxNjkxXSBJL08gZXJyb3IsIGRldiBzZGEsIHNlY3RvciA0NTU2NTk5MDQg
b3AgMHgwOihSRUFEKSBmbGFncyAweDgwNzAwIHBoeXNfc2VnIDUgcHJpbyBjbGFzcyAyPC9zcGFu
PjwvZGl2PjxkaXY+PHNwYW4+WzE2MzEwMS40MTI3MTRdIHNkIDE6MDowOjA6IFBvd2VyLW9uIG9y
IGRldmljZSByZXNldCBvY2N1cnJlZDwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPlsxNjMxMDEuNjk4
NzU5XSBzZCAxOjA6MDowOiBbc2RhXSB0YWcjNzcyOCBGQUlMRUQgUmVzdWx0OiBob3N0Ynl0ZT1E
SURfU09GVF9FUlJPUiBkcml2ZXJieXRlPURSSVZFUl9PSyBjbWRfYWdlPTBzPC9zcGFuPjwvZGl2
PjxkaXY+PHNwYW4+WzE2MzEwMS42OTg4MTNdIHNkIDE6MDowOjA6IFtzZGFdIHRhZyM3NzI4IENE
QjogUmVhZCgxMCkgMjggMDAgNzQgNzAgNmQgMDAgMDAgMDAgODAgMDA8L3NwYW4+PC9kaXY+PGRp
dj48c3Bhbj5bMTYzMTAxLjY5ODg0M10gSS9PIGVycm9yLCBkZXYgc2RhLCBzZWN0b3IgMTk1MzUy
NDk5MiBvcCAweDA6KFJFQUQpIGZsYWdzIDB4ODA3MDAgcGh5c19zZWcgMSBwcmlvIGNsYXNzIDI8
L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj5bMTYzMTAyLjE2MjY5M10gc2QgMTowOjA6MDogUG93ZXIt
b24gb3IgZGV2aWNlIHJlc2V0IG9jY3VycmVkPC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+WzE2MzEw
Mi40NDc2NDhdIHNkIDE6MDowOjA6IFtzZGFdIFVuYWxpZ25lZCBwYXJ0aWFsIGNvbXBsZXRpb24g
KHJlc2lkPTg2NjMwMCwgc2VjdG9yX3N6PTUxMik8L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj5bMTYz
MTAyLjQ0NzcyM10gc2QgMTowOjA6MDogW3NkYV0gdGFnIzgwNDkgQ0RCOiBSZWFkKDEwKSAyOCAw
MCA1ZSAyMSBkNCAwMCAwMCAwOCAwMCAwMDwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPlsxNjMxMDIu
NDQ3NzUxXSBzZCAxOjA6MDowOiBbc2RhXSB0YWcjODA0OSBGQUlMRUQgUmVzdWx0OiBob3N0Ynl0
ZT1ESURfU09GVF9FUlJPUiBkcml2ZXJieXRlPURSSVZFUl9PSyBjbWRfYWdlPTBzPC9zcGFuPjwv
ZGl2PjxkaXY+PHNwYW4+WzE2MzEwMi40NDc3ODldIHNkIDE6MDowOjA6IFtzZGFdIHRhZyM4MDQ5
IENEQjogUmVhZCgxMCkgMjggMDAgNWUgMjEgZDQgMDAgMDAgMDggMDAgMDA8L3NwYW4+PC9kaXY+
PGRpdj48c3Bhbj5bMTYzMTAyLjQ0Nzg1NV0gSS9PIGVycm9yLCBkZXYgc2RhLCBzZWN0b3IgMTU3
OTI3NTI2NCBvcCAweDA6KFJFQUQpIGZsYWdzIDB4ODA3MDAgcGh5c19zZWcgOCBwcmlvIGNsYXNz
IDI8L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj5bMTYzMTAyLjkxMjc4M10gc2QgMTowOjA6MDogUG93
ZXItb24gb3IgZGV2aWNlIHJlc2V0IG9jY3VycmVkPC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+WzE2
MzEwMy42NjI4NjddIHNkIDE6MDowOjA6IFBvd2VyLW9uIG9yIGRldmljZSByZXNldCBvY2N1cnJl
ZDwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPlsxNjMxMDQuNDEzMDM2XSBzZCAxOjA6MDowOiBQb3dl
ci1vbiBvciBkZXZpY2UgcmVzZXQgb2NjdXJyZWQ8L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj5bMTYz
MTA1LjE2MzA0NF0gc2QgMTowOjA6MDogUG93ZXItb24gb3IgZGV2aWNlIHJlc2V0IG9jY3VycmVk
PC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+WzE2MzEwNS45MTM2MDldIHNkIDE6MDowOjA6IFBvd2Vy
LW9uIG9yIGRldmljZSByZXNldCBvY2N1cnJlZDwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPlsxNjMx
MDYuNjYzMjEzXSBzZCAxOjA6MDowOiBQb3dlci1vbiBvciBkZXZpY2UgcmVzZXQgb2NjdXJyZWQ8
L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj5bMTYzMTA3LjI4OTc3M10gc2QgMTowOjA6MDogUG93ZXIt
b24gb3IgZGV2aWNlIHJlc2V0IG9jY3VycmVkPC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+WzE2MzEw
Ny45MzI4MTJdIHNkIDE6MDowOjA6IFBvd2VyLW9uIG9yIGRldmljZSByZXNldCBvY2N1cnJlZDwv
c3Bhbj48L2Rpdj48ZGl2PjxzcGFuPlsxNjMxMDguOTEzOTU3XSBzZCAxOjA6MDowOiBQb3dlci1v
biBvciBkZXZpY2UgcmVzZXQgb2NjdXJyZWQ8L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj5bMTYzMTA5
LjY2NDEwNl0gc2QgMTowOjA6MDogUG93ZXItb24gb3IgZGV2aWNlIHJlc2V0IG9jY3VycmVkPC9z
cGFuPjwvZGl2PjxkaXY+PHNwYW4+WzE2MzExMC40MTQyODFdIHNkIDE6MDowOjA6IFBvd2VyLW9u
IG9yIGRldmljZSByZXNldCBvY2N1cnJlZDwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPlsxNjMxMTEu
MTY0MzEyXSBzZCAxOjA6MDowOiBQb3dlci1vbiBvciBkZXZpY2UgcmVzZXQgb2NjdXJyZWQ8L3Nw
YW4+PC9kaXY+PGRpdj48c3Bhbj5bMTYzMTExLjkxMzgxNF0gc2QgMTowOjA6MDogUG93ZXItb24g
b3IgZGV2aWNlIHJlc2V0IG9jY3VycmVkPC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+WzE2MzExMi42
NjM5MDRdIHNkIDE6MDowOjA6IFBvd2VyLW9uIG9yIGRldmljZSByZXNldCBvY2N1cnJlZDwvc3Bh
bj48L2Rpdj48ZGl2PjxzcGFuPlsxNjMxMTMuNDE0NjI3XSBzZCAxOjA6MDowOiBQb3dlci1vbiBv
ciBkZXZpY2UgcmVzZXQgb2NjdXJyZWQ8L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj5bMTYzMTEzLjY5
OTYzOV0gc2QgMTowOjA6MDogW3NkYV0gVW5hbGlnbmVkIHBhcnRpYWwgY29tcGxldGlvbiAocmVz
aWQ9MjA1ODIwLCBzZWN0b3Jfc3o9NTEyKTwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPlsxNjMxMTMu
Njk5NzcxXSBzZCAxOjA6MDowOiBbc2RhXSB0YWcjNzYxNSBDREI6IFJlYWQoMTApIDI4IDAwIDAx
IDRkIDg0IDAwIDAwIDA0IDAwIDAwPC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+WzE2MzExMy42OTk5
NzZdIHNkIDE6MDowOjA6IFtzZGFdIHRhZyM3NjE1IEZBSUxFRCBSZXN1bHQ6IGhvc3RieXRlPURJ
RF9TT0ZUX0VSUk9SIGRyaXZlcmJ5dGU9RFJJVkVSX09LIGNtZF9hZ2U9MHM8L3NwYW4+PC9kaXY+
PGRpdj48c3Bhbj5bMTYzMTEzLjcwMDE5OF0gc2QgMTowOjA6MDogW3NkYV0gdGFnIzc2MTUgQ0RC
OiBSZWFkKDEwKSAyOCAwMCAwMSA0ZCA4NCAwMCAwMCAwNCAwMCAwMDwvc3Bhbj48L2Rpdj48ZGl2
PjxzcGFuPlsxNjMxMTMuNzAwMzI5XSBJL08gZXJyb3IsIGRldiBzZGEsIHNlY3RvciAyMTg1NzI4
MCBvcCAweDA6KFJFQUQpIGZsYWdzIDB4ODA3MDAgcGh5c19zZWcgNCBwcmlvIGNsYXNzIDI8L3Nw
YW4+PC9kaXY+PGRpdj48c3Bhbj5bMTYzMTE0LjE2NDA4NV0gc2QgMTowOjA6MDogUG93ZXItb24g
b3IgZGV2aWNlIHJlc2V0IG9jY3VycmVkPC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+WzE2MzExNC45
MTQxNjddIHNkIDE6MDowOjA6IFBvd2VyLW9uIG9yIGRldmljZSByZXNldCBvY2N1cnJlZDwvc3Bh
bj48L2Rpdj48ZGl2PjxzcGFuPlsxNjMxMTUuNjY0MjYxXSBzZCAxOjA6MDowOiBQb3dlci1vbiBv
ciBkZXZpY2UgcmVzZXQgb2NjdXJyZWQ8L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj5bMTYzMTE1Ljk1
OTk2NV0gc2QgMTowOjA6MDogW3NkYV0gdGFnIzgwNDQgRkFJTEVEIFJlc3VsdDogaG9zdGJ5dGU9
RElEX1NPRlRfRVJST1IgZHJpdmVyYnl0ZT1EUklWRVJfT0sgY21kX2FnZT0wczwvc3Bhbj48L2Rp
dj48ZGl2PjxzcGFuPlsxNjMxMTUuOTU5OTYzXSBzZCAxOjA6MDowOiBbc2RhXSBVbmFsaWduZWQg
cGFydGlhbCBjb21wbGV0aW9uIChyZXNpZD0zMDgyMjAsIHNlY3Rvcl9zej01MTIpPC9zcGFuPjwv
ZGl2PjxkaXY+PHNwYW4+WzE2MzExNS45NTk5OTZdIHNkIDE6MDowOjA6IFtzZGFdIHRhZyM4MDE2
IENEQjogUmVhZCgxMCkgMjggMDAgMDAgNTggYTAgMDAgMDAgMDQgMDAgMDA8L3NwYW4+PC9kaXY+
PGRpdj48c3Bhbj5bMTYzMTE1Ljk2MDA0MV0gc2QgMTowOjA6MDogW3NkYV0gdGFnIzgwNDQgQ0RC
OiBSZWFkKDEwKSAyOCAwMCAxYiA0OCBmYyAwMCAwMCAwNCAwMCAwMDwvc3Bhbj48L2Rpdj48ZGl2
PjxzcGFuPlsxNjMxMTUuOTYwMDgxXSBzZCAxOjA6MDowOiBbc2RhXSB0YWcjODAxNiBGQUlMRUQg
UmVzdWx0OiBob3N0Ynl0ZT1ESURfU09GVF9FUlJPUiBkcml2ZXJieXRlPURSSVZFUl9PSyBjbWRf
YWdlPTBzPC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+WzE2MzExNS45NjAxMDldIEkvTyBlcnJvciwg
ZGV2IHNkYSwgc2VjdG9yIDQ1Nzc2NzkzNiBvcCAweDA6KFJFQUQpIGZsYWdzIDB4ODA3MDAgcGh5
c19zZWcgOCBwcmlvIGNsYXNzIDI8L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj5bMTYzMTE1Ljk2MDE1
NV0gc2QgMTowOjA6MDogW3NkYV0gdGFnIzgwMTYgQ0RCOiBSZWFkKDEwKSAyOCAwMCAwMCA1OCBh
MCAwMCAwMCAwNCAwMCAwMDwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPlsxNjMxMTUuOTYwNDAyXSBJ
L08gZXJyb3IsIGRldiBzZGEsIHNlY3RvciA1ODA4MTI4IG9wIDB4MDooUkVBRCkgZmxhZ3MgMHg4
MDcwMCBwaHlzX3NlZyA0IHByaW8gY2xhc3MgMjwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPlsxNjMx
MTYuNDE0NDM4XSBzZCAxOjA6MDowOiBQb3dlci1vbiBvciBkZXZpY2UgcmVzZXQgb2NjdXJyZWQ8
L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj5bMTYzMTE2LjcwNjczOV0gc2QgMTowOjA6MDogW3NkYV0g
dGFnIzgxMDMgRkFJTEVEIFJlc3VsdDogaG9zdGJ5dGU9RElEX1NPRlRfRVJST1IgZHJpdmVyYnl0
ZT1EUklWRVJfT0sgY21kX2FnZT0wczwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPlsxNjMxMTYuNzA2
ODA0XSBzZCAxOjA6MDowOiBbc2RhXSB0YWcjODEwMyBDREI6IFJlYWQoMTApIDI4IDAwIDBkIDg2
IDNjIDAwIDAwIDA4IDAwIDAwPC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+WzE2MzExNi43MDY4NTNd
IEkvTyBlcnJvciwgZGV2IHNkYSwgc2VjdG9yIDIyNjkwMDk5MiBvcCAweDA6KFJFQUQpIGZsYWdz
IDB4ODA3MDAgcGh5c19zZWcgMTIgcHJpbyBjbGFzcyAyPC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+
WzE2MzExNy4xMDk3ODldIHNkIDE6MDowOjA6IFBvd2VyLW9uIG9yIGRldmljZSByZXNldCBvY2N1
cnJlZDwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPlsxNjMxMTcuOTE0NTc3XSBzZCAxOjA6MDowOiBQ
b3dlci1vbiBvciBkZXZpY2UgcmVzZXQgb2NjdXJyZWQ8L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj5b
MTYzNDk3LjE4OTU2OV0gbWQ6IG1kMTI2OiBjaGVjayBkb25lLjwvc3Bhbj48L2Rpdj48ZGl2Pjxz
cGFuPlsxNjM4MjkuMjMxNDI2XSBtZDogbWQxMjc6IGNoZWNrIGRvbmUuPC9zcGFuPjwvZGl2Pjxk
aXY+PHNwYW4+WzE4NTA5Ni4xMDAzODhdIG1kOiBtZDEyNTogY2hlY2sgZG9uZS48L3NwYW4+PC9k
aXY+PHNwYW4+PC9zcGFuPjwvZGl2PjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBBcmlhbCwgc2Fu
cy1zZXJpZjsgZm9udC1zaXplOiAxNHB4OyBjb2xvcjogcmdiKDAsIDAsIDApOyBiYWNrZ3JvdW5k
LWNvbG9yOiByZ2IoMjU1LCAyNTUsIDI1NSk7Ij48YnI+PC9kaXY+PGRpdiBzdHlsZT0iZm9udC1m
YW1pbHk6IEFyaWFsLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDE0cHg7IGNvbG9yOiByZ2IoMCwg
MCwgMCk7IGJhY2tncm91bmQtY29sb3I6IHJnYigyNTUsIDI1NSwgMjU1KTsiPmFuZCBqdXN0IGFm
dGVyIHRoYXQsIGp1c3QgdGhlIGtlcm5lbCBsb2dzIHlvdSBzYXcgaW4gbXkgcHJldmlvdXMgbWFp
bCwgbm90aGluZyBpbiBiZXR3ZWVuLjwvZGl2PjxkaXYgY2xhc3M9InByb3Rvbm1haWxfcXVvdGUi
PgogICAgICAgIE9uIE1vbmRheSwgRmVicnVhcnkgOXRoLCAyMDI2IGF0IDEyOjE5IEFNLCBqZml1
c2RxICZsdDtqZml1c2RxQHByb3Rvbi5tZSZndDsgd3JvdGU6PGJyPgogICAgICAgIDxibG9ja3F1
b3RlIGNsYXNzPSJwcm90b25tYWlsX3F1b3RlIiB0eXBlPSJjaXRlIj4KICAgICAgICAgICAgPGRp
diBzdHlsZT0iZm9udC1mYW1pbHk6IEFyaWFsLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDE0cHg7
IGNvbG9yOiByZ2IoMCwgMCwgMCk7IGJhY2tncm91bmQtY29sb3I6IHJnYigyNTUsIDI1NSwgMjU1
KTsiPjxzcGFuPkhlbGxvLDwvc3Bhbj48L2Rpdj48ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQXJp
YWwsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTRweDsgY29sb3I6IHJnYigwLCAwLCAwKTsgYmFj
a2dyb3VuZC1jb2xvcjogcmdiKDI1NSwgMjU1LCAyNTUpOyI+PHNwYW4+PGJyPjwvc3Bhbj48L2Rp
dj48ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQXJpYWwsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTog
MTRweDsgY29sb3I6IHJnYigwLCAwLCAwKTsgYmFja2dyb3VuZC1jb2xvcjogcmdiKDI1NSwgMjU1
LCAyNTUpOyI+PHNwYW4+VG9kYXkgSSB3YXMgbWV0IHdpdGggdGhlIGZvbGxvd2luZyBrZXJuZWwg
bG9nIG9uIElCTSBQT1dFUjksIGFiaXQgd29ycnlpbmcgYmVjYXVzZSBvZiBpdCBjb25jZXJuaW5n
IFJBSUQ2Ojwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPjxicj48L3NwYW4+PC9kaXY+PGRpdj48c3Bh
bj5bMjQwODg4LjU1NTM4N10gJm5ic3A7c2xhYiByYWlkNi1tZDEyNSBzdGFydCBjMDAwMDAwZDkz
NzFiZjMwIHBvaW50ZXIgb2Zmc2V0IDE2IHNpemUgMjU0NDwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFu
PlsyNDA4ODguNTU1NDY0XSBsaXN0X2FkZCBjb3JydXB0aW9uLiBwcmV2LSZndDtuZXh0IHNob3Vs
ZCBiZSBuZXh0IChjMDAwMDAwMDJhM2ZjM2UwKSwgYnV0IHdhcyBjMDAwMDAwZDkzNzFiZjQwLiAo
cHJldj1jMDAwMDAwZDkzNzFiZjQwKS48L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj5bMjQwODg4LjU1
NTU4Ml0gLS0tLS0tLS0tLS0tWyBjdXQgaGVyZSBdLS0tLS0tLS0tLS0tPC9zcGFuPjwvZGl2Pjxk
aXY+PHNwYW4+WzI0MDg4OC41NTU2MTVdIGtlcm5lbCBCVUcgYXQgbGliL2xpc3RfZGVidWcuYzoz
MiE8L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj5bMjQwODg4LjU1NTY1MF0gT29wczogRXhjZXB0aW9u
IGluIGtlcm5lbCBtb2RlLCBzaWc6IDUgWyMxXTwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPlsyNDA4
ODguNTU1NzAzXSBMRSBQQUdFX1NJWkU9NjRLIE1NVT1SYWRpeCAmbmJzcDtTTVAgTlJfQ1BVUz0y
MDQ4IE5VTUEgUG93ZXJOVjwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPlsyNDA4ODguNTU1NzU1XSBN
b2R1bGVzIGxpbmtlZCBpbjogdmVuZG9yX3Jlc2V0KE9FKSB2ZmlvX3BjaSB2ZmlvX3BjaV9jb3Jl
IHZmaW9faW9tbXVfc3BhcHJfdGNlIHZmaW8gaW9tbXVmZCB2aG9zdF9uZXQgdmhvc3Qgdmhvc3Rf
aW90bGIgdGFwIHR1biBuZnRfbWFzcSBuZnRfcmVqZWN0X2lwdjQgYWN0X2NzdW0gY2xzX3UzMiBz
Y2hfaHRiIG5mX25hdF90ZnRwIG5mX2Nvbm50cmFja190ZnRwIGJyaWRnZSBzdHAgbGxjIGt2bV9o
diBrdm0gcmZraWxsIHh0X2Nvbm50cmFjayBuZnRfY29tcGF0IG5mdF9maWJfaW5ldCBuZnRfZmli
X2lwdjQgbmZ0X2ZpYl9pcHY2IG5mdF9maWIgbmZ0X3JlamVjdF9pbmV0IG5mX3JlamVjdF9pcHY0
IG5mX3JlamVjdF9pcHY2IG5mdF9yZWplY3QgbmZ0X2N0IG5mdF9jaGFpbl9uYXQgbmZfbmF0IG5m
X2Nvbm50cmFjayBuZl9kZWZyYWdfaXB2NiBuZl9kZWZyYWdfaXB2NCBuZl90YWJsZXMgZG1fY2Fj
aGVfc21xIGRtX2NhY2hlIHJhaWQ0NTYgYXN5bmNfcmFpZDZfcmVjb3YgYXN5bmNfbWVtY3B5IGFz
eW5jX3BxIGFzeW5jX3hvciBhc3luY190eCBzdW5ycGMgcmFpZDEwIHNuZF9oZGFfaW50ZWwgYXQy
NCBqb3lkZXYgc25kX2ludGVsX2RzcGNmZyBzbmRfaGRhX2NvZGVjIHNuZF9oZGFfY29yZSBvbmJv
YXJkX3VzYl9kZXYgc25kX2h3ZGVwIHNuZF9zZXEgc25kX3NlcV9kZXZpY2Ugc25kX3BjbSBvZnBh
cnQgdGczIHBvd2VybnZfZmxhc2ggc25kX3RpbWVyIGF0bGFudGljIHZteF9jcnlwdG8gaXBtaV9w
b3dlcm52IHNuZCBpcG1pX2RldmludGYgbXRkIGlwbWlfbXNnaGFuZGxlciBtYWNzZWMgcnRjX29w
YWwgb3BhbF9wcmQgc291bmRjb3JlIGkyY19vcGFsIGZ1c2UgZG1fbXVsdGlwYXRoIGxvb3AgbmZu
ZXRsaW5rIHpyYW0gbHo0aGNfY29tcHJlc3MgbHo0X2NvbXByZXNzIHhmcyBkbV90aGluX3Bvb2wg
ZG1fcGVyc2lzdGVudF9kYXRhIGRtX2Jpb19wcmlzb24gZG1fY3J5cHQgcmFpZDEgbnZtZSBtcHQz
c2FzIG52bWVfY29yZSB1YXMgdXNiX3N0b3JhZ2UgYXN0IG52bWVfa2V5cmluZzwvc3Bhbj48L2Rp
dj48ZGl2PjxzcGFuPlsyNDA4ODguNTU1OTYyXSAmbmJzcDtudm1lX2F1dGggaGtkZiByYWlkX2Ns
YXNzIGkyY19hbGdvX2JpdCBzY3NpX3RyYW5zcG9ydF9zYXMgc2NzaV9kaF9yZGFjIHNjc2lfZGhf
ZW1jIHNjc2lfZGhfYWx1YSBpMmNfZGV2IGFlc19nY21fcDEwX2NyeXB0byBjcnlwdG9fc2ltZCBj
cnlwdGQ8L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj5bMjQwODg4LjU1NjUzMV0gQ1BVOiAzMyBVSUQ6
IDAgUElEOiAyODUxIENvbW06IGRtY3J5cHRfd3JpdGUvMiBUYWludGVkOiBHICZuYnNwOyAmbmJz
cDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgT0UgJm5ic3A7ICZuYnNwOyAmbmJzcDsgNi4xOC44LTIw
MC5mYzQzLnBwYzY0bGUgIzEgUFJFRU1QVCh2b2x1bnRhcnkpIDwvc3Bhbj48L2Rpdj48ZGl2Pjxz
cGFuPlsyNDA4ODguNTU2NjA4XSBUYWludGVkOiBbT109T09UX01PRFVMRSwgW0VdPVVOU0lHTkVE
X01PRFVMRTwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPlsyNDA4ODguNTU2NjUwXSBIYXJkd2FyZSBu
YW1lOiBUMlA5RDAxIFJFViAxLjAwIFBPV0VSOSAocmF3KSAweDRlMTIwMiBvcGFsOnNraWJvb3Qt
ZWNiMWRjNyBQb3dlck5WPC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+WzI0MDg4OC41NTY3MjFdIE5J
UDogJm5ic3A7YzAwMDAwMDAwMGUwOThmYyBMUjogYzAwMDAwMDAwMGUwOThmOCBDVFI6IDAwMDAw
MDAwMDAwMDAwMDA8L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj5bMjQwODg4LjU1Njc2Nl0gUkVHUzog
YzAwMDAwMDAyOTVlNzdhMCBUUkFQOiAwNzAwICZuYnNwOyBUYWludGVkOiBHICZuYnNwOyAmbmJz
cDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgT0UgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7KDYu
MTguOC0yMDAuZmM0My5wcGM2NGxlKTwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPlsyNDA4ODguNTU2
ODIyXSBNU1I6ICZuYnNwOzkwMDAwMDAwMDAwMjkwMzMgJmx0O1NGLEhWLEVFLE1FLElSLERSLFJJ
LExFJmd0OyAmbmJzcDtDUjogMjQwMDQyODAgJm5ic3A7WEVSOiAwMDAwMDAwMDwvc3Bhbj48L2Rp
dj48ZGl2PjxzcGFuPlsyNDA4ODguNTU2OTA0XSBDRkFSOiBjMDAwMDAwMDAwMzQ1NDJjIElSUU1B
U0s6IDAgPC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7
ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyBHUFIwMDogYzAwMDAwMDAwMGUwOThmOCBjMDAw
MDAwMDI5NWU3YTQwIGMwMDAwMDAwMDI2YmE5MDAgMDAwMDAwMDAwMDAwMDA3NSA8L3NwYW4+PC9k
aXY+PGRpdj48c3Bhbj4mbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAm
bmJzcDsgJm5ic3A7IEdQUjA0OiAwMDAwMDAwMGZmZmZiZmZmIDAwMDAwMDAwMDAwMDAwMDEgMDAw
MDAwMWZmYzJkMDAwMCAwMDAwMDAwMDAwMDAwMDAxIDwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPiZu
YnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgR1BS
MDg6IDAwMDAwMDAwMDAwMDAwMjcgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMDAwMDAwMDAwIGMw
MDAwMDAwMjk1ZTc4OTAgPC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+Jm5ic3A7ICZuYnNwOyAmbmJz
cDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyBHUFIxMjogYzAwMDIwMWZmZjE4
ZmZhOCBjMDAwMDAxZmZmZmRlNjAwIGMwMDAwMDAwMDAyOTljMjggYzAwMDIwMDAxMTNmZGI0MCA8
L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj4mbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7
ICZuYnNwOyAmbmJzcDsgJm5ic3A7IEdQUjE2OiAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAw
MDAwMDAgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMDAwMDAwMDAwIDwvc3Bhbj48L2Rpdj48ZGl2
PjxzcGFuPiZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAm
bmJzcDsgR1BSMjA6IDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMDAw
MDAwMDAwIDAwMDAwMDAwMDAwMDAwMDEgPC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+Jm5ic3A7ICZu
YnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyBHUFIyNDogMDAw
MDAwMDAwMDAwMDAwMCBjMDAwMDAwMDI5NWU3YzcwIGMwMDAwMDAwMmJiY2U4MDAgYzAwMDAwMTEy
NmQ1NzgzMCA8L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj4mbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJz
cDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7IEdQUjI4OiAwMDAwMDAwMDAwMDAwMDAwIGMw
MDAyMDFkMjk5NWI1ODggYzAwMDIwMDA1ZjQ2NDAwMCBjMDAwMjAxZDI5OTViNTQwIDwvc3Bhbj48
L2Rpdj48ZGl2PjxzcGFuPlsyNDA4ODguNTU3MzM5XSBOSVAgW2MwMDAwMDAwMDBlMDk4ZmNdIF9f
bGlzdF9hZGRfdmFsaWRfb3JfcmVwb3J0KzB4ZGMvMHgxNDA8L3NwYW4+PC9kaXY+PGRpdj48c3Bh
bj5bMjQwODg4LjU1NzQwNV0gTFIgW2MwMDAwMDAwMDBlMDk4ZjhdIF9fbGlzdF9hZGRfdmFsaWRf
b3JfcmVwb3J0KzB4ZDgvMHgxNDA8L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj5bMjQwODg4LjU1NzQ2
M10gQ2FsbCBUcmFjZTo8L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj5bMjQwODg4LjU1NzQ4NF0gW2Mw
MDAwMDAwMjk1ZTdhNDBdIFtjMDAwMDAwMDAwZTA5OGY4XSBfX2xpc3RfYWRkX3ZhbGlkX29yX3Jl
cG9ydCsweGQ4LzB4MTQwICh1bnJlbGlhYmxlKTwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPlsyNDA4
ODguNTU3NTQxXSBbYzAwMDAwMDAyOTVlN2FiMF0gW2MwMDgwMDAwMjM4ZjBhZDRdIHJlbGVhc2Vf
c3RyaXBlX3BsdWcrMHg5Yy8weDE1MCBbcmFpZDQ1Nl08L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj5b
MjQwODg4LjU1NzYwN10gW2MwMDAwMDAwMjk1ZTdiMDBdIFtjMDA4MDAwMDIzOGY1OWY0XSBtYWtl
X3N0cmlwZV9yZXF1ZXN0KzB4MzJjLzB4NTYwIFtyYWlkNDU2XTwvc3Bhbj48L2Rpdj48ZGl2Pjxz
cGFuPlsyNDA4ODguNTU3Njc4XSBbYzAwMDAwMDAyOTVlN2JkMF0gW2MwMDgwMDAwMjM4ZjVkZjhd
IHJhaWQ1X21ha2VfcmVxdWVzdCsweDFkMC8weDYxMCBbcmFpZDQ1Nl08L3NwYW4+PC9kaXY+PGRp
dj48c3Bhbj5bMjQwODg4LjU1Nzc2NV0gW2MwMDAwMDAwMjk1ZTdkMTBdIFtjMDAwMDAwMDAxMzY5
YTA0XSBtZF9oYW5kbGVfcmVxdWVzdCsweDFjNC8weDQwMDwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFu
PlsyNDA4ODguNTU3ODUwXSBbYzAwMDAwMDAyOTVlN2RhMF0gW2MwMDAwMDAwMDBkMDQwMTBdIF9f
c3VibWl0X2JpbysweDIzMC8weDNkMDwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPlsyNDA4ODguNTU3
OTI3XSBbYzAwMDAwMDAyOTVlN2U0MF0gW2MwMDAwMDAwMDBkMDQyNDRdIF9fc3VibWl0X2Jpb19u
b2FjY3QrMHg5NC8weDI1MDwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPlsyNDA4ODguNTU3OTk4XSBb
YzAwMDAwMDAyOTVlN2ViMF0gW2MwMDAwMDAwMDEzODc0M2NdIGRtX3N1Ym1pdF9iaW9fcmVtYXAr
MHg0Yy8weDEyMDwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPlsyNDA4ODguNTU4MDcwXSBbYzAwMDAw
MDAyOTVlN2VmMF0gW2MwMDgwMDAwMWJjZTI2YThdIGRtY3J5cHRfd3JpdGUrMHgxYTAvMHgyMDAg
W2RtX2NyeXB0XTwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPlsyNDA4ODguNTU4MTMxXSBbYzAwMDAw
MDAyOTVlN2Y5MF0gW2MwMDAwMDAwMDAyOTlkYThdIGt0aHJlYWQrMHgxODgvMHgxYTA8L3NwYW4+
PC9kaXY+PGRpdj48c3Bhbj5bMjQwODg4LjU1ODE5Nl0gW2MwMDAwMDAwMjk1ZTdmZTBdIFtjMDAw
MDAwMDAwMDBkZWQ4XSBzdGFydF9rZXJuZWxfdGhyZWFkKzB4MTQvMHgxODwvc3Bhbj48L2Rpdj48
ZGl2PjxzcGFuPlsyNDA4ODguNTU4MjU3XSBDb2RlOiBmOGMxMDA2MCBmODAxMDA4MCA0Yjg4M2Iz
NSA2MDAwMDAwMCAzYzYyZmY4MiAzODYzOTM4OCBlOGMxMDA2MCBlOTIxMDA2OCBlOGE2MDAwMCA3
ZDI0NGI3OCA0YjUzYmFmNSA2MDAwMDAwMCAmbHQ7MGZlMDAwMDAmZ3Q7IDdjMDgwMmE2IDdjODUy
Mzc4IDdjNjQxYjc4IDwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPlsyNDA4ODguNTU4MzYzXSAtLS1b
IGVuZCB0cmFjZSAwMDAwMDAwMDAwMDAwMDAwIF0tLS08L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj5b
MjQwODg5LjExNDU4Nl0gcHN0b3JlOiBiYWNrZW5kIChudnJhbSkgd3JpdGluZyBlcnJvciAoLTEp
PC9zcGFuPjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+PHNwYW4+WzI0MDg4OS4xMTQ2MzZdIG5v
dGU6IGRtY3J5cHRfd3JpdGUvMlsyODUxXSBleGl0ZWQgd2l0aCBpcnFzIGRpc2FibGVkPC9zcGFu
PjwvZGl2PjxkaXY+PHNwYW4+WzI0MDg4OS4xMTQ3NTZdIC0tLS0tLS0tLS0tLVsgY3V0IGhlcmUg
XS0tLS0tLS0tLS0tLTwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPlsyNDA4ODkuMTE0Nzg1XSBXQVJO
SU5HOiBDUFU6IDMzIFBJRDogMjg1MSBhdCBrZXJuZWwvZXhpdC5jOjkwMyBkb19leGl0KzB4NWMv
MHg1YjA8L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj5bMjQwODg5LjExNDgzN10gTW9kdWxlcyBsaW5r
ZWQgaW46IHZlbmRvcl9yZXNldChPRSkgdmZpb19wY2kgdmZpb19wY2lfY29yZSB2ZmlvX2lvbW11
X3NwYXByX3RjZSB2ZmlvIGlvbW11ZmQgdmhvc3RfbmV0IHZob3N0IHZob3N0X2lvdGxiIHRhcCB0
dW4gbmZ0X21hc3EgbmZ0X3JlamVjdF9pcHY0IGFjdF9jc3VtIGNsc191MzIgc2NoX2h0YiBuZl9u
YXRfdGZ0cCBuZl9jb25udHJhY2tfdGZ0cCBicmlkZ2Ugc3RwIGxsYyBrdm1faHYga3ZtIHJma2ls
bCB4dF9jb25udHJhY2sgbmZ0X2NvbXBhdCBuZnRfZmliX2luZXQgbmZ0X2ZpYl9pcHY0IG5mdF9m
aWJfaXB2NiBuZnRfZmliIG5mdF9yZWplY3RfaW5ldCBuZl9yZWplY3RfaXB2NCBuZl9yZWplY3Rf
aXB2NiBuZnRfcmVqZWN0IG5mdF9jdCBuZnRfY2hhaW5fbmF0IG5mX25hdCBuZl9jb25udHJhY2sg
bmZfZGVmcmFnX2lwdjYgbmZfZGVmcmFnX2lwdjQgbmZfdGFibGVzIGRtX2NhY2hlX3NtcSBkbV9j
YWNoZSByYWlkNDU2IGFzeW5jX3JhaWQ2X3JlY292IGFzeW5jX21lbWNweSBhc3luY19wcSBhc3lu
Y194b3IgYXN5bmNfdHggc3VucnBjIHJhaWQxMCBzbmRfaGRhX2ludGVsIGF0MjQgam95ZGV2IHNu
ZF9pbnRlbF9kc3BjZmcgc25kX2hkYV9jb2RlYyBzbmRfaGRhX2NvcmUgb25ib2FyZF91c2JfZGV2
IHNuZF9od2RlcCBzbmRfc2VxIHNuZF9zZXFfZGV2aWNlIHNuZF9wY20gb2ZwYXJ0IHRnMyBwb3dl
cm52X2ZsYXNoIHNuZF90aW1lciBhdGxhbnRpYyB2bXhfY3J5cHRvIGlwbWlfcG93ZXJudiBzbmQg
aXBtaV9kZXZpbnRmIG10ZCBpcG1pX21zZ2hhbmRsZXIgbWFjc2VjIHJ0Y19vcGFsIG9wYWxfcHJk
IHNvdW5kY29yZSBpMmNfb3BhbCBmdXNlIGRtX211bHRpcGF0aCBsb29wIG5mbmV0bGluayB6cmFt
IGx6NGhjX2NvbXByZXNzIGx6NF9jb21wcmVzcyB4ZnMgZG1fdGhpbl9wb29sIGRtX3BlcnNpc3Rl
bnRfZGF0YSBkbV9iaW9fcHJpc29uIGRtX2NyeXB0IHJhaWQxIG52bWUgbXB0M3NhcyBudm1lX2Nv
cmUgdWFzIHVzYl9zdG9yYWdlIGFzdCBudm1lX2tleXJpbmc8L3NwYW4+PC9kaXY+PGRpdj48c3Bh
bj5bMjQwODg5LjExNDk5M10gJm5ic3A7bnZtZV9hdXRoIGhrZGYgcmFpZF9jbGFzcyBpMmNfYWxn
b19iaXQgc2NzaV90cmFuc3BvcnRfc2FzIHNjc2lfZGhfcmRhYyBzY3NpX2RoX2VtYyBzY3NpX2Ro
X2FsdWEgaTJjX2RldiBhZXNfZ2NtX3AxMF9jcnlwdG8gY3J5cHRvX3NpbWQgY3J5cHRkPC9zcGFu
PjwvZGl2PjxkaXY+PHNwYW4+WzI0MDg4OS4xMTU1MjhdIENQVTogMzMgVUlEOiAwIFBJRDogMjg1
MSBDb21tOiBkbWNyeXB0X3dyaXRlLzIgVGFpbnRlZDogRyAmbmJzcDsgJm5ic3A7ICZuYnNwO0Qg
Jm5ic3A7ICZuYnNwO09FICZuYnNwOyAmbmJzcDsgJm5ic3A7IDYuMTguOC0yMDAuZmM0My5wcGM2
NGxlICMxIFBSRUVNUFQodm9sdW50YXJ5KSA8L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj5bMjQwODg5
LjExNTY0MV0gVGFpbnRlZDogW0RdPURJRSwgW09dPU9PVF9NT0RVTEUsIFtFXT1VTlNJR05FRF9N
T0RVTEU8L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj5bMjQwODg5LjExNTY3OF0gSGFyZHdhcmUgbmFt
ZTogVDJQOUQwMSBSRVYgMS4wMCBQT1dFUjkgKHJhdykgMHg0ZTEyMDIgb3BhbDpza2lib290LWVj
YjFkYzcgUG93ZXJOVjwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPlsyNDA4ODkuMTE1NzcxXSBOSVA6
ICZuYnNwO2MwMDAwMDAwMDAyNjAzNWMgTFI6IGMwMDAwMDAwMDAyNjA5NTAgQ1RSOiAwMDAwMDAw
MDAwMDAwMDAwPC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+WzI0MDg4OS4xMTU4MjhdIFJFR1M6IGMw
MDAwMDAwMjk1ZTczMzAgVFJBUDogMDcwMCAmbmJzcDsgVGFpbnRlZDogRyAmbmJzcDsgJm5ic3A7
ICZuYnNwO0QgJm5ic3A7ICZuYnNwO09FICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyg2LjE4
LjgtMjAwLmZjNDMucHBjNjRsZSk8L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj5bMjQwODg5LjExNTg3
NV0gTVNSOiAmbmJzcDs5MDAwMDAwMDAyMDI5MDMzICZsdDtTRixIVixWRUMsRUUsTUUsSVIsRFIs
UkksTEUmZ3Q7ICZuYnNwO0NSOiAyNDAwNDI4MCAmbmJzcDtYRVI6IDIwMDQwMDAwPC9zcGFuPjwv
ZGl2PjxkaXY+PHNwYW4+WzI0MDg4OS4xMTU5MzZdIENGQVI6IGMwMDAwMDAwMDAyNjA5NGMgSVJR
TUFTSzogMCA8L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj4mbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJz
cDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7IEdQUjAwOiBjMDAwMDAwMDAwMjYwOTUwIGMw
MDAwMDAwMjk1ZTc1ZDAgYzAwMDAwMDAwMjZiYTkwMCAwMDAwMDAwMDAwMDAwMDA1IDwvc3Bhbj48
L2Rpdj48ZGl2PjxzcGFuPiZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7
ICZuYnNwOyAmbmJzcDsgR1BSMDQ6IDAwMDAwMDAwMDAwMDI3MTAgMDAwMDAwMDAwMDAwMDAwMSAw
MDAwMDAxZmZjMmQwMDAwIDAwMDAwMDAwMDAwMDAwMDEgPC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+
Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyBH
UFIwODogMDAwMDAwMDAwMDAwMDAwNSAwMDAwMDAwMDAwMDAwMDAxIGMwMDAwMDAwMjk1ZTdmMTgg
MDAwMDAwMDAwMDAwNDAwMCA8L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj4mbmJzcDsgJm5ic3A7ICZu
YnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7IEdQUjEyOiBjMDAwMjAxZmZm
MThmZmE4IGMwMDAwMDFmZmZmZGU2MDAgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMDAwMDAwMDAw
IDwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPiZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJz
cDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgR1BSMTY6IDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAw
MDAwMDAwMCAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDAgPC9zcGFuPjwvZGl2Pjxk
aXY+PHNwYW4+Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7
ICZuYnNwOyBHUFIyMDogMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAw
MDAwMDAwMDAgMDAwMDAwMDAwMDAwMDAwMCA8L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj4mbmJzcDsg
Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7IEdQUjI0OiAw
MDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAw
MDAwMDAwMDAwIDwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPiZuYnNwOyAmbmJzcDsgJm5ic3A7ICZu
YnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgR1BSMjg6IDAwMDAwMDAwMDAwMDAwMDUg
MDAwMDAwMDAwMDAwMDAwMyBjMDAwMDAwMDAzZTNhOTAwIGMwMDAwMDAwNDU1NWU4MDAgPC9zcGFu
PjwvZGl2PjxkaXY+PHNwYW4+WzI0MDg4OS4xMTYzNzldIE5JUCBbYzAwMDAwMDAwMDI2MDM1Y10g
ZG9fZXhpdCsweDVjLzB4NWIwPC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+WzI0MDg4OS4xMTY0MDdd
IExSIFtjMDAwMDAwMDAwMjYwOTUwXSBtYWtlX3Rhc2tfZGVhZCsweGEwLzB4MWQwPC9zcGFuPjwv
ZGl2PjxkaXY+PHNwYW4+WzI0MDg4OS4xMTY0MjddIENhbGwgVHJhY2U6PC9zcGFuPjwvZGl2Pjxk
aXY+PHNwYW4+WzI0MDg4OS4xMTY0NzNdIFtjMDAwMDAwMDI5NWU3NWQwXSBbYzAwMDAwMDAyOTVl
NzYwMF0gMHhjMDAwMDAwMDI5NWU3NjAwICh1bnJlbGlhYmxlKTwvc3Bhbj48L2Rpdj48ZGl2Pjxz
cGFuPlsyNDA4ODkuMTE2NTQ5XSBbYzAwMDAwMDAyOTVlNzY3MF0gW2MwMDAwMDAwMDAyNjA5NTBd
IG1ha2VfdGFza19kZWFkKzB4YTAvMHgxZDA8L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj5bMjQwODg5
LjExNjYyMV0gW2MwMDAwMDAwMjk1ZTc2ZjBdIFtjMDAwMDAwMDAwMDJhMzE0XSBvb3BzX2VuZCsw
eDE2NC8weDFhMDwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPlsyNDA4ODkuMTE2Njg5XSBbYzAwMDAw
MDAyOTVlNzc3MF0gW2MwMDAwMDAwMDAwMDliMmNdIHByb2dyYW1fY2hlY2tfY29tbW9uX3ZpcnQr
MHgzYmMvMHgzYzA8L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj5bMjQwODg5LjExNjc0OV0gLS0tLSBp
bnRlcnJ1cHQ6IDcwMCBhdCBfX2xpc3RfYWRkX3ZhbGlkX29yX3JlcG9ydCsweGRjLzB4MTQwPC9z
cGFuPjwvZGl2PjxkaXY+PHNwYW4+WzI0MDg4OS4xMTY3OTldIE5JUDogJm5ic3A7YzAwMDAwMDAw
MGUwOThmYyBMUjogYzAwMDAwMDAwMGUwOThmOCBDVFI6IDAwMDAwMDAwMDAwMDAwMDA8L3NwYW4+
PC9kaXY+PGRpdj48c3Bhbj5bMjQwODg5LjExNjgzOF0gUkVHUzogYzAwMDAwMDAyOTVlNzdhMCBU
UkFQOiAwNzAwICZuYnNwOyBUYWludGVkOiBHICZuYnNwOyAmbmJzcDsgJm5ic3A7RCAmbmJzcDsg
Jm5ic3A7T0UgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7KDYuMTguOC0yMDAuZmM0My5wcGM2
NGxlKTwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPlsyNDA4ODkuMTE2OTA1XSBNU1I6ICZuYnNwOzkw
MDAwMDAwMDAwMjkwMzMgJmx0O1NGLEhWLEVFLE1FLElSLERSLFJJLExFJmd0OyAmbmJzcDtDUjog
MjQwMDQyODAgJm5ic3A7WEVSOiAwMDAwMDAwMDwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPlsyNDA4
ODkuMTE2OTY3XSBDRkFSOiBjMDAwMDAwMDAwMzQ1NDJjIElSUU1BU0s6IDAgPC9zcGFuPjwvZGl2
PjxkaXY+PHNwYW4+Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5i
c3A7ICZuYnNwOyBHUFIwMDogYzAwMDAwMDAwMGUwOThmOCBjMDAwMDAwMDI5NWU3YTQwIGMwMDAw
MDAwMDI2YmE5MDAgMDAwMDAwMDAwMDAwMDA3NSA8L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj4mbmJz
cDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7IEdQUjA0
OiAwMDAwMDAwMGZmZmZiZmZmIDAwMDAwMDAwMDAwMDAwMDEgMDAwMDAwMWZmYzJkMDAwMCAwMDAw
MDAwMDAwMDAwMDAxIDwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPiZuYnNwOyAmbmJzcDsgJm5ic3A7
ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgR1BSMDg6IDAwMDAwMDAwMDAwMDAw
MjcgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMDAwMDAwMDAwIGMwMDAwMDAwMjk1ZTc4OTAgPC9z
cGFuPjwvZGl2PjxkaXY+PHNwYW4+Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAm
bmJzcDsgJm5ic3A7ICZuYnNwOyBHUFIxMjogYzAwMDIwMWZmZjE4ZmZhOCBjMDAwMDAxZmZmZmRl
NjAwIGMwMDAwMDAwMDAyOTljMjggYzAwMDIwMDAxMTNmZGI0MCA8L3NwYW4+PC9kaXY+PGRpdj48
c3Bhbj4mbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5i
c3A7IEdQUjE2OiAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAw
MDAwMCAwMDAwMDAwMDAwMDAwMDAwIDwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPiZuYnNwOyAmbmJz
cDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgR1BSMjA6IDAwMDAw
MDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAw
MDAwMDEgPC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7
ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyBHUFIyNDogMDAwMDAwMDAwMDAwMDAwMCBjMDAw
MDAwMDI5NWU3YzcwIGMwMDAwMDAwMmJiY2U4MDAgYzAwMDAwMTEyNmQ1NzgzMCA8L3NwYW4+PC9k
aXY+PGRpdj48c3Bhbj4mbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAm
bmJzcDsgJm5ic3A7IEdQUjI4OiAwMDAwMDAwMDAwMDAwMDAwIGMwMDAyMDFkMjk5NWI1ODggYzAw
MDIwMDA1ZjQ2NDAwMCBjMDAwMjAxZDI5OTViNTQwIDwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPlsy
NDA4ODkuMTE3MzQzXSBOSVAgW2MwMDAwMDAwMDBlMDk4ZmNdIF9fbGlzdF9hZGRfdmFsaWRfb3Jf
cmVwb3J0KzB4ZGMvMHgxNDA8L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj5bMjQwODg5LjExNzQwMF0g
TFIgW2MwMDAwMDAwMDBlMDk4ZjhdIF9fbGlzdF9hZGRfdmFsaWRfb3JfcmVwb3J0KzB4ZDgvMHgx
NDA8L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj5bMjQwODg5LjExNzQ1NF0gLS0tLSBpbnRlcnJ1cHQ6
IDcwMDwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPlsyNDA4ODkuMTE3NDg3XSBbYzAwMDAwMDAyOTVl
N2FiMF0gW2MwMDgwMDAwMjM4ZjBhZDRdIHJlbGVhc2Vfc3RyaXBlX3BsdWcrMHg5Yy8weDE1MCBb
cmFpZDQ1Nl08L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj5bMjQwODg5LjExNzU0NF0gW2MwMDAwMDAw
Mjk1ZTdiMDBdIFtjMDA4MDAwMDIzOGY1OWY0XSBtYWtlX3N0cmlwZV9yZXF1ZXN0KzB4MzJjLzB4
NTYwIFtyYWlkNDU2XTwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPlsyNDA4ODkuMTE3NjA1XSBbYzAw
MDAwMDAyOTVlN2JkMF0gW2MwMDgwMDAwMjM4ZjVkZjhdIHJhaWQ1X21ha2VfcmVxdWVzdCsweDFk
MC8weDYxMCBbcmFpZDQ1Nl08L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj5bMjQwODg5LjExNzY3OF0g
W2MwMDAwMDAwMjk1ZTdkMTBdIFtjMDAwMDAwMDAxMzY5YTA0XSBtZF9oYW5kbGVfcmVxdWVzdCsw
eDFjNC8weDQwMDwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPlsyNDA4ODkuMTE3NzM4XSBbYzAwMDAw
MDAyOTVlN2RhMF0gW2MwMDAwMDAwMDBkMDQwMTBdIF9fc3VibWl0X2JpbysweDIzMC8weDNkMDwv
c3Bhbj48L2Rpdj48ZGl2PjxzcGFuPlsyNDA4ODkuMTE3NzkyXSBbYzAwMDAwMDAyOTVlN2U0MF0g
W2MwMDAwMDAwMDBkMDQyNDRdIF9fc3VibWl0X2Jpb19ub2FjY3QrMHg5NC8weDI1MDwvc3Bhbj48
L2Rpdj48ZGl2PjxzcGFuPlsyNDA4ODkuMTE3ODU5XSBbYzAwMDAwMDAyOTVlN2ViMF0gW2MwMDAw
MDAwMDEzODc0M2NdIGRtX3N1Ym1pdF9iaW9fcmVtYXArMHg0Yy8weDEyMDwvc3Bhbj48L2Rpdj48
ZGl2PjxzcGFuPlsyNDA4ODkuMTE3OTU2XSBbYzAwMDAwMDAyOTVlN2VmMF0gW2MwMDgwMDAwMWJj
ZTI2YThdIGRtY3J5cHRfd3JpdGUrMHgxYTAvMHgyMDAgW2RtX2NyeXB0XTwvc3Bhbj48L2Rpdj48
ZGl2PjxzcGFuPlsyNDA4ODkuMTE4MDE3XSBbYzAwMDAwMDAyOTVlN2Y5MF0gW2MwMDAwMDAwMDAy
OTlkYThdIGt0aHJlYWQrMHgxODgvMHgxYTA8L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj5bMjQwODg5
LjExODA4NF0gW2MwMDAwMDAwMjk1ZTdmZTBdIFtjMDAwMDAwMDAwMDBkZWQ4XSBzdGFydF9rZXJu
ZWxfdGhyZWFkKzB4MTQvMHgxODwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPlsyNDA4ODkuMTE4MTMx
XSBDb2RlOiA5MTYxMDAwOCBmODAxMDAxMCBmODIxZmY2MSBlOTJkMGM3OCBmOTIxMDA3OCAzOTIw
MDAwMCA4OTJkMDkzMiA1NTI5MDdmZSAwYjA5MDAwMCBlOTVmMGM2OCAzMTJhZmZmZiA3ZDI5NTEx
MCAmbHQ7MGIwOTAwMDAmZ3Q7IGViYmYwYjkwIGViZGYwYjg4IDdmYTNlYjc4IDwvc3Bhbj48L2Rp
dj48ZGl2PjxzcGFuPlsyNDA4ODkuMTE4MzIwXSAtLS1bIGVuZCB0cmFjZSAwMDAwMDAwMDAwMDAw
MDAwIF0tLS08L3NwYW4+PC9kaXY+PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IEFyaWFsLCBzYW5z
LXNlcmlmOyBmb250LXNpemU6IDE0cHg7IGNvbG9yOiByZ2IoMCwgMCwgMCk7IGJhY2tncm91bmQt
Y29sb3I6IHJnYigyNTUsIDI1NSwgMjU1KTsiPjxzcGFuPjxicj48L3NwYW4+PC9kaXY+PGRpdiBz
dHlsZT0iZm9udC1mYW1pbHk6IEFyaWFsLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDE0cHg7IGNv
bG9yOiByZ2IoMCwgMCwgMCk7IGJhY2tncm91bmQtY29sb3I6IHJnYigyNTUsIDI1NSwgMjU1KTsi
PjxzcGFuPklmIHRoYXQncyBhbnkgdXNlZnVsIHRvIHJldmVhbCBhIGJ1ZywgYWJvdXQgdGhlIHRh
aW50aW5nIG1vZHVsZSwgaXQncyBhIHBvcnQgb2YmbmJzcDs8c3Bhbj48YSB0YXJnZXQ9Il9ibGFu
ayIgcmVsPSJub3JlZmVycmVyIG5vZm9sbG93IG5vb3BlbmVyIiBocmVmPSJodHRwczovL2dpdGh1
Yi5jb20vZ25pZi92ZW5kb3ItcmVzZXQiPmh0dHBzOi8vZ2l0aHViLmNvbS9nbmlmL3ZlbmRvci1y
ZXNldDwvYT48L3NwYW4+Jm5ic3A7dG8gcHBjIHRvIHJlc2V0IHNvbWUgb2xkZXIgZ3JhcGhpY3Mg
Y2FyZHMsIG5vdGhpbmcgdGhhdCBzaG91bGQgYWZmZWN0IHdoYXQgdGhlIGxvZyBpcyB0YWxraW5n
IGFib3V0LCBmdXJ0aGVybW9yZSBpdHMgYmVlbiBoZXJlIGZvciBxdWl0ZSBhIGxvbmcgdGltZSB3
aXRob3V0IGFueSBlcnJvcnMuPC9zcGFuPjwvZGl2PjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBB
cmlhbCwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxNHB4OyBjb2xvcjogcmdiKDAsIDAsIDApOyBi
YWNrZ3JvdW5kLWNvbG9yOiByZ2IoMjU1LCAyNTUsIDI1NSk7Ij48c3Bhbj48YnI+PC9zcGFuPjwv
ZGl2PjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBBcmlhbCwgc2Fucy1zZXJpZjsgZm9udC1zaXpl
OiAxNHB4OyBjb2xvcjogcmdiKDAsIDAsIDApOyBiYWNrZ3JvdW5kLWNvbG9yOiByZ2IoMjU1LCAy
NTUsIDI1NSk7Ij48c3Bhbj5UaGFua3M8L3NwYW4+PC9kaXY+PHNwYW4+PC9zcGFuPjxicj4KICAg
ICAgICA8L2Jsb2NrcXVvdGU+PGJyPgogICAgPC9kaXY+CiAgICAgICAgPC9ibG9ja3F1b3RlPjxi
cj4KICAgIDwvZGl2Pg==
-----------------------04ae03f88bb1137945136139d41e6e0e--
-----------------------e8879fb0755d5889eeddfd3a1a2f4966--
-----------------------f69c6ac5f8850f800c10b0c0cb625fee
Content-Type: application/pgp-keys; filename="publickey - jfiusdq@proton.me - 0x344F580A.asc"; name="publickey - jfiusdq@proton.me - 0x344F580A.asc"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="publickey - jfiusdq@proton.me - 0x344F580A.asc"; name="publickey - jfiusdq@proton.me - 0x344F580A.asc"

LS0tLS1CRUdJTiBQR1AgUFVCTElDIEtFWSBCTE9DSy0tLS0tCgp4ak1FYVJXRTZ4WUpLd1lCQkFI
YVJ3OEJBUWRBZi92VUlPRVlEcjl2OHZEQ1RicVlJdnhoUlJ0MjBhTm8KMTF1OUVuVGdyQ0hOSldw
bWFYVnpaSEZBY0hKdmRHOXVMbTFsSUR4cVptbDFjMlJ4UUhCeWIzUnZiaTV0ClpUN0N3QkVFRXhZ
S0FJTUZnbWtWaE9zREN3a0hDUkR0dzkxdmxVeGhSRVVVQUFBQUFBQWNBQ0J6WVd4MApRRzV2ZEdG
MGFXOXVjeTV2Y0dWdWNHZHdhbk11YjNKbk5wY3RzQ0hKRjBqUEZLY3Vod1lCQ1hMZ2Y0S28KZHFy
OWdXSmR4bVVPem5jREZRb0lCQllBQWdFQ0dRRUNtd01DSGdFV0lRUTBUMWdLY2hVRDBBWUZvajN0
Cnc5MXZsVXhoUkFBQWorWUEvMlFSRmkvOElBNFU4YWszNVBmN1hDWHdRQkxpTUZDUW16MDhYOWs1
SkNkZgpBUDBSWUpIWHdoZGZ1WUZBT0dsaE9iVzFQejBBM2FLM2dUa09SbE1VSTk5YURzNDRCR2tW
aE9zU0Npc0cKQVFRQmwxVUJCUUVCQjBDbmlSQ21tN0MrV2tOaXk5RVcrZFo4MHhsRnZqbk90MXRj
TkdrZUJDUVhOUU1CCkNBZkN2Z1FZRmdvQWNBV0NhUldFNndrUTdjUGRiNVZNWVVSRkZBQUFBQUFB
SEFBZ2MyRnNkRUJ1YjNSaApkR2x2Ym5NdWIzQmxibkJuY0dwekxtOXlaNUVQUDJ6b3diOG9zZUFP
MjRKQjdhMGxRWEVSZnJWK0t4Wm8KM214bldMdldBcHNNRmlFRU5FOVlDbklWQTlBR0JhSTk3Y1Bk
YjVWTVlVUUFBQTdRQVAwWjcreHdQRU9hCmpnT3FKR0Z0TEN1M1hsUXhJNUVKSThxdElMc3Z2Vk5i
dGdEK01UdjNJeGRvRmUrWmkxeGxnaGd3cjRBYwppdENwamlRL21Jc2lWTXlQb1EwPQo9U2tMTQot
LS0tLUVORCBQR1AgUFVCTElDIEtFWSBCTE9DSy0tLS0tCg==
-----------------------f69c6ac5f8850f800c10b0c0cb625fee--

--------d307f6120bf5471a8c132adba3c811fa069d22c073c95ea82e2a81bc01daf6a7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wrsEARYKAG0FgmmLY3cJEO3D3W+VTGFERRQAAAAAABwAIHNhbHRAbm90YXRp
b25zLm9wZW5wZ3Bqcy5vcmcrCMa7Zy4OOY9nl7C9MWuGd7tgyHIvVFQcI3Ey
Ob/W4xYhBDRPWApyFQPQBgWiPe3D3W+VTGFEAAAqBAEAuvL8iiwV9Uuda1Iw
9NGZ6nFzLcM29T+v7DHcBYosxMwA+wXRZHLBsxT1vAfOvFb+qegWG4V8WsnV
9ZOPpSEmHJQD
=VBFW
-----END PGP SIGNATURE-----


--------d307f6120bf5471a8c132adba3c811fa069d22c073c95ea82e2a81bc01daf6a7--


