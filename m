Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FFD555F771
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 09:02:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXspP0Jwpz3f0Z
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 17:02:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXsng69G1z3bq3
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jun 2022 17:01:27 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LXsng4t4mz4xNm;
	Wed, 29 Jun 2022 17:01:27 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Liam Howlett <liam.howlett@oracle.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linux-kernel@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>
In-Reply-To: <20220624011745.4060795-1-Liam.Howlett@oracle.com>
References: <20220624011745.4060795-1-Liam.Howlett@oracle.com>
Subject: Re: [PATCH] powerpc/prom_init: Fix kernel config grep
Message-Id: <165648606483.2953426.15827591769571638131.b4-ty@ellerman.id.au>
Date: Wed, 29 Jun 2022 17:01:04 +1000
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

On Fri, 24 Jun 2022 01:17:58 +0000, Liam Howlett wrote:
> When searching for config options, use the KCONFIG shell variable so
> that builds using non-standard config locations work.
> 
> 

Applied to powerpc/fixes.

[1/1] powerpc/prom_init: Fix kernel config grep
      https://git.kernel.org/powerpc/c/6886da5f49e6d86aad76807a93f3eef5e4f01b10

cheers
