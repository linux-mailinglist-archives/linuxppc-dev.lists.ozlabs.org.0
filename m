Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF091CCD30
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 May 2020 21:12:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Ktwy1RSzzDqZ9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 May 2020 05:12:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=web.de
 (client-ip=212.227.17.11; helo=mout.web.de;
 envelope-from=markus.elfring@web.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=web.de header.i=@web.de header.a=rsa-sha256
 header.s=dbaedf251592 header.b=BMP38rNq; 
 dkim-atps=neutral
Received: from mout.web.de (mout.web.de [212.227.17.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Ktnq4ZHwzDqd9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 May 2020 05:06:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1589137549;
 bh=tqvi0j/eImySII8EjLQm5CPK9QVSaiTw72qE5aojvNE=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=BMP38rNqUeyZpt7t8vlVZXrfDt3p057x+vaIv2LV/xT0hl6IjXVnrF7s8QJOufjdU
 7qp8tAKPktSI93mGEMoCtZXy6Qpuhnp9YNG3NGnSS/awGVZGj1HpJrY4tMDSbQ+sGM
 iQc/ocpU7jOIN0IMEPxwK0ZJrMAdR9ZurzcU5KyU=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.244.31.72]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MNfU1-1jjbnS0ptz-00PHXD; Sun, 10
 May 2020 21:05:49 +0200
Subject: Re: [PATCH v2 9/9] hvc_console: Allow backends to set I/O buffer size
To: Geoff Levand <geoff@infradead.org>, Michael Ellerman
 <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
References: <cover.1589049250.git.geoff@infradead.org>
 <6f6294df663a53f47bb28abcbb1ef756c6a59922.1589049250.git.geoff@infradead.org>
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <79f2d66a-542d-698c-1e88-40c25bae69d8@web.de>
Date: Sun, 10 May 2020 21:05:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <6f6294df663a53f47bb28abcbb1ef756c6a59922.1589049250.git.geoff@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:rtAP/iS+5dwouJV/wwfK+ADvytsmaVOl/jEo4hdOfC/1PkxILt6
 P8OOsX3vdqQDedEtAHu18l2BL6/ZjXl+kyURvTjz4Gmtxf07884Jch7DWON9Z2Lr/KhVysJ
 8y+50I2U1RqQ8B8jgpTLAMqyh5/ma+KqOm765Ns+Qww02oZ8xoTFsloatdBiVGcHGebDuU8
 BiKLM1+uCWRj/rrPy8b4A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:jsi8O4OF6gY=:H+AE1/66vpCKfYiokHzWip
 7D0J7epJEfOdtJG2ojgD1bwgcr7zD1+x5e8BXaYZ2psxzoYRCYexyyubobjHNZvD+5BrbQhHg
 Hh19ZlCRvK4ArWkBPFyGrhGvRGEh1nTbBvjBqAzuA4vc44G3m9dS93XFiJna1QkgwZV5bYsIo
 bxTrnPWeGhB11dtwFfzbrLXsl3EDkUqwU13lvDIDRbZ4RaHiO2z3D/yiL6ThPXMwrUHSqqaGw
 gO/w/SQ43N9h77OnU/FKtQ3Qopm/oxuAO/GZNJ2xRo+IDdEPhkOjONEmcaiDh4ebJ0lg6nmtA
 sI7Es3s231dHnsZNzd7pJp+r6uz3bYils83JkNC1Z+fZU7j2zEYtw4+vPf4k0Qsq2KmCZdbbk
 KyxHORUdQI+HhZ+kaoJMuEvocarlzvTiQk7B4suaUYF8SKfSMS0+WWivxtbIawBqQ8nnR77Kq
 EdSvASChSZvZspoF6VqVPeV2NQC2NWnCYSOENjUqEoXRemBwAO/RfdTczrxUv/NMUrdAHzFr6
 mCAn2P3ZQ9w+u4j9nh2AMkbOKbwAtxj8yQgFp4oqsQMRLcgfbSpTqb88a4KauNUqwAhKG8K4t
 E32tlkBFAjc9ffu7n3XvwiG6WwGCpWeA1C/VIHPK3gNEZEmfQb9uXERBjmuaF5vl/qBcqvPaL
 03Xa9pD72dFbW4W8vzSNeAVqLvVzyUc8QiETRVj63iUDCWU5ReoTh9/gLOp4lBagXVAJiQB6n
 +1C6QwcJKCysFHHFIkCjOFsjSUjz6Z+i/AwxTHKfHbQZZO419LXLNGtM59HMS/uBEUoZR3Bh0
 mdRvNmreSyy98wNFqNPTYiTuwwUK6gGaUF+U1ZvMNHt7qwiEz+FBhIaZdOxzTCXxUrG1fN3Df
 eCt5GdkpH4uatqyy+OnxENOWueIfc4s809wChoGKVg97UJgR2IgX3d4b8bwzCllDg//M9g0fM
 AlZrOqV3d7t0jO4DFDs+NWy7JwUVv+v3kk8OD+tAGhhuJlYpkRwtlVbpqIgK3rw+egmEohjjW
 /LmOUyWJF+ijiWCSjMsuc/cTswJWsp3TF4wk7aOUysRPQNgk6v/048/lN+IqHYsY2QQRf49Ay
 ZodECZ/K+Y0eocj50cZw+rt3L2q9mywBB4T8Pga2LpaUJ7NZHgKekApA3ebW0/Ici0fR3ip0f
 E2R/epCMcmqn+DKfdPO6ydwBfP9gHgVGR3M+wPodlfIBJ05eIjhBJEuVbK+RMuW5FeZYRzI7F
 lgSsnyS3lx9THhc28
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

> Typical usage in the backend source file would be:

Is there any information missing in this change description accidentally?

Regards,
Markus
