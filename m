Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 270454E1DF3
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Mar 2022 22:22:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KM9gs0cRFz3bSr
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 08:22:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RH/gyeID;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=jarkko@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=RH/gyeID; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KM9gF6cCgz2xt0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Mar 2022 08:22:01 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BC64B6123C;
 Sun, 20 Mar 2022 21:21:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9552CC340E9;
 Sun, 20 Mar 2022 21:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647811319;
 bh=VCO2HOCuTBN+Xv7u6MBQ5uA0+TGwA+QA643VoWQB4s0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RH/gyeIDR4Y6vBxwoPf+bvJnNWspNNBT6gVUuJ9ByOxDzlcnQ1M4u09mnX13tV9c6
 q2FQMNR7zBKXmEBj4OcDYHkQD9+QXNGC4phBUINAh4Kq2rtvmRzsDQcAehbLm2zTFZ
 S66yZl1SlynQdT7eBHOzO79uVIDut3UFF8vGeXrmAKHLyMZIhWNHKAnCNTR/e7eFeV
 +FuwOc7ufk2jvR348NiSyo2dQrWbV3wGyizX1vilR/Hd6b8ie8XpkyYI/G23x9B6r6
 CcKnrUa1WLRAkGNRJ7MWVgFuTQxUwA6HrZYXC3XPfGlN8aWOtjje1HxTnhfYttgLgR
 IGANPRJRxzQow==
Date: Sun, 20 Mar 2022 23:23:00 +0200
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Stefan Berger <stefanb@linux.ibm.com>
Subject: Re: [PATCH -next] tpm: ibmvtpm: Correct the return value in
 tpm_ibmvtpm_probe()
Message-ID: <YjebNG+q9kuh56iv@kernel.org>
References: <20220318060201.50488-1-xiujianfeng@huawei.com>
 <977ccc4b-3b30-f301-aa1c-ef2aaa32cacd@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <977ccc4b-3b30-f301-aa1c-ef2aaa32cacd@linux.ibm.com>
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
Cc: Xiu Jianfeng <xiujianfeng@huawei.com>, nayna@linux.ibm.com,
 linux-kernel@vger.kernel.org, jgg@ziepe.ca, paulus@samba.org,
 peterhuewe@gmx.de, linuxppc-dev@lists.ozlabs.org,
 linux-integrity@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 18, 2022 at 09:54:46AM -0400, Stefan Berger wrote:
> 
> 
> On 3/18/22 02:02, Xiu Jianfeng wrote:
> > Currently it returns zero when CRQ response timed out, it should return
> > an error code instead.
> > 
> > Fixes: d8d74ea3c002 ("tpm: ibmvtpm: Wait for buffer to be set before proceeding")
> > Signed-off-by: Xiu Jianfeng <xiujianfeng@huawei.com>
> 
> Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>

Thank you, I applied this.

BR, Jarkko
