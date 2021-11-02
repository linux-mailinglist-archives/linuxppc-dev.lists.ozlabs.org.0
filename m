Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D300442D11
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Nov 2021 12:46:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hk7Qb3Rhmz3fnS
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Nov 2021 22:46:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hk7Fv30QPz2yP7
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Nov 2021 22:38:43 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hk7Fv0N5hz4xdS;
 Tue,  2 Nov 2021 22:38:43 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20211028165716.41300-1-hegdevasant@linux.vnet.ibm.com>
References: <20211028165716.41300-1-hegdevasant@linux.vnet.ibm.com>
Subject: Re: [PATCH v2] powerpc/powernv/prd: Unregister OPAL_MSG_PRD2 notifier
 during module unload
Message-Id: <163584792948.1845480.17297151596830428887.b4-ty@ellerman.id.au>
Date: Tue, 02 Nov 2021 21:12:09 +1100
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
Cc: dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 28 Oct 2021 22:27:16 +0530, Vasant Hegde wrote:
> Commit 587164cd, introduced new opal message type (OPAL_MSG_PRD2) and added
> opal notifier. But I missed to unregister the notifier during module unload
> path. This results in below call trace if you try to unload and load
> opal_prd module.
> 
> Also add new notifier_block for OPAL_MSG_PRD2 message.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/powernv/prd: Unregister OPAL_MSG_PRD2 notifier during module unload
      https://git.kernel.org/powerpc/c/52862ab33c5d97490f3fa345d6529829e6d6637b

cheers
