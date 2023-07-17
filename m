Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1802C7558DE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jul 2023 02:33:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R43396kvcz3cJ4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jul 2023 10:33:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R432B1kDCz2yxt
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jul 2023 10:32:34 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4R43282lC9z4wxy;
	Mon, 17 Jul 2023 10:32:32 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20230517074945.53188-1-mpe@ellerman.id.au>
References: <20230517074945.53188-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/security: Fix Speculation_Store_Bypass reporting on Power10
Message-Id: <168955377882.195506.16092114020800640274.b4-ty@ellerman.id.au>
Date: Mon, 17 Jul 2023 10:29:38 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Cc: ruscur@russell.cc, rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 17 May 2023 17:49:45 +1000, Michael Ellerman wrote:
> Nageswara reported that /proc/self/status was showing "vulnerable" for
> the Speculation_Store_Bypass feature on Power10, eg:
> 
>   $ grep Speculation_Store_Bypass: /proc/self/status
>   Speculation_Store_Bypass:       vulnerable
> 
> But at the same time the sysfs files, and lscpu, were showing "Not
> affected".
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/security: Fix Speculation_Store_Bypass reporting on Power10
      https://git.kernel.org/powerpc/c/5bcedc5931e7bd6928a2d8207078d4cb476b3b55

cheers
