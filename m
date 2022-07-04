Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 389225653ED
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 13:42:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lc3nt0n0pz3gLK
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 21:42:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lc3fV09gpz3bvc
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Jul 2022 21:36:18 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Lc3fT6HrTz4xbw;
	Mon,  4 Jul 2022 21:36:17 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: paulus@samba.org, linuxppc-dev@lists.ozlabs.org, Juerg Haefliger <juerg.haefliger@canonical.com>, benh@kernel.crashing.org, mpe@ellerman.id.au
In-Reply-To: <20220520115229.147368-1-juergh@canonical.com>
References: <20220520115229.147368-1-juergh@canonical.com>
Subject: Re: [PATCH] powerpc/powernv: Kconfig: Replace single quotes
Message-Id: <165693444720.9954.12151077020209581120.b4-ty@ellerman.id.au>
Date: Mon, 04 Jul 2022 21:34:07 +1000
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
Cc: Juerg Haefliger <juergh@canonical.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 20 May 2022 13:52:29 +0200, Juerg Haefliger wrote:
> Replace single quotes with double quotes which seems to be the convention
> for strings.
> 
> 

Applied to powerpc/next.

[1/1] powerpc/powernv: Kconfig: Replace single quotes
      https://git.kernel.org/powerpc/c/1e2e5e82748aaf1fcc0e2a91e309793cd6cc5076

cheers
