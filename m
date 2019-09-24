Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EFADDBC16B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2019 07:31:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46cqXy72VTzDqDW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2019 15:30:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46cqVm0zBqzDqQw
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2019 15:29:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="lsHOd319"; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1003)
 id 46cqVk6xkmz9sPD; Tue, 24 Sep 2019 15:29:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1569302942; bh=cWBrw3Zi/RPCvFYg3Lc2bR5LpJV2EEerbQDk5nDnjws=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lsHOd319ouBslKv0bWFJtvzzImr1S6O0NLCnWmG+GyWfg2pTck+2Y3NuS4E0CVwlP
 kXnqT54F182pmLGxgIx4KytqAGY9jUNTPe5EzqWqmxnSyNHHTM9AsFCIZLbpP9A2Of
 BaoUHhbor8++OsLNA3sKLw8wlXZ/DUSlSPUKsl0BUauUVKt3pXiXEgG4E/sLU64La1
 7gMYQXc2E7YBc8pw86aNwenMwogFvwLRNtjp82e7bc6jd+ViH2ATx6e1JljlZWZbMY
 Rh9TJ1f7sqd+kU3mxQCJzKBjqXHnZDUTJSUMVDTCdEU4uNIvNnbyi07wdFgtVVGxcS
 OUTB74fxWWagQ==
Date: Tue, 24 Sep 2019 15:28:55 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH 1/6] KVM: PPC: Book3S HV: XIVE: initialize private
 pointer when VPs are allocated
Message-ID: <20190924052855.GA7950@oak.ozlabs.ibm.com>
References: <156925341155.974393.11681611197111945710.stgit@bahia.lan>
 <156925341736.974393.18379970954169086891.stgit@bahia.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <156925341736.974393.18379970954169086891.stgit@bahia.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: kvm@vger.kernel.org, Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>,
 kvm-ppc@vger.kernel.org, =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Sep 23, 2019 at 05:43:37PM +0200, Greg Kurz wrote:
> From: Cédric Le Goater <clg@kaod.org>
> 
> Do not assign the device private pointer before making sure the XIVE
> VPs are allocated in OPAL and test pointer validity when releasing
> the device.
> 
> Fixes: 5422e95103cf ("KVM: PPC: Book3S HV: XIVE: Replace the 'destroy' method by a 'release' method")
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> Signed-off-by: Greg Kurz <groug@kaod.org>

What happens in the case where the OPAL allocation fails?  Does the
host crash, or hang, or leak resources?  I presume that users can
trigger the allocation failure just by starting a suitably large
number of guests - is that right?  Is there an easier way?  I'm trying
to work out whether this is urgently needed in 5.4 and the stable
trees or not.

Paul.
