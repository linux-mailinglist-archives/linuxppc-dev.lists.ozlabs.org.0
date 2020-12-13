Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1EA2D903D
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Dec 2020 20:41:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CvFHp24THzDqSn
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Dec 2020 06:40:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=90.155.50.34; helo=casper.infradead.org;
 envelope-from=geoff@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CvFFt1BBtzDqRN
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Dec 2020 06:39:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=gtkC2cwUyIZHi2THFuqJZjqPt1krJsPvyreKUidD7mw=; b=Ch83eRaVuMImRjym8HnQzBa5XQ
 dVYR4G4EuxcCPragNt7sSP0FkCy7XSei5yKmrQE90qh1M5Pi1XjPnaNKEchmnAQSmJwEpLWjcPcvB
 rdzVOHEihCHC95LRzGBF990z4UEUUoEDT8lgtYMEDsJlDJZEHvijvg/8k5I+Y3/Li6+F0301OPNuw
 /ABD5ONp0bVNbr+H+cMEaNCL09swp3D03xKk4HK04ES08EkdskHaf+C1jHXdEgUrDF0dz4rlxBp5q
 Mhv3zCy6EbT2AQyLC6sQLOIq9c6EAFOVHv0Yk6SEVVQyq2D6h+QFB5dFCo72UNduxHsvwg6l9ZJut
 z9lGfXJA==;
Received: from [2602:306:c5a2:a380:9e7b:efff:fe40:2b26]
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1koXCT-0005tq-MO; Sun, 13 Dec 2020 19:38:33 +0000
Subject: Re: [PATCH] powerpc/ps3: use dma_mapping_error()
To: =?UTF-8?Q?Vincent_Stehl=c3=a9?= <vincent.stehle@laposte.net>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20201213182622.23047-1-vincent.stehle@laposte.net>
From: Geoff Levand <geoff@infradead.org>
Message-ID: <a1aa680e-5eca-6c09-0e57-da7f09d99f9f@infradead.org>
Date: Sun, 13 Dec 2020 11:38:31 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201213182622.23047-1-vincent.stehle@laposte.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12/13/20 10:26 AM, Vincent Stehlé wrote:
> The DMA address returned by dma_map_single() should be checked with
> dma_mapping_error(). Fix the ps3stor_setup() function accordingly.
> 
> Fixes: 80071802cb9c ("[POWERPC] PS3: Storage Driver Core")
> Signed-off-by: Vincent Stehlé <vincent.stehle@laposte.net>
> Cc: Geoff Levand <geoff@infradead.org>
> Cc: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
> ---
>  drivers/ps3/ps3stor_lib.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Looks good.  Thanks for submitting.

Acked by: Geoff Levand <geoff@infradead.org>
