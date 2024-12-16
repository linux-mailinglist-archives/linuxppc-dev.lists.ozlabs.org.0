Return-Path: <linuxppc-dev+bounces-4206-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A1B9F3669
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Dec 2024 17:45:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YBm611MG3z2xvh;
	Tue, 17 Dec 2024 03:45:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734367545;
	cv=none; b=B9a1WXaf+BudgmDk++6J9GC0z1QOEjar3WvIP3I1ghFrQq2T+7/tqh/VNK1hRdgo2Csh5oucAZbGGU652W7XQ6svG1miq2bTR62m3jxjkYt1ZQw/bRdfh3mg4aHQLMTbLCaLlrdvLZ28qbWVyW29YUjeWNzPYy+jjGQRwfpdl1UeIY+zKCzVvi1EK43HJ2mKqyuSYdnlCkvVc308doYJe5ncVI0a0G0bm8VU3n2KNt/bGvR2x3OcO5BtGzBm7TH67GMC2LnY9JdA9aWL8ZRiWZ6wXb4NJjSt5row0r1dgksv3KJDFeImmc9cBErYwwZi2AtiIbTKz8js4TvIcY65VA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734367545; c=relaxed/relaxed;
	bh=SaJhooKp9n/AGtgz7/1ZSLSJ9wph4bka9ZULOmXnUkI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HljaGqpcv65CF7nc+2wib9aFNQ85CPrmIewaUmZrAhhSLgt9duZRb8FAczmWszlY65ytG1oHxqFtVcSm5RUCQ9SJeT4+7pTpHOENYKo6KIpdwH2PjapAkGzfSaDNe52kLAhTMRSvboHdiF88Xs+EEKq/731S6+84xndxJP4jwn5jXTntz7VasIcVSnpXRMPLAZBWCEXLFDrgdyiDQonDz7bA4OVKK8OYwuj4Xa4lY3iMPqHPf7RgoLX7o6IPWA6+4PzBnjemmLFf9J8Daww1sZq+MpH+luCu9Ij29PsiLAcegFT1Xd0RGHoa07AI8f9NQ0GwI5TADgu0STPq2ul/ag==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UcXXv8yl; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=acme@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UcXXv8yl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=acme@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YBm601KG6z2xmk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Dec 2024 03:45:44 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 57C03A40DA8;
	Mon, 16 Dec 2024 16:43:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CEE8C4CED0;
	Mon, 16 Dec 2024 16:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734367540;
	bh=yJ24TxEgPNvMjTAhmRojKXtL59U+RMUTJ20Up5QjyrQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UcXXv8ylnkrd0sV8JeaIYeWzlrladufixxN8T/VHziJHIzqjMAHKeBi2vQesfS3wz
	 PwqXjVG1TTFMqTCdaB0vYkkBg8Qaov6medZ6DZN2/IWOp+auDtvngiiMTDGR7bZTM1
	 RqJUkV/f0YnhcTV6t1b5joBF8AcRPJPe1RNvhapu0Hk843F/WTKj+Wx0IJfKn5USui
	 J7hgfZxP7jtWBTUEsZ6CZmNYcDuhbDsupcCT85d+21BH1rf/Pv3MrqOwMk1KfgLod1
	 vYPCdROT6vN+lGIQz5Xn2+NVYYK+Pdkwc3GmBiyWQoPerSdyHVtyJcrcIAU8vayLAV
	 7llzfc4kFUjvg==
Date: Mon, 16 Dec 2024 13:45:38 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Cc: kajoljain <kjain@linux.ibm.com>, Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>, jolsa@kernel.org,
	adrian.hunter@intel.com, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	maddy@linux.ibm.com, disgoel@linux.vnet.ibm.com,
	hbathini@linux.ibm.com
Subject: Re: [PATCH] tools/perf/arch/powerpc: Add register mask for power11
 PVR in extended regs
Message-ID: <Z2BZMhDFO-aJ_Gjw@x1>
References: <20241206135637.36166-1-atrajeev@linux.vnet.ibm.com>
 <2907ca2f-b973-42fd-ae03-99732dfda7a1@linux.ibm.com>
 <0402AAF0-5498-48C7-BEBA-2C0B7508D9E2@linux.vnet.ibm.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0402AAF0-5498-48C7-BEBA-2C0B7508D9E2@linux.vnet.ibm.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Dec 16, 2024 at 03:32:12PM +0530, Athira Rajeev wrote:
> > On 11 Dec 2024, at 5:32 PM, kajoljain <kjain@linux.ibm.com> wrote:
> > On 12/6/24 19:26, Athira Rajeev wrote:
> >> Perf tools side uses extended mask to display the platform
> >> supported register names (with -I? option) to the user
> >> and also send this mask to the kernel to capture the extended registers
> >> as part of each sample. This mask value is decided based on
> >> the processor version ( from PVR ).

> >> Add PVR value for power11 to enable capturing the extended regs
> >> as part of sample in power11.

> > Patch looks fine to me.

> > Reviewed-by: Kajol Jain <kjain@linux.ibm.com>
 
> Can we please pull in this patch if it looks fine.

Sure,

Thanks, applied to perf-tools-next,

- Arnaldo

