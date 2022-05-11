Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C37523505
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 May 2022 16:08:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KyxbN0tFrz3cBg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 May 2022 00:08:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mpfwWa1g;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=mpfwWa1g; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KyxZf2xTNz3bf9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 May 2022 00:08:10 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B805461D18
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 May 2022 14:08:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 29A43C34114
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 May 2022 14:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652278087;
 bh=loFO38aGKNW5ZEIPyPtBpvpmw/LDghXQzue7omFBfw8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=mpfwWa1gPlBRuBzzOM+Z2U5kCJSfhvx2hG1AHYXPenwgiUDXMWDHPVpi+MBE1zo+2
 3fFw+2POzUPd+oyib1wMvmjbEDuY3CdVs+SVTBd4r/CIH2hxg+Oh4YdMmPF3tZ5WtV
 gYPKwmk07itZOdJ+bhl1MaY01hRQiXyywfghuXrv1dpNOMsODrSHuqBhjzmBK8eP1X
 bsFGhDlkM8w3zosi66NNYEhrThv63qoKeo9/mBFRBXkszMK3wFUt1bCZsKlURR+oqw
 nMJTM4ZroUVrvQllfyTi6ZpXsz5CqQG1ljLAtI3RUyDbZ77Mp9Ak79kKJ0JnZqWQsD
 36VoGWN4H5dyg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 1589CC05FF5; Wed, 11 May 2022 14:08:07 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 215389] pagealloc: memory corruption at building glibc-2.33 and
 running its' testsuite
Date: Wed, 11 May 2022 14:08:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-32
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215389-206035-TaY0Cz6X4w@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215389-206035@https.bugzilla.kernel.org/>
References: <bug-215389-206035@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215389

--- Comment #18 from Erhard F. (erhard_f@mailbox.org) ---
Ok, and another problem during building via distcc on the G4, still
LOWMEM_SIZE=3D0x28000000 (kernel v5.17.6).

[...]
Oops: Kernel stack overflow, sig: 11 [#1]
BE PAGE_SIZE=3D4K MMU=3DHash SMP NR_CPUS=3D2 PowerMac
Modules linked in: auth_rpcgss nfsv4 dns_resolver nfs lockd grace sunrpc
ghash_generic gf128mul gcm ccm algif_aead des_generic libdes ctr cbc ecb
algif_skcipher aes_generic libaes cmac sha512_generic sha1_generic sha1_pow=
erpc
md5 md5_ppc md4 hid_generic b43legacy usbhid mac80211 hid libarc4 cfg80211
snd_aoa_codec_tas rfkill snd_aoa_fabric_layout snd_aoa evdev mac_hid
therm_windtunnel firewire_ohci firewire_core crc_itu_t sr_mod cdrom ohci_pci
8250_pci radeon snd_aoa_i2sbus ohci_hcd snd_aoa_soundbus ssb snd_pcm ehci_p=
ci
snd_timer pcmcia snd soundcore pcmcia_core hwmon 8250 ehci_hcd i2c_algo_bit
8250_base drm_ttm_helper serial_mctrl_gpio ttm drm_kms_helper usbcore
syscopyarea sysfillrect sysimgblt usb_common fb_sys_fops pkcs8_key_parser f=
use
drm drm_panel_orientation_quirks configfs
CPU: 0 PID: 24122 Comm: sh Not tainted 5.17.6-gentoo-PMacG4 #1
NIP:  c0018614 LR: 00000000 CTR: c103cbe0
REGS: e7fe9f50 TRAP: 0000   Not tainted  (5.17.6-gentoo-PMacG4)
MSR:  00001030 <ME,IR,DR>  CR: 00000001  XER: c000e234

GPR00: a78bfe90 80002288 00000000 d6a5e1a0 e991de60 0068c6c4 a7a3ff98 c1099=
000=20
GPR08: 00000000 e991dec0 d6a5e1a0 80002288 005900d0 0068fff4 00000000 00000=
007=20
GPR16: 00000029 00000007 00bc44b0 a7ddafe8 a78bfe90 fffff000 00000000 00000=
000=20
GPR24: 005900d0 0068c6c4 c0dcc7a0 c1402b48 caa899c0 c103cbe0 c4ce9400 c08fe=
234=20
NIP [c0018614] interrupt_return+0x17c/0x190
LR [00000000] 0x0
Call Trace:
Instruction dump:
40860018 7ccff120 80c10028 80010010 80210014 4c000064 7ccff120 7d3043a6=20
392100c0 80c10028 80010010 80210014 <91210000> 7d3042a6 4c000064 7c000828=20
---[ end trace 0000000000000000 ]---


@Christophe: Would it be helpful for these issues to try a KASAN build?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
