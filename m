Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F94B30D9E5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 13:40:17 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DW1VQ48lmzF3M9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 23:40:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4DW09g6nZfzDwt7
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Feb 2021 22:40:39 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4DW09f5Zvlz9vG1; Wed,  3 Feb 2021 22:40:38 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Andrew Donnellan <ajd@linux.ibm.com>,
 Arnd Bergmann <arnd@arndb.de>, Markus Elfring <Markus.Elfring@web.de>,
 Frederic Barrat <fbarrat@linux.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
In-Reply-To: <5cee2b25-71e0-15aa-fba6-12211b8308aa@web.de>
References: <5cee2b25-71e0-15aa-fba6-12211b8308aa@web.de>
Subject: Re: [PATCH] cxl: Reduce scope for the variable “mm” in cxllib_get_PE_attributes()
Message-Id: <161235200902.1516112.15792189842810233641.b4-ty@ellerman.id.au>
Date: Wed,  3 Feb 2021 22:40:38 +1100 (AEDT)
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
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 10 Dec 2020 15:35:38 +0100, Markus Elfring wrote:
> A local variable was used only within an if branch.
> Thus move the definition for the variable “mm” into the corresponding
> code block.
> 
> This issue was detected by using the Coccinelle software.

Applied to powerpc/next.

[1/1] cxl: Reduce scope for the variable “mm” in cxllib_get_PE_attributes()
      https://git.kernel.org/powerpc/c/245a389c6ded15a7d308dbe988aec8a96e8aa8cf

cheers
