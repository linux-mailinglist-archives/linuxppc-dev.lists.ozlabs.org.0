Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFC67D952E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Oct 2023 12:24:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SGzLd35jbz6sBc
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Oct 2023 21:24:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SGz244yHHz3dRK
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Oct 2023 21:10:36 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SGz243S9Vz4xWb;
	Fri, 27 Oct 2023 21:10:36 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Kuan-Wei Chiu <visitorckw@gmail.com>
In-Reply-To: <20231013175714.2142775-1-visitorckw@gmail.com>
References: <20231013175714.2142775-1-visitorckw@gmail.com>
Subject: Re: [PATCH] powerpc/perf: Optimize find_alternatives_list() using binary search
Message-Id: <169840079676.2701453.2337090306249839284.b4-ty@ellerman.id.au>
Date: Fri, 27 Oct 2023 20:59:56 +1100
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
Cc: linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 14 Oct 2023 01:57:14 +0800, Kuan-Wei Chiu wrote:
> This patch improves the performance of event alternative lookup by
> replacing the previous linear search with a more efficient binary
> search. This change reduces the time complexity for the search process
> from O(n) to O(log(n)). A pre-sorted table of event values and their
> corresponding indices has been introduced to expedite the search
> process.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/perf: Optimize find_alternatives_list() using binary search
      https://git.kernel.org/powerpc/c/e08c43e6c3eb5d805b61d981f1e8286ee0dc6d1a

cheers
