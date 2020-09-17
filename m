Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5036E26DB46
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 14:14:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BsbW770dDzDqHS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 22:14:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BsZSl0LcrzDqWc
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Sep 2020 21:27:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BsZSk17vKz9sSn; Thu, 17 Sep 2020 21:27:33 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>
In-Reply-To: <20200817055257.110873-1-srikar@linux.vnet.ibm.com>
References: <20200817055257.110873-1-srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH v3] powerpc/numa: Restrict possible nodes based on platform
Message-Id: <160034200751.3339803.10934767719975522585.b4-ty@ellerman.id.au>
Date: Thu, 17 Sep 2020 21:27:32 +1000 (AEST)
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Tyrel Datwyler <tyreld@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Bharata B Rao <bharata@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 17 Aug 2020 11:22:57 +0530, Srikar Dronamraju wrote:
> As per draft LoPAPR (Revision 2.9_pre7), section B.5.3 "Run Time Abstaction
> Services (RTAS) Node at
> https://openpowerfoundation.org/wp-content/uploads/2020/07/LoPAR-20200611.pdf,
> there are 2 device tree property ibm,max-associativity-domains (which
> defines the maximum number of domains that the firmware i.e PowerVM can
> support) and ibm,current-associativity-domains (which defines the maximum
> number of domains that the platform can support). Value of
> ibm,max-associativity-domains property is always greater than or equal to
> ibm,current-associativity-domains property. If the said property is not
> available, use ibm,max-associativity-domain as fallback. In this yet to be
> released LoPAPR, ibm,current-associativity-domains is mentioned in page 833
> / B.5.3 which is covered under under "Appendix B. System Binding" section
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/numa: Restrict possible nodes based on platform
      https://git.kernel.org/powerpc/c/67df77845c181166d4bc324cbb0382f7e81c7631

cheers
