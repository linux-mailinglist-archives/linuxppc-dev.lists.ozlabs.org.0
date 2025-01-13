Return-Path: <linuxppc-dev+bounces-5155-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0F8A0BB20
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2025 16:06:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YWwZz6QRBz30Vq;
	Tue, 14 Jan 2025 02:06:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736780811;
	cv=none; b=kEtoLq3Ym4qC3ys9lLXns5fmMfApSI1K2uC7ggR7q8OlHDqgvTtjSgwTrT6gNcQ8EJ7dbQnD0HE53nXXxMX9JNNLPWK2sNY/h0usu30YLG5V4pDMih1Ry6OW28GB9wLy/SnfjSuOVet7pSg3RSuJ2/4dS5bBHV02hKpIUW3DvBsAt94hCBWd2j5cFMNHdmRZeNNklkNI/ebWC++LEJTMdQRjMG00EszMqxDsgShJEDhg+axI9eZ3eN47K+9FiFvW4NEnk/rJtu1t1GF08rpHGh8Pq1T2foY9sXyVHrj7KnCryjYn8TvLOyFHj7+//hhuMtsmM/6Zroqs3EPiTPlUbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736780811; c=relaxed/relaxed;
	bh=Jfm2pW5TbhssVpM+YXVA8wSDY9fQj+1+peqx/3FZeiA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f645M/PKruzFO4v2llGH7+MdM3M6l1erXNLXQ5fPF8BjaVcXbUsTEaWHkRLBdHoI1jJDdLE1AYLCdFY1J9aeHTOtVhOIC2sOaYnVxMzbBk0S37vyLBs+ldx8/gYuwZOgeh1aziYtlZAyIz11edl6MbcqnEPo+ypp8vHwvomDMvVmrATpSbn+01se76u1wV50NGfW30UMsoc3Bnk6hA8zP/yF+TKWUQ9ZCCWIB+xulo/lFwwQDr9urmyfCLdFncsVzIfSTbnbnRMgiJSTeQe8jxg2PmvbEBH4dsDaZy9Oqv+YCnszK6l6WrV2ijrs8qYB32Bx1rDfWITOqfAtS44MKw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=S2t3IIRL; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=acme@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=S2t3IIRL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=acme@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YWwZy5J52z30TP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2025 02:06:50 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 03D505C5405;
	Mon, 13 Jan 2025 15:06:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 374C4C4CED6;
	Mon, 13 Jan 2025 15:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736780808;
	bh=MnYPtt+wBgAFoKY6MEbLs4lijrZah08thJVWBEyzLe8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S2t3IIRLJbwWNbHsUs7K+ZDy8o+z42cvwFShCiefAXvZ71+VWXM+5rIYSCvW5+yeL
	 mwSMgj27u1KHezLA3CBM9DgAfM8zwCM/8fAc10IqtjkQZ9lSbsG2jWg3sR4r642MUa
	 5yVFTvS0WStCpwDPqrR5Yp0EN3KhAtYALjzPpCOIkrLe0vgzWQePVfPTEZdvrCKRlg
	 s/k98srRNshZ7OIGRLyqIgKeTpoYe726OFOKhYZHJt3m0vjql3Ov+3D7sh+fRPKfVK
	 WTnLYhkQsyNVinbWNFdQT9E2/apjSNipjxwsNFnz2ZeiELr/nla8pvxy5dCf6lfvfc
	 U8N3rG/Uq8WMg==
Date: Mon, 13 Jan 2025 12:06:45 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Veronika Molnarova <vmolnaro@redhat.com>
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, jolsa@kernel.org,
	adrian.hunter@intel.com, irogers@google.com, namhyung@kernel.org,
	mpetlan@redhat.com, linux-perf-users@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com,
	kjain@linux.ibm.com, disgoel@linux.vnet.ibm.com,
	hbathini@linux.ibm.com
Subject: Re: [PATCH V2] tools/perf/tests/base_probe: Fix check for the count
 of existing probes in test_adding_kernel
Message-ID: <Z4UsBYLWa1CJfn3F@x1>
References: <20250110094324.94604-1-atrajeev@linux.vnet.ibm.com>
 <07be4391-4a28-4761-9171-26580aea6312@redhat.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <07be4391-4a28-4761-9171-26580aea6312@redhat.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Jan 13, 2025 at 11:21:24AM +0100, Veronika Molnarova wrote:
> On 1/10/25 10:43, Athira Rajeev wrote:
> > But if there are other probes in the system, the log will
> > contain reference to other existing probe too. Hence change
> > usage of check_all_lines_matched.pl to check_all_patterns_found.pl
> > This will make sure expecting string comes in the result
> > 
> > Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> 
> Acked-by: Veronika Molnarova <vmolnaro@redhat.com>

Thanks, applied to perf-tools-next,

- Arnaldo

