Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC98820B39
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 Dec 2023 12:10:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T2xGh3r3Lz3dXf
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 Dec 2023 22:10:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T2xDl6wPkz2xnK
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 31 Dec 2023 22:08:23 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4T2xDl4xm1z4x3G;
	Sun, 31 Dec 2023 22:08:23 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: npiggin@gmail.com, Haoran Liu <liuhaoran14@163.com>
In-Reply-To: <20231127144108.29782-1-liuhaoran14@163.com>
References: <20231127144108.29782-1-liuhaoran14@163.com>
Subject: Re: [PATCH] powerpc/powernv: Add error handling to opal_prd_range_is_valid
Message-Id: <170402086356.3311386.1240109605547008356.b4-ty@ellerman.id.au>
Date: Sun, 31 Dec 2023 22:07:43 +1100
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 27 Nov 2023 06:41:08 -0800, Haoran Liu wrote:
> In the opal_prd_range_is_valid function within opal-prd.c,
> error handling was missing for the of_get_address call.
> This patch adds necessary error checking, ensuring that the
> function gracefully handles scenarios where of_get_address fails.
> 
> 

Applied to powerpc/next.

[1/1] powerpc/powernv: Add error handling to opal_prd_range_is_valid
      https://git.kernel.org/powerpc/c/e6beb47edb89ca9dc8906515e2dfbeb5913312c8

cheers
