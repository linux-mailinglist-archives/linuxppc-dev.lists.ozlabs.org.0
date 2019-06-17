Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 458AC479BE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2019 07:42:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45S0Tt5ynzzDqBv
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2019 15:42:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45S0Ps61yLzDqQC
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jun 2019 15:38:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="q8UH+np3"; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1003)
 id 45S0Ps4DC5z9s7h; Mon, 17 Jun 2019 15:38:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1560749937; bh=jR54jSADlnieO8pB4/tHH0OwHqfcoZjTjfV+h+EHZcg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q8UH+np3k8PiZHUFh7G7kdpoPLQbqzVVldUzKvRzM9Z/EajwRjN2hZ2E6c59i+z0U
 xw12GhPxmJJ2LtmUd092wbw2V7mKpw/vb947ObuutVzuQX26xmCgKUi9wwW7u8aB5S
 dfwNpEeMUWNE8ERsyrMYTlhTtKuoZhh4NTvpFUKWB6uJqP5BhEaT+gG3Ky4VKhNUS2
 RDIjOe7x8YX3Tig3IxavQsVxhxPHJmU695FHZ6Ui1rwWzb2eBrAAZbz0idza3oGz1Q
 4I+lDT1c5EFyFGr4CnunnCKs+lknH2cmXDt1iWSy2Y22pgeO8fTSTVOmuDbcrGLSpq
 5VwSiRkpYsAyg==
Date: Mon, 17 Jun 2019 15:38:54 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: Bharata B Rao <bharata@linux.ibm.com>
Subject: Re: [PATCH v4 4/6] kvmppc: Handle memory plug/unplug to secure VM
Message-ID: <20190617053854.5niyzcrxeee7vvra@oak.ozlabs.ibm.com>
References: <20190528064933.23119-1-bharata@linux.ibm.com>
 <20190528064933.23119-5-bharata@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190528064933.23119-5-bharata@linux.ibm.com>
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

On Tue, May 28, 2019 at 12:19:31PM +0530, Bharata B Rao wrote:
> Register the new memslot with UV during plug and unregister
> the memslot during unplug.
> 
> Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>

Acked-by: Paul Mackerras <paulus@ozlabs.org>
