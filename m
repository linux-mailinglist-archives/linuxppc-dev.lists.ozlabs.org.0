Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F67D34F606
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 03:16:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F97g535Shz3fhc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 12:16:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F97XY2drVz3c43
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Mar 2021 12:10:20 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4F97XW5ZGgz9srX; Wed, 31 Mar 2021 12:10:19 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Denis Efremov <efremov@linux.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
In-Reply-To: <20210305112807.26299-1-efremov@linux.com>
References: <20210305112807.26299-1-efremov@linux.com>
Subject: Re: [PATCH] powerpc/ptrace: Remove duplicate check from
 pt_regs_check()
Message-Id: <161715296614.226945.7764784471817464354.b4-ty@ellerman.id.au>
Date: Wed, 31 Mar 2021 12:09:26 +1100
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
Cc: linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 5 Mar 2021 14:28:07 +0300, Denis Efremov wrote:
> "offsetof(struct pt_regs, msr) == offsetof(struct user_pt_regs, msr)"
> checked in pt_regs_check() twice in a row. Remove the second check.

Applied to powerpc/next.

[1/1] powerpc/ptrace: Remove duplicate check from pt_regs_check()
      https://git.kernel.org/powerpc/c/0b71b37241784c309bea6bd6a9d2027943c4ab94

cheers
