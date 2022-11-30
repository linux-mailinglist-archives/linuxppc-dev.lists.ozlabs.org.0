Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAFC63D249
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Nov 2022 10:44:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NMZ6W2Bt3z3gWN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Nov 2022 20:44:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NMYr00dYpz3bjY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Nov 2022 20:31:44 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NMYqw67Phz4xbN;
	Wed, 30 Nov 2022 20:31:40 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20221006032019.1128624-1-mpe@ellerman.id.au>
References: <20221006032019.1128624-1-mpe@ellerman.id.au>
Subject: Re: [PATCH 1/2] powerpc: Make instruction dump work with scripts/decodecode
Message-Id: <166980024503.3017288.6934056498312508193.b4-ty@ellerman.id.au>
Date: Wed, 30 Nov 2022 20:24:05 +1100
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

On Thu, 6 Oct 2022 14:20:18 +1100, Michael Ellerman wrote:
> Matt reported that scripts/decodecode doesn't work for the instruction
> dump in the powerpc oops output. Although there are scripts around that
> can decode it, it would be preferable if the standard in-tree script
> worked.
> 
> All other arches prefix the instruction dump with "Code:", and that's
> what the script looks for, so use that.
> 
> [...]

Applied to powerpc/next.

[1/2] powerpc: Make instruction dump work with scripts/decodecode
      https://git.kernel.org/powerpc/c/3e65412709293d5fb65249408e8e801b23b72635
[2/2] powerpc: Print instruction dump on a single line
      https://git.kernel.org/powerpc/c/d90bb7b4fdaff3f2fa68c7af85de2ce9e70189b1

cheers
