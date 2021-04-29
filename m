Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B7E36EC21
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Apr 2021 16:09:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FWHS83Q5mz3g8N
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Apr 2021 00:09:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FWHJg46sFz3bvk
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Apr 2021 00:02:59 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4FWHJf5GZHz9t15; Fri, 30 Apr 2021 00:02:58 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Yang Li <yang.lee@linux.alibaba.com>, shuah@kernel.org
In-Reply-To: <1612780870-95890-1-git-send-email-yang.lee@linux.alibaba.com>
References: <1612780870-95890-1-git-send-email-yang.lee@linux.alibaba.com>
Subject: Re: [PATCH] selftests/powerpc: remove unneeded semicolon
Message-Id: <161970488494.4033873.16008307098207126624.b4-ty@ellerman.id.au>
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
Cc: linux-kernel@vger.kernel.org, paulus@samba.org,
 linux-kselftest@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 8 Feb 2021 18:41:10 +0800, Yang Li wrote:
> Eliminate the following coccicheck warning:
> ./tools/testing/selftests/powerpc/nx-gzip/gzfht_test.c:327:4-5: Unneeded
> semicolon

Applied to powerpc/next.

[1/1] selftests/powerpc: remove unneeded semicolon
      https://git.kernel.org/powerpc/c/0db11461677aa5105b9ebbd939aee0ceb77a988b

cheers
