Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E7934F7FA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 06:28:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9CxL3Rwlz3c3f
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 15:28:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=AvLMSU/r;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=paulus@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=AvLMSU/r; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9Cwy3Qf6z3brM
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Mar 2021 15:28:18 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1003)
 id 4F9Cwm4tspz9sVq; Wed, 31 Mar 2021 15:28:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1617164888; bh=bzfJZ1XyYCAEGWSrsQejGXPgeiIBH5brzLLsqIGTufs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AvLMSU/r2oBAxwxUYw0kAKKUDxWWCfzjC3RhWsdiWQ0m032RsPafOGVLCMxenX8dp
 DL85cSL9qKxl7nI4LupUV0bUnzKXkcqNO3mzCkLoM5GpumE0l7EalBO7Tn6+aV8lYO
 N/+amoE7gloncPDDKFEXTjd8hOx5REFN90hkXn9vAgpdj0VUWerWFtg8fCB0GynExB
 MvIzlC15zls7ntnlhu4G++9kGue8iovZHCMuQIUlKpxMp1aDU+uPdqAqvOnOOQIETg
 EHh8I9NpgLsE9U7jlbzSLy5CZs8wHN1buQgG51rJuiPZuvxqH3HkFGWUO4ON11d4zm
 o+uq3Xi/xPijg==
Date: Wed, 31 Mar 2021 15:28:01 +1100
From: Paul Mackerras <paulus@ozlabs.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 03/46] KVM: PPC: Book3S HV: Disallow LPCR[AIL] to be
 set to 1 or 2
Message-ID: <YGP6Ucf8d7c4wZbo@thinks.paulus.ozlabs.org>
References: <20210323010305.1045293-1-npiggin@gmail.com>
 <20210323010305.1045293-4-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210323010305.1045293-4-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, kvm-ppc@vger.kernel.org,
 Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 23, 2021 at 11:02:22AM +1000, Nicholas Piggin wrote:
> These are already disallowed by H_SET_MODE from the guest, also disallow
> these by updating LPCR directly.
> 
> AIL modes can affect the host interrupt behaviour while the guest LPCR
> value is set, so filter it here too.
> 
> Suggested-by: Fabiano Rosas <farosas@linux.ibm.com>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Acked-by: Paul Mackerras <paulus@ozlabs.org>
