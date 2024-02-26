Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 955B68669D7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 07:03:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tjqm53LB4z3vhs
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 17:03:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tjqkp1KQjz3bwX
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Feb 2024 17:01:54 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Tjqkl03fZz4wcs;
	Mon, 26 Feb 2024 17:01:50 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
In-Reply-To: <20231227072405.63751-1-npiggin@gmail.com>
References: <20231227072405.63751-1-npiggin@gmail.com>
Subject: Re: [PATCH 0/3] powerpc/ps3: Fixes for lv1 hcall assembly
Message-Id: <170892700815.3915597.14761384936011707576.b4-ty@ellerman.id.au>
Date: Mon, 26 Feb 2024 16:56:48 +1100
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
Cc: Geoff Levand <geoff@infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 27 Dec 2023 17:24:02 +1000, Nicholas Piggin wrote:
> This (hopefully) fixes the ELFv2 bug that Geoff reported, with patch
> 1. And a couple of other possible improvements I noticed.
> 
> I don't have a PS3 setup[*] so I have only compile tested these, I'm
> sorry.
> 
> [*] Is RPCS3 usable for this kind of thing?
> 
> [...]

Applied to powerpc/next.

[1/3] powerpc/ps3: Fix lv1 hcall assembly for ELFv2 calling convention
      https://git.kernel.org/powerpc/c/6735fef14c1f089ae43fd6d43add818b7ff682a8
[2/3] powerpc/ps3: lv1 hcall code use symbolic constant for LR save offset
      https://git.kernel.org/powerpc/c/d901473c4dd0198d2d60553ea483d632175af4ea
[3/3] powerpc/ps3: Make real stack frames for LV1 hcalls
      https://git.kernel.org/powerpc/c/28b2ed86750cf5be86d19dd6ff236b23e98b255d

cheers
