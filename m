Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA7C30D1BA
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 03:44:45 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVmHG4lCWzDwrM
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 13:44:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1231::1; helo=merlin.infradead.org;
 envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=merlin.20170209 header.b=bxDYixQi; 
 dkim-atps=neutral
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVXt83NVrzDqf7
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Feb 2021 05:10:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
 Reply-To:Cc:Content-ID:Content-Description;
 bh=7DYkva/bTpl9W1P3QcVm3lnW/O6szR6PkUt261/VRgI=; b=bxDYixQiBL37HFgc53gq0M0d6V
 qw1vKdclZ4Qe8hgOtjLJj+tXeK7XAmzXEFi5V3chX8pWGT8oWuRij6t65UD+L3Enp2Uxo80LFbRmj
 tHRrPlvPgBpb38sSGYi55GJ4+Cs9C6bsbD4Bx5kSiuvT/PMF+WsPTcyv1hn3y9leGPi6sL6PVNKkQ
 RShAdgFoGdE5tdjNm8FGmMHUXmWKdSQnIIm9DRXRV4pxvX3UTclNObFs5Gdg92MNiE3B78DueFueB
 L7qhSj9hQMHVoexplLmrPz2a0cZDcPbA9uaWlovmZ503mR0TThneQNgJqJXOgxB3YhZRfbvBaDL0d
 5NBHHb+g==;
Received: from [2601:1c0:6280:3f0::2a53]
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l708D-0003Mi-Ge; Tue, 02 Feb 2021 18:10:29 +0000
Subject: Re: [PATCH] arch: powerpc: kernel: Fix the spelling mismach to
 mismatch in head.44x.S
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org, akpm@linux-foundation.org,
 rppt@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20210202093746.5198-1-unixbhaskar@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <e50d1c19-9d38-b15e-6b58-905315af7d4c@infradead.org>
Date: Tue, 2 Feb 2021 10:10:24 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210202093746.5198-1-unixbhaskar@gmail.com>
Content-Type: text/plain; charset=utf-8
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2/2/21 1:37 AM, Bhaskar Chowdhury wrote:
> 
> s/mismach/mismatch/
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
> ---
>  arch/powerpc/kernel/head_44x.S | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Acked-by: Randy Dunlap <rdunlap@infradead.org>

thanks.

-- 
~Randy

