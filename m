Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A32318A74
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Feb 2021 13:27:11 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dbwqb6XdtzDwfc
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Feb 2021 23:27:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DbwjK0mmwzDwfr
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Feb 2021 23:21:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=bSBscKI3; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4DbwjH3RRlz9sRf
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Feb 2021 23:21:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1613046099;
 bh=LTNoyLPk2qerOo00Ab0TbScyBZpoPoL5nVFjcNHnttY=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=bSBscKI3+Rn+8RHiLpoNcDsPvpU2xiv5yI6fqFxliXgP/C5NZ4d300hOWSxezscI2
 dRfFGcCQWEYLVUK5PlMuM7N0YjTls/0PVtVW+TNucJACRcQMTJhpqf4bbeMdWyKRcH
 qcTl0poO70/NzQn6jgNbGZBRps1rxmAFtGesbMl7O0IqKk04cc4yG4GDBxgR4svsYv
 IdC2fXBdOaEOY/oE67B6RHP7aF+g9XcFyAcRijkeygcBvEzru6k0VPfCawqqLMkGMG
 5IQ6XTEMt2sC+Ued01xexVcMHPDdE5wm/7HX0tJhAkhpglaCgWkdkWnjHMYhuPRxMZ
 4mv+aSJN/nCPA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 1/3] powerpc/perf: Adds support for programming of
 Thresholding in P10
In-Reply-To: <20210211112728.3410517-1-mpe@ellerman.id.au>
References: <20210211112728.3410517-1-mpe@ellerman.id.au>
Date: Thu, 11 Feb 2021 23:21:37 +1100
Message-ID: <87k0reokvi.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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

Michael Ellerman <mpe@ellerman.id.au> writes:
> From: Kajol Jain <kjain@linux.ibm.com>
>
> Thresholding, a performance monitoring unit feature, can be
> used to identify marked instructions which take more than
> expected cycles between start event and end event.
> Threshold compare (thresh_cmp) bits are programmed in MMCRA
> register. In Power9, thresh_cmp bits were part of the
> event code. But in case of P10, thresh_cmp are not part of
> event code due to inclusion of MMCR3 bits.

Accidental resend, ignore.

cheers
