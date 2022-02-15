Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E034B62E6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 06:35:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JyVDH26dDz3fGy
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 16:35:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JyV6G6Jsgz3cVt
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Feb 2022 16:30:14 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JyV6H0F2Lz4y4l;
 Tue, 15 Feb 2022 16:30:15 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Mamatha Inamdar <mamatha4@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org
In-Reply-To: <20200924051343.16052.9571.stgit@localhost.localdomain>
References: <20200924051343.16052.9571.stgit@localhost.localdomain>
Subject: Re: [PATCH] rpadlpar_io:Add MODULE_DESCRIPTION entries to kernel
 modules
Message-Id: <164490279831.270256.12994910096465371651.b4-ty@ellerman.id.au>
Date: Tue, 15 Feb 2022 16:26:38 +1100
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
Cc: bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org,
 linux-pci@vger.kernel.org, tyreld@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 24 Sep 2020 10:44:16 +0530, Mamatha Inamdar wrote:
> This patch adds a brief MODULE_DESCRIPTION to rpadlpar_io kernel modules
> (descriptions taken from Kconfig file)
> 
> 

Applied to powerpc/next.

[1/1] rpadlpar_io:Add MODULE_DESCRIPTION entries to kernel modules
      https://git.kernel.org/powerpc/c/be7be1c6c6f8bd348f0d83abe7a8f0e21bdaeac8

cheers
