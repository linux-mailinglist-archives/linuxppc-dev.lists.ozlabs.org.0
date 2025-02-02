Return-Path: <linuxppc-dev+bounces-5771-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5556AA24F3C
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Feb 2025 18:20:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YmGbW2nQ3z2xmZ;
	Mon,  3 Feb 2025 04:20:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738516807;
	cv=none; b=GHjC8s7qOh6MtQTXJcW+Wz44zSCPaq5ei9j2fSkvAyi7dy2UuPdMcy9W3C+UDRzJP5tKhxuJfZublD/fEBHSs9dYGWzKmF+mRCbHIbx4+bz99dJi7f7eQibx8tEog6PYJRkCHAS4K6r2QFe3zdjlqYjXR/ZgPHYTFD+zQTJ1L9pT2Fpb8ZkMpF6yYSF7b+weTPffOgW5TTICudmxZn1lBfdaGRAx7p1ZIXvu+Up9U5Phv6xEBkIqsP1mISVw5XnDAECb8tF136OUygenKFMikhErVCP8Z6Fzm9luyTjgOfjC3cadvkOhhs8DVKDjUQdVPngBJzWRcIwp/ijfbD2Gxw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738516807; c=relaxed/relaxed;
	bh=fwp2kH74jyxdDzcwaG+pJ8I1rTxCZpbxfexkbY0Wnig=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IRWl2O7ad1AjrnfXaAL9vGuW0QEIUVme0TzvY2zj2uX2wgF9gh2uafZ4dkpb9n4eb31gyzSqx/h5BLxyGILAEcblhYIy1bLZ0vr2EDE2avJKS9KCkaaFCJ9oASK8XYqdbxibpExe15MRfMJYlEF2abw5YILiYSvSzMLw+HC33KkQePCpVlMROoaFZQgzuaia/m5mLourshLz58/D0fOXIs6EjgKRiO9GgfLUjkJFihsf9uaa8lTBTRLx1fNpEzhz/9hjj5i7bibK/poG7Dkl+ff+H8hfsMqXoPKB99Vwp/+A10OEfSXZfWXydQL1uN7OtsmnE8eCVbpJTY9jdiTp4Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YmGbV3jZcz2xgX
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Feb 2025 04:20:05 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4YmGH7194Qz9sRk;
	Sun,  2 Feb 2025 18:05:55 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uka1tcopZoPw; Sun,  2 Feb 2025 18:05:55 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4YmGH70JxJz9sPd;
	Sun,  2 Feb 2025 18:05:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id ED5138B764;
	Sun,  2 Feb 2025 18:05:54 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id aVv1pHyVOcUj; Sun,  2 Feb 2025 18:05:54 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A15B58B763;
	Sun,  2 Feb 2025 18:05:54 +0100 (CET)
Message-ID: <d0363575-f074-434a-8221-1483b5203c59@csgroup.eu>
Date: Sun, 2 Feb 2025 18:05:54 +0100
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/powermac: fix a loop in core99_usb_enable
To: Denis Kirjanov <kirjanov@gmail.com>, linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, benh@kernel.crashing.org
References: <20250202124641.2722-1-kirjanov@gmail.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250202124641.2722-1-kirjanov@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 02/02/2025 à 13:46, Denis Kirjanov a écrit :
> Looks like we have a typo in the do-while loop
> while checking the loop condition. Fix it with the boolean OR

Are you sure it is a typo, not a feature ?

At the moment the generated code is:

      6f4:       7f 89 48 38     and     r9,r28,r9
      6f8:       7f aa 50 38     and     r10,r29,r10
      6fc:       7d 29 53 79     or.     r9,r9,r10
      700:       40 82 ff bc     bne     6bc <core99_usb_enable+0x1c0>

With your patch it now is:

      6f8:       7f 89 48 38     and     r9,r28,r9
      6fc:       7f aa 50 38     and     r10,r29,r10
      700:       7d 29 53 78     or      r9,r9,r10
...
      708:       2f 89 00 00     cmpwi   cr7,r9,0
      70c:       40 9e ff b8     bne     cr7,6c4 <core99_usb_enable+0x1c8>

So with your patch the code is doing exactly the same but is less optimal.

0 || 0 ==> 0
0 || !0 ==> 1
!0 || 0 ==> 1
!0 || !0 ==> 1

0 | 0 ==> 0
!0 | 0 ==> !0
0 | !0 ==> !0
!0 | !0 ==> !0

In both case it is only false when the two sides are 0 otherwise it is true.

Usually a logic OR does the same as a boolean OR but is more optimal.

Christophe



> 
> Signed-off-by: Denis Kirjanov <kirjanov@gmail.com>
> ---
>   arch/powerpc/platforms/powermac/feature.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/platforms/powermac/feature.c b/arch/powerpc/platforms/powermac/feature.c
> index d3bcfe590384..9d929fbfc46b 100644
> --- a/arch/powerpc/platforms/powermac/feature.c
> +++ b/arch/powerpc/platforms/powermac/feature.c
> @@ -1174,7 +1174,7 @@ core99_usb_enable(struct device_node *node, long param, long value)
>   				mdelay(1);
>   				status0 = UN_IN(UNI_N_CLOCK_STOP_STATUS0);
>   				status1 = UN_IN(UNI_N_CLOCK_STOP_STATUS1);
> -			} while ((status0 & test0) | (status1 & test1));
> +			} while ((status0 & test0) || (status1 & test1));
>   			LOCK(flags);
>   		}
>   	} else {


