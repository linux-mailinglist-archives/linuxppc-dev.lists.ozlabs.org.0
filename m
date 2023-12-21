Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D465B81B428
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Dec 2023 11:46:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SwnCr41fZz3wCj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Dec 2023 21:46:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Swn5f2HJXz3cXv
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Dec 2023 21:40:54 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Swn5d5vpQz4xKZ;
	Thu, 21 Dec 2023 21:40:53 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, Nathan Lynch <nathanl@linux.ibm.com>
In-Reply-To: <20231212-papr-sys_rtas-vs-lockdown-v6-0-e9eafd0c8c6c@linux.ibm.com>
References: <20231212-papr-sys_rtas-vs-lockdown-v6-0-e9eafd0c8c6c@linux.ibm.com>
Subject: Re: [PATCH v6 00/13] powerpc/pseries: New character devices for system parameters and VPD
Message-Id: <170315510014.2192823.13196586562676023956.b4-ty@ellerman.id.au>
Date: Thu, 21 Dec 2023 21:38:20 +1100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Cc: "Aneesh Kumar K.V \(IBM\)" <aneesh.kumar@kernel.org>, tyreld@linux.ibm.com, Michal Suchánek <msuchanek@suse.de>, linuxppc-dev@lists.ozlabs.org, gcwilson@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 12 Dec 2023 11:01:47 -0600, Nathan Lynch wrote:
> Add character devices that expose PAPR-specific system parameters and
> VPD to user space.
> 
> The problem: important platform features are enabled on Linux VMs
> through the powerpc-specific rtas() syscall in combination with
> writeable mappings of /dev/mem. In typical usage, this is encapsulated
> behind APIs provided by the librtas library. This paradigm is
> incompatible with lockdown, which prohibits /dev/mem access. It also
> is too low-level in many cases: a single logical operation may require
> multiple sys_rtas() calls in succession to complete. This carries the
> risk that a process may exit while leaving an operation unfinished. It
> also means that callers must coordinate their use of the syscall for
> functions that cannot tolerate multiple concurrent clients, such as
> ibm,get-vpd.
> 
> [...]

Applied to powerpc/next.

[01/13] powerpc/rtas: Avoid warning on invalid token argument to sys_rtas()
        https://git.kernel.org/powerpc/c/01e346ffefda3a7088afebf02b940614179688e7
[02/13] powerpc/rtas: Add for_each_rtas_function() iterator
        https://git.kernel.org/powerpc/c/c500c6e736df030f8956080738f59701c0b43dd8
[03/13] powerpc/rtas: Fall back to linear search on failed token->function lookup
        https://git.kernel.org/powerpc/c/669acc7eec223a81ea5e2420de85b61979ab7dad
[04/13] powerpc/rtas: Add function return status constants
        https://git.kernel.org/powerpc/c/9592aa5ad59e736727fe7894e6e820e2d851abcf
[05/13] powerpc/rtas: Move token validation from block_rtas_call() to sys_rtas()
        https://git.kernel.org/powerpc/c/e7582edb78619abb4ebf0a6e1fed125dcd7243b6
[06/13] powerpc/rtas: Facilitate high-level call sequences
        https://git.kernel.org/powerpc/c/adf7a019e5f82607fc0f0079926d0178afe8f4ef
[07/13] powerpc/rtas: Serialize firmware activation sequences
        https://git.kernel.org/powerpc/c/dc7637c402b90a197d3f21a3d78f2b00b67ea22a
[08/13] powerpc/rtas: Warn if per-function lock isn't held
        https://git.kernel.org/powerpc/c/e3681107bc9f97c5948a1c8a3a97ac64907210ce
[09/13] powerpc/pseries: Add papr-vpd character driver for VPD retrieval
        https://git.kernel.org/powerpc/c/514f6ff4369a30bf0da71a1a09fd47b2fca5d76f
[10/13] powerpc/pseries/papr-sysparm: Validate buffer object lengths
        https://git.kernel.org/powerpc/c/35aae182bd7b422be3cefc08c12207bf2b973364
[11/13] powerpc/pseries/papr-sysparm: Expose character device to user space
        https://git.kernel.org/powerpc/c/905b9e48786ec55b2c469db77fb46e20bf3e4901
[12/13] powerpc/selftests: Add test for papr-vpd
        https://git.kernel.org/powerpc/c/9118c5d32bddb5f75bc4f9f31218e70317702502
[13/13] powerpc/selftests: Add test for papr-sysparm
        https://git.kernel.org/powerpc/c/76b2ec3faeaa0c8d84705acd64ac0e5a307ce9c2

cheers
