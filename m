Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6D87A931F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Sep 2023 11:33:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rrqw86P0fz3cn3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Sep 2023 19:33:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rrqvh09H6z2ymM
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Sep 2023 19:33:20 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
	id 4Rrqvg4v4qz4xPL; Thu, 21 Sep 2023 19:33:19 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Rrqvg46KSz4wy6;
	Thu, 21 Sep 2023 19:33:19 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@ozlabs.org, Aditya Gupta <adityag@linux.ibm.com>
In-Reply-To: <20230911091409.415662-1-adityag@linux.ibm.com>
References: <20230911091409.415662-1-adityag@linux.ibm.com>
Subject: Re: [PATCH] powerpc: add `cur_cpu_spec` symbol to vmcoreinfo
Message-Id: <169528860032.876432.12152654406988174161.b4-ty@ellerman.id.au>
Date: Thu, 21 Sep 2023 19:30:00 +1000
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
Cc: Hari Bathini <hbathini@linux.ibm.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Sourabh Jain <sourabhjain@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 11 Sep 2023 14:44:09 +0530, Aditya Gupta wrote:
> Presently, while reading a vmcore, makedumpfile uses
> `cur_cpu_spec.mmu_features` to decide whether the crashed system had
> RADIX MMU or not.
> 
> Currently, makedumpfile fails to get the `cur_cpu_spec` symbol (unless
> a vmlinux is passed with the `-x` flag to makedumpfile), and hence
> assigns offsets and shifts (such as pgd_offset_l4) incorrecly considering
> MMU to be hash MMU.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc: add `cur_cpu_spec` symbol to vmcoreinfo
      https://git.kernel.org/powerpc/c/7135b921b32966d7602ede396b7286d372aee63f

cheers
