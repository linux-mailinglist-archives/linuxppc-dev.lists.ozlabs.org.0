Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D075A532852
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 12:55:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6rhT4zQ7z3cdf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 20:55:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6rfZ5qfKz30Hf
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 May 2022 20:53:58 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4L6rfZ54jXz4ySb;
 Tue, 24 May 2022 20:53:58 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20220328215831.320409-1-farosas@linux.ibm.com>
References: <20220328215831.320409-1-farosas@linux.ibm.com>
Subject: Re: [PATCH] KVM: PPC: Book3S HV: Fix vcore_blocked tracepoint
Message-Id: <165338951438.1711920.10689960042369328588.b4-ty@ellerman.id.au>
Date: Tue, 24 May 2022 20:51:54 +1000
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
Cc: kvm-ppc@vger.kernel.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 28 Mar 2022 18:58:31 -0300, Fabiano Rosas wrote:
> We removed most of the vcore logic from the P9 path but there's still
> a tracepoint that tried to dereference vc->runner.
> 
> 

Applied to powerpc/topic/ppc-kvm.

[1/1] KVM: PPC: Book3S HV: Fix vcore_blocked tracepoint
      https://git.kernel.org/powerpc/c/ad55bae7dc364417434b69dd6c30104f20d0f84d

cheers
