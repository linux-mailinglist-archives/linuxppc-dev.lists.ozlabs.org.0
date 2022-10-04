Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8691C5F451A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Oct 2022 16:04:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MhfZz1Xfbz3g7v
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Oct 2022 01:04:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mhf1z0Sw1z3c25
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Oct 2022 00:39:19 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Mhf1x6Nqsz4xHy;
	Wed,  5 Oct 2022 00:39:17 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Rohan McLure <rmclure@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20220921065605.1051927-1-rmclure@linux.ibm.com>
References: <20220921065605.1051927-1-rmclure@linux.ibm.com>
Subject: Re: [PATCH v6 00/25] powerpc: Syscall wrapper and register clearing
Message-Id: <166488988686.779920.13794870102696416283.b4-ty@ellerman.id.au>
Date: Wed, 05 Oct 2022 00:24:46 +1100
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 21 Sep 2022 16:55:40 +1000, Rohan McLure wrote:
> V5 available here:
> 
> Link: https://lore.kernel.org/all/20220916053300.786330-2-rmclure@linux.ibm.com/T/
> 
> Implement a syscall wrapper, causing arguments to handlers to be passed
> via a struct pt_regs on the stack. The syscall wrapper is implemented
> for all platforms other than the Cell processor, from which SPUs expect
> the ability to directly call syscall handler symbols with the regular
> in-register calling convention.
> 
> [...]

Patches 1-18 & 20-21 applied to powerpc/next.

[01/25] powerpc: Remove asmlinkage from syscall handler definitions
        https://git.kernel.org/powerpc/c/5ba6c9a912fe4c60f84d6617ad10d2b8d7910990
[02/25] powerpc: Save caller r3 prior to system_call_exception
        https://git.kernel.org/powerpc/c/2c27d4a419f627636b8c6038e55acb26df05c391
[03/25] powerpc: Add ZEROIZE_GPRS macros for register clears
        https://git.kernel.org/powerpc/c/9d54a5ce3aa87810f13cd33b314097ac6d28c350
[04/25] powerpc/64s: Use {ZEROIZE,SAVE,REST}_GPRS macros in sc, scv 0 handlers
        https://git.kernel.org/powerpc/c/2b1dac4b5f97ea88fb01dfcab7fc24500b5dea95
[05/25] powerpc/32: Clarify interrupt restores with REST_GPR macro in entry_32.S
        https://git.kernel.org/powerpc/c/15ba74502ccfd0b34dad0ea022093ccc66b334d6
[06/25] powerpc/64e: Clarify register saves and clears with {SAVE,ZEROIZE}_GPRS
        https://git.kernel.org/powerpc/c/53ecaa6778d613807e590c320ccfcf48a4114108
[07/25] powerpc/64s: Fix comment on interrupt handler prologue
        https://git.kernel.org/powerpc/c/620f5c59c8617d623428c03414a022fca4e9eea2
[08/25] powerpc: Fix fallocate and fadvise64_64 compat parameter combination
        https://git.kernel.org/powerpc/c/016ff72bd2090903715c0f9422a44afbb966f4ee
[09/25] asm-generic: compat: Support BE for long long args in 32-bit ABIs
        https://git.kernel.org/powerpc/c/43d5de2b67d7f4a8478820005152f7f689608f2f
[10/25] powerpc: Use generic fallocate compatibility syscall
        https://git.kernel.org/powerpc/c/c2e7a19827eec443a7cbe85e8d959052412d6dc3
[11/25] powerpc/32: Remove powerpc select specialisation
        https://git.kernel.org/powerpc/c/b6b1334c9510e162bd8ca0ae58403cafad9572f1
[12/25] powerpc: Remove direct call to personality syscall handler
        https://git.kernel.org/powerpc/c/4df0221f9ded8c39aecfb1a80cef346026671cb7
[13/25] powerpc: Remove direct call to mmap2 syscall handlers
        https://git.kernel.org/powerpc/c/b7fa9ce86d32baf2a3a8bf8fdaa44870084edd85
[14/25] powerpc: Provide do_ppc64_personality helper
        https://git.kernel.org/powerpc/c/ac17defbeb4e8285c5b9752164b1d68b13bf3e3b
[15/25] powerpc: Adopt SYSCALL_DEFINE for arch-specific syscall handlers
        https://git.kernel.org/powerpc/c/dec20c50df79cadaff17e964ef7f622491a52134
[16/25] powerpc: Include all arch-specific syscall prototypes
        https://git.kernel.org/powerpc/c/8cd1def4b8e4a592949509fac443e850da8428d0
[17/25] powerpc: Enable compile-time check for syscall handlers
        https://git.kernel.org/powerpc/c/39859aea411b1696c6bc0c04bd2b5095ddba6196
[18/25] powerpc: Use common syscall handler type
        https://git.kernel.org/powerpc/c/8640de0dee49cec50040d9845a2bc96fd15adc9e
[20/25] powerpc: Change system_call_exception calling convention
        https://git.kernel.org/powerpc/c/f8971c627b14040e533768985a99f4fd6ffa420f
[21/25] powerpc: Provide syscall wrapper
        https://git.kernel.org/powerpc/c/7e92e01b724526b98cbc7f03dd4afa0295780d56

cheers
