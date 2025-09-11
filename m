Return-Path: <linuxppc-dev+bounces-12047-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 024D2B53F2A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Sep 2025 01:41:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNDc36s8zz2yrl;
	Fri, 12 Sep 2025 09:41:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757634115;
	cv=none; b=MiWHoZvzof5567eKQze6CL65EvkzVt1xbVW5oGNbBi7YAkUvc66Qn+FEr1SnbOCqMhUfNv4SIEVx4hYWFZl2zFNJbnAg5vNsKuFsWyiy5d+WpcVwANB+xe/Vr0yIXdcPFCc6ouvfh7mEtCP53HuG6W98J1wgfj5Th141VNlx6b/nngS5GGXD664JlSY/7rN9t8C/r+L3HNd5dOjmaGKX/0ApZArMOJecM0a15Z/Lo+VdBLV+s2guXwzPAL2yrHGoaZ8svkFLwowQGrO+nQ7EBhHlzcY1JawqOs4IvzN1aETIP2MRah+VWlQgGl1BID/nvLMfo800evA293cy008nqA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757634115; c=relaxed/relaxed;
	bh=d8NDTd59bC20IjX7bAN5+nGY8em1eeFrvR1Q+oAJiVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g7josGqYCeEvFkD9qUOS//GBcNyrLyLsmfYY2An0tNE5XH9clx+T95DMJwfOaqIMQwJXPWN1Dap2fDW03oDwyFyeieLiZ7bi0+hRntYrxPIkPlYJDrgwLiUW0vdlLOgpgshBe5pdyq8MefqDeZkHSLUtXNJB95AX2igGaaBIatFroG5/GFRRu03foas65daoEoX+syCKtbBjkK7E08LtZUjIUWKZtudtzQGQOtYsSOZY8uRypSvZBjHy30H+xh1c91GZrXH9tDi8zw2kCOB6jmKIMmu7Rd+8VOVo+teDksF2xKod974EFPNCckerXmCIifki1TIyD4qRVj40HAmp+w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iV9GvsvY; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=kbusch@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iV9GvsvY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=kbusch@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cNDc32NMWz2yGM
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Sep 2025 09:41:55 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E6A6E40351;
	Thu, 11 Sep 2025 23:41:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17220C4CEF0;
	Thu, 11 Sep 2025 23:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757634112;
	bh=DQD93jM5hLlaAKaCjIrnWOXXTTrKJoX2wFhzmsThdaM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iV9GvsvYOgiktqrfpfVkGvm1Vxt267Fr6jnDO3liYSIjN187mdA56yiqXB8xYP9JN
	 CSJ4SXd00YvZ3TbH2Aij7xG6xFlaefX2TUHO8GQ3N3fs3J+sdhvm0+FTdGW/nE/uP2
	 7RGA/TIEuu6ehQh1EL8t9agDEyvSvQvOf8bZKL701zR6c9Lb7/aO+p1+DhiJOVKIt8
	 tmr8MuIACNe0dCjnMIm29YShTZ9VXjEp3bnvKzqWfvywtfMGmOJQUc5B/S7KYK2ykw
	 eNoeXYPwanry9hHff6nR+a/kXrvbQ34vdOFt3c3QjHcpf595+nyLzrBZ8GdyLI21g6
	 b5imPfFMNtivg==
Date: Thu, 11 Sep 2025 19:41:48 -0400
From: Keith Busch <kbusch@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Vernon Yang <vernon2gm@gmail.com>, mahesh@linux.ibm.com,
	bhelgaas@google.com, oohall@gmail.com,
	linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, Vernon Yang <yanglincheng@kylinos.cn>,
	Terry Bowman <terry.bowman@amd.com>,
	Robert Richter <rrichter@amd.com>, linux-cxl@vger.kernel.org,
	Smita Koralahalli <Smita.KoralahalliChannabasappa@amd.com>,
	Dongdong Liu <liudongdong3@huawei.com>
Subject: Re: [PATCH] PCI/AER: Fix NULL pointer access by aer_info
Message-ID: <aMNePLmIkz3LE6EP@kbusch-mbp>
References: <20250904182527.67371-1-vernon2gm@gmail.com>
 <20250911225457.GA1596803@bhelgaas>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911225457.GA1596803@bhelgaas>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Sep 11, 2025 at 05:54:57PM -0500, Bjorn Helgaas wrote:
> [+cc Terry, Robert, CXL list, Smita, Dongdong]
> 
> On Fri, Sep 05, 2025 at 02:25:27AM +0800, Vernon Yang wrote:
> > From: Vernon Yang <yanglincheng@kylinos.cn>
> > 
> > The kzalloc(GFP_KERNEL) may return NULL, so all accesses to
> > aer_info->xxx will result in kernel panic. Fix it.
> > 
> > Signed-off-by: Vernon Yang <yanglincheng@kylinos.cn>
> 
> Applied to pci/aer for v6.18, thanks, Vernon!
> 
> Not directly related to this patch, but I'm concerned about some users
> of dev->aer_cap.

pci_aer_init is called pretty early during boot. If we can't malloc a
few hundred bytes at that point, the aer_cap users will be the least of
your concerns. :)

