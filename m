Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF7822C3B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2019 08:42:35 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 456q886hydzDqDp
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2019 16:42:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 456q6t6jmxzDqCM
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 May 2019 16:41:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="bBJ0iHd3"; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 456q6t61hZz9s6w; Mon, 20 May 2019 16:41:26 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1003)
 id 456q6t54mdz9s9N; Mon, 20 May 2019 16:41:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1558334486; bh=QEuNNwxQBX41d0QJRz4odHqyh4NW3Ru3samHQRyhn0k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bBJ0iHd3/nTI8DR4svY+hZf7RDgH3Tzy0Ww33EomKBSwWbs4XjXP1f6ijK3PrKUPH
 pZfcEuJkvw0BDQEmco8CYR2SHhWVAdpbYl7G+XCDyYJxplq5sBeHOmOXEnRlY/qS+e
 SmmDqNZ68THRzsoreo4nWUXUC+MwNCrtHlxI2/VilcjTMQt/Hwcg9xi7Hbk9m7UiEi
 Zjs+OSmtWoElgbaDDrqEw+M0H5YncGBs0AkOTTMAJnkIxKsf+6s8xvxy8PMOZnA1lA
 yGuONvY4nBSHaA3222J7h9dvetMvZhJw/obXydl9ofW80MYWIsaaFrYh0Q58HCRCkS
 CDopIqWSk3yww==
Date: Mon, 20 May 2019 16:40:23 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: Claudio Carvalho <cclaudio@linux.ibm.com>
Subject: Re: [RFC PATCH v2 09/10] KVM: PPC: Book3S HV: Fixed for running
 secure guests
Message-ID: <20190520064023.GD21382@blackberry>
References: <20190518142524.28528-1-cclaudio@linux.ibm.com>
 <20190518142524.28528-10-cclaudio@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190518142524.28528-10-cclaudio@linux.ibm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Michael Anderson <andmike@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>,
 kvm-ppc@vger.kernel.org, Bharata B Rao <bharata@linux.ibm.com>,
 linuxppc-dev@ozlabs.org, Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Anshuman Khandual <khandual@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, May 18, 2019 at 11:25:23AM -0300, Claudio Carvalho wrote:
> From: Paul Mackerras <paulus@ozlabs.org>
> 
> - Pass SRR1 in r11 for UV_RETURN because SRR0 and SRR1 get set by
>   the sc 2 instruction. (Note r3 - r10 potentially have hcall return
>   values in them.)
> 
> - Fix kvmppc_msr_interrupt to preserve the MSR_S bit.
> 
> Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
> Signed-off-by: Claudio Carvalho <cclaudio@linux.ibm.com>

This should be folded into the previous patch.

Paul.
