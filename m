Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 02496697C2F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 13:48:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGyYZ6hM4z3g0D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 23:48:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGyRN5bX9z3cjW
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Feb 2023 23:43:12 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PGyRN4PHcz4x7W;
	Wed, 15 Feb 2023 23:43:12 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nathan Lynch <nathanl@linux.ibm.com>, Andrew Donnellan <ajd@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Kajol Jain <kjain@linux.ibm.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Laurent Dufour <ldufour@linux.ibm.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Nick Child <nnac123@linux.ibm.com>
In-Reply-To: <20230125-b4-powerpc-rtas-queue-v3-0-26929c8cce78@linux.ibm.com>
References: <20230125-b4-powerpc-rtas-queue-v3-0-26929c8cce78@linux.ibm.com>
Subject: Re: [PATCH v3 00/20] RTAS maintenance
Message-Id: <167646490967.1421441.4079432935893160812.b4-ty@ellerman.id.au>
Date: Wed, 15 Feb 2023 23:41:49 +1100
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 10 Feb 2023 12:41:48 -0600, Nathan Lynch wrote:
> Proposed changes for the RTAS subsystem and client code.
> 
> Fixes that are subject to backporting are at the front of the queue.
> The rest of the queue is roughly ordered with respect to maturity:
> i.e. patches that have already garnered some review and discussion
> precede newer, more experimental changes.
> 
> [...]

Applied to powerpc/next.

[01/20] powerpc/rtas: handle extended delays safely in early boot
        https://git.kernel.org/powerpc/c/09d1ea72c88198ef5a9e6b8208f544fe18acbff1
[02/20] powerpc/perf/hv-24x7: add missing RTAS retry status handling
        https://git.kernel.org/powerpc/c/cc4b26eab1859fa1a70711872caaf6414809973f
[03/20] powerpc/pseries/lpar: add missing RTAS retry status handling
        https://git.kernel.org/powerpc/c/daa8ab59044610aa8ef2ee45a6c157b5e11635e9
[04/20] powerpc/pseries/lparcfg: add missing RTAS retry status handling
        https://git.kernel.org/powerpc/c/5d08633e5f6564b60f1cbe09af3af40a74d66431
[05/20] powerpc/pseries/setup: add missing RTAS retry status handling
        https://git.kernel.org/powerpc/c/b7d5333c48a21fd6a20f54b6887bcc191d21c273
[06/20] powerpc/rtas: ensure 4KB alignment for rtas_data_buf
        https://git.kernel.org/powerpc/c/836b5b9fcc8e09cea7e8a59a070349a00e818308
[07/20] powerpc/pseries: drop RTAS-based timebase synchronization
        https://git.kernel.org/powerpc/c/d6f7fe3b25f26213953066ce8109ea47dbd33cfa
[08/20] powerpc/rtas: improve function information lookups
        https://git.kernel.org/powerpc/c/8252b88294d2a744df6e3c6d85909ade403a5f2c
[09/20] powerpc/rtas: strengthen do_enter_rtas() type safety, drop inline
        https://git.kernel.org/powerpc/c/77f85f69a97ac5f24537261a893436926c3e0cdc
[10/20] powerpc/tracing: tracepoints for RTAS entry and exit
        https://git.kernel.org/powerpc/c/2c81ca7fbaea06c2aed1aec66a88208d67e1e2de
[11/20] powerpc/rtas: add tracepoints around RTAS entry
        https://git.kernel.org/powerpc/c/24098f580e2b5ceb2cec4f02833e0a0bb5d46d2e
[12/20] powerpc/pseries: add RTAS work area allocator
        https://git.kernel.org/powerpc/c/43033bc62d349d8d852855a336c91d046de819bd
[13/20] powerpc/pseries/dlpar: use RTAS work area API
        https://git.kernel.org/powerpc/c/e27e14231eb541899efc11c33d6eeddcb74767c3
[14/20] powerpc/pseries: PAPR system parameter API
        https://git.kernel.org/powerpc/c/419e27f32b6dc13c3e6f443d1ad104f2845c444b
[15/20] powerpc/pseries: convert CMO probe to papr_sysparm API
        https://git.kernel.org/powerpc/c/b8dc71774a51182185ae197ed2f8bd085ce6c848
[16/20] powerpc/pseries/lparcfg: convert to papr_sysparm API
        https://git.kernel.org/powerpc/c/fff9846be00c467b4a277492af5be8487b6540e9
[17/20] powerpc/pseries/hv-24x7: convert to papr_sysparm API
        https://git.kernel.org/powerpc/c/69b9f5a5b2c04ce5993fe43da938f065571bdb25
[18/20] powerpc/pseries/lpar: convert to papr_sysparm API
        https://git.kernel.org/powerpc/c/e58d9e17b11b776e32b1d3d80bdc63d39de3463d
[19/20] powerpc/rtas: introduce rtas_function_token() API
        https://git.kernel.org/powerpc/c/716bfc97bd5fb7b442cdd06081f49df097f2e27b
[20/20] powerpc/rtas: arch-wide function token lookup conversions
        https://git.kernel.org/powerpc/c/08273c9f619cb32fb041935724f576e607101f3b

cheers
