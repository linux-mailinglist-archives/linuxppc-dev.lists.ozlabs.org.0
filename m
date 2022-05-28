Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D23E536CFF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 May 2022 14:54:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L9M7d0sWLz3bqd
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 May 2022 22:54:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L9M6s1grBz302S
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 May 2022 22:53:41 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4L9M6s122Jz4xZ0;
	Sat, 28 May 2022 22:53:41 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Paul Mackerras <paulus@samba.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <f20a14be1a29fa0a9ebcfc5ebf05eb69c5120d10.1653370502.git.christophe.leroy@csgroup.eu>
References: <f20a14be1a29fa0a9ebcfc5ebf05eb69c5120d10.1653370502.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/xics: Include missing header
Message-Id: <165374238642.3058522.17561339833531045735.b4-ty@ellerman.id.au>
Date: Sat, 28 May 2022 22:53:06 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 24 May 2022 07:35:10 +0200, Christophe Leroy wrote:
> Include of_adresses.h to get of_iomap() prototype.
> 
> 

Applied to powerpc/next.

[1/1] powerpc/xics: Include missing header
      https://git.kernel.org/powerpc/c/14554d92c1c5a127dd0dab8fce8f08bf70d8b39b

cheers
