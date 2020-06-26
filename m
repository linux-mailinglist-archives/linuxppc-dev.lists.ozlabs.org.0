Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E162C20ABAC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jun 2020 07:04:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49tPvV22NbzDr0y
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jun 2020 15:04:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49tPTk24W8zDqWW
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jun 2020 14:46:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49tPTg0x1Nz9sTF; Fri, 26 Jun 2020 14:45:58 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 John Crispin <john@phrozen.org>, Paul Mackerras <paulus@samba.org>
In-Reply-To: <1482393968-60623-1-git-send-email-john@phrozen.org>
References: <1482393968-60623-1-git-send-email-john@phrozen.org>
Subject: Re: [PATCH] arch: powerpc: ppc4xx compile flag optimizations
Message-Id: <159314672783.1150869.15085498536728162262.b4-ty@ellerman.id.au>
Date: Fri, 26 Jun 2020 14:45:58 +1000 (AEST)
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
Cc: Imre Kaloz <kaloz@openwrt.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 22 Dec 2016 09:06:08 +0100, John Crispin wrote:
> This patch splits up the compile flags between ppc40x and ppc44x.

Applied to powerpc/next.

[1/1] powerpc/4xx: ppc4xx compile flag optimizations
      https://git.kernel.org/powerpc/c/548ad77d10f7ad6e5f84a0026978da2ed1df0dae

cheers
