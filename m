Return-Path: <linuxppc-dev+bounces-16715-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLGACZYsiWmD3gQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16715-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Feb 2026 01:38:46 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E811710ABEB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Feb 2026 01:38:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f8QmL1R8Pz2xN4;
	Mon, 09 Feb 2026 11:38:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=109.224.244.25
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770597522;
	cv=none; b=av068heN6JRK0iOpok44JC0oJQmtpeZXwrbC70DOMdRGe5M2HPatEX2U9rKm65RX0Fx8CAhnNayL2ghlrZcFsOc5YJoutE3qc721Nxf9VL8grdX/AoFEfVeAisORK6J/g3enMJuJ1V3NwwIEqNRjSCN6p+j+MKmERf1EzFfqlRYUdxGd08Gm9h2FR7kkrWpcrKYpTtxqVoyJEro4FT6VHfTjw6spo/naNf5gAY8oe/VEiaWlbkbmvecDrhD7gglOxasUbrDNqyVPrmNZRLNyx1OuWRRlkWPs+M78AjjIA5p9vDdTyMO6ylC18Z4/uf/CsIPqFktiSf3L7RW6DlY8Og==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770597522; c=relaxed/relaxed;
	bh=x2vWW8V3aiVh4k5Aw5oYAtGgbz7QwrwwUT2DtoPGbUQ=;
	h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Rz9Pv0hq0Qs2ys/fQM+jyGVBJHvP0r9bRAw+evJ20X0/MY+xlmLzXQD76B+kmXEUuCFJy/DgZS+7jDcr1KFThjUeFzoh8QbSSbgVHW/WWJeylm+iSxdyRNZ3cTUxjsKmVl2lr7qpVma5eS5THwlG0rnAojHdlCZO+6cU2R+wSnc8jwbZ5uEc3U3vIZ9EJAu7920JgZNwX0fHlUVn5qkA5lsTbi+o2XPRLYF7mIMUF0ZWAOl0Xq/983cY6PSi7CdxYbdCxudAWhuJ1VP3u99jC+CJZlUxzgGb7Zlu+KTiHk57IQllEt5/B/GuvAFHWpWn1MFggH9tKHxlPnq3OvUa7A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; dkim=pass (2048-bit key; secure) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail header.b=djOmvmpA; dkim-atps=neutral; spf=pass (client-ip=109.224.244.25; helo=mail-24425.protonmail.ch; envelope-from=jfiusdq@proton.me; receiver=lists.ozlabs.org) smtp.mailfrom=proton.me
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail header.b=djOmvmpA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=proton.me (client-ip=109.224.244.25; helo=mail-24425.protonmail.ch; envelope-from=jfiusdq@proton.me; receiver=lists.ozlabs.org)
Received: from mail-24425.protonmail.ch (mail-24425.protonmail.ch [109.224.244.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f8QmF5R2Cz2xLv
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Feb 2026 11:38:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1770597510; x=1770856710;
	bh=x2vWW8V3aiVh4k5Aw5oYAtGgbz7QwrwwUT2DtoPGbUQ=;
	h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=djOmvmpAbDgVCzMuOcPlldJRghnlcriCmigtHOuH+EwvfyoKkOyN6JH2ekzouJXjD
	 s7d/9LZzxMthLosKfBJ1Wh36xiZZCl1vwtQQJk+0CdszxeTLudAGAVm2BTxCjdQ3sh
	 1Dy3bOWW137uS+Jp4swLSELEsXHvxQV6pe/78+aNPtr2i5xjO0QcFkhpKAVHhxG08b
	 qv8vGNKHTWLVQdetYsS3f1z8Xdv+aV7zDkBJgDYMt3mPEVHEaaoHvN1exVgh2zARfL
	 CUDHvOO21ywGj9uhRu4QceQWVSrTsmgekxOJtZvF87XaY8BMGTBVAD81/NLkmFoOAA
	 ekcn7xOPY7xiQ==
Date: Mon, 09 Feb 2026 00:38:29 +0000
To: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
From: jfiusdq <jfiusdq@proton.me>
Subject: Re: slab raid6-md125 start c000000d9371bf30 pointer offset 16 size 2544 ist_add corruption. prev->next should be next
Message-ID: <xqGbbceZZfpScrUjLzi4aIaxDEn6eM-5uusdXyCYPe-CJ4prSGsCztpS6LdkRk1l3kGSBGIraVjdk3y8g5bPBrleLnXN3Bm8Tex0AYS9Nkw=@proton.me>
In-Reply-To: <7U4DoryKHwk5nrwUmPBHdm6PVnv01nM51PnTb3VAYzTtv2vPp7-FjwXkccToIFSQN6it9_9qqf5OyYRJtotDRorEfM907p3PNKvr3XUYlBY=@proton.me>
References: <7U4DoryKHwk5nrwUmPBHdm6PVnv01nM51PnTb3VAYzTtv2vPp7-FjwXkccToIFSQN6it9_9qqf5OyYRJtotDRorEfM907p3PNKvr3XUYlBY=@proton.me>
Feedback-ID: 167378330:user:proton
X-Pm-Message-ID: 40fcad259f9db3f672aab624576ce9f3ec1fd5a6
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
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha512; boundary="------957bdc663bae228a37a4f9212b360d3b92fb0f2170c71df0bed4ce9de8953d06"; charset=utf-8
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
	R_DKIM_ALLOW(-0.20)[proton.me:s=protonmail];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,multipart/alternative,text/plain,multipart/related];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16715-lists,linuxppc-dev=lfdr.de];
	TO_DN_EQ_ADDR_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:+,5:~,6:~,7:~];
	DKIM_TRACE(0.00)[proton.me:+];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[jfiusdq@proton.me,linuxppc-dev@lists.ozlabs.org];
	HAS_ATTACHMENT(0.00)[];
	NEURAL_HAM(-0.00)[-0.989];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[proton.me:email,proton.me:dkim,proton.me:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: E811710ABEB
X-Rspamd-Action: no action

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------957bdc663bae228a37a4f9212b360d3b92fb0f2170c71df0bed4ce9de8953d06
Content-Type: multipart/mixed;boundary=---------------------f4cf7e824c0f2e0800d9922013c19c1d

-----------------------f4cf7e824c0f2e0800d9922013c19c1d
Content-Type: multipart/alternative;boundary=---------------------e7c510de25f52d5b1c50c1c808a52ce9

-----------------------e7c510de25f52d5b1c50c1c808a52ce9
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;charset=utf-8

Sorry for duplicate but it happened after a disk started failing during a =
check that was triggered on all my 3 RAID arrays and then after a good whi=
le this bug happened. That's basically it.

[154043.105837] md: check of RAID array md125[154049.432225] md: check of =
RAID array md126
[154055.718196] md: check of RAID array md127
[163101.001572] sd 1:0:0:0: [sda] tag#8069 FAILED Result: hostbyte=3DDID_S=
OFT_ERROR driverbyte=3DDRIVER_OK cmd_age=3D0s
[163101.001655] sd 1:0:0:0: [sda] tag#8069 CDB: Read(10) 28 00 1b 28 d1 80=
 00 02 80 00
[163101.001691] I/O error, dev sda, sector 455659904 op 0x0:(READ) flags 0=
x80700 phys_seg 5 prio class 2
[163101.412714] sd 1:0:0:0: Power-on or device reset occurred
[163101.698759] sd 1:0:0:0: [sda] tag#7728 FAILED Result: hostbyte=3DDID_S=
OFT_ERROR driverbyte=3DDRIVER_OK cmd_age=3D0s
[163101.698813] sd 1:0:0:0: [sda] tag#7728 CDB: Read(10) 28 00 74 70 6d 00=
 00 00 80 00
[163101.698843] I/O error, dev sda, sector 1953524992 op 0x0:(READ) flags =
0x80700 phys_seg 1 prio class 2
[163102.162693] sd 1:0:0:0: Power-on or device reset occurred
[163102.447648] sd 1:0:0:0: [sda] Unaligned partial completion (resid=3D86=
6300, sector_sz=3D512)
[163102.447723] sd 1:0:0:0: [sda] tag#8049 CDB: Read(10) 28 00 5e 21 d4 00=
 00 08 00 00
[163102.447751] sd 1:0:0:0: [sda] tag#8049 FAILED Result: hostbyte=3DDID_S=
OFT_ERROR driverbyte=3DDRIVER_OK cmd_age=3D0s
[163102.447789] sd 1:0:0:0: [sda] tag#8049 CDB: Read(10) 28 00 5e 21 d4 00=
 00 08 00 00
[163102.447855] I/O error, dev sda, sector 1579275264 op 0x0:(READ) flags =
0x80700 phys_seg 8 prio class 2
[163102.912783] sd 1:0:0:0: Power-on or device reset occurred
[163103.662867] sd 1:0:0:0: Power-on or device reset occurred
[163104.413036] sd 1:0:0:0: Power-on or device reset occurred
[163105.163044] sd 1:0:0:0: Power-on or device reset occurred
[163105.913609] sd 1:0:0:0: Power-on or device reset occurred
[163106.663213] sd 1:0:0:0: Power-on or device reset occurred
[163107.289773] sd 1:0:0:0: Power-on or device reset occurred
[163107.932812] sd 1:0:0:0: Power-on or device reset occurred
[163108.913957] sd 1:0:0:0: Power-on or device reset occurred
[163109.664106] sd 1:0:0:0: Power-on or device reset occurred
[163110.414281] sd 1:0:0:0: Power-on or device reset occurred
[163111.164312] sd 1:0:0:0: Power-on or device reset occurred
[163111.913814] sd 1:0:0:0: Power-on or device reset occurred
[163112.663904] sd 1:0:0:0: Power-on or device reset occurred
[163113.414627] sd 1:0:0:0: Power-on or device reset occurred
[163113.699639] sd 1:0:0:0: [sda] Unaligned partial completion (resid=3D20=
5820, sector_sz=3D512)
[163113.699771] sd 1:0:0:0: [sda] tag#7615 CDB: Read(10) 28 00 01 4d 84 00=
 00 04 00 00
[163113.699976] sd 1:0:0:0: [sda] tag#7615 FAILED Result: hostbyte=3DDID_S=
OFT_ERROR driverbyte=3DDRIVER_OK cmd_age=3D0s
[163113.700198] sd 1:0:0:0: [sda] tag#7615 CDB: Read(10) 28 00 01 4d 84 00=
 00 04 00 00
[163113.700329] I/O error, dev sda, sector 21857280 op 0x0:(READ) flags 0x=
80700 phys_seg 4 prio class 2
[163114.164085] sd 1:0:0:0: Power-on or device reset occurred
[163114.914167] sd 1:0:0:0: Power-on or device reset occurred
[163115.664261] sd 1:0:0:0: Power-on or device reset occurred
[163115.959965] sd 1:0:0:0: [sda] tag#8044 FAILED Result: hostbyte=3DDID_S=
OFT_ERROR driverbyte=3DDRIVER_OK cmd_age=3D0s
[163115.959963] sd 1:0:0:0: [sda] Unaligned partial completion (resid=3D30=
8220, sector_sz=3D512)
[163115.959996] sd 1:0:0:0: [sda] tag#8016 CDB: Read(10) 28 00 00 58 a0 00=
 00 04 00 00
[163115.960041] sd 1:0:0:0: [sda] tag#8044 CDB: Read(10) 28 00 1b 48 fc 00=
 00 04 00 00
[163115.960081] sd 1:0:0:0: [sda] tag#8016 FAILED Result: hostbyte=3DDID_S=
OFT_ERROR driverbyte=3DDRIVER_OK cmd_age=3D0s
[163115.960109] I/O error, dev sda, sector 457767936 op 0x0:(READ) flags 0=
x80700 phys_seg 8 prio class 2
[163115.960155] sd 1:0:0:0: [sda] tag#8016 CDB: Read(10) 28 00 00 58 a0 00=
 00 04 00 00
[163115.960402] I/O error, dev sda, sector 5808128 op 0x0:(READ) flags 0x8=
0700 phys_seg 4 prio class 2
[163116.414438] sd 1:0:0:0: Power-on or device reset occurred
[163116.706739] sd 1:0:0:0: [sda] tag#8103 FAILED Result: hostbyte=3DDID_S=
OFT_ERROR driverbyte=3DDRIVER_OK cmd_age=3D0s
[163116.706804] sd 1:0:0:0: [sda] tag#8103 CDB: Read(10) 28 00 0d 86 3c 00=
 00 08 00 00
[163116.706853] I/O error, dev sda, sector 226900992 op 0x0:(READ) flags 0=
x80700 phys_seg 12 prio class 2
[163117.109789] sd 1:0:0:0: Power-on or device reset occurred
[163117.914577] sd 1:0:0:0: Power-on or device reset occurred
[163497.189569] md: md126: check done.
[163829.231426] md: md127: check done.
[185096.100388] md: md125: check done.


and just after that, just the kernel logs you saw in my previous mail, not=
hing in between.
On Monday, February 9th, 2026 at 12:19 AM, jfiusdq <jfiusdq@proton.me> wro=
te:

> Hello,
> =


> =


> Today I was met with the following kernel log on IBM POWER9, abit worryi=
ng because of it concerning RAID6:
> =


> =


> [240888.555387] =C2=A0slab raid6-md125 start c000000d9371bf30 pointer of=
fset 16 size 2544
> [240888.555464] list_add corruption. prev->next should be next (c0000000=
2a3fc3e0), but was c000000d9371bf40. (prev=3Dc000000d9371bf40).
> [240888.555582] ------------[ cut here ]------------
> [240888.555615] kernel BUG at lib/list_debug.c:32!
> [240888.555650] Oops: Exception in kernel mode, sig: 5 [#1]
> [240888.555703] LE PAGE_SIZE=3D64K MMU=3DRadix =C2=A0SMP NR_CPUS=3D2048 =
NUMA PowerNV
> [240888.555755] Modules linked in: vendor_reset(OE) vfio_pci vfio_pci_co=
re vfio_iommu_spapr_tce vfio iommufd vhost_net vhost vhost_iotlb tap tun n=
ft_masq nft_reject_ipv4 act_csum cls_u32 sch_htb nf_nat_tftp nf_conntrack_=
tftp bridge stp llc kvm_hv kvm rfkill xt_conntrack nft_compat nft_fib_inet=
 nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_rejec=
t_ipv6 nft_reject nft_ct nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 =
nf_defrag_ipv4 nf_tables dm_cache_smq dm_cache raid456 async_raid6_recov a=
sync_memcpy async_pq async_xor async_tx sunrpc raid10 snd_hda_intel at24 j=
oydev snd_intel_dspcfg snd_hda_codec snd_hda_core onboard_usb_dev snd_hwde=
p snd_seq snd_seq_device snd_pcm ofpart tg3 powernv_flash snd_timer atlant=
ic vmx_crypto ipmi_powernv snd ipmi_devintf mtd ipmi_msghandler macsec rtc=
_opal opal_prd soundcore i2c_opal fuse dm_multipath loop nfnetlink zram lz=
4hc_compress lz4_compress xfs dm_thin_pool dm_persistent_data dm_bio_priso=
n dm_crypt raid1 nvme mpt3sas nvme_core uas usb_storage ast nvme_keyring
> [240888.555962] =C2=A0nvme_auth hkdf raid_class i2c_algo_bit scsi_transp=
ort_sas scsi_dh_rdac scsi_dh_emc scsi_dh_alua i2c_dev aes_gcm_p10_crypto c=
rypto_simd cryptd
> [240888.556531] CPU: 33 UID: 0 PID: 2851 Comm: dmcrypt_write/2 Tainted: =
G =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OE =C2=A0 =C2=A0 =C2=A0 6.18.8-200.fc=
43.ppc64le #1 PREEMPT(voluntary)
> [240888.556608] Tainted: [O]=3DOOT_MODULE, [E]=3DUNSIGNED_MODULE
> [240888.556650] Hardware name: T2P9D01 REV 1.00 POWER9 (raw) 0x4e1202 op=
al:skiboot-ecb1dc7 PowerNV
> [240888.556721] NIP: =C2=A0c000000000e098fc LR: c000000000e098f8 CTR: 00=
00000000000000
> [240888.556766] REGS: c0000000295e77a0 TRAP: 0700 =C2=A0 Tainted: G =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OE =C2=A0 =C2=A0 =C2=A0 =C2=A0(6.18.8-200.f=
c43.ppc64le)
> [240888.556822] MSR: =C2=A09000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE> =C2=
=A0CR: 24004280 =C2=A0XER: 00000000
> [240888.556904] CFAR: c00000000034542c IRQMASK: 0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GPR00: c00000000=
0e098f8 c0000000295e7a40 c0000000026ba900 0000000000000075
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GPR04: 00000000f=
fffbfff 0000000000000001 0000001ffc2d0000 0000000000000001
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GPR08: 000000000=
0000027 0000000000000000 0000000000000000 c0000000295e7890
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GPR12: c000201ff=
f18ffa8 c000001ffffde600 c000000000299c28 c0002000113fdb40
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GPR16: 000000000=
0000000 0000000000000000 0000000000000000 0000000000000000
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GPR20: 000000000=
0000000 0000000000000000 0000000000000000 0000000000000001
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GPR24: 000000000=
0000000 c0000000295e7c70 c00000002bbce800 c000001126d57830
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GPR28: 000000000=
0000000 c000201d2995b588 c00020005f464000 c000201d2995b540
> [240888.557339] NIP [c000000000e098fc] __list_add_valid_or_report+0xdc/0=
x140
> [240888.557405] LR [c000000000e098f8] __list_add_valid_or_report+0xd8/0x=
140
> [240888.557463] Call Trace:
> [240888.557484] [c0000000295e7a40] [c000000000e098f8] __list_add_valid_o=
r_report+0xd8/0x140 (unreliable)
> [240888.557541] [c0000000295e7ab0] [c0080000238f0ad4] release_stripe_plu=
g+0x9c/0x150 [raid456]
> [240888.557607] [c0000000295e7b00] [c0080000238f59f4] make_stripe_reques=
t+0x32c/0x560 [raid456]
> [240888.557678] [c0000000295e7bd0] [c0080000238f5df8] raid5_make_request=
+0x1d0/0x610 [raid456]
> [240888.557765] [c0000000295e7d10] [c000000001369a04] md_handle_request+=
0x1c4/0x400
> [240888.557850] [c0000000295e7da0] [c000000000d04010] __submit_bio+0x230=
/0x3d0
> [240888.557927] [c0000000295e7e40] [c000000000d04244] __submit_bio_noacc=
t+0x94/0x250
> [240888.557998] [c0000000295e7eb0] [c00000000138743c] dm_submit_bio_rema=
p+0x4c/0x120
> [240888.558070] [c0000000295e7ef0] [c00800001bce26a8] dmcrypt_write+0x1a=
0/0x200 [dm_crypt]
> [240888.558131] [c0000000295e7f90] [c000000000299da8] kthread+0x188/0x1a=
0
> [240888.558196] [c0000000295e7fe0] [c00000000000ded8] start_kernel_threa=
d+0x14/0x18
> [240888.558257] Code: f8c10060 f8010080 4b883b35 60000000 3c62ff82 38639=
388 e8c10060 e9210068 e8a60000 7d244b78 4b53baf5 60000000 <0fe00000> 7c080=
2a6 7c852378 7c641b78
> [240888.558363] ---[ end trace 0000000000000000 ]---
> [240889.114586] pstore: backend (nvram) writing error (-1)
> =


> [240889.114636] note: dmcrypt_write/2[2851] exited with irqs disabled
> [240889.114756] ------------[ cut here ]------------
> [240889.114785] WARNING: CPU: 33 PID: 2851 at kernel/exit.c:903 do_exit+=
0x5c/0x5b0
> [240889.114837] Modules linked in: vendor_reset(OE) vfio_pci vfio_pci_co=
re vfio_iommu_spapr_tce vfio iommufd vhost_net vhost vhost_iotlb tap tun n=
ft_masq nft_reject_ipv4 act_csum cls_u32 sch_htb nf_nat_tftp nf_conntrack_=
tftp bridge stp llc kvm_hv kvm rfkill xt_conntrack nft_compat nft_fib_inet=
 nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_rejec=
t_ipv6 nft_reject nft_ct nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 =
nf_defrag_ipv4 nf_tables dm_cache_smq dm_cache raid456 async_raid6_recov a=
sync_memcpy async_pq async_xor async_tx sunrpc raid10 snd_hda_intel at24 j=
oydev snd_intel_dspcfg snd_hda_codec snd_hda_core onboard_usb_dev snd_hwde=
p snd_seq snd_seq_device snd_pcm ofpart tg3 powernv_flash snd_timer atlant=
ic vmx_crypto ipmi_powernv snd ipmi_devintf mtd ipmi_msghandler macsec rtc=
_opal opal_prd soundcore i2c_opal fuse dm_multipath loop nfnetlink zram lz=
4hc_compress lz4_compress xfs dm_thin_pool dm_persistent_data dm_bio_priso=
n dm_crypt raid1 nvme mpt3sas nvme_core uas usb_storage ast nvme_keyring
> [240889.114993] =C2=A0nvme_auth hkdf raid_class i2c_algo_bit scsi_transp=
ort_sas scsi_dh_rdac scsi_dh_emc scsi_dh_alua i2c_dev aes_gcm_p10_crypto c=
rypto_simd cryptd
> [240889.115528] CPU: 33 UID: 0 PID: 2851 Comm: dmcrypt_write/2 Tainted: =
G =C2=A0 =C2=A0 =C2=A0D =C2=A0 =C2=A0OE =C2=A0 =C2=A0 =C2=A0 6.18.8-200.fc=
43.ppc64le #1 PREEMPT(voluntary)
> [240889.115641] Tainted: [D]=3DDIE, [O]=3DOOT_MODULE, [E]=3DUNSIGNED_MOD=
ULE
> [240889.115678] Hardware name: T2P9D01 REV 1.00 POWER9 (raw) 0x4e1202 op=
al:skiboot-ecb1dc7 PowerNV
> [240889.115771] NIP: =C2=A0c00000000026035c LR: c000000000260950 CTR: 00=
00000000000000
> [240889.115828] REGS: c0000000295e7330 TRAP: 0700 =C2=A0 Tainted: G =C2=A0=
 =C2=A0 =C2=A0D =C2=A0 =C2=A0OE =C2=A0 =C2=A0 =C2=A0 =C2=A0(6.18.8-200.f=
c43.ppc64le)
> [240889.115875] MSR: =C2=A09000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE=
> =C2=A0CR: 24004280 =C2=A0XER: 20040000
> [240889.115936] CFAR: c00000000026094c IRQMASK: 0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GPR00: c00000000=
0260950 c0000000295e75d0 c0000000026ba900 0000000000000005
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GPR04: 000000000=
0002710 0000000000000001 0000001ffc2d0000 0000000000000001
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GPR08: 000000000=
0000005 0000000000000001 c0000000295e7f18 0000000000004000
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GPR12: c000201ff=
f18ffa8 c000001ffffde600 0000000000000000 0000000000000000
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GPR16: 000000000=
0000000 0000000000000000 0000000000000000 0000000000000000
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GPR20: 000000000=
0000000 0000000000000000 0000000000000000 0000000000000000
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GPR24: 000000000=
0000000 0000000000000000 0000000000000000 0000000000000000
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GPR28: 000000000=
0000005 0000000000000003 c000000003e3a900 c00000004555e800
> [240889.116379] NIP [c00000000026035c] do_exit+0x5c/0x5b0
> [240889.116407] LR [c000000000260950] make_task_dead+0xa0/0x1d0
> [240889.116427] Call Trace:
> [240889.116473] [c0000000295e75d0] [c0000000295e7600] 0xc0000000295e7600=
 (unreliable)
> [240889.116549] [c0000000295e7670] [c000000000260950] make_task_dead+0xa=
0/0x1d0
> [240889.116621] [c0000000295e76f0] [c00000000002a314] oops_end+0x164/0x1=
a0
> [240889.116689] [c0000000295e7770] [c000000000009b2c] program_check_comm=
on_virt+0x3bc/0x3c0
> [240889.116749] ---- interrupt: 700 at __list_add_valid_or_report+0xdc/0=
x140
> [240889.116799] NIP: =C2=A0c000000000e098fc LR: c000000000e098f8 CTR: 00=
00000000000000
> [240889.116838] REGS: c0000000295e77a0 TRAP: 0700 =C2=A0 Tainted: G =C2=A0=
 =C2=A0 =C2=A0D =C2=A0 =C2=A0OE =C2=A0 =C2=A0 =C2=A0 =C2=A0(6.18.8-200.f=
c43.ppc64le)
> [240889.116905] MSR: =C2=A09000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE> =C2=
=A0CR: 24004280 =C2=A0XER: 00000000
> [240889.116967] CFAR: c00000000034542c IRQMASK: 0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GPR00: c00000000=
0e098f8 c0000000295e7a40 c0000000026ba900 0000000000000075
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GPR04: 00000000f=
fffbfff 0000000000000001 0000001ffc2d0000 0000000000000001
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GPR08: 000000000=
0000027 0000000000000000 0000000000000000 c0000000295e7890
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GPR12: c000201ff=
f18ffa8 c000001ffffde600 c000000000299c28 c0002000113fdb40
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GPR16: 000000000=
0000000 0000000000000000 0000000000000000 0000000000000000
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GPR20: 000000000=
0000000 0000000000000000 0000000000000000 0000000000000001
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GPR24: 000000000=
0000000 c0000000295e7c70 c00000002bbce800 c000001126d57830
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GPR28: 000000000=
0000000 c000201d2995b588 c00020005f464000 c000201d2995b540
> [240889.117343] NIP [c000000000e098fc] __list_add_valid_or_report+0xdc/0=
x140
> [240889.117400] LR [c000000000e098f8] __list_add_valid_or_report+0xd8/0x=
140
> [240889.117454] ---- interrupt: 700
> [240889.117487] [c0000000295e7ab0] [c0080000238f0ad4] release_stripe_plu=
g+0x9c/0x150 [raid456]
> [240889.117544] [c0000000295e7b00] [c0080000238f59f4] make_stripe_reques=
t+0x32c/0x560 [raid456]
> [240889.117605] [c0000000295e7bd0] [c0080000238f5df8] raid5_make_request=
+0x1d0/0x610 [raid456]
> [240889.117678] [c0000000295e7d10] [c000000001369a04] md_handle_request+=
0x1c4/0x400
> [240889.117738] [c0000000295e7da0] [c000000000d04010] __submit_bio+0x230=
/0x3d0
> [240889.117792] [c0000000295e7e40] [c000000000d04244] __submit_bio_noacc=
t+0x94/0x250
> [240889.117859] [c0000000295e7eb0] [c00000000138743c] dm_submit_bio_rema=
p+0x4c/0x120
> [240889.117956] [c0000000295e7ef0] [c00800001bce26a8] dmcrypt_write+0x1a=
0/0x200 [dm_crypt]
> [240889.118017] [c0000000295e7f90] [c000000000299da8] kthread+0x188/0x1a=
0
> [240889.118084] [c0000000295e7fe0] [c00000000000ded8] start_kernel_threa=
d+0x14/0x18
> [240889.118131] Code: 91610008 f8010010 f821ff61 e92d0c78 f9210078 39200=
000 892d0932 552907fe 0b090000 e95f0c68 312affff 7d295110 <0b090000> ebbf0=
b90 ebdf0b88 7fa3eb78
> [240889.118320] ---[ end trace 0000000000000000 ]---
> =


> =


> If that's any useful to reveal a bug, about the tainting module, it's a =
port of=C2=A0https://github.com/gnif/vendor-reset=C2=A0to ppc to reset som=
e older graphics cards, nothing that should affect what the log is talking=
 about, furthermore its been here for quite a long time without any errors=
.
> =


> =


> Thanks
-----------------------e7c510de25f52d5b1c50c1c808a52ce9
Content-Type: multipart/related;boundary=---------------------07ab608f90ba2fdc2ea3f985b83f0b83

-----------------------07ab608f90ba2fdc2ea3f985b83f0b83
Content-Type: text/html;charset=utf-8
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IEFyaWFsLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDE0
cHg7IGNvbG9yOiByZ2IoMCwgMCwgMCk7IGJhY2tncm91bmQtY29sb3I6IHJnYigyNTUsIDI1NSwg
MjU1KTsiPlNvcnJ5IGZvciBkdXBsaWNhdGUgYnV0IGl0IGhhcHBlbmVkIGFmdGVyIGEgZGlzayBz
dGFydGVkIGZhaWxpbmcgZHVyaW5nIGEgY2hlY2sgdGhhdCB3YXMgdHJpZ2dlcmVkIG9uIGFsbCBt
eSAzIFJBSUQgYXJyYXlzIGFuZCB0aGVuIGFmdGVyIGEgZ29vZCB3aGlsZSB0aGlzIGJ1ZyBoYXBw
ZW5lZC4gVGhhdCdzIGJhc2ljYWxseSBpdC48L2Rpdj48ZGl2IHN0eWxlPSJmb250LWZhbWlseTog
QXJpYWwsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTRweDsgY29sb3I6IHJnYigwLCAwLCAwKTsg
YmFja2dyb3VuZC1jb2xvcjogcmdiKDI1NSwgMjU1LCAyNTUpOyI+PGJyPjwvZGl2PjxkaXYgc3R5
bGU9ImZvbnQtZmFtaWx5OiBBcmlhbCwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxNHB4OyBjb2xv
cjogcmdiKDAsIDAsIDApOyBiYWNrZ3JvdW5kLWNvbG9yOiByZ2IoMjU1LCAyNTUsIDI1NSk7Ij48
c3Bhbj5bMTU0MDQzLjEwNTgzN10gbWQ6IGNoZWNrIG9mIFJBSUQgYXJyYXkgbWQxMjU8L3NwYW4+
PGRpdj48c3Bhbj5bMTU0MDQ5LjQzMjIyNV0gbWQ6IGNoZWNrIG9mIFJBSUQgYXJyYXkgbWQxMjY8
L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj5bMTU0MDU1LjcxODE5Nl0gbWQ6IGNoZWNrIG9mIFJBSUQg
YXJyYXkgbWQxMjc8L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj5bMTYzMTAxLjAwMTU3Ml0gc2QgMTow
OjA6MDogW3NkYV0gdGFnIzgwNjkgRkFJTEVEIFJlc3VsdDogaG9zdGJ5dGU9RElEX1NPRlRfRVJS
T1IgZHJpdmVyYnl0ZT1EUklWRVJfT0sgY21kX2FnZT0wczwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFu
PlsxNjMxMDEuMDAxNjU1XSBzZCAxOjA6MDowOiBbc2RhXSB0YWcjODA2OSBDREI6IFJlYWQoMTAp
IDI4IDAwIDFiIDI4IGQxIDgwIDAwIDAyIDgwIDAwPC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+WzE2
MzEwMS4wMDE2OTFdIEkvTyBlcnJvciwgZGV2IHNkYSwgc2VjdG9yIDQ1NTY1OTkwNCBvcCAweDA6
KFJFQUQpIGZsYWdzIDB4ODA3MDAgcGh5c19zZWcgNSBwcmlvIGNsYXNzIDI8L3NwYW4+PC9kaXY+
PGRpdj48c3Bhbj5bMTYzMTAxLjQxMjcxNF0gc2QgMTowOjA6MDogUG93ZXItb24gb3IgZGV2aWNl
IHJlc2V0IG9jY3VycmVkPC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+WzE2MzEwMS42OTg3NTldIHNk
IDE6MDowOjA6IFtzZGFdIHRhZyM3NzI4IEZBSUxFRCBSZXN1bHQ6IGhvc3RieXRlPURJRF9TT0ZU
X0VSUk9SIGRyaXZlcmJ5dGU9RFJJVkVSX09LIGNtZF9hZ2U9MHM8L3NwYW4+PC9kaXY+PGRpdj48
c3Bhbj5bMTYzMTAxLjY5ODgxM10gc2QgMTowOjA6MDogW3NkYV0gdGFnIzc3MjggQ0RCOiBSZWFk
KDEwKSAyOCAwMCA3NCA3MCA2ZCAwMCAwMCAwMCA4MCAwMDwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFu
PlsxNjMxMDEuNjk4ODQzXSBJL08gZXJyb3IsIGRldiBzZGEsIHNlY3RvciAxOTUzNTI0OTkyIG9w
IDB4MDooUkVBRCkgZmxhZ3MgMHg4MDcwMCBwaHlzX3NlZyAxIHByaW8gY2xhc3MgMjwvc3Bhbj48
L2Rpdj48ZGl2PjxzcGFuPlsxNjMxMDIuMTYyNjkzXSBzZCAxOjA6MDowOiBQb3dlci1vbiBvciBk
ZXZpY2UgcmVzZXQgb2NjdXJyZWQ8L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj5bMTYzMTAyLjQ0NzY0
OF0gc2QgMTowOjA6MDogW3NkYV0gVW5hbGlnbmVkIHBhcnRpYWwgY29tcGxldGlvbiAocmVzaWQ9
ODY2MzAwLCBzZWN0b3Jfc3o9NTEyKTwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPlsxNjMxMDIuNDQ3
NzIzXSBzZCAxOjA6MDowOiBbc2RhXSB0YWcjODA0OSBDREI6IFJlYWQoMTApIDI4IDAwIDVlIDIx
IGQ0IDAwIDAwIDA4IDAwIDAwPC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+WzE2MzEwMi40NDc3NTFd
IHNkIDE6MDowOjA6IFtzZGFdIHRhZyM4MDQ5IEZBSUxFRCBSZXN1bHQ6IGhvc3RieXRlPURJRF9T
T0ZUX0VSUk9SIGRyaXZlcmJ5dGU9RFJJVkVSX09LIGNtZF9hZ2U9MHM8L3NwYW4+PC9kaXY+PGRp
dj48c3Bhbj5bMTYzMTAyLjQ0Nzc4OV0gc2QgMTowOjA6MDogW3NkYV0gdGFnIzgwNDkgQ0RCOiBS
ZWFkKDEwKSAyOCAwMCA1ZSAyMSBkNCAwMCAwMCAwOCAwMCAwMDwvc3Bhbj48L2Rpdj48ZGl2Pjxz
cGFuPlsxNjMxMDIuNDQ3ODU1XSBJL08gZXJyb3IsIGRldiBzZGEsIHNlY3RvciAxNTc5Mjc1MjY0
IG9wIDB4MDooUkVBRCkgZmxhZ3MgMHg4MDcwMCBwaHlzX3NlZyA4IHByaW8gY2xhc3MgMjwvc3Bh
bj48L2Rpdj48ZGl2PjxzcGFuPlsxNjMxMDIuOTEyNzgzXSBzZCAxOjA6MDowOiBQb3dlci1vbiBv
ciBkZXZpY2UgcmVzZXQgb2NjdXJyZWQ8L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj5bMTYzMTAzLjY2
Mjg2N10gc2QgMTowOjA6MDogUG93ZXItb24gb3IgZGV2aWNlIHJlc2V0IG9jY3VycmVkPC9zcGFu
PjwvZGl2PjxkaXY+PHNwYW4+WzE2MzEwNC40MTMwMzZdIHNkIDE6MDowOjA6IFBvd2VyLW9uIG9y
IGRldmljZSByZXNldCBvY2N1cnJlZDwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPlsxNjMxMDUuMTYz
MDQ0XSBzZCAxOjA6MDowOiBQb3dlci1vbiBvciBkZXZpY2UgcmVzZXQgb2NjdXJyZWQ8L3NwYW4+
PC9kaXY+PGRpdj48c3Bhbj5bMTYzMTA1LjkxMzYwOV0gc2QgMTowOjA6MDogUG93ZXItb24gb3Ig
ZGV2aWNlIHJlc2V0IG9jY3VycmVkPC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+WzE2MzEwNi42NjMy
MTNdIHNkIDE6MDowOjA6IFBvd2VyLW9uIG9yIGRldmljZSByZXNldCBvY2N1cnJlZDwvc3Bhbj48
L2Rpdj48ZGl2PjxzcGFuPlsxNjMxMDcuMjg5NzczXSBzZCAxOjA6MDowOiBQb3dlci1vbiBvciBk
ZXZpY2UgcmVzZXQgb2NjdXJyZWQ8L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj5bMTYzMTA3LjkzMjgx
Ml0gc2QgMTowOjA6MDogUG93ZXItb24gb3IgZGV2aWNlIHJlc2V0IG9jY3VycmVkPC9zcGFuPjwv
ZGl2PjxkaXY+PHNwYW4+WzE2MzEwOC45MTM5NTddIHNkIDE6MDowOjA6IFBvd2VyLW9uIG9yIGRl
dmljZSByZXNldCBvY2N1cnJlZDwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPlsxNjMxMDkuNjY0MTA2
XSBzZCAxOjA6MDowOiBQb3dlci1vbiBvciBkZXZpY2UgcmVzZXQgb2NjdXJyZWQ8L3NwYW4+PC9k
aXY+PGRpdj48c3Bhbj5bMTYzMTEwLjQxNDI4MV0gc2QgMTowOjA6MDogUG93ZXItb24gb3IgZGV2
aWNlIHJlc2V0IG9jY3VycmVkPC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+WzE2MzExMS4xNjQzMTJd
IHNkIDE6MDowOjA6IFBvd2VyLW9uIG9yIGRldmljZSByZXNldCBvY2N1cnJlZDwvc3Bhbj48L2Rp
dj48ZGl2PjxzcGFuPlsxNjMxMTEuOTEzODE0XSBzZCAxOjA6MDowOiBQb3dlci1vbiBvciBkZXZp
Y2UgcmVzZXQgb2NjdXJyZWQ8L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj5bMTYzMTEyLjY2MzkwNF0g
c2QgMTowOjA6MDogUG93ZXItb24gb3IgZGV2aWNlIHJlc2V0IG9jY3VycmVkPC9zcGFuPjwvZGl2
PjxkaXY+PHNwYW4+WzE2MzExMy40MTQ2MjddIHNkIDE6MDowOjA6IFBvd2VyLW9uIG9yIGRldmlj
ZSByZXNldCBvY2N1cnJlZDwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPlsxNjMxMTMuNjk5NjM5XSBz
ZCAxOjA6MDowOiBbc2RhXSBVbmFsaWduZWQgcGFydGlhbCBjb21wbGV0aW9uIChyZXNpZD0yMDU4
MjAsIHNlY3Rvcl9zej01MTIpPC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+WzE2MzExMy42OTk3NzFd
IHNkIDE6MDowOjA6IFtzZGFdIHRhZyM3NjE1IENEQjogUmVhZCgxMCkgMjggMDAgMDEgNGQgODQg
MDAgMDAgMDQgMDAgMDA8L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj5bMTYzMTEzLjY5OTk3Nl0gc2Qg
MTowOjA6MDogW3NkYV0gdGFnIzc2MTUgRkFJTEVEIFJlc3VsdDogaG9zdGJ5dGU9RElEX1NPRlRf
RVJST1IgZHJpdmVyYnl0ZT1EUklWRVJfT0sgY21kX2FnZT0wczwvc3Bhbj48L2Rpdj48ZGl2Pjxz
cGFuPlsxNjMxMTMuNzAwMTk4XSBzZCAxOjA6MDowOiBbc2RhXSB0YWcjNzYxNSBDREI6IFJlYWQo
MTApIDI4IDAwIDAxIDRkIDg0IDAwIDAwIDA0IDAwIDAwPC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+
WzE2MzExMy43MDAzMjldIEkvTyBlcnJvciwgZGV2IHNkYSwgc2VjdG9yIDIxODU3MjgwIG9wIDB4
MDooUkVBRCkgZmxhZ3MgMHg4MDcwMCBwaHlzX3NlZyA0IHByaW8gY2xhc3MgMjwvc3Bhbj48L2Rp
dj48ZGl2PjxzcGFuPlsxNjMxMTQuMTY0MDg1XSBzZCAxOjA6MDowOiBQb3dlci1vbiBvciBkZXZp
Y2UgcmVzZXQgb2NjdXJyZWQ8L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj5bMTYzMTE0LjkxNDE2N10g
c2QgMTowOjA6MDogUG93ZXItb24gb3IgZGV2aWNlIHJlc2V0IG9jY3VycmVkPC9zcGFuPjwvZGl2
PjxkaXY+PHNwYW4+WzE2MzExNS42NjQyNjFdIHNkIDE6MDowOjA6IFBvd2VyLW9uIG9yIGRldmlj
ZSByZXNldCBvY2N1cnJlZDwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPlsxNjMxMTUuOTU5OTY1XSBz
ZCAxOjA6MDowOiBbc2RhXSB0YWcjODA0NCBGQUlMRUQgUmVzdWx0OiBob3N0Ynl0ZT1ESURfU09G
VF9FUlJPUiBkcml2ZXJieXRlPURSSVZFUl9PSyBjbWRfYWdlPTBzPC9zcGFuPjwvZGl2PjxkaXY+
PHNwYW4+WzE2MzExNS45NTk5NjNdIHNkIDE6MDowOjA6IFtzZGFdIFVuYWxpZ25lZCBwYXJ0aWFs
IGNvbXBsZXRpb24gKHJlc2lkPTMwODIyMCwgc2VjdG9yX3N6PTUxMik8L3NwYW4+PC9kaXY+PGRp
dj48c3Bhbj5bMTYzMTE1Ljk1OTk5Nl0gc2QgMTowOjA6MDogW3NkYV0gdGFnIzgwMTYgQ0RCOiBS
ZWFkKDEwKSAyOCAwMCAwMCA1OCBhMCAwMCAwMCAwNCAwMCAwMDwvc3Bhbj48L2Rpdj48ZGl2Pjxz
cGFuPlsxNjMxMTUuOTYwMDQxXSBzZCAxOjA6MDowOiBbc2RhXSB0YWcjODA0NCBDREI6IFJlYWQo
MTApIDI4IDAwIDFiIDQ4IGZjIDAwIDAwIDA0IDAwIDAwPC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+
WzE2MzExNS45NjAwODFdIHNkIDE6MDowOjA6IFtzZGFdIHRhZyM4MDE2IEZBSUxFRCBSZXN1bHQ6
IGhvc3RieXRlPURJRF9TT0ZUX0VSUk9SIGRyaXZlcmJ5dGU9RFJJVkVSX09LIGNtZF9hZ2U9MHM8
L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj5bMTYzMTE1Ljk2MDEwOV0gSS9PIGVycm9yLCBkZXYgc2Rh
LCBzZWN0b3IgNDU3NzY3OTM2IG9wIDB4MDooUkVBRCkgZmxhZ3MgMHg4MDcwMCBwaHlzX3NlZyA4
IHByaW8gY2xhc3MgMjwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPlsxNjMxMTUuOTYwMTU1XSBzZCAx
OjA6MDowOiBbc2RhXSB0YWcjODAxNiBDREI6IFJlYWQoMTApIDI4IDAwIDAwIDU4IGEwIDAwIDAw
IDA0IDAwIDAwPC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+WzE2MzExNS45NjA0MDJdIEkvTyBlcnJv
ciwgZGV2IHNkYSwgc2VjdG9yIDU4MDgxMjggb3AgMHgwOihSRUFEKSBmbGFncyAweDgwNzAwIHBo
eXNfc2VnIDQgcHJpbyBjbGFzcyAyPC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+WzE2MzExNi40MTQ0
MzhdIHNkIDE6MDowOjA6IFBvd2VyLW9uIG9yIGRldmljZSByZXNldCBvY2N1cnJlZDwvc3Bhbj48
L2Rpdj48ZGl2PjxzcGFuPlsxNjMxMTYuNzA2NzM5XSBzZCAxOjA6MDowOiBbc2RhXSB0YWcjODEw
MyBGQUlMRUQgUmVzdWx0OiBob3N0Ynl0ZT1ESURfU09GVF9FUlJPUiBkcml2ZXJieXRlPURSSVZF
Ul9PSyBjbWRfYWdlPTBzPC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+WzE2MzExNi43MDY4MDRdIHNk
IDE6MDowOjA6IFtzZGFdIHRhZyM4MTAzIENEQjogUmVhZCgxMCkgMjggMDAgMGQgODYgM2MgMDAg
MDAgMDggMDAgMDA8L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj5bMTYzMTE2LjcwNjg1M10gSS9PIGVy
cm9yLCBkZXYgc2RhLCBzZWN0b3IgMjI2OTAwOTkyIG9wIDB4MDooUkVBRCkgZmxhZ3MgMHg4MDcw
MCBwaHlzX3NlZyAxMiBwcmlvIGNsYXNzIDI8L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj5bMTYzMTE3
LjEwOTc4OV0gc2QgMTowOjA6MDogUG93ZXItb24gb3IgZGV2aWNlIHJlc2V0IG9jY3VycmVkPC9z
cGFuPjwvZGl2PjxkaXY+PHNwYW4+WzE2MzExNy45MTQ1NzddIHNkIDE6MDowOjA6IFBvd2VyLW9u
IG9yIGRldmljZSByZXNldCBvY2N1cnJlZDwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPlsxNjM0OTcu
MTg5NTY5XSBtZDogbWQxMjY6IGNoZWNrIGRvbmUuPC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+WzE2
MzgyOS4yMzE0MjZdIG1kOiBtZDEyNzogY2hlY2sgZG9uZS48L3NwYW4+PC9kaXY+PGRpdj48c3Bh
bj5bMTg1MDk2LjEwMDM4OF0gbWQ6IG1kMTI1OiBjaGVjayBkb25lLjwvc3Bhbj48L2Rpdj48c3Bh
bj48L3NwYW4+PC9kaXY+PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IEFyaWFsLCBzYW5zLXNlcmlm
OyBmb250LXNpemU6IDE0cHg7IGNvbG9yOiByZ2IoMCwgMCwgMCk7IGJhY2tncm91bmQtY29sb3I6
IHJnYigyNTUsIDI1NSwgMjU1KTsiPjxicj48L2Rpdj48ZGl2IHN0eWxlPSJmb250LWZhbWlseTog
QXJpYWwsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTRweDsgY29sb3I6IHJnYigwLCAwLCAwKTsg
YmFja2dyb3VuZC1jb2xvcjogcmdiKDI1NSwgMjU1LCAyNTUpOyI+YW5kIGp1c3QgYWZ0ZXIgdGhh
dCwganVzdCB0aGUga2VybmVsIGxvZ3MgeW91IHNhdyBpbiBteSBwcmV2aW91cyBtYWlsLCBub3Ro
aW5nIGluIGJldHdlZW4uPC9kaXY+PGRpdiBjbGFzcz0icHJvdG9ubWFpbF9xdW90ZSI+CiAgICAg
ICAgT24gTW9uZGF5LCBGZWJydWFyeSA5dGgsIDIwMjYgYXQgMTI6MTkgQU0sIGpmaXVzZHEgJmx0
O2pmaXVzZHFAcHJvdG9uLm1lJmd0OyB3cm90ZTo8YnI+CiAgICAgICAgPGJsb2NrcXVvdGUgY2xh
c3M9InByb3Rvbm1haWxfcXVvdGUiIHR5cGU9ImNpdGUiPgogICAgICAgICAgICA8ZGl2IHN0eWxl
PSJmb250LWZhbWlseTogQXJpYWwsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTRweDsgY29sb3I6
IHJnYigwLCAwLCAwKTsgYmFja2dyb3VuZC1jb2xvcjogcmdiKDI1NSwgMjU1LCAyNTUpOyI+PHNw
YW4+SGVsbG8sPC9zcGFuPjwvZGl2PjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBBcmlhbCwgc2Fu
cy1zZXJpZjsgZm9udC1zaXplOiAxNHB4OyBjb2xvcjogcmdiKDAsIDAsIDApOyBiYWNrZ3JvdW5k
LWNvbG9yOiByZ2IoMjU1LCAyNTUsIDI1NSk7Ij48c3Bhbj48YnI+PC9zcGFuPjwvZGl2PjxkaXYg
c3R5bGU9ImZvbnQtZmFtaWx5OiBBcmlhbCwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxNHB4OyBj
b2xvcjogcmdiKDAsIDAsIDApOyBiYWNrZ3JvdW5kLWNvbG9yOiByZ2IoMjU1LCAyNTUsIDI1NSk7
Ij48c3Bhbj5Ub2RheSBJIHdhcyBtZXQgd2l0aCB0aGUgZm9sbG93aW5nIGtlcm5lbCBsb2cgb24g
SUJNIFBPV0VSOSwgYWJpdCB3b3JyeWluZyBiZWNhdXNlIG9mIGl0IGNvbmNlcm5pbmcgUkFJRDY6
PC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+PGJyPjwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPlsyNDA4
ODguNTU1Mzg3XSAmbmJzcDtzbGFiIHJhaWQ2LW1kMTI1IHN0YXJ0IGMwMDAwMDBkOTM3MWJmMzAg
cG9pbnRlciBvZmZzZXQgMTYgc2l6ZSAyNTQ0PC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+WzI0MDg4
OC41NTU0NjRdIGxpc3RfYWRkIGNvcnJ1cHRpb24uIHByZXYtJmd0O25leHQgc2hvdWxkIGJlIG5l
eHQgKGMwMDAwMDAwMmEzZmMzZTApLCBidXQgd2FzIGMwMDAwMDBkOTM3MWJmNDAuIChwcmV2PWMw
MDAwMDBkOTM3MWJmNDApLjwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPlsyNDA4ODguNTU1NTgyXSAt
LS0tLS0tLS0tLS1bIGN1dCBoZXJlIF0tLS0tLS0tLS0tLS08L3NwYW4+PC9kaXY+PGRpdj48c3Bh
bj5bMjQwODg4LjU1NTYxNV0ga2VybmVsIEJVRyBhdCBsaWIvbGlzdF9kZWJ1Zy5jOjMyITwvc3Bh
bj48L2Rpdj48ZGl2PjxzcGFuPlsyNDA4ODguNTU1NjUwXSBPb3BzOiBFeGNlcHRpb24gaW4ga2Vy
bmVsIG1vZGUsIHNpZzogNSBbIzFdPC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+WzI0MDg4OC41NTU3
MDNdIExFIFBBR0VfU0laRT02NEsgTU1VPVJhZGl4ICZuYnNwO1NNUCBOUl9DUFVTPTIwNDggTlVN
QSBQb3dlck5WPC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+WzI0MDg4OC41NTU3NTVdIE1vZHVsZXMg
bGlua2VkIGluOiB2ZW5kb3JfcmVzZXQoT0UpIHZmaW9fcGNpIHZmaW9fcGNpX2NvcmUgdmZpb19p
b21tdV9zcGFwcl90Y2UgdmZpbyBpb21tdWZkIHZob3N0X25ldCB2aG9zdCB2aG9zdF9pb3RsYiB0
YXAgdHVuIG5mdF9tYXNxIG5mdF9yZWplY3RfaXB2NCBhY3RfY3N1bSBjbHNfdTMyIHNjaF9odGIg
bmZfbmF0X3RmdHAgbmZfY29ubnRyYWNrX3RmdHAgYnJpZGdlIHN0cCBsbGMga3ZtX2h2IGt2bSBy
ZmtpbGwgeHRfY29ubnRyYWNrIG5mdF9jb21wYXQgbmZ0X2ZpYl9pbmV0IG5mdF9maWJfaXB2NCBu
ZnRfZmliX2lwdjYgbmZ0X2ZpYiBuZnRfcmVqZWN0X2luZXQgbmZfcmVqZWN0X2lwdjQgbmZfcmVq
ZWN0X2lwdjYgbmZ0X3JlamVjdCBuZnRfY3QgbmZ0X2NoYWluX25hdCBuZl9uYXQgbmZfY29ubnRy
YWNrIG5mX2RlZnJhZ19pcHY2IG5mX2RlZnJhZ19pcHY0IG5mX3RhYmxlcyBkbV9jYWNoZV9zbXEg
ZG1fY2FjaGUgcmFpZDQ1NiBhc3luY19yYWlkNl9yZWNvdiBhc3luY19tZW1jcHkgYXN5bmNfcHEg
YXN5bmNfeG9yIGFzeW5jX3R4IHN1bnJwYyByYWlkMTAgc25kX2hkYV9pbnRlbCBhdDI0IGpveWRl
diBzbmRfaW50ZWxfZHNwY2ZnIHNuZF9oZGFfY29kZWMgc25kX2hkYV9jb3JlIG9uYm9hcmRfdXNi
X2RldiBzbmRfaHdkZXAgc25kX3NlcSBzbmRfc2VxX2RldmljZSBzbmRfcGNtIG9mcGFydCB0ZzMg
cG93ZXJudl9mbGFzaCBzbmRfdGltZXIgYXRsYW50aWMgdm14X2NyeXB0byBpcG1pX3Bvd2VybnYg
c25kIGlwbWlfZGV2aW50ZiBtdGQgaXBtaV9tc2doYW5kbGVyIG1hY3NlYyBydGNfb3BhbCBvcGFs
X3ByZCBzb3VuZGNvcmUgaTJjX29wYWwgZnVzZSBkbV9tdWx0aXBhdGggbG9vcCBuZm5ldGxpbmsg
enJhbSBsejRoY19jb21wcmVzcyBsejRfY29tcHJlc3MgeGZzIGRtX3RoaW5fcG9vbCBkbV9wZXJz
aXN0ZW50X2RhdGEgZG1fYmlvX3ByaXNvbiBkbV9jcnlwdCByYWlkMSBudm1lIG1wdDNzYXMgbnZt
ZV9jb3JlIHVhcyB1c2Jfc3RvcmFnZSBhc3QgbnZtZV9rZXlyaW5nPC9zcGFuPjwvZGl2PjxkaXY+
PHNwYW4+WzI0MDg4OC41NTU5NjJdICZuYnNwO252bWVfYXV0aCBoa2RmIHJhaWRfY2xhc3MgaTJj
X2FsZ29fYml0IHNjc2lfdHJhbnNwb3J0X3NhcyBzY3NpX2RoX3JkYWMgc2NzaV9kaF9lbWMgc2Nz
aV9kaF9hbHVhIGkyY19kZXYgYWVzX2djbV9wMTBfY3J5cHRvIGNyeXB0b19zaW1kIGNyeXB0ZDwv
c3Bhbj48L2Rpdj48ZGl2PjxzcGFuPlsyNDA4ODguNTU2NTMxXSBDUFU6IDMzIFVJRDogMCBQSUQ6
IDI4NTEgQ29tbTogZG1jcnlwdF93cml0ZS8yIFRhaW50ZWQ6IEcgJm5ic3A7ICZuYnNwOyAmbmJz
cDsgJm5ic3A7ICZuYnNwOyBPRSAmbmJzcDsgJm5ic3A7ICZuYnNwOyA2LjE4LjgtMjAwLmZjNDMu
cHBjNjRsZSAjMSBQUkVFTVBUKHZvbHVudGFyeSkgPC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+WzI0
MDg4OC41NTY2MDhdIFRhaW50ZWQ6IFtPXT1PT1RfTU9EVUxFLCBbRV09VU5TSUdORURfTU9EVUxF
PC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+WzI0MDg4OC41NTY2NTBdIEhhcmR3YXJlIG5hbWU6IFQy
UDlEMDEgUkVWIDEuMDAgUE9XRVI5IChyYXcpIDB4NGUxMjAyIG9wYWw6c2tpYm9vdC1lY2IxZGM3
IFBvd2VyTlY8L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj5bMjQwODg4LjU1NjcyMV0gTklQOiAmbmJz
cDtjMDAwMDAwMDAwZTA5OGZjIExSOiBjMDAwMDAwMDAwZTA5OGY4IENUUjogMDAwMDAwMDAwMDAw
MDAwMDwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPlsyNDA4ODguNTU2NzY2XSBSRUdTOiBjMDAwMDAw
MDI5NWU3N2EwIFRSQVA6IDA3MDAgJm5ic3A7IFRhaW50ZWQ6IEcgJm5ic3A7ICZuYnNwOyAmbmJz
cDsgJm5ic3A7ICZuYnNwOyBPRSAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsoNi4xOC44LTIw
MC5mYzQzLnBwYzY0bGUpPC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+WzI0MDg4OC41NTY4MjJdIE1T
UjogJm5ic3A7OTAwMDAwMDAwMDAyOTAzMyAmbHQ7U0YsSFYsRUUsTUUsSVIsRFIsUkksTEUmZ3Q7
ICZuYnNwO0NSOiAyNDAwNDI4MCAmbmJzcDtYRVI6IDAwMDAwMDAwPC9zcGFuPjwvZGl2PjxkaXY+
PHNwYW4+WzI0MDg4OC41NTY5MDRdIENGQVI6IGMwMDAwMDAwMDAzNDU0MmMgSVJRTUFTSzogMCA8
L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj4mbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7
ICZuYnNwOyAmbmJzcDsgJm5ic3A7IEdQUjAwOiBjMDAwMDAwMDAwZTA5OGY4IGMwMDAwMDAwMjk1
ZTdhNDAgYzAwMDAwMDAwMjZiYTkwMCAwMDAwMDAwMDAwMDAwMDc1IDwvc3Bhbj48L2Rpdj48ZGl2
PjxzcGFuPiZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAm
bmJzcDsgR1BSMDQ6IDAwMDAwMDAwZmZmZmJmZmYgMDAwMDAwMDAwMDAwMDAwMSAwMDAwMDAxZmZj
MmQwMDAwIDAwMDAwMDAwMDAwMDAwMDEgPC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+Jm5ic3A7ICZu
YnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyBHUFIwODogMDAw
MDAwMDAwMDAwMDAyNyAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDAgYzAwMDAwMDAy
OTVlNzg5MCA8L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj4mbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJz
cDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7IEdQUjEyOiBjMDAwMjAxZmZmMThmZmE4IGMw
MDAwMDFmZmZmZGU2MDAgYzAwMDAwMDAwMDI5OWMyOCBjMDAwMjAwMDExM2ZkYjQwIDwvc3Bhbj48
L2Rpdj48ZGl2PjxzcGFuPiZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7
ICZuYnNwOyAmbmJzcDsgR1BSMTY6IDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAwMDAwMCAw
MDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDAgPC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+
Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyBH
UFIyMDogMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDAg
MDAwMDAwMDAwMDAwMDAwMSA8L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj4mbmJzcDsgJm5ic3A7ICZu
YnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7IEdQUjI0OiAwMDAwMDAwMDAw
MDAwMDAwIGMwMDAwMDAwMjk1ZTdjNzAgYzAwMDAwMDAyYmJjZTgwMCBjMDAwMDAxMTI2ZDU3ODMw
IDwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPiZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJz
cDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgR1BSMjg6IDAwMDAwMDAwMDAwMDAwMDAgYzAwMDIwMWQy
OTk1YjU4OCBjMDAwMjAwMDVmNDY0MDAwIGMwMDAyMDFkMjk5NWI1NDAgPC9zcGFuPjwvZGl2Pjxk
aXY+PHNwYW4+WzI0MDg4OC41NTczMzldIE5JUCBbYzAwMDAwMDAwMGUwOThmY10gX19saXN0X2Fk
ZF92YWxpZF9vcl9yZXBvcnQrMHhkYy8weDE0MDwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPlsyNDA4
ODguNTU3NDA1XSBMUiBbYzAwMDAwMDAwMGUwOThmOF0gX19saXN0X2FkZF92YWxpZF9vcl9yZXBv
cnQrMHhkOC8weDE0MDwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPlsyNDA4ODguNTU3NDYzXSBDYWxs
IFRyYWNlOjwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPlsyNDA4ODguNTU3NDg0XSBbYzAwMDAwMDAy
OTVlN2E0MF0gW2MwMDAwMDAwMDBlMDk4ZjhdIF9fbGlzdF9hZGRfdmFsaWRfb3JfcmVwb3J0KzB4
ZDgvMHgxNDAgKHVucmVsaWFibGUpPC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+WzI0MDg4OC41NTc1
NDFdIFtjMDAwMDAwMDI5NWU3YWIwXSBbYzAwODAwMDAyMzhmMGFkNF0gcmVsZWFzZV9zdHJpcGVf
cGx1ZysweDljLzB4MTUwIFtyYWlkNDU2XTwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPlsyNDA4ODgu
NTU3NjA3XSBbYzAwMDAwMDAyOTVlN2IwMF0gW2MwMDgwMDAwMjM4ZjU5ZjRdIG1ha2Vfc3RyaXBl
X3JlcXVlc3QrMHgzMmMvMHg1NjAgW3JhaWQ0NTZdPC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+WzI0
MDg4OC41NTc2NzhdIFtjMDAwMDAwMDI5NWU3YmQwXSBbYzAwODAwMDAyMzhmNWRmOF0gcmFpZDVf
bWFrZV9yZXF1ZXN0KzB4MWQwLzB4NjEwIFtyYWlkNDU2XTwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFu
PlsyNDA4ODguNTU3NzY1XSBbYzAwMDAwMDAyOTVlN2QxMF0gW2MwMDAwMDAwMDEzNjlhMDRdIG1k
X2hhbmRsZV9yZXF1ZXN0KzB4MWM0LzB4NDAwPC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+WzI0MDg4
OC41NTc4NTBdIFtjMDAwMDAwMDI5NWU3ZGEwXSBbYzAwMDAwMDAwMGQwNDAxMF0gX19zdWJtaXRf
YmlvKzB4MjMwLzB4M2QwPC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+WzI0MDg4OC41NTc5MjddIFtj
MDAwMDAwMDI5NWU3ZTQwXSBbYzAwMDAwMDAwMGQwNDI0NF0gX19zdWJtaXRfYmlvX25vYWNjdCsw
eDk0LzB4MjUwPC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+WzI0MDg4OC41NTc5OThdIFtjMDAwMDAw
MDI5NWU3ZWIwXSBbYzAwMDAwMDAwMTM4NzQzY10gZG1fc3VibWl0X2Jpb19yZW1hcCsweDRjLzB4
MTIwPC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+WzI0MDg4OC41NTgwNzBdIFtjMDAwMDAwMDI5NWU3
ZWYwXSBbYzAwODAwMDAxYmNlMjZhOF0gZG1jcnlwdF93cml0ZSsweDFhMC8weDIwMCBbZG1fY3J5
cHRdPC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+WzI0MDg4OC41NTgxMzFdIFtjMDAwMDAwMDI5NWU3
ZjkwXSBbYzAwMDAwMDAwMDI5OWRhOF0ga3RocmVhZCsweDE4OC8weDFhMDwvc3Bhbj48L2Rpdj48
ZGl2PjxzcGFuPlsyNDA4ODguNTU4MTk2XSBbYzAwMDAwMDAyOTVlN2ZlMF0gW2MwMDAwMDAwMDAw
MGRlZDhdIHN0YXJ0X2tlcm5lbF90aHJlYWQrMHgxNC8weDE4PC9zcGFuPjwvZGl2PjxkaXY+PHNw
YW4+WzI0MDg4OC41NTgyNTddIENvZGU6IGY4YzEwMDYwIGY4MDEwMDgwIDRiODgzYjM1IDYwMDAw
MDAwIDNjNjJmZjgyIDM4NjM5Mzg4IGU4YzEwMDYwIGU5MjEwMDY4IGU4YTYwMDAwIDdkMjQ0Yjc4
IDRiNTNiYWY1IDYwMDAwMDAwICZsdDswZmUwMDAwMCZndDsgN2MwODAyYTYgN2M4NTIzNzggN2M2
NDFiNzggPC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+WzI0MDg4OC41NTgzNjNdIC0tLVsgZW5kIHRy
YWNlIDAwMDAwMDAwMDAwMDAwMDAgXS0tLTwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPlsyNDA4ODku
MTE0NTg2XSBwc3RvcmU6IGJhY2tlbmQgKG52cmFtKSB3cml0aW5nIGVycm9yICgtMSk8L3NwYW4+
PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj48c3Bhbj5bMjQwODg5LjExNDYzNl0gbm90ZTogZG1j
cnlwdF93cml0ZS8yWzI4NTFdIGV4aXRlZCB3aXRoIGlycXMgZGlzYWJsZWQ8L3NwYW4+PC9kaXY+
PGRpdj48c3Bhbj5bMjQwODg5LjExNDc1Nl0gLS0tLS0tLS0tLS0tWyBjdXQgaGVyZSBdLS0tLS0t
LS0tLS0tPC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+WzI0MDg4OS4xMTQ3ODVdIFdBUk5JTkc6IENQ
VTogMzMgUElEOiAyODUxIGF0IGtlcm5lbC9leGl0LmM6OTAzIGRvX2V4aXQrMHg1Yy8weDViMDwv
c3Bhbj48L2Rpdj48ZGl2PjxzcGFuPlsyNDA4ODkuMTE0ODM3XSBNb2R1bGVzIGxpbmtlZCBpbjog
dmVuZG9yX3Jlc2V0KE9FKSB2ZmlvX3BjaSB2ZmlvX3BjaV9jb3JlIHZmaW9faW9tbXVfc3BhcHJf
dGNlIHZmaW8gaW9tbXVmZCB2aG9zdF9uZXQgdmhvc3Qgdmhvc3RfaW90bGIgdGFwIHR1biBuZnRf
bWFzcSBuZnRfcmVqZWN0X2lwdjQgYWN0X2NzdW0gY2xzX3UzMiBzY2hfaHRiIG5mX25hdF90ZnRw
IG5mX2Nvbm50cmFja190ZnRwIGJyaWRnZSBzdHAgbGxjIGt2bV9odiBrdm0gcmZraWxsIHh0X2Nv
bm50cmFjayBuZnRfY29tcGF0IG5mdF9maWJfaW5ldCBuZnRfZmliX2lwdjQgbmZ0X2ZpYl9pcHY2
IG5mdF9maWIgbmZ0X3JlamVjdF9pbmV0IG5mX3JlamVjdF9pcHY0IG5mX3JlamVjdF9pcHY2IG5m
dF9yZWplY3QgbmZ0X2N0IG5mdF9jaGFpbl9uYXQgbmZfbmF0IG5mX2Nvbm50cmFjayBuZl9kZWZy
YWdfaXB2NiBuZl9kZWZyYWdfaXB2NCBuZl90YWJsZXMgZG1fY2FjaGVfc21xIGRtX2NhY2hlIHJh
aWQ0NTYgYXN5bmNfcmFpZDZfcmVjb3YgYXN5bmNfbWVtY3B5IGFzeW5jX3BxIGFzeW5jX3hvciBh
c3luY190eCBzdW5ycGMgcmFpZDEwIHNuZF9oZGFfaW50ZWwgYXQyNCBqb3lkZXYgc25kX2ludGVs
X2RzcGNmZyBzbmRfaGRhX2NvZGVjIHNuZF9oZGFfY29yZSBvbmJvYXJkX3VzYl9kZXYgc25kX2h3
ZGVwIHNuZF9zZXEgc25kX3NlcV9kZXZpY2Ugc25kX3BjbSBvZnBhcnQgdGczIHBvd2VybnZfZmxh
c2ggc25kX3RpbWVyIGF0bGFudGljIHZteF9jcnlwdG8gaXBtaV9wb3dlcm52IHNuZCBpcG1pX2Rl
dmludGYgbXRkIGlwbWlfbXNnaGFuZGxlciBtYWNzZWMgcnRjX29wYWwgb3BhbF9wcmQgc291bmRj
b3JlIGkyY19vcGFsIGZ1c2UgZG1fbXVsdGlwYXRoIGxvb3AgbmZuZXRsaW5rIHpyYW0gbHo0aGNf
Y29tcHJlc3MgbHo0X2NvbXByZXNzIHhmcyBkbV90aGluX3Bvb2wgZG1fcGVyc2lzdGVudF9kYXRh
IGRtX2Jpb19wcmlzb24gZG1fY3J5cHQgcmFpZDEgbnZtZSBtcHQzc2FzIG52bWVfY29yZSB1YXMg
dXNiX3N0b3JhZ2UgYXN0IG52bWVfa2V5cmluZzwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPlsyNDA4
ODkuMTE0OTkzXSAmbmJzcDtudm1lX2F1dGggaGtkZiByYWlkX2NsYXNzIGkyY19hbGdvX2JpdCBz
Y3NpX3RyYW5zcG9ydF9zYXMgc2NzaV9kaF9yZGFjIHNjc2lfZGhfZW1jIHNjc2lfZGhfYWx1YSBp
MmNfZGV2IGFlc19nY21fcDEwX2NyeXB0byBjcnlwdG9fc2ltZCBjcnlwdGQ8L3NwYW4+PC9kaXY+
PGRpdj48c3Bhbj5bMjQwODg5LjExNTUyOF0gQ1BVOiAzMyBVSUQ6IDAgUElEOiAyODUxIENvbW06
IGRtY3J5cHRfd3JpdGUvMiBUYWludGVkOiBHICZuYnNwOyAmbmJzcDsgJm5ic3A7RCAmbmJzcDsg
Jm5ic3A7T0UgJm5ic3A7ICZuYnNwOyAmbmJzcDsgNi4xOC44LTIwMC5mYzQzLnBwYzY0bGUgIzEg
UFJFRU1QVCh2b2x1bnRhcnkpIDwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPlsyNDA4ODkuMTE1NjQx
XSBUYWludGVkOiBbRF09RElFLCBbT109T09UX01PRFVMRSwgW0VdPVVOU0lHTkVEX01PRFVMRTwv
c3Bhbj48L2Rpdj48ZGl2PjxzcGFuPlsyNDA4ODkuMTE1Njc4XSBIYXJkd2FyZSBuYW1lOiBUMlA5
RDAxIFJFViAxLjAwIFBPV0VSOSAocmF3KSAweDRlMTIwMiBvcGFsOnNraWJvb3QtZWNiMWRjNyBQ
b3dlck5WPC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+WzI0MDg4OS4xMTU3NzFdIE5JUDogJm5ic3A7
YzAwMDAwMDAwMDI2MDM1YyBMUjogYzAwMDAwMDAwMDI2MDk1MCBDVFI6IDAwMDAwMDAwMDAwMDAw
MDA8L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj5bMjQwODg5LjExNTgyOF0gUkVHUzogYzAwMDAwMDAy
OTVlNzMzMCBUUkFQOiAwNzAwICZuYnNwOyBUYWludGVkOiBHICZuYnNwOyAmbmJzcDsgJm5ic3A7
RCAmbmJzcDsgJm5ic3A7T0UgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7KDYuMTguOC0yMDAu
ZmM0My5wcGM2NGxlKTwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPlsyNDA4ODkuMTE1ODc1XSBNU1I6
ICZuYnNwOzkwMDAwMDAwMDIwMjkwMzMgJmx0O1NGLEhWLFZFQyxFRSxNRSxJUixEUixSSSxMRSZn
dDsgJm5ic3A7Q1I6IDI0MDA0MjgwICZuYnNwO1hFUjogMjAwNDAwMDA8L3NwYW4+PC9kaXY+PGRp
dj48c3Bhbj5bMjQwODg5LjExNTkzNl0gQ0ZBUjogYzAwMDAwMDAwMDI2MDk0YyBJUlFNQVNLOiAw
IDwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPiZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJz
cDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgR1BSMDA6IGMwMDAwMDAwMDAyNjA5NTAgYzAwMDAwMDAy
OTVlNzVkMCBjMDAwMDAwMDAyNmJhOTAwIDAwMDAwMDAwMDAwMDAwMDUgPC9zcGFuPjwvZGl2Pjxk
aXY+PHNwYW4+Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7
ICZuYnNwOyBHUFIwNDogMDAwMDAwMDAwMDAwMjcxMCAwMDAwMDAwMDAwMDAwMDAxIDAwMDAwMDFm
ZmMyZDAwMDAgMDAwMDAwMDAwMDAwMDAwMSA8L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj4mbmJzcDsg
Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7IEdQUjA4OiAw
MDAwMDAwMDAwMDAwMDA1IDAwMDAwMDAwMDAwMDAwMDEgYzAwMDAwMDAyOTVlN2YxOCAwMDAwMDAw
MDAwMDA0MDAwIDwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPiZuYnNwOyAmbmJzcDsgJm5ic3A7ICZu
YnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgR1BSMTI6IGMwMDAyMDFmZmYxOGZmYTgg
YzAwMDAwMWZmZmZkZTYwMCAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDAgPC9zcGFu
PjwvZGl2PjxkaXY+PHNwYW4+Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJz
cDsgJm5ic3A7ICZuYnNwOyBHUFIxNjogMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMDAwMDAwMDAw
IDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAwMDAwMCA8L3NwYW4+PC9kaXY+PGRpdj48c3Bh
bj4mbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7
IEdQUjIwOiAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAwMDAw
MCAwMDAwMDAwMDAwMDAwMDAwIDwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPiZuYnNwOyAmbmJzcDsg
Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgR1BSMjQ6IDAwMDAwMDAw
MDAwMDAwMDAgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAw
MDAgPC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZu
YnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyBHUFIyODogMDAwMDAwMDAwMDAwMDAwNSAwMDAwMDAw
MDAwMDAwMDAzIGMwMDAwMDAwMDNlM2E5MDAgYzAwMDAwMDA0NTU1ZTgwMCA8L3NwYW4+PC9kaXY+
PGRpdj48c3Bhbj5bMjQwODg5LjExNjM3OV0gTklQIFtjMDAwMDAwMDAwMjYwMzVjXSBkb19leGl0
KzB4NWMvMHg1YjA8L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj5bMjQwODg5LjExNjQwN10gTFIgW2Mw
MDAwMDAwMDAyNjA5NTBdIG1ha2VfdGFza19kZWFkKzB4YTAvMHgxZDA8L3NwYW4+PC9kaXY+PGRp
dj48c3Bhbj5bMjQwODg5LjExNjQyN10gQ2FsbCBUcmFjZTo8L3NwYW4+PC9kaXY+PGRpdj48c3Bh
bj5bMjQwODg5LjExNjQ3M10gW2MwMDAwMDAwMjk1ZTc1ZDBdIFtjMDAwMDAwMDI5NWU3NjAwXSAw
eGMwMDAwMDAwMjk1ZTc2MDAgKHVucmVsaWFibGUpPC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+WzI0
MDg4OS4xMTY1NDldIFtjMDAwMDAwMDI5NWU3NjcwXSBbYzAwMDAwMDAwMDI2MDk1MF0gbWFrZV90
YXNrX2RlYWQrMHhhMC8weDFkMDwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPlsyNDA4ODkuMTE2NjIx
XSBbYzAwMDAwMDAyOTVlNzZmMF0gW2MwMDAwMDAwMDAwMmEzMTRdIG9vcHNfZW5kKzB4MTY0LzB4
MWEwPC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+WzI0MDg4OS4xMTY2ODldIFtjMDAwMDAwMDI5NWU3
NzcwXSBbYzAwMDAwMDAwMDAwOWIyY10gcHJvZ3JhbV9jaGVja19jb21tb25fdmlydCsweDNiYy8w
eDNjMDwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPlsyNDA4ODkuMTE2NzQ5XSAtLS0tIGludGVycnVw
dDogNzAwIGF0IF9fbGlzdF9hZGRfdmFsaWRfb3JfcmVwb3J0KzB4ZGMvMHgxNDA8L3NwYW4+PC9k
aXY+PGRpdj48c3Bhbj5bMjQwODg5LjExNjc5OV0gTklQOiAmbmJzcDtjMDAwMDAwMDAwZTA5OGZj
IExSOiBjMDAwMDAwMDAwZTA5OGY4IENUUjogMDAwMDAwMDAwMDAwMDAwMDwvc3Bhbj48L2Rpdj48
ZGl2PjxzcGFuPlsyNDA4ODkuMTE2ODM4XSBSRUdTOiBjMDAwMDAwMDI5NWU3N2EwIFRSQVA6IDA3
MDAgJm5ic3A7IFRhaW50ZWQ6IEcgJm5ic3A7ICZuYnNwOyAmbmJzcDtEICZuYnNwOyAmbmJzcDtP
RSAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsoNi4xOC44LTIwMC5mYzQzLnBwYzY0bGUpPC9z
cGFuPjwvZGl2PjxkaXY+PHNwYW4+WzI0MDg4OS4xMTY5MDVdIE1TUjogJm5ic3A7OTAwMDAwMDAw
MDAyOTAzMyAmbHQ7U0YsSFYsRUUsTUUsSVIsRFIsUkksTEUmZ3Q7ICZuYnNwO0NSOiAyNDAwNDI4
MCAmbmJzcDtYRVI6IDAwMDAwMDAwPC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+WzI0MDg4OS4xMTY5
NjddIENGQVI6IGMwMDAwMDAwMDAzNDU0MmMgSVJRTUFTSzogMCA8L3NwYW4+PC9kaXY+PGRpdj48
c3Bhbj4mbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5i
c3A7IEdQUjAwOiBjMDAwMDAwMDAwZTA5OGY4IGMwMDAwMDAwMjk1ZTdhNDAgYzAwMDAwMDAwMjZi
YTkwMCAwMDAwMDAwMDAwMDAwMDc1IDwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPiZuYnNwOyAmbmJz
cDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgR1BSMDQ6IDAwMDAw
MDAwZmZmZmJmZmYgMDAwMDAwMDAwMDAwMDAwMSAwMDAwMDAxZmZjMmQwMDAwIDAwMDAwMDAwMDAw
MDAwMDEgPC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7
ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyBHUFIwODogMDAwMDAwMDAwMDAwMDAyNyAwMDAw
MDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDAgYzAwMDAwMDAyOTVlNzg5MCA8L3NwYW4+PC9k
aXY+PGRpdj48c3Bhbj4mbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAm
bmJzcDsgJm5ic3A7IEdQUjEyOiBjMDAwMjAxZmZmMThmZmE4IGMwMDAwMDFmZmZmZGU2MDAgYzAw
MDAwMDAwMDI5OWMyOCBjMDAwMjAwMDExM2ZkYjQwIDwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPiZu
YnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgR1BS
MTY6IDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMDAwMDAwMDAwIDAw
MDAwMDAwMDAwMDAwMDAgPC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+Jm5ic3A7ICZuYnNwOyAmbmJz
cDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyBHUFIyMDogMDAwMDAwMDAwMDAw
MDAwMCAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAwMDAwMSA8
L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj4mbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7
ICZuYnNwOyAmbmJzcDsgJm5ic3A7IEdQUjI0OiAwMDAwMDAwMDAwMDAwMDAwIGMwMDAwMDAwMjk1
ZTdjNzAgYzAwMDAwMDAyYmJjZTgwMCBjMDAwMDAxMTI2ZDU3ODMwIDwvc3Bhbj48L2Rpdj48ZGl2
PjxzcGFuPiZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAm
bmJzcDsgR1BSMjg6IDAwMDAwMDAwMDAwMDAwMDAgYzAwMDIwMWQyOTk1YjU4OCBjMDAwMjAwMDVm
NDY0MDAwIGMwMDAyMDFkMjk5NWI1NDAgPC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+WzI0MDg4OS4x
MTczNDNdIE5JUCBbYzAwMDAwMDAwMGUwOThmY10gX19saXN0X2FkZF92YWxpZF9vcl9yZXBvcnQr
MHhkYy8weDE0MDwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPlsyNDA4ODkuMTE3NDAwXSBMUiBbYzAw
MDAwMDAwMGUwOThmOF0gX19saXN0X2FkZF92YWxpZF9vcl9yZXBvcnQrMHhkOC8weDE0MDwvc3Bh
bj48L2Rpdj48ZGl2PjxzcGFuPlsyNDA4ODkuMTE3NDU0XSAtLS0tIGludGVycnVwdDogNzAwPC9z
cGFuPjwvZGl2PjxkaXY+PHNwYW4+WzI0MDg4OS4xMTc0ODddIFtjMDAwMDAwMDI5NWU3YWIwXSBb
YzAwODAwMDAyMzhmMGFkNF0gcmVsZWFzZV9zdHJpcGVfcGx1ZysweDljLzB4MTUwIFtyYWlkNDU2
XTwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPlsyNDA4ODkuMTE3NTQ0XSBbYzAwMDAwMDAyOTVlN2Iw
MF0gW2MwMDgwMDAwMjM4ZjU5ZjRdIG1ha2Vfc3RyaXBlX3JlcXVlc3QrMHgzMmMvMHg1NjAgW3Jh
aWQ0NTZdPC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+WzI0MDg4OS4xMTc2MDVdIFtjMDAwMDAwMDI5
NWU3YmQwXSBbYzAwODAwMDAyMzhmNWRmOF0gcmFpZDVfbWFrZV9yZXF1ZXN0KzB4MWQwLzB4NjEw
IFtyYWlkNDU2XTwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPlsyNDA4ODkuMTE3Njc4XSBbYzAwMDAw
MDAyOTVlN2QxMF0gW2MwMDAwMDAwMDEzNjlhMDRdIG1kX2hhbmRsZV9yZXF1ZXN0KzB4MWM0LzB4
NDAwPC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+WzI0MDg4OS4xMTc3MzhdIFtjMDAwMDAwMDI5NWU3
ZGEwXSBbYzAwMDAwMDAwMGQwNDAxMF0gX19zdWJtaXRfYmlvKzB4MjMwLzB4M2QwPC9zcGFuPjwv
ZGl2PjxkaXY+PHNwYW4+WzI0MDg4OS4xMTc3OTJdIFtjMDAwMDAwMDI5NWU3ZTQwXSBbYzAwMDAw
MDAwMGQwNDI0NF0gX19zdWJtaXRfYmlvX25vYWNjdCsweDk0LzB4MjUwPC9zcGFuPjwvZGl2Pjxk
aXY+PHNwYW4+WzI0MDg4OS4xMTc4NTldIFtjMDAwMDAwMDI5NWU3ZWIwXSBbYzAwMDAwMDAwMTM4
NzQzY10gZG1fc3VibWl0X2Jpb19yZW1hcCsweDRjLzB4MTIwPC9zcGFuPjwvZGl2PjxkaXY+PHNw
YW4+WzI0MDg4OS4xMTc5NTZdIFtjMDAwMDAwMDI5NWU3ZWYwXSBbYzAwODAwMDAxYmNlMjZhOF0g
ZG1jcnlwdF93cml0ZSsweDFhMC8weDIwMCBbZG1fY3J5cHRdPC9zcGFuPjwvZGl2PjxkaXY+PHNw
YW4+WzI0MDg4OS4xMTgwMTddIFtjMDAwMDAwMDI5NWU3ZjkwXSBbYzAwMDAwMDAwMDI5OWRhOF0g
a3RocmVhZCsweDE4OC8weDFhMDwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPlsyNDA4ODkuMTE4MDg0
XSBbYzAwMDAwMDAyOTVlN2ZlMF0gW2MwMDAwMDAwMDAwMGRlZDhdIHN0YXJ0X2tlcm5lbF90aHJl
YWQrMHgxNC8weDE4PC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+WzI0MDg4OS4xMTgxMzFdIENvZGU6
IDkxNjEwMDA4IGY4MDEwMDEwIGY4MjFmZjYxIGU5MmQwYzc4IGY5MjEwMDc4IDM5MjAwMDAwIDg5
MmQwOTMyIDU1MjkwN2ZlIDBiMDkwMDAwIGU5NWYwYzY4IDMxMmFmZmZmIDdkMjk1MTEwICZsdDsw
YjA5MDAwMCZndDsgZWJiZjBiOTAgZWJkZjBiODggN2ZhM2ViNzggPC9zcGFuPjwvZGl2PjxkaXY+
PHNwYW4+WzI0MDg4OS4xMTgzMjBdIC0tLVsgZW5kIHRyYWNlIDAwMDAwMDAwMDAwMDAwMDAgXS0t
LTwvc3Bhbj48L2Rpdj48ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQXJpYWwsIHNhbnMtc2VyaWY7
IGZvbnQtc2l6ZTogMTRweDsgY29sb3I6IHJnYigwLCAwLCAwKTsgYmFja2dyb3VuZC1jb2xvcjog
cmdiKDI1NSwgMjU1LCAyNTUpOyI+PHNwYW4+PGJyPjwvc3Bhbj48L2Rpdj48ZGl2IHN0eWxlPSJm
b250LWZhbWlseTogQXJpYWwsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTRweDsgY29sb3I6IHJn
YigwLCAwLCAwKTsgYmFja2dyb3VuZC1jb2xvcjogcmdiKDI1NSwgMjU1LCAyNTUpOyI+PHNwYW4+
SWYgdGhhdCdzIGFueSB1c2VmdWwgdG8gcmV2ZWFsIGEgYnVnLCBhYm91dCB0aGUgdGFpbnRpbmcg
bW9kdWxlLCBpdCdzIGEgcG9ydCBvZiZuYnNwOzxzcGFuPjxhIHRhcmdldD0iX2JsYW5rIiByZWw9
Im5vcmVmZXJyZXIgbm9mb2xsb3cgbm9vcGVuZXIiIGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS9n
bmlmL3ZlbmRvci1yZXNldCI+aHR0cHM6Ly9naXRodWIuY29tL2duaWYvdmVuZG9yLXJlc2V0PC9h
Pjwvc3Bhbj4mbmJzcDt0byBwcGMgdG8gcmVzZXQgc29tZSBvbGRlciBncmFwaGljcyBjYXJkcywg
bm90aGluZyB0aGF0IHNob3VsZCBhZmZlY3Qgd2hhdCB0aGUgbG9nIGlzIHRhbGtpbmcgYWJvdXQs
IGZ1cnRoZXJtb3JlIGl0cyBiZWVuIGhlcmUgZm9yIHF1aXRlIGEgbG9uZyB0aW1lIHdpdGhvdXQg
YW55IGVycm9ycy48L3NwYW4+PC9kaXY+PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IEFyaWFsLCBz
YW5zLXNlcmlmOyBmb250LXNpemU6IDE0cHg7IGNvbG9yOiByZ2IoMCwgMCwgMCk7IGJhY2tncm91
bmQtY29sb3I6IHJnYigyNTUsIDI1NSwgMjU1KTsiPjxzcGFuPjxicj48L3NwYW4+PC9kaXY+PGRp
diBzdHlsZT0iZm9udC1mYW1pbHk6IEFyaWFsLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDE0cHg7
IGNvbG9yOiByZ2IoMCwgMCwgMCk7IGJhY2tncm91bmQtY29sb3I6IHJnYigyNTUsIDI1NSwgMjU1
KTsiPjxzcGFuPlRoYW5rczwvc3Bhbj48L2Rpdj48c3Bhbj48L3NwYW4+PGJyPgogICAgICAgIDwv
YmxvY2txdW90ZT48YnI+CiAgICA8L2Rpdj4=
-----------------------07ab608f90ba2fdc2ea3f985b83f0b83--
-----------------------e7c510de25f52d5b1c50c1c808a52ce9--
-----------------------f4cf7e824c0f2e0800d9922013c19c1d
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
-----------------------f4cf7e824c0f2e0800d9922013c19c1d--

--------957bdc663bae228a37a4f9212b360d3b92fb0f2170c71df0bed4ce9de8953d06
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wrsEARYKAG0FgmmJLHUJEO3D3W+VTGFERRQAAAAAABwAIHNhbHRAbm90YXRp
b25zLm9wZW5wZ3Bqcy5vcmeiRqH10lTndk3cQmaMGe/RJX/y1/TuogZM1dEB
aYJ+URYhBDRPWApyFQPQBgWiPe3D3W+VTGFEAADTEwEAtnPeros1GQT4+xX8
XBaKRF7/WOeDhR1OKZPlocaBhmsA/3Q89fB8E2U/Y2A9p+3WMm2x6mfb+uUo
FN+kb9e1u/AG
=vAuQ
-----END PGP SIGNATURE-----


--------957bdc663bae228a37a4f9212b360d3b92fb0f2170c71df0bed4ce9de8953d06--


