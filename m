Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D182614AA6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Nov 2022 13:28:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N1q7F1C6gz3cjY
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Nov 2022 23:28:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N1q5m12sQz3f43
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Nov 2022 23:27:08 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4N1q5l6m2Dz4xN0;
	Tue,  1 Nov 2022 23:27:07 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Andreas Schwab <schwab@linux-m68k.org>, Rohan McLure <rmclure@linux.ibm.com>
In-Reply-To: <87mt9cxd6g.fsf_-_@igel.home>
References: <20220921065605.1051927-1-rmclure@linux.ibm.com> <20220921065605.1051927-22-rmclure@linux.ibm.com> <87mt9cxd6g.fsf_-_@igel.home>
Subject: Re: [PATCH] powerpc/32: fix syscall wrappers with 64-bit arguments
Message-Id: <166730554940.2453885.9553402143339300323.b4-ty@ellerman.id.au>
Date: Tue, 01 Nov 2022 23:25:49 +1100
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
Cc: linuxppc-dev@lists.ozlabs.org, Andrew Donnellan <ajd@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 31 Oct 2022 15:47:35 +0100, Andreas Schwab wrote:
> With the introducion of syscall wrappers all wrappers for syscalls with
> 64-bit arguments must be handled specially, not only those that have
> unaligned 64-bit arguments.  This left out the fallocate and
> sync_file_range2 syscalls.
> 
> 

Applied to powerpc/fixes.

[1/1] powerpc/32: fix syscall wrappers with 64-bit arguments
      https://git.kernel.org/powerpc/c/ce883a2ba310cd7c291bb66ce5d207965fca6003

cheers
