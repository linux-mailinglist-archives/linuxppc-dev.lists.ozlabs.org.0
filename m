Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E47545D78C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 10:48:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0Cjy26Zzz3ckd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 20:48:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0Chv6Mjyz30BM
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 20:47:27 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4J0Chv3CDHz4xcs;
 Thu, 25 Nov 2021 20:47:27 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Daniel Axtens <dja@axtens.net>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20211015070628.1331635-1-dja@axtens.net>
References: <20211015070628.1331635-1-dja@axtens.net>
Subject: Re: [PATCH 1/2] eeh: Small refactor of eeh_handle_normal_event
Message-Id: <163783297701.1228879.1999105954221026259.b4-ty@ellerman.id.au>
Date: Thu, 25 Nov 2021 20:36:17 +1100
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
Cc: oohall@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 15 Oct 2021 18:06:27 +1100, Daniel Axtens wrote:
> The control flow of eeh_handle_normal_event is a bit tricky.
> 
> Break out one of the error handling paths - rather than be in
> an else block, we'll make it part of the regular body of the
> function and put a 'goto out;' in the true limb of the if.
> 
> 
> [...]

Applied to powerpc/next.

[1/2] eeh: Small refactor of eeh_handle_normal_event
      https://git.kernel.org/powerpc/c/10b34ece132ee46dc4e6459c765d180c422a09fa
[2/2] powerpc/eeh: Use a goto for recovery failures
      https://git.kernel.org/powerpc/c/157616f3c2284f13ca7db9897293f944e6ab8199

cheers
