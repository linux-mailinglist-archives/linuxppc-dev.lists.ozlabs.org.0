Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F23C3F9A1A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 15:29:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gx0tf11JLz3fZj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 23:29:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ellerman.id.au; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gx0kk41vZz308m
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Aug 2021 23:22:38 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Gx0kj170Wz9tD3;
 Fri, 27 Aug 2021 23:22:37 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Kajol Jain <kjain@linux.ibm.com>,
 mpe@ellerman.id.au
In-Reply-To: <20210813082158.429023-1-kjain@linux.ibm.com>
References: <20210813082158.429023-1-kjain@linux.ibm.com>
Subject: Re: [PATCH] powerpc/perf/hv-gpci: Fix the logic to compute counter
 value from the hcall result buffer.
Message-Id: <163007014242.52768.10027890651317720430.b4-ty@ellerman.id.au>
Date: Fri, 27 Aug 2021 23:15:42 +1000
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
Cc: suka@us.ibm.com, atrajeev@linux.vnet.ibm.com, maddy@linux.ibm.com,
 rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 13 Aug 2021 13:51:58 +0530, Kajol Jain wrote:
> H_GetPerformanceCounterInfo (0xF080) hcall returns the counter data in the
> result buffer. Result buffer has specific format defined in the PAPR
> specification. One of the field is counter offset and width of the counter
> data returned.
> 
> Counter data are returned in a unsigned char array. To
> get the final counter data, these values should be left shifted
> byte at a time. But commit 220a0c609ad17 ("powerpc/perf: Add support
> for the hv gpci (get performance counter info) interface") made the
> shifting bitwise. Because of this, hcall counters values could end up
> in lower side, which messes the counter prev vs now calculation. This
> lead to huge counter value reporting
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/perf/hv-gpci: Fix the logic to compute counter value from the hcall result buffer.
      https://git.kernel.org/powerpc/c/f9addd85fbfacf0d155e83dbee8696d6df5ed0c7

cheers
