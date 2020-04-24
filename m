Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EF32E1B6AC5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Apr 2020 03:22:00 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 497bxK4Cl8zDr3t
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Apr 2020 11:21:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lca.pw
 (client-ip=2607:f8b0:4864:20::f44; helo=mail-qv1-xf44.google.com;
 envelope-from=cai@lca.pw; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lca.pw header.i=@lca.pw header.a=rsa-sha256
 header.s=google header.b=Q/DLVAJC; dkim-atps=neutral
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com
 [IPv6:2607:f8b0:4864:20::f44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 497btB0h0nzDr0P
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Apr 2020 11:19:12 +1000 (AEST)
Received: by mail-qv1-xf44.google.com with SMTP id q2so3949204qvd.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Apr 2020 18:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=SUP7E1nq+cKtFXB8QAyHzXNO2cyYABhbrmdhR2MmyC4=;
 b=Q/DLVAJCeX/Awi0Hc6KKmUmbG51xyXLF8LUKl6nLau8tooYpUA2jsnWXUYNHYP85SP
 mJCaCEt0G7kdEwJ7ac83ITr52wnusSpG1SCAuJ8RO6FcJFsH37UMN4jLSDQT0TG/8siJ
 1RrvspvPj56apmUKxIiAnQTD8JBPeRmXB5m3d402cMl6JnGet6etQVX8Zwq+1tCNnz/6
 2JVr2fq6/hHLKwNxP1kTx1+OYBttiT9uqV4NxFZc2k7k1mZhcLcThGEjL0vVJlwdA/lA
 eaPGUYjuV7gRrovyopW2aHos9RvofT7Bjk0UDs82QBMmTXgN4xSyuj1wFnrmnopNdVIn
 V69w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=SUP7E1nq+cKtFXB8QAyHzXNO2cyYABhbrmdhR2MmyC4=;
 b=tUZnsAQsLRbLUk68OJnudltVQ2sPl76bzHqb+m+DkD1s/LqkbLwpfc53p3Vsvrx2sF
 mL49IGdEWxvqyVWortcegGJlBRfcNgmYuT9XiyPpjRiY2QReuhoknGc8+LSSO7Xo6Spe
 C45T/BcAYCma5P3d5CfhZNS/H+e8XYCyvd4xIi6qRr6aR7OGixYC0iCu0u9LCiAYtJxD
 LgAdS8afFEAk7TsOgjkhiX52BbT53cjFgAwzEm6u4i04s8qPsjK9t/+mxlFuGTB4gd9D
 DdVE801f0Cosi4i1bzzSFPEPjZ2bQ98EMTiCvqvpqMyth7/k3N3phUTI5QjZr1vu7FQM
 FEjg==
X-Gm-Message-State: AGi0PuYKlDRhitOyd/FZ5VKUA4+5uQfl9GVpTI42ZbuR840o4rJHjkTS
 unBz4NLrhrD+O1xlTDIyrGwAHg==
X-Google-Smtp-Source: APiQypK/+h4GH+yaRh2CUtGPeHw7cEyYMpG5mSrzp2N8xVHNC9ScLgbhOXJSx0UXJKUvZ3ec2Q54pw==
X-Received: by 2002:a0c:90ef:: with SMTP id p102mr6886256qvp.248.1587691148825; 
 Thu, 23 Apr 2020 18:19:08 -0700 (PDT)
Received: from [192.168.1.153] (pool-71-184-117-43.bstnma.fios.verizon.net.
 [71.184.117.43])
 by smtp.gmail.com with ESMTPSA id q6sm3031803qte.72.2020.04.23.18.19.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 23 Apr 2020 18:19:08 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH 3/3] powerpc/module_64: Use special stub for _mcount()
 with -mprofile-kernel
From: Qian Cai <cai@lca.pw>
In-Reply-To: <8affd4298d22099bbd82544fab8185700a6222b1.1587488954.git.naveen.n.rao@linux.vnet.ibm.com>
Date: Thu, 23 Apr 2020 21:19:07 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <24465A02-2A34-4980-9B2E-ED5098200522@lca.pw>
References: <cover.1587488954.git.naveen.n.rao@linux.vnet.ibm.com>
 <8affd4298d22099bbd82544fab8185700a6222b1.1587488954.git.naveen.n.rao@linux.vnet.ibm.com>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Steven Rostedt <rostedt@goodmis.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On Apr 21, 2020, at 1:35 PM, Naveen N. Rao =
<naveen.n.rao@linux.vnet.ibm.com> wrote:
>=20
> Since commit c55d7b5e64265f ("powerpc: Remove STRICT_KERNEL_RWX
> incompatibility with RELOCATABLE"), powerpc kernels with
> -mprofile-kernel can crash in certain scenarios with a trace like =
below:
>=20
>    BUG: Unable to handle kernel instruction fetch (NULL pointer?)
>    Faulting instruction address: 0x00000000
>    Oops: Kernel access of bad area, sig: 11 [#1]
>    LE PAGE_SIZE=3D64K MMU=3DRadix SMP NR_CPUS=3D256 DEBUG_PAGEALLOC =
NUMA PowerNV
>    <snip>
>    NIP [0000000000000000] 0x0
>    LR [c0080000102c0048] ext4_iomap_end+0x8/0x30 [ext4]
>    Call Trace:
>     iomap_apply+0x20c/0x920 (unreliable)
>     iomap_bmap+0xfc/0x160
>     ext4_bmap+0xa4/0x180 [ext4]
>     bmap+0x4c/0x80
>     jbd2_journal_init_inode+0x44/0x1a0 [jbd2]
>     ext4_load_journal+0x440/0x860 [ext4]
>     ext4_fill_super+0x342c/0x3ab0 [ext4]
>     mount_bdev+0x25c/0x290
>     ext4_mount+0x28/0x50 [ext4]
>     legacy_get_tree+0x4c/0xb0
>     vfs_get_tree+0x4c/0x130
>     do_mount+0xa18/0xc50
>     sys_mount+0x158/0x180
>     system_call+0x5c/0x68
>=20
> The NIP points to NULL, or a random location (data even), while the LR
> always points to the LEP of a function (with an offset of 8), =
indicating
> that something went wrong with ftrace. However, ftrace is not
> necessarily active when such crashes occur.
>=20
> The kernel OOPS sometimes follows a warning from ftrace indicating =
that
> some module functions could not be patched with a nop. Other times, if =
a
> module is loaded early during boot, instruction patching can fail due =
to
> a separate bug, but the error is not reported due to missing error
> reporting.
>=20
> In all the above cases when instruction patching fails, ftrace will be
> disabled but certain kernel module functions will be left with default
> calls to _mcount(). This is not a problem with ELFv1. However, with
> -mprofile-kernel, the default stub is problematic since it depends on =
a
> valid module TOC in r2. If the kernel (or a different module) calls =
into
> a function that does not use the TOC, the function won't have a =
prologue
> to setup the module TOC. When that function calls into _mcount(), we
> will end up in the relocation stub that will use the previous TOC, and
> end up trying to jump into a random location. =46rom the above trace:
>=20
> 	iomap_apply+0x20c/0x920 [kernel TOC]
> 			|
> 			V
> 	ext4_iomap_end+0x8/0x30 [no GEP =3D=3D kernel TOC]
> 			|
> 			V
> 		_mcount() stub
> 	[uses kernel TOC -> random entry]
>=20
> To address this, let's change over to using the special stub that is
> used for ftrace_[regs_]caller() for _mcount(). This ensures that we =
are
> not dependent on a valid module TOC in r2 for default _mcount()
> handling.
>=20
> Reported-by: Qian Cai <cai@lca.pw>
> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>

Feel free to add,

Tested-by: Qian Cai <cai@lca.pw>=
