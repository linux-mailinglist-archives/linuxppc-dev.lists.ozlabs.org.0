Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B695F8BAAFE
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2024 12:48:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VW6w52jLRz86xS
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2024 20:48:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VW6r16YvXz3w19
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 May 2024 20:44:33 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VW6r15Fzrz4x1x;
	Fri,  3 May 2024 20:44:33 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Nayna Jain <nayna@linux.ibm.com>
In-Reply-To: <20240418031230.170954-1-nayna@linux.ibm.com>
References: <20240418031230.170954-1-nayna@linux.ibm.com>
Subject: Re: [PATCH v4] powerpc/pseries: make max polling consistent for longer H_CALLs
Message-Id: <171473304165.454113.5061272407898014549.b4-ty@ellerman.id.au>
Date: Fri, 03 May 2024 20:44:01 +1000
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
Cc: npiggin@gmail.com, Andrew Donnellan <ajd@linux.ibm.com>, Greg Joyce <gjoyce@linux.vnet.ibm.com>, Nageswara R Sastry <rnsastry@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 17 Apr 2024 23:12:30 -0400, Nayna Jain wrote:
> Currently, plpks_confirm_object_flushed() function polls for 5msec in
> total instead of 5sec.
> 
> Keep max polling time consistent for all the H_CALLs, which take longer
> than expected, to be 5sec. Also, make use of fsleep() everywhere to
> insert delay.
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/pseries: make max polling consistent for longer H_CALLs
      https://git.kernel.org/powerpc/c/784354349d2c988590c63a5a001ca37b2a6d4da1

cheers
