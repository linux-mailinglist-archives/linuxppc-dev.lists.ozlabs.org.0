Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA58336EC1D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Apr 2021 16:08:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FWHRS58Ntz3fyD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Apr 2021 00:08:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FWHJc4fhfz3btR
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Apr 2021 00:02:56 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4FWHJb6lklz9tB1; Fri, 30 Apr 2021 00:02:55 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Yang Li <yang.lee@linux.alibaba.com>, mpe@ellerman.id.au
In-Reply-To: <1612236877-104974-1-git-send-email-yang.lee@linux.alibaba.com>
References: <1612236877-104974-1-git-send-email-yang.lee@linux.alibaba.com>
Subject: Re: [PATCH] powerpc/64s: remove unneeded semicolon
Message-Id: <161970488472.4033873.17685966571846339561.b4-ty@ellerman.id.au>
Date: Fri, 30 Apr 2021 00:01:24 +1000
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
Cc: paulus@samba.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2 Feb 2021 11:34:36 +0800, Yang Li wrote:
> Eliminate the following coccicheck warning:
> ./arch/powerpc/platforms/powernv/setup.c:160:2-3: Unneeded semicolon

Applied to powerpc/next.

[1/1] powerpc/64s: remove unneeded semicolon
      https://git.kernel.org/powerpc/c/caea7b833d866e0badf4b12dc41bf9fe6a7295f3

cheers
