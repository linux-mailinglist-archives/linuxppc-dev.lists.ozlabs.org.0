Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC032331AB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jul 2020 14:08:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BHTht2dbtzDqwb
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jul 2020 22:08:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BHTbz2nGpzDqvh
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jul 2020 22:04:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=CYke0PcA; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BHTbx1lczz9sSd;
 Thu, 30 Jul 2020 22:04:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1596110670;
 bh=z0WIyR/mZG9ZjQNWeL5HzLGtq1gOYwd4LC1GYXLfzlQ=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=CYke0PcAF/Ees6uRtYzVeoJVbRvmwbMwl2Sd7v10oKOJf1C9sXfUqjLwsGKxbg2iN
 RAP1SfNDOZUOTofug5H9MHFA1Ojd4rnvgWumBThOibNO/QahMAOO6kQOGAW/mxhFEp
 VlAA7sCX09gdJklvvelzUK04jG2bQFRjCx/bycCFnUf5+aCDEdKixCNSGH/BIEOS80
 i1GRuRf1pRLDEG3gKREmiQAdv+U8+ARHRH4vKqbYvHm/Qd005UzrQY1Waz5tNZW6jf
 nPwHOJe23D3mf8eYl9UcWRlpJoj3vp3tKfaVZ/+pjYxMiMCTYamxgAdY6E9WnyA49G
 yZNpnalCUpdGQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Segher Boessenkool <segher@kernel.crashing.org>,
 Vladis Dronov <vdronov@redhat.com>
Subject: Re: [PATCH] powerpc: fix function annotations to avoid section
 mismatch warnings with gcc-10
In-Reply-To: <20200729224427.GI17447@gate.crashing.org>
References: <20200729133741.62789-1-vdronov@redhat.com>
 <20200729144949.GF17447@gate.crashing.org>
 <584129967.9672326.1596051896801.JavaMail.zimbra@redhat.com>
 <20200729224427.GI17447@gate.crashing.org>
Date: Thu, 30 Jul 2020 22:04:27 +1000
Message-ID: <87ft995hv8.fsf@mpe.ellerman.id.au>
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
Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Segher Boessenkool <segher@kernel.crashing.org> writes:
> On Wed, Jul 29, 2020 at 03:44:56PM -0400, Vladis Dronov wrote:
>> > > Certain warnings are emitted for powerpc code when building with a gcc-10
>> > > toolset:
>> > > 
>> > >     WARNING: modpost: vmlinux.o(.text.unlikely+0x377c): Section mismatch in
>> > >     reference from the function remove_pmd_table() to the function
>> > >     .meminit.text:split_kernel_mapping()
>> > >     The function remove_pmd_table() references
>> > >     the function __meminit split_kernel_mapping().
>> > >     This is often because remove_pmd_table lacks a __meminit
>> > >     annotation or the annotation of split_kernel_mapping is wrong.
>> > > 
>> > > Add the appropriate __init and __meminit annotations to make modpost not
>> > > complain. In all the cases there are just a single callsite from another
>> > > __init or __meminit function:
>> > > 
>> > > __meminit remove_pagetable() -> remove_pud_table() -> remove_pmd_table()
>> > > __init prom_init() -> setup_secure_guest()
>> > > __init xive_spapr_init() -> xive_spapr_disabled()
>> > 
>> > So what changed?  These functions were inlined with older compilers, but
>> > not anymore?
>> 
>> Yes, exactly. Gcc-10 does not inline them anymore. If this is because of my
>> build system, this can happen to others also.
>> 
>> The same thing was fixed by Linus in e99332e7b4cd ("gcc-10: mark more functions
>> __init to avoid section mismatch warnings").
>
> It sounds like this is part of "-finline-functions was retuned" on
> <https://gcc.gnu.org/gcc-10/changes.html>?  So everyone should see it
> (no matter what config or build system), and it is a good thing too :-)

I haven't seen it in my GCC 10 builds, so there must be some other
subtlety. Probably it depends on details of the .config.

cheers
