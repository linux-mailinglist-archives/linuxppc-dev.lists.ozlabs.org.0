Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2A73F9998
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 15:22:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gx0kT2q4Yz301s
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 23:22:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ellerman.id.au; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gx0k349sRz2yPc
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Aug 2021 23:22:03 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Gx0jz5Lzzz9sWc;
 Fri, 27 Aug 2021 23:21:59 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
In-Reply-To: <20210825042447.106219-1-aneesh.kumar@linux.ibm.com>
References: <20210825042447.106219-1-aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH] powerpc/doc: Fix htmldocs errors
Message-Id: <163007018288.52768.14499337093622516578.b4-ty@ellerman.id.au>
Date: Fri, 27 Aug 2021 23:16:22 +1000
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Jonathan Corbet <corbet@lwn.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 25 Aug 2021 09:54:47 +0530, Aneesh Kumar K.V wrote:
> Fix make htmldocs related errors with the newly added associativity.rst
> doc file.
> 
> 
> 
> 

Applied to powerpc/next.

[1/1] powerpc/doc: Fix htmldocs errors
      https://git.kernel.org/powerpc/c/f50da6edbf1ebf35dd8070847bfab5cb988d472b

cheers
