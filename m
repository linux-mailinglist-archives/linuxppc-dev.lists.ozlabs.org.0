Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C3587654
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Aug 2019 11:37:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 464gBB4lDCzDqnc
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Aug 2019 19:37:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=cogentembedded.com
 (client-ip=2a00:1450:4864:20::143; helo=mail-lf1-x143.google.com;
 envelope-from=sergei.shtylyov@cogentembedded.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=cogentembedded.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=cogentembedded-com.20150623.gappssmtp.com
 header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="VcVeBlNE"; 
 dkim-atps=neutral
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 464g8C5CBgzDqnc
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Aug 2019 19:35:22 +1000 (AEST)
Received: by mail-lf1-x143.google.com with SMTP id c19so69069496lfm.10
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Aug 2019 02:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZhZIKbPy1ojcvmbIo8mwd7oy4V33VIdwk5j1j74WW9w=;
 b=VcVeBlNEjS4wa/wbZ2Jy74bbWsbslezZzRDF5L5UlZPXuFgueVv76Apfbc48KCG7go
 O+JybRtPA55YOzc+rFrImDZn5Uzf4Iypjkw1Q2Jrzsy02VozkkgOmiMWFsyG/90IeJID
 s7g3Gev/hUXSaIrCTrM7IhGUouQ5uAYJrQU3W3SKx3qZhdrx3pME6i2VY+znRnPsMDZ6
 IqCV+5+rqLIKHOuF9OdviK0y/AZ3VputL3vLRILFoF8nj2+pSMBc+S3cQ85tH9TO2N3S
 m8AsLb+p6B1SXzPU1ej0Ppenwk9xbIlPPfP789O8926HVT26h04IVIjFQkPvwouSfOGR
 RQ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZhZIKbPy1ojcvmbIo8mwd7oy4V33VIdwk5j1j74WW9w=;
 b=LrcxGElOCKTzfHgziS3Ng9uK9MA7R4qRdcH9VAFvaeUoXE4SwHZJo0GCPoeW9wBJj7
 HeobAgLYCkl9dC3mugA05QbMa6X8appStK3CjygkE3e+SotC85VNitOUYglXZ8uxEuDq
 d7uH6Thaed3ZM7Mu8CV3VU3cvRtUsuB1ypIrr6pS+TvWM45FuT9JJJa2vy6Q53VbK2nP
 2iyN3uYRWQXJlKx8B/Ae2E0llZoNPkVjpioa2tkWgch747iGj72xUHbNFEyZ66kAb05v
 sxmxZgbBF58V+nKPKoqgc9K25bmqP9NweeOT+k4fM0F+pboUTUK/5bL4FRGVHDX49hx1
 7ifg==
X-Gm-Message-State: APjAAAWrz4RsctPsokScEyPb3j/8IFQt2VxaC6NPmxymQakGp2DkfxTQ
 /+4OYVm8QFJdkj1Ryidlr8+T/Q==
X-Google-Smtp-Source: APXvYqzlq7k/M37b+stHUNm1aCq6nUomyYeuBENCXNdKlF0iST4RYWqRChfyDEB29cAPzX6iW+LIMA==
X-Received: by 2002:ac2:5981:: with SMTP id w1mr12123067lfn.85.1565343316741; 
 Fri, 09 Aug 2019 02:35:16 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:44bf:fcca:cd2a:e5bf:7de5:cd?
 ([2a00:1fa0:44bf:fcca:cd2a:e5bf:7de5:cd])
 by smtp.gmail.com with ESMTPSA id t21sm19110864ljg.60.2019.08.09.02.35.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 09 Aug 2019 02:35:15 -0700 (PDT)
Subject: Re: [PATCH 6/8] arm-nommu: call dma_mmap_from_dev_coherent directly
To: Christoph Hellwig <hch@lst.de>, iommu@lists.linux-foundation.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
References: <20190808160005.10325-1-hch@lst.de>
 <20190808160005.10325-7-hch@lst.de>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <247fabce-5284-8140-c492-fe49e1683ca6@cogentembedded.com>
Date: Fri, 9 Aug 2019 12:35:00 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190808160005.10325-7-hch@lst.de>
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
Cc: linux-xtensa@linux-xtensa.org, Michal Simek <monstr@monstr.eu>,
 Vladimir Murzin <vladimir.murzin@arm.com>, linux-parisc@vger.kernel.org,
 linux-sh@vger.kernel.org, Takashi Iwai <tiwai@suse.de>,
 linuxppc-dev@lists.ozlabs.org, Helge Deller <deller@gmx.de>, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 08.08.2019 19:00, Christoph Hellwig wrote:

> Ther is no need to go through dma_common_mmap for the arm-nommu

    There. :-)

> dma mmap implementation as the only possible memory not handled above
> could be that from the per-device coherent pool.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
[...]

MBR, Sergei
