Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D2919F797
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 16:07:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wsnN0zNkzDqd9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 00:07:52 +1000 (AEST)
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
 header.s=dbaedf251592 header.b=a9nQTTv5; 
 dkim-atps=neutral
Received: from mout.web.de (mout.web.de [212.227.17.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wscz5TMrzDrJV
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Apr 2020 00:00:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1586181609;
 bh=0Kcnfxa21mYpuQP9XeAG9Rvuf7115OKkh8c8w4idOGM=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=a9nQTTv5QHX3yOiVOHQ51LFjhtJZ1055h264HIBApJlGpEdni2InNa4iCAIRKnycj
 LIt31mFv5xl566MLno2Yy0Th+4YJagexKRNZqbUYm6GzSh9Ft0HgTzm8OaP4fBh4zm
 a2Nxx+Rwvsn1cB8OBuWZnVeaZVmsxHUC3Z5nZpgY=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.3] ([2.243.176.200]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LhvyA-1iyzhy3lXG-00n5QO; Mon, 06
 Apr 2020 16:00:09 +0200
Subject: Re: [PATCH v5 2/2] powerpc/powernv: Add NULL check after kzalloc in
 opal_add_one_export
To: Qiujun Huang <hqjagain@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200406125242.4973-1-hqjagain@gmail.com>
 <20200406125242.4973-3-hqjagain@gmail.com>
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <ca341087-6407-eac8-6c33-9a434ceb7a98@web.de>
Date: Mon, 6 Apr 2020 16:00:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200406125242.4973-3-hqjagain@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:U/GoD/Jwo9MyiiC0iO37FfqwNUL2pw6qxW/ZkETc1xyjY/5oJgr
 579EOarRDglJ0zCLj1DbF2FQi9RNA+Svd/3lgX+e3Vq7cRhHk8z0UZwtlG3bWGkoW0KyPbw
 fWt8rnbbLjyta76/Dp8Z/7IGVvQPDMTfV3Ki/oVMt1AlMHVTdDc2ukLttxHN7ILX085x5jq
 8bVwtWXuD4wEOX/YHzKHA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:xtIgWn53RFQ=:vd1ZKPDzgea5ooovNpNThO
 pbHBUwq6slhSVHpTni2iON2+r0i3UgQ8aGIt+XLDYadwCaJWwDQSO5YFwpUDkopVM7aPHMAoC
 bxsa8k5MS3eNOgGbTNFWOKOmvrK2sRTq3+5XSKXVPszATMZdaDtEWI79zwBv/Nlia99zO/Uqy
 +Fqx0m4UqAPFwCWgK9whlg+umWKeMO38y4jfXl/2ASsvSIcJL3I7k7oxhISy8GEiQevUsZoxV
 QYDq/ev1QJNwvbYwFThN66fwtSwP99N3Vpq29ZSn+APuhWZv/ukR9VbBt+pCkv5LY9GeRzpTF
 09nqiRrcMUSUSzl/G+yD7PtuarMkjelEsmdEqDdNiasTIuxP4qxCyvVLiIGHKvqOIxrefw7gi
 dj+bnGtL0+xit1L9a8PAolfGLmHiA9P7ek6jBV3PgYqvqhI6U4PgvCrngRAAswp4Rb1NU9d03
 l+qT2sV/4pA/dBGBYWyOim6DFDSwnENlSPEzZbbEQVKA9TKgOcWMfgIe0zgjDmbentkhR+wiB
 F68iqqz6HGOC1IwQz3q+r5z+YM0/uPccnHXQUYKH2bwyb9XqtDVOzt6LxvxGxhV1iLt2JjYWl
 6w/YxqdDtzHe9x1zROqK/1qqeJsJzM60ep8C1z2c/y9rwe12nDnGfjjAzZXn7am8QVnQRUZof
 5WMFlJrIvPhf2v5vEE1Nc9AbjsVvlj9DvYKL/u/dV1P+UIZbqU0pEjhGmm4K1qCgb4XEHzXaC
 8P1f1Pdz92LwSh0Y5nIyvz7IB0xnw6508F8fSKo1aVmp0Sj7An0YSxofRi6lKSXGMliOnt7iQ
 QP9rRiEVnnXsEOE4jMs3VxvNwSNiqeG2pCX6UyLcAw00BV8iyKcrJGdQR4oNQmK5rdbtqT4xE
 0xJRRifZopJiOfYtps3NR8Km+4IH6zffuOYF+8h6fKx44j54lw3pk4BF0SZFcWlbnn2L3JmBa
 Iwq5BTgc/wT93WPDVOorKGy65XMhz0jK6gsF2F3+kTJlPU0yzH5jMjVE6GiIkcv31YG+9vao+
 Qyw05e/kPTRcawZTtGt9VwgvPIuooiGtil6910GToziZ2zcxMw8c2kYd7JPYGWIRu0yDHjhPT
 6HT/LUltOwKEm0MXEimfP+9BzAiQDnFyv/j0MxA5dzrnuIS4BXBRz/Sqmn97YAjY5a2z8bjWt
 5kupXWwYjQcRjnQVtpWF80ck9ZFkiRoyi6Am3fW1Og4fsRveIPkPoz+7RBe3F6o5WymLcSgHo
 oXYwA8zsJ4hx6r6/q
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
Cc: linux-kernel@vger.kernel.org, Oliver O'Halloran <oohall@gmail.com>,
 Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> Here needs a NULL check, as kzalloc may fail returning NULL.
>
> Issue was found by coccinelle.

* Do you really try to ignore (my) specific patch review comments
  (for a moment)?
  https://lore.kernel.org/linuxppc-dev/b7d64d4a-74dd-ee21-db7b-018070f1295=
f@web.de/
  https://lore.kernel.org/patchwork/comment/1414845/
  https://lkml.org/lkml/2020/4/6/279

* Would you like to integrate further adjustments with a varying delay?
  (Are you waiting on nicer feedback by any software maintainers?)

Regards,
Markus
