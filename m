Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBFB8D7A22
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2024 04:46:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vsyll47M5z3cTp
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2024 12:46:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VsylM1MXbz30T1
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jun 2024 12:45:51 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VsylM3kQHz4wyY;
	Mon,  3 Jun 2024 12:45:51 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20240529123029.146953-1-mpe@ellerman.id.au>
References: <20240529123029.146953-1-mpe@ellerman.id.au>
Subject: Re: [PATCH v2 1/2] powerpc/uaccess: Fix build errors seen with GCC 13/14
Message-Id: <171738271139.1517513.4516718039331874746.b4-ty@ellerman.id.au>
Date: Mon, 03 Jun 2024 12:45:11 +1000
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 29 May 2024 22:30:28 +1000, Michael Ellerman wrote:
> Building ppc64le_defconfig with GCC 14 fails with assembler errors:
> 
>     CC      fs/readdir.o
>   /tmp/ccdQn0mD.s: Assembler messages:
>   /tmp/ccdQn0mD.s:212: Error: operand out of domain (18 is not a multiple of 4)
>   /tmp/ccdQn0mD.s:226: Error: operand out of domain (18 is not a multiple of 4)
>   ... [6 lines]
>   /tmp/ccdQn0mD.s:1699: Error: operand out of domain (18 is not a multiple of 4)
> 
> [...]

Applied to powerpc/fixes.

[1/2] powerpc/uaccess: Fix build errors seen with GCC 13/14
      https://git.kernel.org/powerpc/c/2d43cc701b96f910f50915ac4c2a0cae5deb734c
[2/2] powerpc/uaccess: Use YZ asm constraint for ld
      https://git.kernel.org/powerpc/c/50934945d54238d2d6d8db4b7c1d4c90d2696c57

cheers
