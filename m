Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB5E3F9A1B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 15:30:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gx0v51J87z307D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 23:29:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ellerman.id.au; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gx0kn6gc7z3c7l
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Aug 2021 23:22:41 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Gx0kn2HGjz9sX3;
 Fri, 27 Aug 2021 23:22:41 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, christophe.leroy@csgroup.eu,
 mpe@ellerman.id.au, Kajol Jain <kjain@linux.ibm.com>
In-Reply-To: <20210818171556.36912-1-kjain@linux.ibm.com>
References: <20210818171556.36912-1-kjain@linux.ibm.com>
Subject: Re: [PATCH v4 1/3] powerpc/perf: Use stack siar instead of mfspr
Message-Id: <163007016630.52768.2542052893705342167.b4-ty@ellerman.id.au>
Date: Fri, 27 Aug 2021 23:16:06 +1000
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
Cc: atrajeev@linux.vnet.ibm.com, maddy@linux.ibm.com, rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 18 Aug 2021 22:45:54 +0530, Kajol Jain wrote:
> Minor optimization in the 'perf_instruction_pointer' function code by
> making use of stack siar instead of mfspr.
> 
> 
> 
> 

Applied to powerpc/next.

[1/3] powerpc/perf: Use stack siar instead of mfspr
      https://git.kernel.org/powerpc/c/b1643084d164cea0c107a39bcdf0119fc52619af
[2/3] powerpc/perf: Drop the case of returning 0 as instruction pointer
      https://git.kernel.org/powerpc/c/cc90c6742ef5b438f4cb86029d7a794bd0a44a06
[3/3] powerpc/perf: Fix the check for SIAR value
      https://git.kernel.org/powerpc/c/3c69a5f22223fa3e312689ec218b5059784d49d7

cheers
