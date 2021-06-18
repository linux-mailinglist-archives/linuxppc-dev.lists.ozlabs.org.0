Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A8AC53AC200
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 06:23:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5m4m2p2Lz3cDH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 14:23:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5m4531XRz2yhf
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 14:22:45 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4G5m441sZZz9sXG; Fri, 18 Jun 2021 14:22:44 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <1621950703-1532-1-git-send-email-atrajeev@linux.vnet.ibm.com>
References: <1621950703-1532-1-git-send-email-atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH V3 0/2] selftests/powerpc: Updates to EBB selftest for ISA
 v3.1
Message-Id: <162398829782.1363949.2303291870649733516.b4-ty@ellerman.id.au>
Date: Fri, 18 Jun 2021 13:51:37 +1000
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
Cc: kjain@linux.ibm.com, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 shirisha.ganta1@ibm.com, rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 25 May 2021 09:51:41 -0400, Athira Rajeev wrote:
> The "no_handler_test" in ebb selftests attempts to read the PMU
> registers after closing of the event via helper function
> "dump_ebb_state". With the MMCR0 control bit (PMCCEXT) in ISA v3.1,
> read access to group B registers is restricted when MMCR0 PMCC=0b00.
> Hence the call to dump_ebb_state after closing of event will generate
> a SIGILL, which is expected.
> 
> [...]

Applied to powerpc/next.

[1/2] selftests/powerpc: Fix "no_handler" EBB selftest
      https://git.kernel.org/powerpc/c/45677c9aebe926192e59475b35a1ff35ff2d4217
[2/2] selftests/powerpc: EBB selftest for MMCR0 control for PMU SPRs in ISA v3.1
      https://git.kernel.org/powerpc/c/d81090ed44c0d15abf2b07663d5f0b9e5ba51525

cheers
