Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F34788ACA
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Aug 2019 12:29:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 465JJ50Tx9zDqsR
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Aug 2019 20:29:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 465J5t07B0zDqyq
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Aug 2019 20:20:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 465J5s4MBZz9sNm; Sat, 10 Aug 2019 20:20:33 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 1ebe0dcce1750109181d666394b7dfd9af9ff645
In-Reply-To: <20190802000835.26191-1-jniethe5@gmail.com>
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/xive: Update comment referencing magic loads from
 an ESB
Message-Id: <465J5s4MBZz9sNm@ozlabs.org>
Date: Sat, 10 Aug 2019 20:20:33 +1000 (AEST)
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
Cc: Jordan Niethe <jniethe5@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2019-08-02 at 00:08:35 UTC, Jordan Niethe wrote:
> The comment above xive_esb_read() references magic loads from an ESB as
> described xive.h. This has been inaccurate since commit 12c1f339cd49
> ("powerpc/xive: Move definition of ESB bits") which moved the
> description. Update the comment to reference the new location of the
> description in xive-regs.h
> 
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> Acked-by: Stewart Smith <stewart@linux.ibm.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/1ebe0dcce1750109181d666394b7dfd9af9ff645

cheers
