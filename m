Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DCAB8BAAFC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2024 12:47:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VW6v60JnZz3vwJ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2024 20:47:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VW6nl3tbsz3cds
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 May 2024 20:42:35 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VW6nl320gz4xPR;
	Fri,  3 May 2024 20:42:35 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <20240412092047.455483-1-sshegde@linux.ibm.com>
References: <20240412092047.455483-1-sshegde@linux.ibm.com>
Subject: Re: [PATCH v2 0/2] powerpc/pseries: Fixes for lparstat boot reports
Message-Id: <171473286291.451432.5360724442247323299.b4-ty@ellerman.id.au>
Date: Fri, 03 May 2024 20:41:02 +1000
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
Cc: nathanl@linux.ibm.com, tyreld@linux.ibm.com, mahesh@linux.ibm.com, npiggin@gmail.com, naveen.n.rao@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 12 Apr 2024 14:50:45 +0530, Shrikanth Hegde wrote:
> Currently lparstat reports which shows since LPAR boot are wrong for
> some fields. There is a need for storing the PIC(Pool Idle Count) at
> boot for accurate reporting. PATCH 1 Does that.
> 
> While there, it was noticed that hcall return value is long and both
> h_get_ppp and h_get_mpp could set the uninitialized values if the hcall
> fails. PATCH 2 does that.
> 
> [...]

Applied to powerpc/next.

[1/2] powerpc/pseries: Add pool idle time at LPAR boot
      https://git.kernel.org/powerpc/c/9c74ecfd0fc46e2eaf92c1b6169cc0c8a87f1dc2
[2/2] powerpc/pseries: Add failure related checks for h_get_mpp and h_get_ppp
      https://git.kernel.org/powerpc/c/6d4341638516bf97b9a34947e0bd95035a8230a5

cheers
