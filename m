Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C9E151A50
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Feb 2020 13:08:21 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Bk420mwpzDqM2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Feb 2020 23:08:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48BjwD4l32zDqLH
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Feb 2020 23:01:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 48BjwD2PG2zB3ws; Tue,  4 Feb 2020 23:01:31 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 43e76cd368fbb67e767da5363ffeaa3989993c8c
In-Reply-To: <20200118170335.21440-1-alex@ghiti.fr>
To: Alexandre Ghiti <alex@ghiti.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>,
 Alexei Starovoitov <ast@kernel.org>, linux-next@vger.kernel.org,
 Zong Li <zong.li@sifive.com>, Palmer Dabbelt <palmerdabbelt@google.com>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v2] powerpc: Do not consider weak unresolved symbol
 relocations as bad
Message-Id: <48BjwD2PG2zB3ws@ozlabs.org>
Date: Tue,  4 Feb 2020 23:01:31 +1100 (AEDT)
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
Cc: Alexandre Ghiti <alex@ghiti.fr>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 2020-01-18 at 17:03:35 UTC, Alexandre Ghiti wrote:
> Commit 8580ac9404f6 ("bpf: Process in-kernel BTF") introduced two weak
> symbols that may be unresolved at link time which result in an absolute
> relocation to 0. relocs_check.sh emits the following warning:
> 
> "WARNING: 2 bad relocations
> c000000001a41478 R_PPC64_ADDR64    _binary__btf_vmlinux_bin_start
> c000000001a41480 R_PPC64_ADDR64    _binary__btf_vmlinux_bin_end"
> 
> whereas those relocations are legitimate even for a relocatable kernel
> compiled with -pie option.
> 
> relocs_check.sh already excluded some weak unresolved symbols explicitly:
> remove those hardcoded symbols and add some logic that parses the symbols
> using nm, retrieves all the weak unresolved symbols and excludes those from
> the list of the potential bad relocations.
> 
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/43e76cd368fbb67e767da5363ffeaa3989993c8c

cheers
