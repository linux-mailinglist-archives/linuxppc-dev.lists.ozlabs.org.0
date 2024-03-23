Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B028488763F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Mar 2024 01:47:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V1gWp3Y9Vz3vsD
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Mar 2024 11:47:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V1gVx2rNjz3vhf
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Mar 2024 11:46:33 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4V1gVx0P0Fz4wyl;
	Sat, 23 Mar 2024 11:46:33 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <b16329611deb89e1af505d43f0e2a91310584d26.1710587887.git.christophe.leroy@csgroup.eu>
References: <b16329611deb89e1af505d43f0e2a91310584d26.1710587887.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2] powerpc: Handle error in mark_rodata_ro() and mark_initmem_nx()
Message-Id: <171115475788.936455.13882639894804019812.b4-ty@ellerman.id.au>
Date: Sat, 23 Mar 2024 11:45:57 +1100
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 16 Mar 2024 12:18:21 +0100, Christophe Leroy wrote:
> mark_rodata_ro() and mark_initmem_nx() use functions that can
> fail like set_memory_nx() and set_memory_ro(), leading to a not
> protected kernel.
> 
> In case of failure, panic.
> 
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc: Handle error in mark_rodata_ro() and mark_initmem_nx()
      https://git.kernel.org/powerpc/c/78cb0945f7141961781f815168f6873ad2b7ed29

cheers
