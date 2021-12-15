Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A02474F3E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Dec 2021 01:29:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JDGNF2MGDz3ckR
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Dec 2021 11:29:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JDGJr30sXz3c9Y
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Dec 2021 11:26:52 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JDGJm5345z4xhs;
 Wed, 15 Dec 2021 11:26:48 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org,
 Hari Bathini <hbathini@linux.ibm.com>, npiggin@gmail.com
In-Reply-To: <20211207103719.91117-1-hbathini@linux.ibm.com>
References: <20211207103719.91117-1-hbathini@linux.ibm.com>
Subject: Re: [PATCH v3 1/2] powerpc: handle kdump appropriately with
 crash_kexec_post_notifiers option
Message-Id: <163952788224.919625.4766990349365852809.b4-ty@ellerman.id.au>
Date: Wed, 15 Dec 2021 11:24:42 +1100
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
Cc: mahesh@linux.ibm.com, sourabhjain@linux.ibm.com,
 kernel test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 7 Dec 2021 16:07:18 +0530, Hari Bathini wrote:
> Kdump can be triggered after panic_notifers since commit f06e5153f4ae2
> ("kernel/panic.c: add "crash_kexec_post_notifiers" option for kdump
> after panic_notifers") introduced crash_kexec_post_notifiers option.
> But using this option would mean smp_send_stop(), that marks all other
> CPUs as offline, gets called before kdump is triggered. As a result,
> kdump routines fail to save other CPUs' registers. To fix this, kdump
> friendly crash_smp_send_stop() function was introduced with kernel
> commit 0ee59413c967 ("x86/panic: replace smp_send_stop() with kdump
> friendly version in panic path"). Override this kdump friendly weak
> function to handle crash_kexec_post_notifiers option appropriately
> on powerpc.
> 
> [...]

Applied to powerpc/next.

[1/2] powerpc: handle kdump appropriately with crash_kexec_post_notifiers option
      https://git.kernel.org/powerpc/c/219572d2fc4135b5ce65c735d881787d48b10e71
[2/2] ppc64/fadump: fix inaccurate CPU state info in vmcore generated with panic
      https://git.kernel.org/powerpc/c/06e629c25daa519be620a8c17359ae8fc7a2e903

cheers
