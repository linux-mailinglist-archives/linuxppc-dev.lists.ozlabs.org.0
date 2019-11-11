Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FA2F6DA9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Nov 2019 05:50:00 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47BJMV02f0zF407
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Nov 2019 15:49:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47BJKZ2683zF3Jj
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Nov 2019 15:48:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="bfNGKxOx"; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1003)
 id 47BJKZ0HnRz9sQw; Mon, 11 Nov 2019 15:48:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1573447698; bh=yWa/bTKeJR+SWjF4oDpRITo/DdE/biB73QYlEC6JpL0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bfNGKxOxX0YieQvmzH4cVLji1M8lzU7qkhZ0QbMeNg162OTCpojGm9v/MU5Rppcwj
 oNXh0rfODIwOiQv7bV/eQbdx0KFsfcXoedK8ikpBWsiGOvcVAZuE6o6bIuzzWBD5Zq
 lSSEs5IMFILXoZgeBGc01eOa/k4wOm6bib7wv/E9Ijz7NT2XieIpQqBuUJyQFVFV6k
 jmd4g/YGW+ahwM8QcSUo6pjy/SZCZU6vY/xr3efVJyfq5TJ1G2TeUASi6UDpCqUZUX
 6Kl86phXK/vd2XYcuTIakguIHH+NhbB6NsRSgTU4ecD0mmvm45ES0+JH4Pg6irxU+u
 hNJpMzmePAKow==
Date: Mon, 11 Nov 2019 15:25:35 +1100
From: Paul Mackerras <paulus@ozlabs.org>
To: Bharata B Rao <bharata@linux.ibm.com>
Subject: Re: [PATCH v10 5/8] KVM: PPC: Handle memory plug/unplug to secure VM
Message-ID: <20191111042535.GB4017@oak.ozlabs.ibm.com>
References: <20191104041800.24527-1-bharata@linux.ibm.com>
 <20191104041800.24527-6-bharata@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191104041800.24527-6-bharata@linux.ibm.com>
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
Cc: Sukadev Bhattiprolu <sukadev@linux.ibm.com>, linuxram@us.ibm.com,
 cclaudio@linux.ibm.com, kvm-ppc@vger.kernel.org, linux-mm@kvack.org,
 jglisse@redhat.com, aneesh.kumar@linux.vnet.ibm.com, paulus@au1.ibm.com,
 sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, hch@lst.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 04, 2019 at 09:47:57AM +0530, Bharata B Rao wrote:
> Register the new memslot with UV during plug and unregister
> the memslot during unplug. In addition, release all the
> device pages during unplug.
> 
> Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
> Signed-off-by: Sukadev Bhattiprolu <sukadev@linux.ibm.com>
> 	[Added skip_page_out arg to kvmppc_uvmem_drop_pages()]

Reviewed-by: Paul Mackerras <paulus@ozlabs.org>
