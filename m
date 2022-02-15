Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B994B62E2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 06:34:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JyVCR1sqZz3fTg
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 16:34:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JyV6F4jmHz3cBN
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Feb 2022 16:30:13 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JyV6F1L1cz4y4h;
 Tue, 15 Feb 2022 16:30:13 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Jeremy Kerr <jk@ozlabs.org>, Julia Lawall <Julia.Lawall@inria.fr>
In-Reply-To: <1588929176-28527-1-git-send-email-Julia.Lawall@inria.fr>
References: <1588929176-28527-1-git-send-email-Julia.Lawall@inria.fr>
Subject: Re: [PATCH] powerpc/spufs: adjust list element pointer type
Message-Id: <164490279736.270256.6555666963870570666.b4-ty@ellerman.id.au>
Date: Tue, 15 Feb 2022 16:26:37 +1100
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
Cc: Nic Volanschi <eugene.volanschi@inria.fr>, Arnd Bergmann <arnd@arndb.de>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 08 May 2020 09:12:56 +0000, Julia Lawall wrote:
> Other uses of &gang->aff_list_head, eg in spufs_assert_affinity, indicate
> that the list elements have type spu_context, not spu as used here.  Change
> the type of tmp accordingly.
> 
> This has no impact on the execution, because tmp is not used in the body of
> the loop.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/spufs: adjust list element pointer type
      https://git.kernel.org/powerpc/c/925f76c55784fdc17ab41aecde06b30439ceb73a

cheers
