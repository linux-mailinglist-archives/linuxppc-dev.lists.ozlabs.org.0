Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC7514C669
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2020 07:18:01 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 486tZZ46nFzDqV8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2020 17:17:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 486sF12rbgzDqNF
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2020 16:17:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 486sF01mqkz9sS3; Wed, 29 Jan 2020 16:17:40 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: f1dbc1c5c70d0d4c60b5d467ba941fba167c12f6
In-Reply-To: <5577aef8-1d5a-ca95-ff0a-9c7b5977e5bf@linux.ibm.com>
To: Michael Bringmann <mwb@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Gustavo Walbon <gwalbon@linux.ibm.com>,
 Paul Mackerras <paulus@samba.org>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v2] Fix display of Maximum Memory
Message-Id: <486sF01mqkz9sS3@ozlabs.org>
Date: Wed, 29 Jan 2020 16:17:40 +1100 (AEDT)
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

On Wed, 2020-01-15 at 14:53:59 UTC, Michael Bringmann wrote:
> Correct overflow problem in calculation+display of Maximum Memory
> value to syscfg where 32bits is insufficient.
> 
> Signed-off-by: Michael Bringmann <mwb@linux.ibm.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/f1dbc1c5c70d0d4c60b5d467ba941fba167c12f6

cheers
