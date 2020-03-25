Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F93B1920E0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 07:03:18 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48nHbl0Qq4zDqx6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 17:03:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48nHZ311j8zDqW5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Mar 2020 17:01:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=mlgmtSbp; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48nHZ11LxCz9sPk;
 Wed, 25 Mar 2020 17:01:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1585116106;
 bh=jliOT/ryxznSbhEYa1PbM2oL6orVsTIvLgvub5p0cl0=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=mlgmtSbp3t1aiYmI26R1gmVLtLZqurVPcUoVGs+O3fMCzj3bXywssN1ZL23e8yfJn
 cAcs52jV26RqBt/1W++BOIhPWQIj717Zl6pTPUX8XqdntnOAB860PpyekIEgSKrvzv
 BMjYN36jjsjizk190Jls/EfunP3zuJb+zJg0m3Zw/ZDACMsBL3e6Em0OCeD0E5mzYs
 LuvWRAeUwWqmB/1kSPus0cuUenP1NfYoMAwNviNh+/t+/k/zmOYKs6rCYoheCP9Zoj
 3SYJMJZD4/VbjR9N/oiC6ozYXeORIxMkoUL1SZsURMejEEIwVTltVhEzPngnmNz9z7
 uTOWhi4ZwhvxA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Qian Cai <cai@lca.pw>, Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Subject: Re: Argh, can't find dcache properties !
In-Reply-To: <48F1D8CF-13A1-4348-8973-81503782A451@lca.pw>
References: <be8c123a90f6d1664a902b6ad6c754b9f3d9e567.camel@alliedtelesis.co.nz>
 <87tv2exst1.fsf@mpe.ellerman.id.au>
 <876a5938fbad9d9e176e5f22f12e6b472d0dc4f7.camel@alliedtelesis.co.nz>
 <48F1D8CF-13A1-4348-8973-81503782A451@lca.pw>
Date: Wed, 25 Mar 2020 17:01:49 +1100
Message-ID: <87369xx99u.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Hamish Martin <Hamish.Martin@alliedtelesis.co.nz>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "paulus@samba.org" <paulus@samba.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Qian Cai <cai@lca.pw> writes:
>> On Mar 24, 2020, at 4:06 PM, Chris Packham <Chris.Packham@alliedtelesis.co.nz> wrote:
>> On Tue, 2020-03-24 at 15:47 +1100, Michael Ellerman wrote:
>>> Chris Packham <Chris.Packham@alliedtelesis.co.nz> writes:
>>>> Hi All,
>>>> 
>>>> Just booting up v5.5.11 on a Freescale T2080RDB and I'm seeing the
>>>> following mesage.
>>>> 
>>>> kern.warning linuxbox kernel: Argh, can't find dcache properties !
>>>> kern.warning linuxbox kernel: Argh, can't find icache properties !
...
>
> BTW, POWER9 PowerNV would have the same thing. 

Ugh, you're right.

Because we're missing the cache-line-size properties, even though they
are optional when the block & line size are the same.

  # find /proc/device-tree/cpus/PowerPC\,POWER9@0/ -name '*cache*'
  /proc/device-tree/cpus/PowerPC,POWER9@0/l2-cache
  /proc/device-tree/cpus/PowerPC,POWER9@0/d-cache-block-size
  /proc/device-tree/cpus/PowerPC,POWER9@0/d-cache-size
  /proc/device-tree/cpus/PowerPC,POWER9@0/i-cache-size
  /proc/device-tree/cpus/PowerPC,POWER9@0/d-cache-sets
  /proc/device-tree/cpus/PowerPC,POWER9@0/i-cache-block-size
  /proc/device-tree/cpus/PowerPC,POWER9@0/i-cache-sets

skiboot even explicitly omits them:

	if (cache->icache_line_size != cache->icache_block_size)
		dt_add_property_cells(cpu, "i-cache-line-size",
				      be32_to_cpu(cache->icache_line_size));
	if (cache->l1_dcache_line_size != cache->dcache_block_size)
		dt_add_property_cells(cpu, "d-cache-line-size",
				      be32_to_cpu(cache->l1_dcache_line_size));


Looks like it was broken ~3 years ago, in:
  bd067f83b084 ("powerpc/64: Fix naming of cache block vs. cache line")


Previously we did:
			lsizep = of_get_property(np, "d-cache-block-size",
						 NULL);
			/* fallback if block size missing */
			if (lsizep == NULL)
				lsizep = of_get_property(np,
							 "d-cache-line-size",
							 NULL);
			if (lsizep != NULL)
				lsize = be32_to_cpu(*lsizep);
			if (sizep == NULL || lsizep == NULL)
				DBG("Argh, can't find dcache properties ! "
				    "sizep: %p, lsizep: %p\n", sizep, lsizep);

ie. fallback from block size to line size, and only print if both are missing.

That commit changed the names and the logic, but not in a consistent
fashion, making "d-cache-line-size" required to avoid the Argh:

			bsizep = of_get_property(np, "d-cache-block-size",
						 NULL);
			lsizep = of_get_property(np, "d-cache-line-size",
						 NULL);
			if (bsizep == NULL)
				bsizep = lsizep;
			if (lsizep != NULL)
				lsize = be32_to_cpu(*lsizep);
			if (bsizep != NULL)
				bsize = be32_to_cpu(*bsizep);
			if (sizep == NULL || bsizep == NULL || lsizep == NULL)
				DBG("Argh, can't find dcache properties ! "
				    "sizep: %p, bsizep: %p, lsizep: %p\n",
				    sizep, bsizep, lsizep);

Back then we fell back to cur_cpu_spec->dcache_bsize, which should be
correct. But since then we introduced the device tree CPU features
parsing, which does:

static struct cpu_spec __initdata base_cpu_spec = {
	...
	.icache_bsize		= 32, /* minimum block size, fixed by */
	.dcache_bsize		= 32, /* cache info init.             */

So on systems with new enough skiboot we now default to 32, which is
wrong on Power9.


Luckily this info is not used by the sysfs cache files, because that
code doesn't use the values we parse here, it goes and looks at the
device tree itself. Which is pretty gross but actually saves us in this
case.

These values do end up in the vdso_data, and I can see the wrong values
in the vdso_data:

1c:mon> d4 c000000002390000
c000000002390000 54535953 46434d45 50503a47 00343643	eyecatcher
c000000002390010 00000001 00000001 00000100 004e1202	major		minor	platform	processor
c000000002390020 000000b0 00000000 00000000 0000003c	processorCount		physicalMemorySize
c000000002390030 57b7623f 0000ac10 1e848000 00000000	tb_orig_stamp		tb_ticks_per_sec
c000000002390040 de6d9e42 008637af 8de66bca 0005e7ae	tb_to_xs		stamp_xsec
c000000002390050 000ff730 00000000 00000000 00000000	tb_update_count		tz_minuteswest	tz_dsttime
c000000002390060 00008000 00000020 00008000 00000020	dcache_size	line_size	icache_size	icache_line_size
                                ^
                                32 != 128

And that appears to flow through to glibc, ie. I see:

_SC_LEVEL1_ICACHE_LINESIZE = 32
_SC_LEVEL1_DCACHE_LINESIZE = 32
_SC_LEVEL2_CACHE_LINESIZE = 32
_SC_LEVEL3_CACHE_LINESIZE = 32


So excuse me while I go and swear at something.

cheers
