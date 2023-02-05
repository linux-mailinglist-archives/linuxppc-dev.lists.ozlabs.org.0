Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 781F068ADB3
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Feb 2023 01:48:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P8W3p2tzKz3f5s
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Feb 2023 11:48:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P8W273ktQz3bNn
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 Feb 2023 11:47:27 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4P8W271Jg6z4xyB;
	Sun,  5 Feb 2023 11:47:27 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20230124140448.45938-1-nathanl@linux.ibm.com>
References: <20230124140448.45938-1-nathanl@linux.ibm.com>
Subject: Re: [PATCH v2 0/4] powerpc/rtas: exports and locking
Message-Id: <167555802336.1621279.4789580610649439554.b4-ty@ellerman.id.au>
Date: Sun, 05 Feb 2023 11:47:03 +1100
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
Cc: ldufour@linux.ibm.com, ajd@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 24 Jan 2023 08:04:44 -0600, Nathan Lynch wrote:
> This series began as a single patch[1] to convert the RTAS subsystem's
> internal locks to raw spinlocks. The discussion of that patch
> identified opportunities to update a few aspects of the RTAS API, so
> the series begins with those and ends with a rebased version of the
> original patch.
> 
> Changes since v1:
> - Unexport the singleton 'rtas' struct.
> - Remove lock and args fields from 'struct rtas_t', making them
>   private to the RTAS subsystem.
> - Convert all symbol exports in rtas.c to EXPORT_SYMBOL_GPL.
> 
> [...]

Applied to powerpc/next.

[1/4] powerpc/rtas: unexport 'rtas' symbol
      https://git.kernel.org/powerpc/c/5ff92e2f274dc42a9e534473121273cd209d3501
[2/4] powerpc/rtas: make all exports GPL
      https://git.kernel.org/powerpc/c/9bce6243848dfd0ff7c2be6e8d82ab9b1e6c7858
[3/4] powerpc/rtas: remove lock and args fields from global rtas struct
      https://git.kernel.org/powerpc/c/599af49155467148afaf0bc3c0114bd80fd4491f
[4/4] powerpc/rtas: upgrade internal arch spinlocks
      https://git.kernel.org/powerpc/c/12fd66651df6c807b7b6f420ee0fd420f54991f4

cheers
