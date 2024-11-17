Return-Path: <linuxppc-dev+bounces-3358-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C658B9D0369
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Nov 2024 13:04:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XrqDl3Cr3z2xs0;
	Sun, 17 Nov 2024 23:04:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731845063;
	cv=none; b=O+EwX8g0rc/E+XXpFZy0gYxUcuFGy3zQff4wnQQ1sC70g8xpRQmZiGUNLJjFtz+QrogHv1bEMNEBIXDlSiAN+Vzil1sdmNRP+WE04ludNcM2TGmLz/wJZ1uXR1W7H4YriS/VyM5SrA4jh3X0w2klHWrCds3aqEFgtswNsGfy3YTiDNqYt+uBPw5GNBTDx+Z79EWiE4xWF/WTDpTzA1Qzn7V8tNSs1h5zaZAYx07dkMBTylKy5QFav99csPtBIwuoNwEdxgZ5NYx+g4HdtiMB6wzen7Qzg+RdflZv52px1scNlHiMXmU/QkXYfQLwTu1HyCVfLLGyeRlRIOPGb9wcRA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731845063; c=relaxed/relaxed;
	bh=Vv5ir4yvI/MF1TuTKBmAOQKGEI1JLEw6+WgPv1tVKaw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FwwMaqpxHjc7r0UdjwfP2YX168K7Rcx4oeNdpQd9iGN5iYrMJW6yVkpZ/7jMNWKfmYpRRYFH9IRKLw/ny2lyJ9XIS2qDdbDOBxCsTqkXxrfN5Q23kat1ngtlmJJFrg4libHAXbU13eTPO+lAuh6HWn0gSPguPLgANj46tvOWWpPt2SePkHXjxw7kFMsbrwONm2usFx/DSJlLiOultfWNvVVlvsX39ZjsUeBvkuB2c3/l7LaNkpZSNlCsNx4pCI5IaplCcREjj8boDwm48QXrLYZ20z9TCvfM4YUkoYfxbKYSroEqEQgBkuxmVj1fXEpTnqo7qUjqDMCAt1zQvwXc7Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=FSQ08UwL; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=FSQ08UwL;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XrqDl0CCLz2yVG
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Nov 2024 23:04:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1731845060;
	bh=Vv5ir4yvI/MF1TuTKBmAOQKGEI1JLEw6+WgPv1tVKaw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=FSQ08UwL41cfEU4lUj98R3ftb54XfNDRt+KHUyjKQ1RdxwmG74gPBgtQyRCj9dJcn
	 MQ2QSPNsFkR/9b0kgjwZu6nwItoTAfSVhEPQrWpW57ofOkHozTwLE87WC/hycdDK+s
	 R6kUcrfvC4flg9zZIJjNd23Rsh/NBPo3hXGsA9J95AHzR7vQzFKo/4sYMJTNgAs0E6
	 PnSXYiVs4V8UqIfTSLlY1DNvWta2Ln9mpAZoCJKPwBEgOBU7W+4OaDom+MdNHwA6By
	 okYMKP/8uvSh2v4MraHdmAljC/KiVPWpn3R4mAoYmaibIEf6ZH7RUDTPUYVLPUqaMz
	 VVIqMrDz5/iUQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XrqDg6sz9z4xdQ;
	Sun, 17 Nov 2024 23:04:19 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, maddy@linux.ibm.com, Kajol Jain <kjain@linux.ibm.com>
Cc: atrajeev@linux.ibm.com, disgoel@linux.ibm.com, hbathini@linux.ibm.com, adubey@linux.ibm.com, gautam@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Ritesh Harjani <ritesh.list@gmail.com>, Amit Machhiwal <amachhiw@linux.ibm.com>
In-Reply-To: <20241114085020.1147912-1-kjain@linux.ibm.com>
References: <20241114085020.1147912-1-kjain@linux.ibm.com>
Subject: Re: [PATCH v2] powerpc/kvm: Fix typo in the kvm functions
Message-Id: <173184457527.887714.28164544908148060.b4-ty@ellerman.id.au>
Date: Sun, 17 Nov 2024 22:56:15 +1100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, 14 Nov 2024 14:20:20 +0530, Kajol Jain wrote:
> Fix typo in the following kvm function names from:
> 
> kmvhv_counters_tracepoint_regfunc -> kvmhv_counters_tracepoint_regfunc
> kmvhv_counters_tracepoint_unregfunc -> kvmhv_counters_tracepoint_unregfunc
> 
> 

Applied to powerpc/topic/ppc-kvm.

[1/1] powerpc/kvm: Fix typo in the kvm functions
      https://git.kernel.org/powerpc/c/590d2f9347f7974d7954400e5d937672fd844a8b

cheers

