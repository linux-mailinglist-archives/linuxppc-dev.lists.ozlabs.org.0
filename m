Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 452FF31977B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Feb 2021 01:32:29 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DcDwV6N29zDwtR
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Feb 2021 11:32:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DcDf46rCczDwnH
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Feb 2021 11:19:56 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4DcDf322BKz9sVm; Fri, 12 Feb 2021 11:19:54 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <99d4ccb58a20d8408d0e19874393655ad5b40822.1612879284.git.christophe.leroy@csgroup.eu>
References: <99d4ccb58a20d8408d0e19874393655ad5b40822.1612879284.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2 1/3] powerpc/uaccess: get rid of small constant size
 cases in raw_copy_{to, from}_user()
Message-Id: <161308904868.3606979.5042920812236325748.b4-ty@ellerman.id.au>
Date: Fri, 12 Feb 2021 11:19:54 +1100 (AEDT)
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

On Tue, 9 Feb 2021 14:02:12 +0000 (UTC), Christophe Leroy wrote:
> Copied from commit 4b842e4e25b1 ("x86: get rid of small
> constant size cases in raw_copy_{to,from}_user()")
> 
> Very few call sites where that would be triggered remain, and none
> of those is anywhere near hot enough to bother.

Applied to powerpc/next.

[1/3] powerpc/uaccess: get rid of small constant size cases in raw_copy_{to,from}_user()
      https://git.kernel.org/powerpc/c/6b385d1d7c0a346758e35b128815afa25d4709ee
[2/3] powerpc/uaccess: Merge __put_user_size_allowed() into __put_user_size()
      https://git.kernel.org/powerpc/c/95d019e0f9225954e33b6efcad315be9d548a4d7
[3/3] powerpc/uaccess: Merge raw_copy_to_user_allowed() into raw_copy_to_user()
      https://git.kernel.org/powerpc/c/052f9d206f6c4b5b512b8c201d375f2dd194be35

cheers
