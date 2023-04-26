Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 533006EF426
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Apr 2023 14:17:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q5yYj1zCyz3ghp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Apr 2023 22:17:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q5yMb2RCtz3fDD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Apr 2023 22:08:59 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Q5yMZ4G5zz4xNF;
	Wed, 26 Apr 2023 22:08:58 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Paul Gortmaker <paul.gortmaker@windriver.com>
In-Reply-To: <20230225201318.3682-1-paul.gortmaker@windriver.com>
References: <20230225201318.3682-1-paul.gortmaker@windriver.com>
Subject: Re: [RFC PATCH 0/3] Remove some e600/MPC7448/MPC86xx evaluation platforms
Message-Id: <168251050528.3973805.17729292959247213914.b4-ty@ellerman.id.au>
Date: Wed, 26 Apr 2023 22:01:45 +1000
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
Cc: Scott Wood <oss@buserror.net>, Claudiu Manoil <claudiu.manoil@nxp.com>, Paul Mackerras <paulus@samba.org>, Li Yang <leoyang.li@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 25 Feb 2023 15:13:15 -0500, Paul Gortmaker wrote:
> [This RFC is proposed for v6.4 and hence is based off linux-next.]
> 
> This is the final series in reducing our day to day cost of carrying rare
> evaluation platforms.  It targets the e600 Freescale processor family.
> 
> It starts with the HPC II (Taiga) platform[1] using the 7448 core.
> Unlike previous e300/e500 procfams, there was no splitting roles between
> an MDS evaluation board and a more deploy-ready RDS variant.  The High
> Performance Computing (HPC) platform combined the two into one, with an
> attempt to lean slightly more towards the RDS goals.
> 
> [...]

Applied to powerpc/next.

[1/3] powerpc: drop HPC II (MPC7448) evaluation platform support.
      https://git.kernel.org/powerpc/c/f03425a5fd838a841138e3be586c1245fa9c78d6
[2/3] powerpc: drop HPC-NET/MPC8641D evaluation platform support
      https://git.kernel.org/powerpc/c/c1d85f3f75e3c8391134b67aefc8d029b26fa38e
[3/3] powerpc: drop HPCD/MPC8610 evaluation platform support
      https://git.kernel.org/powerpc/c/248667f8bbded6c00a300dbcabe0d15b3d0de9ab

cheers
