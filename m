Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 790534ED9C2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Mar 2022 14:40:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KTjZG1q2tz307n
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Mar 2022 23:40:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=lchCe3cP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KTjYf1jkwz2xTd
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Mar 2022 23:39:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=lchCe3cP; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KTjYd4NYVz4xXx;
 Thu, 31 Mar 2022 23:39:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1648730390;
 bh=mtQYRav07C0gt+IZBOPdCcIdZ3AXyNuFaeKrCabS2Gw=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=lchCe3cPsJx5ZRe3ABIJSBcRS0xkKQe86HweMJDbtrEy4QskxSwqxeGC1NCTqGRUZ
 BiHsG+wZvPHWTemDblhKRuvhaoHkHPbifCWHjISXT78VGEble//8OxHvznzaw5CI+A
 DU1My+bjmb4xvu/jgzKcIU86vU/8KMwoDOYWD3aL6ILnoqdseLRIWzVuDhzHKTDjlD
 JrxWq0eDZLbdnrQAL95aCz0YTjO2pwxTZDswHQXztZJPuqVl6rGyp+HnaIrwQ1Vroo
 ONpTbW4Ybn8dn7RPsjdVoDyQuAqfoqSvrzVLYZHscHNseCW7R/dyzTxYh4XfxshjxO
 GnpYGSGh1k9cA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/pseries/vas: use default_groups in kobj_type
In-Reply-To: <20220329142552.558339-1-gregkh@linuxfoundation.org>
References: <20220329142552.558339-1-gregkh@linuxfoundation.org>
Date: Thu, 31 Mar 2022 23:39:45 +1100
Message-ID: <87h77efg8e.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Haren Myneni <haren@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Greg Kroah-Hartman <gregkh@linuxfoundation.org> writes:
> There are currently 2 ways to create a set of sysfs files for a
> kobj_type, through the default_attrs field, and the default_groups
> field.  Move the pseries vas sysfs code to use default_groups field
> which has been the preferred way since aa30f47cf666 ("kobject: Add
> support for default attribute groups to kobj_type") so that we can soon
> get rid of the obsolete default_attrs field.
>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Haren Myneni <haren@linux.ibm.com>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>
> Note, I would like to take this through my driver-core tree for 5.18-rc2
> as this is the last hold-out of the default_attrs field.  It "snuck" in
> as new code for 5.18-rc1, any objection to me taking it?

No objection, please take it via your tree.

cheers
