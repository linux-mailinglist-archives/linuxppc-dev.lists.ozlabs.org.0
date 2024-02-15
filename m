Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5068563D7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Feb 2024 14:00:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TbFXW2bT7z3vXL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Feb 2024 00:00:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TbFX31jdDz3cGc
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Feb 2024 23:59:47 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4TbFX23Q7Sz4wcp;
	Thu, 15 Feb 2024 23:59:46 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: npiggin@gmail.com, christophe.leroy@csgroup.eu, aneesh.kumar@kernel.org, naveen.n.rao@linux.ibm.com, David Engraf <david.engraf@sysgo.com>
In-Reply-To: <20240207092758.1058893-1-david.engraf@sysgo.com>
References: <20240207092758.1058893-1-david.engraf@sysgo.com>
Subject: Re: [PATCH] powerpc/cputable: Add missing PPC_FEATURE_BOOKE on PPC64 Book-E
Message-Id: <170800185785.599237.15747454436307843287.b4-ty@ellerman.id.au>
Date: Thu, 15 Feb 2024 23:57:37 +1100
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 07 Feb 2024 10:27:58 +0100, David Engraf wrote:
> Commit e320a76db4b0 ("powerpc/cputable: Split cpu_specs[] out of cputable.h")
> moved the cpu_specs to separate header files. Previously PPC_FEATURE_BOOKE
> was enabled by CONFIG_PPC_BOOK3E_64. The definition in cpu_specs_e500mc.h
> for PPC64 no longer enables PPC_FEATURE_BOOKE.
> 
> This breaks user space reading the ELF hwcaps and expect PPC_FEATURE_BOOKE.
> Debugging an application with gdb is no longer working on e5500/e6500
> because the 64-bit detection relies on PPC_FEATURE_BOOKE for Book-E.
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/cputable: Add missing PPC_FEATURE_BOOKE on PPC64 Book-E
      https://git.kernel.org/powerpc/c/eb6d871f4ba49ac8d0537e051fe983a3a4027f61

cheers
