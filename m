Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4902481B43E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Dec 2023 11:48:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SwnGP73NQz3dT8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Dec 2023 21:48:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Swn8n3x9mz3vmV
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Dec 2023 21:43:37 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Swn8n2zvXz4xSQ;
	Thu, 21 Dec 2023 21:43:37 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, christophe.leroy@csgroup.eu, aneesh.kumar@kernel.org
In-Reply-To: <20231204093638.71503-1-aneesh.kumar@kernel.org>
References: <20231204093638.71503-1-aneesh.kumar@kernel.org>
Subject: Re: [PATCH v2 1/2] powerpc/book3s/hash: Drop _PAGE_PRIVILEGED from PAGE_NONE
Message-Id: <170315539653.2195986.11611625910794632258.b4-ty@ellerman.id.au>
Date: Thu, 21 Dec 2023 21:43:16 +1100
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 04 Dec 2023 15:06:37 +0530, aneesh.kumar@kernel.org wrote:
> There used to be a dependency on _PAGE_PRIVILEGED with pte_savedwrite.
> But that got dropped by
> commit 6a56ccbcf6c6 ("mm/autonuma: use can_change_(pte|pmd)_writable() to replace savedwrite")
> 
> With the change in this patch numa fault pte (pte_protnone()) gets mapped as regular user pte
> with RWX cleared (no-access) whereas earlier it used to be mapped _PAGE_PRIVILEGED.
> 
> [...]

Applied to powerpc/next.

[1/2] powerpc/book3s/hash: Drop _PAGE_PRIVILEGED from PAGE_NONE
      https://git.kernel.org/powerpc/c/773b93f1d1c38c5c0d5308b8c9229c7a6ec5b2a0
[2/2] powerpc/book3s64: Avoid __pte_protnone() check in __pte_flags_need_flush()
      https://git.kernel.org/powerpc/c/a59c14f6b4caad7671dfb81737beba0b313897e4

cheers
