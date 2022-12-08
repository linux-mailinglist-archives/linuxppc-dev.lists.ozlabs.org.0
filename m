Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC14B64703B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Dec 2022 13:58:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NSZ3B5qd9z3g4j
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Dec 2022 23:58:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NSYs234cPz3cJB
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Dec 2022 23:49:58 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NSYs220CSz4xbN;
	Thu,  8 Dec 2022 23:49:58 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Nathan Lynch <nathanl@linux.ibm.com>
In-Reply-To: <20221118150751.469393-1-nathanl@linux.ibm.com>
References: <20221118150751.469393-1-nathanl@linux.ibm.com>
Subject: Re: [PATCH 00/13] RTAS maintenance
Message-Id: <167050322736.1457988.518264775627474219.b4-ty@ellerman.id.au>
Date: Thu, 08 Dec 2022 23:40:27 +1100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: tyreld@linux.ibm.com, nnac123@linux.ibm.com, ldufour@linux.ibm.com, ajd@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 18 Nov 2022 09:07:38 -0600, Nathan Lynch wrote:
> A collection of loosely-related RTAS code changes, most notably:
> 
> * Fixing misuses of rtas_token() for non-function properties.
> * The stronger validation for sys_rtas() offered by the
>   PPC_RTAS_FILTER config option is always enabled.
> * Improved function token lookups, including efficient "reverse"
>   token-to-name mappings.
> * Static tracepoints for RTAS entry and exit.
> 
> [...]

Patches 1-9 applied to powerpc/next.

[01/13] powerpc/rtas: document rtas_call()
        https://git.kernel.org/powerpc/c/336e2554ec99eb97616004c791ee89abe96bdab2
[02/13] powerpc/rtasd: use correct OF API for event scan rate
        https://git.kernel.org/powerpc/c/b10af504a2015d12c566b6b0a4c7e3b602949eeb
[03/13] powerpc/rtas: avoid device tree lookups in rtas_os_term()
        https://git.kernel.org/powerpc/c/ed2213bfb192ab51f09f12e9b49b5d482c6493f3
[04/13] powerpc/rtas: avoid scheduling in rtas_os_term()
        https://git.kernel.org/powerpc/c/6c606e57eecc37d6b36d732b1ff7e55b7dc32dd4
[05/13] powerpc/pseries/eeh: use correct API for error log size
        https://git.kernel.org/powerpc/c/9aafbfa5f57a4b75bafd3bed0191e8429c5fa618
[06/13] powerpc/rtas: clean up rtas_error_log_max initialization
        https://git.kernel.org/powerpc/c/c67a0e411d0ffe0648fe84e25e9f899ce770feb3
[07/13] powerpc/rtas: clean up includes
        https://git.kernel.org/powerpc/c/9581f8a00777a073fdd8146659a51ca007cae8d6
[08/13] powerpc/rtas: define pr_fmt and convert printk call sites
        https://git.kernel.org/powerpc/c/f975b6559bac510f1b1b39637997bb240f0a9969
[09/13] powerpc/rtas: mandate RTAS syscall filtering
        https://git.kernel.org/powerpc/c/98c738c8cee6e5a58d4060862e2f8cf3cdc8a328

cheers
