Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B35C5A9714
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 14:43:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJLLc3P9lz2xgC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 22:43:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WbqjEjmI;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WbqjEjmI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=joe.lawrence@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WbqjEjmI;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WbqjEjmI;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJLKr6mfYz2y8J
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Sep 2022 22:42:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662036155;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oB0yOMjNHR7bzvopXfI0uoDdxW9Xzf1HMM5Tkq/E2+Q=;
	b=WbqjEjmIrEa2YG3QR4QrjMynz7dy8WATp6QHCaTrMaoxYGpk1k4z1T5+Yk9WUYGKIBRuvs
	9QFUPq+9OJqIc2GikuPnByx0FPs3lD3jnydtiUFC0Gdf1UNg8VfNAcjRuU9yvzIGEIysAS
	lr1abbLpuQy5ZJ6qBCRLECwzQuoTD8I=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662036155;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oB0yOMjNHR7bzvopXfI0uoDdxW9Xzf1HMM5Tkq/E2+Q=;
	b=WbqjEjmIrEa2YG3QR4QrjMynz7dy8WATp6QHCaTrMaoxYGpk1k4z1T5+Yk9WUYGKIBRuvs
	9QFUPq+9OJqIc2GikuPnByx0FPs3lD3jnydtiUFC0Gdf1UNg8VfNAcjRuU9yvzIGEIysAS
	lr1abbLpuQy5ZJ6qBCRLECwzQuoTD8I=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-350-us8Ddf-bP0O01B5BWQ25yg-1; Thu, 01 Sep 2022 08:42:32 -0400
X-MC-Unique: us8Ddf-bP0O01B5BWQ25yg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7AAD32932489;
	Thu,  1 Sep 2022 12:42:31 +0000 (UTC)
Received: from redhat.com (unknown [10.22.32.220])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B39901415125;
	Thu,  1 Sep 2022 12:42:30 +0000 (UTC)
Date: Thu, 1 Sep 2022 08:42:29 -0400
From: Joe Lawrence <joe.lawrence@redhat.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v5] livepatch: Clear relocation targets on a module
 removal
Message-ID: <YxCotV69C14hntYh@redhat.com>
References: <20220830185313.76402-1-song@kernel.org>
 <Yw+4xxiONngOTqin@redhat.com>
 <875yi8uju3.fsf@mpe.ellerman.id.au>
 <YxAc87dTmclHGCUy@redhat.com>
 <8735dbvk4p.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8735dbvk4p.fsf@mpe.ellerman.id.au>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
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
Cc: pmladek@suse.com, x86@kernel.org, jikos@kernel.org, linux-kernel@vger.kernel.org, Song Liu <song@kernel.org>, Josh Poimboeuf <jpoimboe@redhat.com>, live-patching@vger.kernel.org, mbenes@suse.cz, linuxppc-dev@lists.ozlabs.org, jpoimboe@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Sep 01, 2022 at 01:39:02PM +1000, Michael Ellerman wrote:
> Joe Lawrence <joe.lawrence@redhat.com> writes:
> > On Thu, Sep 01, 2022 at 08:30:44AM +1000, Michael Ellerman wrote:
> >> Joe Lawrence <joe.lawrence@redhat.com> writes:
> ...
> >
> > Hi Michael,
> >
> > While we're on the topic of klp-relocations and Power, I saw a similar
> > access problem when writing (late) relocations into
> > .data..ro_after_init.  I'm not entirely convinced this should be allowed
> > (ie, is it really read-only after .init or ???), but it seems that other
> > arches currently allow it ...
> 
> I guess that's because we didn't properly fix apply_relocate_add() in
> https://github.com/linuxppc/issues/issues/375 ?
> 
> If other arches allow it then we don't want to be the odd one out :)
> 
> So I guess we need to implement it.
> 

FWIW, I think it this particular relocation is pretty rare, we haven't
seen it in real patches nor do we have a kpatch test that generates it.
I only hit a crash as I was trying to write a more exhaustive test for
the klp-convert implementation.

> > ===== TEST: klp-convert data relocations (late module patching) =====
> > % modprobe test_klp_convert_data
> > livepatch: enabling patch 'test_klp_convert_data'
> > livepatch: 'test_klp_convert_data': starting patching transition
> > livepatch: 'test_klp_convert_data': patching complete
> > % modprobe test_klp_convert_mod
> > ...
> > module_64: Applying ADD relocate section 54 to 20
> > module_64: RELOC at 000000008482d02a: 38-type as .klp.sym.test_klp_convert_mod.static_ro_after_init,0 (0xc0080000016d0084) + 0
> > BUG: Unable to handle kernel data access on write at 0xc0080000021d0000
> > Faulting instruction address: 0xc000000000055f14
> > Oops: Kernel access of bad area, sig: 11 [#1]
> > LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
> > Modules linked in: test_klp_convert_mod(+) test_klp_convert_data(K) bonding rfkill tls pseries_rng drm fuse drm_panel_orientation_quirks xfs libcrc32c sd_mod t10_pi sg ibmvscsi ibmveth scsi_transport_srp vmx_crypto dm_mirror dm_region_hash dm_log dm_mod [last unloaded: test_klp_convert_mod]
> > CPU: 0 PID: 17089 Comm: modprobe Kdump: loaded Tainted: G              K   5.19.0+ #1
> > NIP:  c000000000055f14 LR: c00000000021ef28 CTR: c000000000055f14
> > REGS: c0000000387af5a0 TRAP: 0300   Tainted: G              K    (5.19.0+)
> > MSR:  8000000002009033 <SF,VEC,EE,ME,IR,DR,RI,LE>  CR: 88228444  XER: 00000000
> > CFAR: c000000000055e04 DAR: c0080000021d0000 DSISR: 42000000 IRQMASK: 0
> > GPR00: c00000000021ef28 c0000000387af840 c000000002a68a00 c0000000088b3000
> > GPR04: c008000002230084 0000000000000026 0000000000000036 c0080000021e0480
> > GPR08: 000000007c426214 c000000000055f14 c000000000055e08 0000000000000d80
> > GPR12: c00000000021d9b0 c000000002d90000 c0000000088b3000 c0080000021f0810
> > GPR16: c0080000021c0638 c0000000088b3d80 00000000ffffffff c000000001181e38
> > GPR20: c0000000029dc088 c0080000021e0480 c0080000021f0870 aaaaaaaaaaaaaaab
> > GPR24: c0000000088b3c40 c0080000021d0000 c0080000021f0000 0000000000000000
> > GPR28: c0080000021d0000 0000000000000000 c0080000021c0638 0000000000000810
> > NIP [c000000000055f14] apply_relocate_add+0x474/0x9e0
> > LR [c00000000021ef28] klp_apply_section_relocs+0x208/0x2d0
> > Call Trace:
> > [c0000000387af840] [c0000000387af920] 0xc0000000387af920 (unreliable)
> > [c0000000387af940] [c00000000021ef28] klp_apply_section_relocs+0x208/0x2d0
> > [c0000000387afa30] [c00000000021f080] klp_init_object_loaded+0x90/0x1e0
> > [c0000000387afac0] [c0000000002200ac] klp_module_coming+0x3dc/0x5c0
> > [c0000000387afb70] [c000000000231414] load_module+0xf64/0x13a0
> > [c0000000387afc90] [c000000000231b8c] __do_sys_finit_module+0xdc/0x180
> > [c0000000387afdb0] [c00000000002f004] system_call_exception+0x164/0x340
> > [c0000000387afe10] [c00000000000be68] system_call_vectored_common+0xe8/0x278
> > --- interrupt: 3000 at 0x7fffb6af4710
> > NIP:  00007fffb6af4710 LR: 0000000000000000 CTR: 0000000000000000
> > REGS: c0000000387afe80 TRAP: 3000   Tainted: G              K    (5.19.0+)
> > MSR:  800000000000f033 <SF,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 48224244  XER: 00000000
> > IRQMASK: 0
> > GPR00: 0000000000000161 00007fffe06f5550 00007fffb6bf7200 0000000000000005
> > GPR04: 0000000105f36ca0 0000000000000000 0000000000000005 0000000000000000
> > GPR08: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> > GPR12: 0000000000000000 00007fffb738c540 0000000000000020 0000000000000000
> > GPR16: 0000010024d31de0 0000000000000000 0000000105f37d50 0000010024d302f8
> > GPR20: 0000000000000001 0000000000000908 0000010024d32020 0000010024d319b0
> > GPR24: 0000000000000000 0000000000000000 0000010024d32040 0000010024d303f0
> > GPR28: 0000010024d31e00 0000000105f36ca0 0000000000040000 0000010024d319b0
> > NIP [00007fffb6af4710] 0x7fffb6af4710
> > LR [0000000000000000] 0x0
> > --- interrupt: 3000
> > Instruction dump:
> > 0000061c 0000061c 0000061c 0000061c 0000061c 0000061c 0000061c 0000061c
> > 00000288 00000248 60000000 7c992050 <7c9ce92a> 60000000 60000000 e9310020
> > ---[ end trace 0000000000000000 ]---
> >
> > $ readelf --wide --sections lib/livepatch/test_klp_convert_data.ko | grep -e '\[20\]' -e '\[54\]'
> > [20]  .data..ro_after_init                                 PROGBITS  0000000000000000  001a58  000008  00  WA  0   0   8
> > [54]  .klp.rela.test_klp_convert_mod..data..ro_after_init  RELA      0000000000000000  0426e8  000018  18  Ao  49  20  8
> >
> > I can push a branch up to github if you'd like to try it yourself.
> 
> That would help thanks.
> 

This branch should do it:

https://github.com/joe-lawrence/klp-convert-tree/tree/klp-convert-v7-devel

Boot that and then run tools/testing/selftests/livepatch/test-livepatch.sh

-- Joe

