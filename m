Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FAE668705A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Feb 2023 22:08:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P6ZJw5rTVz3f4t
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Feb 2023 08:08:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=wdc.com header.i=@wdc.com header.a=rsa-sha256 header.s=dkim.wdc.com header.b=dySxpDQ3;
	dkim=pass (2048-bit key; unprotected) header.d=opensource.wdc.com header.i=@opensource.wdc.com header.a=rsa-sha256 header.s=dkim header.b=V8ZS818B;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=opensource.wdc.com (client-ip=68.232.141.245; helo=esa1.hgst.iphmx.com; envelope-from=prvs=389e0ffe8=damien.lemoal@opensource.wdc.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wdc.com header.i=@wdc.com header.a=rsa-sha256 header.s=dkim.wdc.com header.b=dySxpDQ3;
	dkim=pass (2048-bit key; unprotected) header.d=opensource.wdc.com header.i=@opensource.wdc.com header.a=rsa-sha256 header.s=dkim header.b=V8ZS818B;
	dkim-atps=neutral
X-Greylist: delayed 63 seconds by postgrey-1.36 at boromir; Thu, 02 Feb 2023 08:07:39 AEDT
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P6ZHv31fmz30F7
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Feb 2023 08:07:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1675285659; x=1706821659;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=iRKnL0h2vDqLOR7wwetQc+wVcIvEQsrF0Mp7+5R7hA4=;
  b=dySxpDQ3Rtbkh9i2SX1DMMKJtFhnJJuj/HvvL1z+iVnynag6uWtIuLOg
   fnu8/nH4vo6VcP3FPBYVPZoP0k2ZWsSoUydCNQ2lxshkMB3HpxMtt0Fpw
   HayFPYnFSLUh7W+I+ZESruuWzCtuDy5K2khtkc20RZKit3l1IULnau1NS
   lOQ1kkywe9BmZB443TDqy/x82LaI0ywv0h7Y8iOtDt7I4/qZixdjswTEc
   o7XuIj16LjGD74M3YVE/UaAX3m31WHfN881KL6XBuYYh9o2iv67LxFMWu
   q6OxoO7rmVHGfiSP6hQeG7dLkm1kalpJ/XJ64XalrKtFrk1O9cLxN39ns
   A==;
X-IronPort-AV: E=Sophos;i="5.97,265,1669046400"; 
   d="scan'208";a="334269083"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 02 Feb 2023 05:06:29 +0800
IronPort-SDR: 9Spy/sWxB9BK54sy7SUqVm+PdtIt7zC3S4aVCb/uUibQLnfMqP3eGjGXHJY2178UuVcIv1qmkD
 Bb0PB2y4C7tu+bMwUpo+9rygW5s3mnt/e2UqSsylFQP74o+DDaE5iIQsZsDWXqq53JmVtyaUWV
 rlKfhlv+mdjXDuNMQ9GA2Hrzjzq1xEaU+YjBSAulJ9Zmzivlp6AEzGXjOPAnLpSjEq89Q7Xzec
 1421Qto7Fx+Wnj/fZsHJABcTCHj5/BgcBciaUjYJvvWONo2MJlxRynJSxgNTIhFprF/ZIsHtyf
 2FM=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 01 Feb 2023 12:23:52 -0800
IronPort-SDR: PBohHU/NYIru7rzh048F5eNbPE1dzW8B3teO4WIdfFX2jyUBxA7Cg07mWauOXV27NgjNcV94lt
 oh1sV5q9XORkCMeACl4T6yMQwG7s8NwYv9hz0KRVQgtPtI1w6n4wfO0ENGdqczuTOyGNwmbd2k
 XvN8phXMjrgXO7Sf6K1GVvthoFyYsbiNJ/FHJjWuPmDUV/dBFg6pYi+5oP5aAUUMlQUTyaALg4
 OsyCNaTKXpIz7CGC4WkPlBtoc1fjzt39C+TP3+zg3bxxfbsk4e/fTptknc+e8V+YldPqZDtudG
 nks=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 01 Feb 2023 13:06:29 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4P6ZGY2HBgz1RwtC
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Feb 2023 13:06:29 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:content-type
	:in-reply-to:organization:from:references:to:content-language
	:subject:user-agent:mime-version:date:message-id; s=dkim; t=
	1675285588; x=1677877589; bh=iRKnL0h2vDqLOR7wwetQc+wVcIvEQsrF0Mp
	7+5R7hA4=; b=V8ZS818BsRUL1nCwybqdEYTe8Wx0WBi6qOXAxFoZKbXfCBwwWFf
	VOosxalLJs4cfWKySVQbx1ZrLB5YonTFBaoj/OLDVfT8cUBJ8bD5tiSE5hzQ46RF
	TEakRsy3ipmA2B41lBPZ393WOLeL83l8wWtcOnR/4nSLayBR+cXU60TKUAZZkqU3
	m9id8XIALxEB+iWm2k7m3TXJnm913IifTzv30TSMO2LexFx2Yy+QwW5uL0PLMTEh
	vHlfWflhhZbCIVwDj00GWrUNQ6CJKTuSmUOhYwjGnWlId5TVTF+fr24Bl74RV9QG
	GmSDm/bX8s7qZ+Mjsw8eY/3NXzRSKvHjbdA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
	by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id icfu52oxIOro for <linuxppc-dev@lists.ozlabs.org>;
	Wed,  1 Feb 2023 13:06:28 -0800 (PST)
Received: from [10.225.163.79] (unknown [10.225.163.79])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4P6ZGV4bwJz1RvLy;
	Wed,  1 Feb 2023 13:06:26 -0800 (PST)
Message-ID: <7cf17a27-13dc-e6b4-c34c-47454239af30@opensource.wdc.com>
Date: Thu, 2 Feb 2023 06:06:25 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3] powerpc: macio: Make remove callback of macio driver
 void returned
Content-Language: en-US
To: Dawei Li <set_pte_at@outlook.com>, mpe@ellerman.id.au
References: <TYCP286MB232391520CB471E7C8D6EA84CAD19@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <TYCP286MB232391520CB471E7C8D6EA84CAD19@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
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
Cc: alsa-devel@alsa-project.org, linux-scsi@vger.kernel.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org, npiggin@gmail.com, linux-serial@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2/1/23 23:36, Dawei Li wrote:
> Commit fc7a6209d571 ("bus: Make remove callback return void") forces
> bus_type::remove be void-returned, it doesn't make much sense for any
> bus based driver implementing remove callbalk to return non-void to
> its caller.
> 
> This change is for macio bus based drivers.
> 
> Signed-off-by: Dawei Li <set_pte_at@outlook.com>
> ---
> v2 -> v3
> - Rebased on latest powerpc/next.
> - cc' to relevant subsysem lists.
> 
> v1 -> v2
> - Revert unneeded changes.
> - Rebased on latest powerpc/next.
> 
> v1
> - https://lore.kernel.org/all/TYCP286MB2323FCDC7ECD87F8D97CB74BCA189@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM/
> ---
>  arch/powerpc/include/asm/macio.h                | 2 +-
>  drivers/ata/pata_macio.c                        | 4 +---
>  drivers/macintosh/rack-meter.c                  | 4 +---
>  drivers/net/ethernet/apple/bmac.c               | 4 +---
>  drivers/net/ethernet/apple/mace.c               | 4 +---
>  drivers/net/wireless/intersil/orinoco/airport.c | 4 +---
>  drivers/scsi/mac53c94.c                         | 5 +----
>  drivers/scsi/mesh.c                             | 5 +----
>  drivers/tty/serial/pmac_zilog.c                 | 7 ++-----
>  sound/aoa/soundbus/i2sbus/core.c                | 4 +---
>  10 files changed, 11 insertions(+), 32 deletions(-)

For the ata bits:

Acked-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

-- 
Damien Le Moal
Western Digital Research

