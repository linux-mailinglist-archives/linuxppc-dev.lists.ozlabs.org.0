Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 37AF94D16EF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Mar 2022 13:11:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KCZ1r0r61z3byr
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Mar 2022 23:11:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KCZ0g4mbbz3bTL
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Mar 2022 23:10:43 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KCZ0h2k81z4xvf;
 Tue,  8 Mar 2022 23:10:44 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, Ganesh Goudar <ganeshgr@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20220107141428.67862-1-ganeshgr@linux.ibm.com>
References: <20220107141428.67862-1-ganeshgr@linux.ibm.com>
Subject: Re: [PATCH v3 RESEND 1/3] powerpc/pseries: Parse control memory
 access error
Message-Id: <164674128702.3322453.3116948207400999531.b4-ty@ellerman.id.au>
Date: Tue, 08 Mar 2022 23:08:07 +1100
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
Cc: mahesh@linux.ibm.com, npiggin@gmail.com, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 7 Jan 2022 19:44:26 +0530, Ganesh Goudar wrote:
> Add support to parse and log control memory access
> error for pseries. These changes are made according to
> PAPR v2.11 10.3.2.2.12.
> 
> 

Applied to powerpc/next.

[1/3] powerpc/pseries: Parse control memory access error
      https://git.kernel.org/powerpc/c/0f54bddefe7f5e4c98bea6f945ebdf85d1c44117
[2/3] selftests/powerpc: Add test for real address error handling
      https://git.kernel.org/powerpc/c/0f4ef8a3bf784f250abc7d0155ae4e9fa22d8210
[3/3] powerpc/mce: Modify the real address error logging messages
      https://git.kernel.org/powerpc/c/0a182611d149b5b747014fbb230ec35b20a45c86

cheers
