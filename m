Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9CC22C8D1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 17:12:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCt3l1pQWzF1KC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jul 2020 01:12:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCqgj6mQDzDrdN
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jul 2020 23:25:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 4BCqgg6kMvz9sV9; Fri, 24 Jul 2020 23:25:03 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BCqgf3dNZz9sTh; Fri, 24 Jul 2020 23:24:56 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
In-Reply-To: <20200722055315.962391-1-mpe@ellerman.id.au>
References: <20200722055315.962391-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] selftests/powerpc: Add test of memcmp at end of page
Message-Id: <159559697453.1657499.15006362199310101046.b4-ty@ellerman.id.au>
Date: Fri, 24 Jul 2020 23:24:56 +1000 (AEST)
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

On Wed, 22 Jul 2020 15:53:15 +1000, Michael Ellerman wrote:
> Update our memcmp selftest, to test the case where we're comparing up
> to the end of a page and the subsequent page is not mapped. We have to
> make sure we don't read off the end of the page and cause a fault.
> 
> We had a bug there in the past, fixed in commit
> d9470757398a ("powerpc/64: Fix memcmp reading past the end of src/dest").

Applied to powerpc/next.

[1/1] selftests/powerpc: Add test of memcmp at end of page
      https://git.kernel.org/powerpc/c/8ac9b9d61f0eceba6ce571e7527798465ae9a7c5

cheers
