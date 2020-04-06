Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F0E19F554
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 14:02:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wq0b3T2szDqch
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 22:02:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=web.de
 (client-ip=217.72.192.78; helo=mout.web.de;
 envelope-from=markus.elfring@web.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=web.de header.i=@web.de header.a=rsa-sha256
 header.s=dbaedf251592 header.b=aPF4UsVE; 
 dkim-atps=neutral
Received: from mout.web.de (mout.web.de [217.72.192.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wpyg3XwSzDqjn
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Apr 2020 22:00:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1586174417;
 bh=aT+GoHz8EU0Xuk1glzSyos3tix2HwJQpv2+cwNsQqOw=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=aPF4UsVEzECJrWfA6SrRpyUVTqu9Es1MDaPAB3vDPISacd4myeRN/BA29+KYIyt/v
 yZfOqq8gZkrRrSW0LsyKoLmaHYHpCPun3Mf0CMgacNya+2pmbA7Ln532LZ9pv4oZgc
 32mU5La+ax/MVl2VgtN0Trv1cNDkiFcg1fo9NLg0=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.3] ([2.243.176.200]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MfHk6-1jeics3JsI-00OnR9; Mon, 06
 Apr 2020 14:00:16 +0200
Subject: Re: [PATCH v4] powerpc/powernv: add NULL check after kzalloc in
 opal_add_one_export
To: Qiujun Huang <hqjagain@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200406093944.4174-1-hqjagain@gmail.com>
 <87eet0sy79.fsf@mpe.ellerman.id.au>
 <CAJRQjoeTYg6NnxwvXusU6fdOFOmOiceokYJZQ23-0YQo_yqZ5w@mail.gmail.com>
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <b7d64d4a-74dd-ee21-db7b-018070f1295f@web.de>
Date: Mon, 6 Apr 2020 14:00:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAJRQjoeTYg6NnxwvXusU6fdOFOmOiceokYJZQ23-0YQo_yqZ5w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:MIrbXLldFHhN1dFqtAD7lfwsCiuObMJvbL5nCfgLfRWR81OvnWK
 /gr5hvWcJkcqqsdLuUz5xCq5j46548CRDAFUa6iTMMJ/HgGuWltL6s//zZPIEBW9mEFQjQY
 hKcVNV4JJoLNkNQfHT41jCWCG9BxV4NCWyXPUZwh5IHYWtZllEv48Ceh4K9zOZwnzuqdL76
 Y4ViTMInscENY54zkH5zg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:DDx9Oxc4dOs=:iBu+oIxMSXjXX4lDsS9KdV
 QHyFdaB7LikOgZ8VExTOTbzxH/pS+cbe4Y8OT4moYdfAykwcvY5PsN5oTlXboq2Mcjjx3GZko
 1blpLAWJdX6qbPnqGtOofbAd2yc5mWI3MQsKN0HUOp/SQYyQ6Hv0iUzpl28sqhaGcFXpZ8fk0
 XlNMB7rGrLqS9+2zZ1gZzKH376Xjo+/NGLR9wg2uYgjFiSehm4Hnk/uMQPYpNXoalAq7dg6fa
 TGZzB5k2G+TdbUV/xWiOIidF1wbETIpk8Mj3JGgisqmPb47NQMOdlB1q797e8jZbsK0/Bs1jT
 o6lUke+PeVZVYx0mn8zvqJ3h07ijwOPMvTPlZPE3JU0PKcxDbSA4MsczMaI/cO6exOXtvJMIW
 7T6qRJLQ6Pe6+HyTazh1Nk3YNKILAFXH4ZEVgx+B91XQqyETLmekEJ7PoZ3zrabI+RISkKqAD
 VZkP7d+PkKZGunhr2p64MxeVD3xEatJ1L5gWx5Gws2JAZ2NQJQoITmHbmuMl4EhZRistdjNSR
 SeDm+6JxsjRmModZuy5Y1e9oaewwB9IUYAQn2xpJxMBGjtgIUmLusG6+77Zdp+feHFI7r5GtW
 jeJ9s1GqG2hI6DwK0Lv19jrw7NNqh+lic7whXzfqxIOrsVnkt0KHLqpBEBl0R/4HTRepUsKMv
 pVx/BmmxX4bFdCZVIpPfzc8Iyy4uSOTaYEAReqoBDr5Fha0RrAJJJ1KSRNs3uMTD6QXoPvwDi
 2Qkdnk43grCUEVfoW48RDjOot6FQL+Usopqb7DPYeaKY4+JOxdSNnoXImco5q+2GfdMwn0ell
 7N8awBmC5qiebRXok04jTgdDPhZdV5AvhJPDmOnHf4rnB6RkRZAjjfSFUg2x03ju6RaFS+RR2
 6O2ukrZdM/Z2tC/AGpBWkdJ5SMKwa3C2pvjlBhd7g3QJD1vSF6Y06IEjf4uG0CBmXY0C08c/B
 QMkdZ0I+1vOHdBnqCzY85RIbGSjGQDknYtcYsvengBwpR6sJirgEkfpKc2BNDiQRNPkev2LH+
 bDPTDoLntHDhpE3vHZtr3BuLMv8r/6SzVx7Ro3pEvZiK7YBGLGSowi+176oMdnPm0bC4Prk0C
 M/gXcYgpquWcu8xECuh82aZfdYblY6tLxWjofl/U4MjIMIK2AFMyk6Vki95ycb/vIaIARFjjH
 EojgwJzIiGSZ/2AssbL+O9a00XJWblMXKnTbQCB+UwTE9PoI/yP42Y5S7uBZfcs7cbBKSzmM+
 VOt0ht6QM5iMrDSve
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
Cc: LKML <linux-kernel@vger.kernel.org>, Oliver O'Halloran <oohall@gmail.com>,
 Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

>>> Here needs a NULL check as kzalloc may fail returning NULL.

I find this wording potentially confusing.

* Such function calls will usually succeed to return a pointer.

* The desired memory allocation can fail.

* Please choose an imperative wording for the change description.


>>> Issue was found by coccinelle.

Please omit this line after the addition for the reference to the SmPL scr=
ipt.


>>> Generated by: scripts/coccinelle/null/kmerr.cocci
=E2=80=A6
>>> Reviewed-by: Oliver O'Halloran <oohall@gmail.com>

I wonder about this tag because of requested changes for the shown patch a=
pproach.

I recommend to add the tag =E2=80=9CFixes=E2=80=9D.


>> Thanks for putting up with all the review comments :)

This seems to become challenging here.


>> But I think this should actually be two patches now.
=E2=80=A6

> Get that, I'll separate them.

I wonder why it was not directly tried in this patch version.


>>> v3->v4:

I suggest to apply a shorter version numbering format (without an arrow).

Regards,
Markus
