Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DA714D4E5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jan 2020 01:59:34 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 487MSg3GkbzDqTb
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jan 2020 11:59:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 487MQq0B8vzDqTY
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jan 2020 11:57:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=N5jpmvP4; dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1003)
 id 487MQp4Grqz9sPJ; Thu, 30 Jan 2020 11:57:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1580345874; bh=cLi5tM1BMtilA/vHH/CQVN7hgfSskkEy3hdkrh98I+0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=N5jpmvP4TULhdTK2lFayAFzhtWvqu4skpK08K2tsQKFOMh+jEMzO/b7Uf/r8uja8M
 vHwTQJK9iPKJePC20g3ebKU60udAJPvTvcEnoHGaUa//JPDLHGBeYkZkBKMOAIHrZJ
 KCyDLjo8DMO9rouCFZbCHcT3EZt2m1bUKYCdKgU9fvTI5IqjRAd4NgPttnuc/9otHH
 WWISoIOU2qYR/FAwKX/016tghqYA9mZPorzxJ8uvU3DXkHCLZwtIFBt1Fta4SbQvVe
 yBZIQQg6Fd1cnA3sSbrElB1lpVURfNyL1iugAa3ePTs1glhnFXojSArmpqzJQhWIqi
 7bNKwXuynRiqQ==
Date: Thu, 30 Jan 2020 11:55:20 +1100
From: Paul Mackerras <paulus@ozlabs.org>
To: Bharata B Rao <bharata@linux.ibm.com>
Subject: Re: [PATCH FIX] KVM: PPC: Book3S HV: Release lock on page-out
 failure path
Message-ID: <20200130005520.GB25802@blackberry>
References: <20200122045542.3527-1-bharata@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200122045542.3527-1-bharata@linux.ibm.com>
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
Cc: paulus@au1.ibm.com, linuxppc-dev@lists.ozlabs.org, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 22, 2020 at 10:25:42AM +0530, Bharata B Rao wrote:
> When migrate_vma_setup() fails in kvmppc_svm_page_out(),
> release kvm->arch.uvmem_lock before returning.
> 
> Fixes: ca9f4942670 ("KVM: PPC: Book3S HV: Support for running secure guests")
> Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>

Thanks, applied to my kvm-ppc-next branch.

Paul.
