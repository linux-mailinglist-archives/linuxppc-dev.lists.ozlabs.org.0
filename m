Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E94B568AF06
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Feb 2023 10:42:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P8kvy6XDMz3fDp
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Feb 2023 20:42:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P8kvP5CBZz3bYw
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 Feb 2023 20:42:25 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4P8kvN5FdPz4x1h;
	Sun,  5 Feb 2023 20:42:24 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20230110124753.1325426-1-mpe@ellerman.id.au>
References: <20230110124753.1325426-1-mpe@ellerman.id.au>
Subject: Re: [PATCH 1/2] powerpc/64s/radix: Fix crash with unaligned relocated kernel
Message-Id: <167559010966.1647710.3621700369737652487.b4-ty@ellerman.id.au>
Date: Sun, 05 Feb 2023 20:41:49 +1100
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

On Tue, 10 Jan 2023 23:47:52 +1100, Michael Ellerman wrote:
> If a relocatable kernel is loaded at an address that is not 2MB aligned
> and told not to relocate to zero, the kernel can crash due to
> mark_rodata_ro() incorrectly changing some read-write data to read-only.
> 
> Scenarios where the misalignment can occur are when the kernel is
> loaded by kdump or using the RELOCATABLE_TEST config option.
> 
> [...]

Applied to powerpc/fixes.

[1/2] powerpc/64s/radix: Fix crash with unaligned relocated kernel
      https://git.kernel.org/powerpc/c/98d0219e043e09013e883eacde3b93e0b2bf944d
[2/2] powerpc/64s/radix: Fix RWX mapping with relocated kernel
      https://git.kernel.org/powerpc/c/111bcb37385353f0510e5847d5abcd1c613dba23

cheers
