Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A24833F9A27
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 15:32:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gx0xr4Fvwz3cBS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 23:32:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ellerman.id.au; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gx0l20tw6z3cCx
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Aug 2021 23:22:54 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Gx0l14C20z9tk8;
 Fri, 27 Aug 2021 23:22:53 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, sxwjean@me.com
In-Reply-To: <20210807010239.416055-1-sxwjean@me.com>
References: <20210807010239.416055-1-sxwjean@me.com>
Subject: Re: [PATCH v2 0/4] Some improvements on regs usage
Message-Id: <163007017202.52768.7618867123198912679.b4-ty@ellerman.id.au>
Date: Fri, 27 Aug 2021 23:16:12 +1000
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
Cc: ravi.bangoria@linux.ibm.com, Xiongwei Song <sxwjean@gmail.com>,
 npiggin@gmail.com, oleg@redhat.com, efremov@linux.com,
 linux-kernel@vger.kernel.org, paulus@samba.org, aneesh.kumar@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 7 Aug 2021 09:02:35 +0800, sxwjean@me.com wrote:
> From: Xiongwei Song <sxwjean@gmail.com>
> 
> When CONFIG_4xx=y or CONFIG_BOOKE=y, currently in code we reference dsisr
> to get interrupt reasons and reference dar to get excepiton address.
> However, in reference manuals, esr is used for interrupt reasons and dear
> is used for excepiton address, so the patchset changes dsisr -> esr,
> dar -> dear for CONFIG_4xx=y or CONFIG_BOOKE=y.
> 
> [...]

Applied to powerpc/next.

[1/4] powerpc: Optimize register usage for esr register
      https://git.kernel.org/powerpc/c/4f8e78c0757e3c5a65d9d8ac76e2434c71a78f5a
[2/4] powerpc/64e: Get esr offset with _ESR macro
      https://git.kernel.org/powerpc/c/cfa47772ca8d53d7a6c9b331a7f6e7c4c9827214
[3/4] powerpc: Optimize register usage for dear register
      https://git.kernel.org/powerpc/c/4872cbd0ca35ca5b20d52e2539e7e1950f126e7b
[4/4] powerpc/64e: Get dear offset with _DEAR macro
      https://git.kernel.org/powerpc/c/d9db6e420268b2d561731468a31f0b15e2e9a145

cheers
