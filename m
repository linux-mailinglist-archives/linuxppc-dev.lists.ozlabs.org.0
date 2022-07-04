Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1379E5653D3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 13:38:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lc3hg0NFlz3fJ9
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 21:38:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lc3f42vdTz3c2W
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Jul 2022 21:35:56 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Lc3f41FjWz4xDB;
	Mon,  4 Jul 2022 21:35:56 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Mackerras <paulus@samba.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <6977314c823cfb728bc0273cea634b41807bfb64.1655202721.git.christophe.leroy@csgroup.eu>
References: <6977314c823cfb728bc0273cea634b41807bfb64.1655202721.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 1/3] powerpc/32: Remove the 'nobats' kernel parameter
Message-Id: <165693440969.9954.7330946300172449990.b4-ty@ellerman.id.au>
Date: Mon, 04 Jul 2022 21:33:29 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 14 Jun 2022 12:32:23 +0200, Christophe Leroy wrote:
> Mapping without BATs doesn't bring any added value to the user.
> 
> Remove that option.
> 
> 

Applied to powerpc/next.

[1/3] powerpc/32: Remove the 'nobats' kernel parameter
      https://git.kernel.org/powerpc/c/1ce844973bb516e95d3f2bcb001a3992548def9d
[2/3] powerpc/32: Remove 'noltlbs' kernel parameter
      https://git.kernel.org/powerpc/c/56e54b4e6c477b2a7df43f9a320ae5f9a5bfb16c
[3/3] powerpc/32: Remove __map_without_ltlbs
      https://git.kernel.org/powerpc/c/513f5bbac7b9ca7046bc350dd6eb39b957e338a7

cheers
