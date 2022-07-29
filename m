Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 647915850D9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jul 2022 15:24:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LvSsX2fBfz3fxf
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jul 2022 23:24:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LvSlv4jjQz3fJx
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Jul 2022 23:19:23 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LvSlt555Bz4xG3;
	Fri, 29 Jul 2022 23:19:22 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: paulus@samba.org, Jason Wang <wangborong@cdjrlc.com>
In-Reply-To: <20220718075553.70897-1-wangborong@cdjrlc.com>
References: <20220718075553.70897-1-wangborong@cdjrlc.com>
Subject: Re: [PATCH] powerpc/pseries/vas: Fix comment typo
Message-Id: <165909977858.253830.9547689135709883077.b4-ty@ellerman.id.au>
Date: Fri, 29 Jul 2022 23:02:58 +1000
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
Cc: nick.child@ibm.com, haren@linux.ibm.com, linux-kernel@vger.kernel.org, npiggin@gmail.com, Julia.Lawall@inria.fr, clg@kaod.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 18 Jul 2022 15:55:53 +0800, Jason Wang wrote:
> The double `the' in line 807 is duplicated, remove one.
> 
> 

Applied to powerpc/next.

[1/1] powerpc/pseries/vas: Fix comment typo
      https://git.kernel.org/powerpc/c/901a30cf5f765a26f1308701d9df9e7f3d0023a5

cheers
