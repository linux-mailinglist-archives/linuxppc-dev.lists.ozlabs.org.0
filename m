Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A61692FABB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2024 14:54:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WLBPk2nBKz3dSv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2024 22:54:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WLBNw3Twtz3c3H
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jul 2024 22:53:52 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WLBNw0FrJz4x04;
	Fri, 12 Jul 2024 22:53:52 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Jonathan Corbet <corbet@lwn.net>, Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <c2d64bebc514ca892a12e51a68821a6317048d3a.1720694954.git.christophe.leroy@csgroup.eu>
References: <c2d64bebc514ca892a12e51a68821a6317048d3a.1720694954.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] Documentation/powerpc: Mention 40x is removed
Message-Id: <172078879463.310795.10548340090473025469.b4-ty@ellerman.id.au>
Date: Fri, 12 Jul 2024 22:53:14 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 11 Jul 2024 12:50:21 +0200, Christophe Leroy wrote:
> Commit 732b32daef80 ("powerpc: Remove core support for 40x") removed 40x.
> 
> Update documentation accordingly.
> 
> 

Applied to powerpc/next.

[1/1] Documentation/powerpc: Mention 40x is removed
      https://git.kernel.org/powerpc/c/90e812ac40c4b813fdbafab22f426fe4cdf840a8

cheers
