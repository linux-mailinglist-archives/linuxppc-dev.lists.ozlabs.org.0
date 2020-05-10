Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D85B1CCCDC
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 May 2020 20:17:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Ksk53QjFzDqrN
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 May 2020 04:17:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=web.de
 (client-ip=212.227.17.12; helo=mout.web.de;
 envelope-from=markus.elfring@web.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=web.de header.i=@web.de header.a=rsa-sha256
 header.s=dbaedf251592 header.b=N29lYsHC; 
 dkim-atps=neutral
Received: from mout.web.de (mout.web.de [212.227.17.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Ksgv4P3BzDqXQ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 May 2020 04:15:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1589134527;
 bh=xGvVf/N0h1jQRbPABcEi0bGcT1qiTx3MmPU2KtAavIY=;
 h=X-UI-Sender-Class:From:Subject:To:Cc:References:Date:In-Reply-To;
 b=N29lYsHCVpAtV8JzXtp8W8jSzf+1uhCPWiA5l9U4ztPnaXs0mNjZ2+gaHmpPY8MqM
 99TZ8UpiFpG5SIT0WEwhGi5Mj61rxarzA6esb6PE4PUzWmq4e0e0es3ztJZgtuYqRr
 mp9HW83rUTC1hh3QTFYINgKlhArkdHdUZ8C0bbZE=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.244.31.72]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LfzxX-1ikH2K1dLH-00peNo; Sun, 10
 May 2020 20:15:27 +0200
From: Markus Elfring <Markus.Elfring@web.de>
Subject: Re: [PATCH v2 4/9] drivers/ps3: Remove duplicate error messages
To: Geoff Levand <geoff@infradead.org>, Michael Ellerman
 <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
References: <cover.1589049250.git.geoff@infradead.org>
 <c763425d8e6f680d3180b3246c9e77727df179d0.1589049250.git.geoff@infradead.org>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <f980b755-a7ba-9a37-ac24-e74485727aa0@web.de>
Date: Sun, 10 May 2020 20:15:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <c763425d8e6f680d3180b3246c9e77727df179d0.1589049250.git.geoff@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
X-Provags-ID: V03:K1:N+d9o5kN9eH7OJQgTWcUkcg8KlMTnV0KmLhxNqkWLjpND1VRObn
 jDQQ5ATgKmOLbJJG+eaGG2A0liPwhGiPp5PCEQGtzRELc4YJpVzuUvixvUhVhbfAbSBBHmZ
 ZfuQO9FjYZozrrtIyTswAuVg1xxdV9ojn4mMhXl87gbl9+aug5V9KnsQOYoyC+DyKybUvFK
 esoBJJIib2S3FPaOOyViw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:0ekAi6It3Xk=:mdy3ppF/JYaTBihSewP+L7
 e8WloiKc0X9TKXNfsJ7fqSGp7wnPIVtT0cY7Ua97PoM3o5jv24bni4qVWPjX2lbwrSH1ajAV2
 fAaSRNVSCjlE4hauHAPqGVJdeA0bK8/T4d0IBrlNceIuseUd5+7rG9jiiD1GbbOx4IptNMwTm
 JjqM0PnJ3KXWQcIGa+DJzfXVK8k+JeBc2oZrGFtvoSMJC4hNId0WQBum6MlSXdfPh3gmChmhF
 pXunTxruj20YgEvUKahz6Qo7BGDD3SGVMvCe/eDme7mu3hJEQGu7ppwqc/VIJW9kxLwSCj99d
 B6rlbS8Ssn/lsPlifeTDe8AXwiRTog0NzLPYOzgwUQ1P4mypjm6l6+zjbpHdiqLJyORVlehyJ
 9cw54M9/ul/zt+ZxWGyTDaTi3OMUZ7HtM27fgCM3vrxA8nFUD6Ido7pHAgaMgGcWUW1LkISlv
 /2usxSxNEN9dKKdyQutHgTtZYbnULEt7UY2CIOwDSsPhQAicsY/GVqS6M5DTPFMo0CIOXxUKs
 UZRlwrHx4aNbnRvQumO6QUsnXZ9nOOZdYLdxePQvoYgUVzeJYZm2yrwWWaWjFWxpYx9vnluSk
 Il6gSunXo6ZVKi7xs9tvKz1/7laUV7KG2dMLAZs6UQuM2p4vtU1KXiz5pluPUXsg8zzZ0moon
 Apdw+MO6fw+f6M+4LnDLFfodVAfdHAiaeST483sV/xoeJp5ENokvtSRcLPctlQLIRBsEyTIyM
 ZYbVOSL2COaWMXGT/NCheB5G1Rt7rcHtH20FYUWN5wNvW4SV389cgtqU63o6ymzw235jOJzOQ
 7WFHb2rmQA6ZLdF+IV0KhDGu2Xm8zXLjdc2seUKB1LDrTSbTHgtwErs5hoczrV7SKa6X6JWOS
 d3rtWxbnlvViBWUIexukApGMj96nguZceVqDAU6CXmgZTK8F9Evop3xnAO/Gh8Rlp/zv1FIQs
 D7O333R0hX04LxBlGLUEwh/rxoD4eOIV3P/5jNyPVTrgSCK3TaBR4CJkmq3z9yIIBJpyFbB6g
 /ZKZBpC68jXIlLNB5xZqXeagveiZKpbB6k3mVugUxzyXMPH30EuqgAMY55+zXV5w7ugHxivbn
 AHhvLn34i+MnwRWFhhBgt7lFwGJVk2nvMESiZjvyVN2hUaKmwlfSB/skT5+/N8dOJZiTyOkIb
 xRKMhNBeLG8h0EYh34SPtZFh4HtUPQF2BmQqVpLzcicE5LmWSL0laqRwFLSj4aW9MPvGo7jJF
 0l8BmGZo9bhuwPZnH
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
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Emmanuel Nicolet <emmanuel.nicolet@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> Remove duplicate memory allocation failure error messages.

Will another background information be relevant for the final commit message?

ps3: Delete an error message for a failed memory allocation in two functions
https://lore.kernel.org/linuxppc-dev/58807b28-b2b9-7e77-11b8-21db43c9d5ba@users.sourceforge.net/
https://lore.kernel.org/patchwork/patch/864037/
https://lkml.org/lkml/2017/12/16/107

Regards,
Markus
