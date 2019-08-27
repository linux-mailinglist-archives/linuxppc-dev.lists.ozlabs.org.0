Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE249E2E1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 10:40:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Hj434fqdzDqxB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 18:40:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=web.de
 (client-ip=217.72.192.78; helo=mout.web.de;
 envelope-from=markus.elfring@web.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=web.de header.i=@web.de header.b="rOZw5gcz"; 
 dkim-atps=neutral
X-Greylist: delayed 507 seconds by postgrey-1.36 at bilbo;
 Tue, 27 Aug 2019 18:38:23 AEST
Received: from mout.web.de (mout.web.de [217.72.192.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Hj2727j5zDqfy
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2019 18:38:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1566895089;
 bh=EOdG8Jg0bjYCtLktuVJDbrUxViSF+xEWa2XtDYURb5A=;
 h=X-UI-Sender-Class:To:From:Subject:Cc:Date;
 b=rOZw5gczaLyRQ/w4LKnndX1SC8/M+19nRHS3jHKSOBeEr7uFUKtfpoVolqWqS7uNX
 orSR/auLSCut25IX525AiTxyiXn/y3KUtswNImzSryzGbA03s9Mw9ShhjjPaX1zlRe
 p+c5AnS1Mvb7CsTEQWqsO1Gc7mnGICQczmF6RRY8=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.135.143.232]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MLPaA-1i34zd3bAQ-000fCi; Tue, 27
 Aug 2019 10:23:36 +0200
To: linuxppc-dev@lists.ozlabs.org,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Enrico Weigelt <lkml@metux.net>, Kate Stewart
 <kstewart@linuxfoundation.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH 0/2] powerpc/82xx: Adjustments for pq2ads_pci_init_irq()
Openpgp: preference=signencrypt
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 mQINBFg2+xABEADBJW2hoUoFXVFWTeKbqqif8VjszdMkriilx90WB5c0ddWQX14h6w5bT/A8
 +v43YoGpDNyhgA0w9CEhuwfZrE91GocMtjLO67TAc2i2nxMc/FJRDI0OemO4VJ9RwID6ltwt
 mpVJgXGKkNJ1ey+QOXouzlErVvE2fRh+KXXN1Q7fSmTJlAW9XJYHS3BDHb0uRpymRSX3O+E2
 lA87C7R8qAigPDZi6Z7UmwIA83ZMKXQ5stA0lhPyYgQcM7fh7V4ZYhnR0I5/qkUoxKpqaYLp
 YHBczVP+Zx/zHOM0KQphOMbU7X3c1pmMruoe6ti9uZzqZSLsF+NKXFEPBS665tQr66HJvZvY
 GMDlntZFAZ6xQvCC1r3MGoxEC1tuEa24vPCC9RZ9wk2sY5Csbva0WwYv3WKRZZBv8eIhGMxs
 rcpeGShRFyZ/0BYO53wZAPV1pEhGLLxd8eLN/nEWjJE0ejakPC1H/mt5F+yQBJAzz9JzbToU
 5jKLu0SugNI18MspJut8AiA1M44CIWrNHXvWsQ+nnBKHDHHYZu7MoXlOmB32ndsfPthR3GSv
 jN7YD4Ad724H8fhRijmC1+RpuSce7w2JLj5cYj4MlccmNb8YUxsE8brY2WkXQYS8Ivse39MX
 BE66MQN0r5DQ6oqgoJ4gHIVBUv/ZwgcmUNS5gQkNCFA0dWXznQARAQABtCZNYXJrdXMgRWxm
 cmluZyA8TWFya3VzLkVsZnJpbmdAd2ViLmRlPokCVAQTAQgAPhYhBHDP0hzibeXjwQ/ITuU9
 Figxg9azBQJYNvsQAhsjBQkJZgGABQsJCAcCBhUICQoLAgQWAgMBAh4BAheAAAoJEOU9Figx
 g9azcyMP/iVihZkZ4VyH3/wlV3nRiXvSreqg+pGPI3c8J6DjP9zvz7QHN35zWM++1yNek7Ar
 OVXwuKBo18ASlYzZPTFJZwQQdkZSV+atwIzG3US50ZZ4p7VyUuDuQQVVqFlaf6qZOkwHSnk+
 CeGxlDz1POSHY17VbJG2CzPuqMfgBtqIU1dODFLpFq4oIAwEOG6fxRa59qbsTLXxyw+PzRaR
 LIjVOit28raM83Efk07JKow8URb4u1n7k9RGAcnsM5/WMLRbDYjWTx0lJ2WO9zYwPgRykhn2
 sOyJVXk9xVESGTwEPbTtfHM+4x0n0gC6GzfTMvwvZ9G6xoM0S4/+lgbaaa9t5tT/PrsvJiob
 kfqDrPbmSwr2G5mHnSM9M7B+w8odjmQFOwAjfcxoVIHxC4Cl/GAAKsX3KNKTspCHR0Yag78w
 i8duH/eEd4tB8twcqCi3aCgWoIrhjNS0myusmuA89kAWFFW5z26qNCOefovCx8drdMXQfMYv
 g5lRk821ZCNBosfRUvcMXoY6lTwHLIDrEfkJQtjxfdTlWQdwr0mM5ye7vd83AManSQwutgpI
 q+wE8CNY2VN9xAlE7OhcmWXlnAw3MJLW863SXdGlnkA3N+U4BoKQSIToGuXARQ14IMNvfeKX
 NphLPpUUnUNdfxAHu/S3tPTc/E/oePbHo794dnEm57LuuQINBFg2+xABEADZg/T+4o5qj4cw
 nd0G5pFy7ACxk28mSrLuva9tyzqPgRZ2bdPiwNXJUvBg1es2u81urekeUvGvnERB/TKekp25
 4wU3I2lEhIXj5NVdLc6eU5czZQs4YEZbu1U5iqhhZmKhlLrhLlZv2whLOXRlLwi4jAzXIZAu
 76mT813jbczl2dwxFxcT8XRzk9+dwzNTdOg75683uinMgskiiul+dzd6sumdOhRZR7YBT+xC
 wzfykOgBKnzfFscMwKR0iuHNB+VdEnZw80XGZi4N1ku81DHxmo2HG3icg7CwO1ih2jx8ik0r
 riIyMhJrTXgR1hF6kQnX7p2mXe6K0s8tQFK0ZZmYpZuGYYsV05OvU8yqrRVL/GYvy4Xgplm3
 DuMuC7/A9/BfmxZVEPAS1gW6QQ8vSO4zf60zREKoSNYeiv+tURM2KOEj8tCMZN3k3sNASfoG
 fMvTvOjT0yzMbJsI1jwLwy5uA2JVdSLoWzBD8awZ2X/eCU9YDZeGuWmxzIHvkuMj8FfX8cK/
 2m437UA877eqmcgiEy/3B7XeHUipOL83gjfq4ETzVmxVswkVvZvR6j2blQVr+MhCZPq83Ota
 xNB7QptPxJuNRZ49gtT6uQkyGI+2daXqkj/Mot5tKxNKtM1Vbr/3b+AEMA7qLz7QjhgGJcie
 qp4b0gELjY1Oe9dBAXMiDwARAQABiQI8BBgBCAAmFiEEcM/SHOJt5ePBD8hO5T0WKDGD1rMF
 Alg2+xACGwwFCQlmAYAACgkQ5T0WKDGD1rOYSw/+P6fYSZjTJDAl9XNfXRjRRyJSfaw6N1pA
 Ahuu0MIa3djFRuFCrAHUaaFZf5V2iW5xhGnrhDwE1Ksf7tlstSne/G0a+Ef7vhUyeTn6U/0m
 +/BrsCsBUXhqeNuraGUtaleatQijXfuemUwgB+mE3B0SobE601XLo6MYIhPh8MG32MKO5kOY
 hB5jzyor7WoN3ETVNQoGgMzPVWIRElwpcXr+yGoTLAOpG7nkAUBBj9n9TPpSdt/npfok9ZfL
 /Q+ranrxb2Cy4tvOPxeVfR58XveX85ICrW9VHPVq9sJf/a24bMm6+qEg1V/G7u/AM3fM8U2m
 tdrTqOrfxklZ7beppGKzC1/WLrcr072vrdiN0icyOHQlfWmaPv0pUnW3AwtiMYngT96BevfA
 qlwaymjPTvH+cTXScnbydfOQW8220JQwykUe+sHRZfAF5TS2YCkQvsyf7vIpSqo/ttDk4+xc
 Z/wsLiWTgKlih2QYULvW61XU+mWsK8+ZlYUrRMpkauN4CJ5yTpvp+Orcz5KixHQmc5tbkLWf
 x0n1QFc1xxJhbzN+r9djSGGN/5IBDfUqSANC8cWzHpWaHmSuU3JSAMB/N+yQjIad2ztTckZY
 pwT6oxng29LzZspTYUEzMz3wK2jQHw+U66qBFk8whA7B2uAU1QdGyPgahLYSOa4XAEGb6wbI FEE=
Message-ID: <6dc7d70e-8a40-46ab-897b-d2eaf9a87d77@web.de>
Date: Tue, 27 Aug 2019 10:23:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:FWPP7FnuP0R0YkBDMtPwXcV+dkmywBeiHniH8l8wNxIKIYzA2VH
 mGaZbaqheDKQWXTxTf0APXFrL/TOvCW8LtjeGIkoGh7Zd3rMCSaxC4N51eBKxDAjml7aRMw
 4M+YOa3AISg6vixPub+WGvxOxAKc40HgJsa3aiqOgMRuaYHaKZzDnJlYk+CwWrEonowb5Ga
 StBBa1O9YSLzYjPfZ9laQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:lzlrIrp1nwQ=:foDzK0ZiIv/bmArRWd49OE
 eOwpNyvrX6Zdiy2rgHoJR6gHhAbpImclY5OnrJUnWWB9JGm2WiAH7EhzXNxC7jkqSe81HXAHl
 wnTjiQHxkId/39LGUELSuhyhy9wh5TUGg+am1QdXPAGvgBno8ON591fHB8FHmIf3MFtAjkCFS
 AllpPbKbDZaE3SmNfg/zdt/+bd/aac1JPEmFkDJMaeizwJHfF2S0tcPRPFr2RmYcHs+4ViPKa
 EkHJAvKEX6v2t24GI/wLsKbLmqFw3A5/5ZfWQonwZt9HrUU/LG96RRYcbYXfiZrQaRlb/5n98
 bJzgm4Nm2Lvhv77VKpcK7gXeEKGRaY9Eiu8hO+XbwEHBmwuIVZLWf8KMm02zZxQ2QRAA66OmI
 xhS2awzc2u0g6Vp685Q+OFu3yQzghpuJfn2BBJJr8zjKgjJmrBvBkXJ18ZIwfA7s4kUO1Lpoz
 H0ZahnNAelLvunQnKZ4VMisOiT0E4i/OmUdIyF1aQKBFC8YwvCmDrE456XeKwhLVSNJUZj8XT
 QSOsnZRq6HJj3axb7BclMTArm9PMVLYexGv8AqhiN+hWOGOOqj2Sjf+bAYPmhUWIgkcjZCWDQ
 c83LyWLjdmDYdM3ucpAd28BD8DeGwwPrjp8uJU83VWVVXe/eeB7wcj/+oV5PzVCS7RchUOI8l
 Q3BhtqAFo0yh/h2HnVfSVi5z+vpxCnbXHgjXD0m9P+irJ2rj7OE3HB5882+M1ga+FAX6QoLn4
 RRksmj9VhGCpiHkFOgLsHCA57n4ArG+nu516K5nntrZpX2FfTLw6TE+vhh9QFwQwq6unmGwUG
 lhX3xrLD0lLSxRMcdjy7qClJcpiGq/IBL3RJnQRBr/zebHrfL7dHQiB/GyFWSdxnNEUNtYJw2
 aDE+uQHJzIAdUR5RoOpMG86cpHwpC6qv7XBDy1/in5xSfe6XKG6LMViZ1Qu6r5wBrAYHE3d7g
 Gxedw2LbO5aPF0V5TuO3Z/QP3bT3gS/aSCtrgs1ehIoeyxQkcd2kAdgWOuy7lTy1xw+7wAD+B
 Jw7NRm5Vi+ttE97J8MC6P+HaDfwVyzo/FpHlDeTIjU5MmbG73DJ59T18tdltq4dFhqBCIOcDY
 wv/Cqeu/A5NPBE+VLJnKE5SeiJMDt/e5sofmJ1DjbZQoXerGaPhmZ9eIWqFO9Xqqc3mOxSpog
 MMTmA=
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
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 27 Aug 2019 10:16:32 +0200

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Delete an unnecessary of_node_put() call
  Use common error handling code

 arch/powerpc/platforms/82xx/pq2ads-pci-pic.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

=2D-
2.23.0

