Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F48175B073
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jul 2023 15:53:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R6DfM0XTmz3c3C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jul 2023 23:52:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R6DdN1Wssz30g8
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jul 2023 23:52:08 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4R6DdM3wCxz4wbP;
	Thu, 20 Jul 2023 23:52:07 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Haren Myneni <haren@linux.ibm.com>
In-Reply-To: <20230716100506.7833-1-haren@linux.ibm.com>
References: <20230716100506.7833-1-haren@linux.ibm.com>
Subject: Re: [PATCH v2] powerpc/pseries/vas: Hold mmap_mutex after mmap lock during window close
Message-Id: <168986105077.1117384.12123220905323185330.b4-ty@ellerman.id.au>
Date: Thu, 20 Jul 2023 23:50:50 +1000
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
Cc: nathanl@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, 16 Jul 2023 03:05:06 -0700, Haren Myneni wrote:
> Commit 8ef7b9e1765a ("powerpc/pseries/vas: Close windows with DLPAR
> core removal") unmaps the window paste address and issues HCALL to
> close window in the hypervisor for migration or DLPAR core removal
> events. So holds mmap_mutex and then mmap lock before unmap the
> paste address. But if the user space issue mmap paste address at
> the same time with the migration event, coproc_mmap() is called
> after holding the mmap lock which can trigger deadlock when trying
> to acquire mmap_mutex in coproc_mmap().
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/pseries/vas: Hold mmap_mutex after mmap lock during window close
      https://git.kernel.org/powerpc/c/b59c9dc4d9d47b3c4572d826603fde507055b656

cheers
