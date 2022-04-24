Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2515850D1A4
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Apr 2022 14:16:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KmRw10jg7z3c9r
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Apr 2022 22:16:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KmRvC6j8pz2yQK
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Apr 2022 22:16:07 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KmRv76MwSz4ySS;
 Sun, 24 Apr 2022 22:16:03 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20220419114828.89843-1-atrajeev@linux.vnet.ibm.com>
References: <20220419114828.89843-1-atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH V3 1/2] powerpc/perf: Fix the power9 event alternatives
 array to have correct sort order
Message-Id: <165080252225.1540533.7252624381403538783.b4-ty@ellerman.id.au>
Date: Sun, 24 Apr 2022 22:15:22 +1000
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
Cc: kjain@linux.ibm.com, maddy@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 19 Apr 2022 17:18:27 +0530, Athira Rajeev wrote:
> When scheduling a group of events, there are constraint checks
> done to make sure all events can go in a group. Example, one of
> the criteria is that events in a group cannot use same PMC.
> But platform specific PMU supports alternative event for some
> of the event codes. During perf_event_open, if any event
> group doesn't match constraint check criteria, further lookup
> is done to find alternative event.
> 
> [...]

Applied to powerpc/fixes.

[1/2] powerpc/perf: Fix the power9 event alternatives array to have correct sort order
      https://git.kernel.org/powerpc/c/0dcad700bb2776e3886fe0a645a4bf13b1e747cd
[2/2] powerpc/perf: Fix the power10 event alternatives array to have correct sort order
      https://git.kernel.org/powerpc/c/c6cc9a852f123301d5271f1484df8e961b2b64f1

cheers
