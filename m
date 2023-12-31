Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A334820B3B
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 Dec 2023 12:10:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T2xHd6DtRz3vk3
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 Dec 2023 22:10:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T2xDn00YVz2xnK
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 31 Dec 2023 22:08:25 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4T2xDm5zzRz4x5m;
	Sun, 31 Dec 2023 22:08:24 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, kvm-ppc@vger.kernel.org, Vaibhav Jain <vaibhav@linux.ibm.com>
In-Reply-To: <20231219092309.118151-1-vaibhav@linux.ibm.com>
References: <20231219092309.118151-1-vaibhav@linux.ibm.com>
Subject: Re: [PATCH] powerpc/hvcall: Reorder Nestedv2 hcall opcodes
Message-Id: <170402086354.3311386.14872359556466328787.b4-ty@ellerman.id.au>
Date: Sun, 31 Dec 2023 22:07:43 +1100
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
Cc: mikey@neuling.org, sbhat@linux.ibm.com, amachhiw@linux.vnet.ibm.com, Jordan Niethe <jniethe5@gmail.com>, gautam@linux.ibm.com, Nicholas Piggin <npiggin@gmail.com>, David.Laight@ACULAB.COM, kconsul@linux.vnet.ibm.com, Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 19 Dec 2023 14:52:36 +0530, Vaibhav Jain wrote:
> This trivial patch reorders the newly introduced hcall opcodes for Nestedv2
> to follow the increasing-opcode-number convention followed in
> 'hvcall.h'. The patch also updates the value for MAX_HCALL_OPCODE which is
> at various places in arch code for range checking.
> 
> 

Applied to powerpc/next.

[1/1] powerpc/hvcall: Reorder Nestedv2 hcall opcodes
      https://git.kernel.org/powerpc/c/eb8446e164572180c2cd0ea4e8494e4419202396

cheers
