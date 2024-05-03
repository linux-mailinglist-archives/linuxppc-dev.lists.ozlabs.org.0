Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 442F18BAAE8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2024 12:42:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VW6p16bzzz3dB7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2024 20:42:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VW6nb1D5xz2ytN
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 May 2024 20:42:27 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VW6nZ72RFz4x1P;
	Fri,  3 May 2024 20:42:26 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, "Aneesh Kumar K.V (IBM)" <aneesh.kumar@kernel.org>
In-Reply-To: <20240403083611.172833-1-aneesh.kumar@kernel.org>
References: <20240403083611.172833-1-aneesh.kumar@kernel.org>
Subject: Re: [PATCH 1/3] powerpc/mm: Align memory_limit value specified using mem= kernel parameter
Message-Id: <171473286289.451432.3306607552242417496.b4-ty@ellerman.id.au>
Date: Fri, 03 May 2024 20:41:02 +1000
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
Cc: Naveen N Rao <naveen@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 03 Apr 2024 14:06:09 +0530, Aneesh Kumar K.V (IBM) wrote:
> The value specified for the memory limit is used to set a restriction on
> memory usage. It is important to ensure that this restriction is within
> the linear map kernel address space range. The hash page table
> translation uses a 16MB page size to map the kernel linear map address
> space. htab_bolt_mapping() function aligns down the size of the range
> while mapping kernel linear address space. Since the memblock limit is
> enforced very early during boot, before we can detect the type of memory
> translation (radix vs hash), we align the memory limit value specified
> as a kernel parameter to 16MB. This alignment value will work for both
> hash and radix translations.
> 
> [...]

Applied to powerpc/next.

[1/3] powerpc/mm: Align memory_limit value specified using mem= kernel parameter
      https://git.kernel.org/powerpc/c/5ca096161cdccfa328acf6704a4615528471d309
[2/3] powerpc/fadump: Don't update the user-specified memory limit
      https://git.kernel.org/powerpc/c/f94f5ac07983cb53de0c964f5428366c19e81993
[3/3] powerpc/mm: Update the memory limit based on direct mapping restrictions
      https://git.kernel.org/powerpc/c/5a799af9522641517f6d871d9f56e2658ee7db58

cheers
