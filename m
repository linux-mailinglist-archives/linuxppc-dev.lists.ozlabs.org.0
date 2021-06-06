Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 830E139CEDD
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Jun 2021 14:17:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fyb9Q4tHvz3fJM
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Jun 2021 22:17:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fyb3P1rwQz306K
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  6 Jun 2021 22:12:17 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4Fyb3M4DtCz9t0G; Sun,  6 Jun 2021 22:12:15 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Nathan Lynch <nathanl@linux.ibm.com>
In-Reply-To: <20210514162420.2911458-1-nathanl@linux.ibm.com>
References: <20210514162420.2911458-1-nathanl@linux.ibm.com>
Subject: Re: [PATCH] powerpc/xmon: make dumping log buffer contents more
 reliable
Message-Id: <162298131785.2353459.10031547788608372273.b4-ty@ellerman.id.au>
Date: Sun, 06 Jun 2021 22:08:37 +1000
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
Cc: jniethe5@gmail.com, paulus@samba.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 14 May 2021 11:24:20 -0500, Nathan Lynch wrote:
> Log buffer entries that are too long for dump_log_buf()'s small
> local buffer are:
> 
> * silently discarded when a single-line entry is too long;
>   kmsg_dump_get_line() returns true but sets &len to 0.
> * silently truncated to the last fitting new line when a multi-line
>   entry is too long, e.g. register dumps from __show_regs(); this
>   seems undetectable via the kmsg_dump API.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/xmon: make dumping log buffer contents more reliable
      https://git.kernel.org/powerpc/c/2cec178e35baf57d307c0982fd2e53055bd1e9bb

cheers
