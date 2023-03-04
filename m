Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BA36AA935
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Mar 2023 11:38:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PTLsj34Lyz3fQp
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Mar 2023 21:38:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PTLqw00zvz3cfL
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Mar 2023 21:36:59 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PTLqp4Mlbz4x5Y;
	Sat,  4 Mar 2023 21:36:54 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20230221101952.2697101-1-mpe@ellerman.id.au>
References: <20230221101952.2697101-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc: Drop orphaned VAS MAINTAINERS entry
Message-Id: <167792619711.383795.14797340874798717438.b4-ty@ellerman.id.au>
Date: Sat, 04 Mar 2023 21:36:37 +1100
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

On Tue, 21 Feb 2023 21:19:52 +1100, Michael Ellerman wrote:
> The MAINTAINERS entry for VAS (Virtual Accelerator Switchboard) no
> longer has any maintainers, it just points to linuxppc-dev, since commit
> 60496069d0ae ("powerpc: Update MAINTAINERS for ibmvnic and VAS").
> 
> So just drop the VAS entry, all the paths are already covered by the
> main powerpc entry, ie. the output of get_maintainer.pl is unchanged.
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc: Drop orphaned VAS MAINTAINERS entry
      https://git.kernel.org/powerpc/c/d8c32853ebc4f3a49f1658ddfe0a9a42e19fc658

cheers
