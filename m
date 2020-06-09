Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 704E71F339A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 07:47:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49gzdt3R2hzDqby
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 15:46:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49gzDm4p3rzDqRx
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jun 2020 15:28:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49gzDm3Vqgz9sTN; Tue,  9 Jun 2020 15:28:40 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <154a99399317b096ac1f04827b9f8d7a9179ddc1.1586962586.git.christophe.leroy@c-s.fr>
References: <154a99399317b096ac1f04827b9f8d7a9179ddc1.1586962586.git.christophe.leroy@c-s.fr>
Subject: Re: [PATCH] powerpc/uaccess: Don't set KUAP by default on book3s/32
Message-Id: <159168035057.1381411.13783600194244224122.b4-ty@ellerman.id.au>
Date: Tue,  9 Jun 2020 15:28:40 +1000 (AEST)
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 15 Apr 2020 14:57:09 +0000 (UTC), Christophe Leroy wrote:
> On book3s/32, KUAP is an heavy process as it requires to
> determine which segments are impacted and unlock/lock
> each of them.
> 
> And since the implementation of user_access_begin/end, it
> is even worth for the time being because unlike __get_user(),
> user_access_begin doesn't make difference between read and write
> and unlocks access also for read allthought that's unneeded
> on book3s/32.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/uaccess: Don't set KUAP by default on book3s/32
      https://git.kernel.org/powerpc/c/547e687b2981a115814962506068873d24983af7

cheers
