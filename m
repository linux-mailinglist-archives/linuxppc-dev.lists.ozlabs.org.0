Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 804F563D214
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Nov 2022 10:35:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NMYwg2bclz3ffc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Nov 2022 20:35:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NMYqk0lTyz3bcw
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Nov 2022 20:31:30 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NMYqj6lLyz4xN2;
	Wed, 30 Nov 2022 20:31:29 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <67c3b5d44edfec054234ea9b4d05fc4b4f7f8a0e.1664346554.git.christophe.leroy@csgroup.eu>
References: <67c3b5d44edfec054234ea9b4d05fc4b4f7f8a0e.1664346554.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/8xx: Reverse order entries are written by __set_pte_at()
Message-Id: <166980023882.3017288.12713313027194330624.b4-ty@ellerman.id.au>
Date: Wed, 30 Nov 2022 20:23:58 +1100
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

On Wed, 28 Sep 2022 08:29:22 +0200, Christophe Leroy wrote:
> At the time being, with 16k pages __set_pte_at() writes table entries
> in reverse order:
> 
>  294:	91 49 00 0c 	stw     r10,12(r9)
>  298:	91 49 00 08 	stw     r10,8(r9)
>  29c:	91 49 00 04 	stw     r10,4(r9)
>  2a0:	91 49 00 00 	stw     r10,0(r9)
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/8xx: Reverse order entries are written by __set_pte_at()
      https://git.kernel.org/powerpc/c/0b4721815c5328e08c3acdee4a53890e012d830b

cheers
