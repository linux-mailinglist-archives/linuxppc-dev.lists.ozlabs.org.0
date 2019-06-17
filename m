Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F8B478FB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2019 06:08:20 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45RyPF1JZ9zDqZp
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2019 14:08:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45RyMK16l5zDqX0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jun 2019 14:06:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="Z0EfrHRu"; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1003)
 id 45RyMJ6YWDz9sDX; Mon, 17 Jun 2019 14:06:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1560744396; bh=0cKzGdt6WGsAZB+3r9paweiXCWroPIbVCKopag+ojKg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Z0EfrHRuzCrzprrirgHeOsXdN2MtYJKGs6jXEhmiug8dsUK12ukgYg32hkFCb32M/
 SEWnO0nlsdQrwLeL95aLHsYI9wNrhfo+dt7avrzQ3v6WFTsS3n8LqE1+R1ZoH1wVOB
 XhRxaQpvwDQ+wOyiTLrg4oBAuxXIPQbr1gLS9PdXzmBOK3h0TTrb8o7c4DwqDiEDij
 BtF6DgIrxDxJ3ODFdTsYKOQVtKq7em0JyemWTaH0hwIzAMfahUUjv2X1YXLbU8b0Hk
 exxEagml3AklSQK/5L6IAQtiDBLPPDNXXL2MENQvKE2dFxXAr28p+NlONIhtySetgU
 yElL5UmUA4eOQ==
Date: Mon, 17 Jun 2019 14:06:32 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: Bharata B Rao <bharata@linux.ibm.com>
Subject: Re: [RFC PATCH v4 6/6] kvmppc: Support reset of secure guest
Message-ID: <20190617040632.jiq73ogxqyccvfjl@oak.ozlabs.ibm.com>
References: <20190528064933.23119-1-bharata@linux.ibm.com>
 <20190528064933.23119-7-bharata@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190528064933.23119-7-bharata@linux.ibm.com>
User-Agent: NeoMutt/20170113 (1.7.2)
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
Cc: linuxram@us.ibm.com, cclaudio@linux.ibm.com, kvm-ppc@vger.kernel.org,
 linux-mm@kvack.org, jglisse@redhat.com, aneesh.kumar@linux.vnet.ibm.com,
 paulus@au1.ibm.com, sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 28, 2019 at 12:19:33PM +0530, Bharata B Rao wrote:
> Add support for reset of secure guest via a new ioctl KVM_PPC_SVM_OFF.
> This ioctl will be issued by QEMU during reset and in this ioctl,
> we ask UV to terminate the guest via UV_SVM_TERMINATE ucall,
> reinitialize guest's partitioned scoped page tables and release all
> HMM pages of the secure guest.
> 
> After these steps, guest is ready to issue UV_ESM call once again
> to switch to secure mode.

Since you are adding a new KVM ioctl, you need to add a description of
it to Documentation/virtual/kvm/api.txt.

Paul.
