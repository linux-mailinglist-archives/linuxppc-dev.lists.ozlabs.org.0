Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AB87526A424
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Sep 2020 13:29:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BrLbZ59TgzDqSn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Sep 2020 21:29:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BrLVQ0MwDzDqQK
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Sep 2020 21:24:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=prKzwknF; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BrLVM70dlz9sVM;
 Tue, 15 Sep 2020 21:24:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1600169084;
 bh=vwQV7qeFTU97cqEIIJI2HqYzEK96icuAhdrJc1SZ50c=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=prKzwknFVr9DjUmmzGOx6sGZ3/ZPjF5DldXo/d/XmMWSmSYb0s3ySkcsIUw+FO5SZ
 GiDFjbh5ayGPdxxCjV7DbprPsL4p1d03V6pLg5m+cTO9RdPbYMu8pETXZf4gPwDcso
 PyFQkhVjvaQ8qaJeQ0nhHhdTJgOVdSyk9MuXtgplYpBXcokTAmrpQXE025EdIpTvS2
 U2tfrEg2SZRnsMQWPEEMP94Lujy0o8a+U1OKVHEVVMbHpINk8fr1B4uytBGwV4LB/x
 HBPUVmEDUpXgaJspAWwyL1mvQPT5t+k1oNc/s1b+cS/hd5TVZZNcSjRZ/u3T+La5KM
 3ri0sJl1bXIZg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Sachin Sant <sachinp@linux.vnet.ibm.com>, linux-next@vger.kernel.org
Subject: Re: [5.9.0-rc5-20200914] Kernel crash while running LTP(mlock201)
In-Reply-To: <3DCED508-4DC0-42AA-9CFF-3AB260ED1E9A@linux.vnet.ibm.com>
References: <3DCED508-4DC0-42AA-9CFF-3AB260ED1E9A@linux.vnet.ibm.com>
Date: Tue, 15 Sep 2020 21:24:38 +1000
Message-ID: <87o8m7p9jd.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, willy@infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sachin Sant <sachinp@linux.vnet.ibm.com> writes:
> While running LTP tests (specifically mlock201) against next-20200914 tree
> on a POWER9 LPAR results in following crash.

Looks the same as:

https://lore.kernel.org/linux-mm/20200914085545.GB28738@shao2-debian/

cheers

> BUG: Kernel NULL pointer dereference on read at 0x00000000
> Faulting instruction address: 0xc000000000454248
> Oops: Kernel access of bad area, sig: 11 [#1]
> LE PAGE_SIZE=3D64K MMU=3DHash SMP NR_CPUS=3D2048 NUMA pSeries
> Modules linked in: af_packet(E) nft_ct(E) nf_conntrack(E) nf_defrag_ipv6(=
E) nf_defrag_ipv4(E) libcrc32c(E) ip6_tables(E) nft_compat(E) ip_set(E) rfk=
ill(E) nf_tables(E) nfnetlink(E) vmx_crypto(E) uio_pdrv_genirq(E) gf128mul(=
E) uio(E) rtc_generic(E) crct10dif_vpmsum(E) sch_fq_codel(E) ip_tables(E) x=
_tables(E) ext4(E) crc16(E) mbcache(E) jbd2(E) sd_mod(E) t10_pi(E) sg(E) ib=
mvscsi(E) scsi_transport_srp(E) scsi_mod(E) ibmveth(E) crc32c_vpmsum(E) dm_=
mirror(E) dm_region_hash(E) dm_log(E) dm_mod(E) autofs4(E)
> CPU: 11 PID: 26435 Comm: mlock201 Tainted: G            E     5.9.0-rc5-n=
ext-20200914-281.gf529200-default #1
> NIP:  c000000000454248 LR: c000000000445a74 CTR: c000000000413150
> REGS: c0000008e645b770 TRAP: 0300   Tainted: G            E      (5.9.0-r=
c5-next-20200914-281.gf529200-default)
> MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: 28002482  XER: 20040000
> CFAR: c00000000000fbb0 DAR: 0000000000000000 DSISR: 40000000 IRQMASK: 0=20
> GPR00: c000000000445a74 c0000008e645ba00 c0000000017c4500 000000000000000=
0=20
> GPR04: 0000000000000001 c0000008ea109e98 c0000008f0c40000 000000000000000=
0=20
> GPR08: 0000000000000000 0000000000000000 0000000000000000 000000000000000=
3=20
> GPR12: c000000000413150 c00000001ec70200 0000000000000000 c00000000150203=
8=20
> GPR16: 00007fff9c61ffff 00007fff9c61ffff 00007fff9c61ffff c000000000cb02f=
8=20
> GPR20: 00007fff9c5c0000 00007fff9c620000 c0000008e645bcd8 c0000008f0c4000=
0=20
> GPR24: c00c0000023c0d00 fffffffffffffe7f 0000000000000000 c0000008f0c4000=
0=20
> GPR28: c0000008ea109e98 0000000000000001 c0000008ea9288a8 000000000000000=
0=20
> NIP [c000000000454248] PageHuge+0x8/0x60
> LR [c000000000445a74] find_get_incore_page+0x114/0x160
> Call Trace:
> [c0000008e645ba00] [c000000000445994] find_get_incore_page+0x34/0x160 (un=
reliable)
> [c0000008e645ba40] [c000000000412e54] mincore_page+0x24/0x160
> [c0000008e645ba70] [c000000000413020] __mincore_unmapped_range+0x90/0x160
> [c0000008e645bac0] [c000000000413680] mincore_pte_range+0x530/0x5d0
> [c0000008e645bb40] [c000000000422a38] walk_pgd_range+0x4e8/0xae0
> [c0000008e645bc30] [c0000000004230c4] __walk_page_range+0x94/0x250
> [c0000008e645bcb0] [c0000000004233d8] walk_page_range+0x158/0x1e0
> [c0000008e645bd40] [c00000000041386c] sys_mincore+0x14c/0x370
> [c0000008e645bdc0] [c000000000033eb8] system_call_exception+0xf8/0x200
> [c0000008e645be20] [c00000000000d140] system_call_common+0xf0/0x27c
> Instruction dump:
> e8410018 38210020 e8010010 7c0803a6 4e800020 60000000 3d400001 7d435378=20
> 4e800020 60000000 7c0802a6 60000000 <e9230000> 75290001 40820010 e9230008=
=20
> ---[ end trace 357eb14a3b22eab2 ]=E2=80=94
>
>
> The function find_get_incore_page() was introduced with=20
> 3fcbe4eb49a0406e6202e8c8c3560f30965a8e79=20
>
> mm: factor find_get_incore_page out of mincore_page
>
>
> Thanks
> -Sachin
