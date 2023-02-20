Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89AC669C484
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Feb 2023 04:42:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PKpC044hRz3cLr
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Feb 2023 14:42:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PKpBQ24dDz3brK
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Feb 2023 14:41:50 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PKpBK12CCz4x7s;
	Mon, 20 Feb 2023 14:41:45 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Benjamin Gray <bgray@linux.ibm.com>
In-Reply-To: <20230217011434.115554-1-bgray@linux.ibm.com>
References: <20230217011434.115554-1-bgray@linux.ibm.com>
Subject: Re: [PATCH] powerpc/64s: Prevent fallthrough to hash TLB flush when using radix
Message-Id: <167686449062.2401256.9391243130522170355.b4-ty@ellerman.id.au>
Date: Mon, 20 Feb 2023 14:41:30 +1100
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 17 Feb 2023 12:14:34 +1100, Benjamin Gray wrote:
> In the fix reconnecting hash__tlb_flush() to tlb_flush() the
> void return on radix__tlb_flush() was not restored and subsequently
> falls through to the restored hash__tlb_flush().
> 
> Guard hash__tlb_flush() under an else to prevent this.
> 
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/64s: Prevent fallthrough to hash TLB flush when using radix
      https://git.kernel.org/powerpc/c/4302abc628fc0dc08e5855f21bbfaed407a72bc3

cheers
