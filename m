Return-Path: <linuxppc-dev+bounces-13719-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7D2C30033
	for <lists+linuxppc-dev@lfdr.de>; Tue, 04 Nov 2025 09:44:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d12893Cx3z3bfZ;
	Tue,  4 Nov 2025 19:44:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=210.118.77.11
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762245897;
	cv=none; b=JbQm1h0ZKCx2see45viOXc7CByv2HWi//+y54QaTzDKsKdkOGBwz0a2XYz0mOKxrUv7RGT2+wP0o1FT0eNm2nC0jNl3aIeZcnrEqlmSZDKRZuDN/kujcb3zN8nSajl9iD2RqlVmT4tOdw+hmUiSkccmLeBwECcTg80yu16cb7uguZruh8MQ3QbsI3s1tLG0sVJKkwXwqQ3yIz+CIOKf+D0fSwsEAq9Cb5jTSMl8tu6RvV+vrdW02O0HGdtEMHPYQHQTwTXcJodPqUO+Run0e8nZAAllSglukC6bqa4i565VvKd3nhiZxB8kJ4Cxt0S75y3JmkHxvKuieIcZV7S2elA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762245897; c=relaxed/relaxed;
	bh=4Fu9AdCheOvxz3Im1FXmK3GvN5Xitn31VIJ6mONdECE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=gf3AwEc30zpBC/6DkgHDXa9VYhMPhC1P+nERnA/ykD859a1hIQbU3Cv8AfbkWkLYfo3RSJVDmYXVM8oCoMK1VY5M+WFjIFiTfUsGwobofqV+JMYYHdjSQw1GXChg4LBREP3nliumCi7lKxNc4zzQwvuy4ugc1bnZc+LehY99ksqzqcGGDiGMjHtR6EoX7i5GzHU0lCQQvlqPdHj+zKMgKIMfPm7xRclITJJ541yPAWP6EuS25wBXumlxLuMbbkR/8t5X8vN/eJ1xw6rpBhJtvcQrq8YAxWppSPjn/yiLVphhJ52LVBjxxwUj+ZNLqnvQiShE8HRYeE34BIjkG8S4Cw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=samsung.com; dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=NIfzfLaK; dkim-atps=neutral; spf=pass (client-ip=210.118.77.11; helo=mailout1.w1.samsung.com; envelope-from=m.szyprowski@samsung.com; receiver=lists.ozlabs.org) smtp.mailfrom=samsung.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=NIfzfLaK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=samsung.com (client-ip=210.118.77.11; helo=mailout1.w1.samsung.com; envelope-from=m.szyprowski@samsung.com; receiver=lists.ozlabs.org)
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d12865KPmz3bf8
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Nov 2025 19:44:53 +1100 (AEDT)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20251104084442euoutp0102088d40135302607f87347b0dc37851~0wUsqg9XY0417804178euoutp01G;
	Tue,  4 Nov 2025 08:44:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20251104084442euoutp0102088d40135302607f87347b0dc37851~0wUsqg9XY0417804178euoutp01G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1762245882;
	bh=4Fu9AdCheOvxz3Im1FXmK3GvN5Xitn31VIJ6mONdECE=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=NIfzfLaKbrHZu0Gnes91/bNFpnUi+PCBujRxqfn1+x6PF4bWcGMTESoPuAVb8BCNe
	 TtlBUOWDuOkNSnmVQ30DXStAE0ZC8Og/doIluRR7N6u64puk7uGLaCr147tEyKOLdV
	 mk1n6uHGDW++q0sGM+SWQUfE/wNIAUBaBoIJ+ACU=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20251104084442eucas1p2af1bd88393f4d6a532df1cd41f32a287~0wUr8pCub0922509225eucas1p2b;
	Tue,  4 Nov 2025 08:44:42 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20251104084440eusmtip27dfa57d3ff654ed50f16a811242c3a65~0wUqFptgI2591225912eusmtip2U;
	Tue,  4 Nov 2025 08:44:39 +0000 (GMT)
Message-ID: <e7f05748-a11c-47eb-b1fa-cdc9dc6d05e0@samsung.com>
Date: Tue, 4 Nov 2025 09:44:38 +0100
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
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v4 23/35] vdso/datastore: Map pages through struct page
To: Mark Brown <broonie@kernel.org>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?=
	<thomas.weissschuh@linutronix.de>
Cc: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Arnd Bergmann
	<arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>, Andreas Larsson
	<andreas@gaisler.com>, Nick Alcock <nick.alcock@oracle.com>, John Stultz
	<jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, John Paul Adrian
	Glaubitz <glaubitz@physik.fu-berlin.de>, Shuah Khan <shuah@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
	Russell King <linux@armlinux.org.uk>, Madhavan Srinivasan
	<maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas
	Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Thomas
	Bogendoerfer <tsbogend@alpha.franken.de>, Heiko Carstens
	<hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
	<agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, Nagarathnam Muthusamy
	<nagarathnam.muthusamy@oracle.com>, Shannon Nelson <sln@onemain.com>,
	linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linux-s390@vger.kernel.org,
	Aishwarya.TCV@arm.com
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <aQjJNmwniQwwjeBR@finisterre.sirena.org.uk>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251104084442eucas1p2af1bd88393f4d6a532df1cd41f32a287
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20251104084442eucas1p2af1bd88393f4d6a532df1cd41f32a287
X-EPHeader: CA
X-CMS-RootMailID: 20251104084442eucas1p2af1bd88393f4d6a532df1cd41f32a287
References: <20251014-vdso-sparc64-generic-2-v4-0-e0607bf49dea@linutronix.de>
	<20251014-vdso-sparc64-generic-2-v4-23-e0607bf49dea@linutronix.de>
	<aQjJNmwniQwwjeBR@finisterre.sirena.org.uk>
	<CGME20251104084442eucas1p2af1bd88393f4d6a532df1cd41f32a287@eucas1p2.samsung.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 03.11.2025 16:24, Mark Brown wrote:
> On Tue, Oct 14, 2025 at 08:49:09AM +0200, Thomas Weißschuh wrote:
>
>> An upcoming change will allocate the datapages dynamically instead of as
>> part of the kernel image. Such pages can only be mapped through
>> 'struct page' and not through PFNs.
> I'm seeing some boot failures on some arm64 platforms in -next which are
> bisecting to this patch in -next.  Unfortunately the diagnostics aren't
> super useful, we seem to just stop making progress in userspace with no
> obvious output.  One sample log from the FVP is:
>
>     https://lava.sirena.org.uk/scheduler/job/2036229#L1268
>
> which isn't super instructive.  Not all platforms seem to be affected,
> I've seen this on at least the Arm FVP, Orion O6 and Libretech Renegade
> Elite.  The diagnostics aren't very clear here but given that I'm seeing
> the same issue and bisect result on multiple platforms it seemed worth
> mentioning.  Some platforms do seem fine.
>
> We do have some other serious breakage affecting arm64 in -next which
> are making it hard to get a clear picture of which platforms are
> affected, at least the FVP and O6 are unaffected by those other issues
> (due to using MTE on platforms that don't have it, those platforms do
> have MTE).

I got almost the same result while bisecting on ARM 32bit Exynos-based 
boards, so the issue with this patchset is not fully ARM64 specific. For 
some reasons it also doesn't affect all systems though. It is even 
worse, because it affected only a subset of boards, but different for 
each tested commit. The observed failure looks exactly the same:

...

[   10.199852] devtmpfs: mounted
[   10.205013] Freeing unused kernel image (initmem) memory: 1024K
[   10.210086] Run /sbin/init as init process

INIT: version 2.88 booting

(no more messages)

The only difference is that bisecting on ARM32bit lead me to the next 
patch (10d91dac2ea5 ("vdso/datastore: Allocate data pages dynamically") 
/ [PATCH v4 24/35]).

Then I've tested it on ARM64bit (RaspberrryPi3b+ board) and got the 
following panic on 6a011a228293 ("vdso/datastore: Map pages through 
struct page") commit:

VFS: Mounted root (ext4 filesystem) on device 179:3. Trying to move old 
root to /initrd ... okay devtmpfs: mounted Freeing unused kernel memory: 
12672K Run /sbin/init as init process Unable to handle kernel paging 
request at virtual address ffffffffc20b5d48 Mem abort info: ESR = 
0x0000000096000006 EC = 0x25: DABT (current EL), IL = 32 bits SET = 0, 
FnV = 0 EA = 0, S1PTW = 0 FSC = 0x06: level 2 translation fault Data 
abort info: ISV = 0, ISS = 0x00000006, ISS2 = 0x00000000 CM = 0, WnR = 
0, TnD = 0, TagAccess = 0 GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0 
swapper pgtable: 4k pages, 48-bit VAs, pgdp=000000000230b000 
[ffffffffc20b5d48] pgd=0000000000000000, p4d=0000000003618403, 
pud=0000000003619403, pmd=0000000000000000 Internal error: Oops: 
0000000096000006 [#1] SMP Modules linked in: CPU: 2 UID: 0 PID: 1 Comm: 
init Tainted: G W 6.18.0-rc1+ #16136 PREEMPT Tainted: [W]=WARN Hardware 
name: Raspberry Pi 3 Model B (DT) pstate: 80000005 (Nzcv daif -PAN -UAO 
-TCO -DIT -SSBS BTYPE=--) pc : vvar_fault+0x7c/0x17c lr : 
vvar_fault+0x24/0x17c ... Call trace: vvar_fault+0x7c/0x17c (P) 
special_mapping_fault+0x24/0xd0 __do_fault+0x3c/0x238 
__handle_mm_fault+0xaa0/0x19e0 handle_mm_fault+0xcc/0x384 
do_page_fault+0x1a0/0x720 do_translation_fault+0x60/0x6c 
do_mem_abort+0x44/0x94 el0_da+0x54/0x230 el0t_64_sync_handler+0xd0/0xe4 
el0t_64_sync+0x198/0x19c Code: f2d83fe0 8b010063 d34cfc63 8b031803 
(f9400461) ---[ end trace 0000000000000000 ]--- Kernel panic - not 
syncing: Attempted to kill init! exitcode=0x0000000b SMP: stopping 
secondary CPUs Kernel Offset: disabled CPU features: 
0x000000,00180000,40004000,0400421b Memory Limit: none ---[ end Kernel 
panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---

Reverting "clocksource: Remove ARCH_CLOCKSOURCE_DATA", "vdso/datastore: 
Allocate data pages dynamically" and "vdso/datastore: Map pages through 
struct page" on top of linux-next fixes booting on all tested boards.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


