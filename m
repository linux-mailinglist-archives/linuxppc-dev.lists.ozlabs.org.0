Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 782648BFF7C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2024 15:51:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VZGlN0lQ6z3g5M
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2024 23:51:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VZGdY3W7Qz3vh4
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 May 2024 23:46:25 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VZGdY2PzCz4x30;
	Wed,  8 May 2024 23:46:25 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, kvm-ppc@vger.kernel.org, Vaibhav Jain <vaibhav@linux.ibm.com>
In-Reply-To: <20240415035731.103097-1-vaibhav@linux.ibm.com>
References: <20240415035731.103097-1-vaibhav@linux.ibm.com>
Subject: Re: [PATCH v2] KVM: PPC: Book3S HV nestedv2: Cancel pending DEC exception
Message-Id: <171517595456.167543.8572230162605343190.b4-ty@ellerman.id.au>
Date: Wed, 08 May 2024 23:45:54 +1000
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
Cc: mikey@neuling.org, sbhat@linux.ibm.com, amachhiw@linux.vnet.ibm.com, gautam@linux.ibm.com, Nicholas Piggin <npiggin@gmail.com>, David.Laight@ACULAB.COM, kconsul@linux.vnet.ibm.com, Jordan Niethe <jniethe5@gmail.com>, Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 15 Apr 2024 09:27:29 +0530, Vaibhav Jain wrote:
> This reverts commit 180c6b072bf3 ("KVM: PPC: Book3S HV nestedv2: Do not
> cancel pending decrementer exception") [1] which prevented canceling a
> pending HDEC exception for nestedv2 KVM guests. It was done to avoid
> overhead of a H_GUEST_GET_STATE hcall to read the 'DEC expiry TB' register
> which was higher compared to handling extra decrementer exceptions.
> 
> However recent benchmarks indicate that overhead of not handling 'DECR'
> expiry for Nested KVM Guest(L2) is higher and results in much larger exits
> to Pseries Host(L1) as indicated by the Unixbench-arithoh bench[2]
> 
> [...]

Applied to powerpc/topic/ppc-kvm.

[1/1] KVM: PPC: Book3S HV nestedv2: Cancel pending DEC exception
      https://git.kernel.org/powerpc/c/7be6ce7043b4cf293c8826a48fd9f56931cef2cf

cheers
