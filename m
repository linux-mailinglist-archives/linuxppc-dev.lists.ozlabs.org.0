Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AADC7AE2C0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Sep 2023 02:04:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=I+2IPkru;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rvg2r6qlrz3cHH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Sep 2023 10:04:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=I+2IPkru;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com; envelope-from=bagasdotme@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rvg1x0rrjz3c4s
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Sep 2023 10:03:31 +1000 (AEST)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-69101d33315so5985582b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Sep 2023 17:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695686608; x=1696291408; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qKXQw5QYXz2D2jj+Q8+nTjGlZTvinbpTsyGmUzbDi9k=;
        b=I+2IPkruNpHoX0ggCkOhbkdFAnUxfVnD6Y+qNMWVDeI67I7JgbsZOOcunqCdM1Qk0h
         cmYKY9f43FupUuoLlm1ayNibuJQogpAsxACmTyzatSMQFmU4kU/bQ1GPBnB/ytv1/CB/
         qjtMXqrgqJJJVrtigQCIfk47gvutqtlas6T+noAe3auvTdXnU20HdwasnzwD2AJXUqd+
         BdV/z+VlkFb8qPqzsMgeP8FbA37a19LL+jFrPSsHycEl5vqZsgNWr8KCPdlJ+FnP+1CS
         pAjfx3CdCiHP5yfaZCkO/ncqMfefRtVyQB85GEcRJrojW5q7oYzsb6FtN14FlL99SM/g
         HbqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695686608; x=1696291408;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qKXQw5QYXz2D2jj+Q8+nTjGlZTvinbpTsyGmUzbDi9k=;
        b=P8q0t+Fn2MMeowWsXJSotHV56+oP35avwu0pUNmiAXbVT7yMtHwXFZEq6+oxiOMFkD
         IIfbEqBhX4xr5H9rtu/EcMNl/Xv7lmsBAZYLUrBqM7uvF4hEHtAOH3lzIc+yza0pF+Tl
         SetziHJifAVV2D3UyDFRcjGQE4rfuT7Xi2Fdxr70G/Cwrl547GyKmeV1fleqVBKu3OgE
         e5ALe1W+eRcNH5Yvxpr21CIcRDEVFmIprUpvete+xz1YQQQqvQUtUkJ6ONdEJ2/yG8PD
         ny6Ijc4Q6ChtcsDpJ+KT58QATEhFGshCc3P60qCUZtCQbPaaSfmIhTTnxEdFqYGcdVJB
         XZDQ==
X-Gm-Message-State: AOJu0YwQc2NR+jJUc6hxowli+wWzUeOncZyu8FF19x96WoCxfnjvbHF6
	LNZA/Gb6Uxh0YqUJ1lA1MS0=
X-Google-Smtp-Source: AGHT+IGnZeukV1KyOLRqQItbRvu+ZlfGq0OejOR2dNrk5mwfD9TUlXRoazhaKpyVHzb5gRdbjKmGAA==
X-Received: by 2002:a05:6a20:9699:b0:15d:684d:f51b with SMTP id hp25-20020a056a20969900b0015d684df51bmr5900298pzc.45.1695686607848;
        Mon, 25 Sep 2023 17:03:27 -0700 (PDT)
Received: from debian.me ([103.124.138.83])
        by smtp.gmail.com with ESMTPSA id mu4-20020a17090b388400b0025bfda134ccsm8785046pjb.16.2023.09.25.17.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 17:03:26 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 498A880B20CF; Tue, 26 Sep 2023 07:03:22 +0700 (WIB)
Date: Tue, 26 Sep 2023 07:03:22 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Erhard Furtner <erhard_f@mailbox.org>,
	Linux PowerPC <linuxppc-dev@lists.ozlabs.org>,
	Linux Maple Tree <maple-tree@lists.infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>
Subject: Re: [Bisected] PowerMac G4 getting "BUG: Unable to handle kernel
 data access on write at 0x00001ff0" at boot with CONFIG_VMAP_STACK=y on
 kernels 6.5.x (regression over 6.4.x)
Message-ID: <ZRIfyp5YKH36_9df@debian.me>
References: <20230926010159.0f25161c@yea>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lld9pQtn+sLceWro"
Content-Disposition: inline
In-Reply-To: <20230926010159.0f25161c@yea>
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
Cc: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--lld9pQtn+sLceWro
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 26, 2023 at 01:01:59AM +0200, Erhard Furtner wrote:
> Greetings!
>=20
> Had a chat on #gentoo-powerpc with another user whose G4 Mini fails booti=
ng kernel 6.5.0 when CONFIG_VMAP_STACK=3Dy is enabled. I was able to replic=
ate the issue on my PowerMac G4. Also I was able to bisect the issue.
>=20
> Kernels 6.4.x boot ok with CONFIG_VMAP_STACK=3Dy but on 6.5.5 I get:
>=20
> [...]
> Kernel attempted to write user page (1ff0) - exploit attempt? (uid: 0)
> BUG: Unable to handle kernel data access on write at 0x00001ff0
> Faulting instruction address: 0xc0008750
> Oops: Kernel access of bad area, sig: 11 [#1]
> BE PAGE_SIZE=3D4K MMU=3DHash PowerMac
> Modules linked in:
> CPU: 0 PID: 0 Comm: swapper Not tainted 6.5.5-PMacG4 #5
> Hardware name: PowerMac3,6 7455 0x80010303 PowerMac
> NIP:  c0008750 LR: c0041848 CTR: c0070988
> REGS: c0d3dcd0 TRAP: 0300   Not tainted (6.5.5-PMacG4)
> MSR:  00001032 <ME,IR,DR,RI>  CR: 22d3ddc0 XER: 20000000
> DAR: 00001ff0 DSISR: 42000000
> GPR00: c0041848 c0d3dd90 c0d06360 c0d3ddd0 c0d06360 c0d3dea8 c0d3adc0 000=
00000
> GPR08: 00000000 c0d40000 00000000 c0d3ddc0 00000000 00000000 00000000 000=
00004
> GPR16: 00000002 00000000 00000002 00402dc2 00402dc2 00002000 f1004000 000=
00000
> GPR24: c0d45220 c0d06644 c0843c34 00000002 c0d06360 c0d0ce00 c0d06360 000=
00000
> NIP [c0008750] do_softirq_own_stack+0x18/0x3c
> LR [c0041848] irq_exit+0x98/0xc4
> Call Trace:
> [c0d3dd90] [c0d69564] 0xc0d69564 (unreliable)
> [c0d3ddb0] [c0041848] irq_exit+0x98/0xc4
> [c0d3ddc0] [c0004a98] Decrementer_virt+0x108/0x10c
> --- interrupt: 900 at __schedule+0x43c/0x4e0
> NIP:  c0843940 LR: c084398c CTR: c0070988
> REGS: c0d3ddd0 TRAP: 0900   Not tainted  (6.5.5-PMacG4)
> MSR:  00009032 <EE,ME,IR,DR,RI>  CR: 22024484  XER: 00000000
>=20
> GPR00: c0843574 c0d3de90 c0d06360 c0d06360 c0d06360 c0d3dea8 00000001 000=
00000
> GPR08: 00000000 00009032 c099ce2c 0007ffbf 22024484 00000000 00000000 000=
00004
> GPR16: 00000002 00000000 00000002 00402dc2 00402dc2 00002000 f1004000 000=
00000
> GPR24: c0d45220 c0d06644 c0843c34 00000002 c0d06360 c0d0ce00 c0d06360 c0d=
063ac
> NIP [c0843940] __schedule+0x43c/0x4e0
> LR [c084390c] __schedule+0x408/0x4e0
> --- interrupt: 900
> [c0d3de90] [c0843574] __schedule+0x70/0x4e0 (unreliable)
> [c0d3ded0] [c0843c34] __cond_resched+0x34/0x54
> [c0d3dee0] [c0141068] __vmalloc_node_range+0x27c/0x64c
> [c0d3de60] [c0141794] __vmalloc_node+0x44/0x54
> [c8d3df80] [c0c06510] init_IRQ+0x34/0xd4
> [c8d3dfa0] [c0c03440] start_kernel+0x424/0x558
> [c8d3dff0] [00003540] 0x3540
> Code: 39490999 7d4901a4 39290aaa 7d2a01a4 4c00012c 4bffff20 9421ffe0 7c08=
002a6 3d20c0d4 93e1001c 90010024 83e95278 <943f1ff0> 7fe1fb78 48840c6d 8021=
0000
> ---[ end trace 0000000000000000 ]---
>=20
> Kernel panic - not syncing: Attempted to kill the idle task!
> Rebooting in 48 seconds..
>=20
>=20
> The bisect revealed this commit:
>  # git bisect good
> cfeb6ae8bcb96ccf674724f223661bbcef7b0d0b is the first bad commit
> commit cfeb6ae8bcb96ccf674724f223661bbcef7b0d0b
> Author: Liam R. Howlett <Liam.Howlett@oracle.com>
> Date:   Fri Aug 18 20:43:55 2023 -0400
>=20
>     maple_tree: disable mas_wr_append() when other readers are possible
>    =20
>     The current implementation of append may cause duplicate data and/or
>     incorrect ranges to be returned to a reader during an update.  Althou=
gh
>     this has not been reported or seen, disable the append write operation
>     while the tree is in rcu mode out of an abundance of caution.
>    =20
>     During the analysis of the mas_next_slot() the following was
>     artificially created by separating the writer and reader code:
>    =20
>     Writer:                                 reader:
>     mas_wr_append
>         set end pivot
>         updates end metata
>         Detects write to last slot
>         last slot write is to start of slot
>         store current contents in slot
>         overwrite old end pivot
>                                             mas_next_slot():
>                                                     read end metadata
>                                                     read old end pivot
>                                                     return with incorrect=
 range
>         store new value
>    =20
>     Alternatively:
>    =20
>     Writer:                                 reader:
>     mas_wr_append
>         set end pivot
>         updates end metata
>         Detects write to last slot
>         last lost write to end of slot
>         store value
>                                             mas_next_slot():
>                                                     read end metadata
>                                                     read old end pivot
>                                                     read new end pivot
>                                                     return with incorrect=
 range
>         set old end pivot
>    =20
>     There may be other accesses that are not safe since we are now updati=
ng
>     both metadata and pointers, so disabling append if there could be rcu
>     readers is the safest action.
>    =20
>     Link: https://lkml.kernel.org/r/20230819004356.1454718-2-Liam.Howlett=
@oracle.com
>     Fixes: 54a611b60590 ("Maple Tree: add new data structure")
>     Signed-off-by: Liam R. Howlett <Liam.Howlett@oracle.com>
>     Cc: <stable@vger.kernel.org>
>     Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
>=20
>  lib/maple_tree.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
>=20
> And indeed when I revert commit cfeb6ae8bcb96ccf674724f223661bbcef7b0d0b =
kernel 6.5.5 succeeds booting with CONFIG_VMAP_STACK=3Dy enabled. dmesg of =
the successful boot with the reverted commit attached, also kernel .config =
and the bisect.log.
>=20
> Regards,
> Erhard F.



> git bisect start
> # Status: warte auf guten und schlechten Commit
> # bad: [2309983b0ac063045af3b01b0251dfd118d45449] Linux 6.5.5
> git bisect bad 2309983b0ac063045af3b01b0251dfd118d45449
> # good: [6995e2de6891c724bfeb2db33d7b87775f913ad1] Linux 6.4
> git bisect good 6995e2de6891c724bfeb2db33d7b87775f913ad1
> # good: [6c1561fb900524c5bceb924071b3e9b8a67ff3da] Merge tag 'soc-dt-6.5'=
 of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc
> git bisect good 6c1561fb900524c5bceb924071b3e9b8a67ff3da
> # good: [9f57c13f7ed70a94ecc135645bc764efdd378acd] Merge tag 'soc-fixes-6=
=2E5-1' of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc
> git bisect good 9f57c13f7ed70a94ecc135645bc764efdd378acd
> # good: [b9f052dc68f69dac89fe1e24693354c033daa091] netfilter: nf_tables: =
fix false-positive lockdep splat
> git bisect good b9f052dc68f69dac89fe1e24693354c033daa091
> # bad: [7e2229d14234bbea8fbb5e426d5f3533b0f1b262] arm64: dts: qcom: sc818=
0x-pmics: add missing qcom,spmi-gpio fallbacks
> git bisect bad 7e2229d14234bbea8fbb5e426d5f3533b0f1b262
> # good: [93f5de5f648d2b1ce3540a4ac71756d4a852dc23] Merge tag 'acpi-6.5-rc=
8' of git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm
> git bisect good 93f5de5f648d2b1ce3540a4ac71756d4a852dc23
> # bad: [25130b27e0352acb83e91c467853eb9afad3b644] OPP: Fix potential null=
 ptr dereference in dev_pm_opp_get_required_pstate()
> git bisect bad 25130b27e0352acb83e91c467853eb9afad3b644
> # good: [4942fed84b98cfb71d3cdff1a3df0072a57bbdfa] Merge tag 'riscv-for-l=
inus-6.5-rc8' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux
> git bisect good 4942fed84b98cfb71d3cdff1a3df0072a57bbdfa
> # bad: [ecd7e1c562cb08e41957fcd4b0e404de5ab38e20] ksmbd: fix slub overflo=
w in ksmbd_decode_ntlmssp_auth_blob()
> git bisect bad ecd7e1c562cb08e41957fcd4b0e404de5ab38e20
> # bad: [7d2f353b2682dcfe5f9bc71e5b61d5b61770d98e] Merge tag 'clk-fixes-fo=
r-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux
> git bisect bad 7d2f353b2682dcfe5f9bc71e5b61d5b61770d98e
> # good: [2f406263e3e954aa24c1248edcfa9be0c1bb30fa] madvise:madvise_cold_o=
r_pageout_pte_range(): don't use mapcount() against large folio for sharing=
 check
> git bisect good 2f406263e3e954aa24c1248edcfa9be0c1bb30fa
> # bad: [e5548f85b4527c4c803b7eae7887c10bf8f90c97] shmem: fix smaps BUG sl=
eeping while atomic
> git bisect bad e5548f85b4527c4c803b7eae7887c10bf8f90c97
> # bad: [cfeb6ae8bcb96ccf674724f223661bbcef7b0d0b] maple_tree: disable mas=
_wr_append() when other readers are possible
> git bisect bad cfeb6ae8bcb96ccf674724f223661bbcef7b0d0b
> # good: [0e0e9bd5f7b9d40fd03b70092367247d52da1db0] madvise:madvise_free_p=
te_range(): don't use mapcount() against large folio for sharing check
> git bisect good 0e0e9bd5f7b9d40fd03b70092367247d52da1db0
> # first bad commit: [cfeb6ae8bcb96ccf674724f223661bbcef7b0d0b] maple_tree=
: disable mas_wr_append() when other readers are possible

Thanks for the regression report. I'm adding it to regzbot:

#regzbot ^introduced: cfeb6ae8bcb96c
#regzbot title: CONFIG_VMAP_STACK kernel data write access bug due to disab=
ling mas_wr_append()

--=20
An old man doll... just what I always wanted! - Clara

--lld9pQtn+sLceWro
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZRIfvwAKCRD2uYlJVVFO
o6gHAQCxV5UfvCfqqe6xs7APp058UsXK4eGknebLBCc9FNz/7QD/Tv1xHYqUlo1G
2IqRdTvPYp/wLk3PJaZDRciyOpcZrws=
=UC+U
-----END PGP SIGNATURE-----

--lld9pQtn+sLceWro--
