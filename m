Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AD579745540
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 08:02:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qvb1c4VDpz3gfK
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 16:02:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QvZpC51W3z3bx0
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jul 2023 15:52:51 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QvZpB3fk7z4wy8;
	Mon,  3 Jul 2023 15:52:50 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: arnd@arndb.de, npiggin@gmail.com, christophe.leroy@csgroup.eu, Tom Rix <trix@redhat.com>
In-Reply-To: <20230428221240.2679194-1-trix@redhat.com>
References: <20230428221240.2679194-1-trix@redhat.com>
Subject: Re: [PATCH] powerpc: remove unneeded if-checks
Message-Id: <168836201880.50010.12319548059181473411.b4-ty@ellerman.id.au>
Date: Mon, 03 Jul 2023 15:26:58 +1000
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

On Fri, 28 Apr 2023 18:12:40 -0400, Tom Rix wrote:
> For ppc64, gcc with W=1 reports
> arch/powerpc/platforms/cell/spu_base.c:330:17: error:
>   suggest braces around empty body in an 'if' statement [-Werror=empty-body]
>   330 |                 ;
>       |                 ^
> arch/powerpc/platforms/cell/spu_base.c:333:17: error:
>   suggest braces around empty body in an 'if' statement [-Werror=empty-body]
>   333 |                 ;
>       |                 ^
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc: remove unneeded if-checks
      https://git.kernel.org/powerpc/c/da5311a4b852eaf2c0feac8b28884a8d8a801dfc

cheers
