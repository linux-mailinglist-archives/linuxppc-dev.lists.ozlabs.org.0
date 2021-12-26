Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3DE47F92C
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Dec 2021 22:58:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JMZRY5bxKz3f6f
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Dec 2021 08:58:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JMZLy5Jgmz30HX
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Dec 2021 08:54:02 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JMZLy2650z4xnB;
 Mon, 27 Dec 2021 08:54:02 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Randy Dunlap <rdunlap@infradead.org>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20211223003942.22098-1-rdunlap@infradead.org>
References: <20211223003942.22098-1-rdunlap@infradead.org>
Subject: Re: [PATCH] powerpc: fix spelling of "its"
Message-Id: <164055556187.3187272.2806987270522314044.b4-ty@ellerman.id.au>
Date: Mon, 27 Dec 2021 08:52:41 +1100
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 22 Dec 2021 16:39:42 -0800, Randy Dunlap wrote:
> Use the possessive "its" instead of the contraction of "it is" (it's).
> 
> 

Applied to powerpc/next.

[1/1] powerpc: fix spelling of "its"
      https://git.kernel.org/powerpc/c/5b09250cca85ae6f91c9562cf1f5e5747de0a75d

cheers
