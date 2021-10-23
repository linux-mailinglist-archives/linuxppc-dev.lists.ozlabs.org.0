Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D535A4385CC
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Oct 2021 00:21:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HcG0Z1Nyfz2yb9
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Oct 2021 09:21:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=AKYXuEhi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HcFzt6DHjz2xfw
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Oct 2021 09:21:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=AKYXuEhi; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HcFzr5PCyz4xbG;
 Sun, 24 Oct 2021 09:21:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1635027673;
 bh=CyGPrXGC/BO/kmWOs4JBU+cAZa2HwgeWDXAjesvA/TU=;
 h=From:To:Cc:Subject:Date:From;
 b=AKYXuEhitEFVf7S4wVt8aFRIEg9IQwaJH1OXh2DoXqVg+92QCqOAx4/E6aXcs/sVd
 3eJwOHYL8LlPUH0Hag2IH0mSkD5MWwltFkMGv1aF5R06UKAY17xH0bjs+RfrQPofXi
 Lh220aFjvRiTh0YAwHRb6CTpU2MXPf6aiRhDhdhwXBDsyN3sJ4eVxgD03zuSJooBsG
 zUjd3m0cDeaQX3OOtiw5V56uojSQhlGcUCUyvVVUMoM42b45gZ2FTE0mloEETbD7rK
 TuIKgDjBjaTvjRrI49YY8KMzNWXwHMDKFjvKzcFt+V9fPPDwz8St1pHBkFuC9z7hWk
 nAPv0gJJ86Liw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: gregkh@linuxfoundation.org
Subject: Stable backport request
Date: Sun, 24 Oct 2021 09:21:09 +1100
Message-ID: <87zgqzbcx6.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linuxppc-dev@lists.ozlabs.org, stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Greg,

Please backport the following commit to v5.4 and v5.10:

  73287caa9210ded6066833195f4335f7f688a46b
  ("powerpc64/idle: Fix SP offsets when saving GPRs")


And please backport the following commits to v5.4, v5.10 and v5.14:

  9b4416c5095c20e110c82ae602c254099b83b72f
  ("KVM: PPC: Book3S HV: Fix stack handling in idle_kvm_start_guest()")

  cdeb5d7d890e14f3b70e8087e745c4a6a7d9f337
  ("KVM: PPC: Book3S HV: Make idle_kvm_start_guest() return 0 if it went to guest")

  496c5fe25c377ddb7815c4ce8ecfb676f051e9b6
  ("powerpc/idle: Don't corrupt back chain when going idle")


cheers
