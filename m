Return-Path: <linuxppc-dev+bounces-6229-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F741A37937
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Feb 2025 01:32:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yx3WL4Dk6z2y8W;
	Mon, 17 Feb 2025 11:31:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739752318;
	cv=none; b=cA95NkG0mSTwRiCUpGXJ29S+4MPXyOk1JdH71rYx5rbTSWJzpuyNYt+82ptr/tobcwtePeV12mfh8XyHmni+OPYcldIkp4fpjNVgUWNc1R8wLYmGlhkfke77MxlVTk1+AX5RH9UvQ3t2X6Axvu3cJX6YzUXOk/paB1b0nHI4Msfl+YOjIY+Fn9spcw6DKrGJuT0x8ietvmhE6YpeBOEmBUCTCDYTYK6qJZ2cJNzRMGQZF4hjJf1h1RVyVeEc5yp3Sfuj20NPEVAPekFmOrkS/Gee/ub6ToX83pqShmGNWfLb3TbdxV5sUDJEL2z9LnipdPxuGAef9uHyqItv4tmqqw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739752318; c=relaxed/relaxed;
	bh=zDN8UHUTae59jTCSm0EyRLxcAx2q1HELSoPmrLn+oWs=;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:In-reply-to:
	 References:Date:Message-id; b=gNYS7Ig3CrEPR1lI2pQ1eNepDE+tRpAozV5rH2fMKtURBUhsVJo4EnS1Res4V2BOUk7uqz/el3Xifbj9tHfACopdoU4DC44zzJVptiC9uHR2yjSKZ61hnfSIJ/6DCYE+EMYF7J3q7tzNWHvHDZlftcVvtJ8XQgfZyENSFYOB7F/qgoOtQhHIur2EhilL69aBk9C2tyGWve+DpXZT5sRwdoiX0VfMfBGUTcuzUS0sT3R4Ttl0vUyYorOFwSCq7lRzC38QkUs06eYKcYxQQIqDDmwPuu/X8MFmP5SyyyX9nvKt3am7fP7AizPmH2InAyIk+yF9+pDfrk+/mk8XBLLS1w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de; dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Fi1dfshK; dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=pSrwCnPk; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Fi1dfshK; dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=pSrwCnPk; dkim-atps=neutral; spf=pass (client-ip=195.135.223.130; helo=smtp-out1.suse.de; envelope-from=neilb@suse.de; receiver=lists.ozlabs.org) smtp.mailfrom=suse.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Fi1dfshK;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=pSrwCnPk;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Fi1dfshK;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=pSrwCnPk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.223.130; helo=smtp-out1.suse.de; envelope-from=neilb@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yx3WK0W4xz2xt7
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2025 11:31:56 +1100 (AEDT)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7D7892115D;
	Mon, 17 Feb 2025 00:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1739752313; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zDN8UHUTae59jTCSm0EyRLxcAx2q1HELSoPmrLn+oWs=;
	b=Fi1dfshK7whVwhwFs32h4NBm4SJ+U1CqiJxTXiPuqkmxGiMPQmH2YpfQJRw8xRBymKxbs3
	UGqwr1FgT+wlDvl8VOsmyQ8IcFdvAEuIwrJ9szj94FsmF4nApbQVEI7FczcP26QdNrkk/e
	egUUBC9T9tEVFxgJ6hMBZo2qDrMxMyg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739752313;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zDN8UHUTae59jTCSm0EyRLxcAx2q1HELSoPmrLn+oWs=;
	b=pSrwCnPkEyVkBcNTbv71gUvB+x8Ptn4xmQwJPcNefO2nNF+bKe62VW9i5oWofO8mUxlqre
	okwphMR69SWSpSCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1739752313; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zDN8UHUTae59jTCSm0EyRLxcAx2q1HELSoPmrLn+oWs=;
	b=Fi1dfshK7whVwhwFs32h4NBm4SJ+U1CqiJxTXiPuqkmxGiMPQmH2YpfQJRw8xRBymKxbs3
	UGqwr1FgT+wlDvl8VOsmyQ8IcFdvAEuIwrJ9szj94FsmF4nApbQVEI7FczcP26QdNrkk/e
	egUUBC9T9tEVFxgJ6hMBZo2qDrMxMyg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739752313;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zDN8UHUTae59jTCSm0EyRLxcAx2q1HELSoPmrLn+oWs=;
	b=pSrwCnPkEyVkBcNTbv71gUvB+x8Ptn4xmQwJPcNefO2nNF+bKe62VW9i5oWofO8mUxlqre
	okwphMR69SWSpSCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 693A1136AD;
	Mon, 17 Feb 2025 00:31:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id XnY+CHeDsmcWKAAAD6G6ig
	(envelope-from <neilb@suse.de>); Mon, 17 Feb 2025 00:31:51 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
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
MIME-Version: 1.0
From: "NeilBrown" <neilb@suse.de>
To: "Venkat Rao Bagalkote" <venkat88@linux.vnet.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 "Michael Ellerman" <mpe@ellerman.id.au>, sfr@canb.auug.org.au,
 brauner@kernel.org
Subject: Re: [linux-next-20250214]Kernel OOPs while running LTP test
 readahead02 on 6.14.0-rc2-next-20250214
In-reply-to: <05d7e0d6-d96a-404c-b872-d5501c475780@linux.vnet.ibm.com>
References: <05d7e0d6-d96a-404c-b872-d5501c475780@linux.vnet.ibm.com>
Date: Mon, 17 Feb 2025 11:31:48 +1100
Message-id: <173975230824.3118120.428933249171112846@noble.neil.brown.name>
X-Spam-Level: 
X-Spamd-Result: default: False [-8.30 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -8.30
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


Thanks for the report. I've posted a revised version of that patch which
adds the missing error check on the result of ->lookup.

NeilBrown


On Mon, 17 Feb 2025, Venkat Rao Bagalkote wrote:
> Greetings!!!
>=20
>=20
> I am observing kernel oops on IBM Power system while running LTP test=20
> readahead02 on 6.14.0-rc2-next-20250214 kernel.
>=20
>=20
> By Reverting the below patch, issue is not seen.
>=20
>  =C2=A0=C2=A0=C2=A0 Revert "VFS: add common error checks to lookup_one_qstr=
_excl()"
>=20
>  =C2=A0=C2=A0=C2=A0 This reverts commit 22d9d5e93d0eaf7e8662602713b24e9b617=
1759f
>=20
>=20
> Please help to fix this issue and request to add the below tag.
>=20
> Reported-by: Venkat Rao Bagalkote <venkat88@linux.vnet.ibm.com>
>=20
>=20
> Traces:
>=20
> [ 2154.427377] BUG: Unable to handle kernel data access at=20
> 0xffffffffffffffdc
> [ 2154.427390] Faulting instruction address: 0xc00000000062a560
> [ 2154.427397] Oops: Kernel access of bad area, sig: 11 [#1]
> [ 2154.427402] LE PAGE_SIZE=3D64K MMU=3DHash SMP NR_CPUS=3D8192 NUMA pSeries
> [ 2154.427410] Modules linked in: dns_resolver(E) tun(E) brd(E)=20
> overlay(E) exfat(E) vfat(E) fat(E) loop(E) sctp(E) ip6_udp_tunnel(E)=20
> udp_tunnel(E) ext4(E) mbcache(E) jbd2(E) dm_mod(E) bonding(E) tls(E)=20
> nft_fib_inet(E) nft_fib_ipv4(E) nft_fib_ipv6(E) nft_fib(E)=20
> nft_reject_inet(E) nf_reject_ipv4(E) nf_reject_ipv6(E) nft_reject(E)=20
> nft_ct(E) nft_chain_nat(E) nf_nat(E) nf_conntrack(E) nf_defrag_ipv6(E)=20
> nf_defrag_ipv4(E) ip_set(E) rfkill(E) nf_tables(E) nfnetlink(E) hvcs(E)=20
> pseries_rng(E) hvcserver(E) vmx_crypto(E) drm(E)=20
> drm_panel_orientation_quirks(E) xfs(E) sr_mod(E) cdrom(E) sd_mod(E)=20
> lpfc(E) sg(E) nvmet_fc(E) nvmet(E) ibmvscsi(E) scsi_transport_srp(E)=20
> ibmveth(E) nvme_fc(E) nvme_fabrics(E) bnx2x(E) nvme_core(E) be2net(E)=20
> mdio(E) scsi_transport_fc(E) fuse(E) [last unloaded: hwpoison_inject(E)]
> [ 2154.427514] CPU: 30 UID: 0 PID: 784383 Comm: rename10 Tainted:=20
> G=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 OE=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 6.14.0-rc2-next-20250214 #1
> [ 2154.427524] Tainted: [O]=3DOOT_MODULE, [E]=3DUNSIGNED_MODULE
> [ 2154.427528] Hardware name: IBM,8375-42A POWER9 (architected) 0x4e0202=20
> 0xf000005 of:IBM,FW950.80 (VL950_131) hv:phyp pSeries
> [ 2154.427534] NIP:=C2=A0 c00000000062a560 LR: c00000000062a618 CTR:=20
> c00800000dbb4a10
> [ 2154.427540] REGS: c00000054af579b0 TRAP: 0380=C2=A0=C2=A0 Tainted: G=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> OE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (6.14.0-rc2-next-20250214)
> [ 2154.427547] MSR:=C2=A0 8000000000009033 <SF,EE,ME,IR,DR,RI,LE>=C2=A0 CR:=
=20
> 2802222f=C2=A0 XER: 20040000
> [ 2154.427561] CFAR: c00000000062a61c IRQMASK: 0
> [ 2154.427561] GPR00: c00000000062a618 c00000054af57c50 c000000001677600=20
> 0000000000000000
> [ 2154.427561] GPR04: c0000003c48560b0 00000000000a0000 0000000000000000=20
> c000000002cfaa88
> [ 2154.427561] GPR08: 0000000000002710 0000000000000000 0000000000000000=20
> 6161616161616161
> [ 2154.427561] GPR12: c00800000dbb4a10 c00000000f75af00 0000000000000000=20
> 0000000000000000
> [ 2154.427561] GPR16: 0000000000000000 00000000000a0000 0000000000000000=20
> 0000000000000000
> [ 2154.427561] GPR20: 0000000000100000 0000000000000002 00000000000a0000=20
> 0000000000000000
> [ 2154.427561] GPR24: fffffffffffff000 ffffffffffffff9c ffffffffffffff9c=20
> c0000005488e1c28
> [ 2154.427561] GPR28: c00000054af57d08 c0000005484eae00 00000000000a0000=20
> ffffffffffffffdc
> [ 2154.427627] NIP [c00000000062a560] lookup_one_qstr_excl+0x50/0x148
> [ 2154.427639] LR [c00000000062a618] lookup_one_qstr_excl+0x108/0x148
> [ 2154.427646] Call Trace:
> [ 2154.427649] [c00000054af57c50] [c00000000062a618]=20
> lookup_one_qstr_excl+0x108/0x148 (unreliable)
> [ 2154.427659] [c00000054af57ca0] [c00000000063510c]=20
> do_renameat2+0x360/0x63c
> [ 2154.427666] [c00000054af57de0] [c000000000635570] sys_rename+0x5c/0x74
> [ 2154.427672] [c00000054af57e10] [c000000000033638]=20
> system_call_exception+0x138/0x330
> [ 2154.427681] [c00000054af57e50] [c00000000000d05c]=20
> system_call_vectored_common+0x15c/0x2ec
> [ 2154.427690] --- interrupt: 3000 at 0x7fffa1580804
> [ 2154.427697] NIP:=C2=A0 00007fffa1580804 LR: 00007fffa1580804 CTR:=20
> 0000000000000000
> [ 2154.427702] REGS: c00000054af57e80 TRAP: 3000=C2=A0=C2=A0 Tainted: G=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> OE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (6.14.0-rc2-next-20250214)
> [ 2154.427708] MSR:=C2=A0 800000000280f033=20
> <SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>=C2=A0 CR: 44002228=C2=A0 XER: 00000000
> [ 2154.427725] IRQMASK: 0
> [ 2154.427725] GPR00: 0000000000000026 00007ffff0fb00d0 00007fffa1757200=20
> 000000001002df18
> [ 2154.427725] GPR04: 0000000010051698 0000000000000047 0000000000000000=20
> 0000000000000000
> [ 2154.427725] GPR08: 0000000010012b3c 0000000000000000 0000000000000000=20
> 0000000000000000
> [ 2154.427725] GPR12: 0000000000000000 00007fffa181a560 0000000000000000=20
> 0000000010032300
> [ 2154.427725] GPR16: 0000000010032a70 0000000010033100 0000000010033104=20
> 0000000010032a98
> [ 2154.427725] GPR20: 00000000100328c8 0000000010032f70 0000000010031a00=20
> 0000000000000000
> [ 2154.427725] GPR24: 0000000010052830 0000000010053cac 0000000010054544=20
> 0000000010050690
> [ 2154.427725] GPR28: 0000000010053cb0 0000000000000000 000000001002df48=20
> 00007fffa1813570
> [ 2154.427786] NIP [00007fffa1580804] 0x7fffa1580804
> [ 2154.427790] LR [00007fffa1580804] 0x7fffa1580804
> [ 2154.427794] --- interrupt: 3000
> [ 2154.427798] Code: fbc1fff0 fbe1fff8 7c9d2378 7c7c1b78 7cbe2b78=20
> f8010010 f821ffb1 f8410018 4bfffee9 eb7d0030 7c7f1b79 41820064=20
> <813f0000> 75290038 40820038 77de0002
> [ 2154.427820] ---[ end trace 0000000000000000 ]---
> [ 2154.591618] pstore: backend (nvram) writing error (-1)
>=20
>=20
> Regards,
>=20
> Venkat.
>=20
>=20


