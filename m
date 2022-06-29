Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5593755FF9E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 14:17:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LY0pZ2VFpz3f96
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 22:17:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LY0n51lFWz3dp2
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jun 2022 22:16:25 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LY0n43QKLz4xZY;
	Wed, 29 Jun 2022 22:16:24 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: arnd@arndb.de, fbarrat@linux.ibm.com, Jiang Jian <jiangjian@cdjrlc.com>, ajd@linux.ibm.com
In-Reply-To: <20220621125321.122280-1-jiangjian@cdjrlc.com>
References: <20220621125321.122280-1-jiangjian@cdjrlc.com>
Subject: Re: [PATCH] cxl: drop unexpected word "the" in the comments
Message-Id: <165650492410.3004956.4938254521446368740.b4-ty@ellerman.id.au>
Date: Wed, 29 Jun 2022 22:15:24 +1000
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
Cc: gregkh@linuxfoundation.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 21 Jun 2022 20:53:21 +0800, Jiang Jian wrote:
> there is an unexpected word "the" in the comments that need to be dropped
> 
> file: drivers/misc/cxl/cxl.h
> line: 1107
> +/* check if the given pci_dev is on the the cxl vphb bus */
> changed to
> +/* check if the given pci_dev is on the cxl vphb bus */
> 
> [...]

Applied to powerpc/next.

[1/1] cxl: drop unexpected word "the" in the comments
      https://git.kernel.org/powerpc/c/882c835b71e22ca82361dab3b60b85b557abd72f

cheers
