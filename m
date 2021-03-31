Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD76634F62B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 03:22:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F97pH6LNnz3cHC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 12:22:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F97Xw0C5Yz3cHl
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Mar 2021 12:10:39 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4F97Xv1V4Fz9t14; Wed, 31 Mar 2021 12:10:35 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: npiggin@gmail.com, linuxppc-dev@lists.ozlabs.org,
 Bhaskar Chowdhury <unixbhaskar@gmail.com>, mikey@neuling.org,
 mpe@ellerman.id.au, jniethe5@gmail.com, christophe.leroy@csgroup.eu,
 benh@kernel.crashing.org, alistair@popple.id.au, linux-kernel@vger.kernel.org,
 paulus@samba.org
In-Reply-To: <20210224075547.763063-1-unixbhaskar@gmail.com>
References: <20210224075547.763063-1-unixbhaskar@gmail.com>
Subject: Re: [PATCH] arch: powerpc: kernel: Change droping to dropping in the
 file traps.c
Message-Id: <161715296517.226945.7681284090188409225.b4-ty@ellerman.id.au>
Date: Wed, 31 Mar 2021 12:09:25 +1100
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
Cc: rdunlap@infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 24 Feb 2021 13:25:47 +0530, Bhaskar Chowdhury wrote:
> s/droping/dropping/

Applied to powerpc/next.

[1/1] arch: powerpc: kernel: Change droping to dropping in the file traps.c
      https://git.kernel.org/powerpc/c/5c4a4802b9ac8c1acdf2250fad3f8f2d6254f9c7

cheers
