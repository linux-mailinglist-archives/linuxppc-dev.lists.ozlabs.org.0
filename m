Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C794E240796
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Aug 2020 16:29:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BQJHw0R5PzDqLt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Aug 2020 00:29:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=cmainas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BQJDz21PkzDqNf
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Aug 2020 00:26:43 +1000 (AEST)
Received: from localhost.localdomain (unknown [95.146.230.158])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 506F22070B;
 Mon, 10 Aug 2020 14:26:39 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: Gregory Herrero <gregory.herrero@oracle.com>,
 "Steven Rostedt (VMware)" <rostedt@goodmis.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] recordmcount: Fix build failure on non arm64
Date: Mon, 10 Aug 2020 15:26:37 +0100
Message-Id: <159706958035.25067.17604192727592443780.b4-ty@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <5ca1be21fa6ebf73203b45fd9aadd2bafb5e6b15.1597049145.git.christophe.leroy@csgroup.eu>
References: <5ca1be21fa6ebf73203b45fd9aadd2bafb5e6b15.1597049145.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
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
Cc: linuxppc-dev@lists.ozlabs.org, Will Deacon <will@kernel.org>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 10 Aug 2020 08:48:22 +0000 (UTC), Christophe Leroy wrote:
> Commit ea0eada45632 leads to the following build failure on powerpc:
> 
>   HOSTCC  scripts/recordmcount
> scripts/recordmcount.c: In function 'arm64_is_fake_mcount':
> scripts/recordmcount.c:440: error: 'R_AARCH64_CALL26' undeclared (first use in this function)
> scripts/recordmcount.c:440: error: (Each undeclared identifier is reported only once
> scripts/recordmcount.c:440: error: for each function it appears in.)
> make[2]: *** [scripts/recordmcount] Error 1
> 
> [...]

Applied to arm64 (for-next/core), thanks!

[1/1] recordmcount: Fix build failure on non arm64
      https://git.kernel.org/arm64/c/3df14264ad99

-- 
Catalin

