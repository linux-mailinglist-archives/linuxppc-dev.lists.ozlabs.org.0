Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E18C2F7952
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 13:35:15 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DHLHH6HLczDsfJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 23:35:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DHL2J2PjGzDsb9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jan 2021 23:23:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4DHL2G5rhcz9sVF; Fri, 15 Jan 2021 23:23:50 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Ariel Marcovitch <arielmarcovitch@gmail.com>, mpe@ellerman.id.au
In-Reply-To: <20210102201156.10805-1-ariel.marcovitch@gmail.com>
References: <20210102201156.10805-1-ariel.marcovitch@gmail.com>
Subject: Re: [PATCH v2] powerpc: fix alignment bug whithin the init sections
Message-Id: <161071339918.2210050.14386564633032070545.b4-ty@ellerman.id.au>
Date: Fri, 15 Jan 2021 23:23:50 +1100 (AEDT)
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
Cc: keescook@chromium.org, maskray@google.com, linux-kernel@vger.kernel.org,
 npiggin@gmail.com, oss@buserror.net, paulus@samba.org,
 ariel.marcovitch@gmail.com, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 2 Jan 2021 22:11:56 +0200, Ariel Marcovitch wrote:
> This is a bug that causes early crashes in builds with a
> .exit.text section smaller than a page and a .init.text section that
> ends in the beginning of a physical page (this is kinda random, which
> might explain why this wasn't really encountered before).
> 
> The init sections are ordered like this:
> 	.init.text
> 	.exit.text
> 	.init.data
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc: Fix alignment bug within the init sections
      https://git.kernel.org/powerpc/c/2225a8dda263edc35a0e8b858fe2945cf6240fde

cheers
