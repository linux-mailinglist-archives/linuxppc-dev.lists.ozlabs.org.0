Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.auug.org.au [IPv6:2401:3900:2:1::4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A958FBF2E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 06:14:38 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47D8mW36vWzDqPF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 16:14:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=timur@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="oP2extHT"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47D8dY0cpKzF6lr
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 16:08:32 +1100 (AEDT)
Received: from [192.168.1.20] (cpe-24-28-70-126.austin.res.rr.com
 [24.28.70.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C49F1205C9;
 Thu, 14 Nov 2019 05:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573708110;
 bh=bwDoBs1Gl7X6kr+VvLWmGBoPwoIr2qMGBpkJq35K1x0=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=oP2extHTQUlymGuKHYc5HIla8CRurumrsbn+oG0uNtHazxGpSd3Oak/5IYj6pOQdX
 KGU6zsBBp82kB2G9cquR+DjnYRoOSwG54tzqCaNhuzcg9lbIOID2FB1PfnKDHSKsP2
 1wcjKT4GVc9de18GzwVY2KFn6AM6YhbBiGc6Z8tM=
Subject: Re: [PATCH v4 04/47] soc: fsl: qe: introduce qe_io{read,write}*
 wrappers
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
References: <20191108130123.6839-1-linux@rasmusvillemoes.dk>
 <20191108130123.6839-5-linux@rasmusvillemoes.dk>
 <CAOZdJXU35+G5CMrS3247mgMjQH7__MxP8wpW6yjn1_MLD-sGqw@mail.gmail.com>
 <e37d24c5-6d4f-c8bf-1c38-f3e8b8e85eeb@rasmusvillemoes.dk>
From: Timur Tabi <timur@kernel.org>
Message-ID: <38d87cf8-5945-61d7-80a7-c8374cbe729b@kernel.org>
Date: Wed, 13 Nov 2019 23:08:28 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <e37d24c5-6d4f-c8bf-1c38-f3e8b8e85eeb@rasmusvillemoes.dk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: lkml <linux-kernel@vger.kernel.org>, Li Yang <leoyang.li@nxp.com>,
 Scott Wood <oss@buserror.net>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/12/19 1:14 AM, Rasmus Villemoes wrote:
> but that's because readl and writel by definition work on little-endian
> registers. I.e., on a BE platform, the readl and writel implementation
> must themselves contain a swab, so the above would end up doing two
> swabs on a BE platform.

Do you know whether the compiler optimizes-out the double swab?

> (On PPC, there's a separate definition of mmio_read32be, namely
> writel_be, which in turn does a out_be32, so on PPC that doesn't
> actually end up doing two swabs).
> 
> So ioread32be etc. have well-defined semantics: access a big-endian
> register and return the result in native endianness.

It seems weird that there aren't any cross-arch lightweight 
endian-specific I/O accessors.
