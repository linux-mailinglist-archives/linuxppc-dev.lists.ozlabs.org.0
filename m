Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 342215F44C1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Oct 2022 15:50:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MhfGd11gsz3gJH
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Oct 2022 00:50:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mhf1b4DTNz2xtt
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Oct 2022 00:38:59 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Mhf1b34wPz4xGp;
	Wed,  5 Oct 2022 00:38:59 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20220916131422.318752-1-mpe@ellerman.id.au>
References: <20220916131422.318752-1-mpe@ellerman.id.au>
Subject: Re: [PATCH 1/2] powerpc/vmlinux.lds: Ensure STRICT_ALIGN_SIZE is at least page aligned
Message-Id: <166488985030.779920.15599868484615582893.b4-ty@ellerman.id.au>
Date: Wed, 05 Oct 2022 00:24:10 +1100
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
Cc: npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 16 Sep 2022 23:14:21 +1000, Michael Ellerman wrote:
> Add a check that STRICT_ALIGN_SIZE is aligned to at least PAGE_SIZE.
> 
> That then makes the alignment to PAGE_SIZE immediately after the
> alignment to STRICT_ALIGN_SIZE redundant, so remove it.
> 
> 

Applied to powerpc/next.

[1/2] powerpc/vmlinux.lds: Ensure STRICT_ALIGN_SIZE is at least page aligned
      https://git.kernel.org/powerpc/c/331771e836e6a32c8632d8cf5e2cdd94471258ad
[2/2] powerpc/vmlinux.lds: Add an explicit symbol for the SRWX boundary
      https://git.kernel.org/powerpc/c/b150a4d12b919baf956b807aa305cf78df03d0fe

cheers
