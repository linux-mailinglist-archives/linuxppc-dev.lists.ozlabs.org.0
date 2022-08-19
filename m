Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 491D5599AD5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Aug 2022 13:30:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M8KKz1VgGz3f2w
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Aug 2022 21:29:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M8KKD2fjgz3cFl
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Aug 2022 21:29:20 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4M8KKC3y0jz4x1d;
	Fri, 19 Aug 2022 21:29:19 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Russell Currey <ruscur@russell.cc>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20220812071632.56095-1-ruscur@russell.cc>
References: <20220812071632.56095-1-ruscur@russell.cc>
Subject: Re: [PATCH] selftests/powerpc: Add missing PMU selftests to .gitignores
Message-Id: <166090854356.441873.15243805559069450960.b4-ty@ellerman.id.au>
Date: Fri, 19 Aug 2022 21:29:03 +1000
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
Cc: kjain@linux.ibm.com, atrajeev@linux.vnet.ibm.com, maddy@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 12 Aug 2022 17:16:32 +1000, Russell Currey wrote:
> Some recently added selftests don't have their binaries in .gitignores,
> so add them.
> 
> I also alphabetically sorted sampling_tests/.gitignore while I was in
> there.
> 
> 
> [...]

Applied to powerpc/fixes.

[1/1] selftests/powerpc: Add missing PMU selftests to .gitignores
      https://git.kernel.org/powerpc/c/f889a2e89ea5b4db5cf09765ee5e310be43c7b6f

cheers
