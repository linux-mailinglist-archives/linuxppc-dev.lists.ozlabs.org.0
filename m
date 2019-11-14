Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0C3FC426
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 11:28:44 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47DHkx2WshzF6Lh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 21:28:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47DFyQ2ZsPzF5jm
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 20:08:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 47DFyP6TQRz9sRm; Thu, 14 Nov 2019 20:08:29 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 57409d4fb12c185b2c0689e0496878c8f6bb5b58
In-Reply-To: <1573449697-5448-2-git-send-email-tyreld@linux.ibm.com>
To: Tyrel Datwyler <tyreld@linux.ibm.com>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v2 1/9] powerpc/pseries: Fix bad drc_index_start value
 parsing of drc-info entry
Message-Id: <47DFyP6TQRz9sRm@ozlabs.org>
Date: Thu, 14 Nov 2019 20:08:29 +1100 (AEDT)
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
Cc: nathanl@linux.ibm.com, Tyrel Datwyler <tyreld@linux.ibm.com>,
 linux-pci@vger.kernel.org, tlfalcon@linux.ibm.com, bhelgaas@google.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2019-11-11 at 05:21:28 UTC, Tyrel Datwyler wrote:
> The ibm,drc-info property is an array property that contains drc-info
> entries such that each entry is made up of 2 string encoded elements
> followed by 5 int encoded elements. The of_read_drc_info_cell()
> helper contains comments that correctly name the expected elements
> and their encoding. However, the usage of of_prop_next_string() and
> of_prop_next_u32() introduced a subtle skippage of the first u32.
> This is a result of of_prop_next_string() returning a pointer to the
> next property value which is not a string, but actually a (__be32 *).
> As, a result the following call to of_prop_next_u32() passes over the
> current int encoded value and actually stores the next one wrongly.
> 
> Simply endian swap the current value in place after reading the first
> two string values. The remaining int encoded values can then be read
> correctly using of_prop_next_u32().
> 
> Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>

Series applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/57409d4fb12c185b2c0689e0496878c8f6bb5b58

cheers
