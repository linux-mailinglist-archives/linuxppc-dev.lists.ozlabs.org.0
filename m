Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B85E98BFF5C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2024 15:49:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VZGhl2HQdz78Sn
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2024 23:49:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VZGXW0JXxz3cTF
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 May 2024 23:42:03 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VZGXW02Fnz4xNH;
	Wed,  8 May 2024 23:42:02 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: rdunlap@infradead.org, arnd@arndb.de, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, aneesh.kumar@kernel.org, naveen.n.rao@linux.ibm.com, Yang Li <yang.lee@linux.alibaba.com>
In-Reply-To: <20240408053109.96360-1-yang.lee@linux.alibaba.com>
References: <20240408053109.96360-1-yang.lee@linux.alibaba.com>
Subject: Re: [PATCH -next 2/3 v2] powerpc: Fix kernel-doc comments in fsl_gtm.c
Message-Id: <171517558552.165093.5326367473907742082.b4-ty@ellerman.id.au>
Date: Wed, 08 May 2024 23:39:45 +1000
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

On Mon, 08 Apr 2024 13:31:08 +0800, Yang Li wrote:
> Fix some function names in kernel-doc comments.
> 
> 

Applied to powerpc/next.

[2/3] powerpc: Fix kernel-doc comments in fsl_gtm.c
      https://git.kernel.org/powerpc/c/97bd2693b399cfd436acaa230d8f09e4c39e8e5c
[3/3] powerpc/rtas: Add kernel-doc comments to smp_startup_cpu()
      https://git.kernel.org/powerpc/c/554da5e0f71238384787954242d881cfeeff844d

cheers
