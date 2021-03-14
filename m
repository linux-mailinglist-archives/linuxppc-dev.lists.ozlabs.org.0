Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BDB33A40A
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Mar 2021 11:04:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DywBv1jkbz3fCm
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Mar 2021 21:04:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dyw7D0KJzz3cXy
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Mar 2021 21:01:28 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4Dyw7C5Lwqz9sWK; Sun, 14 Mar 2021 21:01:27 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
In-Reply-To: <20210304020411.16796-1-naveen.n.rao@linux.vnet.ibm.com>
References: <20210304020411.16796-1-naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH] powerpc: Fix instruction encoding for lis in
 ppc_function_entry()
Message-Id: <161571587241.138988.10981827210845962279.b4-ty@ellerman.id.au>
Date: Sun, 14 Mar 2021 21:01:27 +1100 (AEDT)
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
Cc: Jiri Olsa <jolsa@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 4 Mar 2021 07:34:11 +0530, Naveen N. Rao wrote:
> 'lis r2,N' is 'addis r2,0,N' and the instruction encoding in the macro
> LIS_R2 is incorrect (it currently maps to 'addis 0,r2,N'). Fix the same.

Applied to powerpc/fixes.

[1/1] powerpc/64s: Fix instruction encoding for lis in ppc_function_entry()
      https://git.kernel.org/powerpc/c/cea15316ceee2d4a51dfdecd79e08a438135416c

cheers
